


global _set_interrupt_routine
_set_interrupt_routine:
mov edx, byte [esp+4]
mov ecx, dword [esp+8]; 4 byte aligned

pusha



popa


ret







global _default_interrupt_handler
_default_interrupt_handler:
pushad
cld
extern default_interrupt_c
call default_interrupt_c

popad

iret












global interrupt_table
interrupt_table:
times 8*256 db 0





