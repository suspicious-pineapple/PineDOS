
put_char:

pusha
mov dword [.offsetX], ecx
mov dword [.offsetY], edx
mov byte [.currentChar], al

mov dword [.offsetYold], 0


cmp byte [.currentChar], 32
jg .above32
popa
ret
.above32:
;op add offsetX offsetX 6
add dword [.offsetX], 6


shr eax,8
mov [.color],eax


mov eax,dword [.offsetY]
mov dword [.offsetYold], eax
mov eax,0
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY0], eax
mov eax,1
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY1], eax
mov eax,2
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY2], eax
mov eax,3
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY3], eax
mov eax,4
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY4], eax
mov eax,5
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY5], eax
mov eax,6
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY6], eax
mov eax,7
mov ecx, dword [.scale]
shl eax,cl
add eax,dword [.offsetY]
mov dword [.gridY7], eax
.ySetupDone:


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
cmp dword [.currentChar], 32
je .char32
cmp dword [.currentChar], 33
je .char33
cmp dword [.currentChar], 34
je .char34
cmp dword [.currentChar], 35
je .char35
cmp dword [.currentChar], 36
je .char36
cmp dword [.currentChar], 37
je .char37
cmp dword [.currentChar], 38
je .char38
cmp dword [.currentChar], 39
je .char39
cmp dword [.currentChar], 40
je .char40
cmp dword [.currentChar], 41
je .char41
cmp dword [.currentChar], 42
je .char42
cmp dword [.currentChar], 43
je .char43
cmp dword [.currentChar], 44
je .char44
cmp dword [.currentChar], 45
je .char45
cmp dword [.currentChar], 46
je .char46
cmp dword [.currentChar], 47
je .char47
cmp dword [.currentChar], 48
je .char48
cmp dword [.currentChar], 49
je .char49
cmp dword [.currentChar], 50
je .char50
cmp dword [.currentChar], 51
je .char51
cmp dword [.currentChar], 52
je .char52
cmp dword [.currentChar], 53
je .char53
cmp dword [.currentChar], 54
je .char54
cmp dword [.currentChar], 55
je .char55
cmp dword [.currentChar], 56
je .char56
cmp dword [.currentChar], 57
je .char57
cmp dword [.currentChar], 58
je .char58
cmp dword [.currentChar], 59
je .char59
cmp dword [.currentChar], 60
je .char60
cmp dword [.currentChar], 61
je .char61
cmp dword [.currentChar], 62
je .char62
cmp dword [.currentChar], 63
je .char63
cmp dword [.currentChar], 64
je .char64
cmp dword [.currentChar], 65
je .char65
cmp dword [.currentChar], 66
je .char66
cmp dword [.currentChar], 67
je .char67
cmp dword [.currentChar], 68
je .char68
cmp dword [.currentChar], 69
je .char69
cmp dword [.currentChar], 70
je .char70
cmp dword [.currentChar], 71
je .char71
cmp dword [.currentChar], 72
je .char72
cmp dword [.currentChar], 73
je .char73
cmp dword [.currentChar], 74
je .char74
cmp dword [.currentChar], 75
je .char75
cmp dword [.currentChar], 76
je .char76
cmp dword [.currentChar], 77
je .char77
cmp dword [.currentChar], 78
je .char78
cmp dword [.currentChar], 79
je .char79
cmp dword [.currentChar], 80
je .char80
cmp dword [.currentChar], 81
je .char81
cmp dword [.currentChar], 82
je .char82
cmp dword [.currentChar], 83
je .char83
cmp dword [.currentChar], 84
je .char84
cmp dword [.currentChar], 85
je .char85
cmp dword [.currentChar], 86
je .char86
cmp dword [.currentChar], 87
je .char87
cmp dword [.currentChar], 88
je .char88
cmp dword [.currentChar], 89
je .char89
cmp dword [.currentChar], 90
je .char90
cmp dword [.currentChar], 91
je .char91
cmp dword [.currentChar], 92
je .char92
cmp dword [.currentChar], 93
je .char93
cmp dword [.currentChar], 94
je .char94
cmp dword [.currentChar], 95
je .char95
cmp dword [.currentChar], 96
je .char96
cmp dword [.currentChar], 97
je .char97
cmp dword [.currentChar], 98
je .char98
cmp dword [.currentChar], 99
je .char99
cmp dword [.currentChar], 100
je .char100
cmp dword [.currentChar], 101
je .char101
cmp dword [.currentChar], 102
je .char102
cmp dword [.currentChar], 103
je .char103
cmp dword [.currentChar], 104
je .char104
cmp dword [.currentChar], 105
je .char105
cmp dword [.currentChar], 106
je .char106
cmp dword [.currentChar], 107
je .char107
cmp dword [.currentChar], 108
je .char108
cmp dword [.currentChar], 109
je .char109
cmp dword [.currentChar], 110
je .char110
cmp dword [.currentChar], 111
je .char111
cmp dword [.currentChar], 112
je .char112
cmp dword [.currentChar], 113
je .char113
cmp dword [.currentChar], 114
je .char114
cmp dword [.currentChar], 115
je .char115
cmp dword [.currentChar], 116
je .char116
cmp dword [.currentChar], 117
je .char117
cmp dword [.currentChar], 118
je .char118
cmp dword [.currentChar], 119
je .char119
cmp dword [.currentChar], 120
je .char120
cmp dword [.currentChar], 121
je .char121
cmp dword [.currentChar], 122
je .char122
cmp dword [.currentChar], 123
je .char123
cmp dword [.currentChar], 124
je .char124
cmp dword [.currentChar], 125
je .char125
cmp dword [.currentChar], 126
je .char126
.char32:


popa
ret
.char33:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char34:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1

popa
ret
.char35:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char36:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char37:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

popa
ret
.char38:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char39:

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1

popa
ret
.char40:

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char41:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

popa
ret
.char42:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char43:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char44:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

popa
ret
.char45:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1

popa
ret
.char46:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char47:

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1

popa
ret
.char48:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char49:

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char50:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char51:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char52:

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char53:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char54:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char55:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char56:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char57:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char58:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char59:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char60:

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char61:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

popa
ret
.char62:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

popa
ret
.char63:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char64:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char65:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char66:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char67:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char68:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char69:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char70:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

popa
ret
.char71:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char72:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char73:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char74:

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char75:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char76:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char77:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char78:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char79:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char80:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

popa
ret
.char81:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char82:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char83:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char84:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char85:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char86:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char87:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char88:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char89:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char90:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX0 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char91:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char92:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char93:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char94:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1

popa
ret
.char95:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char96:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1

popa
ret
.char97:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char98:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char99:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char100:

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char101:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char102:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

popa
ret
.char103:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char104:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

popa
ret
.char105:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char106:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

popa
ret
.char107:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

popa
ret
.char108:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char109:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

popa
ret
.char110:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

popa
ret
.char111:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char112:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

popa
ret
.char113:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char114:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

popa
ret
.char115:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char116:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char117:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char118:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char119:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char120:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char121:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

popa
ret
.char122:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char123:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char124:

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char125:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char126:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        

    mov eax, dword [.color]
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov eax, dword [.color]
    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

popa
ret
.offsetX:dd 0

.offsetY:dd 0

.scale:dd 0

.addr:dd 0

.currentChar:dd 0

.color:dd 0

.maxScan:dd 0

.scanLength:dd 0

.scanOffset:dd 0

.nextSync:dd 0

.gridX0:dd 0

.offsetYold:dd 0

.gridY0:dd 0

.gridX1:dd 0

.gridX2:dd 0

.gridX3:dd 0

.gridX4:dd 0

.gridX5:dd 0

.gridY1:dd 0

.gridY2:dd 0

.gridY3:dd 0

.gridY4:dd 0

.gridY5:dd 0

.gridY6:dd 0

.gridY7:dd 0

.gridY8:dd 0
.charJumpTable:
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char33
dd .char34
dd .char35
dd .char36
dd .char37
dd .char38
dd .char39
dd .char40
dd .char41
dd .char42
dd .char43
dd .char44
dd .char45
dd .char46
dd .char47
dd .char48
dd .char49
dd .char50
dd .char51
dd .char52
dd .char53
dd .char54
dd .char55
dd .char56
dd .char57
dd .char58
dd .char59
dd .char60
dd .char61
dd .char62
dd .char63
dd .char64
dd .char65
dd .char66
dd .char67
dd .char68
dd .char69
dd .char70
dd .char71
dd .char72
dd .char73
dd .char74
dd .char75
dd .char76
dd .char77
dd .char78
dd .char79
dd .char80
dd .char81
dd .char82
dd .char83
dd .char84
dd .char85
dd .char86
dd .char87
dd .char88
dd .char89
dd .char90
dd .char91
dd .char92
dd .char93
dd .char94
dd .char95
dd .char96
dd .char97
dd .char98
dd .char99
dd .char100
dd .char101
dd .char102
dd .char103
dd .char104
dd .char105
dd .char106
dd .char107
dd .char108
dd .char109
dd .char110
dd .char111
dd .char112
dd .char113
dd .char114
dd .char115
dd .char116
dd .char117
dd .char118
dd .char119
dd .char120
dd .char121
dd .char122
dd .char123
dd .char124
dd .char125
dd .char126
