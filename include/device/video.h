#ifndef __VIDEO_H__
#define __VIDEO_H__

#include <include/types.h>

#define SCR_WIDTH	800
#define SCR_HEIGHT	600
#define SCR_DEPTH	3
#define SCR_SIZE	((SCR_WIDTH) * (SCR_HEIGHT) * (SCR_DEPTH))
#define VMEM_ADDR	0xFC000000

extern uint8_t *vmem;

/*
static inline void
draw_pixel(int x, int y, int color) {
	//assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
	//vmem[(x << 8) + (x << 6) + y] = color;
} */

#endif
