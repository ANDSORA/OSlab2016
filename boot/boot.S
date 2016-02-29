#define MAKE_NULL_SEG_DESC	\
	.word 0, 0;
	.byte 0, 0, 0, 0

#define MAKE_SEG_DESC(type, base, lim)						\
	.word (((lim) >> 12) & 0xffff), ((base) & 0xffff);		\
	.byte (((base) >> 16) & 0xff), (0x90 | (type)),			\
	(0xc0 | ((lim) >> 28) & 0xff)), (((base) >> 24) &0xff)

.globl start
start:
	seta20.1:
		inb		$0x64, %al
		testb	$0x2, %al
		jnz		seta20.1

		movb	$0xd1, %al
		outb	%al, $0x64

	seta20.2:
		inb		$0x64, %al
		testb	$0x2, %al
		jnz		seta20.2

		movb	$0xdf, %al
		outb	%al, $0x60

# GDT
.p2align 2
gdt:
	MAKE_NULL_SEG_DESC					# empty segment
	MAKE_SEG_DESC(0xA, 0x0, 0xffffffff)	# code
	MAKE_SEG_DESC(0x2, 0x0, 0xffffffff)	# data

gdtdesc:
	.word	(gdtdesc - gdt - 1)		# limit = sizeof(gdt) - 1
	.long	gdt						# address of GDT

