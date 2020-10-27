
section .data
salto db 10,13

section .bss

i resb 1
r resb 1

section .text
	global _start
_start:
mov ch,0
mov ah,3
mov al,2

ciclo:
cmp ah,al
jl termina
sub ah,al
inc ch
jmp ciclo

termina:
add ch,48
add ah,48
mov [i],ch
mov [r],ah

;aqui terminamos el ejercicio

mov eax,4
mov ebx,1
mov ecx,i
mov edx,1
int 0x80

;aqui vamos a hacer imprimir el salto de linea
mov eax,4
mov ebx,1
mov ecx,salto
mov edx,1 
int 0x80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov eax,4
mov ebx,1
mov ecx,r
mov edx,1
int 0x80

;aqui vamos a hacer imprimir el salto de linea
mov eax,4
mov ebx,1
mov ecx,salto
mov edx,1
int 0x80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov eax,1
mov ebx,0
int 0x80
