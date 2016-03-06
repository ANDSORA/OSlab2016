#include <include/stdio.h>
#include <include/x86.h>

void abort(const char* filename, int line) {
	cli();
	printk("Sorry, You are Dead :)\n%s,%d: Boom!\n", filename, line);
	while(1);
}
