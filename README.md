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

Estos tres archivos facilitan la compilación de un proyecto de `C/C++` tanto para sistemas operativos basados en **UNIX** como para **Windows**.

## Uso

Copiar los archivos a la carpeta del proyecto.

Modificar el archivo [Makefile](Makefile) de acuerdo al proyecto.

Una vez configurado, ejecutar el archivo correspondiente al sistema operativo en uso.

- `so_linux.sh` para sistemas basados en **UNIX** (como **Linux**).
- `so_windows.bat` para sistemas **Windows**.

Cada vez que se ejecuten estos archivos, se eliminará la compilación anterior sin importar en qué SO fue realizada y se crearán archivos compatibles con el SO actual.
> No se puede compilar para **UNIX** desde **Windows** ni para **Windows** desde **UNIX**.
