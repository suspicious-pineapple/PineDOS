

global memcpy
memcpy:
mov edx, dword [esp+4] ;dest
mov eax, dword [esp+8] ;source
mov ecx, dword [esp+12] ;size

push esi ;GCC requires ESI and EDI to be preserved
push edi
memcpy_forward:
mov esi, eax ;the args loaded earlier, before pushing anything
mov edi, edx
;.loopcpy:
;lodsb
;stosb
rep movsb
;loop .loopcpy
mov eax,edx ;return value is dest
pop edi ; restore EDI, ESI
pop esi
ret

memcpy_backward:
mov esi, eax ;the args loaded earlier, before pushing anything
add esi, ecx
mov edi, edx
add edi,ecx
dec esi
dec edi

std ;set direction flag
rep movsb
mov eax,edx; return value is dest
pop edi ; restore EDI, ESI
pop esi
cld
ret

global memmove
memmove:
mov edx, dword [esp+4] ;dest
mov eax, dword [esp+8] ;source
mov ecx, dword [esp+12] ;size
push esi ;GCC requires ESI and EDI to be preserved
push edi
cmp edx, eax
jge memcpy_backward


jmp memcpy_forward



global memset
memset:
pusha
mov edx, dword [esp+4+16] ;dest
mov al, byte [esp+8+16] ;byte to set things to
mov ecx, dword [esp+12+16] ;number of bytes to set
xchg edx,esi
rep stosb ;repeat stosb ecx times
mov eax,edx

popa

ret





global memcpy_4byte
memcpy_4byte:
mov edx, dword [esp+4] ;dest
mov eax, dword [esp+8] ;source
mov ecx, dword [esp+12] ;size
shr ecx,2
push esi ;GCC requires ESI and EDI to be preserved
push edi

mov esi, eax ;the args loaded earlier, before pushing anything
mov edi, edx
;.loopcpy:
;lodsb
;stosb
rep movsd
;loop .loopcpy
mov eax,edx ;return value is dest
pop edi ; restore EDI, ESI
pop esi
ret



global load_cr3
load_cr3:
mov eax, dword [esp+4]
mov cr3, eax
ret

global enable_paging
enable_paging:
pusha
mov eax,cr0
or eax, 0x80000000 ; set bit 31
mov cr0,eax
popa
ret
























