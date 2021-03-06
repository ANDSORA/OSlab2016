#include "common.h"
#include "x86.h"
#include "keyboard.h"
#include "video.h"
#include "syscall.h"

//void process_keys();

//extern uint32_t time_tick;
//uint32_t time_tick;

/*
static bool reborn;
inline void enable_reborn() {
	reborn = true;
}
inline void close_reborn() {
	reborn = false;
} */

bool generate_enemy();
bool update_enemy();
bool generate_bullet();
bool update_bullet();
void update_player();
void draw_screen();

void game_loop()
{
	//printk("Here is game_loop()\n");

	bool dead_flag = false;
	uint32_t now = get_time(), target;
	while(1){
		hlt();
		cli();
		if(now == get_time()){
			sti();
			continue;
		}

		target = get_time();
		sti();

		while(process_keys());

		while(now < target){
			if(now % 5 == 0) update_bullet();
			if(now % 8 == 0) update_player();
			if(now % 10 == 6) dead_flag = update_enemy();
			if(now % 10 == 0) draw_screen();
			if(now % 100 == 0) generate_bullet();
			if(now % 500 == 0) generate_enemy();
			now++;
		}
		if(dead_flag) break;
	}

	//clear_screen();
	//while(1);
}
