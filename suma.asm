		
section .data

result db '0',0xa,0xd   ;creamosuna variable donde se almacenara un caracter, tambien podemos poner "48"


section .text

	global _start
_start:

mov ax,6      ; "ax" se ocupa para almacenar datos pequeños en sumas,restas etc.
mov bx,3

add ax,bx      ;la instrucion "add" sirve para sumar, el resultado lo guarda en ax por defecto
add ax,48		;tenemos que sumarle "48=0" al resultado para que nos muestre el caracter ascii que queremos

mov [result],ax		;movemos el resultado a la variable, que se pone enntre corchtes para indicar que se 
					;modificara el contenido del registro y no el registro en si

;ya tenemos la operacion, ahora nesesitamos imprimirla

mov eax,4   	;le decimos que queremos imprimir "sys.write"
mov ebx,1		;le decimos que sera por pantalla
mov ecx,result	;le pasamos lo que va a imprimir 
mov edx,1		;le indicamos cuantos caracteres tiene que imprimir

int 0x80 		;llamamos a la interrupcion para poder llamar al sistema

mov eax,1		;es como un "sys.exit"
mov ebx,0		;indica que el proceso salio bien
int 0x80		;llamamos a la interrupcion de nuevo

