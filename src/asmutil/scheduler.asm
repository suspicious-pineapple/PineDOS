global switch_task
switch_task:
pusha
pushf
mov eax,cr3
push eax
mov eax, dword [44+esp]
; pusha -> 8 regs * 4 bytes = 32 bytes
; pushf -> 4 bytes = 36 bytes
;return address -> 4 bytes = 44 bytes
; args here
mov edi, dword [44+esp]
mov esi, esp
mov ecx, 11
rep movsd
;popf
;popa

mov eax, dword [48+esp]
;
mov esp, dword [eax+20] ; esp

add esp,4
push dword [eax+40] ;return addr

push dword [eax+36] ;eax
push dword [eax+32] ; ecx
push dword [eax+28] ; edx
push dword [eax+24] ; ebx
push dword [eax+20] ; esp
push dword [eax+16] ;ebp
push dword [eax+12] ;esi
push dword [eax+8] ;edi
push dword [eax+4] ; eflags
mov eax, dword [eax]
mov cr3, eax
;
popf
popa
;add esp,4 ;goodbye return pointy
;push dword []




ret

