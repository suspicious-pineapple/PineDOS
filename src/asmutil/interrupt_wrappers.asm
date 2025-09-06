


align 4




global set_isr
set_isr:
   mov ecx, dword [esp+4] ; handler
   xor edx,edx
   mov dx, word [esp+8] ;interrupt number

   pusha

       extern default_interrupt
       mov ecx, int_handler
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

;        mov eax,int_handler
;    mov [interrupt_table+49*8],ax
;    mov word [interrupt_table+49*8+2],0x8
;    mov word [interrupt_table+49*8+4],0x8E00
;    shr eax,16
;    mov [interrupt_table+49*8+6],ax



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
int 49
ret


interrupt_table:
;times 8*256 db 0
resd 50*2

align 4
interrupt_table_descriptor:
dw (50*8)-1
dd (interrupt_table)



 int_handler:
;    pusha
    call print_hex_serial
    iret
    ;hlt
    ;jmp $
    ;mov ax, 0x10
    ;mov gs, ax
    ;mov dword [gs:0xB8000],') : '
;    popa
    ;pop edx
    mov al, 0x20
    mov dx, 0x20
    out dx,al
    iret
; 
; idt:
;    resd 50*2
; 
; idtr:
;    dw (50*8)-1
;    dd (idt)
; global test1
; test1:
;    lidt [idtr]
;    mov eax,int_handler
;    mov [idt+49*8],ax
;    mov word [idt+49*8+2],0x8
;    mov word [idt+49*8+4],0x8E00
;    shr eax,16
;    mov [idt+49*8+6],ax
;    int 49
;    int 49