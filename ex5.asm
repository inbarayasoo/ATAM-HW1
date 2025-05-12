.global _start

.section .text
_start:
#your code here


movq root , %rax #rax points to current node 
movq (new_node) , %r9 # r9 = new_node -> val
testq %rax, %rax 
jne Search_HW1
movq $new_node , root # root = new_node
jmp end

Search_HW1: 
			movq %rax , %rcx #rcx = curr
			cmpq (%rax), %r9 # if curr-> val == new_node-> val
			je end
			jg Right_Son_HW1
			jl Left_Son_HW1
			

Right_Son_HW1:
			movq 16(%rax) , %rax 
			cmpq $0 , %rax # check if right_son == nullptr
			je Insert_Right_Son_Hw1 
			jmp Search_HW1

Left_Son_HW1:
			movq 8(%rax) , %rax # check if left_son == nullptr
			cmpq $0 , %rax 			
			je Insert_Left_Son_Hw1
			jmp Search_HW1


Insert_Left_Son_Hw1:
			movq $new_node , 8(%rcx) # curr -> left_son = new_node
			jmp end


Insert_Right_Son_Hw1:
			movq $new_node , 16(%rcx) # curr -> right_son = new_node
			jmp end

end:
