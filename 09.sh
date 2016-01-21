function ff(){ local a="$1"; shift; find . -name $a -print "$@"; } 
#====================================================
#cria a variavel local a de acordo com o parametro passado
#shift = remove uma coluna da tela de exibicao
#procura no diretorio corrente arquivos com a string passada como parametro em seguida printa todos os parametros (nomes)


function ffd(){ local a="$1"; shift; find . -name $a -type d -print "$@"; } 
#====================================================
#muito parecida com a anterior porem busca apenas pastas com o mesmo nome do parametro passado em seguida imprime os parametros (nomes)




function cr() { chmod a+r "$@"; } 
#====================================================
#adiciona a todos os usuarios a permicao de leitura para os arquivos passados como paramtro




function cw() { chmod u+w "$@"; } 
#====================================================
#adiciona ao usuario atual a permicao de escrita para os arquivos passados como paramtro





function cx() { chmod a+x "$@"; } 
#====================================================
#adiciona a todos os usuarios a permicao de execucao para os arquivos passados como paramtro




function crr(){ if [ $# = "0" ] ; then DIR="." ; else DIR="$1" ; fi ;\ find $DIR -type f -exec chmod a+r {} \;; } 
#====================================================
#verifica se a quantidade de parametros ´e igual a zero, se for a variavel dir atribui o valor . (diretorio atual) caso contrario ´e atribuido o valor do primeiro parametro a variavel
#em seguida busca no diretorio escolhido arquivos do tipo F e altera a permissao para que todos os usuarios possam le-los.





function cxr() { if [ $# = "0" ] ; then DIR="." ; else DIR="$1" ; fi ;\ find $DIR -type d -exec chmod a+x {} \; ; } 
#====================================================
#verifica se a quantidade de parametros ´e igual a zero, se for a variavel DIR atribui o valor . (diretorio atual) caso contrario ´e atribuido o valor do primeiro parametro a variavel DIR
#em seguida busca no diretorio escolhido arquivos do tipo DIRETORIO e altera a permissao para que todos os usuarios possam executa-los.







function mc() { echo "comando mc nulo" ; } 
#====================================================
#exibe a mensagem "comando mc nulo" no terminal




function m() { 
 for file in "$@" ; 
 do 
 if [ ! $# = 1 ] ; 
 then 
 echo ------- $file ------- ; echo 
 fi ; 
 if [ -d $file ] ; 
 then 
 ls -F $file 
 else 
 if [ "${file%.Z}x" = "${file}x" -a "${file%.z}x" = "${file}x" \ 
 -a "${file%.gz}x" = "${file}x" ] 
 then 
 more $file 
 else 
 if [ "${file%.bz2}x" = "${file}x" ] ; then 
 bzcat $file 
 else # [ "${file%.gz}x" = "${file}x" ] 
 gzcat $file | more 
 fi ; # bzip2 ou gzip 
 fi ; 
 fi ; 
 if [ ! $# = 1 ] ; 
 then 
 echo 
 fi ; 
 done ; 
}

#====================================================
#