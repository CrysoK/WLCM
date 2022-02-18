@echo off & rem Esta linea evita que los comandos se vean en consola
rem "mingw32-make" puede ser reemplazado por tu propia instalación de "make"
mingw32-make clean & rem Elimina el resultado de compilaciones previas para evitar errores
mingw32-make & rem Compila el proyecto
echo YA PUEDE CERRAR ESTA VENTANA
cmd /k & rem Esta linea mantiene la consola abierta
