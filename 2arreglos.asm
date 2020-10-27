%macro print 2
mov eax,4
mov ebx,1
mov ecx,%1
mov edx,%2
int 0x80
%endmacro

%macro read 2
mov eax,3		;quiero leer
mov ebx,0		;va a ser por teclado
mov ecx,%1		;en donde lo voy a almacenar
mov edx,%2		;cuanto voy a leer
int 0x80		
%endmacro

section .data

cad db '0','0','0','0','0','0','0'
len1 equ $-cad

space db 0xa,0xd
len2 equ $-space

section .text
	global _start
_start:

mov esi,cad
mov sp,0

lee:
read esi,1
inc sp
inc esi
cmp sp,len1
jl lee

mov esi,cad
mov sp,0

imprime:
print esi,1
print space,2
inc sp
inc esi
cmp sp,len1
jl imprime	

mov eax,1
mov ebx,0
int 0x80







