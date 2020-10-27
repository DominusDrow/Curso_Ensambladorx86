
section .bss

result resb 1		;reservamos un byte de espacio en memoria

section .text

	global _start

_start:

mov bx,2		;primero se pone el divisor (lo que va a dividir)
mov ax,10		;luego lo que se va a dividir 
mov dx,0		;en dx es la parte alta y donde se almacena el residuo, ponemos un 0 por si habia otro numero ahi antes
div bx			;dividimos el registro "bx" el que contiene al divisor, lo demas se toma como implicito

add ax,48		;sumamos un '0' para que nos de el caracter ascii que queremos
mov [result],ax		;movemos el resultado a nuestra variable

mov eax,4		;queremos imprimir
mov ebx,1		;va a hacer por la pantalla
mov ecx,result 	;lo qe vamos a imprimir
mov edx,1		;cuantos bytes vamos a imprimir 
int 0x80		;llamamos a la interrupcion

mov eax,1		;finalizamos el programa
mov ebx,0		;indicamos que todo salio bien
int 0x80		;llamamos a la interupcion de nuevo


