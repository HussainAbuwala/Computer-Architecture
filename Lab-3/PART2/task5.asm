#--------------------------------------------------------------------------------------------------------------------------------------
								#DOCUMENTATION



#AS myvar1 + myvar3 = 10, we can jump out of the loop and hence no infinite loop



#----------------------------------------------------------------------------------------------------------------------------------------



.data


myvar1:    .word 8  # int myvar1
myvar3:    .word 2   # int myvar3
n:         .space 4
myvar2:    .space 1  # char myvar2


prom:   .asciiz "Type a number: "
res:    .asciiz "Result is: "
nl:     .asciiz "\n"

.text



main:   
	
myloop:
    	lw $t0, myvar1          # myvar1 into $t0
        lw $t1, myvar3          # myvar3 into $t1
        
        add $t2, $t1, $t0       # add $t1 and $t2 and put result into $t2
    	sw $t2, myvar3          # store in myvar3
   	beq $t2, 10, done       # branch to "done" if $t2 is equal to 10
    	j myloop                # unconditionally jump to myloop
    
done:

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
