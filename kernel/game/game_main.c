#include <include/common.h>

void add_irq_handle(int, void(*)(void));
void timer_event();
void keyboard_event();
void game_loop();

void game_main()
{
	printk("Here is game_main()\n");

	add_irq_handle(0, timer_event);
	add_irq_handle(1, keyboard_event);

	game_loop();
}
