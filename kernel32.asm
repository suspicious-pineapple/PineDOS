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
    push eax            ; Save color

    mov ebx, dword [FRAMEBUFFER]
    mov eax, dword [FRAMEBUFFER_PITCH]
    mul edx

    push eax

    mov eax, 4          ; 4 bytes per pixel
    mul ecx
    mov ecx, eax
    pop edx
    add ebx, edx
    add ebx, ecx
    pop eax             ; Restore color
    mov dword [ebx], eax

popa
ret


draw_line: ;eax -> color, ecx: start (x0 in lower 16, y0 in upper 16), edx: end (x1 in lower 16, y1 in upper 16)
pusha
    ; Save color on stack
    push eax

    ; Extract coordinates from packed format
    ; x0 = ecx & 0xFFFF, y0 = ecx >> 16
    ; x1 = edx & 0xFFFF, y1 = edx >> 16
    
    ; Extract start coordinates
    movzx eax, cx       ; x0 = lower 16 bits of ecx  
    shr ecx, 16         ; y0 = upper 16 bits of ecx
    
    ; Extract end coordinates  
    movzx ebx, dx       ; x1 = lower 16 bits of edx
    shr edx, 16         ; y1 = upper 16 bits of edx

    ; Now we have: eax=x0, ecx=y0, ebx=x1, edx=y1
    
    ; Calculate dx = abs(x1 - x0)
    mov esi, ebx
    sub esi, eax        ; dx = x1 - x0
    mov edi, esi
    sar edi, 31         ; Sign extension
    xor esi, edi
    sub esi, edi        ; abs(dx) in esi

    ; Calculate dy = abs(y1 - y0) 
    push ebx            ; Save x1
    mov ebx, edx
    sub ebx, ecx        ; dy = y1 - y0
    mov edi, ebx
    sar edi, 31         ; Sign extension
    xor ebx, edi
    sub ebx, edi        ; abs(dy) in ebx
    pop edi             ; Restore x1 to edi

    ; Calculate step directions
    push esi            ; Save abs(dx)
    push ebx            ; Save abs(dy)
    
    mov esi, 1          ; sx = 1
    cmp edi, eax        ; Compare x1 with x0
    jge .sx_done
    neg esi             ; sx = -1
.sx_done:
    push esi            ; Save sx

    mov esi, 1          ; sy = 1
    cmp edx, ecx        ; Compare y1 with y0
    jge .sy_done
    neg esi             ; sy = -1
.sy_done:
    push esi            ; Save sy

    ; Calculate initial error: err = dx - dy
    mov esi, [esp + 12] ; abs(dx)
    sub esi, [esp + 8]  ; err = dx - dy
    push esi            ; Save err

    ; Stack: [color] [abs(dx)] [abs(dy)] [sx] [sy] [err]
    ; Main drawing loop
.draw_loop:
    ; Draw current pixel at (eax, ecx)
    push eax
    push ecx
    push edx
    push edi
    
    ; Set up put_pixel parameters: eax=color, ecx=x, edx=y
    mov edx, ecx        ; y coordinate
    mov ecx, eax        ; x coordinate  
    mov eax, [esp + 36] ; color (adjusted for all pushes)
    call put_pixel
    
    pop edi
    pop edx
    pop ecx
    pop eax

    ; Check if we've reached the end point
    cmp eax, edi        ; x0 == x1?
    jne .continue_line
    cmp ecx, edx        ; y0 == y1?
    je .line_done       ; Both equal, we're done

.continue_line:
    ; Calculate e2 = 2 * err
    mov esi, [esp]      ; err
    shl esi, 1          ; e2 = 2 * err

    ; Check if e2 > -dy (move in x direction)
    mov ebx, [esp + 8]  ; abs(dy)
    neg ebx             ; -dy
    cmp esi, ebx
    jle .check_y_move

    ; Move in x direction: err -= dy, x0 += sx
    mov ebx, [esp + 8]  ; abs(dy)
    sub [esp], ebx      ; err -= dy
    add eax, [esp + 4]  ; x0 += sx

.check_y_move:
    ; Check if e2 < dx (move in y direction)
    mov ebx, [esp + 12] ; abs(dx)
    cmp esi, ebx
    jge .draw_loop

    ; Move in y direction: err += dx, y0 += sy
    add [esp], ebx      ; err += dx
    add ecx, [esp + 4]  ; y0 += sy
    jmp .draw_loop

.line_done:
    ; Clean up stack: pop err, sy, sx, abs(dy), abs(dx), color
    add esp, 24

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

