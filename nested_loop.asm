include  'win32a.inc'

format PE console
entry  start

section '.text' code readable executable 
; ======================================

start:
    call         read_hex
	mov          edx, eax
	mov          ebx, 1
	
bigger_loop: 
    mov          ecx, ebx
	xor          eax, eax

internal_loop:
    inc          eax
    call         print_eax
    loop         internal_loop
    inc          ebx
    cmp          ebx, edx
    jbe          bigger_loop	

    push         0
    call         [ExitProcess]

include  'training.inc'	