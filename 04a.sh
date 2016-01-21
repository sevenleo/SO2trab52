#!/bin/sh
clear

#contar arquivos na pasta , removee a 1a linha de total de conferir print, remover primeira linha do ls
NumArquivos=$(ls| wc -w)

echo "		Palavras	Linhas		Arquivo"

echo __________________________________________________________

echo metodo 1
find * -maxdepth 0 -type f -exec wc -l -c {} \; |  sed 's/ \+/\t\t/g'

echo __________________________________________________________

echo metodo 2
wc -l -c * 2> /dev/null |  sed 's/ \+/\t\t/g' | head -n $NumArquivos  