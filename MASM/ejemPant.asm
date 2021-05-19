
; Objetivo : Programa que escribe una cadena en dos posiciones específicas de la pantalla
; usando servicio 06 de int 10H para limpiar pantalla (hace scroll de las 25 lineas) y
; servicio 02 de la int 10h para colocar cursor

stacksg segment para stack 'stack'
dw 30 dup (0)
stacksg ends

datasg segment para 'data'

mens1 db 'Esto es una cadena de prueba $'

datasg ends

codesg segment para 'code'

princi proc far
assume cs:codesg, ds:datasg, ss:stacksg, es:datasg

inicio: 
push ds ; protocolo
xor ax,ax
push ax
mov ax,datasg
mov ds,ax

call limpia_pan; se limpia pantalla usando la int 10
mov dh,10 ; posición del cursor (renglón)
mov dl,25 ; columna
call coloca_cur

lea dx,mens1 ; se escribe mensaje
call escribe_cad


mov dh,12 ; posición del cursor (renglón)
mov dl,30 ; columna
call coloca_cur

lea dx,mens1 ; se escribe mensaje
call escribe_cad

ret
princi endp

;AL = Líneas de scroll (0 = Borra), BH = Atributo de las líneas en blanco
limpia_pan proc
push ax
push bx
push cx
push dx
mov cx,0 ; renglon y columna inicial
mov dx,184fh; renglon y colu8mna final
mov al,0 ; pantalla completa
mov bh,07 ; atributo
mov ah,6
int 10h
pop dx
pop cx
pop bx
pop ax

ret
limpia_pan endp
; BH = Página,
; recibe en DH y Dl las coordenadas donde colocará el cursor DH = Fila, DL = Columna
coloca_cur proc
push ax
push bx
push cx
push dx
mov bh,0 ;pagina 0
mov ah,02
int 10h
pop dx
pop cx
pop bx
pop ax
ret
coloca_cur endp
lee proc near
push bx
push cx
push dx
mov ah,1
int 21h
pop dx
pop cx
pop bx
ret
lee endp
escribe proc
push ax
push bx
push cx
push dx
mov ah,2
int 21h
pop dx
pop cx
pop bx
pop ax
ret
escribe endp
escribe_cad proc
push ax

push bx
push cx
push dx
mov ah,9
int 21h
pop dx
pop cx
pop bx
pop ax
ret
escribe_cad endp
ascii_bin proc ; recibe dato en al
cmp al,'0'
jl error
cmp al,39h
jg sigue
sub al,30h
jmp fin
sigue: cmp al,'A'
jl error
cmp al,'F'
jg sigue1
sub al,37h
jmp fin
sigue1: cmp al,'a'
jl error
cmp al,'f'
jg error
sub al,57h
jmp fin
error: mov al,0
fin: ret
ascii_bin endp
bin_ascii proc ; recibe dato en dl
cmp dl,9
jg suma37
add dl,30h
jmp fin1
suma37: add dl,37h
fin1: ret
bin_ascii endp

ali_lin proc
push dx
mov dl,0ah

call escribe
mov dl,0dh
call escribe
pop dx
ret
ali_lin endp
; recibe dato a mostrar en el registro DL
desempaqueta proc
push cx
push dx
mov ch,dl
mov cl,4
shr dl,cl
call bin_ascii
call escribe
mov dl,ch
and dl,0fh
call bin_ascii
call escribe
pop dx
pop cx
ret
desempaqueta endp
empaqueta proc
push cx
call lee
call ascii_bin
mov cl,4
shl al,cl
mov ch,al
call lee
call ascii_bin
add al,ch
pop cx
ret
empaqueta endp
lee_cad proc
push ax
push bx
push cx
push dx
mov ah,0ah
int 21h
pop dx
pop cx

pop bx
pop ax
ret
lee_cad endp

codesg ends
end inicio
end

