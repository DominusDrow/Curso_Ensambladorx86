
.model small
.data

salto db 10,13

msg1 db "Dame N:$"

n db '  $'

.code 
inicio:

mov ax,@data
mov ds,ax

mov ah,09h
mov dx,offset msg1
int 21h

mov ah,01h
int 21h

sub al,30h
mov cl,al

mov bl,30h

mov ah,09h
mov dx,offset salto
int 21h

ciclo:
mov n,bl

mov ah,09h
mov dx,offset n
int 21h

inc bl
loop ciclo

mov ax,4c00h
int 21h
.stack

end inicio
