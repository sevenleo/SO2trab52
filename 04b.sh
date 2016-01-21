#!/bin/sh
clear

#contar arquivos na pasta , removee a 1a linha de total de conferir print, remover primeira linha do ls
NumArquivos=$(ls| wc -w)



echo Palavras
find * -maxdepth 0 -type f -exec wc -w {} \; | cut -d" " -f1 > .04bpalavras.txt

echo linhas
find * -maxdepth 0 -type f -exec wc -l {} \; | cut -d" " -f1 > .04blinhas.txt


Nlinhas=0;
for line in $(cat .04blinhas.txt)
do
	Nlinhas=$(($Nlinhas + $line));
done
	  
Npalavras=0;
for line in $(cat .04bpalavras.txt)
do
	Npalavras=$(($Npalavras + $line));
done

echo Neste diretorio temos:
echo Total de $Npalavras Palavras
echo Total de $Nlinhas linhas
