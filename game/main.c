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


int main()
{
	//while(1);
	printf("here is game_main()\n"); //while(1);
	sti(); //hlt(); cli();

	//while(1);
	reborn = false;

	//process_keys(); while(1);
	while(1) {
		hlt();
		while(process_keys());
		if(reborn) {
			clear_buffer(); //while(1);
			display_buffer(); //while(1);
			init_effect();
			game_loop();
		}
	}
}
