;�������ܴ��볤�ȿ�ͨ��debug���غ�ͨ��u�����
;�Ƚ��ڶ���λ�����Ϊ1�����غ�۲�mov ax,4c00h֮ǰ����Ϊ;0000~0016h���ܳ���Ϊ23.
;�������ǽ�"mov ax,4c00h"֮ǰ��ָ��Ƶ��ڴ�0:200��
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



