#include "common.h"
#include "string.h"
#include "memory.h"

#define NR_PCB 10
#define SCR_KSTACK 4096

typedef struct PCB {
	int PID;
	CR3 cr3;
	uint8_t kstack[4096];
} PCB;
