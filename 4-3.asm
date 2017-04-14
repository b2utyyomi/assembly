;而程序总代码长度可通过debug加载后通过u命令看出
;先将第二空位随便设为1，加载后观察mov ax,4c00h之前代码为;0000~0016h，总长度为23.
;程序功能是将"mov ax,4c00h"之前的指令复制到内存0:200处
assume cs:code
code segment

    mov ax,cs
    mov ds,ax
    
    mov ax,0020h
    mov es,ax
    mov bx,0
    
    mov cx,23
    
s:  mov al,[bx]
    mov es:[bx],al
    inc bx
    
    loop s
    
    mov ax,4c00h
    int 21h

code ends
end



