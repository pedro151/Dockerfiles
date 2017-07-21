@echo off
setlocal ENABLEDELAYEDEXPANSION

FOR /f "tokens=*" %%i IN ('docker-machine env default') DO %%i

Set _DIR=%cd%
Set _PARAMS=%*

Set "Proj=D:/htdocs/web"
Set "ProjV=/var/www"

Set "Driver_D=D:"
Set "DriverV_D=/Users"

Set "Driver_C=C:"
Set "DriverV_C=/c"

call :FUNC_REPLACE_DIR 
call :FUNC_REPLACE_PARAM 
 
docker exec web php %_PARAMS%
echo:&goto:eof

:FUNC_REPLACE_DIR
Set _DIR=%_DIR:\=/%
Set _DIR=!_DIR:%Proj%=%ProjV%!
Set _DIR=!_DIR:%Driver_D%=%DriverV_D%!
Set _DIR=!_DIR:%Driver_C%=%DriverV_C%!

:FUNC_REPLACE_PARAM
Set _PARAMS=%_PARAMS:\=/%
Set _PARAMS=!_PARAMS:%Proj%=%ProjV%!
Set _PARAMS=!_PARAMS:%Driver_D%=%DriverV_D%!
Set _PARAMS=!_PARAMS:%Driver_C%=%DriverV_C%!