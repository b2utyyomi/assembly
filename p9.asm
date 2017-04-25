
;1、显示器默认显示的缓冲区是：B8000~B8F9F,低字节放字符，高;字节放属性
;     2、存放字符的地址：第一行：B8000~B809F,第二行：;B80A0~B813F 第三行：B8140 ~ B81DF
 ;  3、即偶数字节放字符，奇数字节放属性
 ;          4、如何显示：只要把字符依次放入缓冲区即可
 ;          5、颜色属性怎么表示：绿色：0000 0010 (02h),绿;底红字：0010 0100（24h）,白底蓝字(71h)
assume cs:codesg, ds:data, ss:stack

data segment
    db 'I love taekwoon oppa!'
    db 2,24h,71h
data ends

stack segment
    db 16 dup(0)
stack ends

codesg segment

start:
    
    mov ax, stack 
    mov ss, ax
    mov sp, 0
    
    mov ax, data
    mov ds, ax
    
    mov cx, 3
    mov ax, 0B800H
    mov es, ax
    mov si, 15h  ;要使si偏移至存储颜色的地址, 看数据段存储就明白了
    mov ax, 0

s:
    mov ah, ds:[si]   ;ah保存字符颜色
    push cx
    push si
    mov cx, 16
    mov si, 0
    mov bx, 0
    mov di, 1

inputCh:
    mov al, [bx]
    mov es:[bx+si], al  ;写字符
    mov es:[bx+di], ah  ;写属性
    inc bx
    inc si
    inc di
    
    loop inputCh
    
    pop si
    pop cx
    inc si
    mov dx, es
    add dx, 0ah  ;000~09f显示器第一行
    mov es, dx
    
    loop s
    
    s1:
        jmp short s1
codesg ends
end start
    
