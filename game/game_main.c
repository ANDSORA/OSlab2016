#include <include/common.h>
#include <include/x86.h>
//#include <include/device/keyboard.h>

void add_irq_handle(int, void(*)(void));
void timer_event();
void keyboard_event();
void process_keys();
void clear_screen();
void init_effect();
void game_loop();

static bool reborn;
void enable_reborn() {
	reborn = true;
}
void close_reborn() {
	reborn = false;
}


void game_main()
{
	printk("Here is game_main()\n");

	add_irq_handle(0, timer_event);
	add_irq_handle(1, keyboard_event);

	reborn = false;

	while(1) {
		hlt();
		process_keys();
		if(reborn) {
			clear_screen();
			init_effect();
			game_loop();
		}
	}
}
