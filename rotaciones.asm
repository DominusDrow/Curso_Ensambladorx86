
section .data
salto db 10,13

section .bss

result resb 1

section .text 
	global _start
_start:

mov bl,128		; un registro de 8 bits
rol bl,1			;hace una rotacion hacia la izq
add bl,48
mov [result],bl

mov eax,4
mov ebx,1
mov ecx,result		;no lleva corchetes!!!!!!!!!!!!!!!
mov edx,1
int 0x80

;aqui vamos a hacer imprimir el salto de linea
mov eax,4
mov ebx,1
mov ecx,salto
mov edx,1
int 0x80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


mov bl,16
ror bl,3		;rotacion hacia la derecha 
add bl,48
mov [result],bl

mov eax,4
mov ebx,1
mov ecx,result		
mov edx,1
int 0x80


mov eax,1
mov ebx,0
int 0x80


