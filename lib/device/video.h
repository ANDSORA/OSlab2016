#ifndef __VIDEO_H__
#define __VIDEO_H__

#include <lib/types.h>

#define SCR_WIDTH	320
#define SCR_HEIGHT	200
#define SCR_SIZE	((SCR_WIDTH) * (SCR_HEIGHT))
#define VMEM_ADDR	0xA0000

extern uint8_t *vmem;

static inline void
draw_pixel(int x, int y, int color) {
	//assert(x >= 0 && y >= 0 && x < SCR_HEIGHT && y < SCR_WIDTH);
	vmem[(x << 8) + (x << 6) + y] = color;
}

#endif
