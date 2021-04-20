#!/bin/sh
make clean
make
make cleandep
echo COMPILACIÓN TERMINADA. YA PUEDE CERRAR ESTA VENTANA.
exec $SHELL
