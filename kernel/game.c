#include <include/assert.h>
#include <include/video_mode.h>
#include <include/stdio.h>

void init_serial();
void write_palette();
void init_vmem();

void printk_test();

void INIT_WORK(){
	init_serial();
	//write_palette();
	init_vmem();
}

void TEST_WORK(){
	printk_test();
	//struct ModeInfoBlock *mb = (struct ModeInfoBlock *)0x7e00;
	//printk("physbase = %x\n", mb->physbase);
}

int main(void) {
	INIT_WORK();

	TEST_WORK();

	//assert(0);

	while(1);
	return 0;
}
