# Brian Khunchana

#Part 1:
#The program multiplies two arguments together.

	.data
arg:	.word	5
argb: .word 10

	.text
	.globl main
main:
	la	$13, arg
	lw	$12, 0($13)  #$12 is 5
	lw	$13, 0($13)  #$13 is 10

	addi	$11, $zero, 0 #11 is 0
	
	#part 2 and 3 below

	#get input from user
	li $v0, 5 # code for reading in an int
	syscall
	addi $12, $v0, 0   # int input goes to $12
	
	li $v0, 5 # code for reading in an int
	syscall
	addi $13, $v0, 0 # int input goes to $13
	
	blez $12, fin # if $12 is less than or equal to zero go to fin
	blez $13, fin # if $13 is less than or equal to zero go to fin

fori:
	add	$11, $11, $12	
	addi	$13, $13, -1 
	bnez	$13, fori # if $13 is not equal to zero go back to fori
fin:
	# print the product
	addi $a0, $zero, 0 # get $a0 to become zero
	add  $a0, $a0, $11
	li   $v0, 1 # print the statement
	syscall
	 
	li	$v0, 10
	syscall
