
%macro print 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2		;y se imprime solito o que?
int 0x80
%endmacro

section .data

arreglo db '3','4','5','2','4','8'
len1 equ $-arreglo

salto db 0xa,0xd
len2 equ $-salto

section .text
	global _start
_start:
					
mov esi,arreglo
mov edi,1

ciclo:
print esi,1
print salto,len2

add esi,1
add edi,1

cmp edi,len1
jng ciclo

mov eax,1
mov ebx,0
int 0x80





