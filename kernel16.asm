    BITS 16

    ; allocate 4KB for stack

    ; real mode memory map
    ; 0x00000500 0x00007BFF conventional memory, 29.75KiB
    ; use 4kb for allocation table

    ORG 0x7c00+512
    
    stackStart equ 0x1500
    stackSize equ 0x1000
    

    mov word [mallocRecordStart], heapStart
    mov word [mallocRecordStart+2], 4

    
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




    jmp $





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






                





            

    malloc_slot_num: dw 0
    malloc_attempt_valid: db 0
    malloc_requested_size: dw 0
    malloc_current_address: dw 0
    malloc_current_end_address: dw 0
    malloc_comparison_address: dw 0
    malloc_comparison_end_address: dw 0
    malloc_failed_no_slots db "Allocation failed: out of slots", 0
    malloc_failed_no_memory db "Allocation failed: out of memory", 0


    kernel_start_msg db "Kernel loaded!", 0
    printhex_test_msg db "hex printing test: ", 0
    arrayget_test_msg db "array get test: ", 0
    malloc_test_msg db "malloc test: ", 0
    
    
    
    times (512*4)-($-$$) db 0

    kernel32_base:
    %include kernel32_base
    
