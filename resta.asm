
section .bss		;es la seccion para reservar memria

restl resb 1		;estamos reservando espacio en la memoria para un byte

section .text
	global _start
_start:

mov ax,7		;hacemos la resta
mov bx,5
sub ax,bx

add ax,48 		;le asignamos un '0' para que nos muestre el caracter ascii correspondiente
mov [restl],ax	;movemos el resultado a la variable que creamos
				;entre corchetes por que querremos modificar lo que HAY dentro del registro y no el registro

mov eax,4		;le decimos que queremos escribir "sys.write"
mov ebx,1		;le decimos que va a ser por pantalla
mov ecx,restl 	;le pasamos lo que queremos imprimir 
mov edx,1		;le decimos cuantos bytes queremos imprimir 

int 0x80		;llamamos a la interrupcion 

mov eax,1		;le decimos que finalice "sys.exit"
mov ebx,0		;que todo salio bien
int 0x80 		;llamamos de nuevo a la interrupcion

