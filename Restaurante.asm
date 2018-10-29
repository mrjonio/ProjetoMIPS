.data
	#Menu Principal:
	titulo: .asciiz "Escolha uma opção \n 1 - Clientes \n 2 - Pratos \n 3 - Funcionarios \n 4 - Mesa \n 5 - Pedidos \n"
	
	#Label: Exception: DadoInvalido
	error: .asciiz "Dados inválidos!!!"
	
	#Label: Exception: NomeGrande
	nomeGrandeErro: .asciiz "Nome muito grande!!"
	
	#Label: Exception: ArquivoNãoEncontrado
	arquivoNaoEncontradoErro: .asciiz "Arquivo não encontrado!!"
	
	#Label: Exception: NãoEncontrado
	naoEncontradoErro: .asciiz "Objeto não encontrado no sistema!!"
	
	#Label: Exception: PratoJáCadastrado
	pratoJaExisteErro: .asciiz "Prato já cadastrado!!"
	
	#Label: Sucesso
	acaoBemSucedida: .asciiz "Operação finalizada com sucesso!!"
	
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
	pratoGuardar: .space 2
	nomePrato: .space 20
	nomePratoProucurado: .space 20
	precoPrato: .space 20

	#Nomes dos arquivos
	#Cardápio
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
	
	#Labels auxiliares
	virgula: .asciiz ";"
	quebraLinha: .asciiz "\r\n"
	espaco: .asciiz " "
		
	
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

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
#------------------------------Função de seleção de menu escolha(string texto) return int escolhido---------------------------------------------------	
escolha: 	addi $v0, $zero, 51	#Configurando a syscall para lançar tela de escolha
	 	syscall			#Syscall da tela
	 	add $v0, $zero, $a0	#Passando o retorno da função
	 	add $v1, $zero, $a1	#Passando o retorno do status da função
	 	jr $ra			#Fim da função
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-----------------------------------------------------Abrir arquivo-------------------------------------------------------------------------------
abrirArquivo:	addi $v0, $zero, 13 	#Configurando a chamada da syscall que abre o arquivo
		syscall			#Syscall da abertura de arquivo
		add $s0, $zero, $v0
		add $a0, $zero, $s0	#Passando o resultado da chamada para a0, para ser verificado se o arquivo existe
		j verificacaoArquivo	#Chamada da função que verifica se o arquivo 
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Guarda em Arquivo------------------------------------------------------------------------------------------------
guardarEmArquivo:	addi $v0, $zero, 15	#Seleciona a opção de escrita em arquivo
			syscall			#Chama a syscall para guardar no arquivo
			jr $ra			#Volta pro fluxo normal do código
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------ler do Arquivo------------------------------------------------------------------------------------------------
lerDoArquivo:	addi $a2, $zero, 1			#Quantidade de caracteres que vão ser lidos por vez
		addi $v0, $zero, 14			#Seleciona a opção de leitura em arquivo
		syscall					#Chama a syscall para guardar no arquivo
		
		blt $v0, $zero, arquivoNaoEncontrado  	# Se v0 < 0 teve erro
		jr $ra					#Volta pro fluxo normal do código
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------------------Fechar arquivo--------------------------------------------------------------------------
fecharArquivo:		addi $v0, $zero, 16	#Seleciona a opçãod e fechar o arquivo
			syscall			#Chama a syscall para fechar o arquivo
			jr $ra			#Volta pro fluxo normal do código
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------------Buscar prato-----------------------------------------------------------------------------
buscaPrato:		la $a0, arqCard					#Parâmetro com o nome do arquivo do cárdapio
			add $a1, $zero, $zero				#Especificando que quero ler o arquivo
			add $a2, $zero, $zero 				#Não sei o que é mode
			jal abrirArquivo				#Chamada da função de abrir arquivo
			add $s0, $v0, $zero				#Pegando o arquivo retornado
			add $a0, $zero, $s0				#Salvando arquivo como parâmetro para editar o prato escolhido
			add $a3, $zero, $zero
			la $s1, nomePratoProucurado			#Carrega o nome do prato que está sendo proucurado
			j procedimentoBusca
			
					
procedimentoBusca:	beq $v0, $zero, objetoNaoEncontrado    	# se v0 == 0 achou fim do arquivo
			la $a1, pratoGuardar				#Especificando onde os caracteres vão estar
			add $t0, $zero, $a2
			add $a2, $zero, $zero 				#Não sei o que é mode
			jal lerDoArquivo				#Chamada da funçãod e ler o arquivo
			beq $a3, 22, pratoEncontrado			#Condição, if a3 == 22, então encontrou o prato
			la $s2, pratoGuardar				#Carrega o caracter lido
			addi $a3, $a3, 1				#Incrementa o valor de a3 (pra marcar onde tá o maldito prato)
			add $a2, $zero, $t0
			addi $a2, $a2, 1
			addi $sp, $sp, -1				#Liberando espaço na pilha
			lb $t1, ($s1)
			lb $t2, ($s2)
			addi $s1, $s1, 1
			sb $sp, ($s2)					#Guardando cada caracter na pilha
			beq $t2, $t1, procedimentoBusca			#Verifica se o caracter lido é o mesmo da posição i do nome do prato, se sim avança pro próximo car
			sub $s1, $s1, $a2
			sub $a2, $a2, $a2 				#Se não for o mesmo, zero o indice e recomeça
			j procedimentoBusca				#Recomeça com a próxima iteração
			
pratoEncontrado: 	jal fecharArquivo				#Chamando função pra fechar arquivo
			addi $a3, $a3, 12
			addi $sp, $sp, 22
			addi $sp, $sp, -33
			add $a0, $zero, $zero
			la $s1, espaco
			j excluirPratoAntigo

excluirPratoAntigo:	beq $a0, $a3, editandoNoArquivo
			sb $sp, ($s1)
			addi $a0, $a0, 1
			j excluirPratoAntigo

editandoNoArquivo:	la $a0, arqCard			#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			add $a0, $zero, $s0		#Colocando FD como argumento

guardarDadosAntigos:	beq $a3, $zero, finalizarEdicao
			lb $a1, 0($sp)
			add $a2, $zero, 2		#Escolhendo a quantidade máxima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando função para guardar o nome do prato no arquivo
			j guardarDadosAntigos
			addi $sp, $sp, 1

finalizarEdicao: 	jal fecharArquivo
			j armazenamentoPrato
			
			j exit

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
			la $a0, arquivoNaoEncontradoErro	#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Erro: Objeto não encontrado!!----------------------------------------------------------------------
objetoNaoEncontrado:	addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, naoEncontradoErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#---------------------------------------------Erro: Prato já cadastrado!!----------------------------------------------------------------------
pratoJaCadastrado:	jal fecharArquivo
			addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, pratoJaExisteErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#---------------------------------------------Sucesso: Ação concluida!---------------------------------------------------------------------
telaSucesso:		addi $a1, $zero, 1			#Escolhendo tela de erro
			la $a0, acaoBemSucedida			#Carregando a label que diz sucesso
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( sucesso) ]
			j Main					#Fim 
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Verificar menu escolhido (verifica qual foi a escolha de sub menu) ------------------------------------------------
subMenu:	beq $a0, 1, menuCliente		#Menu do cliente foi escolhido
		beq $a0, 2, menuPrato		#Menu do cardápio foi escolhido
		beq $a0, 3, menuFuncionario	#Menu do funcionário foi escolhido
		beq $a0, 4, menuMesa		#Menu das mesas foi escolhido
		beq $a0, 5, menuPedidos		#Menu dos pedidos foi escolhido
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Clientes------------------------------------------------------------------------------------
menuCliente: 	la $a0, opcaoCliente	#Carrega o menu do cliente
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoCliente) ]
		add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $a1, $zero, 6	#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		jal escolhacliente
		j Main			#Fim das operações com o cliente(s)
		
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
funcaoCadastrarPrato: 	la $a0, digiteNomePrato			#Carrega a label do nome do prato
			la $a1, nomePrato			#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado
			la $a0, digitePrecoPrato		#Carrega a label do preco do prato
			la $a1, precoPrato			#Carrega a label que vai armazenar o preco do prato
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verificando o preco do prato?
			j existenciaPratoCadastro		#Vai pra função que verifica se o prato já foi cadastrado antes
			
existenciaPratoCadastro:	la $a0, arqCard					#Parâmetro com o nome do arquivo do cárdapio
				add $a1, $zero, $zero				#Especificando que quero ler o arquivo
				add $a2, $zero, $zero 				#Não sei o que é mode
				jal abrirArquivo				#Chamada da função de abrir arquivo
				add $s0, $v0, $zero				#Pegando o arquivo retornado
				add $a0, $zero, $s0				#Salvando arquivo como parâmetro para editar o prato escolhido
				add $a3, $zero, $zero				#Inicializando a condição de parada
				la $s1, nomePrato				#Carrega o nome do prato que está sendo proucurado
				j procedimentoBuscaCPrato
			
					
procedimentoBuscaCPrato:	beq $v0, $zero, armazenamentoPrato	    	# se v0 == 0 achou fim do arquivo, então o prato não foi cadastrado
				la $a1, pratoGuardar				#Especificando onde os caracteres vão estar
				beq $a3, 20, pratoJaCadastrado			#Condição, if a3 == 22, então encontrou o prato
				add $t0, $zero, $a2				#Salvando o indice atual (caso os caracteres estejam sendo iguais)
				addi $a2, $zero, 1 				#Quantidade de caracteres lidos
				jal lerDoArquivo				#Chamada da função de ler o arquivo
				la $s2, pratoGuardar				#Carrega o caracter lido
				addi $a3, $a3, 1				#Incrementa o valor de a3 pra saber se o prato foi encontrado
				add $a2, $zero, $t0				#Volta o valor do indice para a2
				lb $t1, ($s1)					#Carrega o caracter de indice a2 do nome passado
				lb $t2, ($s2)					#Carrega o caracter lido do arquivo
				addi $a2, $a2, 1				#Incrementa o indice 
				addi $s1, $s1, 1				#incrementa o indice de s1 pra pegar o proximo caracter do nome passado
				beq $t2, $t1, procedimentoBuscaCPrato		#Verifica se o caracter lido é o mesmo da posição a2 do nome do prato, se sim avança pro próximo car
				sub $s1, $s1, $a2				#Se os caracteres forem diferentes, zero o indice do nome do prato
				sub $a2, $a2, $a2 				#Se não for o mesmo, zero o indice e recomeça
				sub $a3, $a3, $a3			#Condição, if a3 == 22, então encontrou o prato
				j procedimentoBuscaCPrato			#Recomeça com a próxima iteração
			
armazenamentoPrato:	jal fecharArquivo
			la $a0, arqCard			#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			add $a0, $zero, $s0		#Colocando FD como argumento
			la $a1, nomePrato		#Passar o nome do prato como parâmetro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando função para guardar o nome do prato no arquivo
			la $a1, virgula			#Passar o ponto e virgula como parâmetro
			add $a2, $zero, 1		#Escolhendo a quantidade máxima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando função para guardar o ponto e virgula
			la $a1, precoPrato		#Passando o preco do prato como parâmetro para guardar no arquivo
			add $a2, $zero, 10		#Escolhendo a quantidade máxima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando função para guardar o preco do prato no arquivo
			la $a1, quebraLinha		#Passar a quebra de linha como parâmetro para indicar que o objeto rpato foi armazenado
			add $a2, $zero, 2		#Escolhendo a quantidade máxima de caracteres para a quebra de linha
			jal guardarEmArquivo		#Chamando função para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando função pra fechar arquivo
			j telaSucesso			#Cadastro bem sucedido
			j exit				
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Remover Prato----------------------------------------------------------------------------------
funcaoRemoverPrato: la $t2, digiteNomePrato	
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Editar Prato----------------------------------------------------------------------------------
funcaoEditarPrato: 	la $a0, digiteNomePrato				#Carrega a label do nome do prato
			la $a1, nomePratoProucurado			#Carrega a label que vai armazenar o nome do prato proucurado
			addi $a2, $zero, 20				#Define a quantidade máxima de caracteres
			jal chamarJanelaString				#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0				#Adicionando o que estava em v0 para a0
			jal verificacaoString				#Verifica se está tudo ok com o que foi digitado
			la $a0, digitePrecoPrato			#Carrega a label do nome do prato
			la $a1, precoPrato				#Carrega a label que vai armazenar o nome do prato proucurado
			addi $a2, $zero, 10				#Define a quantidade máxima de caracteres
			jal chamarJanelaString				#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0				#Adicionando o que estava em v0 para a0
			jal verificacaoString				#Verifica se está tudo ok com o que foi digitado
			j buscaPrato

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Visualizar Prato----------------------------------------------------------------------------------
funcaoVisualizarPrato: 
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Ranking Pratos----------------------------------------------------------------------------------
funcaoRankingPratos: 
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#===========================================================FIM DO CÁRDAPIO=======================================================================

#===========================================================CLIENTE===============================================================================
#-------------------------------------------------ESCOLHA----------------------------------------------------------------------------------
escolhacliente:	beq $a2, 1, cadastrarCliente		#Chamada da função de cadastro de cliente escolhida
		beq $a2, 2, removerCliente		#Chamada da funcao de remoção de cliente escolhida
		beq $a2, 3, editarCliente		#Chamada da função de edição de cliente escolhida
		beq $a2, 4, visualizarCliente		#Chamada da função de visualização de cliente escolhida
		beq $a2, 5, cadastrarReserva	        #Chamada da função de cadastrar reserva escolhida
		beq $a2, 6, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Cadastrar Cliente------------------------------------------------------------------------------------
cadastrarCliente: 	la $a0, digitenome		#Carrega a label do nome do cliente
			la $a1, nome			#Carrega a label que vai armazenar o nome do cliente
			addi $a2, $zero, 20		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se está tudo ok com o que foi digitado
			la $a0, digitecpf	
			la $a1, cpf	
			addi $a2, $zero, 20		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString				
			la $a0, arqClien		#Parâmetro com o nome do arquivo do cliente
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $a0, $v0, $zero		#Pegando o arquivo retornado
			la $a1, cpf			#Passar o nome do cliente como parâmetro
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar o novo prato no 
			la $a1, nome			#Passar o nome do cliente como parâmetro
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando função pra fechar arquivo
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
ok: jr $ra	#Temporário!

exit: nop
	
