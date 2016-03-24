
game.bin:     file format elf32-i386


Disassembly of section .text:

02000000 <strlen>:
// Primespipe runs 3x faster this way.
#define ASM 1

int
strlen(const char *s)
{
 2000000:	55                   	push   %ebp
 2000001:	89 e5                	mov    %esp,%ebp
 2000003:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; *s != '\0'; s++)
 2000006:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 200000d:	eb 08                	jmp    2000017 <strlen+0x17>
		n++;
 200000f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strlen(const char *s)
{
	int n;

	for (n = 0; *s != '\0'; s++)
 2000013:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2000017:	8b 45 08             	mov    0x8(%ebp),%eax
 200001a:	0f b6 00             	movzbl (%eax),%eax
 200001d:	84 c0                	test   %al,%al
 200001f:	75 ee                	jne    200000f <strlen+0xf>
		n++;
	return n;
 2000021:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2000024:	c9                   	leave  
 2000025:	c3                   	ret    

02000026 <strnlen>:

int
strnlen(const char *s, size_t size)
{
 2000026:	55                   	push   %ebp
 2000027:	89 e5                	mov    %esp,%ebp
 2000029:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 200002c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2000033:	eb 0c                	jmp    2000041 <strnlen+0x1b>
		n++;
 2000035:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
 2000039:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 200003d:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
 2000041:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 2000045:	74 0a                	je     2000051 <strnlen+0x2b>
 2000047:	8b 45 08             	mov    0x8(%ebp),%eax
 200004a:	0f b6 00             	movzbl (%eax),%eax
 200004d:	84 c0                	test   %al,%al
 200004f:	75 e4                	jne    2000035 <strnlen+0xf>
		n++;
	return n;
 2000051:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2000054:	c9                   	leave  
 2000055:	c3                   	ret    

02000056 <strcpy>:

char *
strcpy(char *dst, const char *src)
{
 2000056:	55                   	push   %ebp
 2000057:	89 e5                	mov    %esp,%ebp
 2000059:	83 ec 10             	sub    $0x10,%esp
	char *ret;

	ret = dst;
 200005c:	8b 45 08             	mov    0x8(%ebp),%eax
 200005f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	while ((*dst++ = *src++) != '\0')
 2000062:	90                   	nop
 2000063:	8b 45 08             	mov    0x8(%ebp),%eax
 2000066:	8d 50 01             	lea    0x1(%eax),%edx
 2000069:	89 55 08             	mov    %edx,0x8(%ebp)
 200006c:	8b 55 0c             	mov    0xc(%ebp),%edx
 200006f:	8d 4a 01             	lea    0x1(%edx),%ecx
 2000072:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2000075:	0f b6 12             	movzbl (%edx),%edx
 2000078:	88 10                	mov    %dl,(%eax)
 200007a:	0f b6 00             	movzbl (%eax),%eax
 200007d:	84 c0                	test   %al,%al
 200007f:	75 e2                	jne    2000063 <strcpy+0xd>
		/* do nothing */;
	return ret;
 2000081:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2000084:	c9                   	leave  
 2000085:	c3                   	ret    

02000086 <strcat>:

char *
strcat(char *dst, const char *src)
{
 2000086:	55                   	push   %ebp
 2000087:	89 e5                	mov    %esp,%ebp
 2000089:	83 ec 10             	sub    $0x10,%esp
	int len = strlen(dst);
 200008c:	ff 75 08             	pushl  0x8(%ebp)
 200008f:	e8 6c ff ff ff       	call   2000000 <strlen>
 2000094:	83 c4 04             	add    $0x4,%esp
 2000097:	89 45 fc             	mov    %eax,-0x4(%ebp)
	strcpy(dst + len, src);
 200009a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 200009d:	8b 45 08             	mov    0x8(%ebp),%eax
 20000a0:	01 d0                	add    %edx,%eax
 20000a2:	ff 75 0c             	pushl  0xc(%ebp)
 20000a5:	50                   	push   %eax
 20000a6:	e8 ab ff ff ff       	call   2000056 <strcpy>
 20000ab:	83 c4 08             	add    $0x8,%esp
	return dst;
 20000ae:	8b 45 08             	mov    0x8(%ebp),%eax
}
 20000b1:	c9                   	leave  
 20000b2:	c3                   	ret    

020000b3 <strncpy>:

char *
strncpy(char *dst, const char *src, size_t size) {
 20000b3:	55                   	push   %ebp
 20000b4:	89 e5                	mov    %esp,%ebp
 20000b6:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
 20000b9:	8b 45 08             	mov    0x8(%ebp),%eax
 20000bc:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
 20000bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 20000c6:	eb 23                	jmp    20000eb <strncpy+0x38>
		*dst++ = *src;
 20000c8:	8b 45 08             	mov    0x8(%ebp),%eax
 20000cb:	8d 50 01             	lea    0x1(%eax),%edx
 20000ce:	89 55 08             	mov    %edx,0x8(%ebp)
 20000d1:	8b 55 0c             	mov    0xc(%ebp),%edx
 20000d4:	0f b6 12             	movzbl (%edx),%edx
 20000d7:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
 20000d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 20000dc:	0f b6 00             	movzbl (%eax),%eax
 20000df:	84 c0                	test   %al,%al
 20000e1:	74 04                	je     20000e7 <strncpy+0x34>
			src++;
 20000e3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
 20000e7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 20000eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 20000ee:	3b 45 10             	cmp    0x10(%ebp),%eax
 20000f1:	72 d5                	jb     20000c8 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
 20000f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 20000f6:	c9                   	leave  
 20000f7:	c3                   	ret    

020000f8 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
 20000f8:	55                   	push   %ebp
 20000f9:	89 e5                	mov    %esp,%ebp
 20000fb:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
 20000fe:	8b 45 08             	mov    0x8(%ebp),%eax
 2000101:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
 2000104:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2000108:	74 33                	je     200013d <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
 200010a:	eb 17                	jmp    2000123 <strlcpy+0x2b>
			*dst++ = *src++;
 200010c:	8b 45 08             	mov    0x8(%ebp),%eax
 200010f:	8d 50 01             	lea    0x1(%eax),%edx
 2000112:	89 55 08             	mov    %edx,0x8(%ebp)
 2000115:	8b 55 0c             	mov    0xc(%ebp),%edx
 2000118:	8d 4a 01             	lea    0x1(%edx),%ecx
 200011b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 200011e:	0f b6 12             	movzbl (%edx),%edx
 2000121:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
 2000123:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2000127:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 200012b:	74 0a                	je     2000137 <strlcpy+0x3f>
 200012d:	8b 45 0c             	mov    0xc(%ebp),%eax
 2000130:	0f b6 00             	movzbl (%eax),%eax
 2000133:	84 c0                	test   %al,%al
 2000135:	75 d5                	jne    200010c <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
 2000137:	8b 45 08             	mov    0x8(%ebp),%eax
 200013a:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
 200013d:	8b 55 08             	mov    0x8(%ebp),%edx
 2000140:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000143:	29 c2                	sub    %eax,%edx
 2000145:	89 d0                	mov    %edx,%eax
}
 2000147:	c9                   	leave  
 2000148:	c3                   	ret    

02000149 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2000149:	55                   	push   %ebp
 200014a:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
 200014c:	eb 08                	jmp    2000156 <strcmp+0xd>
		p++, q++;
 200014e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2000152:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
 2000156:	8b 45 08             	mov    0x8(%ebp),%eax
 2000159:	0f b6 00             	movzbl (%eax),%eax
 200015c:	84 c0                	test   %al,%al
 200015e:	74 10                	je     2000170 <strcmp+0x27>
 2000160:	8b 45 08             	mov    0x8(%ebp),%eax
 2000163:	0f b6 10             	movzbl (%eax),%edx
 2000166:	8b 45 0c             	mov    0xc(%ebp),%eax
 2000169:	0f b6 00             	movzbl (%eax),%eax
 200016c:	38 c2                	cmp    %al,%dl
 200016e:	74 de                	je     200014e <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
 2000170:	8b 45 08             	mov    0x8(%ebp),%eax
 2000173:	0f b6 00             	movzbl (%eax),%eax
 2000176:	0f b6 d0             	movzbl %al,%edx
 2000179:	8b 45 0c             	mov    0xc(%ebp),%eax
 200017c:	0f b6 00             	movzbl (%eax),%eax
 200017f:	0f b6 c0             	movzbl %al,%eax
 2000182:	29 c2                	sub    %eax,%edx
 2000184:	89 d0                	mov    %edx,%eax
}
 2000186:	5d                   	pop    %ebp
 2000187:	c3                   	ret    

02000188 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
 2000188:	55                   	push   %ebp
 2000189:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
 200018b:	eb 0c                	jmp    2000199 <strncmp+0x11>
		n--, p++, q++;
 200018d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2000191:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2000195:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
 2000199:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 200019d:	74 1a                	je     20001b9 <strncmp+0x31>
 200019f:	8b 45 08             	mov    0x8(%ebp),%eax
 20001a2:	0f b6 00             	movzbl (%eax),%eax
 20001a5:	84 c0                	test   %al,%al
 20001a7:	74 10                	je     20001b9 <strncmp+0x31>
 20001a9:	8b 45 08             	mov    0x8(%ebp),%eax
 20001ac:	0f b6 10             	movzbl (%eax),%edx
 20001af:	8b 45 0c             	mov    0xc(%ebp),%eax
 20001b2:	0f b6 00             	movzbl (%eax),%eax
 20001b5:	38 c2                	cmp    %al,%dl
 20001b7:	74 d4                	je     200018d <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
 20001b9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 20001bd:	75 07                	jne    20001c6 <strncmp+0x3e>
		return 0;
 20001bf:	b8 00 00 00 00       	mov    $0x0,%eax
 20001c4:	eb 16                	jmp    20001dc <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
 20001c6:	8b 45 08             	mov    0x8(%ebp),%eax
 20001c9:	0f b6 00             	movzbl (%eax),%eax
 20001cc:	0f b6 d0             	movzbl %al,%edx
 20001cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 20001d2:	0f b6 00             	movzbl (%eax),%eax
 20001d5:	0f b6 c0             	movzbl %al,%eax
 20001d8:	29 c2                	sub    %eax,%edx
 20001da:	89 d0                	mov    %edx,%eax
}
 20001dc:	5d                   	pop    %ebp
 20001dd:	c3                   	ret    

020001de <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
 20001de:	55                   	push   %ebp
 20001df:	89 e5                	mov    %esp,%ebp
 20001e1:	83 ec 04             	sub    $0x4,%esp
 20001e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 20001e7:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 20001ea:	eb 14                	jmp    2000200 <strchr+0x22>
		if (*s == c)
 20001ec:	8b 45 08             	mov    0x8(%ebp),%eax
 20001ef:	0f b6 00             	movzbl (%eax),%eax
 20001f2:	3a 45 fc             	cmp    -0x4(%ebp),%al
 20001f5:	75 05                	jne    20001fc <strchr+0x1e>
			return (char *) s;
 20001f7:	8b 45 08             	mov    0x8(%ebp),%eax
 20001fa:	eb 13                	jmp    200020f <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
 20001fc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2000200:	8b 45 08             	mov    0x8(%ebp),%eax
 2000203:	0f b6 00             	movzbl (%eax),%eax
 2000206:	84 c0                	test   %al,%al
 2000208:	75 e2                	jne    20001ec <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
 200020a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 200020f:	c9                   	leave  
 2000210:	c3                   	ret    

02000211 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
 2000211:	55                   	push   %ebp
 2000212:	89 e5                	mov    %esp,%ebp
 2000214:	83 ec 04             	sub    $0x4,%esp
 2000217:	8b 45 0c             	mov    0xc(%ebp),%eax
 200021a:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
 200021d:	eb 0f                	jmp    200022e <strfind+0x1d>
		if (*s == c)
 200021f:	8b 45 08             	mov    0x8(%ebp),%eax
 2000222:	0f b6 00             	movzbl (%eax),%eax
 2000225:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2000228:	74 10                	je     200023a <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
 200022a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 200022e:	8b 45 08             	mov    0x8(%ebp),%eax
 2000231:	0f b6 00             	movzbl (%eax),%eax
 2000234:	84 c0                	test   %al,%al
 2000236:	75 e7                	jne    200021f <strfind+0xe>
 2000238:	eb 01                	jmp    200023b <strfind+0x2a>
		if (*s == c)
			break;
 200023a:	90                   	nop
	return (char *) s;
 200023b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 200023e:	c9                   	leave  
 200023f:	c3                   	ret    

02000240 <memset>:

#if ASM
void *
memset(void *v, int c, size_t n)
{
 2000240:	55                   	push   %ebp
 2000241:	89 e5                	mov    %esp,%ebp
 2000243:	57                   	push   %edi
	//char *p;

	if (n == 0)
 2000244:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2000248:	75 05                	jne    200024f <memset+0xf>
		return v;
 200024a:	8b 45 08             	mov    0x8(%ebp),%eax
 200024d:	eb 5c                	jmp    20002ab <memset+0x6b>
	if ((int)v%4 == 0 && n%4 == 0) {
 200024f:	8b 45 08             	mov    0x8(%ebp),%eax
 2000252:	83 e0 03             	and    $0x3,%eax
 2000255:	85 c0                	test   %eax,%eax
 2000257:	75 41                	jne    200029a <memset+0x5a>
 2000259:	8b 45 10             	mov    0x10(%ebp),%eax
 200025c:	83 e0 03             	and    $0x3,%eax
 200025f:	85 c0                	test   %eax,%eax
 2000261:	75 37                	jne    200029a <memset+0x5a>
		c &= 0xFF;
 2000263:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
		c = (c<<24)|(c<<16)|(c<<8)|c;
 200026a:	8b 45 0c             	mov    0xc(%ebp),%eax
 200026d:	c1 e0 18             	shl    $0x18,%eax
 2000270:	89 c2                	mov    %eax,%edx
 2000272:	8b 45 0c             	mov    0xc(%ebp),%eax
 2000275:	c1 e0 10             	shl    $0x10,%eax
 2000278:	09 c2                	or     %eax,%edx
 200027a:	8b 45 0c             	mov    0xc(%ebp),%eax
 200027d:	c1 e0 08             	shl    $0x8,%eax
 2000280:	09 d0                	or     %edx,%eax
 2000282:	09 45 0c             	or     %eax,0xc(%ebp)
		asm volatile("cld; rep stosl\n"
			:: "D" (v), "a" (c), "c" (n/4)
 2000285:	8b 45 10             	mov    0x10(%ebp),%eax
 2000288:	c1 e8 02             	shr    $0x2,%eax
 200028b:	89 c1                	mov    %eax,%ecx
	if (n == 0)
		return v;
	if ((int)v%4 == 0 && n%4 == 0) {
		c &= 0xFF;
		c = (c<<24)|(c<<16)|(c<<8)|c;
		asm volatile("cld; rep stosl\n"
 200028d:	8b 55 08             	mov    0x8(%ebp),%edx
 2000290:	8b 45 0c             	mov    0xc(%ebp),%eax
 2000293:	89 d7                	mov    %edx,%edi
 2000295:	fc                   	cld    
 2000296:	f3 ab                	rep stos %eax,%es:(%edi)
 2000298:	eb 0e                	jmp    20002a8 <memset+0x68>
			:: "D" (v), "a" (c), "c" (n/4)
			: "cc", "memory");
	} else
		asm volatile("cld; rep stosb\n"
 200029a:	8b 55 08             	mov    0x8(%ebp),%edx
 200029d:	8b 45 0c             	mov    0xc(%ebp),%eax
 20002a0:	8b 4d 10             	mov    0x10(%ebp),%ecx
 20002a3:	89 d7                	mov    %edx,%edi
 20002a5:	fc                   	cld    
 20002a6:	f3 aa                	rep stos %al,%es:(%edi)
			:: "D" (v), "a" (c), "c" (n)
			: "cc", "memory");
	return v;
 20002a8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 20002ab:	5f                   	pop    %edi
 20002ac:	5d                   	pop    %ebp
 20002ad:	c3                   	ret    

020002ae <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
 20002ae:	55                   	push   %ebp
 20002af:	89 e5                	mov    %esp,%ebp
 20002b1:	57                   	push   %edi
 20002b2:	56                   	push   %esi
 20002b3:	53                   	push   %ebx
 20002b4:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;

	s = src;
 20002b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 20002ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
	d = dst;
 20002bd:	8b 45 08             	mov    0x8(%ebp),%eax
 20002c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (s < d && s + n > d) {
 20002c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 20002c6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 20002c9:	73 6d                	jae    2000338 <memmove+0x8a>
 20002cb:	8b 55 f0             	mov    -0x10(%ebp),%edx
 20002ce:	8b 45 10             	mov    0x10(%ebp),%eax
 20002d1:	01 d0                	add    %edx,%eax
 20002d3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 20002d6:	76 60                	jbe    2000338 <memmove+0x8a>
		s += n;
 20002d8:	8b 45 10             	mov    0x10(%ebp),%eax
 20002db:	01 45 f0             	add    %eax,-0x10(%ebp)
		d += n;
 20002de:	8b 45 10             	mov    0x10(%ebp),%eax
 20002e1:	01 45 ec             	add    %eax,-0x14(%ebp)
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
 20002e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 20002e7:	83 e0 03             	and    $0x3,%eax
 20002ea:	85 c0                	test   %eax,%eax
 20002ec:	75 2f                	jne    200031d <memmove+0x6f>
 20002ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 20002f1:	83 e0 03             	and    $0x3,%eax
 20002f4:	85 c0                	test   %eax,%eax
 20002f6:	75 25                	jne    200031d <memmove+0x6f>
 20002f8:	8b 45 10             	mov    0x10(%ebp),%eax
 20002fb:	83 e0 03             	and    $0x3,%eax
 20002fe:	85 c0                	test   %eax,%eax
 2000300:	75 1b                	jne    200031d <memmove+0x6f>
			asm volatile("std; rep movsl\n"
				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
 2000302:	8b 45 ec             	mov    -0x14(%ebp),%eax
 2000305:	83 e8 04             	sub    $0x4,%eax
 2000308:	8b 55 f0             	mov    -0x10(%ebp),%edx
 200030b:	83 ea 04             	sub    $0x4,%edx
 200030e:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2000311:	c1 e9 02             	shr    $0x2,%ecx
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("std; rep movsl\n"
 2000314:	89 c7                	mov    %eax,%edi
 2000316:	89 d6                	mov    %edx,%esi
 2000318:	fd                   	std    
 2000319:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 200031b:	eb 18                	jmp    2000335 <memmove+0x87>
				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
		else
			asm volatile("std; rep movsb\n"
				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
 200031d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 2000320:	8d 50 ff             	lea    -0x1(%eax),%edx
 2000323:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2000326:	8d 58 ff             	lea    -0x1(%eax),%ebx
		d += n;
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("std; rep movsl\n"
				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
		else
			asm volatile("std; rep movsb\n"
 2000329:	8b 45 10             	mov    0x10(%ebp),%eax
 200032c:	89 d7                	mov    %edx,%edi
 200032e:	89 de                	mov    %ebx,%esi
 2000330:	89 c1                	mov    %eax,%ecx
 2000332:	fd                   	std    
 2000333:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
 2000335:	fc                   	cld    
 2000336:	eb 45                	jmp    200037d <memmove+0xcf>
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
 2000338:	8b 45 f0             	mov    -0x10(%ebp),%eax
 200033b:	83 e0 03             	and    $0x3,%eax
 200033e:	85 c0                	test   %eax,%eax
 2000340:	75 2b                	jne    200036d <memmove+0xbf>
 2000342:	8b 45 ec             	mov    -0x14(%ebp),%eax
 2000345:	83 e0 03             	and    $0x3,%eax
 2000348:	85 c0                	test   %eax,%eax
 200034a:	75 21                	jne    200036d <memmove+0xbf>
 200034c:	8b 45 10             	mov    0x10(%ebp),%eax
 200034f:	83 e0 03             	and    $0x3,%eax
 2000352:	85 c0                	test   %eax,%eax
 2000354:	75 17                	jne    200036d <memmove+0xbf>
			asm volatile("cld; rep movsl\n"
				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
 2000356:	8b 45 10             	mov    0x10(%ebp),%eax
 2000359:	c1 e8 02             	shr    $0x2,%eax
 200035c:	89 c1                	mov    %eax,%ecx
				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("cld; rep movsl\n"
 200035e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 2000361:	8b 55 f0             	mov    -0x10(%ebp),%edx
 2000364:	89 c7                	mov    %eax,%edi
 2000366:	89 d6                	mov    %edx,%esi
 2000368:	fc                   	cld    
 2000369:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
 200036b:	eb 10                	jmp    200037d <memmove+0xcf>
				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
		else
			asm volatile("cld; rep movsb\n"
 200036d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 2000370:	8b 55 f0             	mov    -0x10(%ebp),%edx
 2000373:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2000376:	89 c7                	mov    %eax,%edi
 2000378:	89 d6                	mov    %edx,%esi
 200037a:	fc                   	cld    
 200037b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
	}
	return dst;
 200037d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2000380:	83 c4 10             	add    $0x10,%esp
 2000383:	5b                   	pop    %ebx
 2000384:	5e                   	pop    %esi
 2000385:	5f                   	pop    %edi
 2000386:	5d                   	pop    %ebp
 2000387:	c3                   	ret    

02000388 <memcpy>:
}
#endif

void *
memcpy(void *dst, const void *src, size_t n)
{
 2000388:	55                   	push   %ebp
 2000389:	89 e5                	mov    %esp,%ebp
	return memmove(dst, src, n);
 200038b:	ff 75 10             	pushl  0x10(%ebp)
 200038e:	ff 75 0c             	pushl  0xc(%ebp)
 2000391:	ff 75 08             	pushl  0x8(%ebp)
 2000394:	e8 15 ff ff ff       	call   20002ae <memmove>
 2000399:	83 c4 0c             	add    $0xc,%esp
}
 200039c:	c9                   	leave  
 200039d:	c3                   	ret    

0200039e <memcmp>:

int
memcmp(const void *v1, const void *v2, size_t n)
{
 200039e:	55                   	push   %ebp
 200039f:	89 e5                	mov    %esp,%ebp
 20003a1:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
 20003a4:	8b 45 08             	mov    0x8(%ebp),%eax
 20003a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
 20003aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 20003ad:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
 20003b0:	eb 30                	jmp    20003e2 <memcmp+0x44>
		if (*s1 != *s2)
 20003b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 20003b5:	0f b6 10             	movzbl (%eax),%edx
 20003b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 20003bb:	0f b6 00             	movzbl (%eax),%eax
 20003be:	38 c2                	cmp    %al,%dl
 20003c0:	74 18                	je     20003da <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
 20003c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 20003c5:	0f b6 00             	movzbl (%eax),%eax
 20003c8:	0f b6 d0             	movzbl %al,%edx
 20003cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 20003ce:	0f b6 00             	movzbl (%eax),%eax
 20003d1:	0f b6 c0             	movzbl %al,%eax
 20003d4:	29 c2                	sub    %eax,%edx
 20003d6:	89 d0                	mov    %edx,%eax
 20003d8:	eb 1a                	jmp    20003f4 <memcmp+0x56>
		s1++, s2++;
 20003da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 20003de:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
 20003e2:	8b 45 10             	mov    0x10(%ebp),%eax
 20003e5:	8d 50 ff             	lea    -0x1(%eax),%edx
 20003e8:	89 55 10             	mov    %edx,0x10(%ebp)
 20003eb:	85 c0                	test   %eax,%eax
 20003ed:	75 c3                	jne    20003b2 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
 20003ef:	b8 00 00 00 00       	mov    $0x0,%eax
}
 20003f4:	c9                   	leave  
 20003f5:	c3                   	ret    

020003f6 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
 20003f6:	55                   	push   %ebp
 20003f7:	89 e5                	mov    %esp,%ebp
 20003f9:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
 20003fc:	8b 55 08             	mov    0x8(%ebp),%edx
 20003ff:	8b 45 10             	mov    0x10(%ebp),%eax
 2000402:	01 d0                	add    %edx,%eax
 2000404:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
 2000407:	eb 17                	jmp    2000420 <memfind+0x2a>
		if (*(const unsigned char *) s == (unsigned char) c)
 2000409:	8b 45 08             	mov    0x8(%ebp),%eax
 200040c:	0f b6 00             	movzbl (%eax),%eax
 200040f:	0f b6 d0             	movzbl %al,%edx
 2000412:	8b 45 0c             	mov    0xc(%ebp),%eax
 2000415:	0f b6 c0             	movzbl %al,%eax
 2000418:	39 c2                	cmp    %eax,%edx
 200041a:	74 0e                	je     200042a <memfind+0x34>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
 200041c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2000420:	8b 45 08             	mov    0x8(%ebp),%eax
 2000423:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 2000426:	72 e1                	jb     2000409 <memfind+0x13>
 2000428:	eb 01                	jmp    200042b <memfind+0x35>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
 200042a:	90                   	nop
	return (void *) s;
 200042b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 200042e:	c9                   	leave  
 200042f:	c3                   	ret    

02000430 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
 2000430:	55                   	push   %ebp
 2000431:	89 e5                	mov    %esp,%ebp
 2000433:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
 2000436:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
 200043d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 2000444:	eb 04                	jmp    200044a <strtol+0x1a>
		s++;
 2000446:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
 200044a:	8b 45 08             	mov    0x8(%ebp),%eax
 200044d:	0f b6 00             	movzbl (%eax),%eax
 2000450:	3c 20                	cmp    $0x20,%al
 2000452:	74 f2                	je     2000446 <strtol+0x16>
 2000454:	8b 45 08             	mov    0x8(%ebp),%eax
 2000457:	0f b6 00             	movzbl (%eax),%eax
 200045a:	3c 09                	cmp    $0x9,%al
 200045c:	74 e8                	je     2000446 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
 200045e:	8b 45 08             	mov    0x8(%ebp),%eax
 2000461:	0f b6 00             	movzbl (%eax),%eax
 2000464:	3c 2b                	cmp    $0x2b,%al
 2000466:	75 06                	jne    200046e <strtol+0x3e>
		s++;
 2000468:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 200046c:	eb 15                	jmp    2000483 <strtol+0x53>
	else if (*s == '-')
 200046e:	8b 45 08             	mov    0x8(%ebp),%eax
 2000471:	0f b6 00             	movzbl (%eax),%eax
 2000474:	3c 2d                	cmp    $0x2d,%al
 2000476:	75 0b                	jne    2000483 <strtol+0x53>
		s++, neg = 1;
 2000478:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 200047c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
 2000483:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2000487:	74 06                	je     200048f <strtol+0x5f>
 2000489:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
 200048d:	75 24                	jne    20004b3 <strtol+0x83>
 200048f:	8b 45 08             	mov    0x8(%ebp),%eax
 2000492:	0f b6 00             	movzbl (%eax),%eax
 2000495:	3c 30                	cmp    $0x30,%al
 2000497:	75 1a                	jne    20004b3 <strtol+0x83>
 2000499:	8b 45 08             	mov    0x8(%ebp),%eax
 200049c:	83 c0 01             	add    $0x1,%eax
 200049f:	0f b6 00             	movzbl (%eax),%eax
 20004a2:	3c 78                	cmp    $0x78,%al
 20004a4:	75 0d                	jne    20004b3 <strtol+0x83>
		s += 2, base = 16;
 20004a6:	83 45 08 02          	addl   $0x2,0x8(%ebp)
 20004aa:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
 20004b1:	eb 2a                	jmp    20004dd <strtol+0xad>
	else if (base == 0 && s[0] == '0')
 20004b3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 20004b7:	75 17                	jne    20004d0 <strtol+0xa0>
 20004b9:	8b 45 08             	mov    0x8(%ebp),%eax
 20004bc:	0f b6 00             	movzbl (%eax),%eax
 20004bf:	3c 30                	cmp    $0x30,%al
 20004c1:	75 0d                	jne    20004d0 <strtol+0xa0>
		s++, base = 8;
 20004c3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 20004c7:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
 20004ce:	eb 0d                	jmp    20004dd <strtol+0xad>
	else if (base == 0)
 20004d0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 20004d4:	75 07                	jne    20004dd <strtol+0xad>
		base = 10;
 20004d6:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
 20004dd:	8b 45 08             	mov    0x8(%ebp),%eax
 20004e0:	0f b6 00             	movzbl (%eax),%eax
 20004e3:	3c 2f                	cmp    $0x2f,%al
 20004e5:	7e 1b                	jle    2000502 <strtol+0xd2>
 20004e7:	8b 45 08             	mov    0x8(%ebp),%eax
 20004ea:	0f b6 00             	movzbl (%eax),%eax
 20004ed:	3c 39                	cmp    $0x39,%al
 20004ef:	7f 11                	jg     2000502 <strtol+0xd2>
			dig = *s - '0';
 20004f1:	8b 45 08             	mov    0x8(%ebp),%eax
 20004f4:	0f b6 00             	movzbl (%eax),%eax
 20004f7:	0f be c0             	movsbl %al,%eax
 20004fa:	83 e8 30             	sub    $0x30,%eax
 20004fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
 2000500:	eb 48                	jmp    200054a <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
 2000502:	8b 45 08             	mov    0x8(%ebp),%eax
 2000505:	0f b6 00             	movzbl (%eax),%eax
 2000508:	3c 60                	cmp    $0x60,%al
 200050a:	7e 1b                	jle    2000527 <strtol+0xf7>
 200050c:	8b 45 08             	mov    0x8(%ebp),%eax
 200050f:	0f b6 00             	movzbl (%eax),%eax
 2000512:	3c 7a                	cmp    $0x7a,%al
 2000514:	7f 11                	jg     2000527 <strtol+0xf7>
			dig = *s - 'a' + 10;
 2000516:	8b 45 08             	mov    0x8(%ebp),%eax
 2000519:	0f b6 00             	movzbl (%eax),%eax
 200051c:	0f be c0             	movsbl %al,%eax
 200051f:	83 e8 57             	sub    $0x57,%eax
 2000522:	89 45 f4             	mov    %eax,-0xc(%ebp)
 2000525:	eb 23                	jmp    200054a <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
 2000527:	8b 45 08             	mov    0x8(%ebp),%eax
 200052a:	0f b6 00             	movzbl (%eax),%eax
 200052d:	3c 40                	cmp    $0x40,%al
 200052f:	7e 3c                	jle    200056d <strtol+0x13d>
 2000531:	8b 45 08             	mov    0x8(%ebp),%eax
 2000534:	0f b6 00             	movzbl (%eax),%eax
 2000537:	3c 5a                	cmp    $0x5a,%al
 2000539:	7f 32                	jg     200056d <strtol+0x13d>
			dig = *s - 'A' + 10;
 200053b:	8b 45 08             	mov    0x8(%ebp),%eax
 200053e:	0f b6 00             	movzbl (%eax),%eax
 2000541:	0f be c0             	movsbl %al,%eax
 2000544:	83 e8 37             	sub    $0x37,%eax
 2000547:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
 200054a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 200054d:	3b 45 10             	cmp    0x10(%ebp),%eax
 2000550:	7d 1a                	jge    200056c <strtol+0x13c>
			break;
		s++, val = (val * base) + dig;
 2000552:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2000556:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2000559:	0f af 45 10          	imul   0x10(%ebp),%eax
 200055d:	89 c2                	mov    %eax,%edx
 200055f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000562:	01 d0                	add    %edx,%eax
 2000564:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
 2000567:	e9 71 ff ff ff       	jmp    20004dd <strtol+0xad>
		else if (*s >= 'A' && *s <= 'Z')
			dig = *s - 'A' + 10;
		else
			break;
		if (dig >= base)
			break;
 200056c:	90                   	nop
		s++, val = (val * base) + dig;
		// we don't properly detect overflow!
	}

	if (endptr)
 200056d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 2000571:	74 08                	je     200057b <strtol+0x14b>
		*endptr = (char *) s;
 2000573:	8b 45 0c             	mov    0xc(%ebp),%eax
 2000576:	8b 55 08             	mov    0x8(%ebp),%edx
 2000579:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
 200057b:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 200057f:	74 07                	je     2000588 <strtol+0x158>
 2000581:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2000584:	f7 d8                	neg    %eax
 2000586:	eb 03                	jmp    200058b <strtol+0x15b>
 2000588:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 200058b:	c9                   	leave  
 200058c:	c3                   	ret    

0200058d <clear_buffer>:
#include "string.h"
#include "syscall.h"

uint8_t v_buffer[SCR_SIZE];

inline void clear_buffer() {
 200058d:	55                   	push   %ebp
 200058e:	89 e5                	mov    %esp,%ebp
 2000590:	83 ec 08             	sub    $0x8,%esp
	memset(v_buffer, 0x00, SCR_SIZE);
 2000593:	83 ec 04             	sub    $0x4,%esp
 2000596:	68 00 f9 15 00       	push   $0x15f900
 200059b:	6a 00                	push   $0x0
 200059d:	68 20 e0 01 02       	push   $0x201e020
 20005a2:	e8 99 fc ff ff       	call   2000240 <memset>
 20005a7:	83 c4 10             	add    $0x10,%esp
}
 20005aa:	90                   	nop
 20005ab:	c9                   	leave  
 20005ac:	c3                   	ret    

020005ad <display_buffer>:

inline void display_buffer() {
 20005ad:	55                   	push   %ebp
 20005ae:	89 e5                	mov    %esp,%ebp
 20005b0:	83 ec 08             	sub    $0x8,%esp
	put_video(v_buffer);
 20005b3:	83 ec 0c             	sub    $0xc,%esp
 20005b6:	68 20 e0 01 02       	push   $0x201e020
 20005bb:	e8 07 01 00 00       	call   20006c7 <put_video>
 20005c0:	83 c4 10             	add    $0x10,%esp
}
 20005c3:	90                   	nop
 20005c4:	c9                   	leave  
 20005c5:	c3                   	ret    

020005c6 <drawRect_buffer>:

inline void drawRect_buffer(const uint8_t *src, int x, int y, int w, int h){
 20005c6:	55                   	push   %ebp
 20005c7:	89 e5                	mov    %esp,%ebp
 20005c9:	83 ec 18             	sub    $0x18,%esp
	int i;
	int v_idx = (x + y * SCR_WIDTH) * SCR_DEPTH;
 20005cc:	8b 45 10             	mov    0x10(%ebp),%eax
 20005cf:	69 d0 20 03 00 00    	imul   $0x320,%eax,%edx
 20005d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 20005d8:	01 c2                	add    %eax,%edx
 20005da:	89 d0                	mov    %edx,%eax
 20005dc:	01 c0                	add    %eax,%eax
 20005de:	01 d0                	add    %edx,%eax
 20005e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
	int s_idx = 0;
 20005e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
	for(i = 0; i < h; ++ i) {
 20005ea:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 20005f1:	eb 40                	jmp    2000633 <drawRect_buffer+0x6d>
		memcpy(v_buffer + v_idx, src + s_idx, w * SCR_DEPTH);
 20005f3:	8b 55 14             	mov    0x14(%ebp),%edx
 20005f6:	89 d0                	mov    %edx,%eax
 20005f8:	01 c0                	add    %eax,%eax
 20005fa:	01 d0                	add    %edx,%eax
 20005fc:	89 c1                	mov    %eax,%ecx
 20005fe:	8b 55 ec             	mov    -0x14(%ebp),%edx
 2000601:	8b 45 08             	mov    0x8(%ebp),%eax
 2000604:	01 c2                	add    %eax,%edx
 2000606:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2000609:	05 20 e0 01 02       	add    $0x201e020,%eax
 200060e:	83 ec 04             	sub    $0x4,%esp
 2000611:	51                   	push   %ecx
 2000612:	52                   	push   %edx
 2000613:	50                   	push   %eax
 2000614:	e8 6f fd ff ff       	call   2000388 <memcpy>
 2000619:	83 c4 10             	add    $0x10,%esp
		v_idx += SCR_WIDTH_SIZE;
 200061c:	81 45 f0 60 09 00 00 	addl   $0x960,-0x10(%ebp)
		s_idx += w * SCR_DEPTH;
 2000623:	8b 55 14             	mov    0x14(%ebp),%edx
 2000626:	89 d0                	mov    %edx,%eax
 2000628:	01 c0                	add    %eax,%eax
 200062a:	01 d0                	add    %edx,%eax
 200062c:	01 45 ec             	add    %eax,-0x14(%ebp)

inline void drawRect_buffer(const uint8_t *src, int x, int y, int w, int h){
	int i;
	int v_idx = (x + y * SCR_WIDTH) * SCR_DEPTH;
	int s_idx = 0;
	for(i = 0; i < h; ++ i) {
 200062f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 2000633:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000636:	3b 45 18             	cmp    0x18(%ebp),%eax
 2000639:	7c b8                	jl     20005f3 <drawRect_buffer+0x2d>
		memcpy(v_buffer + v_idx, src + s_idx, w * SCR_DEPTH);
		v_idx += SCR_WIDTH_SIZE;
		s_idx += w * SCR_DEPTH;
	}
}
 200063b:	90                   	nop
 200063c:	c9                   	leave  
 200063d:	c3                   	ret    

0200063e <srand>:
#include "common.h"

static uint32_t seed = 0;

void srand(uint32_t s) {
 200063e:	55                   	push   %ebp
 200063f:	89 e5                	mov    %esp,%ebp
	seed = s;
 2000641:	8b 45 08             	mov    0x8(%ebp),%eax
 2000644:	a3 00 e0 01 02       	mov    %eax,0x201e000
}
 2000649:	90                   	nop
 200064a:	5d                   	pop    %ebp
 200064b:	c3                   	ret    

0200064c <rand>:

uint32_t rand() {
 200064c:	55                   	push   %ebp
 200064d:	89 e5                	mov    %esp,%ebp
	seed = 0x015a4e35 * seed + 1;
 200064f:	a1 00 e0 01 02       	mov    0x201e000,%eax
 2000654:	69 c0 35 4e 5a 01    	imul   $0x15a4e35,%eax,%eax
 200065a:	83 c0 01             	add    $0x1,%eax
 200065d:	a3 00 e0 01 02       	mov    %eax,0x201e000
	return (seed >> 16) & 0x7fff;
 2000662:	a1 00 e0 01 02       	mov    0x201e000,%eax
 2000667:	c1 e8 10             	shr    $0x10,%eax
 200066a:	25 ff 7f 00 00       	and    $0x7fff,%eax
}
 200066f:	5d                   	pop    %ebp
 2000670:	c3                   	ret    

02000671 <syscall>:
#include "common.h"

enum {SYS_time, SYS_kbd, SYS_video};

int __attribute__((__noinline__))
syscall(int id, ...) {
 2000671:	55                   	push   %ebp
 2000672:	89 e5                	mov    %esp,%ebp
 2000674:	53                   	push   %ebx
 2000675:	83 ec 10             	sub    $0x10,%esp
	int ret;
	int *args = &id;
 2000678:	8d 45 08             	lea    0x8(%ebp),%eax
 200067b:	89 45 f8             	mov    %eax,-0x8(%ebp)
	asm volatile("int $0x80": "=a"(ret) : "a"(args[0]), "b"(args[1]), "c"(args[2]), "d"(args[3]));
 200067e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2000681:	8b 00                	mov    (%eax),%eax
 2000683:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2000686:	83 c2 04             	add    $0x4,%edx
 2000689:	8b 1a                	mov    (%edx),%ebx
 200068b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 200068e:	83 c2 08             	add    $0x8,%edx
 2000691:	8b 0a                	mov    (%edx),%ecx
 2000693:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2000696:	83 c2 0c             	add    $0xc,%edx
 2000699:	8b 12                	mov    (%edx),%edx
 200069b:	cd 80                	int    $0x80
 200069d:	89 45 f4             	mov    %eax,-0xc(%ebp)
	return ret;
 20006a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 20006a3:	83 c4 10             	add    $0x10,%esp
 20006a6:	5b                   	pop    %ebx
 20006a7:	5d                   	pop    %ebp
 20006a8:	c3                   	ret    

020006a9 <get_time>:

int get_time() {
 20006a9:	55                   	push   %ebp
 20006aa:	89 e5                	mov    %esp,%ebp
	return syscall(SYS_time);
 20006ac:	6a 00                	push   $0x0
 20006ae:	e8 be ff ff ff       	call   2000671 <syscall>
 20006b3:	83 c4 04             	add    $0x4,%esp
}
 20006b6:	c9                   	leave  
 20006b7:	c3                   	ret    

020006b8 <get_kbd>:

int get_kbd() {
 20006b8:	55                   	push   %ebp
 20006b9:	89 e5                	mov    %esp,%ebp
	return syscall(SYS_kbd);
 20006bb:	6a 01                	push   $0x1
 20006bd:	e8 af ff ff ff       	call   2000671 <syscall>
 20006c2:	83 c4 04             	add    $0x4,%esp
}
 20006c5:	c9                   	leave  
 20006c6:	c3                   	ret    

020006c7 <put_video>:

int put_video(uint8_t *buffer) {
 20006c7:	55                   	push   %ebp
 20006c8:	89 e5                	mov    %esp,%ebp
	return syscall(SYS_video, buffer);
 20006ca:	ff 75 08             	pushl  0x8(%ebp)
 20006cd:	6a 02                	push   $0x2
 20006cf:	e8 9d ff ff ff       	call   2000671 <syscall>
 20006d4:	83 c4 08             	add    $0x8,%esp
}
 20006d7:	c9                   	leave  
 20006d8:	c3                   	ret    

020006d9 <process_keys>:
void get_release_key(uint8_t);
void enable_reborn();
void close_reborn();


bool process_keys() {
 20006d9:	55                   	push   %ebp
 20006da:	89 e5                	mov    %esp,%ebp
 20006dc:	83 ec 18             	sub    $0x18,%esp
	uint8_t keycode = get_kbd();
 20006df:	e8 d4 ff ff ff       	call   20006b8 <get_kbd>
 20006e4:	88 45 f7             	mov    %al,-0x9(%ebp)
	if(keycode == 0xff) return false;
 20006e7:	80 7d f7 ff          	cmpb   $0xff,-0x9(%ebp)
 20006eb:	75 07                	jne    20006f4 <process_keys+0x1b>
 20006ed:	b8 00 00 00 00       	mov    $0x0,%eax
 20006f2:	eb 34                	jmp    2000728 <process_keys+0x4f>
	if(keycode < 0x80) {
 20006f4:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
 20006f8:	84 c0                	test   %al,%al
 20006fa:	78 17                	js     2000713 <process_keys+0x3a>
		get_press_key(keycode); return true;
 20006fc:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
 2000700:	83 ec 0c             	sub    $0xc,%esp
 2000703:	50                   	push   %eax
 2000704:	e8 21 00 00 00       	call   200072a <get_press_key>
 2000709:	83 c4 10             	add    $0x10,%esp
 200070c:	b8 01 00 00 00       	mov    $0x1,%eax
 2000711:	eb 15                	jmp    2000728 <process_keys+0x4f>
	}
	else {
		get_release_key(keycode); return true;
 2000713:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
 2000717:	83 ec 0c             	sub    $0xc,%esp
 200071a:	50                   	push   %eax
 200071b:	e8 67 00 00 00       	call   2000787 <get_release_key>
 2000720:	83 c4 10             	add    $0x10,%esp
 2000723:	b8 01 00 00 00       	mov    $0x1,%eax
	}
}
 2000728:	c9                   	leave  
 2000729:	c3                   	ret    

0200072a <get_press_key>:

extern int inc_player;
extern bool enable_bullet;

void get_press_key(uint8_t keycode) {
 200072a:	55                   	push   %ebp
 200072b:	89 e5                	mov    %esp,%ebp
 200072d:	83 ec 18             	sub    $0x18,%esp
 2000730:	8b 45 08             	mov    0x8(%ebp),%eax
 2000733:	88 45 f4             	mov    %al,-0xc(%ebp)
	switch (keycode) {
 2000736:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
 200073a:	83 f8 2c             	cmp    $0x2c,%eax
 200073d:	74 36                	je     2000775 <get_press_key+0x4b>
 200073f:	83 f8 2c             	cmp    $0x2c,%eax
 2000742:	7f 07                	jg     200074b <get_press_key+0x21>
 2000744:	83 f8 1c             	cmp    $0x1c,%eax
 2000747:	74 35                	je     200077e <get_press_key+0x54>
		case K_RIGHT: inc_player ++; break;
		case K_Z: enable_bullet = true; break;
		case K_ENTER: enable_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
 2000749:	eb 39                	jmp    2000784 <get_press_key+0x5a>

extern int inc_player;
extern bool enable_bullet;

void get_press_key(uint8_t keycode) {
	switch (keycode) {
 200074b:	83 f8 4b             	cmp    $0x4b,%eax
 200074e:	74 07                	je     2000757 <get_press_key+0x2d>
 2000750:	83 f8 4d             	cmp    $0x4d,%eax
 2000753:	74 11                	je     2000766 <get_press_key+0x3c>
		case K_RIGHT: inc_player ++; break;
		case K_Z: enable_bullet = true; break;
		case K_ENTER: enable_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
 2000755:	eb 2d                	jmp    2000784 <get_press_key+0x5a>
extern int inc_player;
extern bool enable_bullet;

void get_press_key(uint8_t keycode) {
	switch (keycode) {
		case K_LEFT: inc_player --; break;
 2000757:	a1 cc e1 17 02       	mov    0x217e1cc,%eax
 200075c:	83 e8 01             	sub    $0x1,%eax
 200075f:	a3 cc e1 17 02       	mov    %eax,0x217e1cc
 2000764:	eb 1e                	jmp    2000784 <get_press_key+0x5a>
		case K_RIGHT: inc_player ++; break;
 2000766:	a1 cc e1 17 02       	mov    0x217e1cc,%eax
 200076b:	83 c0 01             	add    $0x1,%eax
 200076e:	a3 cc e1 17 02       	mov    %eax,0x217e1cc
 2000773:	eb 0f                	jmp    2000784 <get_press_key+0x5a>
		case K_Z: enable_bullet = true; break;
 2000775:	c6 05 c8 e1 17 02 01 	movb   $0x1,0x217e1c8
 200077c:	eb 06                	jmp    2000784 <get_press_key+0x5a>
		case K_ENTER: enable_reborn(); break;
 200077e:	e8 96 06 00 00       	call   2000e19 <enable_reborn>
 2000783:	90                   	nop
		case K_UP:
		case K_DOWN:
		default: break;
	}
}
 2000784:	90                   	nop
 2000785:	c9                   	leave  
 2000786:	c3                   	ret    

02000787 <get_release_key>:

void get_release_key(uint8_t keycode) {
 2000787:	55                   	push   %ebp
 2000788:	89 e5                	mov    %esp,%ebp
 200078a:	83 ec 18             	sub    $0x18,%esp
 200078d:	8b 45 08             	mov    0x8(%ebp),%eax
 2000790:	88 45 f4             	mov    %al,-0xc(%ebp)
	switch (keycode) {
 2000793:	0f b6 45 f4          	movzbl -0xc(%ebp),%eax
 2000797:	83 f8 2c             	cmp    $0x2c,%eax
 200079a:	74 36                	je     20007d2 <get_release_key+0x4b>
 200079c:	83 f8 2c             	cmp    $0x2c,%eax
 200079f:	7f 07                	jg     20007a8 <get_release_key+0x21>
 20007a1:	83 f8 1c             	cmp    $0x1c,%eax
 20007a4:	74 35                	je     20007db <get_release_key+0x54>
		case K_RIGHT: inc_player --; break;
		case K_Z: enable_bullet = false; break;
		case K_ENTER: close_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
 20007a6:	eb 39                	jmp    20007e1 <get_release_key+0x5a>
		default: break;
	}
}

void get_release_key(uint8_t keycode) {
	switch (keycode) {
 20007a8:	83 f8 4b             	cmp    $0x4b,%eax
 20007ab:	74 07                	je     20007b4 <get_release_key+0x2d>
 20007ad:	83 f8 4d             	cmp    $0x4d,%eax
 20007b0:	74 11                	je     20007c3 <get_release_key+0x3c>
		case K_RIGHT: inc_player --; break;
		case K_Z: enable_bullet = false; break;
		case K_ENTER: close_reborn(); break;
		case K_UP:
		case K_DOWN:
		default: break;
 20007b2:	eb 2d                	jmp    20007e1 <get_release_key+0x5a>
	}
}

void get_release_key(uint8_t keycode) {
	switch (keycode) {
		case K_LEFT: inc_player ++; break;
 20007b4:	a1 cc e1 17 02       	mov    0x217e1cc,%eax
 20007b9:	83 c0 01             	add    $0x1,%eax
 20007bc:	a3 cc e1 17 02       	mov    %eax,0x217e1cc
 20007c1:	eb 1e                	jmp    20007e1 <get_release_key+0x5a>
		case K_RIGHT: inc_player --; break;
 20007c3:	a1 cc e1 17 02       	mov    0x217e1cc,%eax
 20007c8:	83 e8 01             	sub    $0x1,%eax
 20007cb:	a3 cc e1 17 02       	mov    %eax,0x217e1cc
 20007d0:	eb 0f                	jmp    20007e1 <get_release_key+0x5a>
		case K_Z: enable_bullet = false; break;
 20007d2:	c6 05 c8 e1 17 02 00 	movb   $0x0,0x217e1c8
 20007d9:	eb 06                	jmp    20007e1 <get_release_key+0x5a>
		case K_ENTER: close_reborn(); break;
 20007db:	e8 46 06 00 00       	call   2000e26 <close_reborn>
 20007e0:	90                   	nop
		case K_UP:
		case K_DOWN:
		default: break;
	}
}
 20007e1:	90                   	nop
 20007e2:	c9                   	leave  
 20007e3:	c3                   	ret    

020007e4 <game_loop>:
bool update_bullet();
void update_player();
void draw_screen();

void game_loop()
{
 20007e4:	55                   	push   %ebp
 20007e5:	89 e5                	mov    %esp,%ebp
 20007e7:	83 ec 18             	sub    $0x18,%esp
	//printk("Here is game_loop()\n");

	bool dead_flag = false;
 20007ea:	c6 45 f7 00          	movb   $0x0,-0x9(%ebp)
	uint32_t now = get_time(), target;
 20007ee:	e8 b6 fe ff ff       	call   20006a9 <get_time>
 20007f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 20007f6:	f4                   	hlt    
}

static __inline void
cli(void)
{
	__asm __volatile("cli");
 20007f7:	fa                   	cli    
	while(1){
		hlt();
		cli();
		if(now == get_time()){
 20007f8:	e8 ac fe ff ff       	call   20006a9 <get_time>
 20007fd:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 2000800:	75 06                	jne    2000808 <game_loop+0x24>

/* sti and cli --ANDSORA */
static __inline void
sti(void)
{
	__asm __volatile("sti");
 2000802:	fb                   	sti    
			sti();
			continue;
 2000803:	e9 f5 00 00 00       	jmp    20008fd <game_loop+0x119>
		}

		target = get_time();
 2000808:	e8 9c fe ff ff       	call   20006a9 <get_time>
 200080d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 2000810:	fb                   	sti    
		sti();

		while(process_keys());
 2000811:	90                   	nop
 2000812:	e8 c2 fe ff ff       	call   20006d9 <process_keys>
 2000817:	84 c0                	test   %al,%al
 2000819:	75 f7                	jne    2000812 <game_loop+0x2e>

		while(now < target){
 200081b:	e9 cb 00 00 00       	jmp    20008eb <game_loop+0x107>
			if(now % 5 == 0) update_bullet();
 2000820:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 2000823:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
 2000828:	89 c8                	mov    %ecx,%eax
 200082a:	f7 e2                	mul    %edx
 200082c:	89 d0                	mov    %edx,%eax
 200082e:	c1 e8 02             	shr    $0x2,%eax
 2000831:	89 c2                	mov    %eax,%edx
 2000833:	c1 e2 02             	shl    $0x2,%edx
 2000836:	01 c2                	add    %eax,%edx
 2000838:	89 c8                	mov    %ecx,%eax
 200083a:	29 d0                	sub    %edx,%eax
 200083c:	85 c0                	test   %eax,%eax
 200083e:	75 05                	jne    2000845 <game_loop+0x61>
 2000840:	e8 4a 03 00 00       	call   2000b8f <update_bullet>
			if(now % 8 == 0) update_player();
 2000845:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2000848:	83 e0 07             	and    $0x7,%eax
 200084b:	85 c0                	test   %eax,%eax
 200084d:	75 05                	jne    2000854 <game_loop+0x70>
 200084f:	e8 08 04 00 00       	call   2000c5c <update_player>
			if(now % 10 == 6) dead_flag = update_enemy();
 2000854:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 2000857:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
 200085c:	89 c8                	mov    %ecx,%eax
 200085e:	f7 e2                	mul    %edx
 2000860:	c1 ea 03             	shr    $0x3,%edx
 2000863:	89 d0                	mov    %edx,%eax
 2000865:	c1 e0 02             	shl    $0x2,%eax
 2000868:	01 d0                	add    %edx,%eax
 200086a:	01 c0                	add    %eax,%eax
 200086c:	29 c1                	sub    %eax,%ecx
 200086e:	89 ca                	mov    %ecx,%edx
 2000870:	83 fa 06             	cmp    $0x6,%edx
 2000873:	75 08                	jne    200087d <game_loop+0x99>
 2000875:	e8 82 01 00 00       	call   20009fc <update_enemy>
 200087a:	88 45 f7             	mov    %al,-0x9(%ebp)
			if(now % 10 == 0) draw_screen();
 200087d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 2000880:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
 2000885:	89 c8                	mov    %ecx,%eax
 2000887:	f7 e2                	mul    %edx
 2000889:	c1 ea 03             	shr    $0x3,%edx
 200088c:	89 d0                	mov    %edx,%eax
 200088e:	c1 e0 02             	shl    $0x2,%eax
 2000891:	01 d0                	add    %edx,%eax
 2000893:	01 c0                	add    %eax,%eax
 2000895:	29 c1                	sub    %eax,%ecx
 2000897:	89 ca                	mov    %ecx,%edx
 2000899:	85 d2                	test   %edx,%edx
 200089b:	75 05                	jne    20008a2 <game_loop+0xbe>
 200089d:	e8 d1 04 00 00       	call   2000d73 <draw_screen>
			if(now % 100 == 0) generate_bullet();
 20008a2:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 20008a5:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
 20008aa:	89 c8                	mov    %ecx,%eax
 20008ac:	f7 e2                	mul    %edx
 20008ae:	89 d0                	mov    %edx,%eax
 20008b0:	c1 e8 05             	shr    $0x5,%eax
 20008b3:	6b c0 64             	imul   $0x64,%eax,%eax
 20008b6:	29 c1                	sub    %eax,%ecx
 20008b8:	89 c8                	mov    %ecx,%eax
 20008ba:	85 c0                	test   %eax,%eax
 20008bc:	75 05                	jne    20008c3 <game_loop+0xdf>
 20008be:	e8 d8 01 00 00       	call   2000a9b <generate_bullet>
			if(now % 500 == 0) generate_enemy();
 20008c3:	8b 4d f0             	mov    -0x10(%ebp),%ecx
 20008c6:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
 20008cb:	89 c8                	mov    %ecx,%eax
 20008cd:	f7 e2                	mul    %edx
 20008cf:	89 d0                	mov    %edx,%eax
 20008d1:	c1 e8 05             	shr    $0x5,%eax
 20008d4:	69 c0 f4 01 00 00    	imul   $0x1f4,%eax,%eax
 20008da:	29 c1                	sub    %eax,%ecx
 20008dc:	89 c8                	mov    %ecx,%eax
 20008de:	85 c0                	test   %eax,%eax
 20008e0:	75 05                	jne    20008e7 <game_loop+0x103>
 20008e2:	e8 1f 00 00 00       	call   2000906 <generate_enemy>
			now++;
 20008e7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
		target = get_time();
		sti();

		while(process_keys());

		while(now < target){
 20008eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 20008ee:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 20008f1:	0f 82 29 ff ff ff    	jb     2000820 <game_loop+0x3c>
			if(now % 10 == 0) draw_screen();
			if(now % 100 == 0) generate_bullet();
			if(now % 500 == 0) generate_enemy();
			now++;
		}
		if(dead_flag) break;
 20008f7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
 20008fb:	75 05                	jne    2000902 <game_loop+0x11e>
	}
 20008fd:	e9 f4 fe ff ff       	jmp    20007f6 <game_loop+0x12>
			if(now % 10 == 0) draw_screen();
			if(now % 100 == 0) generate_bullet();
			if(now % 500 == 0) generate_enemy();
			now++;
		}
		if(dead_flag) break;
 2000902:	90                   	nop
	}

	//clear_screen();
	//while(1);
}
 2000903:	90                   	nop
 2000904:	c9                   	leave  
 2000905:	c3                   	ret    

02000906 <generate_enemy>:
	struct Enemy *next;
} *enemy_head, *enemy_avail, enemy[NR_ENEMY];

//int nr_enemy;

bool generate_enemy() {
 2000906:	55                   	push   %ebp
 2000907:	89 e5                	mov    %esp,%ebp
 2000909:	83 ec 18             	sub    $0x18,%esp
	if(enemy_avail) {
 200090c:	a1 f4 e0 17 02       	mov    0x217e0f4,%eax
 2000911:	85 c0                	test   %eax,%eax
 2000913:	74 72                	je     2000987 <generate_enemy+0x81>
		struct Enemy *temp = enemy_avail;
 2000915:	a1 f4 e0 17 02       	mov    0x217e0f4,%eax
 200091a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		enemy_avail = enemy_avail->next;
 200091d:	a1 f4 e0 17 02       	mov    0x217e0f4,%eax
 2000922:	8b 40 10             	mov    0x10(%eax),%eax
 2000925:	a3 f4 e0 17 02       	mov    %eax,0x217e0f4
		temp->x = rand()%(SCR_WIDTH - FF_WIDTH); temp->y = 0;
 200092a:	e8 1d fd ff ff       	call   200064c <rand>
 200092f:	89 c1                	mov    %eax,%ecx
 2000931:	89 c8                	mov    %ecx,%eax
 2000933:	c1 e8 04             	shr    $0x4,%eax
 2000936:	ba 06 5b b0 05       	mov    $0x5b05b06,%edx
 200093b:	f7 e2                	mul    %edx
 200093d:	69 c2 d0 02 00 00    	imul   $0x2d0,%edx,%eax
 2000943:	29 c1                	sub    %eax,%ecx
 2000945:	89 c8                	mov    %ecx,%eax
 2000947:	89 c2                	mov    %eax,%edx
 2000949:	8b 45 f4             	mov    -0xc(%ebp),%eax
 200094c:	89 10                	mov    %edx,(%eax)
 200094e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000951:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
		temp->w = FF_WIDTH; temp->h = FF_HEIGHT;
 2000958:	8b 45 f4             	mov    -0xc(%ebp),%eax
 200095b:	c7 40 08 50 00 00 00 	movl   $0x50,0x8(%eax)
 2000962:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000965:	c7 40 0c 50 00 00 00 	movl   $0x50,0xc(%eax)
		temp->next = enemy_head;
 200096c:	8b 15 fc e0 17 02    	mov    0x217e0fc,%edx
 2000972:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000975:	89 50 10             	mov    %edx,0x10(%eax)
		enemy_head = temp;
 2000978:	8b 45 f4             	mov    -0xc(%ebp),%eax
 200097b:	a3 fc e0 17 02       	mov    %eax,0x217e0fc
		return true;
 2000980:	b8 01 00 00 00       	mov    $0x1,%eax
 2000985:	eb 05                	jmp    200098c <generate_enemy+0x86>
	}
	else return false;
 2000987:	b8 00 00 00 00       	mov    $0x0,%eax
}
 200098c:	c9                   	leave  
 200098d:	c3                   	ret    

0200098e <delete_enemy>:

void delete_enemy(struct Enemy *enemy_p) {
 200098e:	55                   	push   %ebp
 200098f:	89 e5                	mov    %esp,%ebp
 2000991:	83 ec 10             	sub    $0x10,%esp
	struct Enemy *temp = enemy_head;
 2000994:	a1 fc e0 17 02       	mov    0x217e0fc,%eax
 2000999:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if(temp == enemy_p) {
 200099c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 200099f:	3b 45 08             	cmp    0x8(%ebp),%eax
 20009a2:	75 2a                	jne    20009ce <delete_enemy+0x40>
		enemy_head = enemy_p->next;
 20009a4:	8b 45 08             	mov    0x8(%ebp),%eax
 20009a7:	8b 40 10             	mov    0x10(%eax),%eax
 20009aa:	a3 fc e0 17 02       	mov    %eax,0x217e0fc
		enemy_p->next = enemy_avail;
 20009af:	8b 15 f4 e0 17 02    	mov    0x217e0f4,%edx
 20009b5:	8b 45 08             	mov    0x8(%ebp),%eax
 20009b8:	89 50 10             	mov    %edx,0x10(%eax)
		enemy_avail = enemy_p;
 20009bb:	8b 45 08             	mov    0x8(%ebp),%eax
 20009be:	a3 f4 e0 17 02       	mov    %eax,0x217e0f4
		while(temp->next != enemy_p) temp = temp->next;
		temp->next = enemy_p->next;
		enemy_p->next = enemy_avail;
		enemy_avail = enemy_p;
	}
}
 20009c3:	eb 34                	jmp    20009f9 <delete_enemy+0x6b>
		enemy_head = enemy_p->next;
		enemy_p->next = enemy_avail;
		enemy_avail = enemy_p;
	}
	else {
		while(temp->next != enemy_p) temp = temp->next;
 20009c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 20009c8:	8b 40 10             	mov    0x10(%eax),%eax
 20009cb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 20009ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 20009d1:	8b 40 10             	mov    0x10(%eax),%eax
 20009d4:	3b 45 08             	cmp    0x8(%ebp),%eax
 20009d7:	75 ec                	jne    20009c5 <delete_enemy+0x37>
		temp->next = enemy_p->next;
 20009d9:	8b 45 08             	mov    0x8(%ebp),%eax
 20009dc:	8b 50 10             	mov    0x10(%eax),%edx
 20009df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 20009e2:	89 50 10             	mov    %edx,0x10(%eax)
		enemy_p->next = enemy_avail;
 20009e5:	8b 15 f4 e0 17 02    	mov    0x217e0f4,%edx
 20009eb:	8b 45 08             	mov    0x8(%ebp),%eax
 20009ee:	89 50 10             	mov    %edx,0x10(%eax)
		enemy_avail = enemy_p;
 20009f1:	8b 45 08             	mov    0x8(%ebp),%eax
 20009f4:	a3 f4 e0 17 02       	mov    %eax,0x217e0f4
	}
}
 20009f9:	90                   	nop
 20009fa:	c9                   	leave  
 20009fb:	c3                   	ret    

020009fc <update_enemy>:

bool update_enemy() {
 20009fc:	55                   	push   %ebp
 20009fd:	89 e5                	mov    %esp,%ebp
 20009ff:	83 ec 10             	sub    $0x10,%esp
	struct Enemy *temp = enemy_head;
 2000a02:	a1 fc e0 17 02       	mov    0x217e0fc,%eax
 2000a07:	89 45 fc             	mov    %eax,-0x4(%ebp)
	bool kill_flag;
	while(temp) {
 2000a0a:	eb 7e                	jmp    2000a8a <update_enemy+0x8e>
		kill_flag = false;
 2000a0c:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
		temp->y ++;
 2000a10:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a13:	8b 40 04             	mov    0x4(%eax),%eax
 2000a16:	8d 50 01             	lea    0x1(%eax),%edx
 2000a19:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a1c:	89 50 04             	mov    %edx,0x4(%eax)
		if(temp->y >= SCR_HEIGHT - FF_HEIGHT) kill_flag = true;
 2000a1f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a22:	8b 40 04             	mov    0x4(%eax),%eax
 2000a25:	3d 07 02 00 00       	cmp    $0x207,%eax
 2000a2a:	7e 04                	jle    2000a30 <update_enemy+0x34>
 2000a2c:	c6 45 fb 01          	movb   $0x1,-0x5(%ebp)
		if((temp->y > SCR_HEIGHT - FF_HEIGHT - LS_HEIGHT) && (temp->x - x_player < LS_WIDTH && temp->x - x_player > -LS_WIDTH)) return true;
 2000a30:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a33:	8b 40 04             	mov    0x4(%eax),%eax
 2000a36:	3d b8 01 00 00       	cmp    $0x1b8,%eax
 2000a3b:	7e 2d                	jle    2000a6a <update_enemy+0x6e>
 2000a3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a40:	8b 10                	mov    (%eax),%edx
 2000a42:	a1 d0 e1 17 02       	mov    0x217e1d0,%eax
 2000a47:	29 c2                	sub    %eax,%edx
 2000a49:	89 d0                	mov    %edx,%eax
 2000a4b:	83 f8 4f             	cmp    $0x4f,%eax
 2000a4e:	7f 1a                	jg     2000a6a <update_enemy+0x6e>
 2000a50:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a53:	8b 10                	mov    (%eax),%edx
 2000a55:	a1 d0 e1 17 02       	mov    0x217e1d0,%eax
 2000a5a:	29 c2                	sub    %eax,%edx
 2000a5c:	89 d0                	mov    %edx,%eax
 2000a5e:	83 f8 b1             	cmp    $0xffffffb1,%eax
 2000a61:	7c 07                	jl     2000a6a <update_enemy+0x6e>
 2000a63:	b8 01 00 00 00       	mov    $0x1,%eax
 2000a68:	eb 2f                	jmp    2000a99 <update_enemy+0x9d>
		struct Enemy *ttemp = temp;
 2000a6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
		temp = temp->next;
 2000a70:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000a73:	8b 40 10             	mov    0x10(%eax),%eax
 2000a76:	89 45 fc             	mov    %eax,-0x4(%ebp)
		if(kill_flag) delete_enemy(ttemp);
 2000a79:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
 2000a7d:	74 0b                	je     2000a8a <update_enemy+0x8e>
 2000a7f:	ff 75 f4             	pushl  -0xc(%ebp)
 2000a82:	e8 07 ff ff ff       	call   200098e <delete_enemy>
 2000a87:	83 c4 04             	add    $0x4,%esp
}

bool update_enemy() {
	struct Enemy *temp = enemy_head;
	bool kill_flag;
	while(temp) {
 2000a8a:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 2000a8e:	0f 85 78 ff ff ff    	jne    2000a0c <update_enemy+0x10>
		if((temp->y > SCR_HEIGHT - FF_HEIGHT - LS_HEIGHT) && (temp->x - x_player < LS_WIDTH && temp->x - x_player > -LS_WIDTH)) return true;
		struct Enemy *ttemp = temp;
		temp = temp->next;
		if(kill_flag) delete_enemy(ttemp);
	}
	return false;
 2000a94:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2000a99:	c9                   	leave  
 2000a9a:	c3                   	ret    

02000a9b <generate_bullet>:
	struct Bullet *next;
} *bullet_head, *bullet_avail, bullet[NR_BULLET];

//int nr_bullet;

bool generate_bullet() {
 2000a9b:	55                   	push   %ebp
 2000a9c:	89 e5                	mov    %esp,%ebp
 2000a9e:	83 ec 10             	sub    $0x10,%esp
	if(!enable_bullet) return false;
 2000aa1:	0f b6 05 c8 e1 17 02 	movzbl 0x217e1c8,%eax
 2000aa8:	83 f0 01             	xor    $0x1,%eax
 2000aab:	84 c0                	test   %al,%al
 2000aad:	74 07                	je     2000ab6 <generate_bullet+0x1b>
 2000aaf:	b8 00 00 00 00       	mov    $0x0,%eax
 2000ab4:	eb 69                	jmp    2000b1f <generate_bullet+0x84>
	if(bullet_avail) {
 2000ab6:	a1 f0 e0 17 02       	mov    0x217e0f0,%eax
 2000abb:	85 c0                	test   %eax,%eax
 2000abd:	74 5b                	je     2000b1a <generate_bullet+0x7f>
		struct Bullet *temp = bullet_avail;
 2000abf:	a1 f0 e0 17 02       	mov    0x217e0f0,%eax
 2000ac4:	89 45 fc             	mov    %eax,-0x4(%ebp)
		bullet_avail = bullet_avail->next;
 2000ac7:	a1 f0 e0 17 02       	mov    0x217e0f0,%eax
 2000acc:	8b 40 10             	mov    0x10(%eax),%eax
 2000acf:	a3 f0 e0 17 02       	mov    %eax,0x217e0f0
		temp->x = x_player + LS_WIDTH/2; temp->y = SCR_HEIGHT - LS_HEIGHT;
 2000ad4:	a1 d0 e1 17 02       	mov    0x217e1d0,%eax
 2000ad9:	8d 50 28             	lea    0x28(%eax),%edx
 2000adc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000adf:	89 10                	mov    %edx,(%eax)
 2000ae1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000ae4:	c7 40 04 08 02 00 00 	movl   $0x208,0x4(%eax)
		temp->w = BT_WIDTH; temp->h = BT_HEIGHT;
 2000aeb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000aee:	c7 40 08 04 00 00 00 	movl   $0x4,0x8(%eax)
 2000af5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000af8:	c7 40 0c 14 00 00 00 	movl   $0x14,0xc(%eax)
		temp->next = bullet_head;
 2000aff:	8b 15 f8 e0 17 02    	mov    0x217e0f8,%edx
 2000b05:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000b08:	89 50 10             	mov    %edx,0x10(%eax)
		bullet_head = temp;
 2000b0b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000b0e:	a3 f8 e0 17 02       	mov    %eax,0x217e0f8
		return true;
 2000b13:	b8 01 00 00 00       	mov    $0x1,%eax
 2000b18:	eb 05                	jmp    2000b1f <generate_bullet+0x84>
	}
	else return false;
 2000b1a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2000b1f:	c9                   	leave  
 2000b20:	c3                   	ret    

02000b21 <delete_bullet>:

void delete_bullet(struct Bullet *bullet_p) {
 2000b21:	55                   	push   %ebp
 2000b22:	89 e5                	mov    %esp,%ebp
 2000b24:	83 ec 10             	sub    $0x10,%esp
	struct Bullet *temp = bullet_head;
 2000b27:	a1 f8 e0 17 02       	mov    0x217e0f8,%eax
 2000b2c:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if(temp == bullet_p) {
 2000b2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000b32:	3b 45 08             	cmp    0x8(%ebp),%eax
 2000b35:	75 2a                	jne    2000b61 <delete_bullet+0x40>
		bullet_head = bullet_p->next;
 2000b37:	8b 45 08             	mov    0x8(%ebp),%eax
 2000b3a:	8b 40 10             	mov    0x10(%eax),%eax
 2000b3d:	a3 f8 e0 17 02       	mov    %eax,0x217e0f8
		bullet_p->next = bullet_avail;
 2000b42:	8b 15 f0 e0 17 02    	mov    0x217e0f0,%edx
 2000b48:	8b 45 08             	mov    0x8(%ebp),%eax
 2000b4b:	89 50 10             	mov    %edx,0x10(%eax)
		bullet_avail = bullet_p;
 2000b4e:	8b 45 08             	mov    0x8(%ebp),%eax
 2000b51:	a3 f0 e0 17 02       	mov    %eax,0x217e0f0
		while(temp->next != bullet_p) temp = temp->next;
		temp->next = bullet_p->next;
		bullet_p->next = bullet_avail;
		bullet_avail = bullet_p;
	}
}
 2000b56:	eb 34                	jmp    2000b8c <delete_bullet+0x6b>
		bullet_head = bullet_p->next;
		bullet_p->next = bullet_avail;
		bullet_avail = bullet_p;
	}
	else {
		while(temp->next != bullet_p) temp = temp->next;
 2000b58:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000b5b:	8b 40 10             	mov    0x10(%eax),%eax
 2000b5e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2000b61:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000b64:	8b 40 10             	mov    0x10(%eax),%eax
 2000b67:	3b 45 08             	cmp    0x8(%ebp),%eax
 2000b6a:	75 ec                	jne    2000b58 <delete_bullet+0x37>
		temp->next = bullet_p->next;
 2000b6c:	8b 45 08             	mov    0x8(%ebp),%eax
 2000b6f:	8b 50 10             	mov    0x10(%eax),%edx
 2000b72:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000b75:	89 50 10             	mov    %edx,0x10(%eax)
		bullet_p->next = bullet_avail;
 2000b78:	8b 15 f0 e0 17 02    	mov    0x217e0f0,%edx
 2000b7e:	8b 45 08             	mov    0x8(%ebp),%eax
 2000b81:	89 50 10             	mov    %edx,0x10(%eax)
		bullet_avail = bullet_p;
 2000b84:	8b 45 08             	mov    0x8(%ebp),%eax
 2000b87:	a3 f0 e0 17 02       	mov    %eax,0x217e0f0
	}
}
 2000b8c:	90                   	nop
 2000b8d:	c9                   	leave  
 2000b8e:	c3                   	ret    

02000b8f <update_bullet>:

bool update_bullet() {
 2000b8f:	55                   	push   %ebp
 2000b90:	89 e5                	mov    %esp,%ebp
 2000b92:	83 ec 10             	sub    $0x10,%esp
	struct Bullet *temp = bullet_head;
 2000b95:	a1 f8 e0 17 02       	mov    0x217e0f8,%eax
 2000b9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
	bool kill_flag;
	bool return_flag = false;
 2000b9d:	c6 45 fa 00          	movb   $0x0,-0x6(%ebp)
	while(temp) {
 2000ba1:	e9 a6 00 00 00       	jmp    2000c4c <update_bullet+0xbd>
		kill_flag = false;
 2000ba6:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
		temp->y --;
 2000baa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000bad:	8b 40 04             	mov    0x4(%eax),%eax
 2000bb0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2000bb3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000bb6:	89 50 04             	mov    %edx,0x4(%eax)
		if(temp->y < 0) kill_flag = true;
 2000bb9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000bbc:	8b 40 04             	mov    0x4(%eax),%eax
 2000bbf:	85 c0                	test   %eax,%eax
 2000bc1:	79 06                	jns    2000bc9 <update_bullet+0x3a>
 2000bc3:	c6 45 fb 01          	movb   $0x1,-0x5(%ebp)
 2000bc7:	eb 5f                	jmp    2000c28 <update_bullet+0x99>
		else {
			struct Enemy *enemy_temp = enemy_head;
 2000bc9:	a1 fc e0 17 02       	mov    0x217e0fc,%eax
 2000bce:	89 45 f4             	mov    %eax,-0xc(%ebp)
			while(enemy_temp) {
 2000bd1:	eb 4f                	jmp    2000c22 <update_bullet+0x93>
				if(enemy_temp->y >= temp->y - FF_HEIGHT && (enemy_temp->x + FF_WIDTH >= temp->x && enemy_temp->x <= temp->x + BT_WIDTH)) {
 2000bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000bd6:	8b 50 04             	mov    0x4(%eax),%edx
 2000bd9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000bdc:	8b 40 04             	mov    0x4(%eax),%eax
 2000bdf:	83 e8 50             	sub    $0x50,%eax
 2000be2:	39 c2                	cmp    %eax,%edx
 2000be4:	7c 33                	jl     2000c19 <update_bullet+0x8a>
 2000be6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000be9:	8b 00                	mov    (%eax),%eax
 2000beb:	8d 50 50             	lea    0x50(%eax),%edx
 2000bee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000bf1:	8b 00                	mov    (%eax),%eax
 2000bf3:	39 c2                	cmp    %eax,%edx
 2000bf5:	7c 22                	jl     2000c19 <update_bullet+0x8a>
 2000bf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000bfa:	8b 10                	mov    (%eax),%edx
 2000bfc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000bff:	8b 00                	mov    (%eax),%eax
 2000c01:	83 c0 04             	add    $0x4,%eax
 2000c04:	39 c2                	cmp    %eax,%edx
 2000c06:	7f 11                	jg     2000c19 <update_bullet+0x8a>
					delete_enemy(enemy_temp);
 2000c08:	ff 75 f4             	pushl  -0xc(%ebp)
 2000c0b:	e8 7e fd ff ff       	call   200098e <delete_enemy>
 2000c10:	83 c4 04             	add    $0x4,%esp
					kill_flag = true;
 2000c13:	c6 45 fb 01          	movb   $0x1,-0x5(%ebp)
					break;
 2000c17:	eb 0f                	jmp    2000c28 <update_bullet+0x99>
				}
				enemy_temp = enemy_temp->next;
 2000c19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000c1c:	8b 40 10             	mov    0x10(%eax),%eax
 2000c1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		kill_flag = false;
		temp->y --;
		if(temp->y < 0) kill_flag = true;
		else {
			struct Enemy *enemy_temp = enemy_head;
			while(enemy_temp) {
 2000c22:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2000c26:	75 ab                	jne    2000bd3 <update_bullet+0x44>
				}
				enemy_temp = enemy_temp->next;
			}
		}

		struct Bullet *ttemp = temp;
 2000c28:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000c2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
		temp = temp->next;
 2000c2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000c31:	8b 40 10             	mov    0x10(%eax),%eax
 2000c34:	89 45 fc             	mov    %eax,-0x4(%ebp)
		if(kill_flag) {
 2000c37:	80 7d fb 00          	cmpb   $0x0,-0x5(%ebp)
 2000c3b:	74 0f                	je     2000c4c <update_bullet+0xbd>
			delete_bullet(ttemp);
 2000c3d:	ff 75 f0             	pushl  -0x10(%ebp)
 2000c40:	e8 dc fe ff ff       	call   2000b21 <delete_bullet>
 2000c45:	83 c4 04             	add    $0x4,%esp
			return_flag = true;
 2000c48:	c6 45 fa 01          	movb   $0x1,-0x6(%ebp)

bool update_bullet() {
	struct Bullet *temp = bullet_head;
	bool kill_flag;
	bool return_flag = false;
	while(temp) {
 2000c4c:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
 2000c50:	0f 85 50 ff ff ff    	jne    2000ba6 <update_bullet+0x17>
		if(kill_flag) {
			delete_bullet(ttemp);
			return_flag = true;
		}
	}
	return return_flag;
 2000c56:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
}
 2000c5a:	c9                   	leave  
 2000c5b:	c3                   	ret    

02000c5c <update_player>:



/* part of PLAYER */
void update_player() {
 2000c5c:	55                   	push   %ebp
 2000c5d:	89 e5                	mov    %esp,%ebp
	if(x_player + inc_player >= 0 && x_player + inc_player < SCR_WIDTH - LS_WIDTH)
 2000c5f:	8b 15 d0 e1 17 02    	mov    0x217e1d0,%edx
 2000c65:	a1 cc e1 17 02       	mov    0x217e1cc,%eax
 2000c6a:	01 d0                	add    %edx,%eax
 2000c6c:	85 c0                	test   %eax,%eax
 2000c6e:	78 26                	js     2000c96 <update_player+0x3a>
 2000c70:	8b 15 d0 e1 17 02    	mov    0x217e1d0,%edx
 2000c76:	a1 cc e1 17 02       	mov    0x217e1cc,%eax
 2000c7b:	01 d0                	add    %edx,%eax
 2000c7d:	3d cf 02 00 00       	cmp    $0x2cf,%eax
 2000c82:	7f 12                	jg     2000c96 <update_player+0x3a>
		x_player += inc_player;
 2000c84:	8b 15 d0 e1 17 02    	mov    0x217e1d0,%edx
 2000c8a:	a1 cc e1 17 02       	mov    0x217e1cc,%eax
 2000c8f:	01 d0                	add    %edx,%eax
 2000c91:	a3 d0 e1 17 02       	mov    %eax,0x217e1d0
}
 2000c96:	90                   	nop
 2000c97:	5d                   	pop    %ebp
 2000c98:	c3                   	ret    

02000c99 <init_effect>:


/* part of init */
void init_effect() {
 2000c99:	55                   	push   %ebp
 2000c9a:	89 e5                	mov    %esp,%ebp
 2000c9c:	83 ec 10             	sub    $0x10,%esp
	int i;
	inc_player = 0;
 2000c9f:	c7 05 cc e1 17 02 00 	movl   $0x0,0x217e1cc
 2000ca6:	00 00 00 
	x_player = 0;
 2000ca9:	c7 05 d0 e1 17 02 00 	movl   $0x0,0x217e1d0
 2000cb0:	00 00 00 
	enable_bullet = false;
 2000cb3:	c6 05 c8 e1 17 02 00 	movb   $0x0,0x217e1c8
	//nr_enemy = 0;
	enemy_head = NULL;
 2000cba:	c7 05 fc e0 17 02 00 	movl   $0x0,0x217e0fc
 2000cc1:	00 00 00 
	enemy_avail = enemy;
 2000cc4:	c7 05 f4 e0 17 02 00 	movl   $0x217e100,0x217e0f4
 2000ccb:	e1 17 02 
	for(i = 0; i < NR_ENEMY - 1; ++ i) {
 2000cce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2000cd5:	eb 2e                	jmp    2000d05 <init_effect+0x6c>
		enemy[i].next = enemy + i + 1;
 2000cd7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000cda:	8d 50 01             	lea    0x1(%eax),%edx
 2000cdd:	89 d0                	mov    %edx,%eax
 2000cdf:	c1 e0 02             	shl    $0x2,%eax
 2000ce2:	01 d0                	add    %edx,%eax
 2000ce4:	c1 e0 02             	shl    $0x2,%eax
 2000ce7:	8d 88 00 e1 17 02    	lea    0x217e100(%eax),%ecx
 2000ced:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2000cf0:	89 d0                	mov    %edx,%eax
 2000cf2:	c1 e0 02             	shl    $0x2,%eax
 2000cf5:	01 d0                	add    %edx,%eax
 2000cf7:	c1 e0 02             	shl    $0x2,%eax
 2000cfa:	05 10 e1 17 02       	add    $0x217e110,%eax
 2000cff:	89 08                	mov    %ecx,(%eax)
	x_player = 0;
	enable_bullet = false;
	//nr_enemy = 0;
	enemy_head = NULL;
	enemy_avail = enemy;
	for(i = 0; i < NR_ENEMY - 1; ++ i) {
 2000d01:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2000d05:	83 7d fc 08          	cmpl   $0x8,-0x4(%ebp)
 2000d09:	7e cc                	jle    2000cd7 <init_effect+0x3e>
		enemy[i].next = enemy + i + 1;
	}
	enemy[NR_ENEMY - 1].next = NULL;
 2000d0b:	c7 05 c4 e1 17 02 00 	movl   $0x0,0x217e1c4
 2000d12:	00 00 00 
	//nr_bullet = 0;
	bullet_head = NULL;
 2000d15:	c7 05 f8 e0 17 02 00 	movl   $0x0,0x217e0f8
 2000d1c:	00 00 00 
	bullet_avail = bullet;
 2000d1f:	c7 05 f0 e0 17 02 20 	movl   $0x217d920,0x217e0f0
 2000d26:	d9 17 02 
	for(i = 0; i < NR_BULLET - 1; ++ i) {
 2000d29:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 2000d30:	eb 2e                	jmp    2000d60 <init_effect+0xc7>
		bullet[i].next = bullet + i + 1;
 2000d32:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2000d35:	8d 50 01             	lea    0x1(%eax),%edx
 2000d38:	89 d0                	mov    %edx,%eax
 2000d3a:	c1 e0 02             	shl    $0x2,%eax
 2000d3d:	01 d0                	add    %edx,%eax
 2000d3f:	c1 e0 02             	shl    $0x2,%eax
 2000d42:	8d 88 20 d9 17 02    	lea    0x217d920(%eax),%ecx
 2000d48:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2000d4b:	89 d0                	mov    %edx,%eax
 2000d4d:	c1 e0 02             	shl    $0x2,%eax
 2000d50:	01 d0                	add    %edx,%eax
 2000d52:	c1 e0 02             	shl    $0x2,%eax
 2000d55:	05 30 d9 17 02       	add    $0x217d930,%eax
 2000d5a:	89 08                	mov    %ecx,(%eax)
	}
	enemy[NR_ENEMY - 1].next = NULL;
	//nr_bullet = 0;
	bullet_head = NULL;
	bullet_avail = bullet;
	for(i = 0; i < NR_BULLET - 1; ++ i) {
 2000d5c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 2000d60:	83 7d fc 62          	cmpl   $0x62,-0x4(%ebp)
 2000d64:	7e cc                	jle    2000d32 <init_effect+0x99>
		bullet[i].next = bullet + i + 1;
	}
	bullet[NR_BULLET - 1].next = NULL;
 2000d66:	c7 05 ec e0 17 02 00 	movl   $0x0,0x217e0ec
 2000d6d:	00 00 00 
}
 2000d70:	90                   	nop
 2000d71:	c9                   	leave  
 2000d72:	c3                   	ret    

02000d73 <draw_screen>:
	return false;
}
*/

/* part of screen */
void draw_screen() {
 2000d73:	55                   	push   %ebp
 2000d74:	89 e5                	mov    %esp,%ebp
 2000d76:	83 ec 18             	sub    $0x18,%esp
	clear_buffer();
 2000d79:	e8 0f f8 ff ff       	call   200058d <clear_buffer>

	drawRect_buffer(gImage_LowSing, x_player, SCR_HEIGHT - LS_HEIGHT, LS_WIDTH, LS_HEIGHT);
 2000d7e:	a1 d0 e1 17 02       	mov    0x217e1d0,%eax
 2000d83:	83 ec 0c             	sub    $0xc,%esp
 2000d86:	6a 50                	push   $0x50
 2000d88:	6a 50                	push   $0x50
 2000d8a:	68 08 02 00 00       	push   $0x208
 2000d8f:	50                   	push   %eax
 2000d90:	68 60 3e 01 02       	push   $0x2013e60
 2000d95:	e8 2c f8 ff ff       	call   20005c6 <drawRect_buffer>
 2000d9a:	83 c4 20             	add    $0x20,%esp
	struct Enemy *enemy_temp = enemy_head;
 2000d9d:	a1 fc e0 17 02       	mov    0x217e0fc,%eax
 2000da2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	while(enemy_temp) {
 2000da5:	eb 2a                	jmp    2000dd1 <draw_screen+0x5e>
		drawRect_buffer(gImage_FeiFan_1, enemy_temp->x, enemy_temp->y, FF_WIDTH, FF_HEIGHT);
 2000da7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000daa:	8b 50 04             	mov    0x4(%eax),%edx
 2000dad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000db0:	8b 00                	mov    (%eax),%eax
 2000db2:	83 ec 0c             	sub    $0xc,%esp
 2000db5:	6a 50                	push   $0x50
 2000db7:	6a 50                	push   $0x50
 2000db9:	52                   	push   %edx
 2000dba:	50                   	push   %eax
 2000dbb:	68 60 5d 00 02       	push   $0x2005d60
 2000dc0:	e8 01 f8 ff ff       	call   20005c6 <drawRect_buffer>
 2000dc5:	83 c4 20             	add    $0x20,%esp
		enemy_temp = enemy_temp->next;
 2000dc8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2000dcb:	8b 40 10             	mov    0x10(%eax),%eax
 2000dce:	89 45 f4             	mov    %eax,-0xc(%ebp)
void draw_screen() {
	clear_buffer();

	drawRect_buffer(gImage_LowSing, x_player, SCR_HEIGHT - LS_HEIGHT, LS_WIDTH, LS_HEIGHT);
	struct Enemy *enemy_temp = enemy_head;
	while(enemy_temp) {
 2000dd1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2000dd5:	75 d0                	jne    2000da7 <draw_screen+0x34>
		drawRect_buffer(gImage_FeiFan_1, enemy_temp->x, enemy_temp->y, FF_WIDTH, FF_HEIGHT);
		enemy_temp = enemy_temp->next;
	}
	struct Bullet *bullet_temp = bullet_head;
 2000dd7:	a1 f8 e0 17 02       	mov    0x217e0f8,%eax
 2000ddc:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while(bullet_temp) {
 2000ddf:	eb 2a                	jmp    2000e0b <draw_screen+0x98>
		drawRect_buffer(gImage_Bullet, bullet_temp->x, bullet_temp->y, BT_WIDTH, BT_HEIGHT);
 2000de1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2000de4:	8b 50 04             	mov    0x4(%eax),%edx
 2000de7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2000dea:	8b 00                	mov    (%eax),%eax
 2000dec:	83 ec 0c             	sub    $0xc,%esp
 2000def:	6a 14                	push   $0x14
 2000df1:	6a 04                	push   $0x4
 2000df3:	52                   	push   %edx
 2000df4:	50                   	push   %eax
 2000df5:	68 a0 0e 00 02       	push   $0x2000ea0
 2000dfa:	e8 c7 f7 ff ff       	call   20005c6 <drawRect_buffer>
 2000dff:	83 c4 20             	add    $0x20,%esp
		bullet_temp = bullet_temp->next;
 2000e02:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2000e05:	8b 40 10             	mov    0x10(%eax),%eax
 2000e08:	89 45 f0             	mov    %eax,-0x10(%ebp)
	while(enemy_temp) {
		drawRect_buffer(gImage_FeiFan_1, enemy_temp->x, enemy_temp->y, FF_WIDTH, FF_HEIGHT);
		enemy_temp = enemy_temp->next;
	}
	struct Bullet *bullet_temp = bullet_head;
	while(bullet_temp) {
 2000e0b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2000e0f:	75 d0                	jne    2000de1 <draw_screen+0x6e>
		drawRect_buffer(gImage_Bullet, bullet_temp->x, bullet_temp->y, BT_WIDTH, BT_HEIGHT);
		bullet_temp = bullet_temp->next;
	}

	display_buffer();
 2000e11:	e8 97 f7 ff ff       	call   20005ad <display_buffer>
}
 2000e16:	90                   	nop
 2000e17:	c9                   	leave  
 2000e18:	c3                   	ret    

02000e19 <enable_reborn>:
void process_keys();
void init_effect();
void game_loop();

static bool reborn;
void enable_reborn() {
 2000e19:	55                   	push   %ebp
 2000e1a:	89 e5                	mov    %esp,%ebp
	reborn = true;
 2000e1c:	c6 05 04 e0 01 02 01 	movb   $0x1,0x201e004
}
 2000e23:	90                   	nop
 2000e24:	5d                   	pop    %ebp
 2000e25:	c3                   	ret    

02000e26 <close_reborn>:
void close_reborn() {
 2000e26:	55                   	push   %ebp
 2000e27:	89 e5                	mov    %esp,%ebp
	reborn = false;
 2000e29:	c6 05 04 e0 01 02 00 	movb   $0x0,0x201e004
}
 2000e30:	90                   	nop
 2000e31:	5d                   	pop    %ebp
 2000e32:	c3                   	ret    

02000e33 <game_main>:


void game_main()
{
 2000e33:	55                   	push   %ebp
 2000e34:	89 e5                	mov    %esp,%ebp
 2000e36:	83 ec 08             	sub    $0x8,%esp
	
	//while(1);

	reborn = false;
 2000e39:	c6 05 04 e0 01 02 00 	movb   $0x0,0x201e004
}

static __inline void
hlt(void)
{
	__asm __volatile("hlt");
 2000e40:	f4                   	hlt    

	//while(1);
	while(1) {
		hlt();
		process_keys();
 2000e41:	e8 93 f8 ff ff       	call   20006d9 <process_keys>
		if(reborn) {
 2000e46:	0f b6 05 04 e0 01 02 	movzbl 0x201e004,%eax
 2000e4d:	84 c0                	test   %al,%al
 2000e4f:	74 ef                	je     2000e40 <game_main+0xd>
			clear_buffer();
 2000e51:	e8 37 f7 ff ff       	call   200058d <clear_buffer>
			display_buffer();
 2000e56:	e8 52 f7 ff ff       	call   20005ad <display_buffer>
			init_effect();
 2000e5b:	e8 39 fe ff ff       	call   2000c99 <init_effect>
			game_loop();
 2000e60:	e8 7f f9 ff ff       	call   20007e4 <game_loop>
		}
	}
 2000e65:	eb d9                	jmp    2000e40 <game_main+0xd>
