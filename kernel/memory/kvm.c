#include "common.h"
#include "mmu.h"
#include "x86.h"
#include "string.h"
#include "memory.h"

/* One TSS will be enough for all processes in ring 3. It will be used in Lab3. */
static TSS tss; 


inline static void
set_tss(Segdesc *ptr) {
	tss.esp0 = KERNEL_SIZE;
	tss.ss0 = SELECTOR_KERNEL(SEG_KERNEL_DATA);		// only one ring 0 stack segment

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

bool write_user_segment(int seg_mem_idx) {
	int code_idx = get_segment(); if(code_idx == -1) return false;
	set_segment(&gdt[code_idx], KERNEL_SIZE + seg_mem_idx * USER_SIZE, (USER_SIZE - 1) >> 12, DPL_USER, STA_X | STA_R);
	int data_idx = get_segment(); if(data_idx == -1) return false;
	set_segment(&gdt[data_idx], KERNEL_SIZE + seg_mem_idx * USER_SIZE, (USER_SIZE - 1) >> 12, DPL_USER, STA_W);
	return true;
}
