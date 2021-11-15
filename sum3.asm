.model small
.stack 64
.data
a db 3h
b db 4h
c db 12h
d db ?
.code
mymain proc far
    mov ax,@data
    mov ds,ax
    mov ah,a
    add ah,b
    add ah,c
    mov d,ah
mymain endp
end mymain