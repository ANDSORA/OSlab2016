#ifndef __ASSERT_H__
#define __ASSERT_H__

int printk(const char *, ...);

#define HIT_GOOD_TRAP \
	asm volatile(".byte 0xd6" : : "a" (0))

#define HIT_BAD_TRAP \
	asm volatile(".byte 0xd6" : : "a" (1))

#define assert(cond) \
	do { \
		if( !(cond) ) { \
			printk("Assert Failed!\n"); HIT_BAD_TRAP; \
		} \
	} while(0)

#endif
