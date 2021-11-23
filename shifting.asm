.model small
.stack 64
.data
x dw 100,101,102,103,104
y dw 50,50,50,51,52
size equ 5
.code 
main proc far
    mov ax,@data
    mov ds,ax
    mov ah,0
    mov al,13
    int 10h
    mov bx,0
    mov cx,size
    myloop:
    mov ah,0ch
    push cx
    mov cx,x[bx]
    mov dx,y[bx]
    int 10h
    pop cx
    add bx,2
    dec cx
    jnz myloop
    main endp
end main