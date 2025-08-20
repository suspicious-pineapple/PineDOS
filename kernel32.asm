BITS 32

INFO_COLOR equ 0xFFFFFF
ERROR_COLOR equ 0xFF0000
SUCCESS_COLOR equ 0xFF00FF



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



mov ecx, 200
mov edx, 100
mov eax, 'F'
call put_char

mov ecx, 200+8
mov eax, 'r'
call put_char
mov ecx, 200+8+8
mov eax, 'o'
call put_char
mov ecx, 200+8+8+8
mov eax, 'g'
call put_char



; Draw a triangle using the line drawing function
; Triangle vertices: (100, 50), (200, 150), (50, 150)

; Draw line from (100, 50) to (200, 150)
mov eax, 0xFF0000   ; Red color
mov ecx, (50 << 16) | 100   ; Start: y=50, x=100
mov edx, (150 << 16) | 200  ; End: y=150, x=200
call draw_line

; Draw line from (200, 150) to (50, 150)
mov eax, 0x00FF00   ; Green color
mov ecx, (150 << 16) | 200  ; Start: y=150, x=200
mov edx, (150 << 16) | 50   ; End: y=150, x=50
call draw_line

; Draw line from (50, 150) to (100, 50)
mov eax, 0x0000FF   ; Blue color
mov ecx, (150 << 16) | 50   ; Start: y=150, x=50
mov edx, (50 << 16) | 100   ; End: y=50, x=100
call draw_line

; Draw some additional test lines to verify all octants work
; Horizontal line
mov eax, 0xFFFF00   ; Yellow color
mov ecx, (200 << 16) | 50   ; Start: y=200, x=50
mov edx, (200 << 16) | 250  ; End: y=200, x=250
call draw_line

; Vertical line
mov eax, 0xFF00FF   ; Magenta color
mov ecx, (50 << 16) | 300   ; Start: y=50, x=300
mov edx, (250 << 16) | 300  ; End: y=250, x=300
call draw_line

; Diagonal line (negative slope)
mov eax, 0x00FFFF   ; Cyan color
mov ecx, (50 << 16) | 350   ; Start: y=50, x=350
mov edx, (150 << 16) | 250  ; End: y=150, x=250
call draw_line

; Steep diagonal line
mov eax, 0xFFFFFF   ; White color
mov ecx, (50 << 16) | 400   ; Start: y=50, x=400
mov edx, (200 << 16) | 420  ; End: y=200, x=420
call draw_line

; Halt the system - we're done drawing
jmp $


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


draw_line: ;eax -> color, ecx: start (x0 in lower 16, y0 in upper 16), edx: end (x1 in lower 16, y1 in upper 16)
pusha
    push eax    ; Save color

    ; Extract coordinates from packed format
    mov eax, ecx
    mov ebx, eax
    and eax, 0xFFFF     ; x0 = lower 16 bits of ecx
    shr ebx, 16         ; y0 = upper 16 bits of ecx
    
    mov ecx, edx
    mov esi, ecx
    and ecx, 0xFFFF     ; x1 = lower 16 bits of edx
    shr esi, 16         ; y1 = upper 16 bits of edx

    ; Now we have: eax=x0, ebx=y0, ecx=x1, esi=y1
    
    ; Calculate dx = abs(x1 - x0)
    mov edx, ecx
    sub edx, eax
    mov edi, edx
    sar edi, 31         ; Sign extension: 0 if positive, -1 if negative
    xor edx, edi
    sub edx, edi        ; abs(dx)
    push edx            ; Save abs(dx) on stack

    ; Calculate dy = abs(y1 - y0)
    mov edx, esi
    sub edx, ebx
    mov edi, edx
    sar edi, 31         ; Sign extension
    xor edx, edi
    sub edx, edi        ; abs(dy)
    push edx            ; Save abs(dy) on stack

    ; Calculate step directions
    mov edx, 1
    cmp ecx, eax        ; Compare x1 with x0
    jge .sx_positive
    neg edx
.sx_positive:
    push edx            ; Save sx on stack

    mov edx, 1
    cmp esi, ebx        ; Compare y1 with y0
    jge .sy_positive
    neg edx
.sy_positive:
    push edx            ; Save sy on stack

    ; Stack now contains: [color] [abs(dx)] [abs(dy)] [sx] [sy]
    ; Calculate initial error: err = dx - dy
    mov edx, [esp + 12] ; abs(dx)
    sub edx, [esp + 8]  ; abs(dy)
    push edx            ; Save err on stack

    ; Main drawing loop
.draw_loop:
    ; Draw current pixel at (eax, ebx)
    push eax
    push ebx
    push ecx
    push esi
    
    mov ecx, eax        ; x coordinate
    mov edx, ebx        ; y coordinate
    mov eax, [esp + 40] ; color (adjusted for pushes)
    call put_pixel
    
    pop esi
    pop ecx
    pop ebx
    pop eax

    ; Check if we've reached the end point
    cmp eax, ecx        ; x0 == x1?
    jne .continue_line
    cmp ebx, esi        ; y0 == y1?
    je .line_done       ; Both equal, we're done

.continue_line:
    ; Calculate e2 = 2 * err
    mov edx, [esp]      ; err
    shl edx, 1          ; e2 = 2 * err

    ; Check if e2 > -dy (move in x direction)
    mov edi, [esp + 8]  ; abs(dy)
    neg edi             ; -dy
    cmp edx, edi
    jle .check_y_move

    ; Move in x direction: err -= dy, x0 += sx
    mov edi, [esp + 8]  ; abs(dy)
    sub [esp], edi      ; err -= dy
    add eax, [esp + 4]  ; x0 += sx

.check_y_move:
    ; Check if e2 < dx (move in y direction)
    mov edi, [esp + 12] ; abs(dx)
    cmp edx, edi
    jge .draw_loop

    ; Move in y direction: err += dx, y0 += sy
    add [esp], edi      ; err += dx
    add ebx, [esp + 4]  ; y0 += sy
    jmp .draw_loop

.line_done:
    ; Clean up stack: pop err, sy, sx, abs(dy), abs(dx)
    add esp, 20
    pop eax             ; Restore color

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



MULTIBOOT_INFO_ADDR: dq 0
FRAMEBUFFER: dq 0
FRAMEBUFFER_PITCH dq 0
FRAMEBUFFER_WIDTH dq 0
FRAMEBUFFER_HEIGHT dq 0
FRAMEBUFFER_BPP dq 0
FRAMEBUFFER_TYPE dq 0

;global CONSOLE_TEXT
CONSOLE_TEXT times (40*80) db 'E'

