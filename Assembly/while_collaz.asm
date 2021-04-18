include  'win32a.inc'

format PE console
entry  start

section '.text' code readable executable 
; ======================================

start:
    call         read_hex
	xor          ecx, ecx
while_loop:
    cmp          eax, 1
    je           finish
    test         eax, 1
    jnz          odd
even:
    shr          eax, 1
    jmp          next
odd:
    lea          eax, [eax*3 + 1]
	
next:
	inc          ecx
	jmp          while_loop
finish:
    mov          eax, ecx
    call         print_eax

; exit code	
    push         0
    call         [ExitProcess]

include  'training.inc'	
