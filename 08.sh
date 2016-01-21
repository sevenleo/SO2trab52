Procura recursivamente dentro da pasta /home/$1/ algum arquivo chamado core. Caso seja encontrado ele ´e apagado
=================================================================

cd /home/$1 ; 
#abre a pasta que foi passada como paremtro para o script (a pasta deve estar dentro da \home)


/bin/ls ; 
#lista o conteudo da pasta


echo 
#imprime uma linha vazia


for UU in $(/bin/ls) ; do
#para cada  arquivo listado faça

cd $UU 
#se for pasta abre 


if [ -f core ] ; then 
#se core existir e não for diretório.

rm core 
#apagar

echo $UU 
#imprimir local 

cd - 
#volta uma pasta
