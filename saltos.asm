
section .data
msg db 10,13,"division entre 0",10,13
len equ $-msg 		;"equ" indica ue va a ser una cnstante que se determina
					;por la resta del centinela y el inicio del mensaje
section .bss
restul resb 1

section .text
	global _start
_start:

mov al, 6
mov ah,0
mov bl,0

cmp bl,0
je cero 		;haemos la comparacion

div bl
add al,48
mov [restul],al

mov eax,4
mov ebx,1
mov ecx,restul
mov edx,1
int 0x80

jmp salir

cero:
mov eax,4
mov ebx,1
mov ecx,msg
mov edx,len
int 0x80


salir:
mov eax,1
mov ebx,0
int 0x80