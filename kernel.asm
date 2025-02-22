    ; real mode memory map
    ; 0x00000500 0x00007BFF conventional memory, 29.75KiB
    ; use 4kb for allocation table
    mallocRecordStart equ 0x500
    mallocRecordSize equ 0x800

    stackStart equ 0x1500
    stackSize equ 0x1000
    
    heapStart equ 0x2500
    heapSize equ 0x4000
    ;0x7BFF limit for now

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


    array_get: ;DI = pointer to array, BX = array index, returns value in AX
        push bx
        shl bx, 1 ;16 bit words
        add bx, di
        mov ax, word [bx]
        pop bx
    ret


    test_arr:
        dw 0x69
        dw 0x420
        dw 0x123
        dw 0x0
        dw 0x99







    test_malloc:
        mov si, string_before_malloc1
        call print_string

        mov ax, 20
        call malloc
        call print_hex
        call newline

        mov [pointer_1], bx 

        mov si, test_string
        .copyLoop:
            lodsb
            mov [bx], al
            inc bx
            cmp al, 0
        jne .copyLoop

        call newline
        mov si, string_before_malloc2
        call print_string

        mov ax, 20
        call malloc
        call print_hex
        call newline
        mov [pointer_2], bx
        mov si, test_string_2
        .copyLoop2:
            lodsb
            mov [bx], al
            inc bx
            cmp al, 0
        jne .copyLoop2

    ret

    
    pointer_1 dw 0
    pointer_2 dw 0
    test_string: db "meow uwu", 0
    test_string_2: db "*licks u* owo", 0
    string_before_malloc1: db "malloc 1: ", 0
    string_before_malloc2: db "malloc 2: ", 0

    test_malloc_overflow:
        mov cx, 0
        .loop:
            inc cx
            mov ax, 0x100
            call malloc
            mov si, malloc_overflow_loop_message
            call print_string
            mov ax, cx
            call print_hex
            mov si, malloc_address_message
            call print_string
            mov ax, bx
            call print_hex 
            call newline
        jmp .loop



    malloc_overflow_loop_message db "attempt nr: ", 0
    malloc_address_message db " address: ", 0
    

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
        












    ;malloc:
    ;	pusha
    ;    mov word [malloc_requested_size], ax ;requested block size is in AX
    ;    mov cx, mallocRecordSize ;number of slots
    ;    shr cx, 2 ;4 bytes per entry, 2 words: 1 for address, 1 for size        
    ;    mov word [malloc_slot_num], 0
    ;    .find_slot_loop:
            




    malloc: ;ax = size, returns bx = address
        pusha
        mov word [malloc_requested_size], ax ;requested block size is in AX
        mov cx, mallocRecordSize ;number of slots
        shr cx, 2 ;4 bytes per entry, 2 words: 1 for address, 1 for size

        ;mov df, 0
        mov si, mallocRecordStart
        .repeat_find_slot:
            lodsw
            cmp ax, 0
            je .found
            inc si ;skip size
            inc si ;twice because 2 bytes per word
            
        loop .repeat_find_slot

        jmp .notfound
        .notfound:
            mov si, malloc_failed_no_slots
            call print_string
            jmp $
        .found:
            mov word [malloc_slot_num], si
            mov word [malloc_current_address], heapStart

            mov ax, word [malloc_current_address]
            add ax, word [malloc_requested_size]
            mov [malloc_current_end_address], ax


            .check_if_valid:
            mov cx, mallocRecordSize
            shr cx, 2 ; number of entries is size/4
            .repeat_check_valid:
                mov bx, (mallocRecordSize/4)
                ;mov bx, cx
                sub bx, cx
                shl bx, 2 ;bx = cx * 4, base address of the entry
                add bx, mallocRecordStart
                mov ax, [bx]
                cmp ax,0
                jnz .nonzero

            loop .repeat_check_valid ;zero check

                ;mov ax, heapStart
                
                mov word [malloc_current_address], heapStart
                
                jmp .valid

                .nonzero:
                call print_hex

                mov [malloc_comparison_address], ax
                add ax, [mallocRecordStart+bx+2]
                mov [malloc_comparison_end_address], ax

                ;only check if our base address is less than the entry's base address
                cmp word [malloc_current_address], ax
                jle .baseLower

                ;check if base address is less than current end address
                cmp ax, word [malloc_current_end_address]
                jge .notvalid
                
                .baseLower:
                ;check if current address is less than comparison end address
                mov ax, [malloc_current_address]
                cmp ax, word [malloc_comparison_end_address]
                jbe .notvalid                
                jmp .valid

                .notvalid:
                mov ax, [malloc_comparison_end_address]
                inc ax
                mov [malloc_current_address], ax

                cmp ax, heapStart+heapSize
                jb .check_if_valid
                mov si, malloc_failed_no_memory
                call print_string
                jmp $

             .valid:
                mov si, [malloc_slot_num]

                mov ax, [malloc_current_address]
                mov [mallocRecordStart+si], ax
                add ax, [malloc_requested_size]
                mov [mallocRecordStart+si+2], ax
            popa
        mov bx, [malloc_current_address]
    ret
    
    malloc_get_size: ;bx = address, returns ax = size
        pusha
        
        mov cx, mallocRecordSize
        shr cx, 2 ;4 bytes per entry, 2 words: 1 for address, 1 for size
        .repeat_find_slot:
            lodsw
            cmp ax, bx
            je .found
            inc si ;skip size
            inc si ;twice because 2 bytes per word
        loop .repeat_find_slot
            .found:
            lodsw
            mov [malloc_requested_size], ax
            popa
            mov ax, [malloc_requested_size]
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

    
times (512*8)-($-$$) db 0