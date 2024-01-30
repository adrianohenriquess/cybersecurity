#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{ print $2  }')
memoria_consumida=$(free | grep -i mem | awk '{ print $3  }')

relacao_memoria_atual_total=$(bc <<< "scale=2;$memoria_consumida/$memoria_total * 100" | awk -F. '{ print $1 }')

if [ $relacao_memoria_atual_total -gt 5 ]
then
	mail -s "Consumo de memória acima do limite" tim@compre-tim.com.br<<del
O Consumo de memória esta acima do limite que foi especificado. Atualmente o consumo é de $(free -h | grep -i mem | awk '{ print $3 }')
del
fi 


