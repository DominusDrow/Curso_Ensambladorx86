
;convertimos de MAyuscula a minuscula
;usamos la mascara de "32"
section .bss

result resb 1

section .text
	global _start:
_start:				;LA ETIQUETA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!			

mov al,'D'
or al,32			;o podemos escrinir "00100000b" que es en binario
mov [result],al

mov eax,4
mov ebx,1
mov ecx,result
mov edx,1
int 0x80


mov eax,1
mov ebx,0
int 0x80