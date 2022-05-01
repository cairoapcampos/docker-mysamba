#!/bin/bash

docker-compose down -v
docker volume rm samba_dados
docker volume rm samba_config
docker image rm docker-smb2_samba
