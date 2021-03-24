#unterminated ASCII string
#ASCII string terminated with a zero
#a char
#a 16-bit short integer
#a 32-bit integer



.data

int: .word 34				#integer of 4 bytes is declared with a value of 34
chr: .space 1				#character of 1 byte is declared
shrt: .space 2				#short of 2 bytes is declared
str1: .ascii "Unterminated String"	#unterminated string
str2: .asciiz "Terminated String"	#terminated string


.text
