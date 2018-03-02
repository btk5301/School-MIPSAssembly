#Brian Khunchana
#store the first list in list a and the 2nd list in listb
.data
lista: 
.word 1 
.word 4
.word 6
.word 9 
listb:
.word 0 
.word 2
.word 3
.word 7
newlist:
.space 32

.text
.globl main
main:
la $11, newlist # stores the address of the result list into $11
la $12, lista   # stores the address of the lista into $12 
la $13, listb   # stores the address of the listb into $13
lw $14, 0($12)  # stores the first value of $12 into $14
lw $15, 0($13)  # stores the first value of $13 into $15
li $16, 0       # initiate counter variable to add to $11 pointer
li $18, 0	# initiate counter variable to check length of list a
li $19, 0	# initiate counter variable to check length of list b
li $22, 0	# initiate counter variable to add to $11 pointer to print

loop:
bgt $14,$15, else  # branch if value in lista is greater than the value in list b
add $17, $11, $16  # add counter $16 to address $11 to increment pointer in newlist
sw $14, 0($17)	   # store the value in list a into the new list since less than list b
addi $16, $16, 4   # increment $16 counter to move the newlist pointer
addi $18, $18, 4   # increment $18 counter to check if end of list a
addi $12, $12, 4   # increment $12 address to move the pointer to the next value
lw $14, 0($12)	   # store the value of what $12 is pointing to
bne $18, 16, loop  # repeat the loop until there are no more values in lista
bne $19, 16, addb  # if there are no more values in lista add the rest of values in list b to newlist if list b has values left
j end

else:
add $17, $11, $16 # add counter $16 to address $11 to increment pointer in newlist
sw $15, 0($17)    # store the value in list b into the new list since less than list a
addi $16, $16, 4  # increment $16 counter to move the newlist pointer
addi $19, $19, 4  # increment $19 counter to check if end of list b
addi $13, $13, 4  # increment $13 address to move the pointer to the next value
lw $15, 0($13)    # store the value of what $13 is pointing to
bne $19, 16, loop # repeat the loop until there are no more values in listb
bne $18, 16, adda # if there are no more values in listb add the rest of values in list a to newlist if list a has values left

end:
li $v0, 1	# load print command 
lw $20, ($11)	# load the value from the newlist to print
addi $11, $11, 4 # increment the address of the newlist
addi $22, $22, 4 # increment the print counter variable by 4 for the loop
add $a0, $20, $zero #load the value to print
syscall 	   #print the value
bne $22, 32, end #branch until all the values have been printed
li $v0, 10 #terminate the program
syscall
 
#label that adds the rest of the values of b into newlist. Each line has been explained above because of same code
addb:
add $17, $11, $16
sw $15, 0($17)
addi $16, $16, 4
addi $19, $19, 4
addi $13, $13, 4
lw $15, 0($13)
bne $19, 16, addb
j end

#label that adds the rest of the values of a into newlist. Each line has been explained above because of same code
adda:		
add $17, $11, $16
sw $14, 0($17)
addi $16, $16, 4
addi $18, $18, 4
addi $13, $13, 4
lw $14, 0($13)
bne $19, 16, adda
j end
