#include <include/common.h>
#include <include/video_mode.h>
#include <include/x86.h>

void init_serial();
void init_i8259();
void init_idt();
void init_timer();
void init_vmem();

void printk_test();

void game_main();

void INIT_WORK(){
	init_serial();
	init_i8259();
	init_idt();
	init_timer();
	init_vmem();
}

void TEST_WORK(){
	printk_test();
}

int main(void) {
	INIT_WORK();

	//TEST_WORK();
	printk("Here is main()\n");

	sti();
	game_main();

	panic("YOU shouldn't get here!\n");
	return 0;
}
