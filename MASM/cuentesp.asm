;Alfredo Omar VAsquez Lopez

stacksg segment stack para 'stack' 
	dw 30 dup(0) 
stacksg ends 

datasg segment para 'data' 

msg2 db 'Espacios existentes: $'
msg3 db 'Mayusculas existentes: $'
msg4 db 'Minusculas existentes: $'
msg5 db 'Digitos numericos existentes: $'
msg6 db 'Otros digitos: $'

conta1  db  0
conta2  db  0
conta3  db  0
conta4  db  0
conta5  db  0


men1 	db 	'Proporcione la cadena (maximo 50 caracteres): $' 
cadena  db 	50 
longi	db 	0 
inicad	db 	50 dup(' ')
datasg ends 

codesg	segment para 'code'
assume cs:codesg, ds:datasg, ss:stacksg
princi	proc far
inicio:	
	push	ds	; protocolo
	xor	ax,ax
	push	ax
	mov	ax,datasg
	mov	ds,ax

 	lea 	dx,men1 ;solicita la cadena 
    call 	esc_cad 
	call 	ali_lin
	lea 	dx,cadena; lee cadena 
	call 	lee_cad 
	call 	ali_lin
 	xor	ch,ch; coloca en cx la longitud de la cadena
	mov	cl,longi
	lea	bx,inicad; BX apunta al primer carácter de la cadena
    cicloc: 
    mov	al,[bx]
	
    cmp al,20h
    jg num
    inc conta1
    jmp comp

    num:
    cmp al,30h
    jl otro
    cmp al,39h
    jg mayus 
    inc conta2
    jmp comp

    mayus:
    cmp al,41h
    jl otro
    cmp al,5ah
    jg minus 
    inc conta3
    jmp comp

    minus:
    cmp al,61h
    jl otro 
    cmp al,7ah
    jg otro
    inc conta4
    jmp comp

    otro:
     inc conta5

    comp:	
    
    inc	bx
	loop cicloc


    lea	dx,msg2; escribe mensaje de resultado
	call esc_cad
	mov	dl,conta1; escribe el valor del contador
	call	desempaqueta
	
    call ali_lin

    lea dx,msg5; escribe mensaje de resultado
    call esc_cad
    mov dl,conta2; escribe el valor del contador
    call    desempaqueta

    call ali_lin

    lea dx,msg3; escribe mensaje de resultado
    call esc_cad
    mov dl,conta3; escribe el valor del contador
    call    desempaqueta

     call ali_lin

    lea dx,msg4; escribe mensaje de resultado
    call esc_cad
    mov dl,conta4; escribe el valor del contador
    call    desempaqueta

     call ali_lin
    
    lea dx,msg6; escribe mensaje de resultado
    call esc_cad
    mov dl,conta5; escribe el valor del contador
    call    desempaqueta

    ret
princi   endp



lee     proc    near
        push    bx
        push    cx
        push    dx
        mov     ah,1
        int     21h
        pop     dx
        pop     cx
        pop     bx
        ret
lee     endp

lee_cad	proc
	push    ax
        push    bx
        push    cx
        push    dx
        mov     ah,0ah
        int     21h
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
lee_cad endp

escribe proc
        push    ax
        push    bx
        push    cx
        push    dx
        mov     ah,2
        int     21h
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
escribe endp
esc_cad proc
        push    ax
        push    bx
        push    cx
        push    dx
        mov     ah,9
        int     21h
        pop     dx
        pop     cx
        pop     bx
        pop     ax
        ret
esc_cad     endp

ascii_bin       proc ; recibe dato en al
        cmp     al,'0'
        jl      error
        cmp     al,39h
        jg      sigue
        sub     al,30h
        jmp     fin
sigue:  cmp     al,'A'
        jl      error
        cmp     al,'F'
        jg      sigue1
        sub     al,37h
        jmp     fin
sigue1: cmp     al,'a'
        jl      error
        cmp     al,'f'
        jg      error
        sub     al,57h
        jmp     fin
error:  mov     al,0
fin:    ret
ascii_bin  endp

bin_ascii    proc  ; recibe dato en dl
        cmp    dl,9
        jg      suma37
        add     dl,30h
        jmp     fin1
suma37: add     dl,37h
fin1:   ret
bin_ascii       endp


ali_lin proc
        push    dx
        mov     dl,0ah
        call    escribe
        mov     dl,0dh
        call    escribe
        pop     dx
        ret
ali_lin endp

desempaqueta   proc
        push    cx
        push    dx
        mov     ch,dl
        mov     cl,4
        shr     dl,cl
        call    bin_ascii
        call    escribe
        mov     dl,ch
        and     dl,0fh
        call    bin_ascii
        call    escribe
        pop     dx
        pop     cx
        ret
desempaqueta    endp

empaqueta       proc
        push    cx
        call    lee
        call    ascii_bin
        mov     cl,4
        shl     al,cl
        mov     ch,al
        call    lee
        call    ascii_bin
        add     al,ch
        pop     cx
        ret
empaqueta       endp

codesg  ends
        end    inicio; indica la posicion de la primera instruccion
        end


