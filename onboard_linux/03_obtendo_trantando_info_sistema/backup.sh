#!/bin/bash

echo "Digite o diretório de backup:"
read diretorio_bkp

cp -rv $diretorio_bkp ~/backup
echo "" 
echo "Backup Concluído!"

