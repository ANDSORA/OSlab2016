#ifndef __MEMORY_H__
#define __MEMORY_H__

#define MAXMEM			0x8000000
#define KERNEL_SIZE		0x2000000
#define USER_SIZE		0x800000

#define NR_USER_SEG_MEM	12

#define KSTACK_SIZE		4096

typedef struct PCB {
	void *tfa;
	uint8_t kstack[KSTACK_SIZE];
} PCB;

void init_user_seg_mem();
int get_user_seg_mem();
void fill_user_seg_mem(int);
void clear_user_seg_mem(int);

uint32_t get_seg_base(uint16_t);

uint32_t user_seg_malloc(PCB*,uint32_t);

#endif
