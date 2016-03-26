#include "common.h"
#include "x86.h"
#include "inc/video.h"

bool process_keys();
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
	printf("here is game_main()\n");
	//sti(); //hlt(); cli();

	reborn = false;

	//process_keys(); while(1);
	while(1) {
		hlt();
		while(process_keys());
		if(reborn) {
			clear_buffer();
			display_buffer();
			init_effect();
			game_loop();
		}
	}
}
