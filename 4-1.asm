comment 向内存0:200~0:23f中依次传送数据0~63(3fH) comment
assume cs:code
code segment

    mov ax,0
    mov ds,ax
    
    mov bx,0
    
    mov cx,64
    
s:  mov ds:200H[bx], bx
    inc bx
    
    loop s
    
    mov ax,4c00h
    int 21h

code ends
end
