#include <include/device/video.h>
#include <include/logo.h>

uint8_t *vmem = ((uint8_t*)VMEM_ADDR);

void
init_vmem() {
	int i,j,k;
	//int i,j;
	int idx = 0;
	for(i = 0; i < SCR_HEIGHT; ++ i){
		for(j = 0; j < SCR_WIDTH; ++ j){
			
			for(k = 0; k < SCR_DEPTH; ++ k){
				//vmem[idx] = gImage_PARK[idx + 2 - 2*k]; idx++;
				vmem[idx] = gImage_PARK[idx]; idx++;
			}
		}
	}
}
