#!/bin/sh
make clean
make
make cleandep
echo YA PUEDE CERRAR ESTA VENTANA
exec $SHELL
