.model small
.data
set db 81, 65, 77, 82, 73,55, 88, 78, 51, 91, 86, 76
.code 
main proc far
    mov ax,@data
    mov ds,ax
    mov bx,0
    mov al,0
    mov cx,12
    getMax:
    cmp al,set[bx]
    jb max
    jmp if
    max:
    mov al,set[bx]
    if:
    add bx,1
    loop getMax 
    
    
    mov bx,0
    mov cx,12
    mov ah,99
    sub ah,al
    solve:
    add set[bx],ah
    add bx,1
    loop solve
      
    main endp
end main
