.model small
.stack 64
.data
x dw 1234h
.code
main proc far
    MOV AX,@DATA
    MOV DS,AX
    mov ax,4
    mul ax,2
main endp
end main