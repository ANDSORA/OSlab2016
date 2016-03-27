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

void init_segment();
void init_user_seg_mem();
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

void INIT_WORK(){
	init_segment();
	init_user_seg_mem();
	init_vmem_addr();
	init_serial();
	init_i8259();
	init_idt();
	init_timer();
	init_vmem();
	add_irq_handle(0, timer_event);
	add_irq_handle(1, keyboard_event);
}

void TEST_WORK(){
	serial_output_test();
	printk_test();
}

PCB PCB1;

uint32_t get_timer_handle();

int main(void) {

	INIT_WORK(); //while(1);
	TEST_WORK();

	printk("timer_event = 0x%x\n", (uint32_t)timer_event);
	get_timer_handle();
	//printk("and the address we set for it is: 0x%x\n\n", get_timer_handle());
	//sti();

	printk("Here is main()\n");

	struct Elf *elf;
	struct Proghdr *ph, *eph;
	unsigned char *pa, *i;

	//elf = (struct Elf*)0x1f00000;
	uint8_t buf[4096];
	elf = (struct Elf*)buf;
	printk("addr of buf: 0x%x\n", (uint32_t)buf);

	readseg((unsigned char*)elf, 4096, GAME_OFFSET_IN_DISK);

	uint32_t seg_addr = user_seg_malloc(&PCB1, elf->e_entry);
	//uint32_t seg_addr = 0;
	get_timer_handle();

	ph = (struct Proghdr*)((char *)elf + elf->e_phoff);
	eph = ph + elf->e_phnum;
	for(; ph < eph; ph ++) {
		pa = (unsigned char*)ph->p_pa;
		printk("0x%x, 0x%x, 0x%x\n", pa, ph->p_filesz, ph->p_memsz);
		readseg(seg_addr + pa, ph->p_filesz, GAME_OFFSET_IN_DISK + ph->p_offset);
		for(i = seg_addr + pa + ph->p_filesz; i < pa + ph->p_memsz; *i ++ = 0);
	}

	get_timer_handle();

	printk("here we would go!\n");

	asm volatile("movl %0, %%esp": :"a"(PCB1.kstack));
	asm volatile("popal");
	asm volatile("pushl %eax");
	asm volatile("movw 4(%esp), %ax");
	asm volatile("movw %ax, %gs");
	asm volatile("movw %ax, %fs");
	asm volatile("movw %ax, %es");
	asm volatile("movw %ax, %ds");
	asm volatile("popl %eax");
	asm volatile("addl $24, %esp");
	asm volatile("iret");

	//sti(); hlt(); cli(); while(1);

	//((void(*)(void))elf->e_entry)(); /* Here we go! */

	while(1);

	panic("YOU shouldn't get here!\n");
	return 0;
}


void waitdisk(void) {
	while((inb(0x1f7) & 0xc0) != 0x40);
}

void readsect(void *dst, int offset) {
	/* int i; */
	waitdisk();

	outb(0x1f2, 1);		// count = 1
	outb(0x1f3, offset);
	outb(0x1f4, offset >> 8);
	outb(0x1f5, offset >> 16);
	outb(0x1f6, (offset >> 24) | 0xe0);
	outb(0x1f7, 0x20);	// cmd 0x20 - read sectors

	waitdisk();

	insl(0x1f0, dst, SECTSIZE/4);	//read a sector
	/*	this part does the same thing
	for(i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = in_long(0x1f0);
	} */
}

void readseg(unsigned char *pa, int count, int offset) {
	unsigned char *epa;
	epa = pa + count;
	pa -= offset % SECTSIZE;
	offset = (offset / SECTSIZE) + 1;
	for(; pa < epa; pa += SECTSIZE, offset ++)
		readsect(pa, offset);
}
