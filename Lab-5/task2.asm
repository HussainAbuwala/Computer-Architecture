# Resource Table
#
# Functions:
#	findIndexof: this function is used to find the index of the base 64 character and the index is stored in
#		     register $v0 when returning from the function 
#
# Registers Used:
#	
#	$s0: to store first base64 character
#	$s1: to store second base64 character
#	$s2: to store third base64 character
#	$s3: to store fourth base64 character
#	$v0: used to store index of base64 character when returning from findIndexof function
#	$a0: to store the argument of the function findIndexof which is basically the base64 character of which the index
#     	     needs to be found.
#	$t0: used to store the buffer of 24 bits
#
# Instructions used:
#	
#	add: to add values
#	sll: to shift left
#	srl: to shift right
#	la: to load address into register
#	li: to load immediate value into register
#	lb: to load byte into register
#	and: for masking



#  This MIPS program reads lines of Base 64-encoded text from standard
#  input, and outputs the decoded bytes to standard output. This program also works if the program also works if the encoded
#  string has one or two padding characters at then end.
#

# INSERT YOUR CODE AT THE POINT INDICATED BELOW.

#
# Data segment
#
        .data
        
kstack: 	.space 2048		#stack for storing the CPU state
        # Space to read a line into.
inbuffer: .space 80
        # The Base 64 alphabet, in order.
sequence: .asciiz "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
nl:	.asciiz "\n"
inputMessage:	.asciiz "Enter Your Encoded String: "
decodeMessage:	.asciiz "Decoded String is: "


#
# Text segment
#
        .text
        # Program entry.
main:
        # The first byte we're expecting is byte 0 of a group of 4.
        la $t9, byte0

        # Read a string from standard input.
loop:   

	li $v0, 4			# print new line	
	la $a0, inputMessage		# a0 = "\n"
	syscall

	li $v0, 8
        la $a0, inbuffer
        li $a1, 80
        syscall

        # Is this an empty line?  Since SPIM can't detect when end of
        # file has been reached, we need to use another way to indicate
        # the end of the Base 64 data.  We'll use a completely
        # blank line for this.
        lb $t0, inbuffer
        # First character newline means there was no text on this line,
        # so end the program.
        beq $t0, 10, alldone

        # Walk along the string.  Start at the beginning.
        la $t8, inbuffer

        # Go back to where we left off last time (byte 0, 1, 2 or 3).
        jr $t9


        # Get four characters at a time.
byte0:  lbu $s0, 0($t8)
        add $t8, $t8, 1
        beq $s0, 10, linedone
        
        # Now up to byte 1.
        la $t9, byte1
byte1:  lbu $s1, 0($t8)
        add $t8, $t8, 1
        beq $s1, 10, linedone

        # Now up to byte 2.
        la $t9, byte2
byte2:  lbu $s2, 0($t8)
        add $t8, $t8, 1
        beq $s2, 10, linedone

        # Now up to byte 3.
        la $t9, byte3
byte3:  lbu $s3, 0($t8)
        add $t8, $t8, 1
        beq $s3, 10, linedone

        # Now all bytes in this block are read.
        # Four Base64 characters are now in $s0, $s1, $s2, $s3.
        
        
        
        #####################################
        #####################################
        ########## LOCATION - 1 #############
        #j pseudoisr
        #returnfrompseudoisr:
        #####################################
        #####################################
        
# ---------------------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------

	#checking if the block of bytes has any padding
	
	bne $s3,61,bytesdone
	beq $s2,61,twoPadDecode
	
onePadDecode:

	li $t0,0			#buffer
        
        #make space for first byte
        
        add $a0, $s0,0			#get first byte base64 index
        jal findIndexOf
        add $t0,$v0,0			#firstByte in base64 index stored in $t0
        
        
        #make space for second byte
        sll $t0,$t0,6			#shift buffer 6 bits for making space for second byte
        add $a0, $s1,0			#get second byte base64 index		
        jal findIndexOf
        
        add $t0,$t0,$v0			#second byte is stored in buffer
        
        #make space for third byte
        sll $t0,$t0,6			#shift buffer 6 bits for making space for third byte
        add $a0, $s2,0			#get third byte base64 index		
        jal findIndexOf
        
        add $t0,$t0,$v0			#third byte is stored in buffer
        
        #masking
        srl $t0,$t0,2
	and $t5,$t0,255			#get 2ndByte by masking

	
	srl $t0,$t0,8
	and $t4,$t0,255			#get 1stByte by masking
	
	#print two decoded characters
	
	#li $v0, 4			
	#la $a0, decodeMessage		#decode message print
	#syscall
	
	li $v0,11			#print first byte
        add $a0,$t4,0
        syscall
        
        li $v0,11			#print second byte
        add $a0,$t5,0
        syscall
	
	j endgroup

twoPadDecode:

	li $t0,0			#buffer
        
        #make space for first byte
        
        add $a0, $s0,0			#get first byte base64 index
        jal findIndexOf
        add $t0,$v0,0			#firstByte in base64 index stored in $t0
        
        
        #make space for second byte
        sll $t0,$t0,6			#shift buffer 6 bits for making space for second byte
        add $a0, $s1,0			#get second byte base64 index		
        jal findIndexOf
        
        add $t0,$t0,$v0			#second byte is stored in buffer
        
        #masking
        srl $t0,$t0,4			#right shift by 2 bits
        and $t4,$t0,255			#get decoded by masking
        
        #print the character
        
        #li $v0, 4			
	#la $a0, decodeMessage		#decode message print
	#syscall
        
        li $v0,11
        add $a0,$t4,0
        syscall

	j endgroup
	

bytesdone:
        #
        # DO NOT DELETE THIS LINE.

        ######
        #
        # PUT YOUR ANSWER HERE.
        
        li $t0,0			#buffer
        
        #make space for first byte
        
        add $a0, $s0,0			#get first byte base64 index
        jal findIndexOf
        add $t0,$v0,0			#firstByte in base64 index stored in $t0
        
        
        #make space for second byte
        sll $t0,$t0,6			#shift buffer 6 bits for making space for second byte
        add $a0, $s1,0			#get second byte base64 index		
        jal findIndexOf
        
        add $t0,$t0,$v0			#second byte is stored in buffer
        
        #make space for third byte
        sll $t0,$t0,6			#shift buffer 6 bits for making space for third byte
        add $a0, $s2,0			#get third byte base64 index		
        jal findIndexOf
        
        add $t0,$t0,$v0			#third byte is stored in buffer
        
        
        #make space for fourth byte
        sll $t0,$t0,6			#shift buffer 6 bits for making space for fourth byte
        add $a0, $s3,0			#get fourth byte base64 index		
        jal findIndexOf
        
        add $t0,$t0,$v0			#fourth byte is stored in buffer
        
        #now convert base64 to ascii by masking. Registers being used are $t4,$t5,$t6,$t0
        
        and $t6,$t0,255			#find 3rd character in ascii
        
        srl $t0,$t0,8			#bring 2nd character in position for masking
        
        and $t5,$t0,255			#find 2nd character in ascii
        
        srl $t0,$t0,8			#bring 2nd character in position for masking
        
        and $t4,$t0,255			#find 1st character in ascii
        
        
        
        
        #####################################
        #####################################
        ########## LOCATION - 3 #############
        #j pseudoisr
        #returnfrompseudoisr:
        #####################################
        #####################################
        
        
        
        #print the character
        
        #li $v0, 4			
	#la $a0, decodeMessage		#decode message print
	#syscall
        
        li $v0,11			#print first byte
        add $a0,$t4,0
        syscall
        
        li $v0,11			#print second byte
        add $a0,$t5,0
        syscall
        
        li $v0,11			#print third byte
        add $a0,$t6,0
        syscall
        
        j endgroup
        
        
        
        
        # Your answer should not modify $t8 or $t9, as they are used by
        # the above code.
        #
        
        
findIndexOf:

	li $t2,0		#i
	la $t3,sequence		#address of the first byte of the sequence is stored in $t3
	
    seqloop:
    
    	#####################################
        #####################################
        ########## LOCATION - 2 #############
        j pseudoisr
        returnfrompseudoisr:
        #####################################
        #####################################
    	
    	beq $t2,64,done		#if full sequence is traversed but nothing found exit loop
    	lbu $t1,0($t3)		#byte is loaded into $t1
    	beq $t1,$a0,breakOut	#checking if argument is equal, checking if characters match
    	add $t2,$t2,1		#i = i + 1
    	add $t3,$t3,1		#go to the next byte in sequence
    	j seqloop
    
    breakOut:
    
    	li $v0,0
    	add $v0,$t2,0		#put index value into $v0 for returning
    	j done
    
    done:
    	jr $ra			#return back
    	
        
        
        ######

        # DO NOT DELETE THIS LINE.
        #
        
# ---------------------------------------------------------------------------------------------------------------------------------------
# ---------------------------------------------------------------------------------------------------------------------------------------


endgroup:
        # Go back to do next bunch of four bytes.  We're now expecting
        # byte 0 of 4.
        la $t9, byte0
        j byte0

linedone:
        # Line is finished; go get another one.
        li $v0, 4		# print new line	
	la $a0, nl		# a0 = "\n"
	syscall
	
        j loop


	
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

	


alldone:
        # Exit.
        li $v0, 10
        syscall
