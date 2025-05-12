.global _start

.section .text
_start:
#your code here
movq $array1, %rax #rax is pointer to arr1
movq $array2 , %rbx # rbx is pointer to arr2
movq $mergedArray , %rcx # rcx is pointer to mergedArray

Loop_HW1:
		movl (%rax) , %r8d #r8d = *(arr1)
		movl (%rbx) , %r9d # r9d = *(arr2) 
		testl %r8d , %r8d 
		je Forward_Arr2_HW1
		testl %r9d , %r9d
		je Forward_Arr1_HW1
		cmpl %r8d , %r9d 	
		ja Forward_Arr2_HW1 # if *arr2 > *arr1
		je Equal_HW1 # if *arr1 = *arr2
		jb Forward_Arr1_HW1 # if *arr1 > *arr2 

Forward_Arr1_HW1:
		testl %r8d, %r8d
		je before_end_HW1
		movl %r8d , %r10d  #*mergedArray = *arr1
                movl %r10d, (%rcx)
		addq $4 , %rcx # rcx = rcx + 4 
New_Next1_HW1:
		addq $4 , %rax # rax = rax +4 
		cmpl (%rax) , %r8d  # if arr1[i] == arr1[i+1] 
		je New_Next1_HW1
		jmp Loop_HW1
Forward_Arr2_HW1:
		testl %r9d , %r9d 
		je before_end_HW1
                movl %r9d , %r10d  #*mergedArray = *arr2
                movl %r10d, (%rcx)
		addq $4 , %rcx # rcx = rcx + 4 
New_Next2_HW1:
		addq $4 , %rbx # rbx = rbx +4 
		cmpl (%rbx) , %r9d  # if arr2[i] == arr2[i+1] 
		je New_Next2_HW1		
		jmp Loop_HW1
Equal_HW1:
		movl %r9d , (%rcx)  #*mergedArray = *arr2
		addq $4 , %rcx # rcx = rcx + 4 
New_Next22_HW1:
		addq $4 , %rbx # rbx = rbx +4 
		cmpl (%rbx) , %r9d  # if arr2[i] == arr2[i+1] 
		je New_Next22_HW1			
New_Next11_HW1:
		addq $4 , %rax # rax = rax +4 
		cmpl (%rax) , %r8d  # if arr1[i] == arr1[i+1] 
		je New_Next11_HW1
		jmp Loop_HW1
before_end_HW1:
		movl $0, (%rcx)
		
End_HW1:
