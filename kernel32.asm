BITS 32

global kernel_main
kernel_main:
mov dword [MULTIBOOT_INFO_ADDR],ebx
mov ebx, MULTIBOOT_INFO_ADDR
add ebx,88
mov ecx, dword [ebx]
mov dword [FRAMEBUFFER], ecx

mov ebx,ecx
.loop:
mov byte [ebx+ecx], 69
inc ecx
cmp ecx,640*480*4
jmp .loop


.halt:
jmp .halt

jmp kernel_main












MULTIBOOT_INFO_ADDR: dd 0
FRAMEBUFFER: dd 0


