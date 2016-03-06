#ifndef __ASSERT_H__
#define __ASSERT_H__

int abort(const char *, int);

/*
#define HIT_GOOD_TRAP \
	asm volatile(".byte 0xd6" : : "a" (0))

#define HIT_BAD_TRAP \
	asm volatile(".byte 0xd6" : : "a" (1))
*/

#define assert(cond) \
	((cond) ? (0) : (abort(__FILE__, __LINE__)))

#endif
