.model small
.stack 64
.data
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov cx,0
    mov ah,7
    int 21h
    sub al,30h
    mov dl,10
    mul dl
    add cl,al
    mov ah,7
    int 21h
    sub al,30h
    add cl,al
    mov ah,0
    mov al,cl
    mov cl,1
    cmp cl,al
    jc rrr
    mov bx,0
    jmp mainloop
    rrr:
    mov bx,2
    mainloop:
    mov dl,al
    dec dl
    loop2:
    push ax
    div dl
    cmp ah,0
    pop ax
    jz outt 
    dec dl
    cmp dl,1
    jnz loop2
    mov ah,0
    add bx,ax
    outt:
    dec al
    cmp al,1
    jnz mainloop
    
    mov dl,bl
    mov dh,dl
    mov ah,0
    mov al,dh
    mov cl,10
    div cl
    
    mov dl,al
    mov dh,ah
    add dl,30h
    mov ah,2
    int 21h
    
    mov dl ,dh
    add dl,30h
    mov ah,2
    int 21h
    main endp
end main