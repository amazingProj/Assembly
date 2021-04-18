include  'win32a.inc'

format PE console
entry  start

section '.text' code readable executable 
; ======================================

start:
    call         read_hex
	mov          ecx, eax
	xor          eax, eax
	
again:
    add          eax, ecx
	loop         again
	
    


finish:
    call         print_eax

    push         0
    call         [ExitProcess]

include  'training.inc'	