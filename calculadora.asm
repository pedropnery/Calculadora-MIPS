#Projeto da calculadora

.data
menu:	.asciiz 	"=====MENU=====\n1 - Somar\n2 - Subtrair\n3 - Multiplicar\n4 - Dividir\n0 - Sair\nOpção: "
n1:	.asciiz 	"Digite o primeiro número: "
n2:	.asciiz 	"Digite o segundo número: "
r:	.asciiz 	"Resultado(inteiro): "
pula:	.asciiz 	"\n\n"

.macro pulaLinha	#macro pra pular linha
li $v0, 4		#Imprime uma string
la $a0,pula		#a0 = pula
syscall			#Executa
.end_macro		#Fim da macro

.macro menu
li $v0, 4		#Imprime uma string
la $a0, menu		#a0 = menu
syscall			#Executa
li $v0, 5		#Le um número inteiro
syscall			#Executa
move $t0, $v0		#Salvo o número digitado em t0
.end_macro

.text			#Diretiva de dados	
.globl principal	#Diretiva global

principal:		#Função principal
menu			#Chama a macro
#Condições
beq $t0, 1, somar	#Se t0 for digitado 1, vai para o bloco somar
beq $t0, 2, subtrair	#Se t0 for digitado 2, vai para o bloco subtrair
beq $t0, 3, multiplicar	#Se t0 for digitado 3, vai para o bloco multiplicar
beq $t0, 4, dividir	#Se t0 for digitado 4, vai para o bloco dividir
beq $t0, 0, sair	#Se t0 for digitado 0, vai para o bloco sair

 somar:			#Bloco somar
 li $v0, 4		#Imprime uma string
 la $a0, n1		#a0 = n1
 syscall		#Executa
 li $v0, 5		#Le um número inteiro
 syscall
 move $t1, $v0		#Salva o numero digitado em t1
 #Pede o segundo número
 li $v0, 4		#Imprime uma string
 la $a0, n2		#a0 = n2
 syscall		#Executa
 li $v0, 5		#Le um número inteiro
 syscall		#Executa
 move $t2, $v0		#Salva o número digitado em t2
 add $t3, $t1, $t2	#Soma: t3 = t1 + t2
 #Mostra o resultado na tela
 li $v0, 4		#Imprime uma string
 la $a0, r		#a0 = r
 syscall		#Executa
 li $v0, 1		#Imprime um númeo inteiro
 la $a0, ($t3)		#a0 = t3
 syscall		#Executa
 pulaLinha		#Executa a macro pulaLinha
 j principal		#Executa o bloco principal
 
 subtrair: 
 li $v0, 4		#Imprime uma string
 la $a0, n1		#a0 = n1
 syscall		#Executa
 li $v0, 5		#Le um número inteiro
 syscall		#Executa
 move $t1, $v0		#Salva o número digitado em t1
 #Pede segundo número
 li $v0, 4		#Imprime uma string
 la $a0, n2		#a0 = n2
 syscall		#Executa
 li $v0, 5		#Le um número inteiro
 syscall		#Executa
 move $t2, $v0		#Salva o número digitado em t2
 sub $t3, $t1, $t2	#Subtrai: t3 = t1 - t2
 #Mostra o resultado na tela
 li $v0, 4		#Imprime uma string
 la $a0, r		#a0 = r
 syscall		#Executa
 li $v0, 1		#Imprime um inteiro
 la $a0, ($t3)		#a0 = t3
 syscall		#Executa
 pulaLinha		#Executa o macro pulaLinha
 j principal		#Executa o bloco principal
 
 multiplicar:
 li $v0, 4		#Imprime uma string
 la $a0, n1		#a0 = n1
 syscall		#Executa
 li $v0, 5		#Le um número inteiro
 syscall 		#Executa
 move $t1, $v0		#Salva o número digitado em t1
 #Pede segundo número
 li $v0, 4		#Imprime uma string
 la $a0, n2		#a0 = n2
 syscall		#Executa
 li $v0, 5		#Le um número inteiro
 syscall		#Executa
 move $t2, $v0		#Salva o númeo digitado em t2
 mul $t3, $t1, $t2	#Multiplica: t3 = t1 * t2
 #Mostra resultado na tela
 li $v0, 4		#Imprime uma string
 la $a0, r		#a0 = r
 syscall		#Executa
 li $v0, 1		#Imprime um número inteiro
 la $a0, ($t3)		#a0 = t3
 syscall		#Executa
 pulaLinha		#Executa a macro pulaLinha
 j principal		#Executa o bloco principal
 
 dividir:
 li $v0,4		#Imprime uma string
 la $a0, n1		#a0 = n1
 syscall		#Executa
 li $v0, 5		#Le um número inteiro
 syscall		#Executa
 move $t1, $v0		#t1 = v0
 #Pede segundo número
 li $v0, 4		#Imprime uma string
 la $a0, n2		#a0 = n2
 syscall 		#Executa
 li $v0, 5		#Le um número inteiro
 syscall		#Execute
 move $t2, $v0		#t2 = a0
 div $t3, $t1, $t2	#Divide: t3 = t1 / t2
 #Mostra o resultado na tela
 li $v0, 4		#Imprime uma string
 la $a0, r		#a0 = r
 syscall		#Executa
 li $v0, 1		#Imprime um número intiero
 la $a0, ($t3)		#a0 = t3
 syscall		#Executa
 pulaLinha		#Executa a macro pulaLinha
 j principal		#Executa o bloco principal
 
 sair:
 li $v0, 10		#Prepara para encerrar o programa
 syscall		#Executa