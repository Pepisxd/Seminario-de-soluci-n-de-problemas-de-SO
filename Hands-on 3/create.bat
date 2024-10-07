
@echo off
:: Crear el archivo de texto plano "mytext.txt" y agregar "Hola Mundo"
echo Hola Mundo > mytext.txt
echo Archivo mytext.txt creado con la cadena "Hola Mundo".

:: Desplegar el contenido del archivo mytext.txt en la terminal
echo Contenido del archivo mytext.txt:
type mytext.txt

:: Crear el subdirectorio "backup"
mkdir backup
echo Subdirectorio "backup" creado.

:: Copiar mytext.txt al subdirectorio "backup"
copy mytext.txt backup
echo Archivo mytext.txt copiado a la carpeta backup.

:: Listar el contenido del subdirectorio "backup"
echo Contenido del subdirectorio backup:
dir backup

:: Eliminar el archivo mytext.txt del subdirectorio "backup"
del backup\mytext.txt
echo Archivo mytext.txt eliminado del subdirectorio backup.

:: Eliminar el subdirectorio "backup"
rmdir backup
echo Subdirectorio "backup" eliminado.

:: Fin del script
pause
