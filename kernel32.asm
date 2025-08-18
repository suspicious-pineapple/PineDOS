BITS 32

global kernel_main
kernel_main:
mov dword [MULTIBOOT_INFO_ADDR],ebx
mov ebx, MULTIBOOT_INFO_ADDR
mov ecx, dword [ebx+88]
mov dword [FRAMEBUFFER], ecx
mov ecx, dword [ebx+96]
mov dword [FRAMEBUFFER_PITCH], ecx
mov ecx, dword [ebx+100]
mov dword [FRAMEBUFFER_WIDTH], ecx
mov ecx, dword [ebx+104]
mov dword [FRAMEBUFFER_HEIGHT], ecx
mov ecx, dword [ebx+108]
mov dword [FRAMEBUFFER_BPP], ecx






mov eax, 4
mov ecx, 15
mov edx, 15
call put_pixel

.halt:
pusha
mov al, 'A'
mov dx, 0x3F8
out dx, al
popa
pusha
inc dx
inc al
call put_pixel
cmp dx, 200
jle .noclear
mov dx,0
inc cx
cmp cx,200
jle .noclear
mov cx,0
.noclear:

popa

jmp .halt

jmp kernel_main



put_pixel: ;eax -> color, ecx = x, edx = y, ebx = ??ß
pusha
    push eax
    mov ebx, dword [FRAMEBUFFER]
    mov eax, dword [FRAMEBUFFER_PITCH]
    mul  edx
    mov edx, eax
    mov eax, dword [FRAMEBUFFER_BPP]
    mul ecx
    mov ecx,eax
    add ebx, edx
    add ebx, ecx
    pop eax
    mov byte [ebx], al
popa
ret


MULTIBOOT_INFO_ADDR: dq 0
FRAMEBUFFER: dq 0
FRAMEBUFFER_PITCH dq 0
FRAMEBUFFER_WIDTH dq 0
FRAMEBUFFER_HEIGHT dq 0
FRAMEBUFFER_BPP dq 0
FRAMEBUFFER_TYPE dq 0

