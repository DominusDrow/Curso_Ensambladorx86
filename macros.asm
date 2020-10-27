
%macro print 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2		;y se imprime solito o que?
int 0x80
%endmacro

section .data

msg1 db "hola mundo",0xa,0xd
len1 equ $-msg1					;"equ" indica que es una constante

msg2 db "cruel",0xa,0xd
len2 equ $-msg2		

section .text
	global _start
_start:

print msg1,len1
print msg2,len2

; y como termina el programa CFACK?!!!!!!!

mov eax,1
mov ebx,0
int 0x80