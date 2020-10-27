
section .bss

result resb 1

section .text
	global _start
_start:

mov ax,5

cmp ax,4
jne else

mov bx,1
jmp salir

else:
mov bx,0

salir:
add bx,48
mov [result],bx

mov eax,4
mov ebx,1
mov ecx,result
mov edx,1
int 0x80

mov eax,1
mov ebx,0
int 0x80

