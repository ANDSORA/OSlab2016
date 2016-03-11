#include <include/common.h>
#include <include/x86.h>
#include <include/device/scan_code.h>

#define NR_KEYS 6

enum {KEY_STATE_EMPTY, KEY_STATE_WAIT_RELEASE, KEY_STATE_RELEASE, KEY_STATE_PRESS};

/* Only the following keys are used in NEMU-PAL. */
static const int keycode_array[] = {
	K_UP, K_DOWN, K_LEFT, K_RIGHT, K_Z, K_ENTER
};

static const char *keyboard_string[] = {"UP", "DOWN", "LEFT", "RIGHT", "Z", "ENTER"};

static int key_state[NR_KEYS];

void get_press_key();
void get_release_key();
void enable_reborn();
void close_reborn();

void keyboard_event(void) {
	int key_code = inb(0x60);
	int i;
	//recent_keycode =dd key_code;
	//if(key_code == 0xf0) return;
	for (i = 0; i < NR_KEYS; i ++){
		if(key_code == keycode_array[i]) {
			switch(key_state[i]) {
				case KEY_STATE_EMPTY:
				case KEY_STATE_RELEASE: //key_state[i] = KEY_STATE_PRESS; break;
				case KEY_STATE_PRESS: key_state[i] = KEY_STATE_PRESS; break;
				case KEY_STATE_WAIT_RELEASE: key_state[i] = KEY_STATE_WAIT_RELEASE; break;
				default: assert(0); break;
			}
			/*
			if(key_state[i] == KEY_STATE_RELEASE || key_state[i] == KEY_STATE_EMPTY) key_state[i] = KEY_STATE_PRESS;
			else key_state[i] = KEY_STATE_WAIT_RELEASE; */
			break;
		}
		else if(key_code == keycode_array[i] + 0x80) {
			key_state[i] = KEY_STATE_RELEASE;
			break;
		}
	}
	//Log("i==%d, NR_KEYS==%d, key_code==0x%x", i, NR_KEYS, key_code);
	//assert(i < NR_KEYS);
	//recent_keycode = key_code;
	//recent_key_index = i;
	//Log("K_SPACE==0x%x, mykey==0x%x", K_SPACE, key_code);
}

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
	//recent_key_index = index;
	key_state[index] = KEY_STATE_RELEASE;
}

static inline void
clear_key(int index) {
	assert(index >= 0 && index < NR_KEYS);
	//recent_key_index = index;
	key_state[index] = KEY_STATE_EMPTY;
}

void process_keys() {
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i) {
		switch(key_state[i]) {
			case KEY_STATE_PRESS: {
					printk("key %s pressed\n", keyboard_string[i]);
					get_press_key(keycode_array[i]);
					key_state[i] = KEY_STATE_WAIT_RELEASE; break; }
			case KEY_STATE_RELEASE: {
					printk("key %s released\n", keyboard_string[i]);
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
		case K_LEFT: inc_player = -1; break;
		case K_RIGHT: inc_player = 1; break;
		case K_Z: enable_bullet = true; break;
		case K_ENTER: enable_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
	}
}

void get_release_key(uint32_t keycode) {
	switch (keycode) {
		case K_LEFT:
		case K_RIGHT: inc_player = 0; break;
		case K_Z: enable_bullet = false; break;
		case K_ENTER: close_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
	}
}
