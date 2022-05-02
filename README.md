# docker-sambafiles

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

1.crie os volumes utilizados:

```
docker volume create samba_dados
docker volume create samba_config
```

2.Crie a imagem e o container:

```
docker-compose build
docker-compose up -d
```

## Criação de usuários no container

1.Acesse o container:

`docker exec -it meucontainer /bin/bash`

2.Adicionar usuário no grupo criado:  `smbadd usuario grupo`

3.Remover usuário:  `smbrm usuario`

## Acesso via Linux:

Digitar: `smb://ip/arquivos`
