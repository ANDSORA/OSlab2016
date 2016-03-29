#include "common.h"
#include "mmu.h"
#include "x86.h"
#include "memory.h"
#include "string.h"

static PDE kpdir[NR_PDE] align_to_page;
static PTE kptable[PHY_MEM / PGSIZE] align_to_page;

PDE* get_kpdir() { return kpdir; }

/* set up page tables for kernel */
void init_page(void) {
	CR0 cr0;
	CR3 cr3;
	PDE *pdir = (PDE *)va_to_pa(kpdir);
	PTE *ptable = (PTE *)va_to_pa(kptable);
	uint32_t pdir_idx;

	//if((uint32_t)pdir == (uint32_t)kpdir) while(1);

	/* make all PDEs invalid */
	memset(pdir, 0, NR_PDE * sizeof(PDE));

	/* fill PDEs */
	for(pdir_idx = 0; pdir_idx < PHY_MEM / PTSIZE; pdir_idx ++) {
		pdir[pdir_idx].val = PTE_ADDR(ptable) | PTE_P | PTE_W | PTE_U;
		pdir[pdir_idx + KOFFSET / PTSIZE].val = PTE_ADDR(ptable) | PTE_P | PTE_W | PTE_U;
		ptable += NR_PTE;
	}

	/* fill PTEs */

	asm volatile ("std;\
			1: stosl;\
			   subl %0, %%eax;\
			   jge 1b" : :
			   "i"(PGSIZE), "a"((PHY_MEM - PGSIZE) | PTE_P | PTE_W | PTE_U), "D"(ptable - 1));

	/* make CR3 to be the entry of page directory */
	cr3.val = 0;
	cr3.page_directory_base = ((uint32_t)pdir) >> 12;
	lcr3(cr3.val);

	//while(1);
	/* set PG bit in CR0 to enable paging */
	cr0.val = rcr0();
	cr0.paging = 1;
	lcr0(cr0.val);

	//while(1);
}

static Segdesc gdt[NR_SEGMENTS];

static void
set_segment(Segdesc *ptr, uint32_t pl, uint32_t type) {
	ptr->sd_lim_15_0  = 0xFFFF;
	ptr->sd_base_15_0   = 0x0;
	ptr->sd_base_23_16  = 0x0;
	ptr->sd_type = type;
	ptr->sd_s = 1;
	ptr->sd_dpl = pl;
	ptr->sd_p = 1;
	ptr->sd_lim_19_16 = 0xF;
	ptr->sd_avl = 0;
	ptr->sd_rsv1 = 0;
	ptr->sd_db = 1;
	ptr->sd_g = 1;
	ptr->sd_base_31_24  = 0x0;
}


static void write_gdtr(void *addr, uint32_t size) {
	static volatile uint16_t data[3];
	data[0] = size - 1;
	data[1] = (uint32_t)addr;
	data[2] = ((uint32_t)addr) >> 16;
	lgdt((void*)data);
}

void
init_segment(void) {
	memset(gdt, 0, sizeof(gdt));
	set_segment(&gdt[SEG_KERNEL_CODE], DPL_KERNEL, STA_X | STA_R);
	set_segment(&gdt[SEG_KERNEL_DATA], DPL_KERNEL, STA_W);

	write_gdtr(gdt, sizeof(gdt));
}
