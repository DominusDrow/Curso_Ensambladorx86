
section .data

salto db 10,23		;le asignamos un salto de liena 

section .bss
 
result resb 1

section .text
	global _start
_start:					;no se te olvide el START!!!!!!!!!!!!!!!!

mov ebx,2
shl ebx,1		;es como multiplicar por 2, desplaza una posicion hacia la izq
add ebx,48		;sumamos el '0' en ascii  SUMAMOS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
mov [result],ebx		;ponemos el resultado en nuestra variable

mov eax,4		;queremos escribirm "sys.write"
mov ebx,1		;va a ser por pantalla
mov ecx,result	;imprimiremos la variable
mov edx,1		;solo se imprimira 1 byte
int 0x80 		;llamamos a la interrupcion 


;aqui vamos a hacer imprimir el salto de linea
mov eax,4
mov ebx,1
mov ecx,salto
mov edx,1
int 0x80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

mov ax,6
mov cl,1	;"cl" es el unico registro que puede almacenar desplazamientos
shr ax,cl
add ax,48
mov [result],ax		

mov eax,4
mov ebx,1
mov ecx,result
mov edx,1
int 0x80

;aqui vamos a hacer imprimir el salto de linea
mov eax,4
mov ebx,1
mov ecx,salto
mov edx,1
int 0x80
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


mov eax,1		;cerramos el programa "sys.exit"
mov ebx,0		;todo salio bien 
int 0x80






