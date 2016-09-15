@echo off

docker exec -it web /bin/bash -c "cd /var/www; composer %*"
