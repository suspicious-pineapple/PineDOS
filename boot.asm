	BITS 16
	ORG 0x7C00		; We are loaded by BIOS at 0x7C00
	;define location where kernel will be loaded- after this 512 byte bootloader
	;0x7c00 (origin) + 0x200 (512 bytes) = 0x7e00


	kernel_address equ 0x7c00+512
	


;origin is 0x7c00

BL_skip:
mov [BL_devicenum], dl

	
BL_start:

	;mov ax, 07C0h		; Set up 4K stack space after this bootloader
    ;07c0h * 16 = 0x7c00, bootloader starts at 0x7c00

	;add ax, 288		; (4096 + 512) / 16 bytes per paragraph,
    ; 288*16-512 = 4096    
	;mov ss, ax
	;mov sp, 4096

	;mov ax, 07C0h		; Set data segment to where we're loaded
	;mov ds, ax

	;mov ax, 0x1000
	;mov ss, ax
	;mov sp, 0xFFFF
	;mov ax, 0
	;mov ds, ax
	;mov es, ax
	



	;mov ah, 00h
	;mov al, 02h
	;call print_hex
	;jmp $


	mov si, BL_bootmsg
	call BL_print_string
	

	mov al, byte [BL_devicenum]
	call BL_print_hex



	call BL_newline

	;read 16kb worth of sectors after the bootloader
		;want the data at = 0x08E0h:0x0000
	;set ES:BX to 0x08E0h:0x0000

	mov bx, (kernel_address)
	;mov bx, loadhere
	;mov ax, 8E0h
	;mov es, ax
	
	mov ah, 02h ;read sectors
	mov al, 20h ;32 sectors
	
	mov ch, 0h ;cyliner 0
	;mov cl, 02h ;start at sector 1
	mov cl, 2 ;start at sector 1
	
	mov dh, 00h ;head 0
	mov dl, byte [BL_devicenum] ;drive 0, floppy drive
	int 13h

	mov ah, 01h
	mov dl, 00h
	;clear carry flag
	stc
	int 13h
	jnc .success
	.readError:
		mov al, ah
		call BL_print_hex
		mov si, BL_errormsg
		call BL_print_string
		inc word [BL_attempt]
		cmp word [BL_attempt], 3
		jl BL_start
		mov si, BL_resetmsg
		call BL_print_string
		mov ah, 00h
		mov dl, 00h
		int 13h
		mov al, ah
		call BL_print_hex
		mov word [BL_attempt], 0
		jmp BL_start
	.success:
	mov si, BL_successmsg
	call BL_print_string
	call BL_newline

	call BL_newline

	;jmp short (0x7c00+512+4096)
	;jmp kernel_address
	jmp BL_loadhere

	;print out the 512 bytes of data that was read, dump it to the screen using print_hex in a grid
	mov si, (kernel_address)
	mov cx, 512
	.dump:
		lodsb
		mov ah, 0Eh
		int 10h
		inc si
		loop .dump
	

	call BL_newline



	;jmp $


	BL_print_string:			; Routine: output string in SI to screen
	mov ah, 0Eh		; int 10h 'print char' function
	.repeat:
		lodsb			; Get character from string
		cmp al, 0
		je .done		; If char is zero, end of string
		int 10h			; Otherwise, print it
	jmp .repeat
	.done:
		ret


	
	BL_print_hex:
		pusha
		;check if greater than 16
		cmp al, 0Fh
		jl .lessthan
		;print letter X
		mov al, 'X'
		mov ah, 0Eh
		int 10h
		popa
		ret
		.lessthan:

		;use int 10h to print the character after converting it to ascii
		add al, 30h
		cmp al, 39h
		jle .print
		add al, 7h
		.print:
		mov ah, 0Eh
		int 10h
		popa
	
	BL_newline:
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






	;strings
	BL_bootmsg db 'trying to read drive nr:', 0

	BL_beforedump db 'dumping memory: ', 0
	BL_errormsg db ' -> drive error! retrying.. ', 0
	BL_successmsg db 'drive read successful!', 0
	BL_resetmsg db ' exceeded attempts, resetting drive, result:', 0
	


	;data
	BL_attempt dw 0
	BL_devicenum db 0












	times 510-($-$$) db 0	; Pad remainder of boot sector with 0s
	dw 0xAA55		; The standard PC boot signature
	BL_loadhere:
	
	;%include "kernel.asm"
;times (512*40)-($-$$) db 0

;times (512*512+1)-($-$$) db 0
