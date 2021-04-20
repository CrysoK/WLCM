# Información

## Requisitos

### Linux

`make` viene incluido en todas las distribuciones **Linux**.

### Windows

Es necesario instalar `make`. Para esto hay varios métodos. Lo más sencillo es instalar [Chocolatey](https://chocolatey.org/install) y luego usar el comando:

```bash
choco install make
```

También es necesario tener instalado un compilador de `C/C++` para **Windows**.

## Función

La idea es facilitar la compilación de un proyecto de `C/C++` tanto en **Linux** como en **Windows**. Obviamente, el código fuente debe ser compatible con ambos sistemas.

Al incluir estos archivos en tu proyecto cualquier persona podrá compilarlo rápidamente para su propio sistema operativo.

## Uso

Copiar los archivos a la carpeta del proyecto.

Modificar [Makefile](Makefile) de acuerdo al proyecto.

Una vez configurado, ejecutar según el sistema operativo en uso.

- `so_linux.sh` para **Linux**.
- `so_windows.bat` para **Windows**.

Cada vez que se ejecuten estos archivos, se eliminará la compilación anterior sin importar en qué SO fue realizada y se crearán nuevos archivos compatibles con el SO actual.
> No se puede compilar para **UNIX** desde **Windows** ni para **Windows** desde **UNIX**.

## Créditos

Gracias a **Adriano Markovic** por crear la base del Makefile usado aquí en su extensión para **Visual Studio Code**.
