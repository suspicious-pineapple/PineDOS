    BITS 16

    ; allocate 4KB for stack

    ; real mode memory map
    ; 0x00000500 0x00007BFF conventional memory, 29.75KiB
    ; use 4kb for allocation table

    ORG 0x7c00+512
    
    stackStart equ 0x1500
    stackSize equ 0x1000
    


    
    mov ax, stackStart
    shr ax, 4
    mov ss, ax
    mov sp, stackSize

    ; 0x00007E00 	0x0007FFFF 	Conventional memory 480.5 KiB

    ; 0x000A0000 	0x000BFFFF video memory
    ; video memory segment: 0xA000







    call newline
    ;jmp skiptest
    mov si, kernel_start_msg
    call print_string
    call newline
    mov si, printhex_test_msg
    call print_string
    call newline
    mov ax, 0x1234
    call print_hex
    call newline
    mov ax, 0xABCD
    call print_hex
    call newline

    skiptest:

    ;call test_malloc
    
    ;mov si, [pointer_1]
    ;mov si, test_string
    ;call print_string
    ;call newline

    ;mov si, test_string_2
    ;mov si, [pointer_2]
    ;call print_string
    ;call newline
    
    
    ;call test_malloc_overflow




    mov di, test_arr
    mov bx, 0
    call array_get
    call print_hex
    call newline

    mov bx, 1
    call array_get
    call print_hex
    call newline

    mov bx, 4
    call array_get
    call print_hex
    call newline

    mov si, successful_print_test_msg
    call print_string

    
    ;mov ah, 00h
    ;mov al, 37h
    ;int 10h
    ;xor ah,ah
    ;call print_hex

    call newline
    mov si, graphicsmode_get_msg
    call print_string
    mov ah, 0Fh
    int 10h
    mov dl, ah
    xor ah,ah
    call print_hex
    call newline
    mov al, dl
    call print_hex




    ;mov si, graphicsmode_set_msg
    ;call print_string
    mov ax, 0040h
    mov es,ax
    xor ah,ah
    call newline
    mov al, es:[0084h]
    call print_hex
    call newline
    mov al, es:[004ah]
    call print_hex
    call newline
    
    mov al, 1
    mov bh, 07h
    mov dx,0

    mov ch, es:[0084h]
    sub ch,1
    mov cl, es:[004ah]
    sub cl,1
    mov ah, 06h
    int 10h

    mov ah, 0Eh
    mov al, 'F'
    int 10h
    jmp $



    jmp enable_pmode





    test_arr:
        dw 0x69
        dw 0x420
        dw 0x123
        dw 0x0
        dw 0x99


    

    newline:
		pusha
		mov ah, 03h
		mov bh, 0
		int 10h
		inc dh
		mov dl, 0
		mov ah, 02h
		int 10h
		popa
	ret

	print_string:			; Routine: output string in SI to screen
    pusha
    mov ah, 0Eh		; int 10h 'print char' function
	.repeat:
		lodsb			; Get character from string
		cmp al, 0
		je .done		; If char is zero, end of string
		int 10h			; Otherwise, print it
	jmp .repeat
	.done:
        popa
	ret

    print_hex:
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
            mov ah, 0Eh
            int 10h
        ret
        


    array_get: ;DI = pointer to array, BX = array index, returns value in AX
        push bx
        shl bx, 1 ;16 bit words
        add bx, di
        mov ax, word [bx]
        pop bx
    ret


    print_array: ; DI = pointer to array, CX = array size
        pusha
        mov bx, 0
        .loop_printArr
        
    
    popa
    ret






                





            


    kernel_start_msg db "Stage 2 bootloader loaded!", 0
    printhex_test_msg db "hex printing test: ", 0
    arrayget_test_msg db "array get test: ", 0
    successful_print_test_msg db "you should see the following numbers: 0x1234, 0xABCD, 0x69, 0x420, 0x99", 0
    graphicsmode_set_msg db "setting graphics mode. goodbye!", 0
    graphicsmode_get_msg db "current video mode:", 0
    
    
    
    ; stolen from http://www.osdever.net/tutorials/view/the-world-of-protected-mode?the_id=18
    gdt:
        gdt_null:
            dq 0
        gdt_code:
            dw 0ffffh
            dw 0
            db 0
            db 10011010b
            db 11001111b
            db 0
        gdt_data:
            dw 0FFFFh
            dw 0
            db 0
            db 10010010b
            db 11001111b
            db 0
    gdt_end
    gdt_desc:
   db gdt_end - gdt
   dw gdt


    enable_pmode:


    cli
    
    xor ax, ax
    mov ds, ax

    lgdt [gdt_desc]
    mov eax, cr0
    or eax, $1
    mov cr0, eax
    
    ;jmp 08h:clear_pipe

    BITS 32
    clear_pipe:
    

    mov ax, 08h
    mov ds, ax
    ;mov ss, ax
    ;jmp $
    ;mov esp, 090000h
    mov byte [0a8000h], 'P'
    mov byte [0a8001h], 1Bh




    .hang:
    jmp .hang

    times (512*4)-($-$$) db 0

    kernel32_base:
    

    ;%include kernel32_base