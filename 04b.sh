#!/bin/sh
 clear
 #conferir print, remover primeira linha do ls
NumArquivos=$(ls -l| wc -l)
NumArquivos=$(($NumArquivos - 1));

echo Palavras Linhas Arquivo
wc -w -l * | head -n $NumArquivos
wc -w -l * > .04btemp.txt

#echo Palavras Linhas Arquivo
Npalavras=$(cat .04btemp.txt | tail -n 1 | cut -d " " -f2)
Nlinhas=$(cat .04btemp.txt | tail -n 1 | cut -d " " -f4)

echo " "
echo Neste diretorio temos:

echo Total de $Npalavras Palavras
echo Total de $Nlinhas linhas
