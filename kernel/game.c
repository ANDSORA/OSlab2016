void init_serial();
int is_serial_idle();
void serial_printc(char);
void serial_output_test();
void write_palette();
void init_vmem();

int main(void) {
	init_serial();
	write_palette();
	init_vmem();
	//serial_printc('X');
	serial_output_test();

	while(1);
	return 0;
}
