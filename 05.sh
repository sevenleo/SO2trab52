#!/bin/sh
clear
mkdir ~/backupSO2 2>/dev/null

echo Arquivos:
ls | cut -d " " -f1 > .05temp.txt
cat .05temp.txt

NumArquivos=$(ls -l| wc -l)
NumArquivos=$(($NumArquivos - 1));
echo Total: $NumArquivos arquivos


echo ----------------------------------------------------------------------
echo CRIANDO BACKUP ~/backupSO2:
echo ----------------------------------------------------------------------
for x in `seq 1 $NumArquivos`
do
    arquivo=`cat .05temp.txt | head -n $x | tail -n 1`
	ls  ~/backupSO2/"$arquivo" 2> /dev/null > /dev/null
	if [ $? -eq 0 ] ; then
		echo "Foi encontrado o backup do $arquivo (criarei uma nova versao)"
		versao=$(ls ~/backupSO2 | grep -cw $arquivo)
		cp $arquivo ~/backupSO2/"$arquivo".v"$versao"
		
	else
		echo Criando copia do arquivo $arquivo
		cp $arquivo  ~/backupSO2
	fi
done

echo ----------------------------------------------------------------------
echo CHECANDO/RESTAURANDO ARQUIVOS EM ~/backupSO2:
echo ----------------------------------------------------------------------
ls -l ~/backupSO2
rm .05temp.txt