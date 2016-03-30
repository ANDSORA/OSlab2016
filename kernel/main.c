#include "common.h"
#include "device/video.h"
#include "device/video_mode.h"
#include "x86.h"
#include "elf.h"
#include "string.h"
#include "memory.h"

#define SECTSIZE 512
#define GAME_OFFSET_IN_DISK (10 * 1024 * 1024)
void readseg(unsigned char*,int,int);

void init_page();
void init_segment();
void init_vmem_addr();
void init_serial();
void init_i8259();
void init_idt();
void init_timer();
void add_irq_handle(int,void (*)(void));
void timer_event();
void keyboard_event();

void printk_test();
void serial_output_test();

int main(void);
void init() {
	init_page(); //while(1);
	asm volatile("addl %0, %%esp" : : "i"(KOFFSET));
	asm volatile("jmp *%0" : : "r"(main));
	panic("You died in init()\n");
}

void INIT_WORK(){
	init_segment();
	init_pcb();
	init_pte_info();
	init_vmem_addr();
	init_serial(); printk("vmem == 0x%x\n", vmem);
	init_i8259();
	init_idt();
	init_timer();
	init_vmem(); //while(1);
	add_irq_handle(0, timer_event);
	add_irq_handle(1, keyboard_event);
}

void TEST_WORK(){
	serial_output_test();
	printk_test();
}

uint32_t create_process(uint32_t disk_offset);

int main(void) {

	INIT_WORK();
	TEST_WORK();

	printk("Here is main()\n"); //while(1);

	//sti(); hlt(); cli(); while(1);

	/*
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	unsigned char *pa, *i;

	//elf = (struct Elf*)0x1f00000;
	uint8_t buf[4096];
	elf = (struct Elf*)buf;
	printk("addr of buf: 0x%x\n", (uint32_t)buf);

	readseg((unsigned char*)elf, 4096, GAME_OFFSET_IN_DISK);

	ph = (struct Proghdr*)((char *)elf + elf->e_phoff);
	eph = ph + elf->e_phnum;
	for(; ph < eph; ph ++) {
		pa = (unsigned char*)ph->p_pa;
		printk("0x%x, 0x%x, 0x%x\n", pa, ph->p_filesz, ph->p_memsz);
		readseg(pa, ph->p_filesz, GAME_OFFSET_IN_DISK + ph->p_offset);
		for(i = pa + ph->p_filesz; i < pa + ph->p_memsz; *i ++ = 0);
	}
	*/
	uint32_t entry = create_process(GAME_OFFSET_IN_DISK);

	printk("(kernel_main) I would modify the esp\n");
	asm volatile("movl %0, %%esp" : : "i"(KOFFSET));
	//asm volatile("movl $0, %ebp");
	asm volatile("subl $0x10, %esp");
	printk("(kernel_main) esp modified!\n");
	//while(1);

	printk("here we would go!\n");

	//while(1);

	//sti(); hlt(); cli(); while(1);

	((void(*)(void))entry)(); /* Here we go! */

	panic("YOU shouldn't get here!\n");

	while(1);
}

/*
void waitdisk(void) {
	while((inb(0x1f7) & 0xc0) != 0x40);
}

void readsect(void *dst, int offset) {
	* int i; *
	waitdisk();

	outb(0x1f2, 1);		// count = 1
	outb(0x1f3, offset);
	outb(0x1f4, offset >> 8);
	outb(0x1f5, offset >> 16);
	outb(0x1f6, (offset >> 24) | 0xe0);
	outb(0x1f7, 0x20);	// cmd 0x20 - read sectors

	waitdisk();

	insl(0x1f0, dst, SECTSIZE/4);	//read a sector
	*	this part does the same thing
	for(i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = in_long(0x1f0);
	} *
}

void readseg(unsigned char *pa, int count, int offset) {
	unsigned char *epa;
	epa = pa + count;
	pa -= offset % SECTSIZE;
	offset = (offset / SECTSIZE) + 1;
	for(; pa < epa; pa += SECTSIZE, offset ++)
		readsect(pa, offset);
}
*/
