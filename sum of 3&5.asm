.model small
.stack 64
.data
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov cl,0
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
    mov dl,0
    mov dh,0
    
    three:
    add dl,dh
    add dh,3
    cmp cl,dh
    jnc three
    mov dh,0
    five:
    add dl,dh
    add dh,5
    cmp cl,dh
    jnc five
    
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