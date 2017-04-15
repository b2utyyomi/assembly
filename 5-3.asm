; DS = 076D  CS = 076A    SS = 076E
;把end start改成end 也有可能正确执行，因为去掉之后
;就相当于没有指定程序入口，也就是按照CPU内存中的顺序
;执行指令，可能刚好是正确的顺序
assume cs:code, ds:data, ss:stack

code segment

start:  mov ax, stack
        mov ss, ax
        mov sp, 16
        
        mov ax, data
        mov ds, ax
        
        push ds:[0]
        push ds:[2]
        pop ds:[2]
        pop ds:[0]
        
        mov ax, 4c00h
        int 21h
        
code ends

data segment
    dw 0123h, 0456h
data ends

stack segment
    dw 0,0
stack ends


end start



