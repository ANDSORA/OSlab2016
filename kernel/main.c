#include <include/common.h>
#include <include/video_mode.h>

void init_serial();
void init_i8259();
void init_vmem();

void printk_test();

void INIT_WORK(){
	init_serial();
	init_i8259();
	init_vmem();
}

void TEST_WORK(){
	printk_test();
	//struct ModeInfoBlock *mb = (struct ModeInfoBlock *)0x7e00;
	//printk("physbase = %x\n", mb->physbase);
}

int main(void) {
	INIT_WORK();

	//TEST_WORK();

	panic("YOU... DEAD\n");
	while(1);
	return 0;
}
