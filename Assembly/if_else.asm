include  'win32a.inc'

format PE console
entry  start

section '.text' code readable executable 
; ======================================

start:
    call         read_hex
	mov          ebx, eax
	call         read_hex
	cmp          eax, ebx
	je           equal
	xor          eax, eax
	jmp          finish
	
equal:
    mov          eax, 1
    


finish:
    call         print_eax

    push         0
    call         [ExitProcess]

include  'training.inc'	
