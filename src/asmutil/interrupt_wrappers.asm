


align 4




global set_isr
set_isr:
   mov ecx, dword [esp+4] ; handler
   xor edx,edx
   mov dx, word [esp+8] ;interrupt number

   pusha
       extern default_interrupt
       ;mov ecx, int_handler
       ;shl edx, 3 ; multiply by 8 bytes to get idt entry offset
       
       ; mov edx, 49*8
       mov word [edx*8+interrupt_table], cx ; low 16 bits of offset
       shr ecx, 16

       mov word [edx*8+interrupt_table+6], cx ; high 16 bits of offset

       mov word [edx*8+interrupt_table+2], 08h
       mov byte [edx*8+interrupt_table+3], 0
            ;    mov word [idt+49*8+4],0x8E00
       mov word [edx*8+interrupt_table+4], 0x8E00

       mov byte [edx*8+interrupt_table+4], 10001110b


   popa
ret


extern handle_interrupt
    %assign i 0
%rep 256
     align 4,nop
global generic_isr_%[i]
generic_isr_%[i]:
    pusha
    
    push dword i
    call handle_interrupt
    add esp,4
    popa
    iret
%assign i i+1
%endrep


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
int 49
ret

global scheduler_int
scheduler_int:

int 0x22
ret




interrupt_table:
;times 8*256 db 0
resd 50*2

align 4
interrupt_table_descriptor:
dw (50*8)-1
dd (interrupt_table)



