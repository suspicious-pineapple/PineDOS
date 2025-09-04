;[BITS 32]
cli
lgdt [gdt_desc]
xor ax, ax
;
mov ax, 10h
;mov ds, ax
;mov ss, ax
jmp 08h:clear_pipe
;
;
align 16
gdt:

gdt_null:
   dq 0
gdt_code:
   dw 0FFFFh
   dw 0
db 0
db 10011010b
db 11001111b
db 0
gdt_data:
   dw 0FFFFh
   dw 0
db 0
db 10010010b
db 11001111b
db 0
gdt_end:

gdt_desc:
   db gdt_end - gdt
   dd gdt
;
;
clear_pipe:
