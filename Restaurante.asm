.data
	titulo: .asciiz "Escolha uma opção \n"
	menuCliente: .asciiz "1 - Clientes \n"
	menuPrato: .asciiz "2 - Pratos \n"
	menuFuncionario: .asciiz "3 - Funcionarios \n"
	menuMesa: .asciiz "4 - Mesa \n"
	menuPedidos: .asciiz "5 - Pedidos \n"

.text
	la $t0, titulo
	jal print
	la $t0, menuCliente
	jal print
	la $t0, menuPrato
	jal print
	la $t0, menuFuncionario
	jal print
	la $t0, menuMesa
	jal print
	la $t0, menuPedidos
	jal print
	j exit
	

print:	la $a0, ($t0)
	addi $v0, $zero, 4 
	syscall
	jr $ra
	
exit: nop
	
