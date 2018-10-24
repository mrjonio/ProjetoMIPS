.data
	#Menu Principal:
	titulo: .asciiz "Escolha uma opção \n 1 - Clientes \n 2 - Pratos \n 3 - Funcionarios \n 4 - Mesa \n 5 - Pedidos \n"
	
	#Label: Exception: DadoInvalido
	error: .asciiz "Dados inválidos!!!"
	
	#Label: Exception: NomeGrande
	nomeGrandeErro: .asciiz "Nome muito grande!!"
	
	#SubMenus:
	opcaoCliente: .asciiz "Escolha uma opção: \n 1 - Cadastrar um novo Cliente \n 2 - Remover um Cliente \n 3 - Atualizar informações de um cliente \n 4 - Visualizar informações de um cliente \n 5 - Fazer reserva para um cliente \n 6 - Retornar para o Menu Principal"
	opcaoCardapio: .asciiz "Escolha uma opção: \n 1 - Adicionar novo prato ao cardápio \n 2 - Retirar um prato do cardápio \n 3 - Editar informações sobre um prato \n 4 - Vizualizar informações sobre um prato \n 5 - Visualizar Ranking de pratos mais vendidos \n 6 - Retornar para o Menu Principal"
	opcaoFuncionario: .asciiz "Escolha uma opção: \n 1 - Contratar novo funcionário \n 2 - Demitir um funcionário \n 3 - Atualizar informações de um funcionário \n 4 - Visualizar informações de um funcionário \n 5 - Calcular folha de pagamento \n 6 - Retornar para o Menu Principal"
	opcaoMesa: .asciiz "Escolha uma opção: \n 1 - Adicionar Mesa \n 2 - Retirar Mesa \n 3 - Mudar status da mesa \n 4 - Visualizar informações de uma Mesa \n 5 - Confirmar Reserva \n 6 - Limpar uma mesa \n 7 - Retornar para o Menu principal"
	opcaoPedido: .asciiz "Escolha uma opção: \n 1 - Registrar um pedido \n 2 - Apagar(Cancelar) um pedido \n 3 - Refazer um pedido \n 4 - Visualizar um pedido \n 5 - Gerar lista de pedidos em determinado período de tempo \n 6 - Calcular Lucro dos pedidos em determinado período de tempo \n 7 - Completar pedido \n 8 - Retornar para o Menu Principal"
	#fim dos subMenus.
	
	#Parametros (labels de pedido):
	#Prato (Cadastro)
	digiteNomePrato: .asciiz "Digite o nome do Prato: "
	digitePrecoPrato: .asciiz "Digite o preço do Prato: "  
	
	#Parametros (Labels de armazenamento)
	#Prato (Cadastro)
	nomePrato: .space 20
	
	
.text
Main:
#----------------------------------Menu Principal---------------------------------------------------------------------------------------------------
	la $t0, titulo 		#Carrega o menu
	jal escolha		#Função para mostrar o menu e escolher a opção [ escolha(titulo) ]
	addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $t2, $zero, 5	#Parâmetro pra saber se a opção escolhida é menor ou igual a 5
	jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 5 [ verificacao(0, 5) ]
	j subMenu
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	j exit			#Fim da execução
	
#------------------------------Função de seleçãod e menu escolha(string texto) return int escolhido---------------------------------------------------	
escolha: 	addi $v0, $zero, 51	#Configurando a syscall para lançar tela de escolha
		la $a0, ($t0)		#Carregando o "texto" da tela de escolha
	 	syscall			#Syscall da tela
	 	jr $ra			#Fim da função
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-----------------------------------------------Printf		[void printf(String texto)]	----------------------------------------------------------------------------------------------
printf:	add $v0, $zero, $t0	#Escolha do tipo de tela do printf	
	syscall			#Chamada da tela
	jr $ra			#Fim da função
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------Verifica se a opção selecionada é inválida [ verificacao(int inicio, int fim, int escolhido) return void]------------------------------------------------------------------------
verificacao:  	bgt $t1, $a1, dadosInvalidos 	#Verifica se o usuario fez um opção válida (Não enviou nada, apertou cancelar ou mandou um não inteiro)
		bgt $a0, $t2, dadosInvalidos	#Verifica se a opção escolhida está dentro do número máximo de escolhas possivel (a0 > t2? se sim erro)
		bgt $t1, $a0 dadosInvalidos	#Verifica se a opção escolida está dentro do número minimo de escolhas possivel (t1 > a0? se sim então erro)
		sub $t2, $t2, $t2		#Colocando t2 para ter o valor 0 novamente
		jr $ra				#Caso tudo esteja ok, o programa continua funcionando
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#------------------------------------Verifica se a string colocada está correta--------------------------------------------------------------------
verificacaoString:	beq $a1, 0, ok			#Se $a1 for 0, retorna pro fluxo do código
			bgt $a1, 4, nomeGrande		#Se $a1 for 4, lança exception NomeGrande
			beq $a1, 2, dadosInvalidos	#Se $a1 for 2, lança exception DadosInvalidos
			beq $a1, 3, dadosInvalidos	#Se $a1 for 2, lança exception DadosInvalidos
			jr $ra				#Se tudo estiver ok, volta pro fluxo do código

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------Erro: Opção selecionada é inválida!!!----------------------------------------------------------------------------
dadosInvalidos: 	addi $a1, $zero, 2		#Escolhendo tela de erro
			la $a0, error			#Carregando a label que diz o erro
			addi $t0, $zero, 55		#Escolhendo a tela de mensagens
			sub $t2, $t2, $t2		#Colocando t2 para ter o valor 0 novamente
			jal printf			#Chamando o print [ printf( error) ]
			j Main				#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Erro: Nome muito grande!!!--------------------------------------------------------------------------
nomeGrande:		addi $a1, $zero, 2		#Escolhendo tela de erro
			la $a0, nomeGrandeErro		#Carregando a label que diz o erro
			addi $t0, $zero, 55		#Escolhendo a tela de mensagens
			sub $t2, $t2, $t2		#Colocando t2 para ter o valor 0 novamente
			jal printf			#Chamando o print [ printf( error) ]
			j Main				#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------Verificar menu escolhido (verifica qual foi a escolha de sub menu) ------------------------------------------------
subMenu:	beq $a0, 1, menuCliente		#Menu do cliente foi escolhido
		beq $a0, 2, menuPrato		#Menu do cardápio foi escolhido
		beq $a0, 3, menuFuncionario	#Menu do funcionário foi escolhido
		beq $a0, 4, menuMesa		#Menu das mesas foi escolhido
		beq $a0, 5, menuPedidos		#Menu dos pedidos foi escolhido

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Clientes------------------------------------------------------------------------------------
menuCliente: 	la $t0, opcaoCliente	#Carrega o menu do cliente
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoCliente) ]
		addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $t2, $zero, 6	#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		j Main			#Fim das operações com o cliente(s)
		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Pratos (Cárdapio)------------------------------------------------------------------------------------
menuPrato: 	la $t0, opcaoCardapio	#Carrega o menu dos pratos
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoCardapio) ]
		addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $t2, $zero, 6	#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		add $t3, $t3, $a0	#Adicionando a opção escolhida para um registrador temporario
		jal acaoPrato		#Chamando a função de verificação de escolha
		j Main			#Fim das operações com o cardapio
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Funcionario------------------------------------------------------------------------------------
menuFuncionario: 	la $t0, opcaoFuncionario	#Carrega o menu do funcionario
			jal escolha			#Função para mostrar o menu e escolher a opções [ escolha(opcaoFuncionario) ]
			addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
			addi $t2, $zero, 6		#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
			jal verificacao			#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
			j Main				#Fim das operações com o funcionario(s)
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Mesas------------------------------------------------------------------------------------
menuMesa: 	la $t0, opcaoMesa	#Carrega o menu das mesas
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoMesa) ]
		addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $t2, $zero, 7	#Parâmetro pra saber se a opção escolhida é menor ou igual a 7
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 7 [ verificacao(0, 7) ]
		j Main			#Fim das operações com as mesas
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Pedidos------------------------------------------------------------------------------------
menuPedidos: 	la $t0, opcaoPedido	#Carrega o menu de Pedidos
		jal escolha		#Função para mostrar o menu e escolher as opções [ escolha(opcaoPedido) ]
		addi $t1, $t1, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $t2, $zero, 8	#Parâmetro pra saber se a opção escolhida é menor ou igual a 8
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 8 [ verificacao(0, 8) ]
		j Main			#Fim das operações com os Pedidos
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Chamar janela de string--------------------------------------------------------------------------
chamarJanelaString: 	addi $v0, $zero, 54
			la $a0, ($t2)
			la $a1, ($t3)
			add $a2, $zero, $t4
			syscall
			jr $ra

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Cadastrar Prato----------------------------------------------------------------------------------
acaoPrato:	beq $t3, 1, funcaoCadastrarPrato	#Chamada da função de cadastro de prato escolhida
		beq $t3, 2, funcaoRemoverPrato		#Chamada da funcao de remoção de pratos escolhida
		beq $t3, 3, funcaoEditarPrato		#Chamada da função de edição de pratos escolhida
		beq $t3, 4, funcaoVisualizarPrato	#Chamada da função de uso/visualização de pratos escolhida
		beq $t3, 5, funcaoRankingPratos        #Chamada da função de ranking de Pratos escolhida
		beq $t3, 6, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#-------------------------------------------------Cadastrar Prato----------------------------------------------------------------------------------
funcaoCadastrarPrato: 	la $t2, digiteNomePrato
			la $t3, nomePrato
			addi $t4, $zero, 10
			jal chamarJanelaString
			jal verificacaoString
			la $a0, digitePrecoPrato
			addi $v0, $zero, 53
			syscall
			bgt $a1, 0, dadosInvalidos
			j exit
			
			
			
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Remover Prato----------------------------------------------------------------------------------
funcaoRemoverPrato: 
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Editar Prato----------------------------------------------------------------------------------
funcaoEditarPrato: 
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Visualizar Prato----------------------------------------------------------------------------------
funcaoVisualizarPrato: 
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Ranking Pratos----------------------------------------------------------------------------------
funcaoRankingPratos: 
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Voltar pro main menu----------------------------------------------------------------------------------
retornaMain: 
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

ok: jr $ra

exit: nop
	
