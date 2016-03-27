#include "common.h"
#include "x86.h"
#include "scan_code.h"
#include "syscall.h"

#define NR_KEYS 6

enum {KEY_STATE_EMPTY, KEY_STATE_WAIT_RELEASE, KEY_STATE_RELEASE, KEY_STATE_PRESS};

/* Only the following keys are used in NEMU-PAL. */
static const int keycode_array[] = {
	K_UP, K_DOWN, K_LEFT, K_RIGHT, K_Z, K_ENTER
};

//static const char *keyboard_string[] = {"UP", "DOWN", "LEFT", "RIGHT", "Z", "ENTER"};

//static int key_state[NR_KEYS];

void get_press_key(uint8_t);
void get_release_key(uint8_t);
void enable_reborn();
void close_reborn();


bool process_keys() {
	printf("process keys\n");
	uint8_t keycode = get_kbd();
	if(keycode == 0xff) return false;
	if(keycode < 0x80) {
		get_press_key(keycode); return true;
	}
	else {
		get_release_key(keycode - 0x80); return true;
	}
}

extern int inc_player;
extern bool enable_bullet;

void get_press_key(uint8_t keycode) {
	switch (keycode) {
		case K_LEFT: inc_player --; break;
		case K_RIGHT: inc_player ++; break;
		case K_Z: enable_bullet = true; break;
		case K_ENTER: enable_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
	}
}

void get_release_key(uint8_t keycode) {
	switch (keycode) {
		case K_LEFT: inc_player ++; break;
		case K_RIGHT: inc_player --; break;
		case K_Z: enable_bullet = false; break;
		case K_ENTER: close_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
	}
}
