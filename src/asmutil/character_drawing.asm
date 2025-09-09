
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

xor ebx,ebx
mov bl, al
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

shl ebx, 2
jmp [.jmpTable + ebx]
.jmpTable:



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
dd .char32
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
.char32:

mov eax, dword [.color]

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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1

popa
ret
.char35:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY2 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY4 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char36:

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
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY1 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY5 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


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


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


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


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char43:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    

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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1

popa
ret
.char49:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX2 gridY6 4 1
    


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

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
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX2 gridY3 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char52:

        mov eax, 0
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX0], eax
        

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY4 4 1
    


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char54:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char57:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY2 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY4 4 1
    

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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX2 gridY2 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX2 gridY4 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char65:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY4 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1

popa
ret
.char69:

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

popa
ret
.char70:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX2 gridY3 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY1 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

popa
ret
.char80:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY1 4 1
    


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY3 4 1
    


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX4 gridY6 1 1

popa
ret
.char83:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


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
        

        mov eax, 2
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX2], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY0 4 1
    


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX0 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX0 gridY6 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX4 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX0 gridY6 4 1
    


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX4 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX3 gridY6 1 1


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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

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


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


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
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY0 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

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


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


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
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1

popa
ret
.char97:

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
        

        mov eax, 1
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX1], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX2 gridY3 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY2 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1

popa
ret
.char100:

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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY2 4 1
    


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char101:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY3 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1

popa
ret
.char103:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY4 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY6 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1

popa
ret
.char104:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY2 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX1 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX0 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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
        

        mov eax, 4
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX4], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY4 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1

popa
ret
.char113:

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
        

        mov eax, 3
        mov ecx, dword [.scale]
        shl eax, cl
        add eax, dword [.offsetX]
        mov dword [.gridX3], eax
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY4 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX0 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


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


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1

popa
ret
.char116:

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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY2 4 1
    


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX2 gridY1 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX4 gridY5 1 1


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
        
mov eax, dword [.color]

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY5 4 1
    


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1

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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX1 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX0 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX4 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


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


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX4 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX2 gridY5 1 1


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

    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY2 4 1
    


    mov ebx, 3
    mov cl, byte [.scale]
    shl ebx,cl
    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
    call horizontal_line
    ;draw rect gridX1 gridY5 4 1
    


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX3 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1

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


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX3 gridY0 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX1 gridY1 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX1 gridY2 1 1


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX1 gridY4 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX1 gridY5 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX2 gridY6 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX2 gridY2 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX2 gridY4 1 1


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


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY0]
    call put_pixel
    ;draw rect gridX2 gridY0 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY1]
    call put_pixel
    ;draw rect gridX3 gridY1 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY2]
    call put_pixel
    ;draw rect gridX3 gridY2 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY4]
    call put_pixel
    ;draw rect gridX3 gridY4 1 1


    mov ecx, dword [.gridX3]
    mov edx, dword [.gridY5]
    call put_pixel
    ;draw rect gridX3 gridY5 1 1


    mov ecx, dword [.gridX1]
    mov edx, dword [.gridY6]
    call put_pixel
    ;draw rect gridX1 gridY6 1 1


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


    mov ecx, dword [.gridX0]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX0 gridY3 1 1


    mov ecx, dword [.gridX2]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX2 gridY3 1 1


    mov ecx, dword [.gridX4]
    mov edx, dword [.gridY3]
    call put_pixel
    ;draw rect gridX4 gridY3 1 1


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
