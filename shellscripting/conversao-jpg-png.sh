#!/bin/bash


converte_imagem() {
cd imagens-livros/

#se nao existe o diretorio png, crie
if [ ! -d png ]
then 
	mkdir png
fi

for imagem in *.jpg
do 
        local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')
	convert $imagem_sem_extensao.jpg png/$imagem_sem_extensao.png
done
}

#o numero 2 pega o erro e pode ser direcionado para um arquivo erros_conversao.txt
converte_imagem 2>erros_conversao.txt
#$? pega o status de saida da função
if [ $? -eq 0 ] 
then
	echo "Conversão realizada com sucesso!"
else
	echo "Houve uma falha no processo de conversão."
fi

