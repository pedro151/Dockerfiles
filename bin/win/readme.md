    CMD interactive
        FOR /f "tokens=*" %i IN ('docker-machine env default') DO %i
    CMD Batch scripts
        FOR /f "tokens=*" %%i IN ('docker-machine env default') DO %%i
    PowerShell:
        docker-machine env default | iex
    

# montar volumes adicionais
vi /mnt/sda1/var/lib/boot2docker/bootlocal.sh

#!/bin/bash sh

sudo mkdir -p //c/Users
sudo mount -t vboxsf c/Users //c/Users

