.global _start

.section .text
_start:
#your code here
movq num , %rax # load a value into register rax
movq $64 , %rcx #rcx is the counter for the loop
movb $0 , %bl #bl summing the amount of one

loop_HW1:
		cmp $0 , %rcx 
		je end_HW1
		dec %rcx
		shr $1 , %rax
		jae loop_HW1 
		
Bool_HW1:		
		inc %bl
		movb %bl, Bool 
		jmp loop_HW1
		
end_HW1:
