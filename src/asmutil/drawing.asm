put_pixel: ;eax -> color, ecx = x, edx = y
pusha
    push eax
    mov ebx, dword [FRAMEBUFFER]
    mov eax, dword [FRAMEBUFFER_PITCH]
    mul edx

    push eax ;multiplication result

    mov eax, dword [FRAMEBUFFER_BPP]
    mov eax,4

    mul ecx
    mov ecx,eax
    pop edx
    add ebx, edx
    add ebx, ecx
    pop eax
    mov dword [ebx], eax
    cmp dword [DISPLAY_SCALE], 1
    jne .endplot
    add ebx,4
    mov dword [ebx], eax
    add ebx, dword [FRAMEBUFFER_PITCH]
    mov dword [ebx], eax
    sub ebx,4
    mov dword [ebx], eax
    .endplot:
popa
ret

;put_rect: ; eax -> color, ecx = x, edx = y, 







horizontal_line: ; ECX -> X, EDX -> Y, EBX -> Length, EAX -> Color
pusha
    push ebx
    push eax
    mov ebx, dword [FRAMEBUFFER]
    mov eax, dword [FRAMEBUFFER_PITCH]
    mul edx

    push eax

    mov eax, dword [FRAMEBUFFER_BPP]
    mov eax,4 ; real BPP for some reason

    mul ecx
    mov ecx,eax
    pop edx
    add ebx, edx
    add ebx, ecx
    pop eax
    pop ecx
    .hlineloop:
    mov dword [ebx], eax
    add ebx, 4 ; real BPP for some reason
    loop .hlineloop

popa
ret

global _blank_screen
_blank_screen: ; EAX -> Color
pusha
    push eax

    mov eax, dword [FRAMEBUFFER_HEIGHT]
    mul dword [FRAMEBUFFER_WIDTH]
    mov ecx, eax
    pop eax

    push edi
    mov edi, dword [FRAMEBUFFER] 
    rep stosd
    pop edi
    

popa
ret




