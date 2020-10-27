section .bss
aux resb 1

section .text
	global _start
_start:
mov ah,4
mov al,2 
mov bl,0

ciclo:
cmp ah,1
jl termina
add bl,al
sub ah,1
jmp ciclo

termina:
add bl,48
mov [aux],bl
;aqui terminamos el ejercicio

mov eax,4
mov ebx,1
mov ecx,aux
mov edx,1
int 0x80

mov eax,1
mov ebx,0
int 0x80
