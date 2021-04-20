 #!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)

# http://localhost é o caminho da sua aplicação web, configurar ssmtp e mailutis


if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" seuemaildm@seudominio.com<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteúdo web.
del
    systemctl restart apache2
fi
