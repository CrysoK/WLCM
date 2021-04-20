
## Requisitos

### Linux

- **make** y un compilador de **C/C++**. Ambos vienen incluidos en la mayoría de distribuciones de **Linux**.

### Windows

- Un compilador de **C/C++** para **Windows**, como [MinGW](https://sourceforge.net/projects/mingw/files/).

- **make**. Para esto hay varios métodos. Lo más sencillo es instalar [Chocolatey](https://chocolatey.org/install) y luego usar el comando:

```bash
choco install make
```

#### Instalación rápida de Chocolatey

1. Ejecuta **PowerShell** como administrador y copia lo siguiente:

    ```bash
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    ```

2. Presiona `Enter` y espera a que se complete la instalación.
3. Ya puedes instalar `make`.

## ¿Para qué sirve?

La idea es facilitar la compilación de un proyecto de `C/C++` tanto en **Linux** como en **Windows**.

El código fuente debe ser compatible con ambos sistemas.

Al usar esto en un proyecto, cualquier persona podrá compilarlo rápidamente para su propio sistema operativo (siempre que cumpla con los [Requisitos](#requisitos)).

## ¿Qué hacer?

1. Clona o descarga como ZIP este repositorio. También puedes descargar individualmente los archivos necesarios.
2. Copia [Makefile](Makefile), [so_linux.sh](so_linux.sh) y [so_windows.bat](so_windows.bat) a la raíz del proyecto. Si estos archivos ya existen y solo quieres compilar el proyecto, continúa en el paso 4.
3. Modifica las opciones de [Makefile](Makefile) de acuerdo al proyecto.
4. Una vez configurado, ejecutar según el sistema operativo en uso.

    - `so_linux.sh` para **Linux**, a través de la terminal.
    - `so_windows.bat` para **Windows**.

    Cada vez que se ejecuten estos archivos, se eliminará la compilación anterior sin importar en qué SO fue realizada y se crearán nuevos archivos compatibles con el SO actual.
    > No se puede compilar para **Linux** desde **Windows** ni para **Windows** desde **Linux**.

## Créditos

Gracias a **Adriano Markovic** por crear la base del Makefile usado aquí en su extensión para **Visual Studio Code**.
