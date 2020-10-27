
section .data

msg1 db "es par",0xa,0xd
len1 equ $-msg1				; "equ" indica que a a ser una constante

msg2 db "es impar",0xa,0xd
len2 equ $-msg2


section .text
	global _start:
_start:				;no se te olvide por donde va a empezar!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

mov al,5
mov ah,1
and al,ah
je par

mov eax,4
mov ebx,1
mov ecx,msg2
mov edx,len2
int 0x80
jmp salir

par:
mov eax,4
mov ebx,1
mov ecx,msg1
mov edx,len1
int 0x80

salir:
mov eax,1
mov ebx,0
int 0x80