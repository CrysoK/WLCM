#!/bin/sh
make clean # Elimina el resultado de compilaciones previas para evitar errores
make # Compila el proyecto
echo YA PUEDE CERRAR ESTA VENTANA
exec $SHELL # Esta línea mantiene la terminal abierta
