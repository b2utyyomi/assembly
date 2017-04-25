;哇哦 这个程真的是Debug半天 跳来跳去 看晕了
;菜鸟在朝大神的方向发展 呵哈哈哈
assume cs:codesg
codesg segment
        mov ax, 4c00h
        int 21h

start:  mov ax, 0
    s:  nop
        nop
        
        mov di, offset s
        mov si, offset s2
        mov ax, cs:[si]
        mov cs:[di], ax
    s0: jmp short s
    
    s1: mov ax, 0
        int 21h
        mov ax, 0
    s2: jmp short s1
        nop
    
codesg ends
end start
        


