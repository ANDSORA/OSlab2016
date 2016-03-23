#include "device/video_mode.h"
#include "logo.h"
#include "string.h"
#include "device/video.h"

uint8_t *vmem;

void init_vmem_addr() {
	struct ModeInfoBlock *MIB = (struct ModeInfoBlock *)(0x7e00);
	vmem = (uint8_t *)MIB->physbase;
}

inline void init_vmem() {
	memcpy(vmem, gImage_PARK, SCR_SIZE);
}
