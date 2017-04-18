
;每个单词的前4个字母改写为大写字母
;bx要自增16啊, 老是写成自增1...

assume cs:codesg, ss:stacksg, ds:datasg

datasg segment
    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
datasg ends

stacksg segment
dw 0,0,0,0,0,0,0,0
stacksg ends

codesg segment

start: 
    mov ax, stacksg
    mov ss, ax
    mov sp, 16
    
    mov ax, datasg
    mov ds, ax
    
    mov cx, 4
    mov bx, 0
s:
    push cx
    mov si, 0
    mov cx, 4

s1:
    mov al, ds:[bx+si+3]
    and al, 11011111B
    mov ds:[bx+si+3], al
    inc si
    
    loop s1
    
    pop cx
    add bx, 16
    
    loop s
    
    mov ax, 4c00H
    int 21H
    
codesg ends

end start

