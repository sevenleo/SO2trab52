#!/bin/sh
clear
#conferir print, remover primeira linha do ls
NumArquivos=$(ls -l| wc -l)
NumArquivos=$(($NumArquivos - 1));

wc -w -l * |head -n $NumArquivos > .04atemp.txt

echo "		Palavras	Linhas		Arquivo"
echo __________________________________________________________
wc -l -c * |  sed 's/ \+/\t\t/g' | head -n $NumArquivos

 