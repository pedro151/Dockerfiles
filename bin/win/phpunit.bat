@echo off

FOR /f "tokens=*" %%i IN ('docker-machine env default') DO %%i

SET _DIR=%cd%
SET _ALLPARAM=%*
SET _BARCONVERT=%_ALLPARAM:\=/%
SET _PARAMS=%_BARCONVERT:D:=/Users%
SET _PARAMS=%_BARCONVERT:C:=/c/Users%

docker run -it --rm -v %_DIR%:%_DIR% -w %_DIR%  --net=host --sig-proxy=true --pid=host  originalbrownbear/php:7-cli-phpunit-xdebug phpunit %_PARAMS%
