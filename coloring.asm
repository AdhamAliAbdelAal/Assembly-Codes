.model small
printwithcolor macro par
    mov ah,9 ;Display
mov bx,0 ;Page 0
mov al,par ;Letter D
mov cx,1h ;5 times
mov bl,0FAh ;Green (A) on white(F) background
int 10h
endm printwithcolor 
readnum macro mydata
    mov cx,0
    mov ah,1
    int 21h
    sub al,30h
    mov dl,10
    mul dl
    add cl,al
    mov ah,1
    int 21h
    sub al,30h
    add cl,al
    mov mydata,cl
endm readnum

printmsg macro msg
    mov ah,9
    mov dx,offset msg
    int 21h
endm printmsg

clear macro
    mov ax,0600h
    mov bh,07
    mov cx,0
    mov dx,184FH
    int 10h
endm clear

printnum3 macro num
    mov ah,0
    mov al,num
    mov cl,100
    div cl
    
    mov dl,al
    mov dh,ah
    add dl,30h
    push ax
    push bx
    push cx
    push dx
    printwithcolor dl
    pop dx
    pop cx
    pop bx
    pop ax
    mov ah,0
    mov al,dh
    mov cl,10
    div cl
    
    mov dl,al
    mov dh,ah
    add dl,30h
    push ax
    push bx
    push cx
    push dx
    printwithcolor dl
    pop dx
    pop cx
    pop bx
    pop ax
    
    mov dl,dh
    add dl,30h
    push ax
    push bx
    push cx
    push dx
    printwithcolor dl
    pop dx
    pop cx
    pop bx
    pop ax
endm printnum3

printnum2 macro num
    mov ah,0
    mov al,num
    mov cl,10
    div cl
    
    mov dl,al
    mov dh,ah
    add dl,30h
    mov ah,2
    int 21h
    
    mov dl,dh
    add dl,30h
    mov ah,2
    int 21h
endm printnum2
Curr macro x,y
    mov bx,0
    mov ah,2
    mov dh,y
    mov dl,x
    int 10h
    
endm curr
.stack 64
.data
msg1 db "please enter the num1 : $"
msg2 db "please enter the num2 : $"
mult1 db "x$"
mult2 db "=$"
num1 db ?
num2 db ?
result db ?
newline db 10,13,'$'
.code
main proc far
    mov ax,@data
    mov ds,ax 
    ;read data
    printmsg msg1
    readnum num1
    printmsg newline
    printmsg msg2
    readnum num2
    printmsg newline
    clear
    ;*******************************
    printnum3 num1 
    main endp

end main