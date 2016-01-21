	Altera a prioridade dos processos do usuario.

=================================================================

ps -U $USER -o "%p %n %a" 
#lista todos os processos do usuario atual detalhando o nome dos arquivos e localizacao dos arquivos

egrep $1
#faz a busca de acordo com o primeiro argumento


egrep -v 'ps|egrep|re-nice' 
#nao mostra linhas com as seguintes palavras ps|egrep|re-nice

cut -d ' ' -f 1 
#exibe os textos das linhas at´e o primeiro espaço 

renice +8 $P > /dev/null 
#altera a prioridade do processo, mas nao exibe nada na tela caso a operacao seja concluida com sucesso
