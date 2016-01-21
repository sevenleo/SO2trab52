#!/bin/sh
if [ $# -ne 1 ] ; then
	echo Voce deveria ter entrado com o parametro.
	echo Rode novamente informando a pasta para armazenar/restaurar o backup
	exit 2
fi

echo ______________________________________________________________________
echo ARQUIVOS ORIGINAIS EM $pwd:
echo ______________________________________________________________________
ls .
echo
echo


echo ----------------------------------------------------------------------
echo CRIANDO BACKUP EM $1:
echo ----------------------------------------------------------------------
backup()(
	mkdir "$1" 2> /dev/null > /dev/null
	for arquivo in $(ls .)
	do  
		if [ -d "$arquivo" ] ; then
			ls  "$1"/"$arquivo" 2> /dev/null > /dev/null
			if [ $? -eq 0 ] ; then
				versao=$(ls "$1" | grep -cw $arquivo)
				mkdir "$1"/"$arquivo".v"$versao"		
				cp -r $arquivo/* "$1"/"$arquivo".v"$versao"/
			else
				mkdir "$1"/"$arquivo"
				cp -r $arquivo/* "$1"/"$arquivo"/
			fi
		else
			ls  "$1"/"$arquivo" 2> /dev/null > /dev/null
			if [ $? -eq 0 ] ; then
				echo "Foi encontrado o backup do $arquivo (criarei uma nova versao)"
				versao=$(ls "$1" | grep -cw $arquivo)
				cp $arquivo "$1"/"$arquivo".v"$versao"		
			else
				echo Criando copia do arquivo $arquivo
				cp $arquivo  "$1"
			fi
		fi


	done
)

backup $1

echo
echo ----------------------------------------------------------------------
echo CHECANDO/RESTAURANDO ARQUIVOS EM $1:
echo ----------------------------------------------------------------------
ls $1
rm .05temp.* 2> /dev/null