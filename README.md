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

> No olvides incluir la dirección del compilador en la variable de entorno `Path`

## ¿Para qué sirve?

El objetivo es permitir la compilación de un programa multiplataforma de `C/C++` compuesto por múltiples archivos en
ambos sistemas operativos de forma fácil y rápida.

De más está decir que el código fuente debe ser compatible con ambos sistemas.

Al compartir el proyecto, cualquiera que cumpla con los [requisitos](#requisitos) podrá compilarlo rápidamente en su
propio sistema operativo.

## ¿Qué hacer?

1. Clona o descarga como ZIP este repositorio. También puedes descargar individualmente los archivos necesarios.
2. Copia [Makefile](Makefile), [MakeLinux.sh](MakeLinux.sh) y [MakeWindows.bat](MakeWindows.bat) a la raíz del proyecto.
Si estos archivos ya existen y solo quieres compilar el proyecto, continúa en el paso 4.
3. Modifica las opciones de [Makefile](Makefile) de acuerdo al proyecto.
4. Una vez configurado, ejecutar según el sistema operativo en uso.

    - `MakeLinux.sh` para **Linux**, a través de la terminal.
    - `MakeWindows.bat` para **Windows**.

    Cada vez que se ejecuten estos archivos, se eliminará la compilación anterior sin importar en qué SO fue realizada y
    se crearán nuevos archivos compatibles con el SO actual.

## Notas

No se puede compilar para **Linux** desde **Windows** ni para **Windows** desde **Linux**.

Es recomendable que ningún archivo ni carpeta contenga espacios o caracteres especiales (como tildes) para evitar
problemas en general. Por ejemplo, en vez de `D:\Programación\Programa Test\` usa `D:\Programacion\Programa_Test\`.

## Créditos

Gracias a **Adriano Markovic** por crear, en su extensión para **Visual Studio Code**, la base del Makefile usado aquí.
