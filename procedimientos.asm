
print:
mov eax,4
mov ebx,1
int 0x80
ret

section .data

msg1 db "hola mundo",0xa,0xd
len1 equ $-msg1					;"equ" indica que es una constante

msg2 db "cruel",0xa,0xd
len2 equ $-msg2		

section .text
	global _start
_start:

mov ecx,msg1
mov edx,len1
call print

mov ecx,msg2
mov edx,len2
call print

mov eax,1
mov ebx,0
int 0x80