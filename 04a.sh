#!/bin/sh

#conferir print, remover primeira linha do ls
NumArquivos=$(ls -l| wc -l)
NumArquivos=$(($NumArquivos - 1));

echo Palavras Linhas Arquivo
wc -w -l * | head -n $NumArquivos

