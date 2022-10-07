# docker-mysamba

## Definição de grupo

1.Edite o Dockerfile trocando "grupo" das linhas abaixo para o nome do grupo desejado:

```
RUN addgroup grupo
RUN chgrp grupo /dados && chmod 770 /dados
```

2. Edite o arquivo `smb.conf` trocando novamente "grupo" das linhas abaixo para o nome do grupo desejado:

```
valid users = @grupo
force group = grupo
```

## Criação do container

1.Criar os volumes e a rede:

```
docker volume create mysamba_dados
docker volume create mysamba_config
docker network create network-mysamba
```

2.Criação da imagem e do container:

```
docker-compose build
docker-compose up -d
```
**Obs:** Rodar o script `./create.sh` faz o mesmo das etapas 1 e 2.

## Criação de usuários no container

1.Acessar o container:

`docker exec -it mysamba /bin/bash`

2.Adicionar usuário no grupo criado:  `smbadd usuario grupo`

3.Remover usuário:  `smbrm usuario`

## Acesso via Linux:

Digitar: `smb://ip/arquivos`
