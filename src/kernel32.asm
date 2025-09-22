BITS 32


cfg_console_width equ 72
cfg_console_height equ 38
;cfg_kernel_heap_size equ 0x4000000
;cfg_kernel_heap_location equ 0x3200000 ; locate kernel at 50MiB for no particular reason. i am sure this will not bite me in the ass later on

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





%include "src/asmutil/gdt.asm"












mov byte [DISPLAY_SCALE],1




extern cmain
call cmain


call console_render
jmp $

mov edx, 150
mov ecx, 0
mov eax, 0x0000FF
mov ebx, 640
call horizontal_line

xor edx,edx
.loop:
;mov eax, 111111111111111111111111b

mov eax, 0xFF00FF
mov eax,edx
shl eax, 10
call put_pixel
inc ecx


mov eax,ecx
;call print_hex_serial
cmp ecx, 32
jle .loop
inc edx
xor ecx,ecx

cmp edx, 32

jle .loop
xor edx,edx
jmp .loop


;jmp $




jmp kernel_main



global _console_render
_console_render:
console_render: ;void (void)
pusha

mov eax, dword [DISPLAY_SCALE]
mov dword [put_char.scale], eax

cld
mov ecx, cfg_console_height*cfg_console_width
mov esi, CONSOLE_BUFFER

.printloop:
push ecx
xor eax,eax
lodsw
cmp al, 0
jne .notnull
;pop ecx
;loop .printloop
.notnull:

xor ebx,ebx
mov bx,ax
shr bx,8
and ebx,11111b
shl bx,2
add ebx,VGA_COLORS
mov ebx,dword [ebx]; lookup the color
shl ebx,8
or eax,ebx ; add the color to the packet. high 3 bytes = color, low byte = character

push eax

mov eax, cfg_console_height*cfg_console_width
sub eax, ecx

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

global _console_render_line
_console_render_line:
std
mov edx, dword [esp+4] ;the line to render
pusha

mov eax, dword [DISPLAY_SCALE]
mov dword [put_char.scale], eax

push edx
mov eax, edx
mul dword [CONSOLE_COLUMNS]
shl eax, 1
mov esi, eax
add esi, CONSOLE_BUFFER
add esi, dword [CONSOLE_COLUMNS]
add esi, dword [CONSOLE_COLUMNS]
dec esi
dec esi
pop edx


mov cl, byte [DISPLAY_SCALE]
mov eax, dword [CHARACTER_HEIGHT]
shl eax,cl ;eax is now the true char height
mul edx ; mul eax by edx, overflow in edx
mov edx, eax ;ignore overflow, use edx as vertical position. dont touch this

mov ecx, dword [CONSOLE_COLUMNS]

.lineprintloop:
push ecx
mov eax,ecx
push edx
dec eax
mul dword [CHARACTER_WIDTH] ;multiply the char width by ecx, the column
mov cl, byte [DISPLAY_SCALE]
shl eax,cl ; now holds the true char width

mov ecx, eax
pop edx
lodsw
xor ebx,ebx
mov bx,ax
shr bx, 8
and bx, 11111b
shl bx, 2
add ebx, VGA_COLORS
mov ebx, dword [ebx]
shl ebx, 8
mov bl,al
mov eax,ebx
;mov edx, 155
;mov ecx, 200
;mov eax, 0xFF00FF00
;mov al, 'F'
;xchg ecx, edx
call put_char
pop ecx

loop .lineprintloop

cld
popa
ret







put_console_char: ;ax -> char and color, ecx -> column, edx -> row 
cmp ecx, dword [CONSOLE_COLUMNS]
jg anxiety
cmp edx, dword [CONSOLE_ROWS]
jg anxiety
pusha
push eax
mov eax, edx
mul dword [CONSOLE_COLUMNS]
add eax, ecx
shl eax,1 ; leftshift to multiply by 2, even addresses have letters, odd addresses have color data
mov ebx,eax
pop eax
mov byte [CONSOLE_BUFFER+ebx],al
mov byte [CONSOLE_BUFFER+1+ebx],ah
popa
ret

print_char:
pusha
cmp al, 0x0a
je .linefeed
cmp al, 0x0d
je .carriagereturn
mov ecx, dword [CONSOLE_CURRENT_COLUMN]
mov edx, dword [CONSOLE_CURRENT_ROW]
call put_console_char
inc dword [CONSOLE_CURRENT_COLUMN]
cmp ecx, dword [CONSOLE_COLUMNS]
jge .fullnewline
jmp .endprint
.carriagereturn:
mov dword [CONSOLE_CURRENT_COLUMN], 0
jmp .endprint
.linefeed:
inc dword [CONSOLE_CURRENT_ROW]
jmp .endprint
.fullnewline:
mov dword [CONSOLE_CURRENT_COLUMN],0
inc dword [CONSOLE_CURRENT_ROW]
jmp .endprint
.endprint:
mov eax, dword [CONSOLE_CURRENT_ROW]
cmp eax, dword [CONSOLE_ROWS]
jl .endprint_fr
call scroll_console
dec dword [CONSOLE_CURRENT_ROW]

.endprint_fr:


popa
ret

extern stack_bottom
global _get_stacksize
_get_stacksize:
mov eax, stack_bottom + 16384
sub eax, esp
ret


extern scroll_console

global outb
outb:

mov dx, word [esp+4]
xor eax,eax
mov al, byte [esp+8]
out dx,al

ret

global inb
inb:
mov dx, word [esp+4]
xor eax,eax
in al,dx
ret
global inw
inw:
mov dx, word [esp+4]
xor eax,eax
in ax,dx
ret
global ind
ind:
mov dx, word [esp+4]
xor eax,eax
in eax,dx
ret




global outw
outw:

mov dx, word [esp+4]
xor eax,eax
mov ax, word [esp+8]
out dx,ax

ret

global outd
outd:

mov dx, word [esp+4]
xor eax,eax
mov eax, dword [esp+8]
out dx,eax

ret








global _set_console_color
_set_console_color:
mov dl, byte [esp+4]
mov byte [CONSOLE_COLOR], dl
ret


global _kprint
_kprint:
mov edx, dword [esp+4]
push esi
push eax
mov esi, edx
mov ah, byte [CONSOLE_COLOR]
call print_string 
pop eax
pop esi
ret

print_string: ; ESI -> String, EAX -> color. 0-terminated
pusha

.printloop:
lodsb ;load string byte from where ESI points, then increment ESI
cmp al, 0 ;compare the loaded byte to 0
je .finished ;if the comparison was true, string is over
call print_char ;print byte in "al". the print_char procedure handles newlines etc
jmp .printloop

.finished:

popa
ret

global _print_serial
_print_serial:
mov edx, dword [ESP + 4]
push esi
mov esi, edx
call print_string_serial
pop esi
ret

print_string_serial: ; ESI -> String, EAX -> color. 0-terminated
pusha

.printloop:
lodsb ;load string byte from where ESI points, then increment ESI
cmp al, 0 ;compare the loaded byte to 0
je .finished ;if the comparison was true, string is over
mov dx,0x3F8
out dx,al
jmp .printloop

.finished:

popa
ret





global _anxiety
anxiety:
mov eax, 0xDEAD ;RIP :( something went wrong
call print_hex_serial
jmp $ ;halt


global _fault
_fault:
mov al,0
div al
ret



print_hex_serial:
pusha
    push eax
    shr eax, 16
    call print_hex_serial_16
    pop eax
    call print_hex_serial_16
    mov dx, 0x3F8 ;out port for serial0
    mov al, 0Dh ;send CR
    out dx, al
    mov al, 0Ah ;send LF
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







times 100 db 0

%include "src/asmutil/memfunc.asm"
%include "src/asmutil/character_drawing.asm"
%include "src/colors.asm"
%include "src/asmutil/drawing.asm"
%include "src/asmutil/interrupt_wrappers.asm"
%include "src/asmutil/scheduler.asm"

times 100 db 0

;ACTIVE_COLOR: dd 0xFF00FF



global kglobals
kglobals:


MULTIBOOT_INFO_ADDR: dd 0
global FRAMEBUFFER
FRAMEBUFFER dd 0
global FRAMEBUFFER_PITCH
FRAMEBUFFER_PITCH dd 0
global FRAMEBUFFER_WIDTH
FRAMEBUFFER_WIDTH dd 0
global FRAMEBUFFER_HEIGHT
FRAMEBUFFER_HEIGHT dd 0
global FRAMEBUFFER_BPP
FRAMEBUFFER_BPP dd 0
global FRAMEBUFFER_TYPE
FRAMEBUFFER_TYPE dd 0


global KERNEL_TIME
KERNEL_TIME dd 1

;global CONSOLE_TEXT
global CONSOLE_COLUMNS
CONSOLE_COLUMNS dd cfg_console_width
global CONSOLE_ROWS
CONSOLE_ROWS dd cfg_console_height
global CONSOLE_CURRENT_ROW
CONSOLE_CURRENT_ROW dd 1 
global CONSOLE_CURRENT_COLUMN
CONSOLE_CURRENT_COLUMN dd 0
CONSOLE_COLOR: dd 0
DISPLAY_SCALE dd 0
global CHARACTER_HEIGHT
CHARACTER_HEIGHT dd 7+3
global CHARACTER_WIDTH
CHARACTER_WIDTH dd 5+1




global CONSOLE_BUFFER

CONSOLE_BUFFER: times ((cfg_console_height+1)*cfg_console_width*2) db 0


TEST_STRING: db "String printing works",0dh,0ah,0



