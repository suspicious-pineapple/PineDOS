BITS 32
MBALIGN  equ  1 << 0            ; align loaded modules on page boundaries
MEMINFO  equ  1 << 1            ; provide memory map
VGAINFO	 equ 1<<2	
MBFLAGS  equ  MBALIGN | MEMINFO | VGAINFO ; this is the Multiboot 'flag' field
MAGIC    equ  0x1BADB002        ; 'magic number' lets bootloader find the header
CHECKSUM equ -(MAGIC + MBFLAGS)   ; checksum of above, to prove we are multiboot


section .multiboot
align 4
    dd MAGIC
    dd MBFLAGS
    dd CHECKSUM
    resd 1
    resd 1
    resd 1
    resd 1
    resd 1
    dd 0
    dd 640
    dd 480
    dd 16

section .bss
align 16

stack_bottom:
resb 16384
stack_top:

section .text
global _start:function (_start.end - _start)

_start:
    mov esp, stack_top
    extern kernel_main
    call kernel_main
    cli
    .hang: hlt
        jmp .hang
    .end:



