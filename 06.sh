	
Faz uma copia do arquivo log do servidor de email, essa copia sera nomeada de acordo com o dia de sua criacao.
Em seguida um novo arquivo log ´e criado apagando o anterior.

=================================================================

set -x 
#Exibe os comandos e argumentos na tela em cada linha do script


lbl=$(date +%y%b%d-%H%M%S | tr '[A-Z]' '[a-z]') 
#Salva a data e a hora atual para serem usadas como label para o novo nome do arquivo

maildir=$HOME/Mail 
#Salva na variavel a localizacao da pasta mail que esta na pasta do usuario 


logfile=$maildir/log
#atribui a variavel o caminho do arquivo log dentro da pasta de mail	

bakfile=$logfile$lbl
#atribui na variavel a concatenacao da string referente ao arquivo atual de log com o seu novo nome

if [ -s $logfile ] ; then
#Se o arquivo de existe ...

mv -f $logfile $bakfile 
#renomeia (move) de acordo com a sua nova label

touch $logfile 
#cria um novo arquivo log na localizacao salva

gzip -f -9 $bakfile
#comprime o arquivo de backup
