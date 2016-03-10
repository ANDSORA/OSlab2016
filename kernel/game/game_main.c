#include <include/common.h>
//#include <include/device/keyboard.h>

void add_irq_handle(int, void(*)(void));
void timer_event();
void keyboard_event();
void clear_screen();
void init_effect();
void game_loop();

void game_main()
{
	printk("Here is game_main()\n");

	add_irq_handle(0, timer_event);
	add_irq_handle(1, keyboard_event);

	clear_screen();
	init_effect();

	game_loop();
}
