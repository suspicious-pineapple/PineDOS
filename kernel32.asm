BITS 32

global kernel_main
kernel_main:
mov dword [MULTIBOOT_INFO_ADDR],ebx
;mov ebx, MULTIBOOT_INFO_ADDR
mov ecx, dword [ebx+88]
mov dword [FRAMEBUFFER], ecx
;mov dword [FRAMEBUFFER], 0xA0000
mov ecx, dword [ebx+96]
mov dword [FRAMEBUFFER_PITCH], ecx
mov ecx, dword [ebx+100]
mov dword [FRAMEBUFFER_WIDTH], ecx
mov ecx, dword [ebx+104]
mov dword [FRAMEBUFFER_HEIGHT], ecx
mov ecx, dword [ebx+108]
mov dword [FRAMEBUFFER_BPP], ecx




mov ecx, 200
mov edx, 100
mov eax, 0xFFFF0000
mov al, 'Z'

mov dword [put_char.scale], 1
call put_char





mov byte [CONSOLE_BUFFER+128],'F'
mov byte [CONSOLE_BUFFER+128+2],'R'
mov byte [CONSOLE_BUFFER+128+4],'O'
mov byte [CONSOLE_BUFFER+128+6],'G'
mov byte [CONSOLE_BUFFER+128+8],'S'
mov byte [CONSOLE_BUFFER+128+10],'!'
mov byte [CONSOLE_BUFFER+128+10],'!'

call console_render

xor ecx,ecx
xor edx,edx
.loop:
;mov eax, 111111111111111111111111b
xor eax,eax
mov al, 255
shl eax,8
mov al, 255
shl eax,8
mov al,0

mov eax, 0xFF00FF

call put_pixel
inc ecx


cmp ecx, 32
jle .loop
inc edx
mov eax,edx
call print_hex_serial
xor ecx,ecx

cmp edx, 32

jle .loop
xor edx,edx
jmp .loop


;jmp $




jmp kernel_main


;global
put_pixel: ;eax -> color, ecx = x, edx = y
pusha
    push eax
    mov ax, 0x1111
    call print_hex_serial
    pop eax   

    push eax
    mov eax, dword [FRAMEBUFFER]
    call print_hex_serial
    mov ebx, dword [FRAMEBUFFER]
    mov eax, dword [FRAMEBUFFER_PITCH]
    call print_hex_serial
    mul edx

    push eax

    mov eax, dword [FRAMEBUFFER_BPP]
    mov eax,4
    call print_hex_serial
    mul ecx
    mov ecx,eax
    pop edx
    add ebx, edx
    add ebx, ecx
    pop eax
    mov dword [ebx], eax

    mov eax,ebx
    call print_hex_serial
popa
ret



console_render:
pusha

mov eax, dword [DISPLAY_SCALE]
mov dword [put_char.scale], eax


mov ecx, 42*69
mov esi, CONSOLE_BUFFER

.printloop:
push ecx
xor eax,eax
lodsw
cmp al, 0
jne .notnull
pop ecx
loop .printloop
.notnull:


xor ebx,ebx
mov bx,ax
shr bx,8
and ebx,11111b
add ebx,VGA_COLORS
mov ebx,dword [ebx];
shl ebx,8
or eax,ebx

push eax


mov eax, ecx
xor edx,edx

div dword [CONSOLE_COLUMNS] ; EAX => Vertical position, EDX => Horizontal position



mov ebx, dword [CHARACTER_HEIGHT]
mov cl, byte [DISPLAY_SCALE]



shl ebx, cl
push edx
mul ebx
pop edx ; i dont care about the overflow here



push eax ;now holds the target vertical position, later to be popped into edx

mov eax, dword [CHARACTER_WIDTH]
mov cl, byte [DISPLAY_SCALE]
shl eax,cl
mul edx

mov ecx,eax
pop edx
pop eax

call put_char

pop ecx
loop .printloop



popa
ret



print_hex_serial:
pusha
    push eax
    shr eax, 16
    call print_hex_serial_16
    pop eax
    call print_hex_serial_16
    mov dx, 0x3F8
    mov al, 0Dh
    out dx, al
    mov al, 0Ah
    out dx, al
popa
ret


print_hex_serial_16:
    pusha
        mov bx, ax
        shr ax, 12
        call .print_nibble
        mov ax, bx
        shr ax, 8
        call .print_nibble
        mov ax, bx
        shr ax, 4
        call .print_nibble
        mov ax, bx
        call .print_nibble

        popa
    ret
        .print_nibble:
            and ax, 0Fh
            cmp ax, 10
            jge .greaterThan9
            add al, '0'
            jmp .print
            .greaterThan9:
            add al, 'A'-10
            .print:
            mov dx, 0x3F8
            out dx,al
        ret





%include "character_drawing.asm"




global ACTIVE_COLOR
ACTIVE_COLOR: dd 0xFF00FF


%include "colors.asm"


MULTIBOOT_INFO_ADDR: dq 0
FRAMEBUFFER: dq 0
FRAMEBUFFER_PITCH dq 0
FRAMEBUFFER_WIDTH dq 0
FRAMEBUFFER_HEIGHT dq 0
FRAMEBUFFER_BPP dq 0
FRAMEBUFFER_TYPE dq 0


;global CONSOLE_TEXT
CONSOLE_COLUMNS dd 69
CONSOLE_ROWS dd 42
CONSOLE_BUFFER times (42*69*2) db 0
DISPLAY_SCALE dq 0
CHARACTER_HEIGHT dq 7
CHARACTER_WIDTH dq 5
