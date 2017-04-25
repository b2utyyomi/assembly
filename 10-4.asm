assume cs:codesg

stack segment
    db 16 dup(0)
stack ends
codesg segment
    start:  
            mov ax, 6
            call ax
            inc ax
            mov bp, sp
            add ax, [bp]

codesg ends

end start
