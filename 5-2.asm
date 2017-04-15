;DS = 076A  CS = 076C  SS = 076B
; data segment:  23 01 56 04 00 00 00 00...

comment

name segment
...
name segment
若段中数据占N个字节，则程序加载后， 该段实际占有的空间为
(N/16+1)*16;

comment

assume cs:code, ds:data, ss:stack

data segment
    dw 0123h, 0456h
data ends

stack segment
    dw 0,0
stack ends

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
end start

