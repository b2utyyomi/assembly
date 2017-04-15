
;我悲催地用了ax 这可是个16位的寄存器啊 改成al就ok了

assume cs:code

a segment
    db 1,2,3,4,5,6,7,8
a ends

b segment
    db 1,2,3,4,5,6,7,8
b ends

c segment
    db 0,0,0,0,0,0,0,0
c ends

code segment

start:  mov ax, a
        mov ds, ax
        
        mov ax, b
        mov es, ax
        
        mov cx, 8
        mov bx, 0
        
    s:  mov al, ds:[bx]
        add es:[bx], al
        inc bx
        
        loop s
        
        mov ax, c
        mov ds, ax
        
        mov cx, 8
        mov bx, 0
        
    s1: mov al, es:[bx]
        mov ds:[bx], al
        inc bx
        
        loop s1
    
        mov ax, 4c00h
        int 21h
        
code ends


end start
