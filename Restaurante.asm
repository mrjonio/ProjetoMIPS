.data
	#Menu Principal:
	titulo: .asciiz "Escolha uma opção \n 1 - Clientes \n 2 - Pratos \n 3 - Funcionarios \n 4 - Mesa \n 5 - Pedidos \n"
	error: .asciiz "Dados inválidos!!!"
	
.text
Main:
#----------------------------------Menu Principal---------------------------------------------------------------------------------------------------
	la $t0, titulo 		#Carrega o menu
	jal escolha		#Função para mostrar o menu e escolher a opção
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 5	#Parâmetro pra saber se a opção escolhida é menor ou igual a 5
	jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 5 
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	j exit
	
#------------------------------Função de seleçãod e menu escolha(int escolhido) return escolhido---------------------------------------------------	
escolha: 	addi $v0, $zero, 51
		la $a0, ($t0)
	 	syscall
	 	jr $ra
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-----------------------------------------------Printf----------------------------------------------------------------------------------------------
printf:	add $v0, $zero, $t0
	syscall
	jr $ra
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------Verifica se a opção selecionada é inválida------------------------------------------------------------------------
verificacao:  	bgt $t1, $a1, dadosInvalidos
		bgt $a0, $t2, dadosInvalidos
		jr $ra
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------Erro: Opção selecionada é inválida!!!----------------------------------------------------------------------------
dadosInvalidos: 	addi $a1, $zero, 2
			la $a0, error
			addi $t0, $zero, 55
			sub $t2, $t2, $t2
			jal printf
			j Main
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	
exit: nop
	
