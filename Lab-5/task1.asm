
.data

kstack: 	.space 2048		#store the CPU state
outputMessage: .asciiz "The Sum is : "

.text

main:

	li $t0,0
	li $t1,1
	li $t2,2
	li $t3,3
	li $t4,4
	li $t5,5
	
	j pseudoisr
	
	returnfrompseudoisr:
	
	add $t0,$t0,$t1
	add $t0,$t0,$t2
	add $t0,$t0,$t3
	add $t0,$t0,$t4
	add $t0,$t0,$t5
	
	li $v0, 4			# print output message	
	la $a0, outputMessage	
	syscall
	
	add $a0,$t0,0
	li $v0,1
	syscall
	
	li $v0,10
	syscall

	
#################################################	START OF ISR	##############################################################	
pseudoisr:

	
	#disable all interrupts
	
	la $t7,kstack
	
	#save the current state of the CPU
	
	add $t7,$t7,4		#increment stack pointer and push register $t0 to stack
	sw $t0,0($t7)		
	
	add $t7,$t7,4		#increment stack pointer and push register $t1 to stack
	sw $t1,0($t7)
	
	add $t7,$t7,4		#increment stack pointer and push register $t2 to stack
	sw $t2,0($t7)
	
	add $t7,$t7,4		#increment stack pointer and push register $t3 to stack
	sw $t3,0($t7)
	
	add $t7,$t7,4		#increment stack pointer and push register $t4 to stack
	sw $t4,0($t7)
	
	add $t7,$t7,4		#increment stack pointer and push register $t5 to stack
	sw $t5,0($t7)
	
	
	#executing all the work the ISR is intended to perform
	#set the contents of register $t0-$t5 to 0
	
	li $t0,0
	li $t1,0
	li $t2,0
	li $t3,0
	li $t4,0
	li $t5,0
	
	#popping off the registers from stack to restore the CPU state
	
	lw $t5,0($t7)		#restoring value of $t5 from stack and decrementing the stack pointer
	sub $t7,$t7,4
	
	lw $t4,0($t7)		#restoring value of $t4 from stack and decrementing the stack pointer
	sub $t7,$t7,4
	
	lw $t3,0($t7)		#restoring value of $t3 from stack and decrementing the stack pointer
	sub $t7,$t7,4
	
	lw $t2,0($t7)		#restoring value of $t2 from stack and decrementing the stack pointer
	sub $t7,$t7,4
	
	lw $t1,0($t7)		#restoring value of $t1 from stack and decrementing the stack pointer
	sub $t7,$t7,4
	
	lw $t0,0($t7)		#restoring value of $t0 from stack and decrementing the stack pointer
	sub $t7,$t7,4
	
	#enable all interrupts
	
	#jump back to where we left off
	j returnfrompseudoisr
	
#################################################	END OF ISR	##############################################################

	
	
	
	
	

	
	
	
	
	
	


