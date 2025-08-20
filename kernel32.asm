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
mov eax,ecx
call print_hex_serial




mov eax, 0x12345678
call print_hex_serial

jmp draw_routine
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


draw_line: ;eax -> color, ecx: start, edx: end









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










ACTIVE_COLOR: dd 0xFF00FF



MULTIBOOT_INFO_ADDR: dq 0
FRAMEBUFFER: dq 0
FRAMEBUFFER_PITCH dq 0
FRAMEBUFFER_WIDTH dq 0
FRAMEBUFFER_HEIGHT dq 0
FRAMEBUFFER_BPP dq 0
FRAMEBUFFER_TYPE dq 0

;global CONSOLE_TEXT
CONSOLE_TEXT times (40*80) db 'E'

draw_routine:

mov dword [offsetYold], 0

mov dword [scanOffset], 0
mov dword [scanLength], 120
;op add maxScan scanOffset scanLength
mov eax, dword [scanOffset]
add eax, dword [scanLength]
mov dword [maxScan],eax

vsync:
;set addr scanOffset
mov eax,[scanOffset]
mov dword [addr], eax

hsync:
;jump vsync greaterThanEq addr maxScan
mov eax, dword [addr]
cmp eax, dword [maxScan]
jge vsync

;op idiv offsetY addr 29
;op mod offsetX addr 29

mov eax, [addr]
mov ecx, dword 29
div ecx
mov dword [offsetY], eax
dec edx
mov dword [offsetX], edx
;op sub offsetX offsetX 1



;op mul offsetY offsetY 8
;op mul offsetX offsetX 6
;op sub offsetY 169 offsetY

mov eax, [offsetY]
mov ebx, 8
mul ebx
mov dword [offsetY],eax

mov eax, [offsetX]
mov ebx, 6
mul ebx
mov dword [offsetX],eax



;op add nextSync addr 29
;op min nextSync nextSync maxScan

mov eax, dword [addr]
add eax, 29

cmp eax, dword [maxScan]
jle smallerThanMaxScan
mov eax, dword [maxScan]
smallerThanMaxScan:
mov dword [nextSync], eax



mainLoop:
;jump hsync equal addr nextSync
mov eax, dword [addr]
cmp eax, [nextSync]
je hsync

;read currentChar bank1 addr
;op add addr addr 1

mov ebx, CONSOLE_TEXT
add ebx, dword [addr]
mov eax, dword [addr]
mov dword [currentChar],"E"
inc dword [addr]


;jump mainLoop lessThan currentChar 32
cmp dword [currentChar], 32
jl mainLoop

;op add offsetX offsetX 6
add dword [offsetX], 6

;drawflush display1





mov eax,dword [offsetY]
cmp eax,dword [offsetYold]
je ySetupDone
mov dword [offsetYold], eax
mov eax,dword [offsetY]
add eax,0
mov dword [gridY0], eax
mov eax,dword [offsetY]
add eax,1
mov dword [gridY1], eax
mov eax,dword [offsetY]
add eax,2
mov dword [gridY2], eax
mov eax,dword [offsetY]
add eax,3
mov dword [gridY3], eax
mov eax,dword [offsetY]
add eax,4
mov dword [gridY4], eax
mov eax,dword [offsetY]
add eax,5
mov dword [gridY5], eax
mov eax,dword [offsetY]
add eax,6
mov dword [gridY6], eax
mov eax,dword [offsetY]
add eax,7
mov dword [gridY7], eax
ySetupDone:


nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
cmp dword [currentChar], 32
je char32
cmp dword [currentChar], 33
je char33
cmp dword [currentChar], 34
je char34
cmp dword [currentChar], 35
je char35
cmp dword [currentChar], 36
je char36
cmp dword [currentChar], 37
je char37
cmp dword [currentChar], 38
je char38
cmp dword [currentChar], 39
je char39
cmp dword [currentChar], 40
je char40
cmp dword [currentChar], 41
je char41
cmp dword [currentChar], 42
je char42
cmp dword [currentChar], 43
je char43
cmp dword [currentChar], 44
je char44
cmp dword [currentChar], 45
je char45
cmp dword [currentChar], 46
je char46
cmp dword [currentChar], 47
je char47
cmp dword [currentChar], 48
je char48
cmp dword [currentChar], 49
je char49
cmp dword [currentChar], 50
je char50
cmp dword [currentChar], 51
je char51
cmp dword [currentChar], 52
je char52
cmp dword [currentChar], 53
je char53
cmp dword [currentChar], 54
je char54
cmp dword [currentChar], 55
je char55
cmp dword [currentChar], 56
je char56
cmp dword [currentChar], 57
je char57
cmp dword [currentChar], 58
je char58
cmp dword [currentChar], 59
je char59
cmp dword [currentChar], 60
je char60
cmp dword [currentChar], 61
je char61
cmp dword [currentChar], 62
je char62
cmp dword [currentChar], 63
je char63
cmp dword [currentChar], 64
je char64
cmp dword [currentChar], 65
je char65
cmp dword [currentChar], 66
je char66
cmp dword [currentChar], 67
je char67
cmp dword [currentChar], 68
je char68
cmp dword [currentChar], 69
je char69
cmp dword [currentChar], 70
je char70
cmp dword [currentChar], 71
je char71
cmp dword [currentChar], 72
je char72
cmp dword [currentChar], 73
je char73
cmp dword [currentChar], 74
je char74
cmp dword [currentChar], 75
je char75
cmp dword [currentChar], 76
je char76
cmp dword [currentChar], 77
je char77
cmp dword [currentChar], 78
je char78
cmp dword [currentChar], 79
je char79
cmp dword [currentChar], 80
je char80
cmp dword [currentChar], 81
je char81
cmp dword [currentChar], 82
je char82
cmp dword [currentChar], 83
je char83
cmp dword [currentChar], 84
je char84
cmp dword [currentChar], 85
je char85
cmp dword [currentChar], 86
je char86
cmp dword [currentChar], 87
je char87
cmp dword [currentChar], 88
je char88
cmp dword [currentChar], 89
je char89
cmp dword [currentChar], 90
je char90
cmp dword [currentChar], 91
je char91
cmp dword [currentChar], 92
je char92
cmp dword [currentChar], 93
je char93
cmp dword [currentChar], 94
je char94
cmp dword [currentChar], 95
je char95
cmp dword [currentChar], 96
je char96
cmp dword [currentChar], 97
je char97
cmp dword [currentChar], 98
je char98
cmp dword [currentChar], 99
je char99
cmp dword [currentChar], 100
je char100
cmp dword [currentChar], 101
je char101
cmp dword [currentChar], 102
je char102
cmp dword [currentChar], 103
je char103
cmp dword [currentChar], 104
je char104
cmp dword [currentChar], 105
je char105
cmp dword [currentChar], 106
je char106
cmp dword [currentChar], 107
je char107
cmp dword [currentChar], 108
je char108
cmp dword [currentChar], 109
je char109
cmp dword [currentChar], 110
je char110
cmp dword [currentChar], 111
je char111
cmp dword [currentChar], 112
je char112
cmp dword [currentChar], 113
je char113
cmp dword [currentChar], 114
je char114
cmp dword [currentChar], 115
je char115
cmp dword [currentChar], 116
je char116
cmp dword [currentChar], 117
je char117
cmp dword [currentChar], 118
je char118
cmp dword [currentChar], 119
je char119
cmp dword [currentChar], 120
je char120
cmp dword [currentChar], 121
je char121
cmp dword [currentChar], 122
je char122
cmp dword [currentChar], 123
je char123
cmp dword [currentChar], 124
je char124
cmp dword [currentChar], 125
je char125
cmp dword [currentChar], 126
je char126
char32:


jmp mainLoop
char33:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

jmp mainLoop
char34:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char35:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char36:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

jmp mainLoop
char37:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

jmp mainLoop
char38:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

jmp mainLoop
char39:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char40:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char41:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

jmp mainLoop
char42:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1

jmp mainLoop
char43:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char44:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1

jmp mainLoop
char45:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1

jmp mainLoop
char46:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1

jmp mainLoop
char47:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char48:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char49:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char50:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char51:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

jmp mainLoop
char52:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char53:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char54:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char55:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char56:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char57:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char58:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

jmp mainLoop
char59:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char60:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char61:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char62:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

jmp mainLoop
char63:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char64:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char65:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char66:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

jmp mainLoop
char67:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char68:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

jmp mainLoop
char69:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char70:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char71:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char72:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char73:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char74:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char75:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char76:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

jmp mainLoop
char77:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char78:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

jmp mainLoop
char79:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char80:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char81:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char82:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char83:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char84:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char85:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

jmp mainLoop
char86:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1

jmp mainLoop
char87:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char88:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

jmp mainLoop
char89:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

jmp mainLoop
char90:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char91:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char92:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

jmp mainLoop
char93:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char94:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char95:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1

jmp mainLoop
char96:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char97:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char98:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

jmp mainLoop
char99:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char100:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char101:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char102:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char103:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

jmp mainLoop
char104:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

jmp mainLoop
char105:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char106:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char107:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

jmp mainLoop
char108:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char109:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1

jmp mainLoop
char110:

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1

jmp mainLoop
char111:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1

jmp mainLoop
char112:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char113:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char114:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

jmp mainLoop
char115:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char116:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char117:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char118:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char119:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1

jmp mainLoop
char120:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char121:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1

jmp mainLoop
char122:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

jmp mainLoop
char123:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

jmp mainLoop
char124:

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

jmp mainLoop
char125:

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

jmp mainLoop
char126:

        mov eax, dword [offsetX]
        add eax, 3
        mov dword [gridX3], eax
        

        mov eax, dword [offsetX]
        add eax, 0
        mov dword [gridX0], eax
        

        mov eax, dword [offsetX]
        add eax, 2
        mov dword [gridX2], eax
        

        mov eax, dword [offsetX]
        add eax, 4
        mov dword [gridX4], eax
        

        mov eax, dword [offsetX]
        add eax, 1
        mov dword [gridX1], eax
        

    mov eax, 0xFF00FF
    mov ecx, dword [gridX3]
    mov edx, dword [gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX0]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX2]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX4]
    mov edx, dword [gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, 0xFF00FF
    mov ecx, dword [gridX1]
    mov edx, dword [gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1

jmp mainLoop
offsetX:dd 0

offsetY:dd 0

addr:dd 0

currentChar:dd 0

maxScan:dd 0

scanLength:dd 0

scanOffset:dd 0

nextSync:dd 0

gridX0:dd 0

offsetYold:dd 0

gridY0:dd 0

gridX1:dd 0

gridX2:dd 0

gridX3:dd 0

gridX4:dd 0

gridX5:dd 0

gridY1:dd 0

gridY2:dd 0

gridY3:dd 0

gridY4:dd 0

gridY5:dd 0

gridY6:dd 0

gridY7:dd 0

gridY8:dd 0
