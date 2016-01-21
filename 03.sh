#!/bin/sh



# escolheOP(){
# 	case $operacao in
# 		1) op="+" ;;
# 		2) op="-" ;;
# 		3) op="/" ;;
# 		4) op="*" ;;
# 		5) exit 0 ;;
# 		*) echo "Opcao nao existe, escolha novamente: (1-5)" ;;
# 	esac
# }

# executar(){
# 	numero1=$subtotal;
# 	subtotal=$(($subtotal $op $numero2));
# 	historico=$(echo "$numero1 $op $numero2 = $subtotal");
# 	return 0
# }




escolheOP(){
	case $operacao in
		1) Adicao ;;
		2) Subtracao ;;
		3) Divisao ;;
		4) Multiplicacao ;;
		5) exit 0 ;;
		*) echo "Opcao nao existe" ;;
	esac
}


Adicao(){
	numero1=$subtotal;
	subtotal=$(($subtotal + $numero2));
	historico=$(echo "$numero1 + $numero2 = $subtotal");
	return 0
}

Subtracao(){
	numero1=$subtotal;
	subtotal=$(($subtotal - $numero2));
	historico=$(echo "$numero1 - $numero2 = $subtotal");
	return 0
}

Multiplicacao(){
	numero1=$subtotal;
	subtotal=$(($subtotal * $numero2));
	historico=$(echo "$numero1 '* $numero2 = $subtotal"); #corrigir este print, olhar slides
	return 0
}

Divisao(){
	numero1=$subtotal;
	subtotal=$(($subtotal / $numero2));
	historico=$(echo "$numero1 / $numero2 = $subtotal");
	return 0
}

Sair(){
	exit ;}



#apos a primeira entrada as operacoes usarao o subtotal ja calculado para continar a conta, logo so precisara de uma entrada
echo "Numero 1:"
read subtotal

while [ true ] 
do
	clear
	echo $historico
	echo "Numero 1:"
	echo $subtotal
	#read numero1

	echo "Numero 2:"
	read numero2

	echo "(1) para Adicao"
	echo "(2) para Subtracao"
	echo "(3) para Divisao"
	echo "(4) para Multiplicacao"
	echo "(5) para Sair"

	read operacao
	escolheOP
	#executar
done