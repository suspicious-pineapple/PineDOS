;[BITS 32]
cli
lgdt [gdt]
xor ax, ax
;
mov ax, 10h
mov ds, ax
mov ss, ax
mov es, ax
mov fs, ax
mov gs, ax
jmp 08h:clear_pipe
;
;
align 16 ; shamelessly stolen from https://github.com/GamingMike45/OSDev/blob/main/gdt.asm. gotta replace it with my own, someday

gdt_null_segment:
	dq 0x0
gdt_code_segment:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10011010b
	db 11001111b
	db 0x0
gdt_data_segment:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10010010b
	db 11001111b
	db 0x0
gdt_end:

gdt:
	dw gdt_end - gdt_null_segment - 1
	dd gdt_null_segment
clear_pipe:
