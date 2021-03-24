.data
x:      .space 4
n:      .space 4
prom:   .asciiz "Type a number: "
res:    .asciiz "Result is: "
nl:     .asciiz "\n"
hw: 	.asciiz "Hello World"
times:  .asciiz "How many times you want it to be printed? "




        .text
main:   

# -----------------------------------------------------


	#MODIFIED CODE STARTS HERE
	
	li $v0, 4     # print hello world
        la $a0, hw  
        syscall
        
        li $v0, 4     # print newline
        la $a0, nl  
        syscall

        
        li $v0, 4     # asks how many time to be printed
        la $a0, times  
        syscall
        
        
        
        li $v0, 5     # read int
        syscall
        sw $v0, x     # store in X
        
        #MODIFIED CODE ENDS HERE
        
        
# ------------------------------------------------------


	li $v0, 4     # print str
        la $a0, prom  # at prom
        syscall

        li $v0, 5     # read int
        syscall
        sw $v0, n     # store in n

        li $v0, 4     # print str
        la $a0, res   # at res
        syscall

        li $v0, 1     # print int
        lw $t0, n          # n
        sub $t1, $t0, 1    # n-1
        mul $t0, $t0, $t1  # *
        sra $a0, $t0, 1    # /2
        syscall

        li $v0, 4     # print str
        la $a0, nl    # at nl
        syscall

        li $v0, 10    # exit
        syscall
