#!/bin/sh
clear
usuarios(){
	#grep -w = palavra exata // grep -i =  maiusculas e minusculas  
	cat /etc/passwd | cut -f 1 -d ':' | grep -iw "$user"
	
	if [ $? -eq 0 ] ; then
        	echo "$user e´ um usuario cadastrado"
        	return 0;
	else
	        echo "$user nao e´ um usuario cadastrado"
	        return 2;
	fi
}	

echo "Informe o nome de usuario a ser consultado"
read user

usuarios
