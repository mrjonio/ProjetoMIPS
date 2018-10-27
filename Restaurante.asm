.data
	#Menu Principal:
	titulo: .asciiz "Escolha uma op��o \n 1 - Clientes \n 2 - Pratos \n 3 - Funcionarios \n 4 - Mesa \n 5 - Pedidos \n"
	
	#Label: Exception: DadoInvalido
	error: .asciiz "Dados inv�lidos!!!"
	
	#Label: Exception: NomeGrande
	nomeGrandeErro: .asciiz "Nome muito grande!!"
	
	#Label: Exception: ArquivoN�oEncontrado
	arquivoNaoEncontradoErro: .asciiz "Arquivo n�o encontrado!!"
	
	#SubMenus:
	opcaoCliente: .asciiz "Escolha uma op��o: \n 1 - Cadastrar um novo Cliente \n 2 - Remover um Cliente \n 3 - Atualizar informa��es de um cliente \n 4 - Visualizar informa��es de um cliente \n 5 - Fazer reserva para um cliente \n 6 - Retornar para o Menu Principal"
	opcaoCardapio: .asciiz "Escolha uma op��o: \n 1 - Adicionar novo prato ao card�pio \n 2 - Retirar um prato do card�pio \n 3 - Editar informa��es sobre um prato \n 4 - Vizualizar informa��es sobre um prato \n 5 - Visualizar Ranking de pratos mais vendidos \n 6 - Retornar para o Menu Principal"
	opcaoFuncionario: .asciiz "Escolha uma op��o: \n 1 - Contratar novo funcion�rio \n 2 - Demitir um funcion�rio \n 3 - Atualizar informa��es de um funcion�rio \n 4 - Visualizar informa��es de um funcion�rio \n 5 - Calcular folha de pagamento \n 6 - Retornar para o Menu Principal"
	opcaoMesa: .asciiz "Escolha uma op��o: \n 1 - Adicionar Mesa \n 2 - Retirar Mesa \n 3 - Mudar status da mesa \n 4 - Visualizar informa��es de uma Mesa \n 5 - Confirmar Reserva \n 6 - Limpar uma mesa \n 7 - Retornar para o Menu principal"
	opcaoPedido: .asciiz "Escolha uma op��o: \n 1 - Registrar um pedido \n 2 - Apagar(Cancelar) um pedido \n 3 - Refazer um pedido \n 4 - Visualizar um pedido \n 5 - Gerar lista de pedidos em determinado per�odo de tempo \n 6 - Calcular Lucro dos pedidos em determinado per�odo de tempo \n 7 - Completar pedido \n 8 - Retornar para o Menu Principal"
	#fim dos subMenus.
	
	#Parametros (labels de pedido):
	#Prato (Cadastro)
	digiteNomePrato: .asciiz "Digite o nome do Prato: "
	digitePrecoPrato: .asciiz "Digite o pre�o do Prato: "  
	
	#Parametros (Labels de armazenamento)
	#Prato (Cadastro)
	nomePrato: .space 20
	
	#Nomes dos arquivos
	#Card�pio
	arqCard: .asciiz "cardapio.txt"
	
	#Parametros (labels de cliente):
	#Cliente (Cadastro)
	
	digitenome: .asciiz "Digite o nome do cliente: \n"
	digitecpf: .asciiz "Digite o CPF do cliente:: \n"
	digitepreferencia: .asciiz "Digite a preferencia do cliente: \n"
	
	#Parametros (Labels de armazenamento)
	#Cliente (Cadastro)
	nome: .space 20
	cpf: .space 20
	preferencia: .space 20
	
	#Nomes dos arquivos
	#Cliente
	arqClien: .asciiz "cliente.txt"
		
	
.text
Main:
#----------------------------------Menu Principal---------------------------------------------------------------------------------------------------
	la $a0, titulo 		#Carrega o menu
	jal escolha		#Fun��o para mostrar o menu e escolher a op��o [ escolha(titulo) ]
	add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
	add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
	addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
	addi $a1, $zero, 5	#Par�metro pra saber se a op��o escolhida � menor ou igual a 5
	jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 5 [ verificacao(0, 5) ]
	add $a0, $zero, $v0	#Par�metro para verificar qual o subMenu escolhido
	j subMenu		#Fun��o apra verificar o submenu escolhido
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	j exit			#Fim da execu��o

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
#------------------------------Fun��o de sele��o de menu escolha(string texto) return int escolhido---------------------------------------------------	
escolha: 	addi $v0, $zero, 51	#Configurando a syscall para lan�ar tela de escolha
	 	syscall			#Syscall da tela
	 	add $v0, $zero, $a0	#Passando o retorno da fun��o
	 	add $v1, $zero, $a1	#Passando o retorno do status da fun��o
	 	jr $ra			#Fim da fun��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-----------------------------------------------------Abrir arquivo-------------------------------------------------------------------------------
abrirArquivo:	addi $v0, $zero, 13 	#Configurando a chamada da syscall que abre o arquivo
		syscall			#Syscall da abertura de arquivo
		add $a0, $zero, $v0	#Passando o resultado da chamada para a0, para ser verificado se o arquivo existe
		j verificacaoArquivo	#Chamada da fun��o que verifica se o arquivo 
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Guarda em Arquivo------------------------------------------------------------------------------------------------
guardarEmArquivo:	addi $v0, $zero, 15	#Seleciona a op��o de escrita em arquivo
			syscall			#Chama a syscall para guardar no arquivo
			jr $ra			#Volta pro fluxo normal do c�digo
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------------------Fechar arquivo--------------------------------------------------------------------------
fecharArquivo:		addi $v0, $zero, 16	#Seleciona a op��od e fechar o arquivo
			syscall			#Chama a syscall para fechar o arquivo
			jr $ra			#Volta pro fluxo normal do c�digo
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-----------------------------------------------Printf		[void printf(String texto)]	----------------------------------------------------------------------------------------------
printf:	add $v0, $zero, $a2	#Escolha do tipo de tela do printf	
	syscall			#Chamada da tela
	jr $ra			#Fim da fun��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------Verifica se o arquivo existe------------------------------------------------------------------------------
verificacaoArquivo:	blt $a0, 0, arquivoNaoEncontrado	#Caso a0 seja negativo, significa que o arquivo n�o foi encontrado e lan�a o erro
			add $v0, $zero, $a0			#Caso a0 n�o seja negativo, passamos o retorno da fun��o (arquivo) para v0
			jr $ra					#Volta pro fluxo normal do programa
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------Verifica se a op��o selecionada � inv�lida [ verificacao(int inicio, int fim, int escolhido) return void]------------------------------------------------------------------------
verificacao:  	beq $a3, 2, exit
		bgt $a0, $a3, dadosInvalidos 	#Verifica se o usuario fez um op��o v�lida (N�o enviou nada, apertou cancelar ou mandou um n�o inteiro)
		bgt $a2, $a1, dadosInvalidos	#Verifica se a op��o escolhida est� dentro do n�mero m�ximo de escolhas possivel (a0 > t2? se sim erro)
		bgt $a0, $a2 dadosInvalidos	#Verifica se a op��o escolida est� dentro do n�mero minimo de escolhas possivel (t1 > a0? se sim ent�o erro)
		jr $ra				#Caso tudo esteja ok, o programa continua funcionando
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#------------------------------------Verifica se a string colocada est� correta--------------------------------------------------------------------
verificacaoString:	beq $a0, 0, ok			#Se $a1 for 0, retorna pro fluxo do c�digo
			bgt $a0, 4, nomeGrande		#Se $a1 for 4, lan�a exception NomeGrande
			beq $a0, 2, dadosInvalidos	#Se $a1 for 2, lan�a exception DadosInvalidos
			beq $a0, 3, dadosInvalidos	#Se $a1 for 2, lan�a exception DadosInvalidos
			jr $ra				#Se tudo estiver ok, volta pro fluxo do c�digo

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------Erro: Op��o selecionada � inv�lida!!!----------------------------------------------------------------------------
dadosInvalidos: 	addi $a1, $zero, 2		#Escolhendo tela de erro
			la $a0, error			#Carregando a label que diz o erro
			addi $a2, $zero, 55		#Escolhendo a tela de mensagens
			jal printf			#Chamando o print [ printf( error) ]
			j Main				#Fim do tratamento da exce��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Erro: Nome muito grande!!!--------------------------------------------------------------------------
nomeGrande:		addi $a1, $zero, 2		#Escolhendo tela de erro
			la $a0, nomeGrandeErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55		#Escolhendo a tela de mensagens
			jal printf			#Chamando o print [ printf( error) ]
			j Main				#Fim do tratamento da exce��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Erro: Arquivo n�o encontrado!!----------------------------------------------------------------------
arquivoNaoEncontrado:	addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, arquivoNaoEncontradoErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exce��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Verificar menu escolhido (verifica qual foi a escolha de sub menu) ------------------------------------------------
subMenu:	beq $a0, 1, menuCliente		#Menu do cliente foi escolhido
		beq $a0, 2, menuPrato		#Menu do card�pio foi escolhido
		beq $a0, 3, menuFuncionario	#Menu do funcion�rio foi escolhido
		beq $a0, 4, menuMesa		#Menu das mesas foi escolhido
		beq $a0, 5, menuPedidos		#Menu dos pedidos foi escolhido
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Clientes------------------------------------------------------------------------------------
menuCliente: 	la $a0, opcaoCliente	#Carrega o menu do cliente
		jal escolha		#Fun��o para mostrar o menu e escolher a op��es [ escolha(opcaoCliente) ]
		add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
		addi $a1, $zero, 6	#Par�metro pra saber se a op��o escolhida � menor ou igual a 6
		jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 6 [ verificacao(0, 6) ]
		jal escolhacliente
		j Main			#Fim das opera��es com o cliente(s)
		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Pratos (C�rdapio)------------------------------------------------------------------------------------
menuPrato: 	la $a0, opcaoCardapio	#Carrega o menu dos pratos
		jal escolha		#Fun��o para mostrar o menu e escolher a op��es [ escolha(opcaoCardapio) ]
		add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
		addi $a1, $zero, 6	#Par�metro pra saber se a op��o escolhida � menor ou igual a 6
		jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 6 [ verificacao(0, 6) ]
		jal acaoPrato		#Chamando a fun��o de verifica��o de escolha
		j Main			#Fim das opera��es com o cardapio
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Funcionario------------------------------------------------------------------------------------
menuFuncionario: 	la $a0, opcaoFuncionario	#Carrega o menu do funcionario
			jal escolha			#Fun��o para mostrar o menu e escolher a op��es [ escolha(opcaoFuncionario) ]
			add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
			add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
			addi $a0, $zero, 0		#Par�metro pra saber se a op��o escolhido � maior que 0
			addi $a1, $zero, 6		#Par�metro pra saber se a op��o escolhida � menor ou igual a 6
			jal verificacao			#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 6 [ verificacao(0, 6) ]
			j Main				#Fim das opera��es com o funcionario(s)
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Mesas------------------------------------------------------------------------------------
menuMesa: 	la $a0, opcaoMesa	#Carrega o menu das mesas
		jal escolha		#Fun��o para mostrar o menu e escolher a op��es [ escolha(opcaoMesa) ]
		add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
		addi $a1, $zero, 7	#Par�metro pra saber se a op��o escolhida � menor ou igual a 7
		jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 7 [ verificacao(0, 7) ]
		j Main			#Fim das opera��es com as mesas
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Pedidos------------------------------------------------------------------------------------
menuPedidos: 	la $a0, opcaoPedido	#Carrega o menu de Pedidos
		jal escolha		#Fun��o para mostrar o menu e escolher as op��es [ escolha(opcaoPedido) ]
		add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
		addi $a1, $zero, 8	#Par�metro pra saber se a op��o escolhida � menor ou igual a 8
		jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 8 [ verificacao(0, 8) ]
		j Main			#Fim das opera��es com os Pedidos
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Chamar janela de string--------------------------------------------------------------------------
chamarJanelaString: 	addi $v0, $zero, 54	#Escolhe a janela de dialogo de string
			syscall			#Chamada da syscall
			add $v0, $zero, $a1	#Adicionando como retorno o valor da saida (status)
			jr $ra			#Retorno ao fluxo do programa

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#===========================================================CARD�PIO===============================================================================
#-------------------------------------------------Cadastrar Prato----------------------------------------------------------------------------------
acaoPrato:	beq $a2, 1, funcaoCadastrarPrato	#Chamada da fun��o de cadastro de prato escolhida
		beq $a2, 2, funcaoRemoverPrato		#Chamada da funcao de remo��o de pratos escolhida
		beq $a2, 3, funcaoEditarPrato		#Chamada da fun��o de edi��o de pratos escolhida
		beq $a2, 4, funcaoVisualizarPrato	#Chamada da fun��o de uso/visualiza��o de pratos escolhida
		beq $a2, 5, funcaoRankingPratos        #Chamada da fun��o de ranking de Pratos escolhida
		beq $a2, 6, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#-------------------------------------------------Cadastrar Prato----------------------------------------------------------------------------------
funcaoCadastrarPrato: 	la $a0, digiteNomePrato		#Carrega a label do nome do prato
			la $a1, nomePrato		#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 10		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se est� tudo ok com o que foi digitado
			la $a0, digitePrecoPrato	#Carrega a label do preco do prato
			addi $v0, $zero, 53		#Seleciona a tela de chamada para armazenamento de double
			syscall				#Chamada da syscall :)
			bgt $a1, 0, dadosInvalidos	#Verifica se o n�mero passado � valido
			la $a0, arqCard			#Par�metro com o nome do arquivo do c�rdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $a0, $v0, $zero		#Pegando o arquivo retornado
			la $a1, nomePrato		#Passar o nome do prato como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando fun��o pra fechar arquivo
			j exit				
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Remover Prato----------------------------------------------------------------------------------
funcaoRemoverPrato: la $t2, digiteNomePrato	
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
#===========================================================FIM DO C�RDAPIO=======================================================================

#===========================================================CLIENTE===============================================================================
#-------------------------------------------------ESCOLHA----------------------------------------------------------------------------------
escolhacliente:	beq $a2, 1, cadastrarCliente		#Chamada da fun��o de cadastro de cliente escolhida
		beq $a2, 2, removerCliente		#Chamada da funcao de remo��o de cliente escolhida
		beq $a2, 3, editarCliente		#Chamada da fun��o de edi��o de cliente escolhida
		beq $a2, 4, visualizarCliente		#Chamada da fun��o de visualiza��o de cliente escolhida
		beq $a2, 5, cadastrarReserva	        #Chamada da fun��o de cadastrar reserva escolhida
		beq $a2, 6, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Cadastrar Cliente------------------------------------------------------------------------------------
cadastrarCliente: 	la $a0, digitenome		#Carrega a label do nome do cliente
			la $a1, nome			#Carrega a label que vai armazenar o nome do cliente
			addi $a2, $zero, 20		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se est� tudo ok com o que foi digitado
			la $a0, digitecpf	
			la $a1, cpf	
			addi $a2, $zero, 20		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString				
			la $a0, arqClien		#Par�metro com o nome do arquivo do cliente
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $a0, $v0, $zero		#Pegando o arquivo retornado
			la $a1, cpf			#Passar o nome do cliente como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar o novo prato no 
			la $a1, nome			#Passar o nome do cliente como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando fun��o pra fechar arquivo
			j exit	
	
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Remover Cliente------------------------------------------------------------------------------------
removerCliente:	nop

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Editar Cliente------------------------------------------------------------------------------------
editarCliente:	nop

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Visualizar Cliente------------------------------------------------------------------------------------
visualizarCliente: nop

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Cadastrar reserva do Cliente------------------------------------------------------------------------------------
cadastrarReserva: nop

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Voltar pro main menu----------------------------------------------------------------------------------
retornaMain: j Main		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
ok: jr $ra	#Tempor�rio!

exit: nop
	
