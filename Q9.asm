.model small
.data
InputString DB 'THis iS A TEsT MESsaGE'
ResultString DB 23 DUP('$')
.code 
main proc far
    mov ax,@data
    mov ds,ax
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
    mov ah,9
    mov dx,offset ResultString
    int 21h
    main endp
end main
