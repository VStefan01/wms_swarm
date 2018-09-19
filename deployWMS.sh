#!/bin/bash

function deploy {
  serviceUp="$(docker stack ls | grep WMS | echo $?)"
    echo "serviceUp value is ${serviceUp}"
    if [ $serviceUp -eq 0 ]; then
        echo "this is branch update"
        docker service update --force --image wms/app WMS_app
        
    else
        echo "this is branch deploy"
        docker stack deploy -c docker-compose.yml WMS
        
    fi
    return
}

deploy
