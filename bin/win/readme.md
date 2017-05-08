
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
