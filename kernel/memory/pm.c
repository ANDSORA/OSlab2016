#include "common.h"
#include "string.h"
#include "memory.h"
#include "mmu.h"
#include "x86.h"
#include "elf.h"

#define NR_PCB 16
#define SCR_KSTACK 4096

#define SECTSIZE 512
#define GAME_OFFSET_IN_DISK (10 * 1024 * 1024)

typedef struct PCB {
	int PID;
	//int head_page_idx;
	CR3 ucr3;
	PDE updir[NR_PDE] align_to_page;
	PTE uptable[3][NR_PTE] align_to_page;
	uint8_t kstack[4096];
} PCB;

bool pcb_present[NR_PCB];
static PCB pcb[NR_PCB];

uint32_t create_process(uint32_t);
PDE* get_kpdir();
void mm_malloc(int,uint32_t,int);
void readseg(unsigned char*,int,int);

void init_pcb(void) {
	int i;
	for(i=0; i<NR_PCB; ++i) {
		pcb[i].PID = i;

		/* initialize the ucr3 */
		pcb[i].ucr3.val = 0;
		pcb[i].ucr3.page_directory_base = va_to_pa(pcb[i].updir) >> 12;

		/* initialize the uPDE */
		PDE *kpdir = get_kpdir();
		memset(pcb[i].updir, 0, NR_PDE * sizeof(PDE));
		memcpy(&pcb[i].updir[KOFFSET / PTSIZE], &kpdir[KOFFSET / PTSIZE], (PHY_MEM / PTSIZE) * sizeof(PDE));

		/* initialize the uPTE */
		memset(pcb[i].uptable, 0, 3 * NR_PTE * sizeof(PTE));
	}
	memset(pcb_present, 0, sizeof(pcb_present));
}

int get_pcb() {
	int i;
	for(i=0; i<NR_PCB; ++i) if(!pcb_present[i]) {
		pcb_present[i] = true;
		return i;
	}
	return -1;
}

void free_pcb(int i) {
	assert(i>=0 && i<NR_PCB);
	pcb_present[i] = false;
}

uint32_t page_trans(int, uint32_t);

uint32_t create_process(uint32_t disk_offset) {
	int pcb_idx = get_pcb();
	if(pcb_idx < 0) panic("No more available pcb!\n");
	
	/* get the ELF header */
	struct Elf *elf;
	struct Proghdr *ph, *eph;
	uint32_t va;

	uint8_t buf[4096];
	elf = (struct Elf*)buf;
	printk("addr of buf: 0x%x\n", (uint32_t)buf);

	readseg((unsigned char*)elf, 4096, GAME_OFFSET_IN_DISK);

	ph = (struct Proghdr*)((char *)elf + elf->e_phoff);
	eph = ph + elf->e_phnum;
	for(; ph < eph; ph ++) {
		if(ph->p_type != ELF_PROG_LOAD) continue;
		va = ph->p_va;
		int pde_num = PDX(va + ph->p_memsz - 1) - PDX(va) + 1;
		printk("0x%x, 0x%x, 0x%x\n", va, ph->p_filesz, ph->p_memsz);

		mm_malloc(pcb_idx, PDX(va), pde_num); //fill the pde and pte

		int i;
		for(i=0; i<pde_num; ++i) {
			uint32_t pdx = PDX(va) + i;
			if(PDX(va + ph->p_filesz - 1) >= pdx) {
				//readseg
				uint32_t start_va = pdx << PDXSHIFT;
				uint32_t end_va = (pdx + 1) << PDXSHIFT;
				if(va > start_va) start_va = va;
				if(va + ph->p_filesz < end_va) end_va = va + ph->p_filesz;
				readseg((void*)page_trans(pcb_idx, start_va), end_va - start_va, GAME_OFFSET_IN_DISK + ph->p_offset + start_va - va);
			}
			if(PDX(va + ph->p_filesz) <= pdx) {
				//memset
				uint32_t start_va = pdx << PDXSHIFT;
				uint32_t end_va = (pdx + 1) << PDXSHIFT;
				if(va + ph->p_filesz > start_va) start_va = va + ph->p_filesz;
				if(va + ph->p_memsz < end_va) end_va = va + ph->p_memsz;
				memset((void*)page_trans(pcb_idx, start_va), 0, end_va - start_va);
			}
		}
		//readseg(pa, ph->p_filesz, GAME_OFFSET_IN_DISK + ph->p_offset);
		//for(i = pa + ph->p_filesz; i < pa + ph->p_memsz; *i ++ = 0);
	}

	return elf->e_entry;
}

void mm_malloc(int pcb_idx, uint32_t pde_idx, int pde_num) {
	Assert(pde_num <= 2, "Why so many pde? pde_num = %d\n", pde_num);
	int i,j;
	PCB *pcb_p = &pcb[pcb_idx];
	for(i = 0; i < pde_num; ++ i) {
		uint32_t physbase = get_pte();
		PDE *updir_p = &pcb_p->updir[pde_idx + i];
		PTE *uptable_p = pcb_p->uptable[i];

		updir_p->val = va_to_pa(uptable_p) | PTE_P | PTE_W | PTE_U;
		for(j = 0; j < NR_PTE; ++ j) {
			uptable_p->val = physbase | PTE_P | PTE_W | PTE_U;
			uptable_p ++; physbase += PGSIZE;
		}
	}
}

uint32_t page_trans(int pcb_idx, uint32_t va) {
	PDE *updir_p = &pcb[pcb_idx].updir[PDX(va)];
	PTE *uptable_p = (PTE*) ((updir_p->page_frame << PGSHIFT) + 4 * PTX(va));
	return (uptable_p->page_frame << PGSHIFT) + PGOFF(va);
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
