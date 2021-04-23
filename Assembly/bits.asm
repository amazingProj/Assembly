include 'win32a.inc'

format PE console
entry start

section '.data' data readable writeable
    msg1    db  'even',13,10,0
	msg2   db  'odd',13,10,0
	
section '.text' code readable executable
; ======================================
	
start:
	call    read_hex
	and     eax, 0x000000001
	jz      even
	; number is odd
	mov     esi, msg2
	call    print_str
	jmp     finish

even:
    ; number is even
    mov     esi, msg1
    call    print_str
finish:
    	
	
; ====================================

	push	0
	call	[ExitProcess]

include 'training.inc'

