#!/bin/sh
clear
mostrar(){
	echo "Numero1: $numero1"
	echo "Numero2: $numero2"
}

op="+"
somar(){
	somatorio=$(($numero1 $op $numero2));
	echo "$numero1 $op $numero2 = $somatorio"
	return 0
}

echo "Numero 1:"
read numero1


echo "Numero 2:"
read numero2

mostrar
somar