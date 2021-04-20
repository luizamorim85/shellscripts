 #!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

# http://localhost é o caminho da sua aplicação web
# para monitorar colocar no crontab editar crontab  contrab - e  para permissão chmod +x web_monitorar.sh
# configurar pacotes SSMTP /etc/ssmtp/ssmtp.conf
# conteúdo ssmtp --> root=seuemaildm@seudominio.com, mailhub=smtp.gmail.com:587,
# AuthUser=seuemaildm@seudominio.com, #AuthPass= ,UseSTARTTLS=yes
# Instalar mailutils

if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" seuemaildm@seudominio.com<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteúdo web.
del
    systemctl restart apache2
fi
