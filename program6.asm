	.text
	.globl main
	
main:
	subi $sp, $sp, 124
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addi $fp, $sp, 120
	
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
	la $a0, ($fp)
	la $a1, 40($fp)
	
	jal sum
	
	sw $v0, 8($sp)		#store sum
	
	li $t7, 't'
	sb $t7, 12($sp)
	li $t7, 'o'
	sb $t7, 13($sp)
	li $t7, 't'
	sb $t7, 14($sp)
	li $t7, 'a'
	sb $t7, 15($sp)
	li $t7, 'l'
	sb $t7, 16($sp)
	li $t7, ' '
	sb $t7, 17($sp)
	li $t7, '='
	sb $t7, 18($sp)
	li $t7, ' '
	sb $t7, 19($sp)
	
	li $v0, 4
	la $a0, 12($sp)
	syscall
	
	li $v0, 1
	lw $a0, 8($sp)
	syscall
	
	li $v0, 0		#return 0
	
	lw $ra, 0($sp)
	lw $fp, 4($sp)
	addi $sp, $sp, 124
	
	j exit









sum:
	subi $sp, $sp, 32
	sw $ra, 0($sp)
	sw $fp, 4($sp)
	addi $fp, $fp, 28

	li $t0, 10		#size
	li $t1, 0		#index
	li $t2, 0		#total
	
	move $t3, $a0
	move $t4, $a0
	
sum_loop:
	beq $t1, $t0, sum_exit 
	
	lw $t5, ($t3)
	lw $t6, ($t4)
	
	add $t2, $t2, $t5
	add $t2, $t2, $t6
	
	addi $t3, $t3, 4
	addi $t4, $t4, 4
	addi $t1, $t1, 1
	
	j sum_loop
	
sum_exit:
	move $v0, $t2
	lw $ra, 0($sp)
	lw $fp, 4($sp)
	addi $sp, $sp, 32
	
	jr $ra
	
exit:
	
	
	
	
	
	
	
	
