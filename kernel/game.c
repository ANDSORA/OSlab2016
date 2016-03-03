#include <include/assert.h>

void init_serial();
void write_palette();
void init_vmem();

void printk_test();

void INIT_WORK(){
	init_serial();
	write_palette();
	init_vmem();
}

void TEST_WORK(){
	printk_test();
}

int main(void) {

	INIT_WORK();

	TEST_WORK();

	assert(0);

	while(1);
	return 0;
}
