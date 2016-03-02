#include <lib/device/video.h>
#include <lib/logo.h>

uint8_t *vmem = ((uint8_t*)VMEM_ADDR);

void
init_vmem() {
	int i,j;
	for(i = 0; i < SCR_HEIGHT; ++ i){
		for(j = 0; j < SCR_WIDTH; ++ j){
			int idx = (i << 8) + (i << 6) + j;
			int midx = i * MOMOKO_WIDTH + j;
			if(i < MOMOKO_HEIGHT && j < MOMOKO_WIDTH) vmem[idx] = MOMOKO_pixel[midx];
			else vmem[idx] = 0;
		}
	}
}
