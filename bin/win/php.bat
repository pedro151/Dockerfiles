@echo off

FOR /f "tokens=*" %%i IN ('docker-machine env default') DO %%i

docker exec -it web php %*
