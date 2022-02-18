# Windows & Linux C/C++ Makefile

## Descripción

El objetivo de **WLCM** es permitir la compilación de un programa multiplataforma de `C/C++` compuesto por múltiples archivos y
carpetas en ambos sistemas operativos de forma fácil y rápida.

De más está decir que el código fuente debe ser compatible con ambos sistemas.

Al compartir el proyecto, cualquiera que cumpla con los [requisitos](#requisitos) podrá compilarlo rápidamente en su
propio sistema operativo.

## Requisitos

### Linux

- **make** y un compilador de **C/C++**. Ambos vienen incluidos en la mayoría de distribuciones de **Linux**.

### Windows

- El compilador de **C/C++** para **Windows**
[MinGW64](https://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win32/Personal%20Builds/mingw-builds/installer/mingw-w64-install.exe/download)
(recomendado) o [MinGW](https://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download).

  Hay muchas guías sobre como instalar **MinGW**, como [esta](https://platzi.com/tutoriales/1469-algoritmos/1901-como-instalar-gcc-para-compilar-programas-en-c-desde-la-consola-en-windows/).
  
  La instalación de **MinGW64** es muy similar. Para no complicarte con las opciones, elige:
  - Versión más reciente
  - Arquitectura `i686` si tu sistema es de 32 bits y `x86_64` si es de 64 bits
  - *Threads* `posix` para mayor portabilidad.
  - *Exception* `seh`
  - Última *build revision* disponible.

  Para comprobar si todo funciona bien, puedes ejecutar `cmd.exe` y el comando `gcc --version` debería funcionar sin
  problemas.

- **make**. Está incluido en los compiladores nombrados. Aparece como `mingw32-make.exe`

**No olvides incluir la ubicación del compilador en la variable de entorno `Path`**

## ¿Cómo usar?

### Crear un proyecto

1. Descarga y copia [Makefile](Makefile), [makeLinux.sh](makeLinux.sh) y [makeWindows.cmd](makeWindows.cmd) a la raíz
del proyecto.
2. Modifica las opciones de [Makefile](Makefile) de acuerdo a tus preferencias.
   Las carpetas [Ejemplo1](Ejemplo1) y [Ejemplo2](Ejemplo2) tienen estructuras
   usuales de proyectos en C.
3. Una vez configurado, ejecuta [makeLinux.sh](makeLinux.sh) o [makeWindows.cmd](makeWindows.cmd) según el sistema
operativo en uso.

### Compartir un proyecto

Una vez realizados los pasos para [crear un proyecto](#crear-un-proyecto), este puede ser compilado tanto en Linux como en
Windows simplemente cumpliendo con los [requisitos](#requisitos) y ejecutando el archivo correspondiente
([makeLinux.sh](makeLinux.sh) o [makeWindows.cmd](makeWindows.cmd)).

Por defecto, cada vez que se ejecuten estos archivos, se eliminará la compilación anterior sin importar en qué SO fue realizada y se
crearán nuevos archivos compatibles con el SO actual.

### Comandos

El archivo [Makefile](Makefile) incluye algunas funciones que no se usan en [makeLinux.sh](makeLinux.sh) ni
[makeWindows.cmd](makeWindows.cmd). Puedes editar estos archivos para hacer uso de ellas o emplearlas directamente
mediante la terminal.

- `init` Crea las carpetas faltantes de las indicadas en las opciones de [Makefile](Makefile).
- `%-depend` Elimina las dependencias del archivo `%`. Útil cuando se cambia su ubicación.
- `clean` Elimina todos los archivos resultantes de una compilación.

Ejemplo: `mingw32-make init`

## Notas

No se puede compilar para **Linux** desde **Windows** ni para **Windows** desde **Linux**.

Es recomendable que ningún archivo ni carpeta contenga espacios o caracteres especiales (como tildes) para evitar
problemas en general. Por ejemplo, en vez de `D:\Programación\Programa Test\` usa `D:\Programacion\Programa_Test\`.

## Créditos

[Makefile](Makefile) es básicamente una traducción al español de
[LaurentTreguier/Makefile](https://github.com/LaurentTreguier/Makefile).
