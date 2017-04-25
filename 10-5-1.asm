答案：ax=3

分析：

1、本题stack段用 dw 8 dup (0)定义了16字节内存为0的栈段，所以ds:[0]~ds:[f]的内存单元全部为0,当然，ds:[0E]单元的内存自然就为0了！

2、本题ds=ss,也即数据段与栈段于同一段内，sp=16，指向栈顶，当指令执行到call word ptr ds:[0eh]这条指令的时候，相当于进行了：（1）PUSH IP(此时IP的值为CALL语句下一条语句的偏移地址,也就是INC AX的偏移地址)，由于初始栈顶指针指向16，所以push ip执行时，选将指针进行了ip=ip-2的操作，使ip指向14，也就是0eh,再将call word ptr ds:[0eh]的下一条指令INC AX的偏移地址入栈到oeh处 ；（2）JMP WORD PTR SS(因为DS等于SS):[0EH],此时程序跳转到CS:SS:[OEH]处执行,因为 SS:[0EH]的值为0,所以跳转到CS:0处开始执行,也就是程序的第一条语句MOV AX；（3）当程序再一次执行到call word ptr ds:[0EH]时,指针将跳转到ds:[0eh] ,而此时的：[0eh]处的值已经不是0了，它已变成上次执行call时被压栈的INC AX处的移地址，它使执行call word ptr ds:[0eh]的跳转直接跳到指令inc,ax处，连续3次inc 后，AX的值为3.

其实，检测点10.5(2)与此题一致，无非是压栈时多压入了一个cs的值！
assume cs:codesg, ss:stack

stack segment
    dw 0,0,0,0,0,0,0,0
stack ends
codesg segment
    start:  
            mov ax, stack
            mov ss, ax
            mov sp, 16
            mov ds, ax
            mov ax, 0
            call word ptr ds:[0eh]
            inc ax
            inc ax
            inc ax
            mov ax, 4c00h
            int 21h
codesg ends

end start
