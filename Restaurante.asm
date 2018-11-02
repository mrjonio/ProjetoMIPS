.data
	#Menu Principal:
	titulo: .asciiz "Escolha uma op��o \n 1 - Clientes \n 2 - Pratos \n 3 - Funcionarios \n 4 - Mesa \n 5 - Pedidos \n 6 - Sair"
	
	#Label: Exception: DadoInvalido
	error: .asciiz "Dados inv�lidos!!!"
	
	#Label: Exception: NomeGrande
	nomeGrandeErro: .asciiz "Nome muito grande!!"
	
	#Label: Exception: ArquivoN�oEncontrado
	arquivoNaoEncontradoErro: .asciiz "Arquivo n�o encontrado!!"
	
	#Label: Exception: N�oEncontrado
	naoEncontradoErro: .asciiz "Objeto n�o encontrado no sistema!!"
	
	#Label: Exception: PratoJ�Cadastrado
	pratoJaExisteErro: .asciiz "Prato j� cadastrado!!"
	clienteJaExisteErro: .asciiz "Cliente j� cadastrado!!"
	
	#Label: Sucesso
	acaoBemSucedida: .asciiz "Opera��o finalizada com sucesso!!"
	
	#SubMenus:
	opcaoCliente: .asciiz "Escolha uma op��o: \n 1 - Cadastrar um cliente \n 2 - Remover cliente \n 3 - Editar informa��es sobre um cliente \n 4 - Retornar para o Menu Principal"
	opcaoCardapio: .asciiz "Escolha uma op��o: \n 1 - Adicionar novo prato ao card�pio \n 2 - Retirar um prato do card�pio \n 3 - Editar informa��es sobre um prato \n 4 - Retornar para o Menu Principal"
	opcaoFuncionario: .asciiz "Escolha uma op��o: \n 1 - Contratar novo funcion�rio \n 2 - Demitir um funcion�rio \n 3 - Atualizar informa��es de um funcion�rio \n 4 - Visualizar informa��es de um funcion�rio \n 5 - Calcular folha de pagamento \n 6 - Retornar para o Menu Principal"
	opcaoMesa: .asciiz "Escolha uma op��o: \n 1 - Adicionar Mesa \n 2 - Retirar Mesa \n 3 - Mudar status da mesa \n 4 - Visualizar informa��es de uma Mesa \n 5 - Confirmar Reserva \n 6 - Limpar uma mesa \n 7 - Retornar para o Menu principal"
	opcaoPedido: .asciiz "Escolha uma op��o: \n 1 - Registrar um pedido \n 2 - Retornar para o Menu Principal"
	#fim dos subMenus.
	
	#Parametros (labels de pedido):
	#Prato
	digiteNomePrato: .asciiz "Digite o nome do Prato: "
	digiteNomePratoBuscado: .asciiz "Digite o nome do Prato para editar: "
	digiteNomePratoRemover: .asciiz "Digite o nome do Prato que ser� removido: "
	digitePrecoPrato: .asciiz "Digite o pre�o do Prato: "  
	
	#Pedidos
	digiteNomePratoPedido: .asciiz "Digite o nome do Prato pedido: "
	digiteClienteQuePediu: .asciiz "Digite o cpf do Cliente que pediu: "
	digiteDataPedido: .asciiz "Digite a data do pedido: "
	
	
	#Parametros (Labels de armazenamento)
	#Prato 
	pratoGuardar: .space 2
	nomePrato: .space 20
	nomePratoProucurado: .space 20
	precoPrato: .space 20
	
	#Pedidos
	pratoPedido: .space 20
	clienteQuePediu: .space 20
	dataPedido: .space 20

	#Nomes dos arquivos
	#Card�pio
	arqCard: .asciiz "cardapio.txt"
	arqCard2: .asciiz "cardapioTemp.txt"
	
	arqPed: .asciiz "pedidos.txt"
	arqPed2: .asciiz "pedidosTemp.txt"
	
	#Parametros (labels de cliente):
	#Cliente

	digiteCPFCliente: .asciiz "Digite o CPF do cliente: "
	digiteCPFClienteBuscado: .asciiz "Digite o CPF do Cliente para editar: "
	digiteCPFClienteRemover: .asciiz "Digite o CPF do Cliente que ser� removido: "
	digiteNomeCliente: .asciiz "Digite o nome do Cliente: "
	digitePrefCliente: .asciiz "Digite sua Prefer�ncia: \n Ex: Onivoro ou Vegetariano"
	
	#Parametros (Labels de armazenamento)
	#Cliente
	cpfClienteGuardar: .space 2
	nomeCliente: .space 20
	cpfCliente: .space 20
	prefCliente: .space 20
	cpfClienteProucurado: .space 20
	
	#Nomes dos arquivos
	#Cliente
	arqClien: .asciiz "cliente.txt"
	arqClien2: .asciiz "clienteTemp.txt"
	
	#Parametros (labels de funcionario):
	#Funcionario (Cadastro)
	
	digitenomeFun: .asciiz "Digite o nome do funcionario: \n"
	digitecpffun: .asciiz "Digite o CPF do funcionario:: \n"
	digiteidade: .asciiz "Digite a idade do funcionario: \n"
	digitefuncao: .asciiz "Digite a fun��o: \n - Gerente \n - Cozinheiro \n - Caixa \n - Atendente \n - Motoboy \n - Faxineiro \n - Seguran�a"
	digitesalario: .asciiz "Digite o salario do funcionario: \n"
	
	
	#Parametros (Labels de armazenamento)
	#Funcionario (Cadastro)
	nomeFun: .space 20
	cpffun: .space 20
	idade: .space 20
	funcao: .space 20
	salario: .space 20
	
	#Nomes dos arquivos
	#Funcionario
	arqFun: .asciiz "funcionario.txt"
	
	#Labels auxiliares
	virgula: .asciiz ";"
	quebraLinha: .asciiz "\r\n"
	espaco: .asciiz " "
	byte: .space 2
		
	
.text
Main:
#----------------------------------Menu Principal---------------------------------------------------------------------------------------------------
	la $a0, titulo 		#Carrega o menu
	jal escolha		#Fun��o para mostrar o menu e escolher a op��o [ escolha(titulo) ]
	add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
	add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
	addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
	addi $a1, $zero, 6	#Par�metro pra saber se a op��o escolhida � menor ou igual a 5
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

		add $s3, $zero, $v0
		add $a0, $zero, $s3	#Passando o resultado da chamada para a0, para ser verificado se o arquivo existe
		j verificacaoArquivo	#Chamada da fun��o que verifica se o arquivo 
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Guarda em Arquivo------------------------------------------------------------------------------------------------
guardarEmArquivo:	addi $v0, $zero, 15	#Seleciona a op��o de escrita em arquivo
			syscall			#Chama a syscall para guardar no arquivo
			jr $ra			#Volta pro fluxo normal do c�digo
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------ler do Arquivo------------------------------------------------------------------------------------------------
lerDoArquivo:	addi $a2, $zero, 1			#Quantidade de caracteres que v�o ser lidos por vez
		addi $v0, $zero, 14			#Seleciona a op��o de leitura em arquivo
		syscall					#Chama a syscall para guardar no arquivo
		
		blt $v0, $zero, arquivoNaoEncontrado  	# Se v0 < 0 teve erro
		jr $ra					#Volta pro fluxo normal do c�digo
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------------------Fechar arquivo--------------------------------------------------------------------------
fecharArquivo:		addi $v0, $zero, 16	#Seleciona a op��od e fechar o arquivo
			syscall			#Chama a syscall para fechar o arquivo
			jr $ra			#Volta pro fluxo normal do c�digo
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------------Ler tamanho palavra----------------------------------------------------------------------
stringLen:							#Fun��o para ler a quantidade de caracteres de uma palavra
salvarRetorno0: 	addi $sp, $sp, -4			#Liberando uma palavra na pilha para armazenar o retorno do fluxo
			sw $ra, ($sp)				#Armazenando na pilha o retono para o fluxo normal
			j retornaLenPal				#Indo calcular a quantidade de caracteres do arquivo

retornaLenPal: 		lb $t1, ($s1)				#Carregando o caracter de inidice i da palavra
			beq $t1, 0, compara			#Se o caracter for igual a 0, significa que chegou no espa�o
			addi $a3, $a3, 1			#Cada itera��o, significa que existe mais um caracter no arquivo
			addi $s1, $s1, 1			#Aumentando o indice i
			j retornaLenPal

compara:		addi $s1, $s1, 1			#Aumenta o indice i dnv pra fazer a compara��o
			lb $t2, ($s1)				#Carrega o caracter de indice i + 1 pra ver se ele tbm � espa�o
			beq $t2, 0, retornaFluxo0		#Se i e i + 1 forem espa�os, ent�o j� temos o indice
			j retornaLenPal				#Recome�a com a pr�xima itera��o

retornaFluxo0:		lw $ra, 0($sp)				#Pegando o retorno original do fluxo da pilha
			addi $sp, $sp, 4			#Desalocando o espa�o que foi usado para guardar o retorno na pilha
			add $v0, $zero, $a3			#Adicionando o tamanho do arquivo em v0
			jr $ra					#Voltando ao fluxo normal do c�digo

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#----------------------------------------------------------Contagem de tamanho de arquivo----------------------------------------------------------
salvarRetorno1: 	addi $sp, $sp, -4			#Liberando uma palavra na pilha para armazenar o retorno do fluxo
			sw $ra, ($sp)				#Armazenando na pilha o retono para o fluxo normal
			j retornaLen				#Indo calcular a quantidade de caracteres do arquivo

retornaLen: 		beq $v0, $zero,	retornaFluxo1	   	#se v0 == 0 achou fim do arquivo, posso retornar ao fluxo normal do c�digo
			addi $a3, $a3, 1			#Cada itera��o, significa que existe mais um caracter no arquivo
			jal lerDoArquivo			#Chamada da fun��od e ler o arquivo
			j retornaLen				#Recome�a com a pr�xima itera��o

retornaFluxo1:		lw $ra, 0($sp)				#Pegando o retorno original do fluxo da pilha
			addi $sp, $sp, 4			#Desalocando o espa�o que foi usado para guardar o retorno na pilha
			add $v0, $zero, $a3			#Adicionando o tamanho do arquivo em v0
			jr $ra					#Voltando ao fluxo normal do c�digo

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------------------------------Localizar objeto em arquivo----------------------------------------------------------
BuscarObjeto:
salvarRetorno2: 	sub $a3, $a3, $a3
			addi $sp, $sp, -4			#Liberando uma palavra na pilha para armazenar o retorno do fluxo
			sw $ra, ($sp)				#Armazenando na pilha o retono para o fluxo normal
			j retornaLocalizacao			#Indo calcular a a posicao do objeto no arquivo

			#For (a3 = 0; a3 < arquivo.lenght() || a2 < 20; a3++)
retornaLocalizacao: 	beq $v0, $zero,	objetoNaoEncontrado	# se v0 == 0 achou fim do arquivo, e o objeto n�o existe no arquivo
			add $t3, $zero, $a1
			beq $a2, $a1, retornaFluxo2		#Se todos os caracteres do nome proucurado, s�o iguais a de um obejto do arquivo, ent�o encontrei
			add $t0, $zero, $a2			#Salvando tempor�riamente o indice atual do nome proucurado
			la $a1, byte				#Carregando a label onde o caracter lido do arquivo vai ser armazenado
			add $a2, $zero, $zero 			#N�o sei o que � mode
			jal lerDoArquivo			#Chamada da fun��o de ler o arquivo
			add $a1, $zero, $t3
			add $a2, $zero, $t0			#Pegando o valor original do indice atual do nome do objeto
			addi $a3, $a3, 1			#Incrementando o valor de a3, para saber quantos caracteres existem antes do objeto proucurado
			la $s2, byte
			lb $t1, ($s3)				#Carregando um caracter do nome proucrado (indice $a2)
			lb $t2, ($s2)				#Carregando o caracter lido do arquivo (indice $a3)
			addi $s3, $s3, 1			#Incrementando o caracter do objeto proucurado
			add $a2, $a2, 1				#Incrementando o indice do objeto proucurado
			beq  $t1, $t2, retornaLocalizacao	#Se os caracteres forem iguais, ent�o eu recome�o logo o la�o apra comparar o pr�ximo at� que a2 seja 20
			sub $s3, $s3, $a2			#Se os caracteres n�o forem iguais eu reseto o indice de $s1 e $a2
			sub $a2, $a2, $a2			#Se os caracteres n�o forem iguais eu reseto o indice de $s1 e $a2
			j retornaLocalizacao			#Recome�a com a pr�xima itera��o

retornaFluxo2:		lw $ra, 0($sp)				#Recarrega o retorno original do fluxo do c�digo
			addi $sp, $sp, 4			#Realoca o que foi usado da pilha
			sub $a3, $a3, $a1 			#Retira 20 caracteres do indice original, para saber exatamente onde come�a o objeto
			add $v0, $zero, $a3			#Passa o retorno para v0
			jr $ra					#Retorna ao fluxo original

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------------Buscar prato-----------------------------------------------------------------------------
buscaPrato:		la $s1, nomePratoProucurado		#Preparando o nome do prato para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do nome do prato buscado
			la $a0, arqCard				#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como par�metro
			add $a1, $zero, $a3			#Passando o par�metro de parada 
			la $s3, nomePratoProucurado		#Passando o nome do prato buscado para poder fazer as compara��es
			jal BuscarObjeto			#Buscando a posi��o do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para n�o dar probleminhas rs
			la $a0, arqCard				#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqCard2			#Abrindo o segundo arquivo (armazenamento tempor�rio)	
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo tempor�rio
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo tempor�rio em s1
			add $sp, $sp, 4				#Desalocando o espa�o usado na pilha
			j processoEdicao			#Come�a a passagem dos caracteres para o pr�ximo arquivo

rebobinarEdicao:	add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espa�o usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto j� foi lido
			add $a0, $zero, $s1	#Garantindo que, caso j� tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoEdicao	#Voltando ao processo original 
			
processoEdicao: 	beq $a2, $a3, prepararParaExcluir		#Se tiver chegado na posi��o do objeto que vai ser editado, ent�o vamos edita-lo
			beq $v0, 0, editandoNoArquivo			#Se v0 = 0, ent�o acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posi��o do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres v�o ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o pr�ximo caracter que ser� lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posi��o do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o pr�ximo caracter
			la $a1, byte					#Pegando o carcter quer ser� armazenado tempor�riamente
			add $a2, $zero, 1				#Indicando que � um caracter por vez que ser� escrito
			jal guardarEmArquivo				#Armazenando no arquivo tempor�rio
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posi��o do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posi��o do FD original
			j processoEdicao				#Pr�xima itera��o
			
prepararParaExcluir:	addi $sp, $sp, -4				#Alocando espa�o na pilha para n�o perder a posi��o do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (J� chegou na posi��o do objeto)
			add $a0, $zero, $s0				#Garantindo que s� vou ler
			j excluirObjeto					#Indo para a fun��o de retirada do objeto
			
excluirObjeto:		beq $a2, 33, rebobinarEdicao			#Se j� tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres at� a posi��o do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) v�o ficar
			addi $a2, $zero, 1				#Informando que s� vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j excluirObjeto					#Proxima itera��o
			 
editandoNoArquivo:	jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqCard			#Par�metro com o nome do arquivo do c�rdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqCard			#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqCard2		#Reabrindo o arquivo tempor�rio, vamos l�-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j guardarDadosAntigos		#Iniciando fun��o para guardar tudo de novo no arquivo

guardarDadosAntigos:	beq $v0, 0, finalizarEdicao	#Se todos os caracteres foram lidos, ent�o finaliza a edi��o
			add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
			la $a1, pratoGuardar		#Especificando que vou guardar o caracter lido aqui
			add $a2, $zero, 1		#Especififcando que s� um caracter ser� lido por vez
			jal lerDoArquivo 		#Lendo rs
			add $t0, $zero, $v0		#Guardando o valor de v0 tempor�riamente
			add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
			la $a1, pratoGuardar		#Lendo o caracter que foi lido
			addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
			jal guardarEmArquivo		#Guardando cada caracter um por um
			add $v0, $zero, $t0		#Pegando de volta o valor de t0
			j guardarDadosAntigos		#Proxima itera��o

finalizarEdicao: 	jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqCard2		#Par�metro com o nome do arquivo do c�rdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j armazenamentoPrato		#Armazenando o prato editado
			j exit
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
			la $a0, arquivoNaoEncontradoErro	#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exce��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Erro: Objeto n�o encontrado!!----------------------------------------------------------------------
objetoNaoEncontrado:	jal fecharArquivo
			addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, naoEncontradoErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exce��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#---------------------------------------------Erro: Prato j� cadastrado!!----------------------------------------------------------------------
pratoJaCadastrado:	jal fecharArquivo			#Fechando o arquivo que estava sendo usado (pra n�o dar problemas depois)
			addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, pratoJaExisteErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exce��o
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#---------------------------------------------Erro: Cliente j� cadastrado!!----------------------------------------------------------------------
clienteJaCadastrado:	jal fecharArquivo			#Fechando o arquivo que estava sendo usado (pra n�o dar problemas depois)
			addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, clienteJaExisteErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exce��o		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#---------------------------------------------Sucesso: A��o concluida!---------------------------------------------------------------------
telaSucesso:		addi $a1, $zero, 1			#Escolhendo tela de erro
			la $a0, acaoBemSucedida			#Carregando a label que diz sucesso
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( sucesso) ]
			j Main					#Fim 

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------Verificar menu escolhido (verifica qual foi a escolha de sub menu) ------------------------------------------------
subMenu:	beq $a0, 1, menuCliente		#Menu do cliente foi escolhido
		beq $a0, 2, menuPrato		#Menu do card�pio foi escolhido
		beq $a0, 3, menuFuncionario	#Menu do funcion�rio foi escolhido
		beq $a0, 4, menuMesa		#Menu das mesas foi escolhido
		beq $a0, 5, menuPedidos		#Menu dos pedidos foi escolhido
		beq $a0, 6, exit		#Sair do programa
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Clientes------------------------------------------------------------------------------------
menuCliente: 	la $a0, opcaoCliente	#Carrega o menu do cliente
		jal escolha		#Fun��o para mostrar o menu e escolher a op��es [ escolha(opcaoCliente) ]
		add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
		addi $a1, $zero, 6	#Par�metro pra saber se a op��o escolhida � menor ou igual a 6
		jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 6 [ verificacao(0, 6) ]
		jal acaoCliente
		j Main			#Fim das opera��es com o cliente(s)
		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Pratos (C�rdapio)------------------------------------------------------------------------------------
menuPrato: 	la $a0, opcaoCardapio	#Carrega o menu dos pratos
		jal escolha		#Fun��o para mostrar o menu e escolher a op��es [ escolha(opcaoCardapio) ]
		add $a2, $zero, $v0	#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Par�metro pra saber se a op��o escolhido � maior que 0
		addi $a1, $zero, 4	#Par�metro pra saber se a op��o escolhida � menor ou igual a 6
		jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 6 [ verificacao(0, 6) ]
		jal acaoPrato		#Chamando a fun��o de verifica��o de escolha
		j Main			#Fim das opera��es com o cardapio
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Funcionario------------------------------------------------------------------------------------
menuFuncionario: 	la $a0, opcaoFuncionario	#Carrega o menu do funcionario
			jal escolha			#Fun��o para mostrar o menu e escolher a op��es [ escolha(opcaoFuncionario) ]
			add $a2, $zero, $v0		#Adicionando a op��o escolhida para passar como par�metro para a verifica��o
			add $a3, $zero, $v1		#Adicionando o status para verificar se deu tudo certo 
			addi $a0, $zero, 0		#Par�metro pra saber se a op��o escolhido � maior que 0
			addi $a1, $zero, 6		#Par�metro pra saber se a op��o escolhida � menor ou igual a 6
			jal verificacao			#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 6 [ verificacao(0, 6) ]
			jal escolhaFuncionario
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
		addi $a1, $zero, 3	#Par�metro pra saber se a op��o escolhida � menor ou igual a 8
		jal verificacao		#Fun��o que verifica se a op��o escolhida � um n�mero entre 1 e 8 [ verificacao(0, 8) ]
		jal acaoPedido		#Fun��o para verificar a escolha de a��o em rela��o aos pedidos
		j Main			#Fim das opera��es com os Pedidos
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Chamar janela de string--------------------------------------------------------------------------
chamarJanelaString: 	addi $v0, $zero, 54	#Escolhe a janela de dialogo de string
			syscall			#Chamada da syscall
			add $v0, $zero, $a1	#Adicionando como retorno o valor da saida (status)
			jr $ra			#Retorno ao fluxo do programa

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#===========================================================CARD�PIO===============================================================================
#-------------------------------------------------A��es Prato----------------------------------------------------------------------------------
acaoPrato:	beq $a2, 1, funcaoCadastrarPrato	#Chamada da fun��o de cadastro de prato escolhida
		beq $a2, 2, funcaoRemoverPrato		#Chamada da funcao de remo��o de pratos escolhida
		beq $a2, 3, funcaoEditarPrato		#Chamada da fun��o de edi��o de pratos escolhida
		beq $a2, 4, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#-------------------------------------------------Cadastrar Prato----------------------------------------------------------------------------------
funcaoCadastrarPrato: 	la $a0, digiteNomePrato			#Carrega a label do nome do prato
			la $a1, nomePrato			#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado
			la $a0, digitePrecoPrato		#Carrega a label do preco do prato
			la $a1, precoPrato			#Carrega a label que vai armazenar o preco do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verificando o preco do prato?
			j existenciaPratoCadastro		#Vai pra fun��o que verifica se o prato j� foi cadastrado antes
			
existenciaPratoCadastro:	la $a0, arqCard					#Par�metro com o nome do arquivo do c�rdapio
				add $a1, $zero, $zero				#Especificando que quero ler o arquivo
				add $a2, $zero, $zero 				#N�o sei o que � mode
				jal abrirArquivo				#Chamada da fun��o de abrir arquivo
				add $s0, $v0, $zero				#Pegando o arquivo retornado
				add $a0, $zero, $s0				#Salvando arquivo como par�metro para editar o prato escolhido
				add $a3, $zero, $zero				#Inicializando a condi��o de parada
				la $s1, nomePrato				#Carrega o nome do prato que est� sendo proucurado
				jal stringLen
				j procedimentoBuscaCPrato
			

					
procedimentoBuscaCPrato:	beq $v0, $zero, armazenamentoPrato	    	# se v0 == 0 achou fim do arquivo, ent�o o prato n�o foi cadastrado
				la $a1, pratoGuardar				#Especificando onde os caracteres v�o estar
				beq $a3, 20, pratoJaCadastrado			#Condi��o, if a3 == 22, ent�o encontrou o prato
				add $t0, $zero, $a2				#Salvando o indice atual (caso os caracteres estejam sendo iguais)
				addi $a2, $zero, 1 				#Quantidade de caracteres lidos
				jal lerDoArquivo				#Chamada da fun��o de ler o arquivo
				la $s2, pratoGuardar				#Carrega o caracter lido
				addi $a3, $a3, 1				#Incrementa o valor de a3 pra saber se o prato foi encontrado
				add $a2, $zero, $t0				#Volta o valor do indice para a2
				lb $t1, ($s1)					#Carrega o caracter de indice a2 do nome passado
				lb $t2, ($s2)					#Carrega o caracter lido do arquivo
				addi $a2, $a2, 1				#Incrementa o indice 
				addi $s1, $s1, 1				#incrementa o indice de s1 pra pegar o proximo caracter do nome passado
				beq $t2, $t1, procedimentoBuscaCPrato		#Verifica se o caracter lido � o mesmo da posi��o a2 do nome do prato, se sim avan�a pro pr�ximo car
				sub $s1, $s1, $a2				#Se os caracteres forem diferentes, zero o indice do nome do prato
				sub $a2, $a2, $a2 				#Se n�o for o mesmo, zero o indice e recome�a
				sub $a3, $a3, $a3				#Condi��o, if a3 == 22, ent�o encontrou o prato
				j procedimentoBuscaCPrato			#Recome�a com a pr�xima itera��o
			
armazenamentoPrato:	jal fecharArquivo		#Fechando arquivo


			la $a0, arqCard			#Par�metro com o nome do arquivo do c�rdapio
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			add $a0, $zero, $s0		#Colocando FD como argumento
			la $a1, nomePrato		#Passar o nome do prato como par�metro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando fun��o para guardar o nome do prato no arquivo
			la $a1, virgula			#Passar o ponto e virgula como par�metro
			add $a2, $zero, 1		#Escolhendo a quantidade m�xima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando fun��o para guardar o ponto e virgula
			la $a1, precoPrato		#Passando o preco do prato como par�metro para guardar no arquivo
			add $a2, $zero, 10		#Escolhendo a quantidade m�xima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando fun��o para guardar o preco do prato no arquivo
			la $a1, quebraLinha		#Passar a quebra de linha como par�metro para indicar que o objeto rpato foi armazenado
			add $a2, $zero, 2		#Escolhendo a quantidade m�xima de caracteres para a quebra de linha
			jal guardarEmArquivo		#Chamando fun��o para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando fun��o pra fechar arquivo
			j telaSucesso			#Cadastro bem sucedido
			j exit				
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Remover Prato----------------------------------------------------------------------------------
funcaoRemoverPrato: 	la $a0, digiteNomePratoRemover		#Carrega a label do nome do prato
			la $a1, nomePratoProucurado		#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado
			
iniciarRemocao:		la $s1, nomePratoProucurado		#Preparando o nome do prato para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do nome do prato buscado
			la $a0, arqCard				#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como par�metro
			add $a1, $zero, $a3			#Passando o par�metro de parada 
			la $s3, nomePratoProucurado		#Passando o nome do prato buscado para poder fazer as compara��es
			jal BuscarObjeto			#Buscando a posi��o do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para n�o dar probleminhas rs
			la $a0, arqCard				#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqCard2			#Abrindo o segundo arquivo (armazenamento tempor�rio)	
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo tempor�rio
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo tempor�rio em s1
			add $sp, $sp, 4				#Desalocando o espa�o usado na pilha
			j processoRemocao			#Come�a a passagem dos caracteres para o pr�ximo arquivo

rebobinarRemocao:	add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espa�o usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto j� foi lido
			add $a0, $zero, $s1	#Garantindo que, caso j� tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoRemocao	#Voltando ao processo original 
			
processoRemocao: 	beq $a2, $a3, prepararParaRemover		#Se tiver chegado na posi��o do objeto que vai ser editado, ent�o vamos edita-lo
			beq $v0, 0, removendoDoArquivo			#Se v0 = 0, ent�o acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posi��o do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres v�o ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o pr�ximo caracter que ser� lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posi��o do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o pr�ximo caracter
			la $a1, byte					#Pegando o carcter quer ser� armazenado tempor�riamente
			add $a2, $zero, 1				#Indicando que � um caracter por vez que ser� escrito
			jal guardarEmArquivo				#Armazenando no arquivo tempor�rio
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posi��o do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posi��o do FD original
			j processoRemocao				#Pr�xima itera��o
			
prepararParaRemover:	addi $sp, $sp, -4				#Alocando espa�o na pilha para n�o perder a posi��o do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (J� chegou na posi��o do objeto)
			add $a0, $zero, $s0				#Garantindo que s� vou ler
			j removerObjeto					#Indo para a fun��o de retirada do objeto
			
removerObjeto:		beq $a2, 33, rebobinarRemocao			#Se j� tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres at� a posi��o do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) v�o ficar
			addi $a2, $zero, 1				#Informando que s� vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j removerObjeto					#Proxima itera��o
			 
removendoDoArquivo:	jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqCard			#Par�metro com o nome do arquivo do c�rdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqCard			#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqCard2		#Reabrindo o arquivo tempor�rio, vamos l�-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j repassarDadosAntigos		#Iniciando fun��o para guardar tudo de novo no arquivo

repassarDadosAntigos:	beq $v0, 0, finalizarRemocao	#Se todos os caracteres foram lidos, ent�o finaliza a edi��o
			add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
			la $a1, pratoGuardar		#Especificando que vou guardar o caracter lido aqui
			add $a2, $zero, 1		#Especififcando que s� um caracter ser� lido por vez
			jal lerDoArquivo 		#Lendo rs
			add $t0, $zero, $v0		#Guardando o valor de v0 tempor�riamente
			add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
			la $a1, pratoGuardar		#Lendo o caracter que foi lido
			addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
			jal guardarEmArquivo		#Guardando cada caracter um por um
			add $v0, $zero, $t0		#Pegando de volta o valor de t0
			j repassarDadosAntigos		#Proxima itera��o

finalizarRemocao: 	jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqCard2		#Par�metro com o nome do arquivo do c�rdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j telaSucesso
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Editar Prato----------------------------------------------------------------------------------
funcaoEditarPrato: 	la $a0, digiteNomePratoBuscado		#Carrega a label do nome do prato
			la $a1, nomePratoProucurado		#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado
			la $a0, digiteNomePrato			#Carrega a label do nome do prato
			la $a1, nomePrato			#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado
			la $a0, digitePrecoPrato		#Carrega a label do preco do prato
			la $a1, precoPrato			#Carrega a label que vai armazenar o preco do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verificando o preco do prato?
			j buscaPrato

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#===========================================================FIM DO C�RDAPIO=======================================================================

#===========================================================CLIENTE===============================================================================
#-------------------------------------------------A��O Cliente----------------------------------------------------------------------------------
acaoCliente:	beq $a2, 1, funcaoCadastrarCliente	#Chamada da fun��o de cadastro de cliente escolhida
		beq $a2, 2, funcaoRemoverCliente	#Chamada da funcao de remo��o de cliente escolhida
		beq $a2, 3, funcaoEditarCliente		#Chamada da fun��o de edi��o de cliente escolhida
		beq $a2, 4, retornaMain			#Retornar para menu principal escolhido

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------------Buscar cliente-----------------------------------------------------------------------------
buscaCliente:		la $s1, cpfClienteProucurado		#Preparando o cpf do cliente para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do CPF do cliente buscado
			la $a0, arqClien			#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como par�metro
			add $a1, $zero, $a3			#Passando o par�metro de parada
			la $s3, cpfClienteProucurado		#Passando o CPF do cliente buscado para poder fazer as compara��es
			jal BuscarObjeto			#Buscando a posi��o do cliente no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para n�o dar probleminhas rs
			la $a0, arqClien			#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqClien2			#Abrindo o segundo arquivo (armazenamento tempor�rio)
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo tempor�rio
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo tempor�rio em s1
			add $sp, $sp, 4				#Desalocando o espa�o usado na pilha
			j processoEdicaoCliente			#Come�a a passagem dos caracteres para o pr�ximo arquivo

rebobinarEdicaoCliente:	add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espa�o usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto j� foi lido
			add $a0, $zero, $s1	#Garantindo que, caso j� tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoEdicaoCliente	#Voltando ao processo original

processoEdicaoCliente: 	beq $a2, $a3, prepararParaExcluirCliente	#Se tiver chegado na posi��o do objeto que vai ser editado, ent�o vamos edita-lo
			beq $v0, 0, editandoNoArquivoCliente		#Se v0 = 0, ent�o acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posi��o do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres v�o ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o pr�ximo caracter que ser� lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posi��o do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o pr�ximo caracter
			la $a1, byte					#Pegando o carcter quer ser� armazenado tempor�riamente
			add $a2, $zero, 1				#Indicando que � um caracter por vez que ser� escrito
			jal guardarEmArquivo				#Armazenando no arquivo tempor�rio
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posi��o do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posi��o do FD original
			j processoEdicaoCliente				#Pr�xima itera��o

prepararParaExcluirCliente:addi $sp, $sp, -4				#Alocando espa�o na pilha para n�o perder a posi��o do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (J� chegou na posi��o do objeto)
			add $a0, $zero, $s0				#Garantindo que s� vou ler
			j excluirObjetoCliente				#Indo para a fun��o de retirada do objeto

excluirObjetoCliente:	beq $a2, 64, rebobinarEdicaoCliente		#Se j� tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres at� a posi��o do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) v�o ficar
			addi $a2, $zero, 1				#Informando que s� vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j excluirObjetoCliente				#Proxima itera��o

editandoNoArquivoCliente:jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqClien		#Par�metro com o nome do arquivo do c�rdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqClien		#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqClien2		#Reabrindo o arquivo tempor�rio, vamos l�-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j guardarDadosAntigosCliente	#Iniciando fun��o para guardar tudo de novo no arquivo

guardarDadosAntigosCliente:	beq $v0, 0, finalizarEdicaoCliente	#Se todos os caracteres foram lidos, ent�o finaliza a edi��o
				add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
				la $a1, cpfClienteGuardar	#Especificando que vou guardar o caracter lido aqui
				add $a2, $zero, 1		#Especififcando que s� um caracter ser� lido por vez
				jal lerDoArquivo 		#Lendo rs
				add $t0, $zero, $v0		#Guardando o valor de v0 tempor�riamente
				add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
				la $a1, cpfClienteGuardar	#Lendo o caracter que foi lido
				addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
				jal guardarEmArquivo		#Guardando cada caracter um por um
				add $v0, $zero, $t0		#Pegando de volta o valor de t0
				j guardarDadosAntigosCliente	#Proxima itera��o

finalizarEdicaoCliente: jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqClien2		#Par�metro com o nome do arquivo do c�rdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j armazenamentoCliente		#Armazenando o prato editado
			j exit
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------Cadastrar Cliente----------------------------------------------------------------------------------
funcaoCadastrarCliente: la $a0, digiteCPFCliente		#Carrega a label do CPF do cliente
			la $a1, cpfCliente			#Carrega a label que vai armazenar o cpf do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado

			la $a0, digiteNomeCliente		#Carrega a label do nome do cliente
			la $a1, nomeCliente			#Carrega a label que vai armazenar o nome do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado

			la $a0, digitePrefCliente		#Carrega a label do da preferencia do cliente
			la $a1, prefCliente			#Carrega a label que vai armazenar a preferencia do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado

			j existenciaClienteCadastro		#Vai pra fun��o que verifica se o cliente j� foi cadastrado antes

existenciaClienteCadastro:	la $a0, arqClien				#Par�metro com o nome do arquivo do cliente
				add $a1, $zero, $zero				#Especificando que quero ler o arquivo
				add $a2, $zero, $zero 				#N�o sei o que � mode
				jal abrirArquivo				#Chamada da fun��o de abrir arquivo
				add $s0, $v0, $zero				#Pegando o arquivo retornado
				add $a0, $zero, $s0				#Salvando arquivo como par�metro para editar o prato escolhido
				add $a3, $zero, $zero				#Inicializando a condi��o de parada
				la $s1, cpfCliente				#Carrega o CPF do cliente que est� sendo proucurado
				j procedimentoBuscaCliente



procedimentoBuscaCliente:	beq $v0, $zero, armazenamentoCliente	    	# se v0 == 0 achou fim do arquivo, ent�o o cliente n�o foi cadastrado
				la $a1, cpfClienteGuardar			#Especificando onde os caracteres v�o estar
				beq $a3, 20, clienteJaCadastrado		#Condi��o, if a3 == 22, ent�o encontrou o cliente
				add $t0, $zero, $a2				#Salvando o indice atual (caso os caracteres estejam sendo iguais)
				addi $a2, $zero, 1 				#Quantidade de caracteres lidos
				jal lerDoArquivo				#Chamada da fun��o de ler o arquivo
				la $s2, cpfClienteGuardar			#Carrega o caracter lido
				addi $a3, $a3, 1				#Incrementa o valor de a3 pra saber se o cliente foi encontrado
				add $a2, $zero, $t0				#Volta o valor do indice para a2
				lb $t1, ($s1)					#Carrega o caracter de indice a2 do nome passado
				lb $t2, ($s2)					#Carrega o caracter lido do arquivo
				addi $a2, $a2, 1				#Incrementa o indice
				addi $s1, $s1, 1				#incrementa o indice de s1 pra pegar o proximo caracter do nome passado
				beq $t2, $t1, procedimentoBuscaCliente		#Verifica se o caracter lido � o mesmo da posi��o a2 do CPF do cliente, se sim avan�a pro pr�ximo car
				sub $s1, $s1, $a2				#Se os caracteres forem diferentes, zero o indice do nome do prato
				sub $a2, $a2, $a2 				#Se n�o for o mesmo, zero o indice e recome�a
				sub $a3, $a3, $a3				#Condi��o, if a3 == 22, ent�o encontrou o cliente
				j procedimentoBuscaCliente			#Recome�a com a pr�xima itera��o

armazenamentoCliente:	jal fecharArquivo		#Fechando arquivo


			la $a0, arqClien		#Par�metro com o nome do arquivo do cliente
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			add $a0, $zero, $s0		#Colocando FD como argumento

			la $a1, cpfCliente		#Passar o CPF do cliente como par�metro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando fun��o para guardar o CPF do cliente no arquivo

			la $a1, virgula			#Passar o ponto e virgula como par�metro
			add $a2, $zero, 1		#Escolhendo a quantidade m�xima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando fun��o para guardar o ponto e virgula

			la $a1, nomeCliente		#Passando o nome do cliente como par�metro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando fun��o para guardar o nome do cliente no arquivo

			la $a1, virgula			#Passar o ponto e virgula como par�metro
			add $a2, $zero, 1		#Escolhendo a quantidade m�xima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando fun��o para guardar o ponto e virgula

			la $a1, prefCliente		#Passando a preferencia do cliente como par�metro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando fun��o para guardar a preferencia do cliente no arquivo

			la $a1, quebraLinha		#Passar a quebra de linha como par�metro para indicar que o objeto rpato foi armazenado
			add $a2, $zero, 2		#Escolhendo a quantidade m�xima de caracteres para a quebra de linha
			jal guardarEmArquivo		#Chamando fun��o para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando fun��o pra fechar arquivo
			j telaSucesso			#Cadastro bem sucedido
			j exit

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------Remover Cliente----------------------------------------------------------------------------------
funcaoRemoverCliente:	la $a0, digiteCPFClienteBuscado		#Carrega a label do nome CPF do cliente buscado
			la $a1, cpfClienteProucurado		#Carrega a label que vai armazenar o CPF do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado
			
			la $s1, cpfClienteProucurado		#Preparando o cpf do cliente para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do CPF do cliente buscado
			la $a0, arqClien			#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como par�metro
			add $a1, $zero, $a3			#Passando o par�metro de parada
			la $s3, cpfClienteProucurado		#Passando o CPF do cliente buscado para poder fazer as compara��es
			jal BuscarObjeto			#Buscando a posi��o do cliente no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para n�o dar probleminhas rs
			la $a0, arqClien			#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqClien2			#Abrindo o segundo arquivo (armazenamento tempor�rio)
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo tempor�rio
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo tempor�rio em s1
			add $sp, $sp, 4				#Desalocando o espa�o usado na pilha
			j processoRemocaoCliente			#Come�a a passagem dos caracteres para o pr�ximo arquivo

rebobinarRemocaoCliente:add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espa�o usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto j� foi lido
			add $a0, $zero, $s1	#Garantindo que, caso j� tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoRemocaoCliente	#Voltando ao processo original

processoRemocaoCliente: beq $a2, $a3, prepararParaRemoverCliente	#Se tiver chegado na posi��o do objeto que vai ser editado, ent�o vamos edita-lo
			beq $v0, 0, removendoNoArquivoCliente		#Se v0 = 0, ent�o acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posi��o do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres v�o ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o pr�ximo caracter que ser� lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posi��o do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o pr�ximo caracter
			la $a1, byte					#Pegando o carcter quer ser� armazenado tempor�riamente
			add $a2, $zero, 1				#Indicando que � um caracter por vez que ser� escrito
			jal guardarEmArquivo				#Armazenando no arquivo tempor�rio
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posi��o do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posi��o do FD original
			j processoRemocaoCliente				#Pr�xima itera��o

prepararParaRemoverCliente:addi $sp, $sp, -4				#Alocando espa�o na pilha para n�o perder a posi��o do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (J� chegou na posi��o do objeto)
			add $a0, $zero, $s0				#Garantindo que s� vou ler
			j removerObjetoCliente				#Indo para a fun��o de retirada do objeto

removerObjetoCliente:	beq $a2, 64, rebobinarRemocaoCliente		#Se j� tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres at� a posi��o do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) v�o ficar
			addi $a2, $zero, 1				#Informando que s� vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j removerObjetoCliente				#Proxima itera��o

removendoNoArquivoCliente:jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqClien		#Par�metro com o nome do arquivo do c�rdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqClien		#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqClien2		#Reabrindo o arquivo tempor�rio, vamos l�-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j removerDadosAntigosCliente	#Iniciando fun��o para guardar tudo de novo no arquivo

removerDadosAntigosCliente:	beq $v0, 0, finalizarRemocaoCliente	#Se todos os caracteres foram lidos, ent�o finaliza a edi��o
				add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
				la $a1, cpfClienteGuardar	#Especificando que vou guardar o caracter lido aqui
				add $a2, $zero, 1		#Especififcando que s� um caracter ser� lido por vez
				jal lerDoArquivo 		#Lendo rs
				add $t0, $zero, $v0		#Guardando o valor de v0 tempor�riamente
				add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
				la $a1, cpfClienteGuardar	#Lendo o caracter que foi lido
				addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
				jal guardarEmArquivo		#Guardando cada caracter um por um
				add $v0, $zero, $t0		#Pegando de volta o valor de t0
				j removerDadosAntigosCliente	#Proxima itera��o

finalizarRemocaoCliente: jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqClien2		#Par�metro com o nome do arquivo do c�rdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j Main
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------Editar Cliente----------------------------------------------------------------------------------
funcaoEditarCliente: 	la $a0, digiteCPFClienteBuscado		#Carrega a label do nome CPF do cliente buscado
			la $a1, cpfClienteProucurado		#Carrega a label que vai armazenar o CPF do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado

			la $a0, digiteCPFCliente		#Carrega a label do CPF do cliente
			la $a1, cpfCliente			#Carrega a label que vai armazenar o CPF do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado

			la $a0, digiteNomeCliente		#Carrega a label do nome do cliente
			la $a1, nomeCliente			#Carrega a label que vai armazenar o nome do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado

			la $a0, digitePrefCliente		#Carrega a label do da preferencia do cliente
			la $a1, prefCliente			#Carrega a label que vai armazenar a preferencia do cliente
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado

			j buscaCliente

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#===========================================================FIM DO CLIENTE=======================================================================

#===========================================================FUNCIONARIO===============================================================================
#-------------------------------------------------ESCOLHA----------------------------------------------------------------------------------
escolhaFuncionario:	beq $a2, 1, contratarFuncionario	#Chamada da fun��o de cadastro de cliente escolhida
			beq $a2, 2, demitirFuncionario		#Chamada da funcao de remo��o de cliente escolhida
			beq $a2, 3, atualizarFuncionario	#Chamada da fun��o de edi��o de cliente escolhida
			beq $a2, 4, visualizarFuncionario	#Chamada da fun��o de visualiza��o de cliente escolhida
			beq $a2, 5, folhadePag		        #Chamada da fun��o de cadastrar reserva escolhida
			beq $a2, 6, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------CONTRATAR FUNCIONARIO------------------------------------------------------------------------------------
contratarFuncionario: 	la $a0, digitenomeFun		#Carrega a label do nome do funcionario
			la $a1, nomeFun			#Carrega a label que vai armazenar o nome do funcionario
			addi $a2, $zero, 20		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se est� tudo ok com o que foi digitado
			
			la $a0, digitecpffun		#Carrega a label do nome CPF do funcionario
			la $a1, cpffun			#Carrega a label do CPF do funcionario
			addi $a2, $zero, 20		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se est� tudo ok com o que foi digitado
			
			la $a0, digiteidade		#Carrega a label do valor da idade
			la $a1, idade			#Carrega a label da idade
			addi $a2, $zero, 20		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se est� tudo ok com o que foi digitado
		
			la $a0, digitefuncao		#Carrega a label do nome da fun��o do funcionario
			la $a1, funcao			#Carrega a label da funcao
			addi $a2, $zero, 20		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se est� tudo ok com o que foi digitado
			
			la $a0, digitesalario		#Carrega a label do nome do salario
			la $a1, salario			#Carrega a label do salario
			addi $a2, $zero, 20		#Define a quantidade m�xima de caracteres
			jal chamarJanelaString		#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se est� tudo ok com o que foi digitado
					
			la $a0, arqFun			#Par�metro com o nome do arquivo do funcionario
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $a0, $v0, $zero		#Pegando o arquivo retornado
			
			la $a1, nomeFun			#Passar o nome do funcionario como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar o nome no arquivo 
			
			la $a1, cpffun			#Passar CPF do funcionario como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar CPF do funcionario arquivo
			
			la $a1, idade			#Passar CPF do funcionario como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar CPF do funcionario arquivo
			
			la $a1, funcao			#Passar o nome da funcao como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar a funcao no arquivo 
			
			la $a1, salario			#Passar o valor de salario como par�metro
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres
			jal guardarEmArquivo		#Chamando fun��o para guardar o salario no arquivo 
			
			jal fecharArquivo		#Chamando fun��o pra fechar arquivo
			j telaSucesso			#Cadastro bem sucedido
			j exit	
		
	
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------DEMITIR FUNCIONARIO------------------------------------------------------------------------------------
demitirFuncionario:	nop

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------ATUALIZAR FUNCIONARIO------------------------------------------------------------------------------------
atualizarFuncionario: 	nop
						
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Visualizar FUNCIONARIO------------------------------------------------------------------------------------
visualizarFuncionario: nop

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------Calcular folha de pagamento do FUNCIONARIO-----------------------------------------------------------------------
folhadePag: nop

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#===========================================================FIM DO FUNCIONARIO=======================================================================
#======================================================Classe pedidos===============================================================================
#-------------------------------------------------Acao Pedidos----------------------------------------------------------------------------------
acaoPedido:	beq $a2, 1, funcaoCadastrarPedido	#Chamada da fun��o de cadastro de pedidos escolhida
		beq $a2, 2, funcaoRemoverPedido		#Chamada da funcao de remo��o de pedidos escolhida
		beq $a2, 3, funcaoEditarPedido		#Chamada da fun��o de edi��o de pedidos escolhida
		beq $a2, 4, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------------------------Cadastrar pedidos----------------------------------------------------------------------------
funcaoCadastrarPedido:	la $a0, digiteNomePratoPedido		#Carrega a label do nome do prato
			la $a1, pratoPedido			#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se est� tudo ok com o que foi digitado
			la $a0, digiteClienteQuePediu		#Carrega a label do preco do prato
			la $a1, clienteQuePediu			#Carrega a label que vai armazenar o preco do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verificando o preco do prato
			la $a0, digiteDataPedido		#Carrega a label do preco do prato
			la $a1, dataPedido			#Carrega a label que vai armazenar o preco do prato
			addi $a2, $zero, 20			#Define a quantidade m�xima de caracteres
			jal chamarJanelaString			#Chama a fun��o que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verificando o preco do prato?

			la $s1, pratoPedido			#Preparando o nome do prato para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do nome do prato buscado
			la $a0, arqCard				#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como par�metro
			add $a1, $zero, $a3			#Passando o par�metro de parada 
			la $s3, pratoPedido			#Passando o nome do prato buscado para poder fazer as compara��es
			jal BuscarObjeto			#Buscando a posi��o do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para n�o dar probleminhas rs
		
			la $s1, clienteQuePediu			#Preparando o nome do cliente que pediu para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do nome do prato buscado
			la $a0, arqClien			#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como par�metro
			add $a1, $zero, $a3			#Passando o par�metro de parada 
			la $s3, clienteQuePediu			#Passando o nome do cliente que pediu buscado para poder fazer as compara��es
			jal BuscarObjeto			#Buscando a posi��o do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para n�o dar probleminhas rs
					
armazenarPedido:	la $a0, arqPed			#Par�metro com o nome do arquivo do c�rdapio
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#N�o sei o que � mode
			jal abrirArquivo		#Chamada da fun��o de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			add $a0, $zero, $s0		#Colocando FD como argumento
			la $a1, pratoPedido		#Passar o nome do prato como par�metro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando fun��o para guardar o nome do prato no arquivo
			la $a1, virgula			#Passar o ponto e virgula como par�metro
			add $a2, $zero, 1		#Escolhendo a quantidade m�xima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando fun��o para guardar o ponto e virgula
			la $a1, clienteQuePediu		#Passando o preco do prato como par�metro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando fun��o para guardar o preco do prato no arquivo
			la $a1, virgula			#Passar o ponto e virgula como par�metro
			add $a2, $zero, 1		#Escolhendo a quantidade m�xima de caracteres para o ponto e virgula
			jal guardarEmArquivo
			la $a1,	 dataPedido		#Passar o nome do prato como par�metro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade m�xima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando fun��o para guardar o nome do prato no arquivo
			la $a1, quebraLinha		#Passar a quebra de linha como par�metro para indicar que o objeto rpato foi armazenado
			add $a2, $zero, 2		#Escolhendo a quantidade m�xima de caracteres para a quebra de linha
			jal guardarEmArquivo		#Chamando fun��o para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando fun��o pra fechar arquivo
			j telaSucesso				

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------------Fun��o remover prato-----------------------------------------------------------------------
funcaoRemoverPedido:
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------------Fun��o remover prato-----------------------------------------------------------------------
funcaoEditarPedido:
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#======================================================Fim dos pedidos==============================================================================

#-------------------------------------------------Voltar pro main menu----------------------------------------------------------------------------------
retornaMain: j Main		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
ok: jr $ra	#Tempor�rio!

exit: nop
