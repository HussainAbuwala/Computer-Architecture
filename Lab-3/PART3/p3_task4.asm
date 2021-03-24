.data
n:      .space 4
prom:   .asciiz "Type a string a number: "
res:    .asciiz "Result is: "
nl:     .asciiz "\n"
prom1:   .asciiz "Type a string to echo: "
uString: .space 50

        .text
main:   

# -----------------------------------------------------
		#MODIFIED CODE STARTS HERE	

	li $v0, 4     # print str
        la $a0, prom1  # at prom
        syscall
        
                
        li $v0, 4     # print str
        la $a0, nl  # at prom
        syscall
        
        la $a0, uString
        li $a1,50
        li $v0,8
        syscall
        
        
	li $v0, 4     # print str
        la $a0, uString  # at prom
        syscall

        

	#MODIFIED CODE ENDS HERE
	
# -----------------------------------------------------


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
