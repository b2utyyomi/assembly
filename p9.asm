
;1����ʾ��Ĭ����ʾ�Ļ������ǣ�B8000~B8F9F,���ֽڷ��ַ�����;�ֽڷ�����
;     2������ַ��ĵ�ַ����һ�У�B8000~B809F,�ڶ��У�;B80A0~B813F �����У�B8140 ~ B81DF
 ;  3����ż���ֽڷ��ַ��������ֽڷ�����
 ;          4�������ʾ��ֻҪ���ַ����η��뻺��������
 ;          5����ɫ������ô��ʾ����ɫ��0000 0010 (02h),��;�׺��֣�0010 0100��24h��,�׵�����(71h)
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
    mov si, 15h  ;Ҫʹsiƫ�����洢��ɫ�ĵ�ַ, �����ݶδ洢��������
    mov ax, 0

s:
    mov ah, ds:[si]   ;ah�����ַ���ɫ
    push cx
    push si
    mov cx, 16
    mov si, 0
    mov bx, 0
    mov di, 1

inputCh:
    mov al, [bx]
    mov es:[bx+si], al  ;д�ַ�
    mov es:[bx+di], ah  ;д����
    inc bx
    inc si
    inc di
    
    loop inputCh
    
    pop si
    pop cx
    inc si
    mov dx, es
    add dx, 0ah  ;000~09f��ʾ����һ��
    mov es, dx
    
    loop s
    
    s1:
        jmp short s1
codesg ends
end start
    
