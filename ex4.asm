.global start

.section .text
_start:
#your code here
movl Value , %eax 
movq head , %rdi #rdi is the pointer to the val
movq Source , %rbx # rbx is the pointer Source
xor %rdx , %rdx # rdx is the pointer to prev Source
xor %r9 , %r9 # r9 is the pointer to prev val
movq head , %r8 #temp src2

testq %rdi , %rdi 
je End

Search_Source_HW1:
                cmpq %r8 , %rbx # if temp_src2 == src
                je Search_val_HW1
                movq %r8 , %rdx # rdx = prev Source
                movq 4(%r8) , %r8 # r8 = r8 -> next
                jmp Search_Source_HW1


Search_val_HW1:
				movl (%rdi) , %ecx # ecx = *temp
				cmpl %ecx , %eax #if ecx == val
				je Swap_HW1
				movq %rdi , %r9 #r9 = prev
				movq 4(%rdi) , %rdi #rdi = rdi -> next
				testq %rdi , %rdi # check if rdi != nullptr
				jne Search_val_HW1
				je End



Swap_HW1:#rbx=src rdi=dst rdx=presrc r9=predst
    cmpq %r9 , %rdx # if prevval == prevsrc
    je End
	
    cmpq $0, %rdx #if presrc == nullptr	
    je no_prev_src_HW1
    movq %rdi, 4(%rdx) # presrc -> next = dest
	jmp Next_Hw1
	
no_prev_src_HW1:
	leaq head , %r15 
	movq %rdi , (%r15)
	
Next_Hw1:
	cmpq $0 , %r9 #if predest == nullptr
    jz no_prev_dest_HW1
    movq %rbx, 4(%r9)# predest -> next = src
	jmp Swap2_HW1
	
no_prev_dest_HW1:
	leaq head , %r15 
	movq %rbx , (%r15)

Swap2_HW1:
    movq 4(%rdi), %r11 # r11 = dest ->next
    movq 4(%rbx), %r12 # r12 = src -> next
    movq %r11, 4(%rbx)# src -> next = r11 = dest -> next
    movq %r12, 4(%rdi) # dst -> next = r12 = src -> next

End:

