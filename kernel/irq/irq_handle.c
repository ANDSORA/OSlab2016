#include "common.h"
#include "irq.h"
#include "mmu.h"
#include "memory.h"

#define NR_IRQ_HANDLE 32
#define NR_HARD_INTR 16 /* At most 16 kinds of hardware interrupts. */

struct IRQ_t {
	void (*routine)(void);
	struct IRQ_t *next;
};

static struct IRQ_t handle_pool[NR_IRQ_HANDLE];
static struct IRQ_t *handles[NR_HARD_INTR]; // handles is an array of lists
static int handle_count = 0;

void do_syscall(TrapFrameA*, uint32_t);

void add_irq_handle(int irq, void (*func)(void) ) {
	assert(irq < NR_HARD_INTR);
	assert(handle_count <= NR_IRQ_HANDLE);

	struct IRQ_t *ptr;
	ptr = &handle_pool[handle_count ++]; // get a free handler
	ptr->routine = func;
	ptr->next = handles[irq]; // insert into the linked list
	handles[irq] = ptr;
}

uint32_t get_timer_handle() {
	int irq_id = 0;
	struct IRQ_t *f = handles[irq_id];
	printk("handles = 0x%x\n", (uint32_t)handles);
	printk("handles[0] = 0x%x\n", (uint32_t)(handles[0]));
	printk("handles[0]->routine = 0x%x\n", (uint32_t)(handles[0]->routine));
	while(f != NULL) {
		printk("0x%x\n", (uint32_t)f->routine);
		f = f->next;
	}
	return 0;
}

void irq_handle(TrapFrameA *tf) {
	/*
	printk("here is irq_handle, and The TrapFrame:\n");
	printk("%x\t%x\t%x\t%x\n", tf->edi, tf->esi, tf->ebp, tf->esp_);
	printk("%x\t%x\t%x\t%x\n", tf->ebx, tf->edx, tf->ecx, tf->eax);
	printk("%x\t%x\t%x\t%x\n", tf->gs, tf->fs, tf->es, tf->ds);
	printk("irq = %d,  err = %d\n", tf->irq, tf->err);
	printk("eip = 0x%x,  cs = 0x%x\n", tf->eip, tf->cs);
	printk("eflags = 0x%x\n", tf->eflags);
	printk("esp = 0x%x,  ss = 0x%x\n", tf->esp, tf->ss);
	*/

	int irq = tf->irq;

	if(irq == 0x80) do_syscall(tf, get_seg_base(tf->ds));
	else if(irq < 1000) panic("Unhandled exception! irq==%d\n", irq);
	else {
		int irq_id = irq - 1000;
		assert(irq_id < NR_HARD_INTR);
		struct IRQ_t *f = handles[irq_id];
		
		/*
		printk("handles = 0x%x\n", (uint32_t)handles);
		printk("handles[0] = 0x%x\n", (uint32_t)(handles[0]));
		printk("handles[0]->routine = 0x%x\n", (uint32_t)(handles[0]->routine));
		printk("let's work\n");
		*/

		while(f != NULL) {
			//printk("we would execute 0x%x\n", (uint32_t)f->routine);
			f->routine();
			f = f->next;
		}

		//printk("let's go home\n");
	}
}



