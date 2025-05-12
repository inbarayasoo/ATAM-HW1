.global _start

.section .text
_start:

movq $source , %rax # rax=source 
movq $destination , %rbx #rbx=des
movl (num) , %edx #edx= *num
movq $0 , %r9 #r9 is counter
xor %rcx, %rcx # helping register 

cmp $0 , %edx #if *num >= 0 
jge Positive_HW1
jmp Negative_HW1

Positive_HW1:
		cmp $0 , %edx  #if *num == 0 
		je End_HW1
		cmpq %rax , %rbx # if dest < source
		jg Source_bigger_HW1
		
		movb (%rax,%r9), %cl #cl= *(source + counter) 
		movb %cl , (%rbx,%r9) #*(des + counter*1) = cl
		incq %r9 
		decl %edx
		cmp $0 , %edx 
		je End_HW1
		jmp Positive_HW1	

Source_bigger_HW1:
		movb (%rax,%edx), %cl #cl= *(source + num) 
		movb %cl , (%rbx,%edx) #*(des + num*1) = cl
		decl %edx # num -- 
		cmp $0 , %edx 
		je End_HW1
		jmp Source_bigger_HW1	

		
			
Negative_HW1:
		movl %edx, (%rbx) 

End_HW1:
