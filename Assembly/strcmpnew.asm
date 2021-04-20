include 'win32a.inc'

format PE console
entry start
MAX_STR_SIZE = 0x30

section '.data' data readable writeable
	str1		db	'sometheinx', 0
	str2		db	'sometheing', 0
	same		db	'Identical', 13, 10, 0
	different	db	'Not identical', 13, 10, 0
	
section '.text' code readable executable

start:
	
	; Check str1 length
	xor     eax, eax
	xor     ecx, ecx
	mov     ecx, MAX_STR_SIZE
	mov     edi, str1
	xor     al, al
	
	;...
	repne	scasb
	
	mov     edx, MAX_STR_SIZE
	sub     edx, ecx
	;...
	
	; Check str2 length
	mov     ecx, MAX_STR_SIZE
	mov     edi, str2
	xor     al, al
	;...
	repne	scasb
	xor     eax, eax
	mov     eax, MAX_STR_SIZE
	sub     eax, ecx
	mov     ecx, eax
	;...
	
	; compare strings lengths
	cmp		ecx, edx
	jne		not_identical
	
	; compare strings
	mov     esi, str1
	mov     edi, str2
	; ecx already has the size of the strings which thier lengths are equal.
	cld
	; ...
	
	repe	cmpsb
	jne		not_identical

identical:
	mov		esi, same
	call 	print_str
	jmp		done	
	
not_identical:
	mov		esi, different
	call 	print_str
	
done:	
	push	0
	call	[ExitProcess]
	
include 	'training.inc'