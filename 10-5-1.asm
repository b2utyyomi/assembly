�𰸣�ax=3

������

1������stack���� dw 8 dup (0)������16�ֽ��ڴ�Ϊ0��ջ�Σ�����ds:[0]~ds:[f]���ڴ浥Ԫȫ��Ϊ0,��Ȼ��ds:[0E]��Ԫ���ڴ���Ȼ��Ϊ0�ˣ�

2������ds=ss,Ҳ�����ݶ���ջ����ͬһ���ڣ�sp=16��ָ��ջ������ָ��ִ�е�call word ptr ds:[0eh]����ָ���ʱ���൱�ڽ����ˣ���1��PUSH IP(��ʱIP��ֵΪCALL�����һ������ƫ�Ƶ�ַ,Ҳ����INC AX��ƫ�Ƶ�ַ)�����ڳ�ʼջ��ָ��ָ��16������push ipִ��ʱ��ѡ��ָ�������ip=ip-2�Ĳ�����ʹipָ��14��Ҳ����0eh,�ٽ�call word ptr ds:[0eh]����һ��ָ��INC AX��ƫ�Ƶ�ַ��ջ��oeh�� ����2��JMP WORD PTR SS(��ΪDS����SS):[0EH],��ʱ������ת��CS:SS:[OEH]��ִ��,��Ϊ SS:[0EH]��ֵΪ0,������ת��CS:0����ʼִ��,Ҳ���ǳ���ĵ�һ�����MOV AX����3����������һ��ִ�е�call word ptr ds:[0EH]ʱ,ָ�뽫��ת��ds:[0eh] ,����ʱ�ģ�[0eh]����ֵ�Ѿ�����0�ˣ����ѱ���ϴ�ִ��callʱ��ѹջ��INC AX�����Ƶ�ַ����ʹִ��call word ptr ds:[0eh]����תֱ������ָ��inc,ax��������3��inc ��AX��ֵΪ3.

��ʵ������10.5(2)�����һ�£��޷���ѹջʱ��ѹ����һ��cs��ֵ��
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
