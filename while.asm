 section .bss

 result resb 1

 section .text
 	global _start
_start:

mov ax,3
mov bx,0

while:
cmp ax,0
jng salir

add bx,2
dec ax
jmp while

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



