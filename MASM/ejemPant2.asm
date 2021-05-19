
; Objetivo : programa que lee carácter usando int 16h
; y lo escribe 10 veces en la línea siguiente

stacksg segment para stack 'stack'
dw 30 dup (0)
stacksg ends

datasg segment para 'data'
mens1 db 'Proporcione caracter: $'
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


call limpia_pan
mov dh,10 ; posición del cursor (renglón)
mov dl,25 ; columna
call coloca_cur

lea dx,mens1 ; se escribe mensaje
call escribe_cad

call lee16_0 ; se lee carácter y queda en AL
call esc_10_2 ; el carácter a escribir esta en AL

mov dh,11
mov dl,25
call coloca_cur

mov cx,10 ; se escribirá 10 veces el carácter leído, que esta en AL
mov bl,37 ;fondo (011) frente (111)
call esc_10_1


ret
princi endp

;AL = Líneas de scroll (0 = Borra), BH = Atributo de las líneas en blanco
limpia_pan proc
push ax
push bx
push cx
push dx
mov cx,0 ; renglón y columna inicial
mov dx,184fh; renglón y colu8mna final
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
mov bh,0 ;página 0
mov ah,02
int 10h
pop dx
pop cx
pop bx
pop ax
ret
coloca_cur endp

;AL = Caracter, BH = Número de Página,
;BL = atributo, CX = Número de veces para escribir el carácter
esc_10_1 proc
push ax
push bx
push cx
push dx
MOV BH,0
mov ah,9
int 10H
pop dx

pop cx
pop bx
pop ax
ret
esc_10_1 endp
;AL = Caracter, BH = Número de Página,
;CX = Número de veces para escribir el carácter
esc_10_2 proc
push ax
push bx
push cx
push dx
MOV BH,0
mov cx,1
mov ah,0ah
int 10H
pop dx
pop cx
pop bx
pop ax
ret
esc_10_2 endp
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
lee16_0 proc near
push bx
push cx
push dx
mov ah,0
int 16h
pop dx
pop cx
pop bx
ret
lee16_0 endp

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