#include "common.h"
#include "memory.h"
#include "string.h"

static bool user_seg_mem[NR_USER_SEG_MEM];

void init_user_seg_mem() {
	memset(user_seg_mem, 0, sizeof(user_seg_mem));
}

int get_user_seg_mem() {
	int i;
	for(i=0; i<NR_USER_SEG_MEM; ++i) if(!user_seg_mem[i])
		return i;
	return -1;
}

void fill_user_seg_mem(int i) {
	assert(i >= 0 && i < NR_USER_SEG_MEM);
	assert(!user_seg_mem[i]);
	user_seg_mem[i] = true;
}

void clear_user_seg_mem(int i) {
	assert(i >= 0 && i < NR_USER_SEG_MEM);
	user_seg_mem[i] = false;
}
