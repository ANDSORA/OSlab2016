#include "lib/x86.h"
#include "lib/types.h"

/* some ports */
#define VGA_DAC_READ_INDEX 0x3C7
#define VGA_DAC_WRITE_INDEX 0x3C8
#define VGA_DAC_DATA 0x3C9

/* This is the number of entries in the palette. You may change this value to fit your palette. */
#define NR_PALETTE_ENTRY 256

/* This is an example. Change it to your palette if you like. */
static uint8_t palette[NR_PALETTE_ENTRY * 4] = {
  0x00, 0x00, 0x00, 0x00,
  0x00, 0x00, 0x80, 0x00,
  0x00, 0x80, 0x00, 0x00,
  0x00, 0x80, 0x80, 0x00,
  0x80, 0x00, 0x00, 0x00,
  0x80, 0x00, 0x80, 0x00,
  0x80, 0x80, 0x00, 0x00,
  0x80, 0x80, 0x80, 0x00,
  0xc0, 0xdc, 0xc0, 0x00,
  0xf0, 0xca, 0xa6, 0x00,
  0xaa, 0x3f, 0x2a, 0x00,
  0xff, 0x3f, 0x2a, 0x00,
  0x00, 0x5f, 0x2a, 0x00,
  0x55, 0x5f, 0x2a, 0x00,
  0xaa, 0x5f, 0x2a, 0x00,
  0xff, 0x5f, 0x2a, 0x00,
  0x00, 0x7f, 0x2a, 0x00,
  0x55, 0x7f, 0x2a, 0x00,
  0xaa, 0x7f, 0x2a, 0x00,
  0xff, 0x7f, 0x2a, 0x00,
  0x00, 0x9f, 0x2a, 0x00,
  0x55, 0x9f, 0x2a, 0x00,
  0xaa, 0x9f, 0x2a, 0x00,
  0xff, 0x9f, 0x2a, 0x00,
  0x00, 0xbf, 0x2a, 0x00,
  0x55, 0xbf, 0x2a, 0x00,
  0xaa, 0xbf, 0x2a, 0x00,
  0xff, 0xbf, 0x2a, 0x00,
  0x00, 0xdf, 0x2a, 0x00,
  0x55, 0xdf, 0x2a, 0x00,
  0xaa, 0xdf, 0x2a, 0x00,
  0xff, 0xdf, 0x2a, 0x00,
  0x00, 0xff, 0x2a, 0x00,
  0x55, 0xff, 0x2a, 0x00,
  0xaa, 0xff, 0x2a, 0x00,
  0xff, 0xff, 0x2a, 0x00,
  0x00, 0x00, 0x55, 0x00,
  0x55, 0x00, 0x55, 0x00,
  0xaa, 0x00, 0x55, 0x00,
  0xff, 0x00, 0x55, 0x00,
  0x00, 0x1f, 0x55, 0x00,
  0x55, 0x1f, 0x55, 0x00,
  0xaa, 0x1f, 0x55, 0x00,
  0xff, 0x1f, 0x55, 0x00,
  0x00, 0x3f, 0x55, 0x00,
  0x55, 0x3f, 0x55, 0x00,
  0xaa, 0x3f, 0x55, 0x00,
  0xff, 0x3f, 0x55, 0x00,
  0x00, 0x5f, 0x55, 0x00,
  0x55, 0x5f, 0x55, 0x00,
  0xaa, 0x5f, 0x55, 0x00,
  0xff, 0x5f, 0x55, 0x00,
  0x00, 0x7f, 0x55, 0x00,
  0x55, 0x7f, 0x55, 0x00,
  0xaa, 0x7f, 0x55, 0x00,
  0xff, 0x7f, 0x55, 0x00,
  0x00, 0x9f, 0x55, 0x00,
  0x55, 0x9f, 0x55, 0x00,
  0xaa, 0x9f, 0x55, 0x00,
  0xff, 0x9f, 0x55, 0x00,
  0x00, 0xbf, 0x55, 0x00,
  0x55, 0xbf, 0x55, 0x00,
  0xaa, 0xbf, 0x55, 0x00,
  0xff, 0xbf, 0x55, 0x00,
  0x00, 0xdf, 0x55, 0x00,
  0x55, 0xdf, 0x55, 0x00,
  0xaa, 0xdf, 0x55, 0x00,
  0xff, 0xdf, 0x55, 0x00,
  0x00, 0xff, 0x55, 0x00,
  0x55, 0xff, 0x55, 0x00,
  0xaa, 0xff, 0x55, 0x00,
  0xff, 0xff, 0x55, 0x00,
  0x00, 0x00, 0x7f, 0x00,
  0x55, 0x00, 0x7f, 0x00,
  0xaa, 0x00, 0x7f, 0x00,
  0xff, 0x00, 0x7f, 0x00,
  0x00, 0x1f, 0x7f, 0x00,
  0x55, 0x1f, 0x7f, 0x00,
  0xaa, 0x1f, 0x7f, 0x00,
  0xff, 0x1f, 0x7f, 0x00,
  0x00, 0x3f, 0x7f, 0x00,
  0x55, 0x3f, 0x7f, 0x00,
  0xaa, 0x3f, 0x7f, 0x00,
  0xff, 0x3f, 0x7f, 0x00,
  0x00, 0x5f, 0x7f, 0x00,
  0x55, 0x5f, 0x7f, 0x00,
  0xaa, 0x5f, 0x7f, 0x00,
  0xff, 0x5f, 0x7f, 0x00,
  0x00, 0x7f, 0x7f, 0x00,
  0x55, 0x7f, 0x7f, 0x00,
  0xaa, 0x7f, 0x7f, 0x00,
  0xff, 0x7f, 0x7f, 0x00,
  0x00, 0x9f, 0x7f, 0x00,
  0x55, 0x9f, 0x7f, 0x00,
  0xaa, 0x9f, 0x7f, 0x00,
  0xff, 0x9f, 0x7f, 0x00,
  0x00, 0xbf, 0x7f, 0x00,
  0x55, 0xbf, 0x7f, 0x00,
  0xaa, 0xbf, 0x7f, 0x00,
  0xff, 0xbf, 0x7f, 0x00,
  0x00, 0xdf, 0x7f, 0x00,
  0x55, 0xdf, 0x7f, 0x00,
  0xaa, 0xdf, 0x7f, 0x00,
  0xff, 0xdf, 0x7f, 0x00,
  0x00, 0xff, 0x7f, 0x00,
  0x55, 0xff, 0x7f, 0x00,
  0xaa, 0xff, 0x7f, 0x00,
  0xff, 0xff, 0x7f, 0x00,
  0x00, 0x00, 0xaa, 0x00,
  0x55, 0x00, 0xaa, 0x00,
  0xaa, 0x00, 0xaa, 0x00,
  0xff, 0x00, 0xaa, 0x00,
  0x00, 0x1f, 0xaa, 0x00,
  0x55, 0x1f, 0xaa, 0x00,
  0xaa, 0x1f, 0xaa, 0x00,
  0xff, 0x1f, 0xaa, 0x00,
  0x00, 0x3f, 0xaa, 0x00,
  0x55, 0x3f, 0xaa, 0x00,
  0xaa, 0x3f, 0xaa, 0x00,
  0xff, 0x3f, 0xaa, 0x00,
  0x00, 0x5f, 0xaa, 0x00,
  0x55, 0x5f, 0xaa, 0x00,
  0xaa, 0x5f, 0xaa, 0x00,
  0xff, 0x5f, 0xaa, 0x00,
  0x00, 0x7f, 0xaa, 0x00,
  0x55, 0x7f, 0xaa, 0x00,
  0xaa, 0x7f, 0xaa, 0x00,
  0xff, 0x7f, 0xaa, 0x00,
  0x00, 0x9f, 0xaa, 0x00,
  0x55, 0x9f, 0xaa, 0x00,
  0xaa, 0x9f, 0xaa, 0x00,
  0xff, 0x9f, 0xaa, 0x00,
  0x00, 0xbf, 0xaa, 0x00,
  0x55, 0xbf, 0xaa, 0x00,
  0xaa, 0xbf, 0xaa, 0x00,
  0xff, 0xbf, 0xaa, 0x00,
  0x00, 0xdf, 0xaa, 0x00,
  0x55, 0xdf, 0xaa, 0x00,
  0xaa, 0xdf, 0xaa, 0x00,
  0xff, 0xdf, 0xaa, 0x00,
  0x00, 0xff, 0xaa, 0x00,
  0x55, 0xff, 0xaa, 0x00,
  0xaa, 0xff, 0xaa, 0x00,
  0xff, 0xff, 0xaa, 0x00,
  0x00, 0x00, 0xd4, 0x00,
  0x55, 0x00, 0xd4, 0x00,
  0xaa, 0x00, 0xd4, 0x00,
  0xff, 0x00, 0xd4, 0x00,
  0x00, 0x1f, 0xd4, 0x00,
  0x55, 0x1f, 0xd4, 0x00,
  0xaa, 0x1f, 0xd4, 0x00,
  0xff, 0x1f, 0xd4, 0x00,
  0x00, 0x3f, 0xd4, 0x00,
  0x55, 0x3f, 0xd4, 0x00,
  0xaa, 0x3f, 0xd4, 0x00,
  0xff, 0x3f, 0xd4, 0x00,
  0x00, 0x5f, 0xd4, 0x00,
  0x55, 0x5f, 0xd4, 0x00,
  0xaa, 0x5f, 0xd4, 0x00,
  0xff, 0x5f, 0xd4, 0x00,
  0x00, 0x7f, 0xd4, 0x00,
  0x55, 0x7f, 0xd4, 0x00,
  0xaa, 0x7f, 0xd4, 0x00,
  0xff, 0x7f, 0xd4, 0x00,
  0x00, 0x9f, 0xd4, 0x00,
  0x55, 0x9f, 0xd4, 0x00,
  0xaa, 0x9f, 0xd4, 0x00,
  0xff, 0x9f, 0xd4, 0x00,
  0x00, 0xbf, 0xd4, 0x00,
  0x55, 0xbf, 0xd4, 0x00,
  0xaa, 0xbf, 0xd4, 0x00,
  0xff, 0xbf, 0xd4, 0x00,
  0x00, 0xdf, 0xd4, 0x00,
  0x55, 0xdf, 0xd4, 0x00,
  0xaa, 0xdf, 0xd4, 0x00,
  0xff, 0xdf, 0xd4, 0x00,
  0x00, 0xff, 0xd4, 0x00,
  0x55, 0xff, 0xd4, 0x00,
  0xaa, 0xff, 0xd4, 0x00,
  0xff, 0xff, 0xd4, 0x00,
  0x55, 0x00, 0xff, 0x00,
  0xaa, 0x00, 0xff, 0x00,
  0x00, 0x1f, 0xff, 0x00,
  0x55, 0x1f, 0xff, 0x00,
  0xaa, 0x1f, 0xff, 0x00,
  0xff, 0x1f, 0xff, 0x00,
  0x00, 0x3f, 0xff, 0x00,
  0x55, 0x3f, 0xff, 0x00,
  0xaa, 0x3f, 0xff, 0x00,
  0xff, 0x3f, 0xff, 0x00,
  0x00, 0x5f, 0xff, 0x00,
  0x55, 0x5f, 0xff, 0x00,
  0xaa, 0x5f, 0xff, 0x00,
  0xff, 0x5f, 0xff, 0x00,
  0x00, 0x7f, 0xff, 0x00,
  0x55, 0x7f, 0xff, 0x00,
  0xaa, 0x7f, 0xff, 0x00,
  0xff, 0x7f, 0xff, 0x00,
  0x00, 0x9f, 0xff, 0x00,
  0x55, 0x9f, 0xff, 0x00,
  0xaa, 0x9f, 0xff, 0x00,
  0xff, 0x9f, 0xff, 0x00,
  0x00, 0xbf, 0xff, 0x00,
  0x55, 0xbf, 0xff, 0x00,
  0xaa, 0xbf, 0xff, 0x00,
  0xff, 0xbf, 0xff, 0x00,
  0x00, 0xdf, 0xff, 0x00,
  0x55, 0xdf, 0xff, 0x00,
  0xaa, 0xdf, 0xff, 0x00,
  0xff, 0xdf, 0xff, 0x00,
  0x55, 0xff, 0xff, 0x00,
  0xaa, 0xff, 0xff, 0x00,
  0xff, 0xcc, 0xcc, 0x00,
  0xff, 0xcc, 0xff, 0x00,
  0xff, 0xff, 0x33, 0x00,
  0xff, 0xff, 0x66, 0x00,
  0xff, 0xff, 0x99, 0x00,
  0xff, 0xff, 0xcc, 0x00,
  0x00, 0x7f, 0x00, 0x00,
  0x55, 0x7f, 0x00, 0x00,
  0xaa, 0x7f, 0x00, 0x00,
  0xff, 0x7f, 0x00, 0x00,
  0x00, 0x9f, 0x00, 0x00,
  0x55, 0x9f, 0x00, 0x00,
  0xaa, 0x9f, 0x00, 0x00,
  0xff, 0x9f, 0x00, 0x00,
  0x00, 0xbf, 0x00, 0x00,
  0x55, 0xbf, 0x00, 0x00,
  0xaa, 0xbf, 0x00, 0x00,
  0xff, 0xbf, 0x00, 0x00,
  0x00, 0xdf, 0x00, 0x00,
  0x55, 0xdf, 0x00, 0x00,
  0xaa, 0xdf, 0x00, 0x00,
  0xff, 0xdf, 0x00, 0x00,
  0x55, 0xff, 0x00, 0x00,
  0xaa, 0xff, 0x00, 0x00,
  0x00, 0x00, 0x2a, 0x00,
  0x55, 0x00, 0x2a, 0x00,
  0xaa, 0x00, 0x2a, 0x00,
  0xff, 0x00, 0x2a, 0x00,
  0x00, 0x1f, 0x2a, 0x00,
  0x55, 0x1f, 0x2a, 0x00,
  0xaa, 0x1f, 0x2a, 0x00,
  0xff, 0x1f, 0x2a, 0x00,
  0x00, 0x3f, 0x2a, 0x00,
  0x55, 0x3f, 0x2a, 0x00,
  0xf0, 0xfb, 0xff, 0x00,
  0xa4, 0xa0, 0xa0, 0x00,
  0x80, 0x80, 0x80, 0x00,
  0x00, 0x00, 0xff, 0x00,
  0x00, 0xff, 0x00, 0x00,
  0x00, 0xff, 0xff, 0x00,
  0xff, 0x00, 0x00, 0x00,
  0xff, 0x00, 0xff, 0x00,
  0xff, 0xff, 0x00, 0x00,
  0xff, 0xff, 0xff, 0x00
};

/* Load the palette into VGA. 
 * If you want to use your own palette, replace the above palette with yours, then call this function in game_init(). 
 * But the blue screen may not be "blue" any longer. ^_^
 */
void write_palette() {
	int i;
	outb(VGA_DAC_WRITE_INDEX, 0);
	for(i = 0; i < NR_PALETTE_ENTRY; i ++) {
		outb(VGA_DAC_DATA, palette[(i >> 2) + 0] >> 2);	// red
		outb(VGA_DAC_DATA, palette[(i >> 2) + 1] >> 2);	// green
		outb(VGA_DAC_DATA, palette[(i >> 2) + 2] >> 2);	// blue
	}
}

/* Print the palette in use. */
/*
void read_palette() {
	int i;
	uint8_t r,g,b;
	outb(VGA_DAC_READ_INDEX, 0);
	for(i = 0; i < NR_PALETTE_ENTRY; i ++) {
		r = inb(VGA_DAC_DATA);
		g = inb(VGA_DAC_DATA);
		b = inb(VGA_DAC_DATA);
		printk("r = %x, g = %x, b = %x\n", r, g, b);
	}
} */
