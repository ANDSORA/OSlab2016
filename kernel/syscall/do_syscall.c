#include "common.h"
//#include "irq.h"
#include "mmu.h"

enum {SYS_write, SYS_time, SYS_kbd, SYS_video};

extern uint32_t time_tick;
int fs_write(int, void*, int);
int handle_keys();
int load_vmem(uint8_t*);

//static int times = 0;

void do_syscall(TrapFrameA *tf, uint32_t seg_base) {
	//times++;
	//printk("times = %d\n", times);
	//printk("here is do_syscall, tf->eax = %d, tf->esp_ = 0x%x\n", tf->eax, tf->esp_);
	switch(tf->eax) {
		case SYS_write: tf->eax = fs_write(tf->ebx, (void *)(tf->ecx + seg_base), tf->edx); break;
		case SYS_time:	tf->eax = time_tick; break;
		case SYS_kbd:	tf->eax = handle_keys(); break;
		case SYS_video:	tf->eax = load_vmem((uint8_t *)(tf->ebx + seg_base)); break;
		default: panic("Unhandled system call: id = %d", tf->eax);
	}
}
