#!/bin/bash

docker-compose down -v
docker volume rm samba_dados
docker volume rm samba_config
docker network rm network-sambafiles
docker image rm sambafiles:1.0
