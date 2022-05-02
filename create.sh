#!/bin/bash

docker volume create samba_dados
docker volume create samba_config
docker network create network-sambafiles
docker-compose build
docker-compose up -d
