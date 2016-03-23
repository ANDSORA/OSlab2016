#include "common.h"
#include "x86.h"
#include "scan_code.h"

#define NR_KEYS 6

enum {KEY_STATE_EMPTY, KEY_STATE_WAIT_RELEASE, KEY_STATE_RELEASE, KEY_STATE_PRESS};

/* Only the following keys are used in NEMU-PAL. */
static const int keycode_array[] = {
	K_UP, K_DOWN, K_LEFT, K_RIGHT, K_Z, K_ENTER
};

//static const char *keyboard_string[] = {"UP", "DOWN", "LEFT", "RIGHT", "Z", "ENTER"};

static int key_state[NR_KEYS];

void get_press_key();
void get_release_key();
void enable_reborn();
void close_reborn();

void keyboard_event(void) {
	int key_code = inb(0x60);
	int i;
	for (i = 0; i < NR_KEYS; i ++){
		if(key_code == keycode_array[i]) {
			switch(key_state[i]) {
				case KEY_STATE_EMPTY:
				case KEY_STATE_RELEASE:
				case KEY_STATE_PRESS: key_state[i] = KEY_STATE_PRESS; break;
				case KEY_STATE_WAIT_RELEASE: key_state[i] = KEY_STATE_WAIT_RELEASE; break;
				default: /*assert(0);*/ break;
			}
			break;
		}
		else if(key_code == keycode_array[i] + 0x80) {
			key_state[i] = KEY_STATE_RELEASE;
			break;
		}
	}
}


/* something old and would never be used
static inline int
get_keycode(int index) {
	assert(index >= 0 && index < NR_KEYS);
	return keycode_array[index];
}

static inline int
query_key(int index) {
	assert(index >= 0 && index < NR_KEYS);
	return key_state[index];
}

static inline void
release_key(int index) {
	assert(index >= 0 && index < NR_KEYS);
	key_state[index] = KEY_STATE_RELEASE;
}

static inline void
clear_key(int index) {
	assert(index >= 0 && index < NR_KEYS);
	key_state[index] = KEY_STATE_EMPTY;
} */

void process_keys() {
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i) {
		switch(key_state[i]) {
			case KEY_STATE_PRESS: {
					//printk("key %s pressed\n", keyboard_string[i]);
					get_press_key(keycode_array[i]);
					key_state[i] = KEY_STATE_WAIT_RELEASE; break; }
			case KEY_STATE_RELEASE: {
					//printk("key %s released\n", keyboard_string[i]);
					get_release_key(keycode_array[i]);
					key_state[i] = KEY_STATE_EMPTY; break; }
			default: break;
		}
	}
	sti();
}


extern int inc_player;
extern bool enable_bullet;

void get_press_key(uint32_t keycode) {
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

void get_release_key(uint32_t keycode) {
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
