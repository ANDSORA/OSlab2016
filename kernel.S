
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00100000 <printk_test>:
#include <include/common.h>

int printk(const char *, ...);

void printk_test(){
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 08             	sub    $0x8,%esp
	printk("Printk test begin...\n");
  100006:	83 ec 0c             	sub    $0xc,%esp
  100009:	68 00 0f 10 00       	push   $0x100f00
  10000e:	e8 aa 0b 00 00       	call   100bbd <printk>
  100013:	83 c4 10             	add    $0x10,%esp
	printk("the answer should be:\n");
  100016:	83 ec 0c             	sub    $0xc,%esp
  100019:	68 16 0f 10 00       	push   $0x100f16
  10001e:	e8 9a 0b 00 00       	call   100bbd <printk>
  100023:	83 c4 10             	add    $0x10,%esp
	printk("#######################################################\n");
  100026:	83 ec 0c             	sub    $0xc,%esp
  100029:	68 30 0f 10 00       	push   $0x100f30
  10002e:	e8 8a 0b 00 00       	call   100bbd <printk>
  100033:	83 c4 10             	add    $0x10,%esp
	printk("Hello, welcome to OSlab! I'm the body of the game. ");
  100036:	83 ec 0c             	sub    $0xc,%esp
  100039:	68 6c 0f 10 00       	push   $0x100f6c
  10003e:	e8 7a 0b 00 00       	call   100bbd <printk>
  100043:	83 c4 10             	add    $0x10,%esp
	printk("Bootblock loads me to the memory position of 0x100000, and Makefile also tells me that I'm at the location of 0x100000. ");
  100046:	83 ec 0c             	sub    $0xc,%esp
  100049:	68 a0 0f 10 00       	push   $0x100fa0
  10004e:	e8 6a 0b 00 00       	call   100bbd <printk>
  100053:	83 c4 10             	add    $0x10,%esp
	printk("~!@#$^&*()_+`1234567890-=...... ");
  100056:	83 ec 0c             	sub    $0xc,%esp
  100059:	68 1c 10 10 00       	push   $0x10101c
  10005e:	e8 5a 0b 00 00       	call   100bbd <printk>
  100063:	83 c4 10             	add    $0x10,%esp
	printk("Now I will test your printk: ");
  100066:	83 ec 0c             	sub    $0xc,%esp
  100069:	68 3d 10 10 00       	push   $0x10103d
  10006e:	e8 4a 0b 00 00       	call   100bbd <printk>
  100073:	83 c4 10             	add    $0x10,%esp
	printk("1 + 1 = 2, 123 * 456 = 56088\n0, -1, -2147483648, -1412505855, -32768, 102030\n0, ffffffff, 80000000, abcdef01, ffff8000, 18e8e\n");
  100076:	83 ec 0c             	sub    $0xc,%esp
  100079:	68 5c 10 10 00       	push   $0x10105c
  10007e:	e8 3a 0b 00 00       	call   100bbd <printk>
  100083:	83 c4 10             	add    $0x10,%esp
	printk("#######################################################\n");
  100086:	83 ec 0c             	sub    $0xc,%esp
  100089:	68 30 0f 10 00       	push   $0x100f30
  10008e:	e8 2a 0b 00 00       	call   100bbd <printk>
  100093:	83 c4 10             	add    $0x10,%esp
	printk("your answer:\n");
  100096:	83 ec 0c             	sub    $0xc,%esp
  100099:	68 db 10 10 00       	push   $0x1010db
  10009e:	e8 1a 0b 00 00       	call   100bbd <printk>
  1000a3:	83 c4 10             	add    $0x10,%esp
	printk("=======================================================\n");
  1000a6:	83 ec 0c             	sub    $0xc,%esp
  1000a9:	68 ec 10 10 00       	push   $0x1010ec
  1000ae:	e8 0a 0b 00 00       	call   100bbd <printk>
  1000b3:	83 c4 10             	add    $0x10,%esp
	printk("%s %s%scome %co%s", "Hello,", "", "wel", 't', " ");
  1000b6:	83 ec 08             	sub    $0x8,%esp
  1000b9:	68 25 11 10 00       	push   $0x101125
  1000be:	6a 74                	push   $0x74
  1000c0:	68 27 11 10 00       	push   $0x101127
  1000c5:	68 2b 11 10 00       	push   $0x10112b
  1000ca:	68 2c 11 10 00       	push   $0x10112c
  1000cf:	68 33 11 10 00       	push   $0x101133
  1000d4:	e8 e4 0a 00 00       	call   100bbd <printk>
  1000d9:	83 c4 20             	add    $0x20,%esp
	printk("%c%c%c%c%c! ", 'O', 'S', 'l', 'a', 'b');
  1000dc:	83 ec 08             	sub    $0x8,%esp
  1000df:	6a 62                	push   $0x62
  1000e1:	6a 61                	push   $0x61
  1000e3:	6a 6c                	push   $0x6c
  1000e5:	6a 53                	push   $0x53
  1000e7:	6a 4f                	push   $0x4f
  1000e9:	68 45 11 10 00       	push   $0x101145
  1000ee:	e8 ca 0a 00 00       	call   100bbd <printk>
  1000f3:	83 c4 20             	add    $0x20,%esp
	printk("I'm the %s of %s. %s 0x%x, %s 0x%x. ", "body", "the game", "Bootblock loads me to the memory position of", 0x100000, "and Makefile also tells me that I'm at the location of", 0x100000);
  1000f6:	83 ec 04             	sub    $0x4,%esp
  1000f9:	68 00 00 10 00       	push   $0x100000
  1000fe:	68 54 11 10 00       	push   $0x101154
  100103:	68 00 00 10 00       	push   $0x100000
  100108:	68 8c 11 10 00       	push   $0x10118c
  10010d:	68 b9 11 10 00       	push   $0x1011b9
  100112:	68 c2 11 10 00       	push   $0x1011c2
  100117:	68 c8 11 10 00       	push   $0x1011c8
  10011c:	e8 9c 0a 00 00       	call   100bbd <printk>
  100121:	83 c4 20             	add    $0x20,%esp
	printk("~!@#$^&*()_+`1234567890-=...... ");
  100124:	83 ec 0c             	sub    $0xc,%esp
  100127:	68 1c 10 10 00       	push   $0x10101c
  10012c:	e8 8c 0a 00 00       	call   100bbd <printk>
  100131:	83 c4 10             	add    $0x10,%esp
	printk("Now I will test your printk: ");
  100134:	83 ec 0c             	sub    $0xc,%esp
  100137:	68 3d 10 10 00       	push   $0x10103d
  10013c:	e8 7c 0a 00 00       	call   100bbd <printk>
  100141:	83 c4 10             	add    $0x10,%esp
	printk("%d + %d = %d, %d * %d = %d\n", 1, 1, 1 + 1, 123, 456, 123 * 456);
  100144:	83 ec 04             	sub    $0x4,%esp
  100147:	68 18 db 00 00       	push   $0xdb18
  10014c:	68 c8 01 00 00       	push   $0x1c8
  100151:	6a 7b                	push   $0x7b
  100153:	6a 02                	push   $0x2
  100155:	6a 01                	push   $0x1
  100157:	6a 01                	push   $0x1
  100159:	68 ed 11 10 00       	push   $0x1011ed
  10015e:	e8 5a 0a 00 00       	call   100bbd <printk>
  100163:	83 c4 20             	add    $0x20,%esp
	printk("%d, %d, %d, %d, %d, %d\n", 0, 0xffffffff, 0x80000000, 0xabcedf01, -32768, 102030);
  100166:	83 ec 04             	sub    $0x4,%esp
  100169:	68 8e 8e 01 00       	push   $0x18e8e
  10016e:	68 00 80 ff ff       	push   $0xffff8000
  100173:	68 01 df ce ab       	push   $0xabcedf01
  100178:	68 00 00 00 80       	push   $0x80000000
  10017d:	6a ff                	push   $0xffffffff
  10017f:	6a 00                	push   $0x0
  100181:	68 09 12 10 00       	push   $0x101209
  100186:	e8 32 0a 00 00       	call   100bbd <printk>
  10018b:	83 c4 20             	add    $0x20,%esp
	printk("%x, %x, %x, %x, %x, %x\n", 0, 0xffffffff, 0x80000000, 0xabcedf01, -32768, 102030);
  10018e:	83 ec 04             	sub    $0x4,%esp
  100191:	68 8e 8e 01 00       	push   $0x18e8e
  100196:	68 00 80 ff ff       	push   $0xffff8000
  10019b:	68 01 df ce ab       	push   $0xabcedf01
  1001a0:	68 00 00 00 80       	push   $0x80000000
  1001a5:	6a ff                	push   $0xffffffff
  1001a7:	6a 00                	push   $0x0
  1001a9:	68 21 12 10 00       	push   $0x101221
  1001ae:	e8 0a 0a 00 00       	call   100bbd <printk>
  1001b3:	83 c4 20             	add    $0x20,%esp
	printk("=======================================================\n");
  1001b6:	83 ec 0c             	sub    $0xc,%esp
  1001b9:	68 ec 10 10 00       	push   $0x1010ec
  1001be:	e8 fa 09 00 00       	call   100bbd <printk>
  1001c3:	83 c4 10             	add    $0x10,%esp
	printk("Test end!!! Good luck!!!\n");//void serial_output_test();
  1001c6:	83 ec 0c             	sub    $0xc,%esp
  1001c9:	68 39 12 10 00       	push   $0x101239
  1001ce:	e8 ea 09 00 00       	call   100bbd <printk>
  1001d3:	83 c4 10             	add    $0x10,%esp
}
  1001d6:	c9                   	leave  
  1001d7:	c3                   	ret    

001001d8 <write_palette>:

/* Load the palette into VGA. 
 * If you want to use your own palette, replace the above palette with yours, then call this function in game_init(). 
 * But the blue screen may not be "blue" any longer. ^_^
 */
void write_palette() {
  1001d8:	55                   	push   %ebp
  1001d9:	89 e5                	mov    %esp,%ebp
  1001db:	83 ec 30             	sub    $0x30,%esp
  1001de:	c7 45 f8 c8 03 00 00 	movl   $0x3c8,-0x8(%ebp)
  1001e5:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  1001e9:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1001ed:	8b 55 f8             	mov    -0x8(%ebp),%edx
  1001f0:	ee                   	out    %al,(%dx)
	int i;
	outb(VGA_DAC_WRITE_INDEX, 0);
	for(i = 0; i < NR_PALETTE_ENTRY; i ++) {
  1001f1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1001f8:	eb 79                	jmp    100273 <write_palette+0x9b>
		outb(VGA_DAC_DATA, palette[(i << 2) + 0] >> 2);	// red
  1001fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1001fd:	c1 e0 02             	shl    $0x2,%eax
  100200:	0f b6 80 00 20 26 00 	movzbl 0x262000(%eax),%eax
  100207:	c0 e8 02             	shr    $0x2,%al
  10020a:	0f b6 c0             	movzbl %al,%eax
  10020d:	c7 45 f0 c9 03 00 00 	movl   $0x3c9,-0x10(%ebp)
  100214:	88 45 ef             	mov    %al,-0x11(%ebp)
  100217:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  10021b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10021e:	ee                   	out    %al,(%dx)
		outb(VGA_DAC_DATA, palette[(i << 2) + 1] >> 2);	// green
  10021f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100222:	c1 e0 02             	shl    $0x2,%eax
  100225:	83 c0 01             	add    $0x1,%eax
  100228:	0f b6 80 00 20 26 00 	movzbl 0x262000(%eax),%eax
  10022f:	c0 e8 02             	shr    $0x2,%al
  100232:	0f b6 c0             	movzbl %al,%eax
  100235:	c7 45 e8 c9 03 00 00 	movl   $0x3c9,-0x18(%ebp)
  10023c:	88 45 e7             	mov    %al,-0x19(%ebp)
  10023f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  100243:	8b 55 e8             	mov    -0x18(%ebp),%edx
  100246:	ee                   	out    %al,(%dx)
		outb(VGA_DAC_DATA, palette[(i << 2) + 2] >> 2);	// blue
  100247:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10024a:	c1 e0 02             	shl    $0x2,%eax
  10024d:	83 c0 02             	add    $0x2,%eax
  100250:	0f b6 80 00 20 26 00 	movzbl 0x262000(%eax),%eax
  100257:	c0 e8 02             	shr    $0x2,%al
  10025a:	0f b6 c0             	movzbl %al,%eax
  10025d:	c7 45 e0 c9 03 00 00 	movl   $0x3c9,-0x20(%ebp)
  100264:	88 45 df             	mov    %al,-0x21(%ebp)
  100267:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  10026b:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10026e:	ee                   	out    %al,(%dx)
 * But the blue screen may not be "blue" any longer. ^_^
 */
void write_palette() {
	int i;
	outb(VGA_DAC_WRITE_INDEX, 0);
	for(i = 0; i < NR_PALETTE_ENTRY; i ++) {
  10026f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100273:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10027a:	0f 8e 7a ff ff ff    	jle    1001fa <write_palette+0x22>
		outb(VGA_DAC_DATA, palette[(i << 2) + 0] >> 2);	// red
		outb(VGA_DAC_DATA, palette[(i << 2) + 1] >> 2);	// green
		outb(VGA_DAC_DATA, palette[(i << 2) + 2] >> 2);	// blue
	}
}
  100280:	c9                   	leave  
  100281:	c3                   	ret    

00100282 <init_vmem>:
#include <include/logo.h>

uint8_t *vmem = ((uint8_t*)VMEM_ADDR);

void
init_vmem() {
  100282:	55                   	push   %ebp
  100283:	89 e5                	mov    %esp,%ebp
  100285:	83 ec 10             	sub    $0x10,%esp
	int i,j,k;
	//int i,j;
	int idx = 0;
  100288:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
	for(i = 0; i < SCR_HEIGHT; ++ i){
  10028f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100296:	eb 49                	jmp    1002e1 <init_vmem+0x5f>
		for(j = 0; j < SCR_WIDTH; ++ j){
  100298:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
  10029f:	eb 33                	jmp    1002d4 <init_vmem+0x52>
			
			for(k = 0; k < SCR_DEPTH; ++ k){
  1002a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1002a8:	eb 20                	jmp    1002ca <init_vmem+0x48>
				//vmem[idx] = gImage_PARK[idx + 2 - 2*k]; idx++;
				vmem[idx] = gImage_PARK[idx]; idx++;
  1002aa:	8b 15 00 24 26 00    	mov    0x262400,%edx
  1002b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002b3:	01 c2                	add    %eax,%edx
  1002b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002b8:	05 80 12 10 00       	add    $0x101280,%eax
  1002bd:	0f b6 00             	movzbl (%eax),%eax
  1002c0:	88 02                	mov    %al,(%edx)
  1002c2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
	//int i,j;
	int idx = 0;
	for(i = 0; i < SCR_HEIGHT; ++ i){
		for(j = 0; j < SCR_WIDTH; ++ j){
			
			for(k = 0; k < SCR_DEPTH; ++ k){
  1002c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  1002ca:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
  1002ce:	7e da                	jle    1002aa <init_vmem+0x28>
init_vmem() {
	int i,j,k;
	//int i,j;
	int idx = 0;
	for(i = 0; i < SCR_HEIGHT; ++ i){
		for(j = 0; j < SCR_WIDTH; ++ j){
  1002d0:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
  1002d4:	81 7d f8 1f 03 00 00 	cmpl   $0x31f,-0x8(%ebp)
  1002db:	7e c4                	jle    1002a1 <init_vmem+0x1f>
void
init_vmem() {
	int i,j,k;
	//int i,j;
	int idx = 0;
	for(i = 0; i < SCR_HEIGHT; ++ i){
  1002dd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1002e1:	81 7d fc 57 02 00 00 	cmpl   $0x257,-0x4(%ebp)
  1002e8:	7e ae                	jle    100298 <init_vmem+0x16>
				//vmem[idx] = gImage_PARK[idx + 2 - 2*k]; idx++;
				vmem[idx] = gImage_PARK[idx]; idx++;
			}
		}
	}
}
  1002ea:	c9                   	leave  
  1002eb:	c3                   	ret    

001002ec <game_main>:
void timer_event();
void keyboard_event();
void game_loop();

void game_main()
{
  1002ec:	55                   	push   %ebp
  1002ed:	89 e5                	mov    %esp,%ebp
  1002ef:	83 ec 08             	sub    $0x8,%esp
	printk("Here is game_main()\n");
  1002f2:	83 ec 0c             	sub    $0xc,%esp
  1002f5:	68 80 0b 26 00       	push   $0x260b80
  1002fa:	e8 be 08 00 00       	call   100bbd <printk>
  1002ff:	83 c4 10             	add    $0x10,%esp

	add_irq_handle(0, timer_event);
  100302:	83 ec 08             	sub    $0x8,%esp
  100305:	68 b8 03 10 00       	push   $0x1003b8
  10030a:	6a 00                	push   $0x0
  10030c:	e8 85 02 00 00       	call   100596 <add_irq_handle>
  100311:	83 c4 10             	add    $0x10,%esp
	add_irq_handle(1, keyboard_event);
  100314:	83 ec 08             	sub    $0x8,%esp
  100317:	68 ca 03 10 00       	push   $0x1003ca
  10031c:	6a 01                	push   $0x1
  10031e:	e8 73 02 00 00       	call   100596 <add_irq_handle>
  100323:	83 c4 10             	add    $0x10,%esp

	game_loop();
  100326:	e8 02 00 00 00       	call   10032d <game_loop>
}
  10032b:	c9                   	leave  
  10032c:	c3                   	ret    

0010032d <game_loop>:
void process_keys();

extern uint32_t time_tick;

void game_loop()
{
  10032d:	55                   	push   %ebp
  10032e:	89 e5                	mov    %esp,%ebp
  100330:	83 ec 08             	sub    $0x8,%esp
	printk("Here is game_loop()\n");
  100333:	83 ec 0c             	sub    $0xc,%esp
  100336:	68 95 0b 26 00       	push   $0x260b95
  10033b:	e8 7d 08 00 00       	call   100bbd <printk>
  100340:	83 c4 10             	add    $0x10,%esp

	//int now = 0, target;
	while(1){
		printk("In loop\n");
  100343:	83 ec 0c             	sub    $0xc,%esp
  100346:	68 aa 0b 26 00       	push   $0x260baa
  10034b:	e8 6d 08 00 00       	call   100bbd <printk>
  100350:	83 c4 10             	add    $0x10,%esp
			continue;
		}
		assert(now < time_tick);
		target = tick;
		sti(); */
		process_keys();
  100353:	e8 33 01 00 00       	call   10048b <process_keys>
	}
  100358:	eb e9                	jmp    100343 <game_loop+0x16>

0010035a <init_timer>:
	.operate_mode = 2,  // rate generator, for more accuracy
	.access_mode  = 3,  // low byte / high byte, see below
	.channel      = 0,  // use channel 0
};

void init_timer() {
  10035a:	55                   	push   %ebp
  10035b:	89 e5                	mov    %esp,%ebp
  10035d:	83 ec 20             	sub    $0x20,%esp
	int counter = PIT_FREQUENCE / HZ;
  100360:	c7 45 fc 9b 2e 00 00 	movl   $0x2e9b,-0x4(%ebp)
	outb(PORT_CMD, mode.val);
  100367:	0f b6 05 04 24 26 00 	movzbl 0x262404,%eax
  10036e:	0f b6 c0             	movzbl %al,%eax
  100371:	c7 45 f8 43 00 00 00 	movl   $0x43,-0x8(%ebp)
  100378:	88 45 f7             	mov    %al,-0x9(%ebp)
  10037b:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  10037f:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100382:	ee                   	out    %al,(%dx)
	outb(PORT_CH_0, counter & 0xFF);         // access low byte
  100383:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100386:	0f b6 c0             	movzbl %al,%eax
  100389:	c7 45 f0 40 00 00 00 	movl   $0x40,-0x10(%ebp)
  100390:	88 45 ef             	mov    %al,-0x11(%ebp)
  100393:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100397:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10039a:	ee                   	out    %al,(%dx)
	outb(PORT_CH_0, (counter >> 8) & 0xFF);  // access high byte
  10039b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10039e:	c1 f8 08             	sar    $0x8,%eax
  1003a1:	0f b6 c0             	movzbl %al,%eax
  1003a4:	c7 45 e8 40 00 00 00 	movl   $0x40,-0x18(%ebp)
  1003ab:	88 45 e7             	mov    %al,-0x19(%ebp)
  1003ae:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  1003b2:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1003b5:	ee                   	out    %al,(%dx)
}
  1003b6:	c9                   	leave  
  1003b7:	c3                   	ret    

001003b8 <timer_event>:

volatile uint32_t time_tick = 0;

void timer_event(void) {
  1003b8:	55                   	push   %ebp
  1003b9:	89 e5                	mov    %esp,%ebp
	time_tick ++;
  1003bb:	a1 40 24 26 00       	mov    0x262440,%eax
  1003c0:	83 c0 01             	add    $0x1,%eax
  1003c3:	a3 40 24 26 00       	mov    %eax,0x262440
}
  1003c8:	5d                   	pop    %ebp
  1003c9:	c3                   	ret    

001003ca <keyboard_event>:
static const char *keyboard_string[] = {"UP", "DOWN", "LEFT", "RIGHT",};

static int key_state[NR_KEYS];

void
keyboard_event(void) {
  1003ca:	55                   	push   %ebp
  1003cb:	89 e5                	mov    %esp,%ebp
  1003cd:	83 ec 18             	sub    $0x18,%esp
  1003d0:	c7 45 ec 60 00 00 00 	movl   $0x60,-0x14(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1003d7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1003da:	89 c2                	mov    %eax,%edx
  1003dc:	ec                   	in     (%dx),%al
  1003dd:	88 45 eb             	mov    %al,-0x15(%ebp)
	return data;
  1003e0:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
	int key_code = inb(0x60);
  1003e4:	0f b6 c0             	movzbl %al,%eax
  1003e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int i;
	//recent_keycode =dd key_code;
	//if(key_code == 0xf0) return;
	for (i = 0; i < NR_KEYS; i ++){
  1003ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1003f1:	e9 89 00 00 00       	jmp    10047f <keyboard_event+0xb5>
		if(key_code == keycode_array[i]) {
  1003f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003f9:	8b 04 85 b4 0b 26 00 	mov    0x260bb4(,%eax,4),%eax
  100400:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  100403:	75 54                	jne    100459 <keyboard_event+0x8f>
			switch(key_state[i]) {
  100405:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100408:	8b 04 85 44 24 26 00 	mov    0x262444(,%eax,4),%eax
  10040f:	83 f8 01             	cmp    $0x1,%eax
  100412:	74 20                	je     100434 <keyboard_event+0x6a>
  100414:	83 f8 01             	cmp    $0x1,%eax
  100417:	7f 06                	jg     10041f <keyboard_event+0x55>
  100419:	85 c0                	test   %eax,%eax
  10041b:	74 07                	je     100424 <keyboard_event+0x5a>
  10041d:	eb 25                	jmp    100444 <keyboard_event+0x7a>
  10041f:	83 f8 03             	cmp    $0x3,%eax
  100422:	7f 20                	jg     100444 <keyboard_event+0x7a>
				case KEY_STATE_EMPTY:
				case KEY_STATE_RELEASE: //key_state[i] = KEY_STATE_PRESS; break;
				case KEY_STATE_PRESS: key_state[i] = KEY_STATE_PRESS; break;
  100424:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100427:	c7 04 85 44 24 26 00 	movl   $0x3,0x262444(,%eax,4)
  10042e:	03 00 00 00 
  100432:	eb 23                	jmp    100457 <keyboard_event+0x8d>
				case KEY_STATE_WAIT_RELEASE: key_state[i] = KEY_STATE_WAIT_RELEASE; break;
  100434:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100437:	c7 04 85 44 24 26 00 	movl   $0x1,0x262444(,%eax,4)
  10043e:	01 00 00 00 
  100442:	eb 13                	jmp    100457 <keyboard_event+0x8d>
				default: assert(0); break;
  100444:	83 ec 08             	sub    $0x8,%esp
  100447:	6a 1f                	push   $0x1f
  100449:	68 d7 0b 26 00       	push   $0x260bd7
  10044e:	e8 06 09 00 00       	call   100d59 <abort>
  100453:	83 c4 10             	add    $0x10,%esp
  100456:	90                   	nop
			}
			/*
			if(key_state[i] == KEY_STATE_RELEASE || key_state[i] == KEY_STATE_EMPTY) key_state[i] = KEY_STATE_PRESS;
			else key_state[i] = KEY_STATE_WAIT_RELEASE; */
			break;
  100457:	eb 30                	jmp    100489 <keyboard_event+0xbf>
		}
		else if(key_code == keycode_array[i] + 0x80) {
  100459:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10045c:	8b 04 85 b4 0b 26 00 	mov    0x260bb4(,%eax,4),%eax
  100463:	83 e8 80             	sub    $0xffffff80,%eax
  100466:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  100469:	75 10                	jne    10047b <keyboard_event+0xb1>
			key_state[i] = KEY_STATE_RELEASE;
  10046b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10046e:	c7 04 85 44 24 26 00 	movl   $0x2,0x262444(,%eax,4)
  100475:	02 00 00 00 
			break;
  100479:	eb 0e                	jmp    100489 <keyboard_event+0xbf>
keyboard_event(void) {
	int key_code = inb(0x60);
	int i;
	//recent_keycode =dd key_code;
	//if(key_code == 0xf0) return;
	for (i = 0; i < NR_KEYS; i ++){
  10047b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10047f:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  100483:	0f 8e 6d ff ff ff    	jle    1003f6 <keyboard_event+0x2c>
	//Log("i==%d, NR_KEYS==%d, key_code==0x%x", i, NR_KEYS, key_code);
	//assert(i < NR_KEYS);
	//recent_keycode = key_code;
	//recent_key_index = i;
	//Log("K_SPACE==0x%x, mykey==0x%x", K_SPACE, key_code);
}
  100489:	c9                   	leave  
  10048a:	c3                   	ret    

0010048b <process_keys>:
	assert(index >= 0 && index < NR_KEYS);
	//recent_key_index = index;
	key_state[index] = KEY_STATE_EMPTY;
}

void process_keys() {
  10048b:	55                   	push   %ebp
  10048c:	89 e5                	mov    %esp,%ebp
  10048e:	83 ec 18             	sub    $0x18,%esp
}

static __inline void
cli(void)
{
	__asm __volatile("cli");
  100491:	fa                   	cli    
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i) {
  100492:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100499:	eb 6f                	jmp    10050a <process_keys+0x7f>
		switch(key_state[i]) {
  10049b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10049e:	8b 04 85 44 24 26 00 	mov    0x262444(,%eax,4),%eax
  1004a5:	83 f8 02             	cmp    $0x2,%eax
  1004a8:	74 32                	je     1004dc <process_keys+0x51>
  1004aa:	83 f8 03             	cmp    $0x3,%eax
  1004ad:	74 02                	je     1004b1 <process_keys+0x26>
					printk("key %s pressed\n", keyboard_string[i]);
					key_state[i] = KEY_STATE_WAIT_RELEASE; break; }
			case KEY_STATE_RELEASE: {
					printk("key %s released\n", keyboard_string[i]);
					key_state[i] = KEY_STATE_EMPTY; break; }
			default: break;
  1004af:	eb 55                	jmp    100506 <process_keys+0x7b>
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i) {
		switch(key_state[i]) {
			case KEY_STATE_PRESS: {
					printk("key %s pressed\n", keyboard_string[i]);
  1004b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004b4:	8b 04 85 08 24 26 00 	mov    0x262408(,%eax,4),%eax
  1004bb:	83 ec 08             	sub    $0x8,%esp
  1004be:	50                   	push   %eax
  1004bf:	68 f2 0b 26 00       	push   $0x260bf2
  1004c4:	e8 f4 06 00 00       	call   100bbd <printk>
  1004c9:	83 c4 10             	add    $0x10,%esp
					key_state[i] = KEY_STATE_WAIT_RELEASE; break; }
  1004cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004cf:	c7 04 85 44 24 26 00 	movl   $0x1,0x262444(,%eax,4)
  1004d6:	01 00 00 00 
  1004da:	eb 2a                	jmp    100506 <process_keys+0x7b>
			case KEY_STATE_RELEASE: {
					printk("key %s released\n", keyboard_string[i]);
  1004dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004df:	8b 04 85 08 24 26 00 	mov    0x262408(,%eax,4),%eax
  1004e6:	83 ec 08             	sub    $0x8,%esp
  1004e9:	50                   	push   %eax
  1004ea:	68 02 0c 26 00       	push   $0x260c02
  1004ef:	e8 c9 06 00 00       	call   100bbd <printk>
  1004f4:	83 c4 10             	add    $0x10,%esp
					key_state[i] = KEY_STATE_EMPTY; break; }
  1004f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004fa:	c7 04 85 44 24 26 00 	movl   $0x0,0x262444(,%eax,4)
  100501:	00 00 00 00 
  100505:	90                   	nop
}

void process_keys() {
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i) {
  100506:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  10050a:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
  10050e:	7e 8b                	jle    10049b <process_keys+0x10>

/* sti and cli --ANDSORA */
static __inline void
sti(void)
{
	__asm __volatile("sti");
  100510:	fb                   	sti    
					key_state[i] = KEY_STATE_EMPTY; break; }
			default: break;
		}
	}
	sti();
}
  100511:	c9                   	leave  
  100512:	c3                   	ret    

00100513 <INIT_WORK>:

void printk_test();

void game_main();

void INIT_WORK(){
  100513:	55                   	push   %ebp
  100514:	89 e5                	mov    %esp,%ebp
  100516:	83 ec 08             	sub    $0x8,%esp
	init_serial();
  100519:	e8 5a 08 00 00       	call   100d78 <init_serial>
	init_i8259();
  10051e:	e8 73 01 00 00       	call   100696 <init_i8259>
	init_timer();
  100523:	e8 32 fe ff ff       	call   10035a <init_timer>
	init_vmem();
  100528:	e8 55 fd ff ff       	call   100282 <init_vmem>
}
  10052d:	c9                   	leave  
  10052e:	c3                   	ret    

0010052f <TEST_WORK>:

void TEST_WORK(){
  10052f:	55                   	push   %ebp
  100530:	89 e5                	mov    %esp,%ebp
  100532:	83 ec 08             	sub    $0x8,%esp
	printk_test();
  100535:	e8 c6 fa ff ff       	call   100000 <printk_test>
}
  10053a:	c9                   	leave  
  10053b:	c3                   	ret    

0010053c <main>:

int main(void) {
  10053c:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  100540:	83 e4 f0             	and    $0xfffffff0,%esp
  100543:	ff 71 fc             	pushl  -0x4(%ecx)
  100546:	55                   	push   %ebp
  100547:	89 e5                	mov    %esp,%ebp
  100549:	51                   	push   %ecx
  10054a:	83 ec 04             	sub    $0x4,%esp
	INIT_WORK();
  10054d:	e8 c1 ff ff ff       	call   100513 <INIT_WORK>

	//TEST_WORK();
	printk("Here is main()\n");
  100552:	83 ec 0c             	sub    $0xc,%esp
  100555:	68 13 0c 26 00       	push   $0x260c13
  10055a:	e8 5e 06 00 00       	call   100bbd <printk>
  10055f:	83 c4 10             	add    $0x10,%esp

	game_main();
  100562:	e8 85 fd ff ff       	call   1002ec <game_main>

	panic("YOU shouldn't get here!\n");
  100567:	83 ec 0c             	sub    $0xc,%esp
  10056a:	68 23 0c 26 00       	push   $0x260c23
  10056f:	e8 49 06 00 00       	call   100bbd <printk>
  100574:	83 c4 10             	add    $0x10,%esp
  100577:	83 ec 08             	sub    $0x8,%esp
  10057a:	6a 20                	push   $0x20
  10057c:	68 3c 0c 26 00       	push   $0x260c3c
  100581:	e8 d3 07 00 00       	call   100d59 <abort>
  100586:	83 c4 10             	add    $0x10,%esp
	return 0;
  100589:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10058e:	8b 4d fc             	mov    -0x4(%ebp),%ecx
  100591:	c9                   	leave  
  100592:	8d 61 fc             	lea    -0x4(%ecx),%esp
  100595:	c3                   	ret    

00100596 <add_irq_handle>:
static struct IRQ_t *handles[NR_HARD_INTR]; // handles is an array of lists
static int handle_count = 0;

void do_syscall(TrapFrame *);

void add_irq_handle(int irq, void (*func)(void) ) {
  100596:	55                   	push   %ebp
  100597:	89 e5                	mov    %esp,%ebp
  100599:	83 ec 18             	sub    $0x18,%esp
	assert(irq < NR_HARD_INTR);
  10059c:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  1005a0:	7e 12                	jle    1005b4 <add_irq_handle+0x1e>
  1005a2:	83 ec 08             	sub    $0x8,%esp
  1005a5:	6a 13                	push   $0x13
  1005a7:	68 4a 0c 26 00       	push   $0x260c4a
  1005ac:	e8 a8 07 00 00       	call   100d59 <abort>
  1005b1:	83 c4 10             	add    $0x10,%esp
	assert(handle_count <= NR_IRQ_HANDLE);
  1005b4:	a1 c0 25 26 00       	mov    0x2625c0,%eax
  1005b9:	83 f8 20             	cmp    $0x20,%eax
  1005bc:	7e 12                	jle    1005d0 <add_irq_handle+0x3a>
  1005be:	83 ec 08             	sub    $0x8,%esp
  1005c1:	6a 14                	push   $0x14
  1005c3:	68 4a 0c 26 00       	push   $0x260c4a
  1005c8:	e8 8c 07 00 00       	call   100d59 <abort>
  1005cd:	83 c4 10             	add    $0x10,%esp

	struct IRQ_t *ptr;
	ptr = &handle_pool[handle_count ++]; // get a free handler
  1005d0:	a1 c0 25 26 00       	mov    0x2625c0,%eax
  1005d5:	8d 50 01             	lea    0x1(%eax),%edx
  1005d8:	89 15 c0 25 26 00    	mov    %edx,0x2625c0
  1005de:	c1 e0 03             	shl    $0x3,%eax
  1005e1:	05 80 24 26 00       	add    $0x262480,%eax
  1005e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	ptr->routine = func;
  1005e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005ec:	8b 55 0c             	mov    0xc(%ebp),%edx
  1005ef:	89 10                	mov    %edx,(%eax)
	ptr->next = handles[irq]; // insert into the linked list
  1005f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1005f4:	8b 14 85 80 25 26 00 	mov    0x262580(,%eax,4),%edx
  1005fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1005fe:	89 50 04             	mov    %edx,0x4(%eax)
	handles[irq] = ptr;
  100601:	8b 45 08             	mov    0x8(%ebp),%eax
  100604:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100607:	89 14 85 80 25 26 00 	mov    %edx,0x262580(,%eax,4)
}
  10060e:	c9                   	leave  
  10060f:	c3                   	ret    

00100610 <irq_handle>:

void irq_handle(TrapFrame *tf) {
  100610:	55                   	push   %ebp
  100611:	89 e5                	mov    %esp,%ebp
  100613:	83 ec 18             	sub    $0x18,%esp
	int irq = tf->irq;
  100616:	8b 45 08             	mov    0x8(%ebp),%eax
  100619:	8b 40 20             	mov    0x20(%eax),%eax
  10061c:	89 45 f0             	mov    %eax,-0x10(%ebp)

	if(irq < 1000) panic("Unhandled exception!\n");
  10061f:	81 7d f0 e7 03 00 00 	cmpl   $0x3e7,-0x10(%ebp)
  100626:	7f 24                	jg     10064c <irq_handle+0x3c>
  100628:	83 ec 0c             	sub    $0xc,%esp
  10062b:	68 62 0c 26 00       	push   $0x260c62
  100630:	e8 88 05 00 00       	call   100bbd <printk>
  100635:	83 c4 10             	add    $0x10,%esp
  100638:	83 ec 08             	sub    $0x8,%esp
  10063b:	6a 20                	push   $0x20
  10063d:	68 4a 0c 26 00       	push   $0x260c4a
  100642:	e8 12 07 00 00       	call   100d59 <abort>
  100647:	83 c4 10             	add    $0x10,%esp
  10064a:	eb 48                	jmp    100694 <irq_handle+0x84>
	else {
		int irq_id = irq - 1000;
  10064c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10064f:	2d e8 03 00 00       	sub    $0x3e8,%eax
  100654:	89 45 ec             	mov    %eax,-0x14(%ebp)
		assert(irq_id < NR_HARD_INTR);
  100657:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
  10065b:	7e 12                	jle    10066f <irq_handle+0x5f>
  10065d:	83 ec 08             	sub    $0x8,%esp
  100660:	6a 23                	push   $0x23
  100662:	68 4a 0c 26 00       	push   $0x260c4a
  100667:	e8 ed 06 00 00       	call   100d59 <abort>
  10066c:	83 c4 10             	add    $0x10,%esp
		struct IRQ_t *f = handles[irq_id];
  10066f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100672:	8b 04 85 80 25 26 00 	mov    0x262580(,%eax,4),%eax
  100679:	89 45 f4             	mov    %eax,-0xc(%ebp)

		while(f != NULL) {
  10067c:	eb 10                	jmp    10068e <irq_handle+0x7e>
			f->routine();
  10067e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100681:	8b 00                	mov    (%eax),%eax
  100683:	ff d0                	call   *%eax
			f = f->next;
  100685:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100688:	8b 40 04             	mov    0x4(%eax),%eax
  10068b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	else {
		int irq_id = irq - 1000;
		assert(irq_id < NR_HARD_INTR);
		struct IRQ_t *f = handles[irq_id];

		while(f != NULL) {
  10068e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100692:	75 ea                	jne    10067e <irq_handle+0x6e>
			f->routine();
			f = f->next;
		}
	}
}
  100694:	c9                   	leave  
  100695:	c3                   	ret    

00100696 <init_i8259>:
#define PORT_PIC_MASTER 0x20
#define PORT_PIC_SLAVE  0xA0
#define IRQ_OFFSET		0x20
#define IRQ_SLAVE       2

void init_i8259(void) {
  100696:	55                   	push   %ebp
  100697:	89 e5                	mov    %esp,%ebp
  100699:	83 ec 70             	sub    $0x70,%esp
  10069c:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
  1006a3:	c6 45 fb ff          	movb   $0xff,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  1006a7:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  1006ab:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1006ae:	ee                   	out    %al,(%dx)
  1006af:	c7 45 f4 a1 00 00 00 	movl   $0xa1,-0xc(%ebp)
  1006b6:	c6 45 f3 ff          	movb   $0xff,-0xd(%ebp)
  1006ba:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1006be:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1006c1:	ee                   	out    %al,(%dx)
  1006c2:	c7 45 ec 20 00 00 00 	movl   $0x20,-0x14(%ebp)
  1006c9:	c6 45 eb 11          	movb   $0x11,-0x15(%ebp)
  1006cd:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  1006d1:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1006d4:	ee                   	out    %al,(%dx)
  1006d5:	c7 45 e4 21 00 00 00 	movl   $0x21,-0x1c(%ebp)
  1006dc:	c6 45 e3 20          	movb   $0x20,-0x1d(%ebp)
  1006e0:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1006e4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1006e7:	ee                   	out    %al,(%dx)
  1006e8:	c7 45 dc 21 00 00 00 	movl   $0x21,-0x24(%ebp)
  1006ef:	c6 45 db 04          	movb   $0x4,-0x25(%ebp)
  1006f3:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  1006f7:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006fa:	ee                   	out    %al,(%dx)
  1006fb:	c7 45 d4 21 00 00 00 	movl   $0x21,-0x2c(%ebp)
  100702:	c6 45 d3 03          	movb   $0x3,-0x2d(%ebp)
  100706:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
  10070a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10070d:	ee                   	out    %al,(%dx)
  10070e:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
  100715:	c6 45 cb 11          	movb   $0x11,-0x35(%ebp)
  100719:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
  10071d:	8b 55 cc             	mov    -0x34(%ebp),%edx
  100720:	ee                   	out    %al,(%dx)
  100721:	c7 45 c4 a1 00 00 00 	movl   $0xa1,-0x3c(%ebp)
  100728:	c6 45 c3 28          	movb   $0x28,-0x3d(%ebp)
  10072c:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
  100730:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  100733:	ee                   	out    %al,(%dx)
  100734:	c7 45 bc a1 00 00 00 	movl   $0xa1,-0x44(%ebp)
  10073b:	c6 45 bb 02          	movb   $0x2,-0x45(%ebp)
  10073f:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
  100743:	8b 55 bc             	mov    -0x44(%ebp),%edx
  100746:	ee                   	out    %al,(%dx)
  100747:	c7 45 b4 a1 00 00 00 	movl   $0xa1,-0x4c(%ebp)
  10074e:	c6 45 b3 03          	movb   $0x3,-0x4d(%ebp)
  100752:	0f b6 45 b3          	movzbl -0x4d(%ebp),%eax
  100756:	8b 55 b4             	mov    -0x4c(%ebp),%edx
  100759:	ee                   	out    %al,(%dx)
  10075a:	c7 45 ac 20 00 00 00 	movl   $0x20,-0x54(%ebp)
  100761:	c6 45 ab 68          	movb   $0x68,-0x55(%ebp)
  100765:	0f b6 45 ab          	movzbl -0x55(%ebp),%eax
  100769:	8b 55 ac             	mov    -0x54(%ebp),%edx
  10076c:	ee                   	out    %al,(%dx)
  10076d:	c7 45 a4 20 00 00 00 	movl   $0x20,-0x5c(%ebp)
  100774:	c6 45 a3 0a          	movb   $0xa,-0x5d(%ebp)
  100778:	0f b6 45 a3          	movzbl -0x5d(%ebp),%eax
  10077c:	8b 55 a4             	mov    -0x5c(%ebp),%edx
  10077f:	ee                   	out    %al,(%dx)
  100780:	c7 45 9c a0 00 00 00 	movl   $0xa0,-0x64(%ebp)
  100787:	c6 45 9b 68          	movb   $0x68,-0x65(%ebp)
  10078b:	0f b6 45 9b          	movzbl -0x65(%ebp),%eax
  10078f:	8b 55 9c             	mov    -0x64(%ebp),%edx
  100792:	ee                   	out    %al,(%dx)
  100793:	c7 45 94 a0 00 00 00 	movl   $0xa0,-0x6c(%ebp)
  10079a:	c6 45 93 0a          	movb   $0xa,-0x6d(%ebp)
  10079e:	0f b6 45 93          	movzbl -0x6d(%ebp),%eax
  1007a2:	8b 55 94             	mov    -0x6c(%ebp),%edx
  1007a5:	ee                   	out    %al,(%dx)
	outb(PORT_PIC_SLAVE + 1, 0x3); // Modified part
	outb(PORT_PIC_MASTER, 0x68);
	outb(PORT_PIC_MASTER, 0x0A);
	outb(PORT_PIC_SLAVE, 0x68);
	outb(PORT_PIC_SLAVE, 0x0A);
}
  1007a6:	c9                   	leave  
  1007a7:	c3                   	ret    

001007a8 <set_intr>:

/* Each entry of the IDT is either an interrupt gate, or a trap gate */
static Gatedesc idt[NR_IRQ];

/* Setup a interrupt gate for interrupt handler. */
static void set_intr(Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
  1007a8:	55                   	push   %ebp
  1007a9:	89 e5                	mov    %esp,%ebp
	ptr->gd_off_15_0 = offset & 0xFFFF;
  1007ab:	8b 45 10             	mov    0x10(%ebp),%eax
  1007ae:	89 c2                	mov    %eax,%edx
  1007b0:	8b 45 08             	mov    0x8(%ebp),%eax
  1007b3:	66 89 10             	mov    %dx,(%eax)
	ptr->gd_sel = selector;
  1007b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007b9:	89 c2                	mov    %eax,%edx
  1007bb:	8b 45 08             	mov    0x8(%ebp),%eax
  1007be:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->gd_args = 0;
  1007c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1007c5:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  1007c9:	83 e2 e0             	and    $0xffffffe0,%edx
  1007cc:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_rsv1 = 0;
  1007cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1007d2:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  1007d6:	83 e2 1f             	and    $0x1f,%edx
  1007d9:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_type = INTERRUPT_GATE_32;
  1007dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1007df:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  1007e3:	83 e2 f0             	and    $0xfffffff0,%edx
  1007e6:	83 ca 0e             	or     $0xe,%edx
  1007e9:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_s = 0;
  1007ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1007ef:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  1007f3:	83 e2 ef             	and    $0xffffffef,%edx
  1007f6:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_dpl = dpl;
  1007f9:	8b 45 14             	mov    0x14(%ebp),%eax
  1007fc:	83 e0 03             	and    $0x3,%eax
  1007ff:	89 c2                	mov    %eax,%edx
  100801:	8b 45 08             	mov    0x8(%ebp),%eax
  100804:	83 e2 03             	and    $0x3,%edx
  100807:	89 d1                	mov    %edx,%ecx
  100809:	c1 e1 05             	shl    $0x5,%ecx
  10080c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  100810:	83 e2 9f             	and    $0xffffff9f,%edx
  100813:	09 ca                	or     %ecx,%edx
  100815:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_p = 1;
  100818:	8b 45 08             	mov    0x8(%ebp),%eax
  10081b:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  10081f:	83 ca 80             	or     $0xffffff80,%edx
  100822:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_off_31_16 = (offset >> 16) & 0xFFFF;
  100825:	8b 45 10             	mov    0x10(%ebp),%eax
  100828:	c1 e8 10             	shr    $0x10,%eax
  10082b:	89 c2                	mov    %eax,%edx
  10082d:	8b 45 08             	mov    0x8(%ebp),%eax
  100830:	66 89 50 06          	mov    %dx,0x6(%eax)
}
  100834:	5d                   	pop    %ebp
  100835:	c3                   	ret    

00100836 <set_trap>:

/* Setup a trap gate for cpu exception. */
static void set_trap(Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
  100836:	55                   	push   %ebp
  100837:	89 e5                	mov    %esp,%ebp
	ptr->gd_off_15_0 = offset & 0xFFFF;
  100839:	8b 45 10             	mov    0x10(%ebp),%eax
  10083c:	89 c2                	mov    %eax,%edx
  10083e:	8b 45 08             	mov    0x8(%ebp),%eax
  100841:	66 89 10             	mov    %dx,(%eax)
	ptr->gd_sel = selector;
  100844:	8b 45 0c             	mov    0xc(%ebp),%eax
  100847:	89 c2                	mov    %eax,%edx
  100849:	8b 45 08             	mov    0x8(%ebp),%eax
  10084c:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->gd_args = 0;
  100850:	8b 45 08             	mov    0x8(%ebp),%eax
  100853:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  100857:	83 e2 e0             	and    $0xffffffe0,%edx
  10085a:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_rsv1 = 0;
  10085d:	8b 45 08             	mov    0x8(%ebp),%eax
  100860:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  100864:	83 e2 1f             	and    $0x1f,%edx
  100867:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_type = TRAP_GATE_32;
  10086a:	8b 45 08             	mov    0x8(%ebp),%eax
  10086d:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  100871:	83 ca 0f             	or     $0xf,%edx
  100874:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_s = 0;
  100877:	8b 45 08             	mov    0x8(%ebp),%eax
  10087a:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  10087e:	83 e2 ef             	and    $0xffffffef,%edx
  100881:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_dpl = dpl;
  100884:	8b 45 14             	mov    0x14(%ebp),%eax
  100887:	83 e0 03             	and    $0x3,%eax
  10088a:	89 c2                	mov    %eax,%edx
  10088c:	8b 45 08             	mov    0x8(%ebp),%eax
  10088f:	83 e2 03             	and    $0x3,%edx
  100892:	89 d1                	mov    %edx,%ecx
  100894:	c1 e1 05             	shl    $0x5,%ecx
  100897:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  10089b:	83 e2 9f             	and    $0xffffff9f,%edx
  10089e:	09 ca                	or     %ecx,%edx
  1008a0:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_p = 1;
  1008a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1008a6:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  1008aa:	83 ca 80             	or     $0xffffff80,%edx
  1008ad:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_off_31_16 = (offset >> 16) & 0xFFFF;
  1008b0:	8b 45 10             	mov    0x10(%ebp),%eax
  1008b3:	c1 e8 10             	shr    $0x10,%eax
  1008b6:	89 c2                	mov    %eax,%edx
  1008b8:	8b 45 08             	mov    0x8(%ebp),%eax
  1008bb:	66 89 50 06          	mov    %dx,0x6(%eax)
}
  1008bf:	5d                   	pop    %ebp
  1008c0:	c3                   	ret    

001008c1 <write_idtr>:

static void write_idtr(void *addr, uint32_t size) {
  1008c1:	55                   	push   %ebp
  1008c2:	89 e5                	mov    %esp,%ebp
  1008c4:	83 ec 10             	sub    $0x10,%esp
	static volatile uint16_t data[3];
	data[0] = size - 1;
  1008c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008ca:	83 e8 01             	sub    $0x1,%eax
  1008cd:	66 a3 00 2e 26 00    	mov    %ax,0x262e00
	data[1] = (uint32_t)addr;
  1008d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1008d6:	66 a3 02 2e 26 00    	mov    %ax,0x262e02
	data[2] = ((uint32_t)addr >> 16);
  1008dc:	8b 45 08             	mov    0x8(%ebp),%eax
  1008df:	c1 e8 10             	shr    $0x10,%eax
  1008e2:	66 a3 04 2e 26 00    	mov    %ax,0x262e04
  1008e8:	c7 45 fc 00 2e 26 00 	movl   $0x262e00,-0x4(%ebp)
}

static __inline void
lidt(void *p)
{
	__asm __volatile("lidt (%0)" : : "r" (p));
  1008ef:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1008f2:	0f 01 18             	lidtl  (%eax)
	lidt((void*)data);
}
  1008f5:	c9                   	leave  
  1008f6:	c3                   	ret    

001008f7 <init_idt>:
void vec14();
void vecsys();

void irq_empty();

void init_idt() {
  1008f7:	55                   	push   %ebp
  1008f8:	89 e5                	mov    %esp,%ebp
  1008fa:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < NR_IRQ; i ++) {
  1008fd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100904:	eb 22                	jmp    100928 <init_idt+0x31>
		set_trap(idt + i, SEG_KERNEL_CODE << 3, (uint32_t)irq_empty, DPL_KERNEL);
  100906:	ba a5 0b 10 00       	mov    $0x100ba5,%edx
  10090b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10090e:	c1 e0 03             	shl    $0x3,%eax
  100911:	05 00 26 26 00       	add    $0x262600,%eax
  100916:	6a 00                	push   $0x0
  100918:	52                   	push   %edx
  100919:	6a 08                	push   $0x8
  10091b:	50                   	push   %eax
  10091c:	e8 15 ff ff ff       	call   100836 <set_trap>
  100921:	83 c4 10             	add    $0x10,%esp

void irq_empty();

void init_idt() {
	int i;
	for (i = 0; i < NR_IRQ; i ++) {
  100924:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100928:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10092f:	7e d5                	jle    100906 <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE << 3, (uint32_t)irq_empty, DPL_KERNEL);
	}
	set_trap(idt + 0, SEG_KERNEL_CODE << 3, (uint32_t)vec0, DPL_KERNEL);
  100931:	b8 fa 0a 10 00       	mov    $0x100afa,%eax
  100936:	6a 00                	push   $0x0
  100938:	50                   	push   %eax
  100939:	6a 08                	push   $0x8
  10093b:	68 00 26 26 00       	push   $0x262600
  100940:	e8 f1 fe ff ff       	call   100836 <set_trap>
  100945:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 1, SEG_KERNEL_CODE << 3, (uint32_t)vec1, DPL_KERNEL);
  100948:	b8 03 0b 10 00       	mov    $0x100b03,%eax
  10094d:	6a 00                	push   $0x0
  10094f:	50                   	push   %eax
  100950:	6a 08                	push   $0x8
  100952:	68 08 26 26 00       	push   $0x262608
  100957:	e8 da fe ff ff       	call   100836 <set_trap>
  10095c:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 2, SEG_KERNEL_CODE << 3, (uint32_t)vec2, DPL_KERNEL);
  10095f:	b8 0c 0b 10 00       	mov    $0x100b0c,%eax
  100964:	6a 00                	push   $0x0
  100966:	50                   	push   %eax
  100967:	6a 08                	push   $0x8
  100969:	68 10 26 26 00       	push   $0x262610
  10096e:	e8 c3 fe ff ff       	call   100836 <set_trap>
  100973:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 3, SEG_KERNEL_CODE << 3, (uint32_t)vec3, DPL_KERNEL);
  100976:	b8 15 0b 10 00       	mov    $0x100b15,%eax
  10097b:	6a 00                	push   $0x0
  10097d:	50                   	push   %eax
  10097e:	6a 08                	push   $0x8
  100980:	68 18 26 26 00       	push   $0x262618
  100985:	e8 ac fe ff ff       	call   100836 <set_trap>
  10098a:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 4, SEG_KERNEL_CODE << 3, (uint32_t)vec4, DPL_KERNEL);
  10098d:	b8 1e 0b 10 00       	mov    $0x100b1e,%eax
  100992:	6a 00                	push   $0x0
  100994:	50                   	push   %eax
  100995:	6a 08                	push   $0x8
  100997:	68 20 26 26 00       	push   $0x262620
  10099c:	e8 95 fe ff ff       	call   100836 <set_trap>
  1009a1:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 5, SEG_KERNEL_CODE << 3, (uint32_t)vec5, DPL_KERNEL);
  1009a4:	b8 27 0b 10 00       	mov    $0x100b27,%eax
  1009a9:	6a 00                	push   $0x0
  1009ab:	50                   	push   %eax
  1009ac:	6a 08                	push   $0x8
  1009ae:	68 28 26 26 00       	push   $0x262628
  1009b3:	e8 7e fe ff ff       	call   100836 <set_trap>
  1009b8:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 6, SEG_KERNEL_CODE << 3, (uint32_t)vec6, DPL_KERNEL);
  1009bb:	b8 30 0b 10 00       	mov    $0x100b30,%eax
  1009c0:	6a 00                	push   $0x0
  1009c2:	50                   	push   %eax
  1009c3:	6a 08                	push   $0x8
  1009c5:	68 30 26 26 00       	push   $0x262630
  1009ca:	e8 67 fe ff ff       	call   100836 <set_trap>
  1009cf:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 7, SEG_KERNEL_CODE << 3, (uint32_t)vec7, DPL_KERNEL);
  1009d2:	b8 39 0b 10 00       	mov    $0x100b39,%eax
  1009d7:	6a 00                	push   $0x0
  1009d9:	50                   	push   %eax
  1009da:	6a 08                	push   $0x8
  1009dc:	68 38 26 26 00       	push   $0x262638
  1009e1:	e8 50 fe ff ff       	call   100836 <set_trap>
  1009e6:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 8, SEG_KERNEL_CODE << 3, (uint32_t)vec8, DPL_KERNEL);
  1009e9:	b8 42 0b 10 00       	mov    $0x100b42,%eax
  1009ee:	6a 00                	push   $0x0
  1009f0:	50                   	push   %eax
  1009f1:	6a 08                	push   $0x8
  1009f3:	68 40 26 26 00       	push   $0x262640
  1009f8:	e8 39 fe ff ff       	call   100836 <set_trap>
  1009fd:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 9, SEG_KERNEL_CODE << 3, (uint32_t)vec9, DPL_KERNEL);
  100a00:	b8 49 0b 10 00       	mov    $0x100b49,%eax
  100a05:	6a 00                	push   $0x0
  100a07:	50                   	push   %eax
  100a08:	6a 08                	push   $0x8
  100a0a:	68 48 26 26 00       	push   $0x262648
  100a0f:	e8 22 fe ff ff       	call   100836 <set_trap>
  100a14:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 10, SEG_KERNEL_CODE << 3, (uint32_t)vec10, DPL_KERNEL);
  100a17:	b8 52 0b 10 00       	mov    $0x100b52,%eax
  100a1c:	6a 00                	push   $0x0
  100a1e:	50                   	push   %eax
  100a1f:	6a 08                	push   $0x8
  100a21:	68 50 26 26 00       	push   $0x262650
  100a26:	e8 0b fe ff ff       	call   100836 <set_trap>
  100a2b:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 11, SEG_KERNEL_CODE << 3, (uint32_t)vec11, DPL_KERNEL);
  100a2e:	b8 59 0b 10 00       	mov    $0x100b59,%eax
  100a33:	6a 00                	push   $0x0
  100a35:	50                   	push   %eax
  100a36:	6a 08                	push   $0x8
  100a38:	68 58 26 26 00       	push   $0x262658
  100a3d:	e8 f4 fd ff ff       	call   100836 <set_trap>
  100a42:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 12, SEG_KERNEL_CODE << 3, (uint32_t)vec12, DPL_KERNEL);
  100a45:	b8 60 0b 10 00       	mov    $0x100b60,%eax
  100a4a:	6a 00                	push   $0x0
  100a4c:	50                   	push   %eax
  100a4d:	6a 08                	push   $0x8
  100a4f:	68 60 26 26 00       	push   $0x262660
  100a54:	e8 dd fd ff ff       	call   100836 <set_trap>
  100a59:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 13, SEG_KERNEL_CODE << 3, (uint32_t)vec13, DPL_KERNEL);
  100a5c:	b8 67 0b 10 00       	mov    $0x100b67,%eax
  100a61:	6a 00                	push   $0x0
  100a63:	50                   	push   %eax
  100a64:	6a 08                	push   $0x8
  100a66:	68 68 26 26 00       	push   $0x262668
  100a6b:	e8 c6 fd ff ff       	call   100836 <set_trap>
  100a70:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 14, SEG_KERNEL_CODE << 3, (uint32_t)vec14, DPL_KERNEL);
  100a73:	b8 6e 0b 10 00       	mov    $0x100b6e,%eax
  100a78:	6a 00                	push   $0x0
  100a7a:	50                   	push   %eax
  100a7b:	6a 08                	push   $0x8
  100a7d:	68 70 26 26 00       	push   $0x262670
  100a82:	e8 af fd ff ff       	call   100836 <set_trap>
  100a87:	83 c4 10             	add    $0x10,%esp

	/* the system call 0x80 */
	set_trap(idt + 0x80, SEG_KERNEL_CODE << 3, (uint32_t)vecsys, DPL_USER);
  100a8a:	b8 75 0b 10 00       	mov    $0x100b75,%eax
  100a8f:	6a 03                	push   $0x3
  100a91:	50                   	push   %eax
  100a92:	6a 08                	push   $0x8
  100a94:	68 00 2a 26 00       	push   $0x262a00
  100a99:	e8 98 fd ff ff       	call   100836 <set_trap>
  100a9e:	83 c4 10             	add    $0x10,%esp

	set_intr(idt+32 + 0, SEG_KERNEL_CODE << 3, (uint32_t)irq0, DPL_KERNEL);
  100aa1:	b8 81 0b 10 00       	mov    $0x100b81,%eax
  100aa6:	6a 00                	push   $0x0
  100aa8:	50                   	push   %eax
  100aa9:	6a 08                	push   $0x8
  100aab:	68 00 27 26 00       	push   $0x262700
  100ab0:	e8 f3 fc ff ff       	call   1007a8 <set_intr>
  100ab5:	83 c4 10             	add    $0x10,%esp
	set_intr(idt+32 + 1, SEG_KERNEL_CODE << 3, (uint32_t)irq1, DPL_KERNEL);
  100ab8:	b8 8d 0b 10 00       	mov    $0x100b8d,%eax
  100abd:	6a 00                	push   $0x0
  100abf:	50                   	push   %eax
  100ac0:	6a 08                	push   $0x8
  100ac2:	68 08 27 26 00       	push   $0x262708
  100ac7:	e8 dc fc ff ff       	call   1007a8 <set_intr>
  100acc:	83 c4 10             	add    $0x10,%esp
	set_intr(idt+32 + 14, SEG_KERNEL_CODE << 3, (uint32_t)irq14, DPL_KERNEL);
  100acf:	b8 99 0b 10 00       	mov    $0x100b99,%eax
  100ad4:	6a 00                	push   $0x0
  100ad6:	50                   	push   %eax
  100ad7:	6a 08                	push   $0x8
  100ad9:	68 70 27 26 00       	push   $0x262770
  100ade:	e8 c5 fc ff ff       	call   1007a8 <set_intr>
  100ae3:	83 c4 10             	add    $0x10,%esp

	/* the ``idt'' is its virtual address */
	write_idtr(idt, sizeof(idt));
  100ae6:	68 00 08 00 00       	push   $0x800
  100aeb:	68 00 26 26 00       	push   $0x262600
  100af0:	e8 cc fd ff ff       	call   1008c1 <write_idtr>
  100af5:	83 c4 08             	add    $0x8,%esp
}
  100af8:	c9                   	leave  
  100af9:	c3                   	ret    

00100afa <vec0>:
#----|-----entry------|-errorcode-|-----id-----|---handler---|
.globl vec0;    vec0:   pushl $0;  pushl    $0; jmp asm_do_irq
  100afa:	6a 00                	push   $0x0
  100afc:	6a 00                	push   $0x0
  100afe:	e9 ab 00 00 00       	jmp    100bae <asm_do_irq>

00100b03 <vec1>:
.globl vec1;    vec1:   pushl $0;  pushl    $1; jmp asm_do_irq
  100b03:	6a 00                	push   $0x0
  100b05:	6a 01                	push   $0x1
  100b07:	e9 a2 00 00 00       	jmp    100bae <asm_do_irq>

00100b0c <vec2>:
.globl vec2;    vec2:   pushl $0;  pushl    $2; jmp asm_do_irq
  100b0c:	6a 00                	push   $0x0
  100b0e:	6a 02                	push   $0x2
  100b10:	e9 99 00 00 00       	jmp    100bae <asm_do_irq>

00100b15 <vec3>:
.globl vec3;    vec3:   pushl $0;  pushl    $3; jmp asm_do_irq
  100b15:	6a 00                	push   $0x0
  100b17:	6a 03                	push   $0x3
  100b19:	e9 90 00 00 00       	jmp    100bae <asm_do_irq>

00100b1e <vec4>:
.globl vec4;    vec4:   pushl $0;  pushl    $4; jmp asm_do_irq
  100b1e:	6a 00                	push   $0x0
  100b20:	6a 04                	push   $0x4
  100b22:	e9 87 00 00 00       	jmp    100bae <asm_do_irq>

00100b27 <vec5>:
.globl vec5;    vec5:   pushl $0;  pushl    $5; jmp asm_do_irq
  100b27:	6a 00                	push   $0x0
  100b29:	6a 05                	push   $0x5
  100b2b:	e9 7e 00 00 00       	jmp    100bae <asm_do_irq>

00100b30 <vec6>:
.globl vec6;    vec6:   pushl $0;  pushl    $6; jmp asm_do_irq
  100b30:	6a 00                	push   $0x0
  100b32:	6a 06                	push   $0x6
  100b34:	e9 75 00 00 00       	jmp    100bae <asm_do_irq>

00100b39 <vec7>:
.globl vec7;    vec7:   pushl $0;  pushl    $7; jmp asm_do_irq
  100b39:	6a 00                	push   $0x0
  100b3b:	6a 07                	push   $0x7
  100b3d:	e9 6c 00 00 00       	jmp    100bae <asm_do_irq>

00100b42 <vec8>:
.globl vec8;    vec8:              pushl    $8; jmp asm_do_irq
  100b42:	6a 08                	push   $0x8
  100b44:	e9 65 00 00 00       	jmp    100bae <asm_do_irq>

00100b49 <vec9>:
.globl vec9;    vec9:   pushl $0;  pushl    $9; jmp asm_do_irq
  100b49:	6a 00                	push   $0x0
  100b4b:	6a 09                	push   $0x9
  100b4d:	e9 5c 00 00 00       	jmp    100bae <asm_do_irq>

00100b52 <vec10>:
.globl vec10;   vec10:             pushl   $10; jmp asm_do_irq
  100b52:	6a 0a                	push   $0xa
  100b54:	e9 55 00 00 00       	jmp    100bae <asm_do_irq>

00100b59 <vec11>:
.globl vec11;   vec11:             pushl   $11; jmp asm_do_irq
  100b59:	6a 0b                	push   $0xb
  100b5b:	e9 4e 00 00 00       	jmp    100bae <asm_do_irq>

00100b60 <vec12>:
.globl vec12;   vec12:             pushl   $12; jmp asm_do_irq
  100b60:	6a 0c                	push   $0xc
  100b62:	e9 47 00 00 00       	jmp    100bae <asm_do_irq>

00100b67 <vec13>:
.globl vec13;   vec13:             pushl   $13; jmp asm_do_irq
  100b67:	6a 0d                	push   $0xd
  100b69:	e9 40 00 00 00       	jmp    100bae <asm_do_irq>

00100b6e <vec14>:
.globl vec14;   vec14:             pushl   $14; jmp asm_do_irq
  100b6e:	6a 0e                	push   $0xe
  100b70:	e9 39 00 00 00       	jmp    100bae <asm_do_irq>

00100b75 <vecsys>:

.globl vecsys; vecsys:  pushl $0;  pushl $0x80; jmp asm_do_irq
  100b75:	6a 00                	push   $0x0
  100b77:	68 80 00 00 00       	push   $0x80
  100b7c:	e9 2d 00 00 00       	jmp    100bae <asm_do_irq>

00100b81 <irq0>:

.globl irq0;     irq0:  pushl $0;  pushl $1000; jmp asm_do_irq
  100b81:	6a 00                	push   $0x0
  100b83:	68 e8 03 00 00       	push   $0x3e8
  100b88:	e9 21 00 00 00       	jmp    100bae <asm_do_irq>

00100b8d <irq1>:
.globl irq1;     irq1:  pushl $0;  pushl $1001; jmp asm_do_irq
  100b8d:	6a 00                	push   $0x0
  100b8f:	68 e9 03 00 00       	push   $0x3e9
  100b94:	e9 15 00 00 00       	jmp    100bae <asm_do_irq>

00100b99 <irq14>:
.globl irq14;   irq14:  pushl $0;  pushl $1014; jmp asm_do_irq
  100b99:	6a 00                	push   $0x0
  100b9b:	68 f6 03 00 00       	push   $0x3f6
  100ba0:	e9 09 00 00 00       	jmp    100bae <asm_do_irq>

00100ba5 <irq_empty>:
.globl irq_empty;
			irq_empty:	pushl $0;  pushl   $-1; jmp asm_do_irq
  100ba5:	6a 00                	push   $0x0
  100ba7:	6a ff                	push   $0xffffffff
  100ba9:	e9 00 00 00 00       	jmp    100bae <asm_do_irq>

00100bae <asm_do_irq>:

# The follow code is *VERY* important for interrupts and exceptions handling.
# You should make yourself understand it clearly.

asm_do_irq:
	pushal
  100bae:	60                   	pusha  

	pushl %esp		# ???
  100baf:	54                   	push   %esp
	call irq_handle
  100bb0:	e8 5b fa ff ff       	call   100610 <irq_handle>
	
	addl $4, %esp
  100bb5:	83 c4 04             	add    $0x4,%esp
	popal
  100bb8:	61                   	popa   
	addl $8, %esp
  100bb9:	83 c4 08             	add    $0x8,%esp
	iret
  100bbc:	cf                   	iret   

00100bbd <printk>:
void serial_printc(char);

void out_num(unsigned, unsigned, bool);
void out_string(char*);

int printk(const char *fmt, ...){
  100bbd:	55                   	push   %ebp
  100bbe:	89 e5                	mov    %esp,%ebp
  100bc0:	83 ec 18             	sub    $0x18,%esp
	//char ch = *(unsigned char *)fmt;
	va_list ap;

	va_start(ap, fmt);
  100bc3:	8d 45 0c             	lea    0xc(%ebp),%eax
  100bc6:	89 45 f4             	mov    %eax,-0xc(%ebp)

	while(*fmt){
  100bc9:	e9 c0 00 00 00       	jmp    100c8e <printk+0xd1>
		if(*fmt != '%'){
  100bce:	8b 45 08             	mov    0x8(%ebp),%eax
  100bd1:	0f b6 00             	movzbl (%eax),%eax
  100bd4:	3c 25                	cmp    $0x25,%al
  100bd6:	74 1a                	je     100bf2 <printk+0x35>
			serial_printc(*fmt);
  100bd8:	8b 45 08             	mov    0x8(%ebp),%eax
  100bdb:	0f b6 00             	movzbl (%eax),%eax
  100bde:	0f be c0             	movsbl %al,%eax
  100be1:	83 ec 0c             	sub    $0xc,%esp
  100be4:	50                   	push   %eax
  100be5:	e8 3d 02 00 00       	call   100e27 <serial_printc>
  100bea:	83 c4 10             	add    $0x10,%esp
  100bed:	e9 98 00 00 00       	jmp    100c8a <printk+0xcd>
		}
		else {
			fmt++;
  100bf2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
			switch(*fmt){
  100bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf9:	0f b6 00             	movzbl (%eax),%eax
  100bfc:	0f be c0             	movsbl %al,%eax
  100bff:	83 f8 64             	cmp    $0x64,%eax
  100c02:	74 18                	je     100c1c <printk+0x5f>
  100c04:	83 f8 64             	cmp    $0x64,%eax
  100c07:	7f 07                	jg     100c10 <printk+0x53>
  100c09:	83 f8 63             	cmp    $0x63,%eax
  100c0c:	74 48                	je     100c56 <printk+0x99>
				case 'd': out_num( va_arg(ap, int), 10, 1); break;
				case 'x': out_num( va_arg(ap, unsigned int), 16, 0); break;
				case 'c': serial_printc(va_arg(ap, unsigned int)); break;
				case 's': out_string(va_arg(ap, char*)); break;
				default: break;
  100c0e:	eb 7a                	jmp    100c8a <printk+0xcd>
		if(*fmt != '%'){
			serial_printc(*fmt);
		}
		else {
			fmt++;
			switch(*fmt){
  100c10:	83 f8 73             	cmp    $0x73,%eax
  100c13:	74 5d                	je     100c72 <printk+0xb5>
  100c15:	83 f8 78             	cmp    $0x78,%eax
  100c18:	74 1f                	je     100c39 <printk+0x7c>
				case 'd': out_num( va_arg(ap, int), 10, 1); break;
				case 'x': out_num( va_arg(ap, unsigned int), 16, 0); break;
				case 'c': serial_printc(va_arg(ap, unsigned int)); break;
				case 's': out_string(va_arg(ap, char*)); break;
				default: break;
  100c1a:	eb 6e                	jmp    100c8a <printk+0xcd>
			serial_printc(*fmt);
		}
		else {
			fmt++;
			switch(*fmt){
				case 'd': out_num( va_arg(ap, int), 10, 1); break;
  100c1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c1f:	8d 50 04             	lea    0x4(%eax),%edx
  100c22:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100c25:	8b 00                	mov    (%eax),%eax
  100c27:	83 ec 04             	sub    $0x4,%esp
  100c2a:	6a 01                	push   $0x1
  100c2c:	6a 0a                	push   $0xa
  100c2e:	50                   	push   %eax
  100c2f:	e8 bc 00 00 00       	call   100cf0 <out_num>
  100c34:	83 c4 10             	add    $0x10,%esp
  100c37:	eb 51                	jmp    100c8a <printk+0xcd>
				case 'x': out_num( va_arg(ap, unsigned int), 16, 0); break;
  100c39:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c3c:	8d 50 04             	lea    0x4(%eax),%edx
  100c3f:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100c42:	8b 00                	mov    (%eax),%eax
  100c44:	83 ec 04             	sub    $0x4,%esp
  100c47:	6a 00                	push   $0x0
  100c49:	6a 10                	push   $0x10
  100c4b:	50                   	push   %eax
  100c4c:	e8 9f 00 00 00       	call   100cf0 <out_num>
  100c51:	83 c4 10             	add    $0x10,%esp
  100c54:	eb 34                	jmp    100c8a <printk+0xcd>
				case 'c': serial_printc(va_arg(ap, unsigned int)); break;
  100c56:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c59:	8d 50 04             	lea    0x4(%eax),%edx
  100c5c:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100c5f:	8b 00                	mov    (%eax),%eax
  100c61:	0f be c0             	movsbl %al,%eax
  100c64:	83 ec 0c             	sub    $0xc,%esp
  100c67:	50                   	push   %eax
  100c68:	e8 ba 01 00 00       	call   100e27 <serial_printc>
  100c6d:	83 c4 10             	add    $0x10,%esp
  100c70:	eb 18                	jmp    100c8a <printk+0xcd>
				case 's': out_string(va_arg(ap, char*)); break;
  100c72:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c75:	8d 50 04             	lea    0x4(%eax),%edx
  100c78:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100c7b:	8b 00                	mov    (%eax),%eax
  100c7d:	83 ec 0c             	sub    $0xc,%esp
  100c80:	50                   	push   %eax
  100c81:	e8 a6 00 00 00       	call   100d2c <out_string>
  100c86:	83 c4 10             	add    $0x10,%esp
  100c89:	90                   	nop
				default: break;
			}
		}
		fmt++;
  100c8a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
	//char ch = *(unsigned char *)fmt;
	va_list ap;

	va_start(ap, fmt);

	while(*fmt){
  100c8e:	8b 45 08             	mov    0x8(%ebp),%eax
  100c91:	0f b6 00             	movzbl (%eax),%eax
  100c94:	84 c0                	test   %al,%al
  100c96:	0f 85 32 ff ff ff    	jne    100bce <printk+0x11>
		fmt++;
	}

	va_end(ap);

	return 0;
  100c9c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ca1:	c9                   	leave  
  100ca2:	c3                   	ret    

00100ca3 <rec_out_num>:

void rec_out_num(unsigned int x, unsigned int base){
  100ca3:	55                   	push   %ebp
  100ca4:	89 e5                	mov    %esp,%ebp
  100ca6:	83 ec 08             	sub    $0x8,%esp
	if(x >= base){
  100ca9:	8b 45 08             	mov    0x8(%ebp),%eax
  100cac:	3b 45 0c             	cmp    0xc(%ebp),%eax
  100caf:	72 1a                	jb     100ccb <rec_out_num+0x28>
		rec_out_num(x/base, base);
  100cb1:	8b 45 08             	mov    0x8(%ebp),%eax
  100cb4:	ba 00 00 00 00       	mov    $0x0,%edx
  100cb9:	f7 75 0c             	divl   0xc(%ebp)
  100cbc:	83 ec 08             	sub    $0x8,%esp
  100cbf:	ff 75 0c             	pushl  0xc(%ebp)
  100cc2:	50                   	push   %eax
  100cc3:	e8 db ff ff ff       	call   100ca3 <rec_out_num>
  100cc8:	83 c4 10             	add    $0x10,%esp
	}
	serial_printc("0123456789abcdef"[x%base]);
  100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  100cce:	ba 00 00 00 00       	mov    $0x0,%edx
  100cd3:	f7 75 0c             	divl   0xc(%ebp)
  100cd6:	89 d0                	mov    %edx,%eax
  100cd8:	0f b6 80 78 0c 26 00 	movzbl 0x260c78(%eax),%eax
  100cdf:	0f be c0             	movsbl %al,%eax
  100ce2:	83 ec 0c             	sub    $0xc,%esp
  100ce5:	50                   	push   %eax
  100ce6:	e8 3c 01 00 00       	call   100e27 <serial_printc>
  100ceb:	83 c4 10             	add    $0x10,%esp
}
  100cee:	c9                   	leave  
  100cef:	c3                   	ret    

00100cf0 <out_num>:

void out_num(unsigned int x, unsigned int base, bool SIGN){
  100cf0:	55                   	push   %ebp
  100cf1:	89 e5                	mov    %esp,%ebp
  100cf3:	83 ec 18             	sub    $0x18,%esp
  100cf6:	8b 45 10             	mov    0x10(%ebp),%eax
  100cf9:	88 45 f4             	mov    %al,-0xc(%ebp)
	if( SIGN && ((int)x)<0 ){
  100cfc:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
  100d00:	74 17                	je     100d19 <out_num+0x29>
  100d02:	8b 45 08             	mov    0x8(%ebp),%eax
  100d05:	85 c0                	test   %eax,%eax
  100d07:	79 10                	jns    100d19 <out_num+0x29>
		serial_printc('-');
  100d09:	83 ec 0c             	sub    $0xc,%esp
  100d0c:	6a 2d                	push   $0x2d
  100d0e:	e8 14 01 00 00       	call   100e27 <serial_printc>
  100d13:	83 c4 10             	add    $0x10,%esp
		x = ~x;
  100d16:	f7 55 08             	notl   0x8(%ebp)
	}
	rec_out_num(x, base);
  100d19:	83 ec 08             	sub    $0x8,%esp
  100d1c:	ff 75 0c             	pushl  0xc(%ebp)
  100d1f:	ff 75 08             	pushl  0x8(%ebp)
  100d22:	e8 7c ff ff ff       	call   100ca3 <rec_out_num>
  100d27:	83 c4 10             	add    $0x10,%esp
}
  100d2a:	c9                   	leave  
  100d2b:	c3                   	ret    

00100d2c <out_string>:

void out_string(char *s){
  100d2c:	55                   	push   %ebp
  100d2d:	89 e5                	mov    %esp,%ebp
  100d2f:	83 ec 08             	sub    $0x8,%esp
	while(*s){
  100d32:	eb 19                	jmp    100d4d <out_string+0x21>
		serial_printc(*s);
  100d34:	8b 45 08             	mov    0x8(%ebp),%eax
  100d37:	0f b6 00             	movzbl (%eax),%eax
  100d3a:	0f be c0             	movsbl %al,%eax
  100d3d:	83 ec 0c             	sub    $0xc,%esp
  100d40:	50                   	push   %eax
  100d41:	e8 e1 00 00 00       	call   100e27 <serial_printc>
  100d46:	83 c4 10             	add    $0x10,%esp
		s++;
  100d49:	83 45 08 01          	addl   $0x1,0x8(%ebp)
	}
	rec_out_num(x, base);
}

void out_string(char *s){
	while(*s){
  100d4d:	8b 45 08             	mov    0x8(%ebp),%eax
  100d50:	0f b6 00             	movzbl (%eax),%eax
  100d53:	84 c0                	test   %al,%al
  100d55:	75 dd                	jne    100d34 <out_string+0x8>
		serial_printc(*s);
		s++;
	}
}
  100d57:	c9                   	leave  
  100d58:	c3                   	ret    

00100d59 <abort>:
#include <include/stdio.h>
#include <include/x86.h>

int abort(const char* filename, int line) {
  100d59:	55                   	push   %ebp
  100d5a:	89 e5                	mov    %esp,%ebp
  100d5c:	83 ec 08             	sub    $0x8,%esp
}

static __inline void
cli(void)
{
	__asm __volatile("cli");
  100d5f:	fa                   	cli    
	cli();
	printk("%s,%d: Boom!\n", filename, line);
  100d60:	83 ec 04             	sub    $0x4,%esp
  100d63:	ff 75 0c             	pushl  0xc(%ebp)
  100d66:	ff 75 08             	pushl  0x8(%ebp)
  100d69:	68 89 0c 26 00       	push   $0x260c89
  100d6e:	e8 4a fe ff ff       	call   100bbd <printk>
  100d73:	83 c4 10             	add    $0x10,%esp
	while(1);
  100d76:	eb fe                	jmp    100d76 <abort+0x1d>

00100d78 <init_serial>:
#include <include/x86.h>

#define PORT 0x3f8   /* COM1 */


void init_serial() {
  100d78:	55                   	push   %ebp
  100d79:	89 e5                	mov    %esp,%ebp
  100d7b:	83 ec 40             	sub    $0x40,%esp
  100d7e:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
  100d85:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100d89:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  100d8d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100d90:	ee                   	out    %al,(%dx)
  100d91:	c7 45 f4 fb 03 00 00 	movl   $0x3fb,-0xc(%ebp)
  100d98:	c6 45 f3 80          	movb   $0x80,-0xd(%ebp)
  100d9c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100da0:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100da3:	ee                   	out    %al,(%dx)
  100da4:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
  100dab:	c6 45 eb 03          	movb   $0x3,-0x15(%ebp)
  100daf:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100db3:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100db6:	ee                   	out    %al,(%dx)
  100db7:	c7 45 e4 f9 03 00 00 	movl   $0x3f9,-0x1c(%ebp)
  100dbe:	c6 45 e3 00          	movb   $0x0,-0x1d(%ebp)
  100dc2:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  100dc6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100dc9:	ee                   	out    %al,(%dx)
  100dca:	c7 45 dc fb 03 00 00 	movl   $0x3fb,-0x24(%ebp)
  100dd1:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  100dd5:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100dd9:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100ddc:	ee                   	out    %al,(%dx)
  100ddd:	c7 45 d4 fa 03 00 00 	movl   $0x3fa,-0x2c(%ebp)
  100de4:	c6 45 d3 c7          	movb   $0xc7,-0x2d(%ebp)
  100de8:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
  100dec:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100def:	ee                   	out    %al,(%dx)
  100df0:	c7 45 cc fc 03 00 00 	movl   $0x3fc,-0x34(%ebp)
  100df7:	c6 45 cb 0b          	movb   $0xb,-0x35(%ebp)
  100dfb:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
  100dff:	8b 55 cc             	mov    -0x34(%ebp),%edx
  100e02:	ee                   	out    %al,(%dx)
	outb(PORT + 0, 0x03);
	outb(PORT + 1, 0x00);
	outb(PORT + 3, 0x03);
	outb(PORT + 2, 0xC7);
	outb(PORT + 4, 0x0B);
}
  100e03:	c9                   	leave  
  100e04:	c3                   	ret    

00100e05 <is_serial_idle>:

int is_serial_idle() {
  100e05:	55                   	push   %ebp
  100e06:	89 e5                	mov    %esp,%ebp
  100e08:	83 ec 10             	sub    $0x10,%esp
  100e0b:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  100e12:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e15:	89 c2                	mov    %eax,%edx
  100e17:	ec                   	in     (%dx),%al
  100e18:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
  100e1b:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return inb(PORT + 5) & 0x20;
  100e1f:	0f b6 c0             	movzbl %al,%eax
  100e22:	83 e0 20             	and    $0x20,%eax
}
  100e25:	c9                   	leave  
  100e26:	c3                   	ret    

00100e27 <serial_printc>:

void serial_printc(char a){
  100e27:	55                   	push   %ebp
  100e28:	89 e5                	mov    %esp,%ebp
  100e2a:	83 ec 14             	sub    $0x14,%esp
  100e2d:	8b 45 08             	mov    0x8(%ebp),%eax
  100e30:	88 45 ec             	mov    %al,-0x14(%ebp)
	while(!is_serial_idle());
  100e33:	90                   	nop
  100e34:	e8 cc ff ff ff       	call   100e05 <is_serial_idle>
  100e39:	85 c0                	test   %eax,%eax
  100e3b:	74 f7                	je     100e34 <serial_printc+0xd>
	outb(PORT, a);
  100e3d:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100e41:	0f b6 c0             	movzbl %al,%eax
  100e44:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
  100e4b:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100e4e:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  100e52:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100e55:	ee                   	out    %al,(%dx)
}
  100e56:	c9                   	leave  
  100e57:	c3                   	ret    

00100e58 <serial_output_test>:

void serial_output_test(){
  100e58:	55                   	push   %ebp
  100e59:	89 e5                	mov    %esp,%ebp
  100e5b:	83 ec 40             	sub    $0x40,%esp
  100e5e:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
  100e65:	c6 45 fb 41          	movb   $0x41,-0x5(%ebp)
  100e69:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  100e6d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100e70:	ee                   	out    %al,(%dx)
  100e71:	c7 45 f4 f8 03 00 00 	movl   $0x3f8,-0xc(%ebp)
  100e78:	c6 45 f3 4e          	movb   $0x4e,-0xd(%ebp)
  100e7c:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  100e80:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100e83:	ee                   	out    %al,(%dx)
  100e84:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
  100e8b:	c6 45 eb 44          	movb   $0x44,-0x15(%ebp)
  100e8f:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100e93:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100e96:	ee                   	out    %al,(%dx)
  100e97:	c7 45 e4 f8 03 00 00 	movl   $0x3f8,-0x1c(%ebp)
  100e9e:	c6 45 e3 53          	movb   $0x53,-0x1d(%ebp)
  100ea2:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  100ea6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100ea9:	ee                   	out    %al,(%dx)
  100eaa:	c7 45 dc f8 03 00 00 	movl   $0x3f8,-0x24(%ebp)
  100eb1:	c6 45 db 4f          	movb   $0x4f,-0x25(%ebp)
  100eb5:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100eb9:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100ebc:	ee                   	out    %al,(%dx)
  100ebd:	c7 45 d4 f8 03 00 00 	movl   $0x3f8,-0x2c(%ebp)
  100ec4:	c6 45 d3 52          	movb   $0x52,-0x2d(%ebp)
  100ec8:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
  100ecc:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100ecf:	ee                   	out    %al,(%dx)
  100ed0:	c7 45 cc f8 03 00 00 	movl   $0x3f8,-0x34(%ebp)
  100ed7:	c6 45 cb 41          	movb   $0x41,-0x35(%ebp)
  100edb:	0f b6 45 cb          	movzbl -0x35(%ebp),%eax
  100edf:	8b 55 cc             	mov    -0x34(%ebp),%edx
  100ee2:	ee                   	out    %al,(%dx)
	outb(PORT + 0, 'D');
	outb(PORT + 0, 'S');
	outb(PORT + 0, 'O');
	outb(PORT + 0, 'R');
	outb(PORT + 0, 'A');
}
  100ee3:	c9                   	leave  
  100ee4:	c3                   	ret    
