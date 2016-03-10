#include <include/common.h>
#include <include/x86.h>
#include <include/device/keyboard.h>
#include <include/device/video.h>

//void process_keys();

extern uint32_t time_tick;

bool generate_enemy();
bool update_enemy();
bool generate_bullet();
bool update_bullet();
void update_player();
void draw_screen();

void game_loop()
{
	printk("Here is game_loop()\n");

	bool dead_flag = false;
	uint32_t now = time_tick, target;
	while(1){
		hlt();
		cli();
		if(now == time_tick){
			sti();
			continue;
		}

		target = time_tick;
		sti();

		process_keys();

		while(now < target){
			if(now % 5 == 0) update_bullet();
			if(now % 10 == 3) update_player();
			if(now % 10 == 6) dead_flag = update_enemy();
			if(now % 10 == 0) draw_screen();
			if(now % 100 == 0) generate_bullet();
			if(now % 500 == 0) generate_enemy();
			now++;
		}
		if(dead_flag) break;
	}

	clear_screen();
	while(1);
}
