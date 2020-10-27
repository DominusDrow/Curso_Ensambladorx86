
section .data

msg db "Hola mundo xd !" ,0xa,0xd  ;el "10,13" en haxadecimal hace referencia a un salto de linea
len equ $-msg        ; el "$" hace referencia al centinela (que es que esta al final de cada dato o cadena)

section .text

global _start

_start:

mov eax,4     ;4 hace referencia a un "sys.write"
mov ebx,1     ;1 hace referencia a un "sys.start"
mov ecx,msg   ;pasamos en donde deve empezar a imprimir 
mov edx,len   ;le decimos hasta donde va a imprimir

int 0x80      ;estamos llamando a una interrupcion 

mov eax,1	;el 1 hace referencia a un "sys.exit"	
int 0x80	;le pasoamos la misma interrupcion (significa que termino exitosamente)	 
