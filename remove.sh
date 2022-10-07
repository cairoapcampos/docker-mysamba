#!/bin/bash

docker-compose down -v
docker volume rm mysamba_dados
docker volume rm mysamba_config
docker network rm network-mysamba
docker image rm mysamba:1.0
