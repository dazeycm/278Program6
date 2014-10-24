	.text
	.globl main
	
main:
	subi $sp, $sp, 124
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addi $fp, $sp, 120

	
	li $t0, 120		#memory address of x
	li $t1, 80		#memory address of y
	
	sw $t0, 8($sp)
	sw $t1, 12($sp)
	
	li $t0, 10		#size
	li $t1, 0		#index
	
loop:
	beq $t1, $t0, before_second_loop
	
	sw $t1, ($fp)
	addi $t1, $t1, 1
	subi $fp, $fp, 4
	
	j loop
	
before_second_loop:
	li $t0, 10		#size
	li $t1, 0		#index
	
second_loop:
	beq $t1, $t0, exit_loop
	
	sw $t1, ($fp)
	addi $t1, $t1, 1
	subi $fp, $fp, 4
	
	j second_loop
	
exit_loop:
	lw $a0, 8($sp)
	lw $a1, 12($sp)

sum:
	subi $sp, $sp, 124
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	
	li $t2, 0		#total
	
	li $t0, 10
	li $t1, 0
	
sum_loop:
	beq $t1, $t0, sum_exit 
	
	lw $t4, ($a0)
	lw $t5, ($a1)

	
	
sum_exit:
	
	
	
	
	
	
	
	
	
