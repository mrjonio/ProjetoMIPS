.data
	#Menu Principal:
	titulo: .asciiz "Escolha uma opção \n 1 - Clientes \n 2 - Pratos \n 3 - Funcionarios \n 4 - Mesa \n 5 - Pedidos \n"
	
	#Label: Exception: DadoInvalido
	error: .asciiz "Dados inválidos!!!"
	
	#Label: Exception: NomeGrande
	nomeGrandeErro: .asciiz "Nome muito grande!!"
	
	#Label: Exception: ArquivoNãoEncontrado
	arquivoNaoEncontradoErro: .asciiz "Arquivo não encontrado!!"
	
	#SubMenus:
	opcaoCliente: .asciiz "Escolha uma opção: \n 1 - Cadastrar um novo Cliente \n 2 - Remover um Cliente \n 3 - Atualizar informações de um cliente \n 4 - Visualizar informações de um cliente \n 5 - Fazer reserva para um cliente \n 6 - Retornar para o Menu Principal"
	opcaoCardapio: .asciiz "Escolha uma opção: \n 1 - Adicionar novo prato ao cardápio \n 2 - Retirar um prato do cardápio \n 3 - Editar informações sobre um prato \n 4 - Vizualizar informações sobre um prato \n 5 - Visualizar Ranking de pratos mais vendidos \n 6 - Retornar para o Menu Principal"
	opcaoFuncionario: .asciiz "Escolha uma opção: \n 1 - Contratar novo funcionário \n 2 - Demitir um funcionário \n 3 - Atualizar informações de um funcionário \n 4 - Visualizar informações de um funcionário \n 5 - Calcular folha de pagamento \n 6 - Retornar para o Menu Principal"
	opcaoMesa: .asciiz "Escolha uma opção: \n 1 - Adicionar Mesa \n 2 - Retirar Mesa \n 3 - Mudar status da mesa \n 4 - Visualizar informações de uma Mesa \n 5 - Confirmar Reserva \n 6 - Limpar uma mesa \n 7 - Retornar para o Menu principal"
	opcaoPedido: .asciiz "Escolha uma opção: \n 1 - Registrar um pedido \n 2 - Apagar(Cancelar) um pedido \n 3 - Refazer um pedido \n 4 - Visualizar um pedido \n 5 - Gerar lista de pedidos em determinado período de tempo \n 6 - Calcular Lucro dos pedidos em determinado período de tempo \n 7 - Completar pedido \n 8 - Retornar para o Menu Principal"
<<<<<<< HEAD
	
	nome: .asciiz "Nome do cliente: \n"
	cpf: .asciiz "CPF do cliente:: \n"
	preferencia: .asciiz "Preferencia do cliente: \n"
	
	limite: .space 50
=======
	#fim dos subMenus.
	
	#Parametros (labels de pedido):
	#Prato (Cadastro)
	digiteNomePrato: .asciiz "Digite o nome do Prato: "
	digitePrecoPrato: .asciiz "Digite o preço do Prato: "  
	
	#Parametros (Labels de armazenamento)
	#Prato (Cadastro)
	nomePrato: .space 20
	
	#Nomes dos arquivos
	#Cardápio
	arqCard: .asciiz "cardapio.txt"
	
	
>>>>>>> c63a0934c0cf1fca90aa8a23db6517493a2949c0
.text
Main:
#----------------------------------Menu Principal---------------------------------------------------------------------------------------------------
	la $a0, titulo 		#Carrega o menu
	jal escolha		#Função para mostrar o menu e escolher a opção [ escolha(titulo) ]
	add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
	add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
	addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $a1, $zero, 5	#Parâmetro pra saber se a opção escolhida é menor ou igual a 5
	jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 5 [ verificacao(0, 5) ]
	add $a0, $zero, $v0	#Parâmetro para verificar qual o subMenu escolhido
	j subMenu		#Função apra verificar o submenu escolhido
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	j exit			#Fim da execução
	
<<<<<<< HEAD
#------------------------------Função de seleçãod e menu escolha(string texto) return int escolhido---------------------------------------------------	
escolha: 	addi $v0, $zero, 51		#Carregando o "texto" da tela de escolha
	 	syscall				#Syscall da tela
	 	jr $ra				#Fim da função
=======
#------------------------------Função de seleção de menu escolha(string texto) return int escolhido---------------------------------------------------	
escolha: 	addi $v0, $zero, 51	#Configurando a syscall para lançar tela de escolha
	 	syscall			#Syscall da tela
	 	add $v0, $zero, $a0	#Passando o retorno da função
	 	add $v1, $zero, $a1	#Passando o retorno do status da função
	 	jr $ra			#Fim da função
>>>>>>> c63a0934c0cf1fca90aa8a23db6517493a2949c0
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-----------------------------------------------------Abrir arquivo-------------------------------------------------------------------------------
abrirArquivo:	addi $v0, $zero, 13 	#Configurando a chamada da syscall que abre o arquivo
		syscall			#Syscall da abertura de arquivo
		add $a0, $zero, $v0	#Passando o resultado da chamada para a0, para ser verificado se o arquivo existe
		j verificacaoArquivo	#Chamada da função que verifica se o arquivo 
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Guarda em Arquivo------------------------------------------------------------------------------------------------
guardarEmArquivo:	addi $v0, $zero, 15	#Seleciona a opção de escrita em arquivo
			syscall			#Chama a syscall para guardar no arquivo
			jr $ra			#Volta pro fluxo normal do código
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------------------Fechar arquivo--------------------------------------------------------------------------
fecharArquivo:		addi $v0, $zero, 16	#Seleciona a opçãod e fechar o arquivo
			syscall			#Chama a syscall para fechar o arquivo
			jr $ra			#Volta pro fluxo normal do código
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-----------------------------------------------Printf		[void printf(String texto)]	----------------------------------------------------------------------------------------------
printf:	add $v0, $zero, $a2	#Escolha do tipo de tela do printf	
	syscall			#Chamada da tela
	jr $ra			#Fim da função
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------Verifica se o arquivo existe------------------------------------------------------------------------------
verificacaoArquivo:	blt $a0, 0, arquivoNaoEncontrado	#Caso a0 seja negativo, significa que o arquivo não foi encontrado e lança o erro
			add $v0, $zero, $a0			#Caso a0 não seja negativo, passamos o retorno da função (arquivo) para v0
			jr $ra					#Volta pro fluxo normal do programa
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------Verifica se a opção selecionada é inválida [ verificacao(int inicio, int fim, int escolhido) return void]------------------------------------------------------------------------
verificacao:  	beq $a3, 2, exit
		bgt $a0, $a3, dadosInvalidos 	#Verifica se o usuario fez um opção válida (Não enviou nada, apertou cancelar ou mandou um não inteiro)
		bgt $a2, $a1, dadosInvalidos	#Verifica se a opção escolhida está dentro do número máximo de escolhas possivel (a0 > t2? se sim erro)
		bgt $a0, $a2 dadosInvalidos	#Verifica se a opção escolida está dentro do número minimo de escolhas possivel (t1 > a0? se sim então erro)
		jr $ra				#Caso tudo esteja ok, o programa continua funcionando
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#------------------------------------Verifica se a string colocada está correta--------------------------------------------------------------------
verificacaoString:	beq $a0, 0, ok			#Se $a1 for 0, retorna pro fluxo do código
			bgt $a0, 4, nomeGrande		#Se $a1 for 4, lança exception NomeGrande
			beq $a0, 2, dadosInvalidos	#Se $a1 for 2, lança exception DadosInvalidos
			beq $a0, 3, dadosInvalidos	#Se $a1 for 2, lança exception DadosInvalidos
			jr $ra				#Se tudo estiver ok, volta pro fluxo do código

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------Erro: Opção selecionada é inválida!!!----------------------------------------------------------------------------
dadosInvalidos: 	addi $a1, $zero, 2		#Escolhendo tela de erro
			la $a0, error			#Carregando a label que diz o erro
			addi $a2, $zero, 55		#Escolhendo a tela de mensagens
			jal printf			#Chamando o print [ printf( error) ]
			j Main				#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Erro: Nome muito grande!!!--------------------------------------------------------------------------
nomeGrande:		addi $a1, $zero, 2		#Escolhendo tela de erro
			la $a0, nomeGrandeErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55		#Escolhendo a tela de mensagens
			jal printf			#Chamando o print [ printf( error) ]
			j Main				#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Erro: Arquivo não encontrado!!----------------------------------------------------------------------
arquivoNaoEncontrado:	addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, arquivoNaoEncontradoErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Verificar menu escolhido (verifica qual foi a escolha de sub menu) ------------------------------------------------
subMenu:	beq $a0, 1, menuCliente		#Menu do cliente foi escolhido
		beq $a0, 2, menuPrato		#Menu do cardápio foi escolhido
		beq $a0, 3, menuFuncionario	#Menu do funcionário foi escolhido
		beq $a0, 4, menuMesa		#Menu das mesas foi escolhido
		beq $a0, 5, menuPedidos		#Menu dos pedidos foi escolhido
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Clientes------------------------------------------------------------------------------------
<<<<<<< HEAD
menuCliente: 	la $t0, opcaoCliente		#Carrega o menu do cliente
		jal escolha			#Função para mostrar o menu e escolher a opções [ escolha(opcaoCliente) ]
		addi $t1, $t1, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $t2, $zero, 6		#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao			#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		jal verificarCliente
		j Main				#Fim das operações com o cliente(s)
=======
menuCliente: 	la $a0, opcaoCliente	#Carrega o menu do cliente
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoCliente) ]
		add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $a1, $zero, 6	#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		j Main			#Fim das operações com o cliente(s)
>>>>>>> c63a0934c0cf1fca90aa8a23db6517493a2949c0
		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Menu Pratos (Cárdapio)------------------------------------------------------------------------------------
menuPrato: 	la $a0, opcaoCardapio	#Carrega o menu dos pratos
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoCardapio) ]
		add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $a1, $zero, 6	#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		jal acaoPrato		#Chamando a função de verificação de escolha
		j Main			#Fim das operações com o cardapio
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Funcionario------------------------------------------------------------------------------------
menuFuncionario: 	la $a0, opcaoFuncionario	#Carrega o menu do funcionario
			jal escolha			#Função para mostrar o menu e escolher a opções [ escolha(opcaoFuncionario) ]
			add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
			add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
			addi $a0, $zero, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
			addi $a1, $zero, 6		#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
			jal verificacao			#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
			j Main				#Fim das operações com o funcionario(s)
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Mesas------------------------------------------------------------------------------------
menuMesa: 	la $a0, opcaoMesa	#Carrega o menu das mesas
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoMesa) ]
		add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $a1, $zero, 7	#Parâmetro pra saber se a opção escolhida é menor ou igual a 7
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 7 [ verificacao(0, 7) ]
		j Main			#Fim das operações com as mesas
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Pedidos------------------------------------------------------------------------------------
menuPedidos: 	la $a0, opcaoPedido	#Carrega o menu de Pedidos
		jal escolha		#Função para mostrar o menu e escolher as opções [ escolha(opcaoPedido) ]
		add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $a1, $zero, 8	#Parâmetro pra saber se a opção escolhida é menor ou igual a 8
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 8 [ verificacao(0, 8) ]
		j Main			#Fim das operações com os Pedidos

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
<<<<<<< HEAD
#--------------------------------------------------Cadastrar Cliente------------------------------------------------------------------------------------
cadastrarCliente: la $t0, nome		#Carrega o nome	
	addi $v0, $zero, 51		#Configurando a syscall para lançar tela de escolha
	la $a0, ($t0)			#Carregando o "texto" da tela de escolha
	syscall				#Syscall da tela
	j digcpf			#Pulo pra exercução da tela CPF
	
digcpf	: la $t1, cpf			#Carrega o CPF
	addi $v0, $zero, 51		#Configurando a syscall para lançar tela de escolha
	la $a0, ($t1)			#Carregando o "texto" da tela de escolha
	syscall				#Syscall da tela
	j pref				#Pulo pra exercução da tela de Preferencia
=======

#-------------------------------------------------Chamar janela de string--------------------------------------------------------------------------
chamarJanelaString: 	addi $v0, $zero, 54	#Escolhe a janela de dialogo de string
			syscall			#Chamada da syscall
			add $v0, $zero, $a1	#Adicionando como retorno o valor da saida (status)
			jr $ra			#Retorno ao fluxo do programa

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#===========================================================CARDÁPIO===============================================================================
#-------------------------------------------------Cadastrar Prato----------------------------------------------------------------------------------
acaoPrato:	beq $a2, 1, funcaoCadastrarPrato	#Chamada da função de cadastro de prato escolhida
		beq $a2, 2, funcaoRemoverPrato		#Chamada da funcao de remoção de pratos escolhida
		beq $a2, 3, funcaoEditarPrato		#Chamada da função de edição de pratos escolhida
		beq $a2, 4, funcaoVisualizarPrato	#Chamada da função de uso/visualização de pratos escolhida
		beq $a2, 5, funcaoRankingPratos        #Chamada da função de ranking de Pratos escolhida
		beq $a2, 6, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#-------------------------------------------------Cadastrar Prato----------------------------------------------------------------------------------
funcaoCadastrarPrato: 	la $a0, digiteNomePrato		#Carrega a label do nome do prato
			la $a1, nomePrato		#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 10		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se está tudo ok com o que foi digitado
			la $a0, digitePrecoPrato	#Carrega a label do preco do prato
			addi $v0, $zero, 53		#Seleciona a tela de chamada para armazenamento de double
			syscall				#Chamada da syscall :)
			bgt $a1, 0, dadosInvalidos	#Verifica se o número passado é valido
			la $a0, arqCard			#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $a0, $v0, $zero		#Pegando o arquivo retornado
			la $a1, nomePrato		#Passar o nome do prato como parâmetro
			add $a2, $zero, 60		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando função pra fechar arquivo
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
#===========================================================FIM DO CÁRDAPIO=======================================================================



#-------------------------------------------------Voltar pro main menu----------------------------------------------------------------------------------
retornaMain: j Main		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

ok: jr $ra	#Temporário!

exit: nop
>>>>>>> c63a0934c0cf1fca90aa8a23db6517493a2949c0
	
pref:	la $t2, preferencia		#Carrega o CPF
	addi $v0, $zero, 51		#Configurando a syscall para lançar tela de escolha
	la $a0, ($t2)			#Carregando o "texto" da tela de escolha
	syscall				#Syscall da tela
	j Main				#Fim das operações com o cadastro cliente			
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


exit: nop