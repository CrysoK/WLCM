
## Requisitos

### Linux

`make` viene incluido en todas las distribuciones **Linux**.

### Windows

Es necesario instalar `make`. Para esto hay varios métodos. Lo más sencillo es instalar [Chocolatey](https://chocolatey.org/install) y luego usar el comando:

```bash
choco install make
```

También es necesario tener instalado un compilador de `C/C++` para **Windows** como [MinGW](https://sourceforge.net/projects/mingw/files/).

## ¿Para qué sirve?

La idea es facilitar la compilación de un proyecto de `C/C++` tanto en **Linux** como en **Windows**.

El código fuente debe ser compatible con ambos sistemas.

Al usar esto en un proyecto cualquier persona podrá compilarlo rápidamente para su propio sistema operativo (siempre que cumpla con los [Requisitos](#requisitos)).

## ¿Qué hacer?

Clonar o descargar como ZIP este repositorio. También se pueden descargar individualmente los archivos necesarios.

Copiar [Makefile](Makefile), [so_linux.sh](so_linux.sh) y [so_windows.bat](so_windows.bat) a la raíz del proyecto.

Modificar [Makefile](Makefile) de acuerdo al proyecto.

Una vez configurado, ejecutar según el sistema operativo en uso.

- `so_linux.sh` para **Linux**, a través de la terminal.
- `so_windows.bat` para **Windows**.

Cada vez que se ejecuten estos archivos, se eliminará la compilación anterior sin importar en qué SO fue realizada y se crearán nuevos archivos compatibles con el SO actual.
> No se puede compilar para **Linux** desde **Windows** ni para **Windows** desde **Linux**.

## Créditos

Gracias a **Adriano Markovic** por crear la base del Makefile usado aquí en su extensión para **Visual Studio Code**.
