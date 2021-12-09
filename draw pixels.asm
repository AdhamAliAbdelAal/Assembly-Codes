.model small
.stack 64
.data
ShapeSize EQU 5
SHapeX DW 100,101,102,103,104
ShapeY DW 50,50,50,51,52
.code
main proc far
    mov ax,@data
    mov ds,ax
    mov ah, 0
    mov al, 13h
    int 10h
    mov si,ShapeSize
    mov bx,0
    myloop:
    mov cx,SHapeX[bx]
    mov dx,ShapeY[bx]
    mov al,01fh
    mov ah,0ch
    int 10h
    add bx,2
    dec si 
    jnz myloop
    main endp
end main