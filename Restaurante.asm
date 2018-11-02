.data
	#Menu Principal:
	titulo: .asciiz "Escolha uma opção \n 1 - Clientes \n 2 - Pratos \n 3 - Funcionarios \n 4 - Mesa \n 5 - Pedidos \n 6 - Sair"
	
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
	clienteJaExisteErro: .asciiz "Cliente já cadastrado!!"
	
	#Label: Sucesso
	acaoBemSucedida: .asciiz "Operação finalizada com sucesso!!"
	
	#SubMenus:
	opcaoCliente: .asciiz "Escolha uma opção: \n 1 - Cadastrar um cliente \n 2 - Remover cliente \n 3 - Editar informações sobre um cliente \n 4 - Retornar para o Menu Principal"
	opcaoCardapio: .asciiz "Escolha uma opção: \n 1 - Adicionar novo prato ao cardápio \n 2 - Retirar um prato do cardápio \n 3 - Editar informações sobre um prato \n 4 - Retornar para o Menu Principal"
	opcaoFuncionario: .asciiz "Escolha uma opção: \n 1 - Contratar novo funcionário \n 2 - Demitir um funcionário \n 3 - Atualizar informações de um funcionário \n 4 - Visualizar informações de um funcionário \n 5 - Calcular folha de pagamento \n 6 - Retornar para o Menu Principal"
	opcaoMesa: .asciiz "Escolha uma opção: \n 1 - Adicionar Mesa \n 2 - Retirar Mesa \n 3 - Mudar status da mesa \n 4 - Visualizar informações de uma Mesa \n 5 - Confirmar Reserva \n 6 - Limpar uma mesa \n 7 - Retornar para o Menu principal"
	opcaoPedido: .asciiz "Escolha uma opção: \n 1 - Registrar um pedido \n 2 - Retornar para o Menu Principal"
	#fim dos subMenus.
	
	#Parametros (labels de pedido):
	#Prato
	digiteNomePrato: .asciiz "Digite o nome do Prato: "
	digiteNomePratoBuscado: .asciiz "Digite o nome do Prato para editar: "
	digiteNomePratoRemover: .asciiz "Digite o nome do Prato que será removido: "
	digitePrecoPrato: .asciiz "Digite o preço do Prato: "  
	
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
	#Cardápio
	arqCard: .asciiz "cardapio.txt"
	arqCard2: .asciiz "cardapioTemp.txt"
	
	arqPed: .asciiz "pedidos.txt"
	arqPed2: .asciiz "pedidosTemp.txt"
	
	#Parametros (labels de cliente):
	#Cliente

	digiteCPFCliente: .asciiz "Digite o CPF do cliente: "
	digiteCPFClienteBuscado: .asciiz "Digite o CPF do Cliente para editar: "
	digiteCPFClienteRemover: .asciiz "Digite o CPF do Cliente que será removido: "
	digiteNomeCliente: .asciiz "Digite o nome do Cliente: "
	digitePrefCliente: .asciiz "Digite sua Preferência: \n Ex: Onivoro ou Vegetariano"
	
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
	digitefuncao: .asciiz "Digite a função: \n - Gerente \n - Cozinheiro \n - Caixa \n - Atendente \n - Motoboy \n - Faxineiro \n - Segurança"
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
	jal escolha		#Função para mostrar o menu e escolher a opção [ escolha(titulo) ]
	add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
	add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
	addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
	addi $a1, $zero, 6	#Parâmetro pra saber se a opção escolhida é menor ou igual a 5
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

		add $s3, $zero, $v0
		add $a0, $zero, $s3	#Passando o resultado da chamada para a0, para ser verificado se o arquivo existe
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

#--------------------------------------------------------Ler tamanho palavra----------------------------------------------------------------------
stringLen:							#Função para ler a quantidade de caracteres de uma palavra
salvarRetorno0: 	addi $sp, $sp, -4			#Liberando uma palavra na pilha para armazenar o retorno do fluxo
			sw $ra, ($sp)				#Armazenando na pilha o retono para o fluxo normal
			j retornaLenPal				#Indo calcular a quantidade de caracteres do arquivo

retornaLenPal: 		lb $t1, ($s1)				#Carregando o caracter de inidice i da palavra
			beq $t1, 0, compara			#Se o caracter for igual a 0, significa que chegou no espaço
			addi $a3, $a3, 1			#Cada iteração, significa que existe mais um caracter no arquivo
			addi $s1, $s1, 1			#Aumentando o indice i
			j retornaLenPal

compara:		addi $s1, $s1, 1			#Aumenta o indice i dnv pra fazer a comparação
			lb $t2, ($s1)				#Carrega o caracter de indice i + 1 pra ver se ele tbm é espaço
			beq $t2, 0, retornaFluxo0		#Se i e i + 1 forem espaços, então já temos o indice
			j retornaLenPal				#Recomeça com a próxima iteração

retornaFluxo0:		lw $ra, 0($sp)				#Pegando o retorno original do fluxo da pilha
			addi $sp, $sp, 4			#Desalocando o espaço que foi usado para guardar o retorno na pilha
			add $v0, $zero, $a3			#Adicionando o tamanho do arquivo em v0
			jr $ra					#Voltando ao fluxo normal do código

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#----------------------------------------------------------Contagem de tamanho de arquivo----------------------------------------------------------
salvarRetorno1: 	addi $sp, $sp, -4			#Liberando uma palavra na pilha para armazenar o retorno do fluxo
			sw $ra, ($sp)				#Armazenando na pilha o retono para o fluxo normal
			j retornaLen				#Indo calcular a quantidade de caracteres do arquivo

retornaLen: 		beq $v0, $zero,	retornaFluxo1	   	#se v0 == 0 achou fim do arquivo, posso retornar ao fluxo normal do código
			addi $a3, $a3, 1			#Cada iteração, significa que existe mais um caracter no arquivo
			jal lerDoArquivo			#Chamada da funçãod e ler o arquivo
			j retornaLen				#Recomeça com a próxima iteração

retornaFluxo1:		lw $ra, 0($sp)				#Pegando o retorno original do fluxo da pilha
			addi $sp, $sp, 4			#Desalocando o espaço que foi usado para guardar o retorno na pilha
			add $v0, $zero, $a3			#Adicionando o tamanho do arquivo em v0
			jr $ra					#Voltando ao fluxo normal do código

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------------------------------Localizar objeto em arquivo----------------------------------------------------------
BuscarObjeto:
salvarRetorno2: 	sub $a3, $a3, $a3
			addi $sp, $sp, -4			#Liberando uma palavra na pilha para armazenar o retorno do fluxo
			sw $ra, ($sp)				#Armazenando na pilha o retono para o fluxo normal
			j retornaLocalizacao			#Indo calcular a a posicao do objeto no arquivo

			#For (a3 = 0; a3 < arquivo.lenght() || a2 < 20; a3++)
retornaLocalizacao: 	beq $v0, $zero,	objetoNaoEncontrado	# se v0 == 0 achou fim do arquivo, e o objeto não existe no arquivo
			add $t3, $zero, $a1
			beq $a2, $a1, retornaFluxo2		#Se todos os caracteres do nome proucurado, são iguais a de um obejto do arquivo, então encontrei
			add $t0, $zero, $a2			#Salvando temporáriamente o indice atual do nome proucurado
			la $a1, byte				#Carregando a label onde o caracter lido do arquivo vai ser armazenado
			add $a2, $zero, $zero 			#Não sei o que é mode
			jal lerDoArquivo			#Chamada da função de ler o arquivo
			add $a1, $zero, $t3
			add $a2, $zero, $t0			#Pegando o valor original do indice atual do nome do objeto
			addi $a3, $a3, 1			#Incrementando o valor de a3, para saber quantos caracteres existem antes do objeto proucurado
			la $s2, byte
			lb $t1, ($s3)				#Carregando um caracter do nome proucrado (indice $a2)
			lb $t2, ($s2)				#Carregando o caracter lido do arquivo (indice $a3)
			addi $s3, $s3, 1			#Incrementando o caracter do objeto proucurado
			add $a2, $a2, 1				#Incrementando o indice do objeto proucurado
			beq  $t1, $t2, retornaLocalizacao	#Se os caracteres forem iguais, então eu recomeço logo o laço apra comparar o próximo até que a2 seja 20
			sub $s3, $s3, $a2			#Se os caracteres não forem iguais eu reseto o indice de $s1 e $a2
			sub $a2, $a2, $a2			#Se os caracteres não forem iguais eu reseto o indice de $s1 e $a2
			j retornaLocalizacao			#Recomeça com a próxima iteração

retornaFluxo2:		lw $ra, 0($sp)				#Recarrega o retorno original do fluxo do código
			addi $sp, $sp, 4			#Realoca o que foi usado da pilha
			sub $a3, $a3, $a1 			#Retira 20 caracteres do indice original, para saber exatamente onde começa o objeto
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
			add $a0, $zero, $s0			#Passando o arquivo como parâmetro
			add $a1, $zero, $a3			#Passando o parâmetro de parada 
			la $s3, nomePratoProucurado		#Passando o nome do prato buscado para poder fazer as comparações
			jal BuscarObjeto			#Buscando a posição do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para não dar probleminhas rs
			la $a0, arqCard				#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqCard2			#Abrindo o segundo arquivo (armazenamento temporário)	
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo temporário
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo temporário em s1
			add $sp, $sp, 4				#Desalocando o espaço usado na pilha
			j processoEdicao			#Começa a passagem dos caracteres para o próximo arquivo

rebobinarEdicao:	add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espaço usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto já foi lido
			add $a0, $zero, $s1	#Garantindo que, caso já tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoEdicao	#Voltando ao processo original 
			
processoEdicao: 	beq $a2, $a3, prepararParaExcluir		#Se tiver chegado na posição do objeto que vai ser editado, então vamos edita-lo
			beq $v0, 0, editandoNoArquivo			#Se v0 = 0, então acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posição do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres vão ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o próximo caracter que será lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posição do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o próximo caracter
			la $a1, byte					#Pegando o carcter quer será armazenado temporáriamente
			add $a2, $zero, 1				#Indicando que é um caracter por vez que será escrito
			jal guardarEmArquivo				#Armazenando no arquivo temporário
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posição do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posição do FD original
			j processoEdicao				#Próxima iteração
			
prepararParaExcluir:	addi $sp, $sp, -4				#Alocando espaço na pilha para não perder a posição do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (Já chegou na posição do objeto)
			add $a0, $zero, $s0				#Garantindo que só vou ler
			j excluirObjeto					#Indo para a função de retirada do objeto
			
excluirObjeto:		beq $a2, 33, rebobinarEdicao			#Se já tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres até a posição do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) vão ficar
			addi $a2, $zero, 1				#Informando que só vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j excluirObjeto					#Proxima iteração
			 
editandoNoArquivo:	jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqCard			#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqCard			#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqCard2		#Reabrindo o arquivo temporário, vamos lê-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j guardarDadosAntigos		#Iniciando função para guardar tudo de novo no arquivo

guardarDadosAntigos:	beq $v0, 0, finalizarEdicao	#Se todos os caracteres foram lidos, então finaliza a edição
			add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
			la $a1, pratoGuardar		#Especificando que vou guardar o caracter lido aqui
			add $a2, $zero, 1		#Especififcando que só um caracter será lido por vez
			jal lerDoArquivo 		#Lendo rs
			add $t0, $zero, $v0		#Guardando o valor de v0 temporáriamente
			add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
			la $a1, pratoGuardar		#Lendo o caracter que foi lido
			addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
			jal guardarEmArquivo		#Guardando cada caracter um por um
			add $v0, $zero, $t0		#Pegando de volta o valor de t0
			j guardarDadosAntigos		#Proxima iteração

finalizarEdicao: 	jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqCard2		#Parâmetro com o nome do arquivo do cárdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j armazenamentoPrato		#Armazenando o prato editado
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
objetoNaoEncontrado:	jal fecharArquivo
			addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, naoEncontradoErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#---------------------------------------------Erro: Prato já cadastrado!!----------------------------------------------------------------------
pratoJaCadastrado:	jal fecharArquivo			#Fechando o arquivo que estava sendo usado (pra não dar problemas depois)
			addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, pratoJaExisteErro		#Carregando a label que diz o erro
			addi $a2, $zero, 55			#Escolhendo a tela de mensagens
			jal printf				#Chamando o print [ printf( error) ]
			j Main					#Fim do tratamento da exceção
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#---------------------------------------------Erro: Cliente já cadastrado!!----------------------------------------------------------------------
clienteJaCadastrado:	jal fecharArquivo			#Fechando o arquivo que estava sendo usado (pra não dar problemas depois)
			addi $a1, $zero, 2			#Escolhendo tela de erro
			la $a0, clienteJaExisteErro		#Carregando a label que diz o erro
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
		beq $a0, 6, exit		#Sair do programa
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Clientes------------------------------------------------------------------------------------
menuCliente: 	la $a0, opcaoCliente	#Carrega o menu do cliente
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoCliente) ]
		add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $a1, $zero, 6	#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		jal acaoCliente
		j Main			#Fim das operações com o cliente(s)
		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Pratos (Cárdapio)------------------------------------------------------------------------------------
menuPrato: 	la $a0, opcaoCardapio	#Carrega o menu dos pratos
		jal escolha		#Função para mostrar o menu e escolher a opções [ escolha(opcaoCardapio) ]
		add $a2, $zero, $v0	#Adicionando a opção escolhida para passar como parâmetro para a verificação
		add $a3, $zero, $v1	#Adicionando o status para verificar se deu tudo certo 
		addi $a0, $zero, 0	#Parâmetro pra saber se a opção escolhido é maior que 0
		addi $a1, $zero, 4	#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
		jal acaoPrato		#Chamando a função de verificação de escolha
		j Main			#Fim das operações com o cardapio
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#--------------------------------------------------Menu Funcionario------------------------------------------------------------------------------------
menuFuncionario: 	la $a0, opcaoFuncionario	#Carrega o menu do funcionario
			jal escolha			#Função para mostrar o menu e escolher a opções [ escolha(opcaoFuncionario) ]
			add $a2, $zero, $v0		#Adicionando a opção escolhida para passar como parâmetro para a verificação
			add $a3, $zero, $v1		#Adicionando o status para verificar se deu tudo certo 
			addi $a0, $zero, 0		#Parâmetro pra saber se a opção escolhido é maior que 0
			addi $a1, $zero, 6		#Parâmetro pra saber se a opção escolhida é menor ou igual a 6
			jal verificacao			#Função que verifica se a opção escolhida é um número entre 1 e 6 [ verificacao(0, 6) ]
			jal escolhaFuncionario
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
		addi $a1, $zero, 3	#Parâmetro pra saber se a opção escolhida é menor ou igual a 8
		jal verificacao		#Função que verifica se a opção escolhida é um número entre 1 e 8 [ verificacao(0, 8) ]
		jal acaoPedido		#Função para verificar a escolha de ação em relação aos pedidos
		j Main			#Fim das operações com os Pedidos
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Chamar janela de string--------------------------------------------------------------------------
chamarJanelaString: 	addi $v0, $zero, 54	#Escolhe a janela de dialogo de string
			syscall			#Chamada da syscall
			add $v0, $zero, $a1	#Adicionando como retorno o valor da saida (status)
			jr $ra			#Retorno ao fluxo do programa

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


#===========================================================CARDÁPIO===============================================================================
#-------------------------------------------------Ações Prato----------------------------------------------------------------------------------
acaoPrato:	beq $a2, 1, funcaoCadastrarPrato	#Chamada da função de cadastro de prato escolhida
		beq $a2, 2, funcaoRemoverPrato		#Chamada da funcao de remoção de pratos escolhida
		beq $a2, 3, funcaoEditarPrato		#Chamada da função de edição de pratos escolhida
		beq $a2, 4, retornaMain			#Retornar para menu principal escolhido
			
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
				jal stringLen
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
				sub $a3, $a3, $a3				#Condição, if a3 == 22, então encontrou o prato
				j procedimentoBuscaCPrato			#Recomeça com a próxima iteração
			
armazenamentoPrato:	jal fecharArquivo		#Fechando arquivo


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
funcaoRemoverPrato: 	la $a0, digiteNomePratoRemover		#Carrega a label do nome do prato
			la $a1, nomePratoProucurado		#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado
			
iniciarRemocao:		la $s1, nomePratoProucurado		#Preparando o nome do prato para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do nome do prato buscado
			la $a0, arqCard				#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como parâmetro
			add $a1, $zero, $a3			#Passando o parâmetro de parada 
			la $s3, nomePratoProucurado		#Passando o nome do prato buscado para poder fazer as comparações
			jal BuscarObjeto			#Buscando a posição do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para não dar probleminhas rs
			la $a0, arqCard				#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqCard2			#Abrindo o segundo arquivo (armazenamento temporário)	
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo temporário
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo temporário em s1
			add $sp, $sp, 4				#Desalocando o espaço usado na pilha
			j processoRemocao			#Começa a passagem dos caracteres para o próximo arquivo

rebobinarRemocao:	add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espaço usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto já foi lido
			add $a0, $zero, $s1	#Garantindo que, caso já tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoRemocao	#Voltando ao processo original 
			
processoRemocao: 	beq $a2, $a3, prepararParaRemover		#Se tiver chegado na posição do objeto que vai ser editado, então vamos edita-lo
			beq $v0, 0, removendoDoArquivo			#Se v0 = 0, então acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posição do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres vão ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o próximo caracter que será lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posição do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o próximo caracter
			la $a1, byte					#Pegando o carcter quer será armazenado temporáriamente
			add $a2, $zero, 1				#Indicando que é um caracter por vez que será escrito
			jal guardarEmArquivo				#Armazenando no arquivo temporário
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posição do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posição do FD original
			j processoRemocao				#Próxima iteração
			
prepararParaRemover:	addi $sp, $sp, -4				#Alocando espaço na pilha para não perder a posição do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (Já chegou na posição do objeto)
			add $a0, $zero, $s0				#Garantindo que só vou ler
			j removerObjeto					#Indo para a função de retirada do objeto
			
removerObjeto:		beq $a2, 33, rebobinarRemocao			#Se já tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres até a posição do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) vão ficar
			addi $a2, $zero, 1				#Informando que só vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j removerObjeto					#Proxima iteração
			 
removendoDoArquivo:	jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqCard			#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqCard			#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqCard2		#Reabrindo o arquivo temporário, vamos lê-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j repassarDadosAntigos		#Iniciando função para guardar tudo de novo no arquivo

repassarDadosAntigos:	beq $v0, 0, finalizarRemocao	#Se todos os caracteres foram lidos, então finaliza a edição
			add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
			la $a1, pratoGuardar		#Especificando que vou guardar o caracter lido aqui
			add $a2, $zero, 1		#Especififcando que só um caracter será lido por vez
			jal lerDoArquivo 		#Lendo rs
			add $t0, $zero, $v0		#Guardando o valor de v0 temporáriamente
			add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
			la $a1, pratoGuardar		#Lendo o caracter que foi lido
			addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
			jal guardarEmArquivo		#Guardando cada caracter um por um
			add $v0, $zero, $t0		#Pegando de volta o valor de t0
			j repassarDadosAntigos		#Proxima iteração

finalizarRemocao: 	jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqCard2		#Parâmetro com o nome do arquivo do cárdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j telaSucesso
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#-------------------------------------------------Editar Prato----------------------------------------------------------------------------------
funcaoEditarPrato: 	la $a0, digiteNomePratoBuscado		#Carrega a label do nome do prato
			la $a1, nomePratoProucurado		#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado
			la $a0, digiteNomePrato			#Carrega a label do nome do prato
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
			j buscaPrato

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#===========================================================FIM DO CÁRDAPIO=======================================================================

#===========================================================CLIENTE===============================================================================
#-------------------------------------------------AÇÃO Cliente----------------------------------------------------------------------------------
acaoCliente:	beq $a2, 1, funcaoCadastrarCliente	#Chamada da função de cadastro de cliente escolhida
		beq $a2, 2, funcaoRemoverCliente	#Chamada da funcao de remoção de cliente escolhida
		beq $a2, 3, funcaoEditarCliente		#Chamada da função de edição de cliente escolhida
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
			add $a0, $zero, $s0			#Passando o arquivo como parâmetro
			add $a1, $zero, $a3			#Passando o parâmetro de parada
			la $s3, cpfClienteProucurado		#Passando o CPF do cliente buscado para poder fazer as comparações
			jal BuscarObjeto			#Buscando a posição do cliente no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para não dar probleminhas rs
			la $a0, arqClien			#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqClien2			#Abrindo o segundo arquivo (armazenamento temporário)
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo temporário
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo temporário em s1
			add $sp, $sp, 4				#Desalocando o espaço usado na pilha
			j processoEdicaoCliente			#Começa a passagem dos caracteres para o próximo arquivo

rebobinarEdicaoCliente:	add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espaço usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto já foi lido
			add $a0, $zero, $s1	#Garantindo que, caso já tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoEdicaoCliente	#Voltando ao processo original

processoEdicaoCliente: 	beq $a2, $a3, prepararParaExcluirCliente	#Se tiver chegado na posição do objeto que vai ser editado, então vamos edita-lo
			beq $v0, 0, editandoNoArquivoCliente		#Se v0 = 0, então acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posição do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres vão ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o próximo caracter que será lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posição do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o próximo caracter
			la $a1, byte					#Pegando o carcter quer será armazenado temporáriamente
			add $a2, $zero, 1				#Indicando que é um caracter por vez que será escrito
			jal guardarEmArquivo				#Armazenando no arquivo temporário
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posição do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posição do FD original
			j processoEdicaoCliente				#Próxima iteração

prepararParaExcluirCliente:addi $sp, $sp, -4				#Alocando espaço na pilha para não perder a posição do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (Já chegou na posição do objeto)
			add $a0, $zero, $s0				#Garantindo que só vou ler
			j excluirObjetoCliente				#Indo para a função de retirada do objeto

excluirObjetoCliente:	beq $a2, 64, rebobinarEdicaoCliente		#Se já tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres até a posição do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) vão ficar
			addi $a2, $zero, 1				#Informando que só vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j excluirObjetoCliente				#Proxima iteração

editandoNoArquivoCliente:jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqClien		#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqClien		#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqClien2		#Reabrindo o arquivo temporário, vamos lê-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j guardarDadosAntigosCliente	#Iniciando função para guardar tudo de novo no arquivo

guardarDadosAntigosCliente:	beq $v0, 0, finalizarEdicaoCliente	#Se todos os caracteres foram lidos, então finaliza a edição
				add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
				la $a1, cpfClienteGuardar	#Especificando que vou guardar o caracter lido aqui
				add $a2, $zero, 1		#Especififcando que só um caracter será lido por vez
				jal lerDoArquivo 		#Lendo rs
				add $t0, $zero, $v0		#Guardando o valor de v0 temporáriamente
				add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
				la $a1, cpfClienteGuardar	#Lendo o caracter que foi lido
				addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
				jal guardarEmArquivo		#Guardando cada caracter um por um
				add $v0, $zero, $t0		#Pegando de volta o valor de t0
				j guardarDadosAntigosCliente	#Proxima iteração

finalizarEdicaoCliente: jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqClien2		#Parâmetro com o nome do arquivo do cárdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j armazenamentoCliente		#Armazenando o prato editado
			j exit
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------Cadastrar Cliente----------------------------------------------------------------------------------
funcaoCadastrarCliente: la $a0, digiteCPFCliente		#Carrega a label do CPF do cliente
			la $a1, cpfCliente			#Carrega a label que vai armazenar o cpf do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado

			la $a0, digiteNomeCliente		#Carrega a label do nome do cliente
			la $a1, nomeCliente			#Carrega a label que vai armazenar o nome do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado

			la $a0, digitePrefCliente		#Carrega a label do da preferencia do cliente
			la $a1, prefCliente			#Carrega a label que vai armazenar a preferencia do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado

			j existenciaClienteCadastro		#Vai pra função que verifica se o cliente já foi cadastrado antes

existenciaClienteCadastro:	la $a0, arqClien				#Parâmetro com o nome do arquivo do cliente
				add $a1, $zero, $zero				#Especificando que quero ler o arquivo
				add $a2, $zero, $zero 				#Não sei o que é mode
				jal abrirArquivo				#Chamada da função de abrir arquivo
				add $s0, $v0, $zero				#Pegando o arquivo retornado
				add $a0, $zero, $s0				#Salvando arquivo como parâmetro para editar o prato escolhido
				add $a3, $zero, $zero				#Inicializando a condição de parada
				la $s1, cpfCliente				#Carrega o CPF do cliente que está sendo proucurado
				j procedimentoBuscaCliente



procedimentoBuscaCliente:	beq $v0, $zero, armazenamentoCliente	    	# se v0 == 0 achou fim do arquivo, então o cliente não foi cadastrado
				la $a1, cpfClienteGuardar			#Especificando onde os caracteres vão estar
				beq $a3, 20, clienteJaCadastrado		#Condição, if a3 == 22, então encontrou o cliente
				add $t0, $zero, $a2				#Salvando o indice atual (caso os caracteres estejam sendo iguais)
				addi $a2, $zero, 1 				#Quantidade de caracteres lidos
				jal lerDoArquivo				#Chamada da função de ler o arquivo
				la $s2, cpfClienteGuardar			#Carrega o caracter lido
				addi $a3, $a3, 1				#Incrementa o valor de a3 pra saber se o cliente foi encontrado
				add $a2, $zero, $t0				#Volta o valor do indice para a2
				lb $t1, ($s1)					#Carrega o caracter de indice a2 do nome passado
				lb $t2, ($s2)					#Carrega o caracter lido do arquivo
				addi $a2, $a2, 1				#Incrementa o indice
				addi $s1, $s1, 1				#incrementa o indice de s1 pra pegar o proximo caracter do nome passado
				beq $t2, $t1, procedimentoBuscaCliente		#Verifica se o caracter lido é o mesmo da posição a2 do CPF do cliente, se sim avança pro próximo car
				sub $s1, $s1, $a2				#Se os caracteres forem diferentes, zero o indice do nome do prato
				sub $a2, $a2, $a2 				#Se não for o mesmo, zero o indice e recomeça
				sub $a3, $a3, $a3				#Condição, if a3 == 22, então encontrou o cliente
				j procedimentoBuscaCliente			#Recomeça com a próxima iteração

armazenamentoCliente:	jal fecharArquivo		#Fechando arquivo


			la $a0, arqClien		#Parâmetro com o nome do arquivo do cliente
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			add $a0, $zero, $s0		#Colocando FD como argumento

			la $a1, cpfCliente		#Passar o CPF do cliente como parâmetro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando função para guardar o CPF do cliente no arquivo

			la $a1, virgula			#Passar o ponto e virgula como parâmetro
			add $a2, $zero, 1		#Escolhendo a quantidade máxima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando função para guardar o ponto e virgula

			la $a1, nomeCliente		#Passando o nome do cliente como parâmetro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando função para guardar o nome do cliente no arquivo

			la $a1, virgula			#Passar o ponto e virgula como parâmetro
			add $a2, $zero, 1		#Escolhendo a quantidade máxima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando função para guardar o ponto e virgula

			la $a1, prefCliente		#Passando a preferencia do cliente como parâmetro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando função para guardar a preferencia do cliente no arquivo

			la $a1, quebraLinha		#Passar a quebra de linha como parâmetro para indicar que o objeto rpato foi armazenado
			add $a2, $zero, 2		#Escolhendo a quantidade máxima de caracteres para a quebra de linha
			jal guardarEmArquivo		#Chamando função para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando função pra fechar arquivo
			j telaSucesso			#Cadastro bem sucedido
			j exit

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------Remover Cliente----------------------------------------------------------------------------------
funcaoRemoverCliente:	la $a0, digiteCPFClienteBuscado		#Carrega a label do nome CPF do cliente buscado
			la $a1, cpfClienteProucurado		#Carrega a label que vai armazenar o CPF do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado
			
			la $s1, cpfClienteProucurado		#Preparando o cpf do cliente para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do CPF do cliente buscado
			la $a0, arqClien			#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como parâmetro
			add $a1, $zero, $a3			#Passando o parâmetro de parada
			la $s3, cpfClienteProucurado		#Passando o CPF do cliente buscado para poder fazer as comparações
			jal BuscarObjeto			#Buscando a posição do cliente no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para não dar probleminhas rs
			la $a0, arqClien			#Reabrindo o arquivo rs
			add $a1, $zero, $zero			#Quero ler o arquivo
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			la $a0, arqClien2			#Abrindo o segundo arquivo (armazenamento temporário)
			add $a1, $zero, 9			#Escolhendo pra dar apend no arquivo temporário
			add $a2, $zero, $zero			#Nada de mode
			jal abrirArquivo			#Abrindo o arquivo secundario
			add $s1, $zero, $v0			#armazenando o arquivo temporário em s1
			add $sp, $sp, 4				#Desalocando o espaço usado na pilha
			j processoRemocaoCliente			#Começa a passagem dos caracteres para o próximo arquivo

rebobinarRemocaoCliente:add $t0, $zero, $a2	#Armazenando a quantidade de caracteres excluidos
			lw $a2, 0($sp)		#Pegando o valor original do indice
			addi $sp, $sp, 4	#Desalocando o espaço usado na pilha
			add $a2, $a2, $t0	#Somando o indice, para saber o quanto já foi lido
			add $a0, $zero, $s1	#Garantindo que, caso já tenha acabado o arquivo de leitura, o arquivo de escrita vai ser fechado primeiro.
			j processoRemocaoCliente	#Voltando ao processo original

processoRemocaoCliente: beq $a2, $a3, prepararParaRemoverCliente	#Se tiver chegado na posição do objeto que vai ser editado, então vamos edita-lo
			beq $v0, 0, removendoNoArquivoCliente		#Se v0 = 0, então acabaram os caracteres do arquivo, podemos terminar de editar
			add $t1, $zero, $a2				#Guardando temporariamente a posição do objeto no arquivo
			la $a1, byte					#Escolhendo a label onde os caracteres vão ficar
			add $a0, $zero, $s0				#Pegando o arquivo para pegar o próximo caracter que será lido
			jal lerDoArquivo				#Lendo do arquivo
			add $t4, $zero, $v0				#Armazenando a posição do FD temporariamente
			add $a0, $zero, $s1				#Agora pegando o arquivo para escrever o próximo caracter
			la $a1, byte					#Pegando o carcter quer será armazenado temporáriamente
			add $a2, $zero, 1				#Indicando que é um caracter por vez que será escrito
			jal guardarEmArquivo				#Armazenando no arquivo temporário
			add $a2, $zero, $t1				#Pegando o valor original de a2 (posição do objeto)
			addi $a2, $a2, 1				#Incrementando o indice
			add $v0, $zero, $t4				#Passando a posição do FD original
			j processoRemocaoCliente				#Próxima iteração

prepararParaRemoverCliente:addi $sp, $sp, -4				#Alocando espaço na pilha para não perder a posição do $a3 original
			sw $a2, 0($sp)					#Guardando o valor de $a3 (pra evitar loop infinito)
			sub $a2, $a2, $a2 				#Zerando a3 (Já chegou na posição do objeto)
			add $a0, $zero, $s0				#Garantindo que só vou ler
			j removerObjetoCliente				#Indo para a função de retirada do objeto

removerObjetoCliente:	beq $a2, 64, rebobinarRemocaoCliente		#Se já tiver ignorado o objeto completamente, volta a armazenar o resto dos caracteres
			add $t1, $zero, $a2				#Salvando temporariamente a quantidade de caracteres até a posição do objeto
			la $a1, byte					#Informando onde os caracteres (ignorados) vão ficar
			addi $a2, $zero, 1				#Informando que só vai ler 1 caracter
			jal lerDoArquivo				#Lendo o caracter
			add $a2, $zero, $t1				#Passando o valor original de a2
			addi $a2, $a2, 1				#Incrementa a3
			j removerObjetoCliente				#Proxima iteração

removendoNoArquivoCliente:jal fecharArquivo		#Fecha o arquivo
			add $a0, $zero, $s0		#Fechando o arquivo de leitura
			jal fecharArquivo		#Fecha o outro arquivo
			la $a0, arqClien		#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			la $a0, arqClien		#Reabrindo o arquivo, pra passar os dados dnv para ele
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			la $a0, arqClien2		#Reabrindo o arquivo temporário, vamos lê-lo para passar pro original os dados
			add $a1, $zero, $zero		#Especificando que quero escrever no arquivo (append)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s1, $zero, $v0 		#Guardando o FD
			j removerDadosAntigosCliente	#Iniciando função para guardar tudo de novo no arquivo

removerDadosAntigosCliente:	beq $v0, 0, finalizarRemocaoCliente	#Se todos os caracteres foram lidos, então finaliza a edição
				add $a0, $zero, $s1		#Alternando para o arquivo de leitura (temporario)
				la $a1, cpfClienteGuardar	#Especificando que vou guardar o caracter lido aqui
				add $a2, $zero, 1		#Especififcando que só um caracter será lido por vez
				jal lerDoArquivo 		#Lendo rs
				add $t0, $zero, $v0		#Guardando o valor de v0 temporáriamente
				add $a0, $zero, $s0		#Alternando para o arquivo de escrita (o arquivo normal)
				la $a1, cpfClienteGuardar	#Lendo o caracter que foi lido
				addi $a2, $zero, 1		#Especificando que vai ser salvo 1 caracter
				jal guardarEmArquivo		#Guardando cada caracter um por um
				add $v0, $zero, $t0		#Pegando de volta o valor de t0
				j removerDadosAntigosCliente	#Proxima iteração

finalizarRemocaoCliente: jal fecharArquivo		#Fechando o arquivo de leitura
			add $a0, $zero, $s1		#Alternando para o arquivo de escrita
			jal fecharArquivo		#Fechando o arquivo de escrita
			la $a0, arqClien2		#Parâmetro com o nome do arquivo do cárdapio (temporario)
			addi $a1, $zero, 1		#Especificando que quero escrever no arquivo	(Para zerar tudo que tem nele)
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			jal fecharArquivo		#Fechando o arquivo
			j Main
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------Editar Cliente----------------------------------------------------------------------------------
funcaoEditarCliente: 	la $a0, digiteCPFClienteBuscado		#Carrega a label do nome CPF do cliente buscado
			la $a1, cpfClienteProucurado		#Carrega a label que vai armazenar o CPF do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado

			la $a0, digiteCPFCliente		#Carrega a label do CPF do cliente
			la $a1, cpfCliente			#Carrega a label que vai armazenar o CPF do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado

			la $a0, digiteNomeCliente		#Carrega a label do nome do cliente
			la $a1, nomeCliente			#Carrega a label que vai armazenar o nome do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado

			la $a0, digitePrefCliente		#Carrega a label do da preferencia do cliente
			la $a1, prefCliente			#Carrega a label que vai armazenar a preferencia do cliente
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado

			j buscaCliente

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#===========================================================FIM DO CLIENTE=======================================================================

#===========================================================FUNCIONARIO===============================================================================
#-------------------------------------------------ESCOLHA----------------------------------------------------------------------------------
escolhaFuncionario:	beq $a2, 1, contratarFuncionario	#Chamada da função de cadastro de cliente escolhida
			beq $a2, 2, demitirFuncionario		#Chamada da funcao de remoção de cliente escolhida
			beq $a2, 3, atualizarFuncionario	#Chamada da função de edição de cliente escolhida
			beq $a2, 4, visualizarFuncionario	#Chamada da função de visualização de cliente escolhida
			beq $a2, 5, folhadePag		        #Chamada da função de cadastrar reserva escolhida
			beq $a2, 6, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#--------------------------------------------------CONTRATAR FUNCIONARIO------------------------------------------------------------------------------------
contratarFuncionario: 	la $a0, digitenomeFun		#Carrega a label do nome do funcionario
			la $a1, nomeFun			#Carrega a label que vai armazenar o nome do funcionario
			addi $a2, $zero, 20		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se está tudo ok com o que foi digitado
			
			la $a0, digitecpffun		#Carrega a label do nome CPF do funcionario
			la $a1, cpffun			#Carrega a label do CPF do funcionario
			addi $a2, $zero, 20		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se está tudo ok com o que foi digitado
			
			la $a0, digiteidade		#Carrega a label do valor da idade
			la $a1, idade			#Carrega a label da idade
			addi $a2, $zero, 20		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se está tudo ok com o que foi digitado
		
			la $a0, digitefuncao		#Carrega a label do nome da função do funcionario
			la $a1, funcao			#Carrega a label da funcao
			addi $a2, $zero, 20		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se está tudo ok com o que foi digitado
			
			la $a0, digitesalario		#Carrega a label do nome do salario
			la $a1, salario			#Carrega a label do salario
			addi $a2, $zero, 20		#Define a quantidade máxima de caracteres
			jal chamarJanelaString		#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0
			jal verificacaoString		#Verifica se está tudo ok com o que foi digitado
					
			la $a0, arqFun			#Parâmetro com o nome do arquivo do funcionario
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $a0, $v0, $zero		#Pegando o arquivo retornado
			
			la $a1, nomeFun			#Passar o nome do funcionario como parâmetro
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar o nome no arquivo 
			
			la $a1, cpffun			#Passar CPF do funcionario como parâmetro
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar CPF do funcionario arquivo
			
			la $a1, idade			#Passar CPF do funcionario como parâmetro
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar CPF do funcionario arquivo
			
			la $a1, funcao			#Passar o nome da funcao como parâmetro
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar a funcao no arquivo 
			
			la $a1, salario			#Passar o valor de salario como parâmetro
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres
			jal guardarEmArquivo		#Chamando função para guardar o salario no arquivo 
			
			jal fecharArquivo		#Chamando função pra fechar arquivo
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
acaoPedido:	beq $a2, 1, funcaoCadastrarPedido	#Chamada da função de cadastro de pedidos escolhida
		beq $a2, 2, funcaoRemoverPedido		#Chamada da funcao de remoção de pedidos escolhida
		beq $a2, 3, funcaoEditarPedido		#Chamada da função de edição de pedidos escolhida
		beq $a2, 4, retornaMain			#Retornar para menu principal escolhido
			
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#----------------------------------------------------Cadastrar pedidos----------------------------------------------------------------------------
funcaoCadastrarPedido:	la $a0, digiteNomePratoPedido		#Carrega a label do nome do prato
			la $a1, pratoPedido			#Carrega a label que vai armazenar o nome do prato
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verifica se está tudo ok com o que foi digitado
			la $a0, digiteClienteQuePediu		#Carrega a label do preco do prato
			la $a1, clienteQuePediu			#Carrega a label que vai armazenar o preco do prato
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
			add $a0, $zero, $v0			#Adicionando o que estava em v0 para a0
			jal verificacaoString			#Verificando o preco do prato
			la $a0, digiteDataPedido		#Carrega a label do preco do prato
			la $a1, dataPedido			#Carrega a label que vai armazenar o preco do prato
			addi $a2, $zero, 20			#Define a quantidade máxima de caracteres
			jal chamarJanelaString			#Chama a função que mostra a tela para digitar uma string
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
			add $a0, $zero, $s0			#Passando o arquivo como parâmetro
			add $a1, $zero, $a3			#Passando o parâmetro de parada 
			la $s3, pratoPedido			#Passando o nome do prato buscado para poder fazer as comparações
			jal BuscarObjeto			#Buscando a posição do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para não dar probleminhas rs
		
			la $s1, clienteQuePediu			#Preparando o nome do cliente que pediu para saber o tamanho
			jal stringLen				#Verificando a quantidade de caracteres do nome do prato buscado
			add $a3, $zero, $v0			#Salvando o tamanho da string do nome do prato buscado
			la $a0, arqClien			#Carregando o caminho do arquivo
			add $a1, $zero, $zero			#Ler arquivo
			add $a2, $zero, $zero			#nada de mode
			jal abrirArquivo			#Abrindo o arquivo orginal
			add $s0, $zero, $v0			#Salvando o arquivo em s0
			add $a0, $zero, $s0			#Passando o arquivo como parâmetro
			add $a1, $zero, $a3			#Passando o parâmetro de parada 
			la $s3, clienteQuePediu			#Passando o nome do cliente que pediu buscado para poder fazer as comparações
			jal BuscarObjeto			#Buscando a posição do prato no arquivo original
			jal fecharArquivo			#Fechando o arquivo, para não dar probleminhas rs
					
armazenarPedido:	la $a0, arqPed			#Parâmetro com o nome do arquivo do cárdapio
			addi $a1, $zero, 9		#Especificando que quero escrever no arquivo
			addi $a2, $zero, 0 		#Não sei o que é mode
			jal abrirArquivo		#Chamada da função de abrir arquivo
			add $s0, $zero, $v0 		#Guardando o FD
			add $a0, $zero, $s0		#Colocando FD como argumento
			la $a1, pratoPedido		#Passar o nome do prato como parâmetro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando função para guardar o nome do prato no arquivo
			la $a1, virgula			#Passar o ponto e virgula como parâmetro
			add $a2, $zero, 1		#Escolhendo a quantidade máxima de caracteres para o ponto e virgula
			jal guardarEmArquivo		#Chamando função para guardar o ponto e virgula
			la $a1, clienteQuePediu		#Passando o preco do prato como parâmetro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres para o preco do prato
			jal guardarEmArquivo		#Chamando função para guardar o preco do prato no arquivo
			la $a1, virgula			#Passar o ponto e virgula como parâmetro
			add $a2, $zero, 1		#Escolhendo a quantidade máxima de caracteres para o ponto e virgula
			jal guardarEmArquivo
			la $a1,	 dataPedido		#Passar o nome do prato como parâmetro para guardar no arquivo
			add $a2, $zero, 20		#Escolhendo a quantidade máxima de caracteres para guardar no arquivo
			jal guardarEmArquivo		#Chamando função para guardar o nome do prato no arquivo
			la $a1, quebraLinha		#Passar a quebra de linha como parâmetro para indicar que o objeto rpato foi armazenado
			add $a2, $zero, 2		#Escolhendo a quantidade máxima de caracteres para a quebra de linha
			jal guardarEmArquivo		#Chamando função para guardar o novo prato no arquivo
			jal fecharArquivo		#Chamando função pra fechar arquivo
			j telaSucesso				

#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------------Função remover prato-----------------------------------------------------------------------
funcaoRemoverPedido:
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
#-------------------------------------------------------Função remover prato-----------------------------------------------------------------------
funcaoEditarPedido:
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

#======================================================Fim dos pedidos==============================================================================

#-------------------------------------------------Voltar pro main menu----------------------------------------------------------------------------------
retornaMain: j Main		
#xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
ok: jr $ra	#Temporário!

exit: nop
