.model small
.data
InputString DB 'tGis iS A TEsT MESsaGE','$'
ResultString DB 23 DUP('$')
.code 
main proc far
    mov ax,@data
    mov ds,ax
    inc InputString[1]
    mov cx,22
    mov bx,0
    myloop:mov al,InputString[bx]
    cmp al,91
    jl less
    jmp if
    less:
    cmp al,65
    jl if
    add al,32 
    if:
    mov ResultString[bx],al
    add bx,1
    dec cx
    jnz myloop
    mov ax,2304
    mov dx,offset InputString
    int 33
    main endp
end main
