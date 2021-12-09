.model small
.stack 64
.data
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov dl,'0'
    display:
    mov ah,2
    int 21h
    mov ah,1
    int 16h
    jnz up
    jmp display
    up:
    cmp ah,72
    jnz down
    mov dl,'1'
    mov ah,0
    int 16h
    jmp display
    
    down:
    cmp ah,80
    jnz right
    mov dl,'0'
    mov ah,0
    int 16h
    jmp display
    
    right:
    cmp ah,77
    jz exit
    mov ah,0
    int 16h
    jmp display
    exit:
    main endp
end main