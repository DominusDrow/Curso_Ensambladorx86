
segment .bss 	;es equivalente a la DIRECTIVA "section"

result resb 1

section .text
	global _start:
_start:

mov al,0
mov cl,3

for:
add al,cl
loop for

add ax,48		 ;siempre que te salga cero REVISA ESTO!!!!!!!!!!!!!!!!!!!!!!!
mov [result],al

mov eax,4
mov ebx,1
mov ecx,result
mov edx,1
int 0x80

mov eax,1
mov ebx,0
int 0x80

