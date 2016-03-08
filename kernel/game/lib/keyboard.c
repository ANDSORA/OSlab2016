#include <include/common.h>
#include <include/x86.h>
#include "keyboard.h"

#define NR_KEYS 4

enum {KEY_STATE_EMPTY, KEY_STATE_WAIT_RELEASE, KEY_STATE_RELEASE, KEY_STATE_PRESS};

/* Only the following keys are used in NEMU-PAL. */
static const int keycode_array[] = {
	K_UP, K_DOWN, K_LEFT, K_RIGHT,
};

static const char *keyboard_string[] = {"UP", "DOWN", "LEFT", "RIGHT",};

static int key_state[NR_KEYS];

void
keyboard_event(void) {
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
					key_state[i] = KEY_STATE_WAIT_RELEASE; break; }
			case KEY_STATE_RELEASE: {
					printk("key %s released\n", keyboard_string[i]);
					key_state[i] = KEY_STATE_EMPTY; break; }
			default: break;
		}
	}
	sti();
}
/*
bool 
process_keys(void (*key_press_callback)(int), void (*key_release_callback)(int)) {
	//Log("(process_keys)");
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i){
		switch(key_state[i]) {
			case KEY_STATE_EMPTY: ;
			case KEY_STATE_WAIT_RELEASE: break;
			case KEY_STATE_PRESS: {
				key_press_callback(keycode_array[i]);
				key_state[i] = KEY_STATE_WAIT_RELEASE;
				sti(); return true; break; }
			case KEY_STATE_RELEASE: {
				key_release_callback(keycode_array[i]);
				key_state[i] = KEY_STATE_EMPTY;
				sti(); return true; break; }
			default: assert(0); break;
		}
	}
	sti(); return false;
}*/
