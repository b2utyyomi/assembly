;ÿ�����ʵ�ǰ4����ĸ��дΪ��д��ĸ
;��Ϊһ�����ĵĶ���һֱ���ڴ����� ���ڸĺ���

assume cs:codesg,ds:datasg

datasg segment

    db '1. display      '
    db '2. brows        '
    db '3. replace      '
    db '4. modify       '
datasg ends

codesg segment

    start:
        mov ax, datasg
        mov ds, ax
      
        mov cx, 4
        mov bx, 0
      
    s1: 
        mov dx,cx
        mov cx,4
        mov si,0
          
    s:  mov al,ds:[bx+si+3]
        and al,11011111B
        mov ds:[bx+si+3], al
        inc si
        
        loop s
        
        add bx,16
        mov cx, dx
        loop s1

codesg ends

end start


