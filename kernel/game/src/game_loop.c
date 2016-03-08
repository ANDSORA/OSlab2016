#include <include/common.h>
#include <include/x86.h>

void process_keys();

extern uint32_t time_tick;

void game_loop()
{
	printk("Here is game_loop()\n");

	//int now = 0, target;
	while(1){
		//printk("time_tick = 0x%x\n", time_tick);
		/*
		hlt();
		if(now == time_tick) {
			sti();
			continue;
		}
		assert(now < time_tick);
		target = tick;
		sti(); */
		process_keys();
	}
}
