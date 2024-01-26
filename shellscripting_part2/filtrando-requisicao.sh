#!/bin/bash

#-z verifica se o parametro esta vazio
if [ -z $1 ]
then
	while [ -z $requisicao ]
	do
		read -p "Voce esqueceu de colocar o parametro (GET, PUT, POST, DELETE): " requisicao
		parametro_maiusculo=$(echo $requisicao | awk '{ print toupper($1) }')
	done
else		
	parametro_maiusculo=$(echo $requisicao | awk '{ print toupper($1) }')
fi

case $parametro_maiusculo in
        GET)
        cat apache.log | grep GET
        ;;

        POST)
        cat apache.log | grep POST
        ;;

        PUT)
        cat apache.log | grep PUT
        ;;

        DELETE)
        cat apache.log | grep DELETE
        ;;

        *)
        echo "O parametro passado nao e valido"
        ;;
esac
