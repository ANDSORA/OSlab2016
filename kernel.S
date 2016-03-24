
kernel.bin:     file format elf32-i386


Disassembly of section .text:

00100000 <strlen>:
// Primespipe runs 3x faster this way.
#define ASM 1

int
strlen(const char *s)
{
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; *s != '\0'; s++)
  100006:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10000d:	eb 08                	jmp    100017 <strlen+0x17>
		n++;
  10000f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strlen(const char *s)
{
	int n;

	for (n = 0; *s != '\0'; s++)
  100013:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100017:	8b 45 08             	mov    0x8(%ebp),%eax
  10001a:	0f b6 00             	movzbl (%eax),%eax
  10001d:	84 c0                	test   %al,%al
  10001f:	75 ee                	jne    10000f <strlen+0xf>
		n++;
	return n;
  100021:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100024:	c9                   	leave  
  100025:	c3                   	ret    

00100026 <strnlen>:

int
strnlen(const char *s, size_t size)
{
  100026:	55                   	push   %ebp
  100027:	89 e5                	mov    %esp,%ebp
  100029:	83 ec 10             	sub    $0x10,%esp
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  10002c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100033:	eb 0c                	jmp    100041 <strnlen+0x1b>
		n++;
  100035:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
int
strnlen(const char *s, size_t size)
{
	int n;

	for (n = 0; size > 0 && *s != '\0'; s++, size--)
  100039:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10003d:	83 6d 0c 01          	subl   $0x1,0xc(%ebp)
  100041:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  100045:	74 0a                	je     100051 <strnlen+0x2b>
  100047:	8b 45 08             	mov    0x8(%ebp),%eax
  10004a:	0f b6 00             	movzbl (%eax),%eax
  10004d:	84 c0                	test   %al,%al
  10004f:	75 e4                	jne    100035 <strnlen+0xf>
		n++;
	return n;
  100051:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100054:	c9                   	leave  
  100055:	c3                   	ret    

00100056 <strcpy>:

char *
strcpy(char *dst, const char *src)
{
  100056:	55                   	push   %ebp
  100057:	89 e5                	mov    %esp,%ebp
  100059:	83 ec 10             	sub    $0x10,%esp
	char *ret;

	ret = dst;
  10005c:	8b 45 08             	mov    0x8(%ebp),%eax
  10005f:	89 45 fc             	mov    %eax,-0x4(%ebp)
	while ((*dst++ = *src++) != '\0')
  100062:	90                   	nop
  100063:	8b 45 08             	mov    0x8(%ebp),%eax
  100066:	8d 50 01             	lea    0x1(%eax),%edx
  100069:	89 55 08             	mov    %edx,0x8(%ebp)
  10006c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10006f:	8d 4a 01             	lea    0x1(%edx),%ecx
  100072:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  100075:	0f b6 12             	movzbl (%edx),%edx
  100078:	88 10                	mov    %dl,(%eax)
  10007a:	0f b6 00             	movzbl (%eax),%eax
  10007d:	84 c0                	test   %al,%al
  10007f:	75 e2                	jne    100063 <strcpy+0xd>
		/* do nothing */;
	return ret;
  100081:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100084:	c9                   	leave  
  100085:	c3                   	ret    

00100086 <strcat>:

char *
strcat(char *dst, const char *src)
{
  100086:	55                   	push   %ebp
  100087:	89 e5                	mov    %esp,%ebp
  100089:	83 ec 10             	sub    $0x10,%esp
	int len = strlen(dst);
  10008c:	ff 75 08             	pushl  0x8(%ebp)
  10008f:	e8 6c ff ff ff       	call   100000 <strlen>
  100094:	83 c4 04             	add    $0x4,%esp
  100097:	89 45 fc             	mov    %eax,-0x4(%ebp)
	strcpy(dst + len, src);
  10009a:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10009d:	8b 45 08             	mov    0x8(%ebp),%eax
  1000a0:	01 d0                	add    %edx,%eax
  1000a2:	ff 75 0c             	pushl  0xc(%ebp)
  1000a5:	50                   	push   %eax
  1000a6:	e8 ab ff ff ff       	call   100056 <strcpy>
  1000ab:	83 c4 08             	add    $0x8,%esp
	return dst;
  1000ae:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1000b1:	c9                   	leave  
  1000b2:	c3                   	ret    

001000b3 <strncpy>:

char *
strncpy(char *dst, const char *src, size_t size) {
  1000b3:	55                   	push   %ebp
  1000b4:	89 e5                	mov    %esp,%ebp
  1000b6:	83 ec 10             	sub    $0x10,%esp
	size_t i;
	char *ret;

	ret = dst;
  1000b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1000bc:	89 45 f8             	mov    %eax,-0x8(%ebp)
	for (i = 0; i < size; i++) {
  1000bf:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1000c6:	eb 23                	jmp    1000eb <strncpy+0x38>
		*dst++ = *src;
  1000c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1000cb:	8d 50 01             	lea    0x1(%eax),%edx
  1000ce:	89 55 08             	mov    %edx,0x8(%ebp)
  1000d1:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000d4:	0f b6 12             	movzbl (%edx),%edx
  1000d7:	88 10                	mov    %dl,(%eax)
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
  1000d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1000dc:	0f b6 00             	movzbl (%eax),%eax
  1000df:	84 c0                	test   %al,%al
  1000e1:	74 04                	je     1000e7 <strncpy+0x34>
			src++;
  1000e3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
strncpy(char *dst, const char *src, size_t size) {
	size_t i;
	char *ret;

	ret = dst;
	for (i = 0; i < size; i++) {
  1000e7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1000eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1000ee:	3b 45 10             	cmp    0x10(%ebp),%eax
  1000f1:	72 d5                	jb     1000c8 <strncpy+0x15>
		*dst++ = *src;
		// If strlen(src) < size, null-pad 'dst' out to 'size' chars
		if (*src != '\0')
			src++;
	}
	return ret;
  1000f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  1000f6:	c9                   	leave  
  1000f7:	c3                   	ret    

001000f8 <strlcpy>:

size_t
strlcpy(char *dst, const char *src, size_t size)
{
  1000f8:	55                   	push   %ebp
  1000f9:	89 e5                	mov    %esp,%ebp
  1000fb:	83 ec 10             	sub    $0x10,%esp
	char *dst_in;

	dst_in = dst;
  1000fe:	8b 45 08             	mov    0x8(%ebp),%eax
  100101:	89 45 fc             	mov    %eax,-0x4(%ebp)
	if (size > 0) {
  100104:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  100108:	74 33                	je     10013d <strlcpy+0x45>
		while (--size > 0 && *src != '\0')
  10010a:	eb 17                	jmp    100123 <strlcpy+0x2b>
			*dst++ = *src++;
  10010c:	8b 45 08             	mov    0x8(%ebp),%eax
  10010f:	8d 50 01             	lea    0x1(%eax),%edx
  100112:	89 55 08             	mov    %edx,0x8(%ebp)
  100115:	8b 55 0c             	mov    0xc(%ebp),%edx
  100118:	8d 4a 01             	lea    0x1(%edx),%ecx
  10011b:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  10011e:	0f b6 12             	movzbl (%edx),%edx
  100121:	88 10                	mov    %dl,(%eax)
{
	char *dst_in;

	dst_in = dst;
	if (size > 0) {
		while (--size > 0 && *src != '\0')
  100123:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  100127:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10012b:	74 0a                	je     100137 <strlcpy+0x3f>
  10012d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100130:	0f b6 00             	movzbl (%eax),%eax
  100133:	84 c0                	test   %al,%al
  100135:	75 d5                	jne    10010c <strlcpy+0x14>
			*dst++ = *src++;
		*dst = '\0';
  100137:	8b 45 08             	mov    0x8(%ebp),%eax
  10013a:	c6 00 00             	movb   $0x0,(%eax)
	}
	return dst - dst_in;
  10013d:	8b 55 08             	mov    0x8(%ebp),%edx
  100140:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100143:	29 c2                	sub    %eax,%edx
  100145:	89 d0                	mov    %edx,%eax
}
  100147:	c9                   	leave  
  100148:	c3                   	ret    

00100149 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  100149:	55                   	push   %ebp
  10014a:	89 e5                	mov    %esp,%ebp
	while (*p && *p == *q)
  10014c:	eb 08                	jmp    100156 <strcmp+0xd>
		p++, q++;
  10014e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100152:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
	while (*p && *p == *q)
  100156:	8b 45 08             	mov    0x8(%ebp),%eax
  100159:	0f b6 00             	movzbl (%eax),%eax
  10015c:	84 c0                	test   %al,%al
  10015e:	74 10                	je     100170 <strcmp+0x27>
  100160:	8b 45 08             	mov    0x8(%ebp),%eax
  100163:	0f b6 10             	movzbl (%eax),%edx
  100166:	8b 45 0c             	mov    0xc(%ebp),%eax
  100169:	0f b6 00             	movzbl (%eax),%eax
  10016c:	38 c2                	cmp    %al,%dl
  10016e:	74 de                	je     10014e <strcmp+0x5>
		p++, q++;
	return (int) ((unsigned char) *p - (unsigned char) *q);
  100170:	8b 45 08             	mov    0x8(%ebp),%eax
  100173:	0f b6 00             	movzbl (%eax),%eax
  100176:	0f b6 d0             	movzbl %al,%edx
  100179:	8b 45 0c             	mov    0xc(%ebp),%eax
  10017c:	0f b6 00             	movzbl (%eax),%eax
  10017f:	0f b6 c0             	movzbl %al,%eax
  100182:	29 c2                	sub    %eax,%edx
  100184:	89 d0                	mov    %edx,%eax
}
  100186:	5d                   	pop    %ebp
  100187:	c3                   	ret    

00100188 <strncmp>:

int
strncmp(const char *p, const char *q, size_t n)
{
  100188:	55                   	push   %ebp
  100189:	89 e5                	mov    %esp,%ebp
	while (n > 0 && *p && *p == *q)
  10018b:	eb 0c                	jmp    100199 <strncmp+0x11>
		n--, p++, q++;
  10018d:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
  100191:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100195:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strncmp(const char *p, const char *q, size_t n)
{
	while (n > 0 && *p && *p == *q)
  100199:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  10019d:	74 1a                	je     1001b9 <strncmp+0x31>
  10019f:	8b 45 08             	mov    0x8(%ebp),%eax
  1001a2:	0f b6 00             	movzbl (%eax),%eax
  1001a5:	84 c0                	test   %al,%al
  1001a7:	74 10                	je     1001b9 <strncmp+0x31>
  1001a9:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ac:	0f b6 10             	movzbl (%eax),%edx
  1001af:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001b2:	0f b6 00             	movzbl (%eax),%eax
  1001b5:	38 c2                	cmp    %al,%dl
  1001b7:	74 d4                	je     10018d <strncmp+0x5>
		n--, p++, q++;
	if (n == 0)
  1001b9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1001bd:	75 07                	jne    1001c6 <strncmp+0x3e>
		return 0;
  1001bf:	b8 00 00 00 00       	mov    $0x0,%eax
  1001c4:	eb 16                	jmp    1001dc <strncmp+0x54>
	else
		return (int) ((unsigned char) *p - (unsigned char) *q);
  1001c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1001c9:	0f b6 00             	movzbl (%eax),%eax
  1001cc:	0f b6 d0             	movzbl %al,%edx
  1001cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001d2:	0f b6 00             	movzbl (%eax),%eax
  1001d5:	0f b6 c0             	movzbl %al,%eax
  1001d8:	29 c2                	sub    %eax,%edx
  1001da:	89 d0                	mov    %edx,%eax
}
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    

001001de <strchr>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 04             	sub    $0x4,%esp
  1001e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1001e7:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
  1001ea:	eb 14                	jmp    100200 <strchr+0x22>
		if (*s == c)
  1001ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1001ef:	0f b6 00             	movzbl (%eax),%eax
  1001f2:	3a 45 fc             	cmp    -0x4(%ebp),%al
  1001f5:	75 05                	jne    1001fc <strchr+0x1e>
			return (char *) s;
  1001f7:	8b 45 08             	mov    0x8(%ebp),%eax
  1001fa:	eb 13                	jmp    10020f <strchr+0x31>
// Return a pointer to the first occurrence of 'c' in 's',
// or a null pointer if the string has no 'c'.
char *
strchr(const char *s, char c)
{
	for (; *s; s++)
  1001fc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100200:	8b 45 08             	mov    0x8(%ebp),%eax
  100203:	0f b6 00             	movzbl (%eax),%eax
  100206:	84 c0                	test   %al,%al
  100208:	75 e2                	jne    1001ec <strchr+0xe>
		if (*s == c)
			return (char *) s;
	return 0;
  10020a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  10020f:	c9                   	leave  
  100210:	c3                   	ret    

00100211 <strfind>:

// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
  100211:	55                   	push   %ebp
  100212:	89 e5                	mov    %esp,%ebp
  100214:	83 ec 04             	sub    $0x4,%esp
  100217:	8b 45 0c             	mov    0xc(%ebp),%eax
  10021a:	88 45 fc             	mov    %al,-0x4(%ebp)
	for (; *s; s++)
  10021d:	eb 0f                	jmp    10022e <strfind+0x1d>
		if (*s == c)
  10021f:	8b 45 08             	mov    0x8(%ebp),%eax
  100222:	0f b6 00             	movzbl (%eax),%eax
  100225:	3a 45 fc             	cmp    -0x4(%ebp),%al
  100228:	74 10                	je     10023a <strfind+0x29>
// Return a pointer to the first occurrence of 'c' in 's',
// or a pointer to the string-ending null character if the string has no 'c'.
char *
strfind(const char *s, char c)
{
	for (; *s; s++)
  10022a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10022e:	8b 45 08             	mov    0x8(%ebp),%eax
  100231:	0f b6 00             	movzbl (%eax),%eax
  100234:	84 c0                	test   %al,%al
  100236:	75 e7                	jne    10021f <strfind+0xe>
  100238:	eb 01                	jmp    10023b <strfind+0x2a>
		if (*s == c)
			break;
  10023a:	90                   	nop
	return (char *) s;
  10023b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10023e:	c9                   	leave  
  10023f:	c3                   	ret    

00100240 <memset>:

#if ASM
void *
memset(void *v, int c, size_t n)
{
  100240:	55                   	push   %ebp
  100241:	89 e5                	mov    %esp,%ebp
  100243:	57                   	push   %edi
	//char *p;

	if (n == 0)
  100244:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  100248:	75 05                	jne    10024f <memset+0xf>
		return v;
  10024a:	8b 45 08             	mov    0x8(%ebp),%eax
  10024d:	eb 5c                	jmp    1002ab <memset+0x6b>
	if ((int)v%4 == 0 && n%4 == 0) {
  10024f:	8b 45 08             	mov    0x8(%ebp),%eax
  100252:	83 e0 03             	and    $0x3,%eax
  100255:	85 c0                	test   %eax,%eax
  100257:	75 41                	jne    10029a <memset+0x5a>
  100259:	8b 45 10             	mov    0x10(%ebp),%eax
  10025c:	83 e0 03             	and    $0x3,%eax
  10025f:	85 c0                	test   %eax,%eax
  100261:	75 37                	jne    10029a <memset+0x5a>
		c &= 0xFF;
  100263:	81 65 0c ff 00 00 00 	andl   $0xff,0xc(%ebp)
		c = (c<<24)|(c<<16)|(c<<8)|c;
  10026a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10026d:	c1 e0 18             	shl    $0x18,%eax
  100270:	89 c2                	mov    %eax,%edx
  100272:	8b 45 0c             	mov    0xc(%ebp),%eax
  100275:	c1 e0 10             	shl    $0x10,%eax
  100278:	09 c2                	or     %eax,%edx
  10027a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10027d:	c1 e0 08             	shl    $0x8,%eax
  100280:	09 d0                	or     %edx,%eax
  100282:	09 45 0c             	or     %eax,0xc(%ebp)
		asm volatile("cld; rep stosl\n"
			:: "D" (v), "a" (c), "c" (n/4)
  100285:	8b 45 10             	mov    0x10(%ebp),%eax
  100288:	c1 e8 02             	shr    $0x2,%eax
  10028b:	89 c1                	mov    %eax,%ecx
	if (n == 0)
		return v;
	if ((int)v%4 == 0 && n%4 == 0) {
		c &= 0xFF;
		c = (c<<24)|(c<<16)|(c<<8)|c;
		asm volatile("cld; rep stosl\n"
  10028d:	8b 55 08             	mov    0x8(%ebp),%edx
  100290:	8b 45 0c             	mov    0xc(%ebp),%eax
  100293:	89 d7                	mov    %edx,%edi
  100295:	fc                   	cld    
  100296:	f3 ab                	rep stos %eax,%es:(%edi)
  100298:	eb 0e                	jmp    1002a8 <memset+0x68>
			:: "D" (v), "a" (c), "c" (n/4)
			: "cc", "memory");
	} else
		asm volatile("cld; rep stosb\n"
  10029a:	8b 55 08             	mov    0x8(%ebp),%edx
  10029d:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002a0:	8b 4d 10             	mov    0x10(%ebp),%ecx
  1002a3:	89 d7                	mov    %edx,%edi
  1002a5:	fc                   	cld    
  1002a6:	f3 aa                	rep stos %al,%es:(%edi)
			:: "D" (v), "a" (c), "c" (n)
			: "cc", "memory");
	return v;
  1002a8:	8b 45 08             	mov    0x8(%ebp),%eax
}
  1002ab:	5f                   	pop    %edi
  1002ac:	5d                   	pop    %ebp
  1002ad:	c3                   	ret    

001002ae <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  1002ae:	55                   	push   %ebp
  1002af:	89 e5                	mov    %esp,%ebp
  1002b1:	57                   	push   %edi
  1002b2:	56                   	push   %esi
  1002b3:	53                   	push   %ebx
  1002b4:	83 ec 10             	sub    $0x10,%esp
	const char *s;
	char *d;

	s = src;
  1002b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1002ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
	d = dst;
  1002bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1002c0:	89 45 ec             	mov    %eax,-0x14(%ebp)
	if (s < d && s + n > d) {
  1002c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002c6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1002c9:	73 6d                	jae    100338 <memmove+0x8a>
  1002cb:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1002ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1002d1:	01 d0                	add    %edx,%eax
  1002d3:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  1002d6:	76 60                	jbe    100338 <memmove+0x8a>
		s += n;
  1002d8:	8b 45 10             	mov    0x10(%ebp),%eax
  1002db:	01 45 f0             	add    %eax,-0x10(%ebp)
		d += n;
  1002de:	8b 45 10             	mov    0x10(%ebp),%eax
  1002e1:	01 45 ec             	add    %eax,-0x14(%ebp)
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  1002e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002e7:	83 e0 03             	and    $0x3,%eax
  1002ea:	85 c0                	test   %eax,%eax
  1002ec:	75 2f                	jne    10031d <memmove+0x6f>
  1002ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1002f1:	83 e0 03             	and    $0x3,%eax
  1002f4:	85 c0                	test   %eax,%eax
  1002f6:	75 25                	jne    10031d <memmove+0x6f>
  1002f8:	8b 45 10             	mov    0x10(%ebp),%eax
  1002fb:	83 e0 03             	and    $0x3,%eax
  1002fe:	85 c0                	test   %eax,%eax
  100300:	75 1b                	jne    10031d <memmove+0x6f>
			asm volatile("std; rep movsl\n"
				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
  100302:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100305:	83 e8 04             	sub    $0x4,%eax
  100308:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10030b:	83 ea 04             	sub    $0x4,%edx
  10030e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100311:	c1 e9 02             	shr    $0x2,%ecx
	d = dst;
	if (s < d && s + n > d) {
		s += n;
		d += n;
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("std; rep movsl\n"
  100314:	89 c7                	mov    %eax,%edi
  100316:	89 d6                	mov    %edx,%esi
  100318:	fd                   	std    
  100319:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10031b:	eb 18                	jmp    100335 <memmove+0x87>
				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
		else
			asm volatile("std; rep movsb\n"
				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
  10031d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100320:	8d 50 ff             	lea    -0x1(%eax),%edx
  100323:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100326:	8d 58 ff             	lea    -0x1(%eax),%ebx
		d += n;
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("std; rep movsl\n"
				:: "D" (d-4), "S" (s-4), "c" (n/4) : "cc", "memory");
		else
			asm volatile("std; rep movsb\n"
  100329:	8b 45 10             	mov    0x10(%ebp),%eax
  10032c:	89 d7                	mov    %edx,%edi
  10032e:	89 de                	mov    %ebx,%esi
  100330:	89 c1                	mov    %eax,%ecx
  100332:	fd                   	std    
  100333:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
  100335:	fc                   	cld    
  100336:	eb 45                	jmp    10037d <memmove+0xcf>
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
  100338:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10033b:	83 e0 03             	and    $0x3,%eax
  10033e:	85 c0                	test   %eax,%eax
  100340:	75 2b                	jne    10036d <memmove+0xbf>
  100342:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100345:	83 e0 03             	and    $0x3,%eax
  100348:	85 c0                	test   %eax,%eax
  10034a:	75 21                	jne    10036d <memmove+0xbf>
  10034c:	8b 45 10             	mov    0x10(%ebp),%eax
  10034f:	83 e0 03             	and    $0x3,%eax
  100352:	85 c0                	test   %eax,%eax
  100354:	75 17                	jne    10036d <memmove+0xbf>
			asm volatile("cld; rep movsl\n"
				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
  100356:	8b 45 10             	mov    0x10(%ebp),%eax
  100359:	c1 e8 02             	shr    $0x2,%eax
  10035c:	89 c1                	mov    %eax,%ecx
				:: "D" (d-1), "S" (s-1), "c" (n) : "cc", "memory");
		// Some versions of GCC rely on DF being clear
		asm volatile("cld" ::: "cc");
	} else {
		if ((int)s%4 == 0 && (int)d%4 == 0 && n%4 == 0)
			asm volatile("cld; rep movsl\n"
  10035e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100361:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100364:	89 c7                	mov    %eax,%edi
  100366:	89 d6                	mov    %edx,%esi
  100368:	fc                   	cld    
  100369:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10036b:	eb 10                	jmp    10037d <memmove+0xcf>
				:: "D" (d), "S" (s), "c" (n/4) : "cc", "memory");
		else
			asm volatile("cld; rep movsb\n"
  10036d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100370:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100373:	8b 4d 10             	mov    0x10(%ebp),%ecx
  100376:	89 c7                	mov    %eax,%edi
  100378:	89 d6                	mov    %edx,%esi
  10037a:	fc                   	cld    
  10037b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
				:: "D" (d), "S" (s), "c" (n) : "cc", "memory");
	}
	return dst;
  10037d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  100380:	83 c4 10             	add    $0x10,%esp
  100383:	5b                   	pop    %ebx
  100384:	5e                   	pop    %esi
  100385:	5f                   	pop    %edi
  100386:	5d                   	pop    %ebp
  100387:	c3                   	ret    

00100388 <memcpy>:
}
#endif

void *
memcpy(void *dst, const void *src, size_t n)
{
  100388:	55                   	push   %ebp
  100389:	89 e5                	mov    %esp,%ebp
	return memmove(dst, src, n);
  10038b:	ff 75 10             	pushl  0x10(%ebp)
  10038e:	ff 75 0c             	pushl  0xc(%ebp)
  100391:	ff 75 08             	pushl  0x8(%ebp)
  100394:	e8 15 ff ff ff       	call   1002ae <memmove>
  100399:	83 c4 0c             	add    $0xc,%esp
}
  10039c:	c9                   	leave  
  10039d:	c3                   	ret    

0010039e <memcmp>:

int
memcmp(const void *v1, const void *v2, size_t n)
{
  10039e:	55                   	push   %ebp
  10039f:	89 e5                	mov    %esp,%ebp
  1003a1:	83 ec 10             	sub    $0x10,%esp
	const uint8_t *s1 = (const uint8_t *) v1;
  1003a4:	8b 45 08             	mov    0x8(%ebp),%eax
  1003a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
	const uint8_t *s2 = (const uint8_t *) v2;
  1003aa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003ad:	89 45 f8             	mov    %eax,-0x8(%ebp)

	while (n-- > 0) {
  1003b0:	eb 30                	jmp    1003e2 <memcmp+0x44>
		if (*s1 != *s2)
  1003b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1003b5:	0f b6 10             	movzbl (%eax),%edx
  1003b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003bb:	0f b6 00             	movzbl (%eax),%eax
  1003be:	38 c2                	cmp    %al,%dl
  1003c0:	74 18                	je     1003da <memcmp+0x3c>
			return (int) *s1 - (int) *s2;
  1003c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1003c5:	0f b6 00             	movzbl (%eax),%eax
  1003c8:	0f b6 d0             	movzbl %al,%edx
  1003cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1003ce:	0f b6 00             	movzbl (%eax),%eax
  1003d1:	0f b6 c0             	movzbl %al,%eax
  1003d4:	29 c2                	sub    %eax,%edx
  1003d6:	89 d0                	mov    %edx,%eax
  1003d8:	eb 1a                	jmp    1003f4 <memcmp+0x56>
		s1++, s2++;
  1003da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  1003de:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
memcmp(const void *v1, const void *v2, size_t n)
{
	const uint8_t *s1 = (const uint8_t *) v1;
	const uint8_t *s2 = (const uint8_t *) v2;

	while (n-- > 0) {
  1003e2:	8b 45 10             	mov    0x10(%ebp),%eax
  1003e5:	8d 50 ff             	lea    -0x1(%eax),%edx
  1003e8:	89 55 10             	mov    %edx,0x10(%ebp)
  1003eb:	85 c0                	test   %eax,%eax
  1003ed:	75 c3                	jne    1003b2 <memcmp+0x14>
		if (*s1 != *s2)
			return (int) *s1 - (int) *s2;
		s1++, s2++;
	}

	return 0;
  1003ef:	b8 00 00 00 00       	mov    $0x0,%eax
}
  1003f4:	c9                   	leave  
  1003f5:	c3                   	ret    

001003f6 <memfind>:

void *
memfind(const void *s, int c, size_t n)
{
  1003f6:	55                   	push   %ebp
  1003f7:	89 e5                	mov    %esp,%ebp
  1003f9:	83 ec 10             	sub    $0x10,%esp
	const void *ends = (const char *) s + n;
  1003fc:	8b 55 08             	mov    0x8(%ebp),%edx
  1003ff:	8b 45 10             	mov    0x10(%ebp),%eax
  100402:	01 d0                	add    %edx,%eax
  100404:	89 45 fc             	mov    %eax,-0x4(%ebp)
	for (; s < ends; s++)
  100407:	eb 17                	jmp    100420 <memfind+0x2a>
		if (*(const unsigned char *) s == (unsigned char) c)
  100409:	8b 45 08             	mov    0x8(%ebp),%eax
  10040c:	0f b6 00             	movzbl (%eax),%eax
  10040f:	0f b6 d0             	movzbl %al,%edx
  100412:	8b 45 0c             	mov    0xc(%ebp),%eax
  100415:	0f b6 c0             	movzbl %al,%eax
  100418:	39 c2                	cmp    %eax,%edx
  10041a:	74 0e                	je     10042a <memfind+0x34>

void *
memfind(const void *s, int c, size_t n)
{
	const void *ends = (const char *) s + n;
	for (; s < ends; s++)
  10041c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100420:	8b 45 08             	mov    0x8(%ebp),%eax
  100423:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100426:	72 e1                	jb     100409 <memfind+0x13>
  100428:	eb 01                	jmp    10042b <memfind+0x35>
		if (*(const unsigned char *) s == (unsigned char) c)
			break;
  10042a:	90                   	nop
	return (void *) s;
  10042b:	8b 45 08             	mov    0x8(%ebp),%eax
}
  10042e:	c9                   	leave  
  10042f:	c3                   	ret    

00100430 <strtol>:

long
strtol(const char *s, char **endptr, int base)
{
  100430:	55                   	push   %ebp
  100431:	89 e5                	mov    %esp,%ebp
  100433:	83 ec 10             	sub    $0x10,%esp
	int neg = 0;
  100436:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
	long val = 0;
  10043d:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
  100444:	eb 04                	jmp    10044a <strtol+0x1a>
		s++;
  100446:	83 45 08 01          	addl   $0x1,0x8(%ebp)
{
	int neg = 0;
	long val = 0;

	// gobble initial whitespace
	while (*s == ' ' || *s == '\t')
  10044a:	8b 45 08             	mov    0x8(%ebp),%eax
  10044d:	0f b6 00             	movzbl (%eax),%eax
  100450:	3c 20                	cmp    $0x20,%al
  100452:	74 f2                	je     100446 <strtol+0x16>
  100454:	8b 45 08             	mov    0x8(%ebp),%eax
  100457:	0f b6 00             	movzbl (%eax),%eax
  10045a:	3c 09                	cmp    $0x9,%al
  10045c:	74 e8                	je     100446 <strtol+0x16>
		s++;

	// plus/minus sign
	if (*s == '+')
  10045e:	8b 45 08             	mov    0x8(%ebp),%eax
  100461:	0f b6 00             	movzbl (%eax),%eax
  100464:	3c 2b                	cmp    $0x2b,%al
  100466:	75 06                	jne    10046e <strtol+0x3e>
		s++;
  100468:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10046c:	eb 15                	jmp    100483 <strtol+0x53>
	else if (*s == '-')
  10046e:	8b 45 08             	mov    0x8(%ebp),%eax
  100471:	0f b6 00             	movzbl (%eax),%eax
  100474:	3c 2d                	cmp    $0x2d,%al
  100476:	75 0b                	jne    100483 <strtol+0x53>
		s++, neg = 1;
  100478:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  10047c:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)

	// hex or octal base prefix
	if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x'))
  100483:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  100487:	74 06                	je     10048f <strtol+0x5f>
  100489:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  10048d:	75 24                	jne    1004b3 <strtol+0x83>
  10048f:	8b 45 08             	mov    0x8(%ebp),%eax
  100492:	0f b6 00             	movzbl (%eax),%eax
  100495:	3c 30                	cmp    $0x30,%al
  100497:	75 1a                	jne    1004b3 <strtol+0x83>
  100499:	8b 45 08             	mov    0x8(%ebp),%eax
  10049c:	83 c0 01             	add    $0x1,%eax
  10049f:	0f b6 00             	movzbl (%eax),%eax
  1004a2:	3c 78                	cmp    $0x78,%al
  1004a4:	75 0d                	jne    1004b3 <strtol+0x83>
		s += 2, base = 16;
  1004a6:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  1004aa:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  1004b1:	eb 2a                	jmp    1004dd <strtol+0xad>
	else if (base == 0 && s[0] == '0')
  1004b3:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1004b7:	75 17                	jne    1004d0 <strtol+0xa0>
  1004b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1004bc:	0f b6 00             	movzbl (%eax),%eax
  1004bf:	3c 30                	cmp    $0x30,%al
  1004c1:	75 0d                	jne    1004d0 <strtol+0xa0>
		s++, base = 8;
  1004c3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  1004c7:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  1004ce:	eb 0d                	jmp    1004dd <strtol+0xad>
	else if (base == 0)
  1004d0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  1004d4:	75 07                	jne    1004dd <strtol+0xad>
		base = 10;
  1004d6:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

	// digits
	while (1) {
		int dig;

		if (*s >= '0' && *s <= '9')
  1004dd:	8b 45 08             	mov    0x8(%ebp),%eax
  1004e0:	0f b6 00             	movzbl (%eax),%eax
  1004e3:	3c 2f                	cmp    $0x2f,%al
  1004e5:	7e 1b                	jle    100502 <strtol+0xd2>
  1004e7:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ea:	0f b6 00             	movzbl (%eax),%eax
  1004ed:	3c 39                	cmp    $0x39,%al
  1004ef:	7f 11                	jg     100502 <strtol+0xd2>
			dig = *s - '0';
  1004f1:	8b 45 08             	mov    0x8(%ebp),%eax
  1004f4:	0f b6 00             	movzbl (%eax),%eax
  1004f7:	0f be c0             	movsbl %al,%eax
  1004fa:	83 e8 30             	sub    $0x30,%eax
  1004fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100500:	eb 48                	jmp    10054a <strtol+0x11a>
		else if (*s >= 'a' && *s <= 'z')
  100502:	8b 45 08             	mov    0x8(%ebp),%eax
  100505:	0f b6 00             	movzbl (%eax),%eax
  100508:	3c 60                	cmp    $0x60,%al
  10050a:	7e 1b                	jle    100527 <strtol+0xf7>
  10050c:	8b 45 08             	mov    0x8(%ebp),%eax
  10050f:	0f b6 00             	movzbl (%eax),%eax
  100512:	3c 7a                	cmp    $0x7a,%al
  100514:	7f 11                	jg     100527 <strtol+0xf7>
			dig = *s - 'a' + 10;
  100516:	8b 45 08             	mov    0x8(%ebp),%eax
  100519:	0f b6 00             	movzbl (%eax),%eax
  10051c:	0f be c0             	movsbl %al,%eax
  10051f:	83 e8 57             	sub    $0x57,%eax
  100522:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100525:	eb 23                	jmp    10054a <strtol+0x11a>
		else if (*s >= 'A' && *s <= 'Z')
  100527:	8b 45 08             	mov    0x8(%ebp),%eax
  10052a:	0f b6 00             	movzbl (%eax),%eax
  10052d:	3c 40                	cmp    $0x40,%al
  10052f:	7e 3c                	jle    10056d <strtol+0x13d>
  100531:	8b 45 08             	mov    0x8(%ebp),%eax
  100534:	0f b6 00             	movzbl (%eax),%eax
  100537:	3c 5a                	cmp    $0x5a,%al
  100539:	7f 32                	jg     10056d <strtol+0x13d>
			dig = *s - 'A' + 10;
  10053b:	8b 45 08             	mov    0x8(%ebp),%eax
  10053e:	0f b6 00             	movzbl (%eax),%eax
  100541:	0f be c0             	movsbl %al,%eax
  100544:	83 e8 37             	sub    $0x37,%eax
  100547:	89 45 f4             	mov    %eax,-0xc(%ebp)
		else
			break;
		if (dig >= base)
  10054a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10054d:	3b 45 10             	cmp    0x10(%ebp),%eax
  100550:	7d 1a                	jge    10056c <strtol+0x13c>
			break;
		s++, val = (val * base) + dig;
  100552:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  100556:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100559:	0f af 45 10          	imul   0x10(%ebp),%eax
  10055d:	89 c2                	mov    %eax,%edx
  10055f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100562:	01 d0                	add    %edx,%eax
  100564:	89 45 f8             	mov    %eax,-0x8(%ebp)
		// we don't properly detect overflow!
	}
  100567:	e9 71 ff ff ff       	jmp    1004dd <strtol+0xad>
		else if (*s >= 'A' && *s <= 'Z')
			dig = *s - 'A' + 10;
		else
			break;
		if (dig >= base)
			break;
  10056c:	90                   	nop
		s++, val = (val * base) + dig;
		// we don't properly detect overflow!
	}

	if (endptr)
  10056d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  100571:	74 08                	je     10057b <strtol+0x14b>
		*endptr = (char *) s;
  100573:	8b 45 0c             	mov    0xc(%ebp),%eax
  100576:	8b 55 08             	mov    0x8(%ebp),%edx
  100579:	89 10                	mov    %edx,(%eax)
	return (neg ? -val : val);
  10057b:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  10057f:	74 07                	je     100588 <strtol+0x158>
  100581:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100584:	f7 d8                	neg    %eax
  100586:	eb 03                	jmp    10058b <strtol+0x15b>
  100588:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  10058b:	c9                   	leave  
  10058c:	c3                   	ret    

0010058d <abort>:
#include "stdio.h"
#include "x86.h"

int abort(const char* filename, int line) {
  10058d:	55                   	push   %ebp
  10058e:	89 e5                	mov    %esp,%ebp
  100590:	83 ec 08             	sub    $0x8,%esp
}

static __inline void
cli(void)
{
	__asm __volatile("cli");
  100593:	fa                   	cli    
	cli();
	printk("%s,%d: Boom!\n", filename, line);
  100594:	83 ec 04             	sub    $0x4,%esp
  100597:	ff 75 0c             	pushl  0xc(%ebp)
  10059a:	ff 75 08             	pushl  0x8(%ebp)
  10059d:	68 40 16 10 00       	push   $0x101640
  1005a2:	e8 05 00 00 00       	call   1005ac <printk>
  1005a7:	83 c4 10             	add    $0x10,%esp
	while(1);
  1005aa:	eb fe                	jmp    1005aa <abort+0x1d>

001005ac <printk>:
void serial_printc(char);

void out_num(unsigned, unsigned, bool);
void out_string(char*);

int printk(const char *fmt, ...){
  1005ac:	55                   	push   %ebp
  1005ad:	89 e5                	mov    %esp,%ebp
  1005af:	83 ec 18             	sub    $0x18,%esp
	//char ch = *(unsigned char *)fmt;
	va_list ap;

	va_start(ap, fmt);
  1005b2:	8d 45 0c             	lea    0xc(%ebp),%eax
  1005b5:	89 45 f4             	mov    %eax,-0xc(%ebp)

	while(*fmt){
  1005b8:	e9 c0 00 00 00       	jmp    10067d <printk+0xd1>
		if(*fmt != '%'){
  1005bd:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c0:	0f b6 00             	movzbl (%eax),%eax
  1005c3:	3c 25                	cmp    $0x25,%al
  1005c5:	74 1a                	je     1005e1 <printk+0x35>
			serial_printc(*fmt);
  1005c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1005ca:	0f b6 00             	movzbl (%eax),%eax
  1005cd:	0f be c0             	movsbl %al,%eax
  1005d0:	83 ec 0c             	sub    $0xc,%esp
  1005d3:	50                   	push   %eax
  1005d4:	e8 22 02 00 00       	call   1007fb <serial_printc>
  1005d9:	83 c4 10             	add    $0x10,%esp
  1005dc:	e9 98 00 00 00       	jmp    100679 <printk+0xcd>
		}
		else {
			fmt++;
  1005e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
			switch(*fmt){
  1005e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1005e8:	0f b6 00             	movzbl (%eax),%eax
  1005eb:	0f be c0             	movsbl %al,%eax
  1005ee:	83 f8 64             	cmp    $0x64,%eax
  1005f1:	74 18                	je     10060b <printk+0x5f>
  1005f3:	83 f8 64             	cmp    $0x64,%eax
  1005f6:	7f 07                	jg     1005ff <printk+0x53>
  1005f8:	83 f8 63             	cmp    $0x63,%eax
  1005fb:	74 48                	je     100645 <printk+0x99>
				case 'd': out_num( va_arg(ap, int), 10, 1); break;
				case 'x': out_num( va_arg(ap, unsigned int), 16, 0); break;
				case 'c': serial_printc(va_arg(ap, unsigned int)); break;
				case 's': out_string(va_arg(ap, char*)); break;
				default: break;
  1005fd:	eb 7a                	jmp    100679 <printk+0xcd>
		if(*fmt != '%'){
			serial_printc(*fmt);
		}
		else {
			fmt++;
			switch(*fmt){
  1005ff:	83 f8 73             	cmp    $0x73,%eax
  100602:	74 5d                	je     100661 <printk+0xb5>
  100604:	83 f8 78             	cmp    $0x78,%eax
  100607:	74 1f                	je     100628 <printk+0x7c>
				case 'd': out_num( va_arg(ap, int), 10, 1); break;
				case 'x': out_num( va_arg(ap, unsigned int), 16, 0); break;
				case 'c': serial_printc(va_arg(ap, unsigned int)); break;
				case 's': out_string(va_arg(ap, char*)); break;
				default: break;
  100609:	eb 6e                	jmp    100679 <printk+0xcd>
			serial_printc(*fmt);
		}
		else {
			fmt++;
			switch(*fmt){
				case 'd': out_num( va_arg(ap, int), 10, 1); break;
  10060b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10060e:	8d 50 04             	lea    0x4(%eax),%edx
  100611:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100614:	8b 00                	mov    (%eax),%eax
  100616:	83 ec 04             	sub    $0x4,%esp
  100619:	6a 01                	push   $0x1
  10061b:	6a 0a                	push   $0xa
  10061d:	50                   	push   %eax
  10061e:	e8 bd 00 00 00       	call   1006e0 <out_num>
  100623:	83 c4 10             	add    $0x10,%esp
  100626:	eb 51                	jmp    100679 <printk+0xcd>
				case 'x': out_num( va_arg(ap, unsigned int), 16, 0); break;
  100628:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10062b:	8d 50 04             	lea    0x4(%eax),%edx
  10062e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100631:	8b 00                	mov    (%eax),%eax
  100633:	83 ec 04             	sub    $0x4,%esp
  100636:	6a 00                	push   $0x0
  100638:	6a 10                	push   $0x10
  10063a:	50                   	push   %eax
  10063b:	e8 a0 00 00 00       	call   1006e0 <out_num>
  100640:	83 c4 10             	add    $0x10,%esp
  100643:	eb 34                	jmp    100679 <printk+0xcd>
				case 'c': serial_printc(va_arg(ap, unsigned int)); break;
  100645:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100648:	8d 50 04             	lea    0x4(%eax),%edx
  10064b:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10064e:	8b 00                	mov    (%eax),%eax
  100650:	0f be c0             	movsbl %al,%eax
  100653:	83 ec 0c             	sub    $0xc,%esp
  100656:	50                   	push   %eax
  100657:	e8 9f 01 00 00       	call   1007fb <serial_printc>
  10065c:	83 c4 10             	add    $0x10,%esp
  10065f:	eb 18                	jmp    100679 <printk+0xcd>
				case 's': out_string(va_arg(ap, char*)); break;
  100661:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100664:	8d 50 04             	lea    0x4(%eax),%edx
  100667:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10066a:	8b 00                	mov    (%eax),%eax
  10066c:	83 ec 0c             	sub    $0xc,%esp
  10066f:	50                   	push   %eax
  100670:	e8 a8 00 00 00       	call   10071d <out_string>
  100675:	83 c4 10             	add    $0x10,%esp
  100678:	90                   	nop
				default: break;
			}
		}
		fmt++;
  100679:	83 45 08 01          	addl   $0x1,0x8(%ebp)
	//char ch = *(unsigned char *)fmt;
	va_list ap;

	va_start(ap, fmt);

	while(*fmt){
  10067d:	8b 45 08             	mov    0x8(%ebp),%eax
  100680:	0f b6 00             	movzbl (%eax),%eax
  100683:	84 c0                	test   %al,%al
  100685:	0f 85 32 ff ff ff    	jne    1005bd <printk+0x11>
		fmt++;
	}

	va_end(ap);

	return 0;
  10068b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100690:	c9                   	leave  
  100691:	c3                   	ret    

00100692 <rec_out_num>:

void rec_out_num(unsigned int x, unsigned int base){
  100692:	55                   	push   %ebp
  100693:	89 e5                	mov    %esp,%ebp
  100695:	83 ec 08             	sub    $0x8,%esp
	if(x >= base){
  100698:	8b 45 08             	mov    0x8(%ebp),%eax
  10069b:	3b 45 0c             	cmp    0xc(%ebp),%eax
  10069e:	72 1a                	jb     1006ba <rec_out_num+0x28>
		rec_out_num(x/base, base);
  1006a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1006a3:	ba 00 00 00 00       	mov    $0x0,%edx
  1006a8:	f7 75 0c             	divl   0xc(%ebp)
  1006ab:	83 ec 08             	sub    $0x8,%esp
  1006ae:	ff 75 0c             	pushl  0xc(%ebp)
  1006b1:	50                   	push   %eax
  1006b2:	e8 db ff ff ff       	call   100692 <rec_out_num>
  1006b7:	83 c4 10             	add    $0x10,%esp
	}
	serial_printc("0123456789abcdef"[x%base]);
  1006ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bd:	ba 00 00 00 00       	mov    $0x0,%edx
  1006c2:	f7 75 0c             	divl   0xc(%ebp)
  1006c5:	89 d0                	mov    %edx,%eax
  1006c7:	0f b6 80 4e 16 10 00 	movzbl 0x10164e(%eax),%eax
  1006ce:	0f be c0             	movsbl %al,%eax
  1006d1:	83 ec 0c             	sub    $0xc,%esp
  1006d4:	50                   	push   %eax
  1006d5:	e8 21 01 00 00       	call   1007fb <serial_printc>
  1006da:	83 c4 10             	add    $0x10,%esp
}
  1006dd:	90                   	nop
  1006de:	c9                   	leave  
  1006df:	c3                   	ret    

001006e0 <out_num>:

void out_num(unsigned int x, unsigned int base, bool SIGN){
  1006e0:	55                   	push   %ebp
  1006e1:	89 e5                	mov    %esp,%ebp
  1006e3:	83 ec 18             	sub    $0x18,%esp
  1006e6:	8b 45 10             	mov    0x10(%ebp),%eax
  1006e9:	88 45 f4             	mov    %al,-0xc(%ebp)
	if( SIGN && ((int)x)<0 ){
  1006ec:	80 7d f4 00          	cmpb   $0x0,-0xc(%ebp)
  1006f0:	74 17                	je     100709 <out_num+0x29>
  1006f2:	8b 45 08             	mov    0x8(%ebp),%eax
  1006f5:	85 c0                	test   %eax,%eax
  1006f7:	79 10                	jns    100709 <out_num+0x29>
		serial_printc('-');
  1006f9:	83 ec 0c             	sub    $0xc,%esp
  1006fc:	6a 2d                	push   $0x2d
  1006fe:	e8 f8 00 00 00       	call   1007fb <serial_printc>
  100703:	83 c4 10             	add    $0x10,%esp
		x = ~x;
  100706:	f7 55 08             	notl   0x8(%ebp)
	}
	rec_out_num(x, base);
  100709:	83 ec 08             	sub    $0x8,%esp
  10070c:	ff 75 0c             	pushl  0xc(%ebp)
  10070f:	ff 75 08             	pushl  0x8(%ebp)
  100712:	e8 7b ff ff ff       	call   100692 <rec_out_num>
  100717:	83 c4 10             	add    $0x10,%esp
}
  10071a:	90                   	nop
  10071b:	c9                   	leave  
  10071c:	c3                   	ret    

0010071d <out_string>:

void out_string(char *s){
  10071d:	55                   	push   %ebp
  10071e:	89 e5                	mov    %esp,%ebp
  100720:	83 ec 08             	sub    $0x8,%esp
	while(*s){
  100723:	eb 19                	jmp    10073e <out_string+0x21>
		serial_printc(*s);
  100725:	8b 45 08             	mov    0x8(%ebp),%eax
  100728:	0f b6 00             	movzbl (%eax),%eax
  10072b:	0f be c0             	movsbl %al,%eax
  10072e:	83 ec 0c             	sub    $0xc,%esp
  100731:	50                   	push   %eax
  100732:	e8 c4 00 00 00       	call   1007fb <serial_printc>
  100737:	83 c4 10             	add    $0x10,%esp
		s++;
  10073a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
	}
	rec_out_num(x, base);
}

void out_string(char *s){
	while(*s){
  10073e:	8b 45 08             	mov    0x8(%ebp),%eax
  100741:	0f b6 00             	movzbl (%eax),%eax
  100744:	84 c0                	test   %al,%al
  100746:	75 dd                	jne    100725 <out_string+0x8>
		serial_printc(*s);
		s++;
	}
}
  100748:	90                   	nop
  100749:	c9                   	leave  
  10074a:	c3                   	ret    

0010074b <init_serial>:
#include "x86.h"

#define PORT 0x3f8   /* COM1 */


void init_serial() {
  10074b:	55                   	push   %ebp
  10074c:	89 e5                	mov    %esp,%ebp
  10074e:	83 ec 30             	sub    $0x30,%esp
  100751:	c7 45 fc f9 03 00 00 	movl   $0x3f9,-0x4(%ebp)
  100758:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  10075c:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100760:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100763:	ee                   	out    %al,(%dx)
  100764:	c7 45 f8 fb 03 00 00 	movl   $0x3fb,-0x8(%ebp)
  10076b:	c6 45 de 80          	movb   $0x80,-0x22(%ebp)
  10076f:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100773:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100776:	ee                   	out    %al,(%dx)
  100777:	c7 45 f4 f8 03 00 00 	movl   $0x3f8,-0xc(%ebp)
  10077e:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  100782:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100786:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100789:	ee                   	out    %al,(%dx)
  10078a:	c7 45 f0 f9 03 00 00 	movl   $0x3f9,-0x10(%ebp)
  100791:	c6 45 e0 00          	movb   $0x0,-0x20(%ebp)
  100795:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100799:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10079c:	ee                   	out    %al,(%dx)
  10079d:	c7 45 ec fb 03 00 00 	movl   $0x3fb,-0x14(%ebp)
  1007a4:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
  1007a8:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1007ac:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1007af:	ee                   	out    %al,(%dx)
  1007b0:	c7 45 e8 fa 03 00 00 	movl   $0x3fa,-0x18(%ebp)
  1007b7:	c6 45 e2 c7          	movb   $0xc7,-0x1e(%ebp)
  1007bb:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  1007bf:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1007c2:	ee                   	out    %al,(%dx)
  1007c3:	c7 45 e4 fc 03 00 00 	movl   $0x3fc,-0x1c(%ebp)
  1007ca:	c6 45 e3 0b          	movb   $0xb,-0x1d(%ebp)
  1007ce:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1007d2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1007d5:	ee                   	out    %al,(%dx)
	outb(PORT + 0, 0x03);
	outb(PORT + 1, 0x00);
	outb(PORT + 3, 0x03);
	outb(PORT + 2, 0xC7);
	outb(PORT + 4, 0x0B);
}
  1007d6:	90                   	nop
  1007d7:	c9                   	leave  
  1007d8:	c3                   	ret    

001007d9 <is_serial_idle>:

int is_serial_idle() {
  1007d9:	55                   	push   %ebp
  1007da:	89 e5                	mov    %esp,%ebp
  1007dc:	83 ec 10             	sub    $0x10,%esp
  1007df:	c7 45 fc fd 03 00 00 	movl   $0x3fd,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1007e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1007e9:	89 c2                	mov    %eax,%edx
  1007eb:	ec                   	in     (%dx),%al
  1007ec:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
  1007ef:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
	return inb(PORT + 5) & 0x20;
  1007f3:	0f b6 c0             	movzbl %al,%eax
  1007f6:	83 e0 20             	and    $0x20,%eax
}
  1007f9:	c9                   	leave  
  1007fa:	c3                   	ret    

001007fb <serial_printc>:

void serial_printc(char a){
  1007fb:	55                   	push   %ebp
  1007fc:	89 e5                	mov    %esp,%ebp
  1007fe:	83 ec 14             	sub    $0x14,%esp
  100801:	8b 45 08             	mov    0x8(%ebp),%eax
  100804:	88 45 ec             	mov    %al,-0x14(%ebp)
	while(!is_serial_idle());
  100807:	90                   	nop
  100808:	e8 cc ff ff ff       	call   1007d9 <is_serial_idle>
  10080d:	85 c0                	test   %eax,%eax
  10080f:	74 f7                	je     100808 <serial_printc+0xd>
	outb(PORT, a);
  100811:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100815:	0f b6 c0             	movzbl %al,%eax
  100818:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
  10081f:	88 45 fb             	mov    %al,-0x5(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100822:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  100826:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100829:	ee                   	out    %al,(%dx)
}
  10082a:	90                   	nop
  10082b:	c9                   	leave  
  10082c:	c3                   	ret    

0010082d <serial_output_test>:

void serial_output_test(){
  10082d:	55                   	push   %ebp
  10082e:	89 e5                	mov    %esp,%ebp
  100830:	83 ec 30             	sub    $0x30,%esp
  100833:	c7 45 fc f8 03 00 00 	movl   $0x3f8,-0x4(%ebp)
  10083a:	c6 45 dd 41          	movb   $0x41,-0x23(%ebp)
  10083e:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100842:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100845:	ee                   	out    %al,(%dx)
  100846:	c7 45 f8 f8 03 00 00 	movl   $0x3f8,-0x8(%ebp)
  10084d:	c6 45 de 4e          	movb   $0x4e,-0x22(%ebp)
  100851:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100855:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100858:	ee                   	out    %al,(%dx)
  100859:	c7 45 f4 f8 03 00 00 	movl   $0x3f8,-0xc(%ebp)
  100860:	c6 45 df 44          	movb   $0x44,-0x21(%ebp)
  100864:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100868:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10086b:	ee                   	out    %al,(%dx)
  10086c:	c7 45 f0 f8 03 00 00 	movl   $0x3f8,-0x10(%ebp)
  100873:	c6 45 e0 53          	movb   $0x53,-0x20(%ebp)
  100877:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  10087b:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10087e:	ee                   	out    %al,(%dx)
  10087f:	c7 45 ec f8 03 00 00 	movl   $0x3f8,-0x14(%ebp)
  100886:	c6 45 e1 4f          	movb   $0x4f,-0x1f(%ebp)
  10088a:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  10088e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100891:	ee                   	out    %al,(%dx)
  100892:	c7 45 e8 f8 03 00 00 	movl   $0x3f8,-0x18(%ebp)
  100899:	c6 45 e2 52          	movb   $0x52,-0x1e(%ebp)
  10089d:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  1008a1:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1008a4:	ee                   	out    %al,(%dx)
  1008a5:	c7 45 e4 f8 03 00 00 	movl   $0x3f8,-0x1c(%ebp)
  1008ac:	c6 45 e3 41          	movb   $0x41,-0x1d(%ebp)
  1008b0:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1008b4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1008b7:	ee                   	out    %al,(%dx)
	outb(PORT + 0, 'D');
	outb(PORT + 0, 'S');
	outb(PORT + 0, 'O');
	outb(PORT + 0, 'R');
	outb(PORT + 0, 'A');
}
  1008b8:	90                   	nop
  1008b9:	c9                   	leave  
  1008ba:	c3                   	ret    

001008bb <do_syscall>:

extern uint32_t time_tick;
int handle_keys();
int load_vmem(uint8_t*);

void do_syscall(TrapFrame *tf) {
  1008bb:	55                   	push   %ebp
  1008bc:	89 e5                	mov    %esp,%ebp
  1008be:	83 ec 08             	sub    $0x8,%esp
	switch(tf->eax) {
  1008c1:	8b 45 08             	mov    0x8(%ebp),%eax
  1008c4:	8b 40 1c             	mov    0x1c(%eax),%eax
  1008c7:	83 f8 01             	cmp    $0x1,%eax
  1008ca:	74 1a                	je     1008e6 <do_syscall+0x2b>
  1008cc:	83 f8 01             	cmp    $0x1,%eax
  1008cf:	72 07                	jb     1008d8 <do_syscall+0x1d>
  1008d1:	83 f8 02             	cmp    $0x2,%eax
  1008d4:	74 1f                	je     1008f5 <do_syscall+0x3a>
  1008d6:	eb 39                	jmp    100911 <do_syscall+0x56>
		case SYS_time:	tf->eax = time_tick; break;
  1008d8:	8b 15 38 20 26 00    	mov    0x262038,%edx
  1008de:	8b 45 08             	mov    0x8(%ebp),%eax
  1008e1:	89 50 1c             	mov    %edx,0x1c(%eax)
  1008e4:	eb 54                	jmp    10093a <do_syscall+0x7f>
		case SYS_kbd:	tf->eax = handle_keys(); break;
  1008e6:	e8 60 01 00 00       	call   100a4b <handle_keys>
  1008eb:	89 c2                	mov    %eax,%edx
  1008ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f0:	89 50 1c             	mov    %edx,0x1c(%eax)
  1008f3:	eb 45                	jmp    10093a <do_syscall+0x7f>
		case SYS_video:	tf->eax = load_vmem((uint8_t *)tf->ebx); break;
  1008f5:	8b 45 08             	mov    0x8(%ebp),%eax
  1008f8:	8b 40 10             	mov    0x10(%eax),%eax
  1008fb:	83 ec 0c             	sub    $0xc,%esp
  1008fe:	50                   	push   %eax
  1008ff:	e8 78 00 00 00       	call   10097c <load_vmem>
  100904:	83 c4 10             	add    $0x10,%esp
  100907:	89 c2                	mov    %eax,%edx
  100909:	8b 45 08             	mov    0x8(%ebp),%eax
  10090c:	89 50 1c             	mov    %edx,0x1c(%eax)
  10090f:	eb 29                	jmp    10093a <do_syscall+0x7f>
		default: panic("Unhandled system call: id = %d", tf->eax);
  100911:	8b 45 08             	mov    0x8(%ebp),%eax
  100914:	8b 40 1c             	mov    0x1c(%eax),%eax
  100917:	83 ec 08             	sub    $0x8,%esp
  10091a:	50                   	push   %eax
  10091b:	68 60 16 10 00       	push   $0x101660
  100920:	e8 87 fc ff ff       	call   1005ac <printk>
  100925:	83 c4 10             	add    $0x10,%esp
  100928:	83 ec 08             	sub    $0x8,%esp
  10092b:	6a 0f                	push   $0xf
  10092d:	68 7f 16 10 00       	push   $0x10167f
  100932:	e8 56 fc ff ff       	call   10058d <abort>
  100937:	83 c4 10             	add    $0x10,%esp
	}
}
  10093a:	90                   	nop
  10093b:	c9                   	leave  
  10093c:	c3                   	ret    

0010093d <init_vmem_addr>:
#include "string.h"
#include "device/video.h"

uint8_t *vmem;

void init_vmem_addr() {
  10093d:	55                   	push   %ebp
  10093e:	89 e5                	mov    %esp,%ebp
  100940:	83 ec 10             	sub    $0x10,%esp
	struct ModeInfoBlock *MIB = (struct ModeInfoBlock *)(0x7e00);
  100943:	c7 45 fc 00 7e 00 00 	movl   $0x7e00,-0x4(%ebp)
	vmem = (uint8_t *)MIB->physbase;
  10094a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10094d:	8b 40 28             	mov    0x28(%eax),%eax
  100950:	a3 8c 21 26 00       	mov    %eax,0x26218c
}
  100955:	90                   	nop
  100956:	c9                   	leave  
  100957:	c3                   	ret    

00100958 <init_vmem>:

void init_vmem() {
  100958:	55                   	push   %ebp
  100959:	89 e5                	mov    %esp,%ebp
  10095b:	83 ec 08             	sub    $0x8,%esp
	memcpy(vmem, gImage_PARK, SCR_SIZE);
  10095e:	a1 8c 21 26 00       	mov    0x26218c,%eax
  100963:	83 ec 04             	sub    $0x4,%esp
  100966:	68 00 f9 15 00       	push   $0x15f900
  10096b:	68 a0 16 10 00       	push   $0x1016a0
  100970:	50                   	push   %eax
  100971:	e8 12 fa ff ff       	call   100388 <memcpy>
  100976:	83 c4 10             	add    $0x10,%esp
}
  100979:	90                   	nop
  10097a:	c9                   	leave  
  10097b:	c3                   	ret    

0010097c <load_vmem>:

int load_vmem(uint8_t *buffer) {
  10097c:	55                   	push   %ebp
  10097d:	89 e5                	mov    %esp,%ebp
  10097f:	83 ec 08             	sub    $0x8,%esp
	memcpy(vmem, buffer, SCR_SIZE);
  100982:	a1 8c 21 26 00       	mov    0x26218c,%eax
  100987:	83 ec 04             	sub    $0x4,%esp
  10098a:	68 00 f9 15 00       	push   $0x15f900
  10098f:	ff 75 08             	pushl  0x8(%ebp)
  100992:	50                   	push   %eax
  100993:	e8 f0 f9 ff ff       	call   100388 <memcpy>
  100998:	83 c4 10             	add    $0x10,%esp
	return 1;
  10099b:	b8 01 00 00 00       	mov    $0x1,%eax
}
  1009a0:	c9                   	leave  
  1009a1:	c3                   	ret    

001009a2 <keyboard_event>:

//static const char *keyboard_string[] = {"UP", "DOWN", "LEFT", "RIGHT", "Z", "ENTER"};

static int key_state[NR_KEYS];

void keyboard_event(void) {
  1009a2:	55                   	push   %ebp
  1009a3:	89 e5                	mov    %esp,%ebp
  1009a5:	83 ec 10             	sub    $0x10,%esp
  1009a8:	c7 45 f4 60 00 00 00 	movl   $0x60,-0xc(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  1009af:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009b2:	89 c2                	mov    %eax,%edx
  1009b4:	ec                   	in     (%dx),%al
  1009b5:	88 45 f3             	mov    %al,-0xd(%ebp)
	return data;
  1009b8:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
	int key_code = inb(0x60);
  1009bc:	0f b6 c0             	movzbl %al,%eax
  1009bf:	89 45 f8             	mov    %eax,-0x8(%ebp)
	int i;
	for (i = 0; i < NR_KEYS; i ++){
  1009c2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  1009c9:	eb 77                	jmp    100a42 <keyboard_event+0xa0>
		if(key_code == keycode_array[i]) {
  1009cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009ce:	8b 04 85 a0 0f 26 00 	mov    0x260fa0(,%eax,4),%eax
  1009d5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1009d8:	75 42                	jne    100a1c <keyboard_event+0x7a>
			switch(key_state[i]) {
  1009da:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009dd:	8b 04 85 20 20 26 00 	mov    0x262020(,%eax,4),%eax
  1009e4:	83 f8 01             	cmp    $0x1,%eax
  1009e7:	74 20                	je     100a09 <keyboard_event+0x67>
  1009e9:	83 f8 01             	cmp    $0x1,%eax
  1009ec:	7f 06                	jg     1009f4 <keyboard_event+0x52>
  1009ee:	85 c0                	test   %eax,%eax
  1009f0:	74 07                	je     1009f9 <keyboard_event+0x57>
				case KEY_STATE_EMPTY:
				case KEY_STATE_RELEASE:
				case KEY_STATE_PRESS: key_state[i] = KEY_STATE_PRESS; break;
				case KEY_STATE_WAIT_RELEASE: key_state[i] = KEY_STATE_WAIT_RELEASE; break;
				default: /*assert(0);*/ break;
  1009f2:	eb 25                	jmp    100a19 <keyboard_event+0x77>
void keyboard_event(void) {
	int key_code = inb(0x60);
	int i;
	for (i = 0; i < NR_KEYS; i ++){
		if(key_code == keycode_array[i]) {
			switch(key_state[i]) {
  1009f4:	83 f8 03             	cmp    $0x3,%eax
  1009f7:	7f 20                	jg     100a19 <keyboard_event+0x77>
				case KEY_STATE_EMPTY:
				case KEY_STATE_RELEASE:
				case KEY_STATE_PRESS: key_state[i] = KEY_STATE_PRESS; break;
  1009f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1009fc:	c7 04 85 20 20 26 00 	movl   $0x3,0x262020(,%eax,4)
  100a03:	03 00 00 00 
  100a07:	eb 11                	jmp    100a1a <keyboard_event+0x78>
				case KEY_STATE_WAIT_RELEASE: key_state[i] = KEY_STATE_WAIT_RELEASE; break;
  100a09:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a0c:	c7 04 85 20 20 26 00 	movl   $0x1,0x262020(,%eax,4)
  100a13:	01 00 00 00 
  100a17:	eb 01                	jmp    100a1a <keyboard_event+0x78>
				default: /*assert(0);*/ break;
  100a19:	90                   	nop
			}
			break;
  100a1a:	eb 2c                	jmp    100a48 <keyboard_event+0xa6>
		}
		else if(key_code == keycode_array[i] + 0x80) {
  100a1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a1f:	8b 04 85 a0 0f 26 00 	mov    0x260fa0(,%eax,4),%eax
  100a26:	83 e8 80             	sub    $0xffffff80,%eax
  100a29:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100a2c:	75 10                	jne    100a3e <keyboard_event+0x9c>
			key_state[i] = KEY_STATE_RELEASE;
  100a2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a31:	c7 04 85 20 20 26 00 	movl   $0x2,0x262020(,%eax,4)
  100a38:	02 00 00 00 
			break;
  100a3c:	eb 0a                	jmp    100a48 <keyboard_event+0xa6>
static int key_state[NR_KEYS];

void keyboard_event(void) {
	int key_code = inb(0x60);
	int i;
	for (i = 0; i < NR_KEYS; i ++){
  100a3e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100a42:	83 7d fc 05          	cmpl   $0x5,-0x4(%ebp)
  100a46:	7e 83                	jle    1009cb <keyboard_event+0x29>
		else if(key_code == keycode_array[i] + 0x80) {
			key_state[i] = KEY_STATE_RELEASE;
			break;
		}
	}
}
  100a48:	90                   	nop
  100a49:	c9                   	leave  
  100a4a:	c3                   	ret    

00100a4b <handle_keys>:

int handle_keys() {
  100a4b:	55                   	push   %ebp
  100a4c:	89 e5                	mov    %esp,%ebp
  100a4e:	83 ec 10             	sub    $0x10,%esp
}

static __inline void
cli(void)
{
	__asm __volatile("cli");
  100a51:	fa                   	cli    
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i) {
  100a52:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100a59:	eb 5b                	jmp    100ab6 <handle_keys+0x6b>
		if(key_state[i] == KEY_STATE_PRESS) {
  100a5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a5e:	8b 04 85 20 20 26 00 	mov    0x262020(,%eax,4),%eax
  100a65:	83 f8 03             	cmp    $0x3,%eax
  100a68:	75 1b                	jne    100a85 <handle_keys+0x3a>
			key_state[i] = KEY_STATE_WAIT_RELEASE;
  100a6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a6d:	c7 04 85 20 20 26 00 	movl   $0x1,0x262020(,%eax,4)
  100a74:	01 00 00 00 

/* sti and cli --ANDSORA */
static __inline void
sti(void)
{
	__asm __volatile("sti");
  100a78:	fb                   	sti    
			sti(); return keycode_array[i];
  100a79:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a7c:	8b 04 85 a0 0f 26 00 	mov    0x260fa0(,%eax,4),%eax
  100a83:	eb 3d                	jmp    100ac2 <handle_keys+0x77>
		}
		else if(key_state[i] == KEY_STATE_RELEASE) {
  100a85:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a88:	8b 04 85 20 20 26 00 	mov    0x262020(,%eax,4),%eax
  100a8f:	83 f8 02             	cmp    $0x2,%eax
  100a92:	75 1e                	jne    100ab2 <handle_keys+0x67>
			key_state[i] = KEY_STATE_EMPTY;
  100a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100a97:	c7 04 85 20 20 26 00 	movl   $0x0,0x262020(,%eax,4)
  100a9e:	00 00 00 00 
  100aa2:	fb                   	sti    
			sti(); return keycode_array[i] + 0x80;
  100aa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100aa6:	8b 04 85 a0 0f 26 00 	mov    0x260fa0(,%eax,4),%eax
  100aad:	83 e8 80             	sub    $0xffffff80,%eax
  100ab0:	eb 10                	jmp    100ac2 <handle_keys+0x77>
}

int handle_keys() {
	cli();
	int i;
	for(i=0; i<NR_KEYS; ++i) {
  100ab2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  100ab6:	83 7d fc 05          	cmpl   $0x5,-0x4(%ebp)
  100aba:	7e 9f                	jle    100a5b <handle_keys+0x10>
  100abc:	fb                   	sti    
		else if(key_state[i] == KEY_STATE_RELEASE) {
			key_state[i] = KEY_STATE_EMPTY;
			sti(); return keycode_array[i] + 0x80;
		}
	}
	sti(); return 0xff;
  100abd:	b8 ff 00 00 00       	mov    $0xff,%eax
}
  100ac2:	c9                   	leave  
  100ac3:	c3                   	ret    

00100ac4 <init_timer>:
	.operate_mode = 2,  // rate generator, for more accuracy
	.access_mode  = 3,  // low byte / high byte, see below
	.channel      = 0,  // use channel 0
};

void init_timer() {
  100ac4:	55                   	push   %ebp
  100ac5:	89 e5                	mov    %esp,%ebp
  100ac7:	83 ec 20             	sub    $0x20,%esp
	int counter = PIT_FREQUENCE / HZ;
  100aca:	c7 45 fc a9 04 00 00 	movl   $0x4a9,-0x4(%ebp)
	outb(PORT_CMD, mode.val);
  100ad1:	0f b6 05 00 20 26 00 	movzbl 0x262000,%eax
  100ad8:	0f b6 c0             	movzbl %al,%eax
  100adb:	c7 45 f8 43 00 00 00 	movl   $0x43,-0x8(%ebp)
  100ae2:	88 45 ed             	mov    %al,-0x13(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100ae5:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ae9:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100aec:	ee                   	out    %al,(%dx)
	outb(PORT_CH_0, counter & 0xFF);         // access low byte
  100aed:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100af0:	0f b6 c0             	movzbl %al,%eax
  100af3:	c7 45 f4 40 00 00 00 	movl   $0x40,-0xc(%ebp)
  100afa:	88 45 ee             	mov    %al,-0x12(%ebp)
  100afd:	0f b6 45 ee          	movzbl -0x12(%ebp),%eax
  100b01:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100b04:	ee                   	out    %al,(%dx)
	outb(PORT_CH_0, (counter >> 8) & 0xFF);  // access high byte
  100b05:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100b08:	c1 f8 08             	sar    $0x8,%eax
  100b0b:	0f b6 c0             	movzbl %al,%eax
  100b0e:	c7 45 f0 40 00 00 00 	movl   $0x40,-0x10(%ebp)
  100b15:	88 45 ef             	mov    %al,-0x11(%ebp)
  100b18:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100b1c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100b1f:	ee                   	out    %al,(%dx)
}
  100b20:	90                   	nop
  100b21:	c9                   	leave  
  100b22:	c3                   	ret    

00100b23 <timer_event>:

volatile uint32_t time_tick = 0;

void timer_event(void) {
  100b23:	55                   	push   %ebp
  100b24:	89 e5                	mov    %esp,%ebp
	time_tick ++;
  100b26:	a1 38 20 26 00       	mov    0x262038,%eax
  100b2b:	83 c0 01             	add    $0x1,%eax
  100b2e:	a3 38 20 26 00       	mov    %eax,0x262038
}
  100b33:	90                   	nop
  100b34:	5d                   	pop    %ebp
  100b35:	c3                   	ret    

00100b36 <INIT_WORK>:
void keyboard_event();

void printk_test();
void serial_output_test();

void INIT_WORK(){
  100b36:	55                   	push   %ebp
  100b37:	89 e5                	mov    %esp,%ebp
  100b39:	83 ec 08             	sub    $0x8,%esp
	init_vmem_addr();
  100b3c:	e8 fc fd ff ff       	call   10093d <init_vmem_addr>
	init_serial();
  100b41:	e8 05 fc ff ff       	call   10074b <init_serial>
	init_i8259();
  100b46:	e8 b7 05 00 00       	call   101102 <init_i8259>
	init_idt();
  100b4b:	e8 17 08 00 00       	call   101367 <init_idt>
	init_timer();
  100b50:	e8 6f ff ff ff       	call   100ac4 <init_timer>
	init_vmem();
  100b55:	e8 fe fd ff ff       	call   100958 <init_vmem>
	add_irq_handle(0, timer_event);
  100b5a:	83 ec 08             	sub    $0x8,%esp
  100b5d:	68 23 0b 10 00       	push   $0x100b23
  100b62:	6a 00                	push   $0x0
  100b64:	e8 5d 04 00 00       	call   100fc6 <add_irq_handle>
  100b69:	83 c4 10             	add    $0x10,%esp
	add_irq_handle(1, keyboard_event);
  100b6c:	83 ec 08             	sub    $0x8,%esp
  100b6f:	68 a2 09 10 00       	push   $0x1009a2
  100b74:	6a 01                	push   $0x1
  100b76:	e8 4b 04 00 00       	call   100fc6 <add_irq_handle>
  100b7b:	83 c4 10             	add    $0x10,%esp
}
  100b7e:	90                   	nop
  100b7f:	c9                   	leave  
  100b80:	c3                   	ret    

00100b81 <TEST_WORK>:

void TEST_WORK(){
  100b81:	55                   	push   %ebp
  100b82:	89 e5                	mov    %esp,%ebp
  100b84:	83 ec 08             	sub    $0x8,%esp
	serial_output_test();
  100b87:	e8 a1 fc ff ff       	call   10082d <serial_output_test>
	printk_test();
  100b8c:	e8 5c 02 00 00       	call   100ded <printk_test>
}
  100b91:	90                   	nop
  100b92:	c9                   	leave  
  100b93:	c3                   	ret    

00100b94 <main>:

int main(void) {
  100b94:	8d 4c 24 04          	lea    0x4(%esp),%ecx
  100b98:	83 e4 f0             	and    $0xfffffff0,%esp
  100b9b:	ff 71 fc             	pushl  -0x4(%ecx)
  100b9e:	55                   	push   %ebp
  100b9f:	89 e5                	mov    %esp,%ebp
  100ba1:	51                   	push   %ecx
  100ba2:	81 ec 24 10 00 00    	sub    $0x1024,%esp

	INIT_WORK();
  100ba8:	e8 89 ff ff ff       	call   100b36 <INIT_WORK>
	TEST_WORK();
  100bad:	e8 cf ff ff ff       	call   100b81 <TEST_WORK>

	printk("Here is main()\n");
  100bb2:	83 ec 0c             	sub    $0xc,%esp
  100bb5:	68 b8 0f 26 00       	push   $0x260fb8
  100bba:	e8 ed f9 ff ff       	call   1005ac <printk>
  100bbf:	83 c4 10             	add    $0x10,%esp
	struct Proghdr *ph, *eph;
	unsigned char *pa, *i;

	//elf = (struct Elf*)0x1f00000;
	uint8_t buf[4096];
	elf = (struct Elf*)buf;
  100bc2:	8d 85 e4 ef ff ff    	lea    -0x101c(%ebp),%eax
  100bc8:	89 45 ec             	mov    %eax,-0x14(%ebp)

	readseg((unsigned char*)elf, 4096, 10*1024*1024);
  100bcb:	83 ec 04             	sub    $0x4,%esp
  100bce:	68 00 00 a0 00       	push   $0xa00000
  100bd3:	68 00 10 00 00       	push   $0x1000
  100bd8:	ff 75 ec             	pushl  -0x14(%ebp)
  100bdb:	e8 aa 01 00 00       	call   100d8a <readseg>
  100be0:	83 c4 10             	add    $0x10,%esp

	ph = (struct Proghdr*)((char *)elf + elf->e_phoff);
  100be3:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100be6:	8b 50 1c             	mov    0x1c(%eax),%edx
  100be9:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bec:	01 d0                	add    %edx,%eax
  100bee:	89 45 f4             	mov    %eax,-0xc(%ebp)
	eph = ph + elf->e_phnum;
  100bf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100bf4:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  100bf8:	0f b7 c0             	movzwl %ax,%eax
  100bfb:	c1 e0 05             	shl    $0x5,%eax
  100bfe:	89 c2                	mov    %eax,%edx
  100c00:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c03:	01 d0                	add    %edx,%eax
  100c05:	89 45 e8             	mov    %eax,-0x18(%ebp)
	for(; ph < eph; ph ++) {
  100c08:	eb 57                	jmp    100c61 <main+0xcd>
		pa = (unsigned char*)ph->p_pa;
  100c0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c0d:	8b 40 0c             	mov    0xc(%eax),%eax
  100c10:	89 45 e4             	mov    %eax,-0x1c(%ebp)
		readseg(pa, ph->p_filesz, ph->p_offset);
  100c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c16:	8b 40 04             	mov    0x4(%eax),%eax
  100c19:	89 c2                	mov    %eax,%edx
  100c1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c1e:	8b 40 10             	mov    0x10(%eax),%eax
  100c21:	83 ec 04             	sub    $0x4,%esp
  100c24:	52                   	push   %edx
  100c25:	50                   	push   %eax
  100c26:	ff 75 e4             	pushl  -0x1c(%ebp)
  100c29:	e8 5c 01 00 00       	call   100d8a <readseg>
  100c2e:	83 c4 10             	add    $0x10,%esp
		for(i = pa + ph->p_filesz; i < pa + ph->p_memsz; *i ++ = 0);
  100c31:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c34:	8b 50 10             	mov    0x10(%eax),%edx
  100c37:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100c3a:	01 d0                	add    %edx,%eax
  100c3c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  100c3f:	eb 0c                	jmp    100c4d <main+0xb9>
  100c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100c44:	8d 50 01             	lea    0x1(%eax),%edx
  100c47:	89 55 f0             	mov    %edx,-0x10(%ebp)
  100c4a:	c6 00 00             	movb   $0x0,(%eax)
  100c4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c50:	8b 50 14             	mov    0x14(%eax),%edx
  100c53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100c56:	01 d0                	add    %edx,%eax
  100c58:	3b 45 f0             	cmp    -0x10(%ebp),%eax
  100c5b:	77 e4                	ja     100c41 <main+0xad>

	readseg((unsigned char*)elf, 4096, 10*1024*1024);

	ph = (struct Proghdr*)((char *)elf + elf->e_phoff);
	eph = ph + elf->e_phnum;
	for(; ph < eph; ph ++) {
  100c5d:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
  100c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c64:	3b 45 e8             	cmp    -0x18(%ebp),%eax
  100c67:	72 a1                	jb     100c0a <main+0x76>
		pa = (unsigned char*)ph->p_pa;
		readseg(pa, ph->p_filesz, ph->p_offset);
		for(i = pa + ph->p_filesz; i < pa + ph->p_memsz; *i ++ = 0);
	}

	printk("here we would go!\n");
  100c69:	83 ec 0c             	sub    $0xc,%esp
  100c6c:	68 c8 0f 26 00       	push   $0x260fc8
  100c71:	e8 36 f9 ff ff       	call   1005ac <printk>
  100c76:	83 c4 10             	add    $0x10,%esp

	((void(*)(void))elf->e_entry)(); /* Here we go! */
  100c79:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100c7c:	8b 40 18             	mov    0x18(%eax),%eax
  100c7f:	ff d0                	call   *%eax

	while(1);
  100c81:	eb fe                	jmp    100c81 <main+0xed>

00100c83 <waitdisk>:
	panic("YOU shouldn't get here!\n");
	return 0;
}


void waitdisk(void) {
  100c83:	55                   	push   %ebp
  100c84:	89 e5                	mov    %esp,%ebp
  100c86:	83 ec 10             	sub    $0x10,%esp
	while((inb(0x1f7) & 0xc0) != 0x40);
  100c89:	90                   	nop
  100c8a:	c7 45 fc f7 01 00 00 	movl   $0x1f7,-0x4(%ebp)

static __inline uint8_t
inb(int port)
{
	uint8_t data;
	__asm __volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  100c91:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100c94:	89 c2                	mov    %eax,%edx
  100c96:	ec                   	in     (%dx),%al
  100c97:	88 45 fb             	mov    %al,-0x5(%ebp)
	return data;
  100c9a:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  100c9e:	0f b6 c0             	movzbl %al,%eax
  100ca1:	25 c0 00 00 00       	and    $0xc0,%eax
  100ca6:	83 f8 40             	cmp    $0x40,%eax
  100ca9:	75 df                	jne    100c8a <waitdisk+0x7>
}
  100cab:	90                   	nop
  100cac:	c9                   	leave  
  100cad:	c3                   	ret    

00100cae <readsect>:

void readsect(void *dst, int offset) {
  100cae:	55                   	push   %ebp
  100caf:	89 e5                	mov    %esp,%ebp
  100cb1:	57                   	push   %edi
  100cb2:	53                   	push   %ebx
  100cb3:	83 ec 30             	sub    $0x30,%esp
	/* int i; */
	waitdisk();
  100cb6:	e8 c8 ff ff ff       	call   100c83 <waitdisk>
  100cbb:	c7 45 f4 f2 01 00 00 	movl   $0x1f2,-0xc(%ebp)
  100cc2:	c6 45 ce 01          	movb   $0x1,-0x32(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  100cc6:	0f b6 45 ce          	movzbl -0x32(%ebp),%eax
  100cca:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100ccd:	ee                   	out    %al,(%dx)

	outb(0x1f2, 1);		// count = 1
	outb(0x1f3, offset);
  100cce:	8b 45 0c             	mov    0xc(%ebp),%eax
  100cd1:	0f b6 c0             	movzbl %al,%eax
  100cd4:	c7 45 f0 f3 01 00 00 	movl   $0x1f3,-0x10(%ebp)
  100cdb:	88 45 cf             	mov    %al,-0x31(%ebp)
  100cde:	0f b6 45 cf          	movzbl -0x31(%ebp),%eax
  100ce2:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100ce5:	ee                   	out    %al,(%dx)
	outb(0x1f4, offset >> 8);
  100ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
  100ce9:	c1 f8 08             	sar    $0x8,%eax
  100cec:	0f b6 c0             	movzbl %al,%eax
  100cef:	c7 45 ec f4 01 00 00 	movl   $0x1f4,-0x14(%ebp)
  100cf6:	88 45 d0             	mov    %al,-0x30(%ebp)
  100cf9:	0f b6 45 d0          	movzbl -0x30(%ebp),%eax
  100cfd:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100d00:	ee                   	out    %al,(%dx)
	outb(0x1f5, offset >> 16);
  100d01:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d04:	c1 f8 10             	sar    $0x10,%eax
  100d07:	0f b6 c0             	movzbl %al,%eax
  100d0a:	c7 45 e8 f5 01 00 00 	movl   $0x1f5,-0x18(%ebp)
  100d11:	88 45 d1             	mov    %al,-0x2f(%ebp)
  100d14:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100d18:	8b 55 e8             	mov    -0x18(%ebp),%edx
  100d1b:	ee                   	out    %al,(%dx)
	outb(0x1f6, (offset >> 24) | 0xe0);
  100d1c:	8b 45 0c             	mov    0xc(%ebp),%eax
  100d1f:	c1 f8 18             	sar    $0x18,%eax
  100d22:	83 c8 e0             	or     $0xffffffe0,%eax
  100d25:	0f b6 c0             	movzbl %al,%eax
  100d28:	c7 45 e4 f6 01 00 00 	movl   $0x1f6,-0x1c(%ebp)
  100d2f:	88 45 d2             	mov    %al,-0x2e(%ebp)
  100d32:	0f b6 45 d2          	movzbl -0x2e(%ebp),%eax
  100d36:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100d39:	ee                   	out    %al,(%dx)
  100d3a:	c7 45 e0 f7 01 00 00 	movl   $0x1f7,-0x20(%ebp)
  100d41:	c6 45 d3 20          	movb   $0x20,-0x2d(%ebp)
  100d45:	0f b6 45 d3          	movzbl -0x2d(%ebp),%eax
  100d49:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100d4c:	ee                   	out    %al,(%dx)
	outb(0x1f7, 0x20);	// cmd 0x20 - read sectors

	waitdisk();
  100d4d:	e8 31 ff ff ff       	call   100c83 <waitdisk>
  100d52:	c7 45 dc f0 01 00 00 	movl   $0x1f0,-0x24(%ebp)
  100d59:	8b 45 08             	mov    0x8(%ebp),%eax
  100d5c:	89 45 d8             	mov    %eax,-0x28(%ebp)
  100d5f:	c7 45 d4 80 00 00 00 	movl   $0x80,-0x2c(%ebp)
}

static __inline void
insl(int port, void *addr, int cnt)
{
	__asm __volatile("cld\n\trepne\n\tinsl"			:
  100d66:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100d69:	8b 4d d8             	mov    -0x28(%ebp),%ecx
  100d6c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100d6f:	89 cb                	mov    %ecx,%ebx
  100d71:	89 df                	mov    %ebx,%edi
  100d73:	89 c1                	mov    %eax,%ecx
  100d75:	fc                   	cld    
  100d76:	f2 6d                	repnz insl (%dx),%es:(%edi)
  100d78:	89 c8                	mov    %ecx,%eax
  100d7a:	89 fb                	mov    %edi,%ebx
  100d7c:	89 5d d8             	mov    %ebx,-0x28(%ebp)
  100d7f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
	insl(0x1f0, dst, SECTSIZE/4);	//read a sector
	/*	this part does the same thing
	for(i = 0; i < SECTSIZE / 4; i ++) {
		((int *)dst)[i] = in_long(0x1f0);
	} */
}
  100d82:	90                   	nop
  100d83:	83 c4 30             	add    $0x30,%esp
  100d86:	5b                   	pop    %ebx
  100d87:	5f                   	pop    %edi
  100d88:	5d                   	pop    %ebp
  100d89:	c3                   	ret    

00100d8a <readseg>:

void readseg(unsigned char *pa, int count, int offset) {
  100d8a:	55                   	push   %ebp
  100d8b:	89 e5                	mov    %esp,%ebp
  100d8d:	83 ec 10             	sub    $0x10,%esp
	unsigned char *epa;
	epa = pa + count;
  100d90:	8b 55 0c             	mov    0xc(%ebp),%edx
  100d93:	8b 45 08             	mov    0x8(%ebp),%eax
  100d96:	01 d0                	add    %edx,%eax
  100d98:	89 45 fc             	mov    %eax,-0x4(%ebp)
	pa -= offset % SECTSIZE;
  100d9b:	8b 45 10             	mov    0x10(%ebp),%eax
  100d9e:	99                   	cltd   
  100d9f:	c1 ea 17             	shr    $0x17,%edx
  100da2:	01 d0                	add    %edx,%eax
  100da4:	25 ff 01 00 00       	and    $0x1ff,%eax
  100da9:	29 d0                	sub    %edx,%eax
  100dab:	f7 d8                	neg    %eax
  100dad:	01 45 08             	add    %eax,0x8(%ebp)
	offset = (offset / SECTSIZE) + 1;
  100db0:	8b 45 10             	mov    0x10(%ebp),%eax
  100db3:	8d 90 ff 01 00 00    	lea    0x1ff(%eax),%edx
  100db9:	85 c0                	test   %eax,%eax
  100dbb:	0f 48 c2             	cmovs  %edx,%eax
  100dbe:	c1 f8 09             	sar    $0x9,%eax
  100dc1:	83 c0 01             	add    $0x1,%eax
  100dc4:	89 45 10             	mov    %eax,0x10(%ebp)
	for(; pa < epa; pa += SECTSIZE, offset ++)
  100dc7:	eb 19                	jmp    100de2 <readseg+0x58>
		readsect(pa, offset);
  100dc9:	ff 75 10             	pushl  0x10(%ebp)
  100dcc:	ff 75 08             	pushl  0x8(%ebp)
  100dcf:	e8 da fe ff ff       	call   100cae <readsect>
  100dd4:	83 c4 08             	add    $0x8,%esp
void readseg(unsigned char *pa, int count, int offset) {
	unsigned char *epa;
	epa = pa + count;
	pa -= offset % SECTSIZE;
	offset = (offset / SECTSIZE) + 1;
	for(; pa < epa; pa += SECTSIZE, offset ++)
  100dd7:	81 45 08 00 02 00 00 	addl   $0x200,0x8(%ebp)
  100dde:	83 45 10 01          	addl   $0x1,0x10(%ebp)
  100de2:	8b 45 08             	mov    0x8(%ebp),%eax
  100de5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100de8:	72 df                	jb     100dc9 <readseg+0x3f>
		readsect(pa, offset);
}
  100dea:	90                   	nop
  100deb:	c9                   	leave  
  100dec:	c3                   	ret    

00100ded <printk_test>:
#include "common.h"

int printk(const char *, ...);

void printk_test(){
  100ded:	55                   	push   %ebp
  100dee:	89 e5                	mov    %esp,%ebp
  100df0:	83 ec 08             	sub    $0x8,%esp
	printk("Printk test begin...\n");
  100df3:	83 ec 0c             	sub    $0xc,%esp
  100df6:	68 dc 0f 26 00       	push   $0x260fdc
  100dfb:	e8 ac f7 ff ff       	call   1005ac <printk>
  100e00:	83 c4 10             	add    $0x10,%esp
	printk("the answer should be:\n");
  100e03:	83 ec 0c             	sub    $0xc,%esp
  100e06:	68 f2 0f 26 00       	push   $0x260ff2
  100e0b:	e8 9c f7 ff ff       	call   1005ac <printk>
  100e10:	83 c4 10             	add    $0x10,%esp
	printk("#######################################################\n");
  100e13:	83 ec 0c             	sub    $0xc,%esp
  100e16:	68 0c 10 26 00       	push   $0x26100c
  100e1b:	e8 8c f7 ff ff       	call   1005ac <printk>
  100e20:	83 c4 10             	add    $0x10,%esp
	printk("Hello, welcome to OSlab! I'm the body of the game. ");
  100e23:	83 ec 0c             	sub    $0xc,%esp
  100e26:	68 48 10 26 00       	push   $0x261048
  100e2b:	e8 7c f7 ff ff       	call   1005ac <printk>
  100e30:	83 c4 10             	add    $0x10,%esp
	printk("Bootblock loads me to the memory position of 0x100000, and Makefile also tells me that I'm at the location of 0x100000. ");
  100e33:	83 ec 0c             	sub    $0xc,%esp
  100e36:	68 7c 10 26 00       	push   $0x26107c
  100e3b:	e8 6c f7 ff ff       	call   1005ac <printk>
  100e40:	83 c4 10             	add    $0x10,%esp
	printk("~!@#$^&*()_+`1234567890-=...... ");
  100e43:	83 ec 0c             	sub    $0xc,%esp
  100e46:	68 f8 10 26 00       	push   $0x2610f8
  100e4b:	e8 5c f7 ff ff       	call   1005ac <printk>
  100e50:	83 c4 10             	add    $0x10,%esp
	printk("Now I will test your printk: ");
  100e53:	83 ec 0c             	sub    $0xc,%esp
  100e56:	68 19 11 26 00       	push   $0x261119
  100e5b:	e8 4c f7 ff ff       	call   1005ac <printk>
  100e60:	83 c4 10             	add    $0x10,%esp
	printk("1 + 1 = 2, 123 * 456 = 56088\n0, -1, -2147483648, -1412505855, -32768, 102030\n0, ffffffff, 80000000, abcdef01, ffff8000, 18e8e\n");
  100e63:	83 ec 0c             	sub    $0xc,%esp
  100e66:	68 38 11 26 00       	push   $0x261138
  100e6b:	e8 3c f7 ff ff       	call   1005ac <printk>
  100e70:	83 c4 10             	add    $0x10,%esp
	printk("#######################################################\n");
  100e73:	83 ec 0c             	sub    $0xc,%esp
  100e76:	68 0c 10 26 00       	push   $0x26100c
  100e7b:	e8 2c f7 ff ff       	call   1005ac <printk>
  100e80:	83 c4 10             	add    $0x10,%esp
	printk("your answer:\n");
  100e83:	83 ec 0c             	sub    $0xc,%esp
  100e86:	68 b7 11 26 00       	push   $0x2611b7
  100e8b:	e8 1c f7 ff ff       	call   1005ac <printk>
  100e90:	83 c4 10             	add    $0x10,%esp
	printk("=======================================================\n");
  100e93:	83 ec 0c             	sub    $0xc,%esp
  100e96:	68 c8 11 26 00       	push   $0x2611c8
  100e9b:	e8 0c f7 ff ff       	call   1005ac <printk>
  100ea0:	83 c4 10             	add    $0x10,%esp
	printk("%s %s%scome %co%s", "Hello,", "", "wel", 't', " ");
  100ea3:	83 ec 08             	sub    $0x8,%esp
  100ea6:	68 01 12 26 00       	push   $0x261201
  100eab:	6a 74                	push   $0x74
  100ead:	68 03 12 26 00       	push   $0x261203
  100eb2:	68 07 12 26 00       	push   $0x261207
  100eb7:	68 08 12 26 00       	push   $0x261208
  100ebc:	68 0f 12 26 00       	push   $0x26120f
  100ec1:	e8 e6 f6 ff ff       	call   1005ac <printk>
  100ec6:	83 c4 20             	add    $0x20,%esp
	printk("%c%c%c%c%c! ", 'O', 'S', 'l', 'a', 'b');
  100ec9:	83 ec 08             	sub    $0x8,%esp
  100ecc:	6a 62                	push   $0x62
  100ece:	6a 61                	push   $0x61
  100ed0:	6a 6c                	push   $0x6c
  100ed2:	6a 53                	push   $0x53
  100ed4:	6a 4f                	push   $0x4f
  100ed6:	68 21 12 26 00       	push   $0x261221
  100edb:	e8 cc f6 ff ff       	call   1005ac <printk>
  100ee0:	83 c4 20             	add    $0x20,%esp
	printk("I'm the %s of %s. %s 0x%x, %s 0x%x. ", "body", "the game", "Bootblock loads me to the memory position of", 0x100000, "and Makefile also tells me that I'm at the location of", 0x100000);
  100ee3:	83 ec 04             	sub    $0x4,%esp
  100ee6:	68 00 00 10 00       	push   $0x100000
  100eeb:	68 30 12 26 00       	push   $0x261230
  100ef0:	68 00 00 10 00       	push   $0x100000
  100ef5:	68 68 12 26 00       	push   $0x261268
  100efa:	68 95 12 26 00       	push   $0x261295
  100eff:	68 9e 12 26 00       	push   $0x26129e
  100f04:	68 a4 12 26 00       	push   $0x2612a4
  100f09:	e8 9e f6 ff ff       	call   1005ac <printk>
  100f0e:	83 c4 20             	add    $0x20,%esp
	printk("~!@#$^&*()_+`1234567890-=...... ");
  100f11:	83 ec 0c             	sub    $0xc,%esp
  100f14:	68 f8 10 26 00       	push   $0x2610f8
  100f19:	e8 8e f6 ff ff       	call   1005ac <printk>
  100f1e:	83 c4 10             	add    $0x10,%esp
	printk("Now I will test your printk: ");
  100f21:	83 ec 0c             	sub    $0xc,%esp
  100f24:	68 19 11 26 00       	push   $0x261119
  100f29:	e8 7e f6 ff ff       	call   1005ac <printk>
  100f2e:	83 c4 10             	add    $0x10,%esp
	printk("%d + %d = %d, %d * %d = %d\n", 1, 1, 1 + 1, 123, 456, 123 * 456);
  100f31:	83 ec 04             	sub    $0x4,%esp
  100f34:	68 18 db 00 00       	push   $0xdb18
  100f39:	68 c8 01 00 00       	push   $0x1c8
  100f3e:	6a 7b                	push   $0x7b
  100f40:	6a 02                	push   $0x2
  100f42:	6a 01                	push   $0x1
  100f44:	6a 01                	push   $0x1
  100f46:	68 c9 12 26 00       	push   $0x2612c9
  100f4b:	e8 5c f6 ff ff       	call   1005ac <printk>
  100f50:	83 c4 20             	add    $0x20,%esp
	printk("%d, %d, %d, %d, %d, %d\n", 0, 0xffffffff, 0x80000000, 0xabcedf01, -32768, 102030);
  100f53:	83 ec 04             	sub    $0x4,%esp
  100f56:	68 8e 8e 01 00       	push   $0x18e8e
  100f5b:	68 00 80 ff ff       	push   $0xffff8000
  100f60:	68 01 df ce ab       	push   $0xabcedf01
  100f65:	68 00 00 00 80       	push   $0x80000000
  100f6a:	6a ff                	push   $0xffffffff
  100f6c:	6a 00                	push   $0x0
  100f6e:	68 e5 12 26 00       	push   $0x2612e5
  100f73:	e8 34 f6 ff ff       	call   1005ac <printk>
  100f78:	83 c4 20             	add    $0x20,%esp
	printk("%x, %x, %x, %x, %x, %x\n", 0, 0xffffffff, 0x80000000, 0xabcedf01, -32768, 102030);
  100f7b:	83 ec 04             	sub    $0x4,%esp
  100f7e:	68 8e 8e 01 00       	push   $0x18e8e
  100f83:	68 00 80 ff ff       	push   $0xffff8000
  100f88:	68 01 df ce ab       	push   $0xabcedf01
  100f8d:	68 00 00 00 80       	push   $0x80000000
  100f92:	6a ff                	push   $0xffffffff
  100f94:	6a 00                	push   $0x0
  100f96:	68 fd 12 26 00       	push   $0x2612fd
  100f9b:	e8 0c f6 ff ff       	call   1005ac <printk>
  100fa0:	83 c4 20             	add    $0x20,%esp
	printk("=======================================================\n");
  100fa3:	83 ec 0c             	sub    $0xc,%esp
  100fa6:	68 c8 11 26 00       	push   $0x2611c8
  100fab:	e8 fc f5 ff ff       	call   1005ac <printk>
  100fb0:	83 c4 10             	add    $0x10,%esp
	printk("Test end!!! Good luck!!!\n");//void serial_output_test();
  100fb3:	83 ec 0c             	sub    $0xc,%esp
  100fb6:	68 15 13 26 00       	push   $0x261315
  100fbb:	e8 ec f5 ff ff       	call   1005ac <printk>
  100fc0:	83 c4 10             	add    $0x10,%esp
}
  100fc3:	90                   	nop
  100fc4:	c9                   	leave  
  100fc5:	c3                   	ret    

00100fc6 <add_irq_handle>:
static struct IRQ_t *handles[NR_HARD_INTR]; // handles is an array of lists
static int handle_count = 0;

void do_syscall(TrapFrame *);

void add_irq_handle(int irq, void (*func)(void) ) {
  100fc6:	55                   	push   %ebp
  100fc7:	89 e5                	mov    %esp,%ebp
  100fc9:	83 ec 18             	sub    $0x18,%esp
	assert(irq < NR_HARD_INTR);
  100fcc:	83 7d 08 0f          	cmpl   $0xf,0x8(%ebp)
  100fd0:	7e 12                	jle    100fe4 <add_irq_handle+0x1e>
  100fd2:	83 ec 08             	sub    $0x8,%esp
  100fd5:	6a 13                	push   $0x13
  100fd7:	68 30 13 26 00       	push   $0x261330
  100fdc:	e8 ac f5 ff ff       	call   10058d <abort>
  100fe1:	83 c4 10             	add    $0x10,%esp
	assert(handle_count <= NR_IRQ_HANDLE);
  100fe4:	a1 80 21 26 00       	mov    0x262180,%eax
  100fe9:	83 f8 20             	cmp    $0x20,%eax
  100fec:	7e 12                	jle    101000 <add_irq_handle+0x3a>
  100fee:	83 ec 08             	sub    $0x8,%esp
  100ff1:	6a 14                	push   $0x14
  100ff3:	68 30 13 26 00       	push   $0x261330
  100ff8:	e8 90 f5 ff ff       	call   10058d <abort>
  100ffd:	83 c4 10             	add    $0x10,%esp

	struct IRQ_t *ptr;
	ptr = &handle_pool[handle_count ++]; // get a free handler
  101000:	a1 80 21 26 00       	mov    0x262180,%eax
  101005:	8d 50 01             	lea    0x1(%eax),%edx
  101008:	89 15 80 21 26 00    	mov    %edx,0x262180
  10100e:	c1 e0 03             	shl    $0x3,%eax
  101011:	05 40 20 26 00       	add    $0x262040,%eax
  101016:	89 45 f4             	mov    %eax,-0xc(%ebp)
	ptr->routine = func;
  101019:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10101c:	8b 55 0c             	mov    0xc(%ebp),%edx
  10101f:	89 10                	mov    %edx,(%eax)
	ptr->next = handles[irq]; // insert into the linked list
  101021:	8b 45 08             	mov    0x8(%ebp),%eax
  101024:	8b 14 85 40 21 26 00 	mov    0x262140(,%eax,4),%edx
  10102b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10102e:	89 50 04             	mov    %edx,0x4(%eax)
	handles[irq] = ptr;
  101031:	8b 45 08             	mov    0x8(%ebp),%eax
  101034:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101037:	89 14 85 40 21 26 00 	mov    %edx,0x262140(,%eax,4)
}
  10103e:	90                   	nop
  10103f:	c9                   	leave  
  101040:	c3                   	ret    

00101041 <irq_handle>:

void irq_handle(TrapFrame *tf) {
  101041:	55                   	push   %ebp
  101042:	89 e5                	mov    %esp,%ebp
  101044:	83 ec 18             	sub    $0x18,%esp
	printk("irq_handle(), irq=%d, eip=0x%x\n", tf->irq, tf->eip);
  101047:	8b 45 08             	mov    0x8(%ebp),%eax
  10104a:	8b 50 28             	mov    0x28(%eax),%edx
  10104d:	8b 45 08             	mov    0x8(%ebp),%eax
  101050:	8b 40 20             	mov    0x20(%eax),%eax
  101053:	83 ec 04             	sub    $0x4,%esp
  101056:	52                   	push   %edx
  101057:	50                   	push   %eax
  101058:	68 48 13 26 00       	push   $0x261348
  10105d:	e8 4a f5 ff ff       	call   1005ac <printk>
  101062:	83 c4 10             	add    $0x10,%esp

	int irq = tf->irq;
  101065:	8b 45 08             	mov    0x8(%ebp),%eax
  101068:	8b 40 20             	mov    0x20(%eax),%eax
  10106b:	89 45 f0             	mov    %eax,-0x10(%ebp)

	if(irq == 0x80) do_syscall(tf);
  10106e:	81 7d f0 80 00 00 00 	cmpl   $0x80,-0x10(%ebp)
  101075:	75 10                	jne    101087 <irq_handle+0x46>
  101077:	83 ec 0c             	sub    $0xc,%esp
  10107a:	ff 75 08             	pushl  0x8(%ebp)
  10107d:	e8 39 f8 ff ff       	call   1008bb <do_syscall>
  101082:	83 c4 10             	add    $0x10,%esp
		while(f != NULL) {
			f->routine();
			f = f->next;
		}
	}
}
  101085:	eb 78                	jmp    1010ff <irq_handle+0xbe>
	printk("irq_handle(), irq=%d, eip=0x%x\n", tf->irq, tf->eip);

	int irq = tf->irq;

	if(irq == 0x80) do_syscall(tf);
	else if(irq < 1000) panic("Unhandled exception! irq==%d\n", irq);
  101087:	81 7d f0 e7 03 00 00 	cmpl   $0x3e7,-0x10(%ebp)
  10108e:	7f 27                	jg     1010b7 <irq_handle+0x76>
  101090:	83 ec 08             	sub    $0x8,%esp
  101093:	ff 75 f0             	pushl  -0x10(%ebp)
  101096:	68 68 13 26 00       	push   $0x261368
  10109b:	e8 0c f5 ff ff       	call   1005ac <printk>
  1010a0:	83 c4 10             	add    $0x10,%esp
  1010a3:	83 ec 08             	sub    $0x8,%esp
  1010a6:	6a 23                	push   $0x23
  1010a8:	68 30 13 26 00       	push   $0x261330
  1010ad:	e8 db f4 ff ff       	call   10058d <abort>
  1010b2:	83 c4 10             	add    $0x10,%esp
		while(f != NULL) {
			f->routine();
			f = f->next;
		}
	}
}
  1010b5:	eb 48                	jmp    1010ff <irq_handle+0xbe>
	int irq = tf->irq;

	if(irq == 0x80) do_syscall(tf);
	else if(irq < 1000) panic("Unhandled exception! irq==%d\n", irq);
	else {
		int irq_id = irq - 1000;
  1010b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1010ba:	2d e8 03 00 00       	sub    $0x3e8,%eax
  1010bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
		assert(irq_id < NR_HARD_INTR);
  1010c2:	83 7d ec 0f          	cmpl   $0xf,-0x14(%ebp)
  1010c6:	7e 12                	jle    1010da <irq_handle+0x99>
  1010c8:	83 ec 08             	sub    $0x8,%esp
  1010cb:	6a 26                	push   $0x26
  1010cd:	68 30 13 26 00       	push   $0x261330
  1010d2:	e8 b6 f4 ff ff       	call   10058d <abort>
  1010d7:	83 c4 10             	add    $0x10,%esp
		struct IRQ_t *f = handles[irq_id];
  1010da:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1010dd:	8b 04 85 40 21 26 00 	mov    0x262140(,%eax,4),%eax
  1010e4:	89 45 f4             	mov    %eax,-0xc(%ebp)

		while(f != NULL) {
  1010e7:	eb 10                	jmp    1010f9 <irq_handle+0xb8>
			f->routine();
  1010e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1010ec:	8b 00                	mov    (%eax),%eax
  1010ee:	ff d0                	call   *%eax
			f = f->next;
  1010f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1010f3:	8b 40 04             	mov    0x4(%eax),%eax
  1010f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	else {
		int irq_id = irq - 1000;
		assert(irq_id < NR_HARD_INTR);
		struct IRQ_t *f = handles[irq_id];

		while(f != NULL) {
  1010f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1010fd:	75 ea                	jne    1010e9 <irq_handle+0xa8>
			f->routine();
			f = f->next;
		}
	}
}
  1010ff:	90                   	nop
  101100:	c9                   	leave  
  101101:	c3                   	ret    

00101102 <init_i8259>:
#define PORT_PIC_MASTER 0x20
#define PORT_PIC_SLAVE  0xA0
#define IRQ_OFFSET		0x20
#define IRQ_SLAVE       2

void init_i8259(void) {
  101102:	55                   	push   %ebp
  101103:	89 e5                	mov    %esp,%ebp
  101105:	83 ec 50             	sub    $0x50,%esp
  101108:	c7 45 fc 21 00 00 00 	movl   $0x21,-0x4(%ebp)
  10110f:	c6 45 ba ff          	movb   $0xff,-0x46(%ebp)
}

static __inline void
outb(int port, uint8_t data)
{
	__asm __volatile("outb %0,%w1" : : "a" (data), "d" (port));
  101113:	0f b6 45 ba          	movzbl -0x46(%ebp),%eax
  101117:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10111a:	ee                   	out    %al,(%dx)
  10111b:	c7 45 f8 a1 00 00 00 	movl   $0xa1,-0x8(%ebp)
  101122:	c6 45 bb ff          	movb   $0xff,-0x45(%ebp)
  101126:	0f b6 45 bb          	movzbl -0x45(%ebp),%eax
  10112a:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10112d:	ee                   	out    %al,(%dx)
  10112e:	c7 45 f4 20 00 00 00 	movl   $0x20,-0xc(%ebp)
  101135:	c6 45 bc 11          	movb   $0x11,-0x44(%ebp)
  101139:	0f b6 45 bc          	movzbl -0x44(%ebp),%eax
  10113d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101140:	ee                   	out    %al,(%dx)
  101141:	c7 45 f0 21 00 00 00 	movl   $0x21,-0x10(%ebp)
  101148:	c6 45 bd 20          	movb   $0x20,-0x43(%ebp)
  10114c:	0f b6 45 bd          	movzbl -0x43(%ebp),%eax
  101150:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101153:	ee                   	out    %al,(%dx)
  101154:	c7 45 ec 21 00 00 00 	movl   $0x21,-0x14(%ebp)
  10115b:	c6 45 be 04          	movb   $0x4,-0x42(%ebp)
  10115f:	0f b6 45 be          	movzbl -0x42(%ebp),%eax
  101163:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101166:	ee                   	out    %al,(%dx)
  101167:	c7 45 e8 21 00 00 00 	movl   $0x21,-0x18(%ebp)
  10116e:	c6 45 bf 03          	movb   $0x3,-0x41(%ebp)
  101172:	0f b6 45 bf          	movzbl -0x41(%ebp),%eax
  101176:	8b 55 e8             	mov    -0x18(%ebp),%edx
  101179:	ee                   	out    %al,(%dx)
  10117a:	c7 45 e4 a0 00 00 00 	movl   $0xa0,-0x1c(%ebp)
  101181:	c6 45 c0 11          	movb   $0x11,-0x40(%ebp)
  101185:	0f b6 45 c0          	movzbl -0x40(%ebp),%eax
  101189:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10118c:	ee                   	out    %al,(%dx)
  10118d:	c7 45 e0 a1 00 00 00 	movl   $0xa1,-0x20(%ebp)
  101194:	c6 45 c1 28          	movb   $0x28,-0x3f(%ebp)
  101198:	0f b6 45 c1          	movzbl -0x3f(%ebp),%eax
  10119c:	8b 55 e0             	mov    -0x20(%ebp),%edx
  10119f:	ee                   	out    %al,(%dx)
  1011a0:	c7 45 dc a1 00 00 00 	movl   $0xa1,-0x24(%ebp)
  1011a7:	c6 45 c2 02          	movb   $0x2,-0x3e(%ebp)
  1011ab:	0f b6 45 c2          	movzbl -0x3e(%ebp),%eax
  1011af:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1011b2:	ee                   	out    %al,(%dx)
  1011b3:	c7 45 d8 a1 00 00 00 	movl   $0xa1,-0x28(%ebp)
  1011ba:	c6 45 c3 03          	movb   $0x3,-0x3d(%ebp)
  1011be:	0f b6 45 c3          	movzbl -0x3d(%ebp),%eax
  1011c2:	8b 55 d8             	mov    -0x28(%ebp),%edx
  1011c5:	ee                   	out    %al,(%dx)
  1011c6:	c7 45 d4 20 00 00 00 	movl   $0x20,-0x2c(%ebp)
  1011cd:	c6 45 c4 68          	movb   $0x68,-0x3c(%ebp)
  1011d1:	0f b6 45 c4          	movzbl -0x3c(%ebp),%eax
  1011d5:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1011d8:	ee                   	out    %al,(%dx)
  1011d9:	c7 45 d0 20 00 00 00 	movl   $0x20,-0x30(%ebp)
  1011e0:	c6 45 c5 0a          	movb   $0xa,-0x3b(%ebp)
  1011e4:	0f b6 45 c5          	movzbl -0x3b(%ebp),%eax
  1011e8:	8b 55 d0             	mov    -0x30(%ebp),%edx
  1011eb:	ee                   	out    %al,(%dx)
  1011ec:	c7 45 cc a0 00 00 00 	movl   $0xa0,-0x34(%ebp)
  1011f3:	c6 45 c6 68          	movb   $0x68,-0x3a(%ebp)
  1011f7:	0f b6 45 c6          	movzbl -0x3a(%ebp),%eax
  1011fb:	8b 55 cc             	mov    -0x34(%ebp),%edx
  1011fe:	ee                   	out    %al,(%dx)
  1011ff:	c7 45 c8 a0 00 00 00 	movl   $0xa0,-0x38(%ebp)
  101206:	c6 45 c7 0a          	movb   $0xa,-0x39(%ebp)
  10120a:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
  10120e:	8b 55 c8             	mov    -0x38(%ebp),%edx
  101211:	ee                   	out    %al,(%dx)
	outb(PORT_PIC_SLAVE + 1, 0x3); // Modified part
	outb(PORT_PIC_MASTER, 0x68);
	outb(PORT_PIC_MASTER, 0x0A);
	outb(PORT_PIC_SLAVE, 0x68);
	outb(PORT_PIC_SLAVE, 0x0A);
}
  101212:	90                   	nop
  101213:	c9                   	leave  
  101214:	c3                   	ret    

00101215 <set_intr>:

/* Each entry of the IDT is either an interrupt gate, or a trap gate */
Gatedesc idt[NR_IRQ];

/* Setup a interrupt gate for interrupt handler. */
static void set_intr(Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
  101215:	55                   	push   %ebp
  101216:	89 e5                	mov    %esp,%ebp
	ptr->gd_off_15_0 = offset & 0xFFFF;
  101218:	8b 45 10             	mov    0x10(%ebp),%eax
  10121b:	89 c2                	mov    %eax,%edx
  10121d:	8b 45 08             	mov    0x8(%ebp),%eax
  101220:	66 89 10             	mov    %dx,(%eax)
	ptr->gd_sel = selector;
  101223:	8b 45 0c             	mov    0xc(%ebp),%eax
  101226:	89 c2                	mov    %eax,%edx
  101228:	8b 45 08             	mov    0x8(%ebp),%eax
  10122b:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->gd_args = 0;
  10122f:	8b 45 08             	mov    0x8(%ebp),%eax
  101232:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  101236:	83 e2 e0             	and    $0xffffffe0,%edx
  101239:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_rsv1 = 0;
  10123c:	8b 45 08             	mov    0x8(%ebp),%eax
  10123f:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  101243:	83 e2 1f             	and    $0x1f,%edx
  101246:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_type = INTERRUPT_GATE_32;
  101249:	8b 45 08             	mov    0x8(%ebp),%eax
  10124c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  101250:	83 e2 f0             	and    $0xfffffff0,%edx
  101253:	83 ca 0e             	or     $0xe,%edx
  101256:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_s = 0;
  101259:	8b 45 08             	mov    0x8(%ebp),%eax
  10125c:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  101260:	83 e2 ef             	and    $0xffffffef,%edx
  101263:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_dpl = dpl;
  101266:	8b 45 14             	mov    0x14(%ebp),%eax
  101269:	83 e0 03             	and    $0x3,%eax
  10126c:	89 c2                	mov    %eax,%edx
  10126e:	8b 45 08             	mov    0x8(%ebp),%eax
  101271:	83 e2 03             	and    $0x3,%edx
  101274:	89 d1                	mov    %edx,%ecx
  101276:	c1 e1 05             	shl    $0x5,%ecx
  101279:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  10127d:	83 e2 9f             	and    $0xffffff9f,%edx
  101280:	09 ca                	or     %ecx,%edx
  101282:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_p = 1;
  101285:	8b 45 08             	mov    0x8(%ebp),%eax
  101288:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  10128c:	83 ca 80             	or     $0xffffff80,%edx
  10128f:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_off_31_16 = (offset >> 16) & 0xFFFF;
  101292:	8b 45 10             	mov    0x10(%ebp),%eax
  101295:	c1 e8 10             	shr    $0x10,%eax
  101298:	89 c2                	mov    %eax,%edx
  10129a:	8b 45 08             	mov    0x8(%ebp),%eax
  10129d:	66 89 50 06          	mov    %dx,0x6(%eax)
}
  1012a1:	90                   	nop
  1012a2:	5d                   	pop    %ebp
  1012a3:	c3                   	ret    

001012a4 <set_trap>:

/* Setup a trap gate for cpu exception. */
static void set_trap(Gatedesc *ptr, uint32_t selector, uint32_t offset, uint32_t dpl) {
  1012a4:	55                   	push   %ebp
  1012a5:	89 e5                	mov    %esp,%ebp
	ptr->gd_off_15_0 = offset & 0xFFFF;
  1012a7:	8b 45 10             	mov    0x10(%ebp),%eax
  1012aa:	89 c2                	mov    %eax,%edx
  1012ac:	8b 45 08             	mov    0x8(%ebp),%eax
  1012af:	66 89 10             	mov    %dx,(%eax)
	ptr->gd_sel = selector;
  1012b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1012b5:	89 c2                	mov    %eax,%edx
  1012b7:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ba:	66 89 50 02          	mov    %dx,0x2(%eax)
	ptr->gd_args = 0;
  1012be:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c1:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  1012c5:	83 e2 e0             	and    $0xffffffe0,%edx
  1012c8:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_rsv1 = 0;
  1012cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1012ce:	0f b6 50 04          	movzbl 0x4(%eax),%edx
  1012d2:	83 e2 1f             	and    $0x1f,%edx
  1012d5:	88 50 04             	mov    %dl,0x4(%eax)
	ptr->gd_type = TRAP_GATE_32;
  1012d8:	8b 45 08             	mov    0x8(%ebp),%eax
  1012db:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  1012df:	83 ca 0f             	or     $0xf,%edx
  1012e2:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_s = 0;
  1012e5:	8b 45 08             	mov    0x8(%ebp),%eax
  1012e8:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  1012ec:	83 e2 ef             	and    $0xffffffef,%edx
  1012ef:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_dpl = dpl;
  1012f2:	8b 45 14             	mov    0x14(%ebp),%eax
  1012f5:	83 e0 03             	and    $0x3,%eax
  1012f8:	89 c2                	mov    %eax,%edx
  1012fa:	8b 45 08             	mov    0x8(%ebp),%eax
  1012fd:	83 e2 03             	and    $0x3,%edx
  101300:	89 d1                	mov    %edx,%ecx
  101302:	c1 e1 05             	shl    $0x5,%ecx
  101305:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  101309:	83 e2 9f             	and    $0xffffff9f,%edx
  10130c:	09 ca                	or     %ecx,%edx
  10130e:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_p = 1;
  101311:	8b 45 08             	mov    0x8(%ebp),%eax
  101314:	0f b6 50 05          	movzbl 0x5(%eax),%edx
  101318:	83 ca 80             	or     $0xffffff80,%edx
  10131b:	88 50 05             	mov    %dl,0x5(%eax)
	ptr->gd_off_31_16 = (offset >> 16) & 0xFFFF;
  10131e:	8b 45 10             	mov    0x10(%ebp),%eax
  101321:	c1 e8 10             	shr    $0x10,%eax
  101324:	89 c2                	mov    %eax,%edx
  101326:	8b 45 08             	mov    0x8(%ebp),%eax
  101329:	66 89 50 06          	mov    %dx,0x6(%eax)
}
  10132d:	90                   	nop
  10132e:	5d                   	pop    %ebp
  10132f:	c3                   	ret    

00101330 <write_idtr>:

static void write_idtr(void *addr, uint32_t size) {
  101330:	55                   	push   %ebp
  101331:	89 e5                	mov    %esp,%ebp
  101333:	83 ec 10             	sub    $0x10,%esp
	static volatile uint16_t data[3];
	data[0] = size - 1;
  101336:	8b 45 0c             	mov    0xc(%ebp),%eax
  101339:	83 e8 01             	sub    $0x1,%eax
  10133c:	66 a3 84 21 26 00    	mov    %ax,0x262184
	data[1] = (uint32_t)addr;
  101342:	8b 45 08             	mov    0x8(%ebp),%eax
  101345:	66 a3 86 21 26 00    	mov    %ax,0x262186
	data[2] = ((uint32_t)addr) >> 16;
  10134b:	8b 45 08             	mov    0x8(%ebp),%eax
  10134e:	c1 e8 10             	shr    $0x10,%eax
  101351:	66 a3 88 21 26 00    	mov    %ax,0x262188
  101357:	c7 45 fc 84 21 26 00 	movl   $0x262184,-0x4(%ebp)
}

static __inline void
lidt(void *p)
{
	__asm __volatile("lidt (%0)" : : "r" (p));
  10135e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101361:	0f 01 18             	lidtl  (%eax)
	lidt((void*)data);
}
  101364:	90                   	nop
  101365:	c9                   	leave  
  101366:	c3                   	ret    

00101367 <init_idt>:
void vec14();
void vecsys();

void irq_empty();

void init_idt() {
  101367:	55                   	push   %ebp
  101368:	89 e5                	mov    %esp,%ebp
  10136a:	83 ec 10             	sub    $0x10,%esp
	int i;
	for (i = 0; i < NR_IRQ; i ++) {
  10136d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101374:	eb 22                	jmp    101398 <init_idt+0x31>
		set_trap(idt + i, SEG_KERNEL_CODE << 3, (uint32_t)irq_empty, DPL_KERNEL);
  101376:	ba 28 16 10 00       	mov    $0x101628,%edx
  10137b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10137e:	c1 e0 03             	shl    $0x3,%eax
  101381:	05 a0 21 26 00       	add    $0x2621a0,%eax
  101386:	6a 00                	push   $0x0
  101388:	52                   	push   %edx
  101389:	6a 08                	push   $0x8
  10138b:	50                   	push   %eax
  10138c:	e8 13 ff ff ff       	call   1012a4 <set_trap>
  101391:	83 c4 10             	add    $0x10,%esp

void irq_empty();

void init_idt() {
	int i;
	for (i = 0; i < NR_IRQ; i ++) {
  101394:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  101398:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10139f:	7e d5                	jle    101376 <init_idt+0xf>
		set_trap(idt + i, SEG_KERNEL_CODE << 3, (uint32_t)irq_empty, DPL_KERNEL);
	}
	set_trap(idt + 0, SEG_KERNEL_CODE << 3, (uint32_t)vec0, DPL_KERNEL);
  1013a1:	b8 7d 15 10 00       	mov    $0x10157d,%eax
  1013a6:	6a 00                	push   $0x0
  1013a8:	50                   	push   %eax
  1013a9:	6a 08                	push   $0x8
  1013ab:	68 a0 21 26 00       	push   $0x2621a0
  1013b0:	e8 ef fe ff ff       	call   1012a4 <set_trap>
  1013b5:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 1, SEG_KERNEL_CODE << 3, (uint32_t)vec1, DPL_KERNEL);
  1013b8:	ba 86 15 10 00       	mov    $0x101586,%edx
  1013bd:	b8 a8 21 26 00       	mov    $0x2621a8,%eax
  1013c2:	6a 00                	push   $0x0
  1013c4:	52                   	push   %edx
  1013c5:	6a 08                	push   $0x8
  1013c7:	50                   	push   %eax
  1013c8:	e8 d7 fe ff ff       	call   1012a4 <set_trap>
  1013cd:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 2, SEG_KERNEL_CODE << 3, (uint32_t)vec2, DPL_KERNEL);
  1013d0:	ba 8f 15 10 00       	mov    $0x10158f,%edx
  1013d5:	b8 b0 21 26 00       	mov    $0x2621b0,%eax
  1013da:	6a 00                	push   $0x0
  1013dc:	52                   	push   %edx
  1013dd:	6a 08                	push   $0x8
  1013df:	50                   	push   %eax
  1013e0:	e8 bf fe ff ff       	call   1012a4 <set_trap>
  1013e5:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 3, SEG_KERNEL_CODE << 3, (uint32_t)vec3, DPL_KERNEL);
  1013e8:	ba 98 15 10 00       	mov    $0x101598,%edx
  1013ed:	b8 b8 21 26 00       	mov    $0x2621b8,%eax
  1013f2:	6a 00                	push   $0x0
  1013f4:	52                   	push   %edx
  1013f5:	6a 08                	push   $0x8
  1013f7:	50                   	push   %eax
  1013f8:	e8 a7 fe ff ff       	call   1012a4 <set_trap>
  1013fd:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 4, SEG_KERNEL_CODE << 3, (uint32_t)vec4, DPL_KERNEL);
  101400:	ba a1 15 10 00       	mov    $0x1015a1,%edx
  101405:	b8 c0 21 26 00       	mov    $0x2621c0,%eax
  10140a:	6a 00                	push   $0x0
  10140c:	52                   	push   %edx
  10140d:	6a 08                	push   $0x8
  10140f:	50                   	push   %eax
  101410:	e8 8f fe ff ff       	call   1012a4 <set_trap>
  101415:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 5, SEG_KERNEL_CODE << 3, (uint32_t)vec5, DPL_KERNEL);
  101418:	ba aa 15 10 00       	mov    $0x1015aa,%edx
  10141d:	b8 c8 21 26 00       	mov    $0x2621c8,%eax
  101422:	6a 00                	push   $0x0
  101424:	52                   	push   %edx
  101425:	6a 08                	push   $0x8
  101427:	50                   	push   %eax
  101428:	e8 77 fe ff ff       	call   1012a4 <set_trap>
  10142d:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 6, SEG_KERNEL_CODE << 3, (uint32_t)vec6, DPL_KERNEL);
  101430:	ba b3 15 10 00       	mov    $0x1015b3,%edx
  101435:	b8 d0 21 26 00       	mov    $0x2621d0,%eax
  10143a:	6a 00                	push   $0x0
  10143c:	52                   	push   %edx
  10143d:	6a 08                	push   $0x8
  10143f:	50                   	push   %eax
  101440:	e8 5f fe ff ff       	call   1012a4 <set_trap>
  101445:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 7, SEG_KERNEL_CODE << 3, (uint32_t)vec7, DPL_KERNEL);
  101448:	ba bc 15 10 00       	mov    $0x1015bc,%edx
  10144d:	b8 d8 21 26 00       	mov    $0x2621d8,%eax
  101452:	6a 00                	push   $0x0
  101454:	52                   	push   %edx
  101455:	6a 08                	push   $0x8
  101457:	50                   	push   %eax
  101458:	e8 47 fe ff ff       	call   1012a4 <set_trap>
  10145d:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 8, SEG_KERNEL_CODE << 3, (uint32_t)vec8, DPL_KERNEL);
  101460:	ba c5 15 10 00       	mov    $0x1015c5,%edx
  101465:	b8 e0 21 26 00       	mov    $0x2621e0,%eax
  10146a:	6a 00                	push   $0x0
  10146c:	52                   	push   %edx
  10146d:	6a 08                	push   $0x8
  10146f:	50                   	push   %eax
  101470:	e8 2f fe ff ff       	call   1012a4 <set_trap>
  101475:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 9, SEG_KERNEL_CODE << 3, (uint32_t)vec9, DPL_KERNEL);
  101478:	ba cc 15 10 00       	mov    $0x1015cc,%edx
  10147d:	b8 e8 21 26 00       	mov    $0x2621e8,%eax
  101482:	6a 00                	push   $0x0
  101484:	52                   	push   %edx
  101485:	6a 08                	push   $0x8
  101487:	50                   	push   %eax
  101488:	e8 17 fe ff ff       	call   1012a4 <set_trap>
  10148d:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 10, SEG_KERNEL_CODE << 3, (uint32_t)vec10, DPL_KERNEL);
  101490:	ba d5 15 10 00       	mov    $0x1015d5,%edx
  101495:	b8 f0 21 26 00       	mov    $0x2621f0,%eax
  10149a:	6a 00                	push   $0x0
  10149c:	52                   	push   %edx
  10149d:	6a 08                	push   $0x8
  10149f:	50                   	push   %eax
  1014a0:	e8 ff fd ff ff       	call   1012a4 <set_trap>
  1014a5:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 11, SEG_KERNEL_CODE << 3, (uint32_t)vec11, DPL_KERNEL);
  1014a8:	ba dc 15 10 00       	mov    $0x1015dc,%edx
  1014ad:	b8 f8 21 26 00       	mov    $0x2621f8,%eax
  1014b2:	6a 00                	push   $0x0
  1014b4:	52                   	push   %edx
  1014b5:	6a 08                	push   $0x8
  1014b7:	50                   	push   %eax
  1014b8:	e8 e7 fd ff ff       	call   1012a4 <set_trap>
  1014bd:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 12, SEG_KERNEL_CODE << 3, (uint32_t)vec12, DPL_KERNEL);
  1014c0:	ba e3 15 10 00       	mov    $0x1015e3,%edx
  1014c5:	b8 00 22 26 00       	mov    $0x262200,%eax
  1014ca:	6a 00                	push   $0x0
  1014cc:	52                   	push   %edx
  1014cd:	6a 08                	push   $0x8
  1014cf:	50                   	push   %eax
  1014d0:	e8 cf fd ff ff       	call   1012a4 <set_trap>
  1014d5:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 13, SEG_KERNEL_CODE << 3, (uint32_t)vec13, DPL_KERNEL);
  1014d8:	ba ea 15 10 00       	mov    $0x1015ea,%edx
  1014dd:	b8 08 22 26 00       	mov    $0x262208,%eax
  1014e2:	6a 00                	push   $0x0
  1014e4:	52                   	push   %edx
  1014e5:	6a 08                	push   $0x8
  1014e7:	50                   	push   %eax
  1014e8:	e8 b7 fd ff ff       	call   1012a4 <set_trap>
  1014ed:	83 c4 10             	add    $0x10,%esp
	set_trap(idt + 14, SEG_KERNEL_CODE << 3, (uint32_t)vec14, DPL_KERNEL);
  1014f0:	ba f1 15 10 00       	mov    $0x1015f1,%edx
  1014f5:	b8 10 22 26 00       	mov    $0x262210,%eax
  1014fa:	6a 00                	push   $0x0
  1014fc:	52                   	push   %edx
  1014fd:	6a 08                	push   $0x8
  1014ff:	50                   	push   %eax
  101500:	e8 9f fd ff ff       	call   1012a4 <set_trap>
  101505:	83 c4 10             	add    $0x10,%esp

	/* the system call 0x80 */
	set_trap(idt + 0x80, SEG_KERNEL_CODE << 3, (uint32_t)vecsys, DPL_USER);
  101508:	ba f8 15 10 00       	mov    $0x1015f8,%edx
  10150d:	b8 a0 25 26 00       	mov    $0x2625a0,%eax
  101512:	6a 03                	push   $0x3
  101514:	52                   	push   %edx
  101515:	6a 08                	push   $0x8
  101517:	50                   	push   %eax
  101518:	e8 87 fd ff ff       	call   1012a4 <set_trap>
  10151d:	83 c4 10             	add    $0x10,%esp

	set_intr(idt + 32 + 0, SEG_KERNEL_CODE << 3, (uint32_t)irq0, DPL_KERNEL);
  101520:	ba 04 16 10 00       	mov    $0x101604,%edx
  101525:	b8 a0 22 26 00       	mov    $0x2622a0,%eax
  10152a:	6a 00                	push   $0x0
  10152c:	52                   	push   %edx
  10152d:	6a 08                	push   $0x8
  10152f:	50                   	push   %eax
  101530:	e8 e0 fc ff ff       	call   101215 <set_intr>
  101535:	83 c4 10             	add    $0x10,%esp
	set_intr(idt + 32 + 1, SEG_KERNEL_CODE << 3, (uint32_t)irq1, DPL_KERNEL);
  101538:	ba 10 16 10 00       	mov    $0x101610,%edx
  10153d:	b8 a8 22 26 00       	mov    $0x2622a8,%eax
  101542:	6a 00                	push   $0x0
  101544:	52                   	push   %edx
  101545:	6a 08                	push   $0x8
  101547:	50                   	push   %eax
  101548:	e8 c8 fc ff ff       	call   101215 <set_intr>
  10154d:	83 c4 10             	add    $0x10,%esp
	set_intr(idt + 32 + 14, SEG_KERNEL_CODE << 3, (uint32_t)irq14, DPL_KERNEL);
  101550:	ba 1c 16 10 00       	mov    $0x10161c,%edx
  101555:	b8 10 23 26 00       	mov    $0x262310,%eax
  10155a:	6a 00                	push   $0x0
  10155c:	52                   	push   %edx
  10155d:	6a 08                	push   $0x8
  10155f:	50                   	push   %eax
  101560:	e8 b0 fc ff ff       	call   101215 <set_intr>
  101565:	83 c4 10             	add    $0x10,%esp

	/* the ``idt'' is its virtual address */
	write_idtr(idt, sizeof(idt));
  101568:	68 00 08 00 00       	push   $0x800
  10156d:	68 a0 21 26 00       	push   $0x2621a0
  101572:	e8 b9 fd ff ff       	call   101330 <write_idtr>
  101577:	83 c4 08             	add    $0x8,%esp
}
  10157a:	90                   	nop
  10157b:	c9                   	leave  
  10157c:	c3                   	ret    

0010157d <vec0>:
#----|-----entry------|-errorcode-|-----id-----|---handler---|
.globl vec0;    vec0:   pushl $0;  pushl    $0; jmp asm_do_irq
  10157d:	6a 00                	push   $0x0
  10157f:	6a 00                	push   $0x0
  101581:	e9 ab 00 00 00       	jmp    101631 <asm_do_irq>

00101586 <vec1>:
.globl vec1;    vec1:   pushl $0;  pushl    $1; jmp asm_do_irq
  101586:	6a 00                	push   $0x0
  101588:	6a 01                	push   $0x1
  10158a:	e9 a2 00 00 00       	jmp    101631 <asm_do_irq>

0010158f <vec2>:
.globl vec2;    vec2:   pushl $0;  pushl    $2; jmp asm_do_irq
  10158f:	6a 00                	push   $0x0
  101591:	6a 02                	push   $0x2
  101593:	e9 99 00 00 00       	jmp    101631 <asm_do_irq>

00101598 <vec3>:
.globl vec3;    vec3:   pushl $0;  pushl    $3; jmp asm_do_irq
  101598:	6a 00                	push   $0x0
  10159a:	6a 03                	push   $0x3
  10159c:	e9 90 00 00 00       	jmp    101631 <asm_do_irq>

001015a1 <vec4>:
.globl vec4;    vec4:   pushl $0;  pushl    $4; jmp asm_do_irq
  1015a1:	6a 00                	push   $0x0
  1015a3:	6a 04                	push   $0x4
  1015a5:	e9 87 00 00 00       	jmp    101631 <asm_do_irq>

001015aa <vec5>:
.globl vec5;    vec5:   pushl $0;  pushl    $5; jmp asm_do_irq
  1015aa:	6a 00                	push   $0x0
  1015ac:	6a 05                	push   $0x5
  1015ae:	e9 7e 00 00 00       	jmp    101631 <asm_do_irq>

001015b3 <vec6>:
.globl vec6;    vec6:   pushl $0;  pushl    $6; jmp asm_do_irq
  1015b3:	6a 00                	push   $0x0
  1015b5:	6a 06                	push   $0x6
  1015b7:	e9 75 00 00 00       	jmp    101631 <asm_do_irq>

001015bc <vec7>:
.globl vec7;    vec7:   pushl $0;  pushl    $7; jmp asm_do_irq
  1015bc:	6a 00                	push   $0x0
  1015be:	6a 07                	push   $0x7
  1015c0:	e9 6c 00 00 00       	jmp    101631 <asm_do_irq>

001015c5 <vec8>:
.globl vec8;    vec8:              pushl    $8; jmp asm_do_irq
  1015c5:	6a 08                	push   $0x8
  1015c7:	e9 65 00 00 00       	jmp    101631 <asm_do_irq>

001015cc <vec9>:
.globl vec9;    vec9:   pushl $0;  pushl    $9; jmp asm_do_irq
  1015cc:	6a 00                	push   $0x0
  1015ce:	6a 09                	push   $0x9
  1015d0:	e9 5c 00 00 00       	jmp    101631 <asm_do_irq>

001015d5 <vec10>:
.globl vec10;   vec10:             pushl   $10; jmp asm_do_irq
  1015d5:	6a 0a                	push   $0xa
  1015d7:	e9 55 00 00 00       	jmp    101631 <asm_do_irq>

001015dc <vec11>:
.globl vec11;   vec11:             pushl   $11; jmp asm_do_irq
  1015dc:	6a 0b                	push   $0xb
  1015de:	e9 4e 00 00 00       	jmp    101631 <asm_do_irq>

001015e3 <vec12>:
.globl vec12;   vec12:             pushl   $12; jmp asm_do_irq
  1015e3:	6a 0c                	push   $0xc
  1015e5:	e9 47 00 00 00       	jmp    101631 <asm_do_irq>

001015ea <vec13>:
.globl vec13;   vec13:             pushl   $13; jmp asm_do_irq
  1015ea:	6a 0d                	push   $0xd
  1015ec:	e9 40 00 00 00       	jmp    101631 <asm_do_irq>

001015f1 <vec14>:
.globl vec14;   vec14:             pushl   $14; jmp asm_do_irq
  1015f1:	6a 0e                	push   $0xe
  1015f3:	e9 39 00 00 00       	jmp    101631 <asm_do_irq>

001015f8 <vecsys>:

.globl vecsys; vecsys:  pushl $0;  pushl $0x80; jmp asm_do_irq
  1015f8:	6a 00                	push   $0x0
  1015fa:	68 80 00 00 00       	push   $0x80
  1015ff:	e9 2d 00 00 00       	jmp    101631 <asm_do_irq>

00101604 <irq0>:

.globl irq0;     irq0:  pushl $0;  pushl $1000; jmp asm_do_irq
  101604:	6a 00                	push   $0x0
  101606:	68 e8 03 00 00       	push   $0x3e8
  10160b:	e9 21 00 00 00       	jmp    101631 <asm_do_irq>

00101610 <irq1>:
.globl irq1;     irq1:  pushl $0;  pushl $1001; jmp asm_do_irq
  101610:	6a 00                	push   $0x0
  101612:	68 e9 03 00 00       	push   $0x3e9
  101617:	e9 15 00 00 00       	jmp    101631 <asm_do_irq>

0010161c <irq14>:
.globl irq14;   irq14:  pushl $0;  pushl $1014; jmp asm_do_irq
  10161c:	6a 00                	push   $0x0
  10161e:	68 f6 03 00 00       	push   $0x3f6
  101623:	e9 09 00 00 00       	jmp    101631 <asm_do_irq>

00101628 <irq_empty>:
.globl irq_empty;
			irq_empty:	pushl $0;  pushl   $-1; jmp asm_do_irq
  101628:	6a 00                	push   $0x0
  10162a:	6a ff                	push   $0xffffffff
  10162c:	e9 00 00 00 00       	jmp    101631 <asm_do_irq>

00101631 <asm_do_irq>:

# The follow code is *VERY* important for interrupts and exceptions handling.
# You should make yourself understand it clearly.

asm_do_irq:
	pushal
  101631:	60                   	pusha  

	pushl %esp		# ???
  101632:	54                   	push   %esp
	call irq_handle
  101633:	e8 09 fa ff ff       	call   101041 <irq_handle>
	
	addl $4, %esp
  101638:	83 c4 04             	add    $0x4,%esp
	popal
  10163b:	61                   	popa   
	addl $8, %esp
  10163c:	83 c4 08             	add    $0x8,%esp
	iret
  10163f:	cf                   	iret   
