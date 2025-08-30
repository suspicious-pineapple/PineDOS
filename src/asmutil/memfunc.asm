

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
.loopcpy:
lodsb
stosb
loop .loopcpy
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
.loopcpy:
lodsb
stosb
loop .loopcpy
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
mov edx, dword [esp+4] ;dest
mov al, byte [esp+8] ;byte to set things to
mov ecx, dword [esp+12] ;number of bytes to set
xchg edx,esi
rep stosb ;repeat stosb ecx times
mov eax,edx
xchg edx,esi ;esi needs to be preservd
ret

































