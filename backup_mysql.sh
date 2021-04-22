#!/bin/bash

CAMINHO_HOME=/home/[nome do usuário]
cd $CAMINHO_HOME

if [ ! -d backup ]
then
    mkdir backup
fi

mysqldump -u root $1 > $CAMINHO_HOME/backup/$1.sql
# Para usuário root sem senha, para usuários com senh definir parâmentro -p e senha

# assume o que usuário para executar o script passará como parâmetro o nome da instância
if [ $? -eq 0 ]
then
    echo "Backup foi realizado com sucesso"
else
    echo "Houve um problema no backup"
fi