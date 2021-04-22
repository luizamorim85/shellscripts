#!/bin/bash

CAMINHO_BACKUP=/home/(usuário)/backup
cd $CAMINHO_BACKUP

#verificar se existe pasta com a data do dia, senão cria pasta com essa data
data=$(date +%F)
if [ ! -d $data ]
then
    mkdir $data
fi

tabelas=$(mysql -u root nome-banco -e "show tables;" | grep -v Tables)
for tabela in $tabelas
do
    mysqldump -u root nome-banco $tabela > $CAMINHO_BACKUP/$data/$tabela.sql
done

#enviado para cloud, nesse caso um bucket amazon (necessário amazon CLI iinstalado e configurado a conta)
aws s3 sync $CAMINHO_BACKUP s3://[nome do seu bucket]
