#ifndef __SYSCALL_H__
#define __SYSCALL_H__

int write(int, char*, int);
int get_time();
int get_kbd();
int put_video(uint8_t*);

#endif
