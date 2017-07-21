
    CMD interactive
        FOR /f "tokens=*" %i IN ('docker-machine env default') DO %i
    CMD Batch scripts
        FOR /f "tokens=*" %%i IN ('docker-machine env default') DO %%i
    PowerShell:
        docker-machine env default | iex
    

# montar volumes adicionais

Execute o ssh boot2docker no terminal com comando:

```bash
docker-machine ssh
```

deposi crie o arquivo bootlocal.sh:

```bash
vi /mnt/sda1/var/lib/boot2docker/bootlocal.sh
```

e dentro coloque o conteudo

```sh
#!/bin/bash sh

sudo mkdir -p //c/Users
sudo mount -t vboxsf c/Users //c/Users
```

# inicia o ambiente default
crie a maquina virtual com nome 'default'
```bash
docker-machine create --driver virtualbox default
```

inicia o ambiente default
```bash
docker-machine start

docker-machine env --shell cmd default
```

mostra containers executando (-a mostra containers existentes)
```bash
docker ps
```

# criar containers com imagem do ubuntu 16.04 executando o bash
```bash
docker run -i -t ubuntu:16.04 /bin/bash
```
 (ctrl+p+q) sai do container e deixa executando
 volta para o container que esta sendo executado
 ```bash
docker attach <CONTAINER ID>
```

#### criar container na porta 8080
```bash
docker run -i -t -p 8080:80 ubuntu:16.04 /bin/bash
```
 
#### cria uma imagem baseada no Dockerfile
```bash
docker build -t "simple_flask:dockerfile" .
```
#### para criar --volume
1) deve criar o alias do terminal compartilhando a pasta no virtual box Caminho da pasta : D:\
Nome da pasta : /Users e marcar (montar automaticamente) o nome da pasta d:\ sera /Users
```bash
docker run -it -v /Users/projects:/var/www ubuntu:16.04 /bin/bash
```
