#!/bin/bash

docker volume create mysamba_dados
docker volume create mysamba_config
docker network create network-mysamba
docker-compose build
docker-compose up -d
