#include "common.h"
#include "x86.h"
#include "inc/video.h"

void process_keys();
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
	while(1);

	reborn = false;

	while(1) {
		hlt();
		process_keys();
		if(reborn) {
			clear_buffer();
			display_buffer();
			init_effect();
			game_loop();
		}
	}
}
