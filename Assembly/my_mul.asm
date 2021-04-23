include 'win32a.inc'

format PE console
entry start


section '.data' data readable writeable
	var1	dd	2
	var2	dd	3
	result	dd	?
	
section '.text' code readable executable

start:
	push	[var1]
	push	[var2]
	push	result
	call	my_mul
	mov		eax, [result]
	call	print_eax
	
	push	0
	call	[ExitProcess]
	
my_mul:
	push	ebp
	mov		ebp, esp
	mov		eax, [ebp+16]
	mov		ebx, [ebp+12]
	mul		ebx
	mov		ebx, [ebp+8]
	mov		[ebx], eax
	mov		esp, ebp
	pop		ebp
	ret		12
	
	
include 	'training.inc'
