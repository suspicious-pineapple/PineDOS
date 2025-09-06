


align 4




global set_isr
set_isr:
    mov ecx, dword [esp+4] ; handler
    xor edx,edx
    mov dx, word [esp+8] ;interrupt number

    pusha
        extern default_interrupt
        mov ecx, default_interrupt
        shl edx, 3 ; multiply by 8 bytes to get idt entry offset

        mov word [edx+interrupt_table], cx ; low 16 bits of offset
        and ecx, 0xFFFF0000
        shr ecx, 16

        mov word [edx+interrupt_table+6], cx ; high 16 bits of offset

        mov word [edx+interrupt_table+2], 08h
        mov byte [edx+interrupt_table+3], 0

        mov byte [edx+interrupt_table+4], 10001110b

    popa
ret



global enable_interrupts
enable_interrupts:
    sti
ret

global disable_interrupts
disable_interrupts:
    cli
ret


global load_interrupts
load_interrupts:
    lidt [interrupt_table_descriptor]
ret

global trigger_int
trigger_int:
int 1
ret


interrupt_table:
times 8*256 db 0


align 4
interrupt_table_descriptor:
db 33
dd interrupt_table
clear
