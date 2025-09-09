global switch_task
switch_task:

pusha
pushf

mov eax, dword [40+esp]
; pusha -> 8 regs * 4 bytes = 32 bytes
; pushf -> 4 bytes = 36 bytes
;return address -> 4 bytes = 44 bytes
; args here
mov edi, dword [40+esp]
mov esi, esp
mov ecx, 10
rep movsd
popf
popa

;mov eax, dword [40+esp]
;
push dword [eax+32] ;eax
push dword [eax+28] ; ecx
push dword [eax+24] ; edx
push dword [eax+20] ; ebx
push dword [eax+16] ; esp
push dword [eax+12] ;ebp
push dword [eax+8] ;esi
push dword [eax+4] ;edi
push dword [eax] ; eflags
;
popf
popa
;mov esp, dword [eax+16] ; esp





ret


;    uint32_t eflags;
;    uint32_t edi;
;    uint32_t esi;
;    uint32_t ebp;
;    uint32_t esp;
;    uint32_t ebx;
;    uint32_t edx;
;    uint32_t ecx;
;    uint32_t eax;
;    uint32_t eip;
;