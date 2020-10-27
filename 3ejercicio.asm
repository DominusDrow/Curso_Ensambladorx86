%macro print 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 0x80
%endmacro

section .datao

arreglo db '1','9','3','3','2','8','2'
len equ $-arreglo

salto db 0xa,0xd
len2 equ $-salto

section .bss

aux resb 1 

section .text
	global _start
_start:

mov bp,0	
mov esi,arreglo 		;tiene que moverse a un registro de 32 bits

recorre:
mov sp,[esi]
mov [aux],sp
inc esi
inc bp					;tienes que aumentar el contador retrasado !!!!!!1

print aux,1
print salto,len2

cmp bp,len				;si crack, vas a comparar AL !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
jne recorre	

mov eax,1
mov ebx,0
int 0x80
