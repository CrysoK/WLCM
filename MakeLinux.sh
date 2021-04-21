#!/bin/sh
make clean # Elimina el resultado de compilaciones previas para evitar errores
make # Compila el proyecto
make cleandep # Elimina archivos (o no) segun lo especificado en Makefile
echo YA PUEDE CERRAR ESTA VENTANA
exec $SHELL # Esta línea mantiene la terminal abierta
