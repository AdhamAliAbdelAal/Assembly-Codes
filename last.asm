.model small
.stack 64
.data
x db 0
size equ 5
.code 
main proc far
    mov ax,@data
    mov ds,ax
    mov ax,12
    mov dx,0
    mov bx,0
    isPrime:
            
    addOne:
    mov x[bx],ax
    add bx,1
    
    main endp
end main