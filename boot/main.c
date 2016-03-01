//#include <lib/x86.h>
//#include <lib/elf.h>
#include "boot.h"

#define SECTSIZE 512

int main(void)
{
	struct ELFHeader *elf;
	struct ProgramHeader *ph, *eph;
	unsigned char *pa, *i;

	elf = (struct ELFHeader*)0x8000;

	readseg((unsigned char*)elf, 4096, 0);

	ph = (struct ProgramHeader*)((char *)elf + elf->phoff);
	eph = ph + elf->phnum;
	for(; ph < eph; ph ++) {
		pa = (unsigned char*)ph->paddr;
		readseg(pa, ph->filesz, ph->off);
		for(i = pa + ph->filesz; i < pa + ph->memsz; *i ++ = 0);
	}

	((void(*)(void))elf->entry)(); /* Here we go! */
}




void waitdisk(void) {
	while((in_byte(0x1f7) & 0xc0) != 0x40);
}

void readsect(void *dst, int offset) {
	int i;
	waitdisk();
	out_byte(0x1f2, 1);
	out_byte(0x1f3, offset);
	out_byte(0x1f4, offset >> 8);
	out_byte(0x1f5, offset >> 16);
	out_byte(0x1f6, (offset >> 24) | 0xe0);
	out_byte(0x1f7, 0x20);

	waitdisk();
	for(i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = in_long(0x1f0);
	}
}

void readseg(unsigned char *pa, int count, int offset) {
	unsigned char *epa;
	epa = pa + count;
	pa -= offset % SECTSIZE;
	offset = (offset / SECTSIZE) + 1;
	for(; pa < epa; pa += SECTSIZE, offset ++)
		readsect(pa, offset);
}
