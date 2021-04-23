include 'win32a.inc'

format PE console
entry start

section '.text' code readable executable
; ======================================
start:
	; calculates a * b * c
	call	read_hex
	mov		ebx, eax
	call	read_hex
	call	multiply
	mov		ebx, eax
	call	read_hex
	call	multiply
	call	print_eax
; ====================================

	push	0
	call	[ExitProcess]

multiply:
	; stores eax * ebx in eax
	mul	ebx
	ret

include 'training.inc'
