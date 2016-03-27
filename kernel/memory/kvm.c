#include "common.h"
#include "mmu.h"
#include "x86.h"
#include "string.h"
#include "memory.h"

/* One TSS will be enough for all processes in ring 3. It will be used in Lab3. */
static TSS tss; 


inline static void
set_tss(Segdesc *ptr) {
	//tss.esp0 = KERNEL_SIZE;
	//tss.ss0 = SELECTOR_KERNEL(SEG_KERNEL_DATA);		// only one ring 0 stack segment

	uint32_t base = (uint32_t)&tss;
	uint32_t limit = sizeof(TSS) - 1;
	ptr->sd_lim_15_0  = limit & 0xffff;
	ptr->sd_base_15_0   = base & 0xffff;
	ptr->sd_base_23_16  = (base >> 16) & 0xff;
	ptr->sd_type = STS_T32A;
	ptr->sd_s = 0;
	ptr->sd_dpl = DPL_USER;
	ptr->sd_p = 1;
	ptr->sd_lim_19_16 = limit >> 16;
	ptr->sd_avl = 0;
	ptr->sd_rsv1 = 0;
	ptr->sd_db = 1;
	ptr->sd_g = 0;
	ptr->sd_base_31_24  = base >> 24;
}



/* GDT in the kernel's memory, whose virtual memory is greater than 0xC0000000. */
static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t base, uint32_t limit, uint32_t pl, uint32_t type) {
	ptr->sd_lim_15_0  = limit & 0xFFFF;
	ptr->sd_base_15_0   = base & 0xFFFF;
	ptr->sd_base_23_16  = (base >> 16) & 0xFF;
	ptr->sd_type = type;
	ptr->sd_s = 1;
	ptr->sd_dpl = pl;
	ptr->sd_p = 1;
	ptr->sd_lim_19_16 = (limit >> 16) & 0xF;
	ptr->sd_avl = 0;
	ptr->sd_rsv1 = 0;
	ptr->sd_db = 1;
	ptr->sd_g = 1;
	ptr->sd_base_31_24  = (base >> 24) & 0xFF;
}


static inline void
write_gdtr(void *addr, uint32_t size) {
	static volatile uint16_t data[3];
	data[0] = size - 1;
	data[1] = (uint32_t)addr;
	data[2] = ((uint32_t)addr) >> 16;
	lgdt((void*)data);
}

void
init_segment(void) {
	memset(gdt, 0, sizeof(gdt));
	set_segment(&gdt[SEG_KERNEL_CODE], 0, (KERNEL_SIZE - 1) >> 12, DPL_KERNEL, STA_X | STA_R);
	set_segment(&gdt[SEG_KERNEL_DATA], 0, (KERNEL_SIZE - 1) >> 12, DPL_KERNEL, STA_W );

	write_gdtr(gdt, sizeof(gdt));

	set_tss(&gdt[SEG_TSS]);
	//set_tss_ss0(SELECTOR_KERNEL(SEG_KERNEL_DATA));
	ltr( SELECTOR_USER(SEG_TSS) );
}

int get_segment() {
	int i;
	for(i=1; i<NR_SEGMENTS; ++i) if(!gdt[i].sd_p)
		return i;
	return -1;
}

uint32_t get_seg_base(uint16_t sel) {
	int seg_idx = (sel >> 3) & 0x1fff;
	return gdt[seg_idx].sd_base_15_0 + (gdt[seg_idx].sd_base_23_16 << 16) + (gdt[seg_idx].sd_base_31_24 << 24);
}

uint32_t user_seg_malloc(PCB *pcb, uint32_t entry) {
	int seg_mem_idx = get_user_seg_mem();
	assert(seg_mem_idx >= 0 && seg_mem_idx < NR_USER_SEG_MEM);
	fill_user_seg_mem(seg_mem_idx);
	uint32_t seg_addr = KERNEL_SIZE + seg_mem_idx * USER_SIZE;

	int code_idx = get_segment(); assert(code_idx != -1);
	set_segment(&gdt[code_idx], seg_addr, (USER_SIZE - 1) >> 12, DPL_USER, STA_X | STA_R);
	int data_idx = get_segment(); assert(data_idx != -1);
	set_segment(&gdt[data_idx], seg_addr, (USER_SIZE - 1) >> 12, DPL_USER, STA_W);

	tss.ss0 = SELECTOR_KERNEL(SEG_KERNEL_DATA);
	tss.esp0 = ((uint32_t) pcb->kstack) + KSTACK_SIZE;
	printk("\nsizeof TrapFrameA is: 0x%x\n", sizeof(TrapFrameA));
	printk("ss0 = 0x%x,  esp0 = 0x%x\n\n", tss.ss0, tss.esp0);

	TrapFrameA *tf = (TrapFrameA*)pcb->kstack;
	tf->ebp = 0;
	tf->eax = 1;
	tf->ebx = 2;
	tf->ecx = 3;
	tf->edx = 4;
	tf->gs = SELECTOR_USER(data_idx);
	tf->fs = SELECTOR_USER(data_idx);
	tf->es = SELECTOR_USER(data_idx);
	tf->ds = SELECTOR_USER(data_idx);
	tf->irq = 0;
	tf->err = 0;
	tf->eip = entry;
	tf->cs = SELECTOR_USER(code_idx);
	tf->eflags = 0x2 | FL_IF;
	tf->esp = USER_SIZE - 4;
	tf->ss = SELECTOR_USER(data_idx);
	
	printk("The TrapFrame we create:\n");
	printk("%x\t%x\t%x\t%x\n", tf->edi, tf->esi, tf->ebp, tf->esp_);
	printk("%x\t%x\t%x\t%x\n", tf->ebx, tf->edx, tf->ecx, tf->eax);
	printk("%x\t%x\t%x\t%x\n", tf->gs, tf->fs, tf->es, tf->ds);
	printk("irq = %d,  err = %d\n", tf->irq, tf->err);
	printk("eip = 0x%x,  cs = 0x%x\n", tf->eip, tf->cs);
	printk("eflags = 0x%x\n", tf->eflags);
	printk("esp = 0x%x,  ss = 0x%x\n", tf->esp, tf->ss);


	return seg_addr;
}
