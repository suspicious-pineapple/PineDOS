

global memcpy
memcpy_forward:
memcpy:
mov edx, dword [esp+4] ;source
mov eax, dword [esp+8] ;dest
mov ecx, dword [esp+12] ;size
push esi ;GCC requires ESI and EDI to be preserved
push edi
mov esi, eax ;the args loaded earlier, before pushing anything
mov edi, edx
.loopcpy:
lodsb
stosb
loop .loopcpy
mov eax,edx
pop edi ; restore EDI, ESI
pop esi
ret






























