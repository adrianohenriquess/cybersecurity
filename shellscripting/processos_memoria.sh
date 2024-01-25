#!/bin/bash

#pega todos os processos do sistema ordena pelo maior ocupando a memoria
#head traz só os 10 primeiros e -n 11 e o grep pega só os numeros do retorno 
#do comando head

if [ ! -d log ]
then
	mkdir log
fi

processos_memoria(){
	processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])
	for pid in $processos
	do
		nome_processo=$(ps -p  $pid -o comm=)
		#imprime a data e hora e redireciona para o arquivo com a variavel nome_processo.log
		#-n não pula linha no final da execução
		echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log
		tamanho_processo=$(ps -p $pid -o size | grep [0-9])
		#bc <<< faz a divisão e coloquei o scale 2 para duas casas depois da ,
		#envolve isso com MB e joga no arquivo
		echo "$(bc <<< "scale=2;$tamanho_processo/1024") MB" >> log/$nome_processo.log
	done
}

processos_memoria
if [ $? -eq 0 ]
then
	echo "Os arquivos foram salvos com sucesso"
else
	echo "Houve um problema na hora de salvar os arquivos"
fi

