################################################################################
################################### OPCIONES ###################################
################################################################################

# Todas las carpetas deben terminar en "/" para funcionar

################################### PROYECTO ###################################

# Ubicacion de los archivos fuente
DIR_SRC:=src/
# Ubicacion de archivos a incluir
DIR_INC:=src/include/
# Ubicacion de archivos ".o" y ".d"
DIR_OBJ:=obj/
# Extensión de los archivos fuente
EXT:=c
# Nombre del ejecutable resultante
TARGET:=main

################################## COMPILADOR ##################################

# Compilador
CC:=gcc
# Opciones para C y C++
COMMONFLAGS:=-Wall -O2 -g
# Opciones solo para C
CFLAGS=$(COMMONFLAGS)
# Opciones solo para C++
CXXFLAGS=$(COMMONFLAGS)
# Librerias a enlazar tanto en Linux como en Windows
COMMONLIBS:=
# Librerias a enlazar solo en Windows
WIN32LIBS:=$(COMMONLIBS)
# Librerias a enlazar solo en Linux
LINUXLIBS:=$(COMMONLIBS)

################################################################################
########################### NO MODIFICAR DESDE AQUI ############################
################################################################################

################################## FUNCIONES ##################################

# Retorna la lista de subcarpetas en la carpeta $1
search-dir=$(filter-out $1,$(dir $(wildcard $1*/)))
# Retorna la lista de carpetas y subcarpetas en $1
search-dir-all=$(strip $(call search-dir,$1) $(foreach DIR,$(call search-dir,$1),$(call search-dir-all,$(DIR))))
# Retorna la lista de archivos en las carpetas y subcarpetas de $1
search-file=$(foreach DIR,$1,$(wildcard $(DIR)*.$(EXT)))

################################## VARIABLES ##################################

# Lista de todas las carpetas y subcarpetas que pueden contener archivos fuente
DIR_SRC_ALL:=$(DIR_SRC) $(call search-dir-all,$(DIR_SRC))
# Lista de todas las carpetas y subcarpetas que pueden contener cabeceras
DIR_INC_ALL:=$(DIR_INC) $(call search-dir-all,$(DIR_INC))
# Lista de todos los archivos fuente de la carpeta fuente y sus subcarpetas
SRC:=$(notdir $(call search-file,$(DIR_SRC_ALL)))
# Lista de todos los archivos ".o"
OBJ:=$(SRC:.$(EXT)=.o)
# Lista de todos los -I para encontrar archivos fuente y cabeceras durante la
# compilación
I_SRC:=$(addprefix -I,$(DIR_SRC_ALL))
I_INC:=$(addprefix -I,$(DIR_INC_ALL))

# Variable que contiene todas las direcciones de los archivos fuente, cabeceras,
# ".o" y ".d"
VPATH:=$(DIR_SRC_ALL) $(DIR_OBJ)

# Argumentos que indican al compilador donde están los archivos fuente y
# cabeceras. -MMD crea los archivos ".d"
COMMONFLAGS+=$(I_SRC) $(I_INC) -MMD

############################## SISTEMA OPERATIVO ##############################

# LIBS: Librerías a enlazar según SO
# AND: Clave que permite unir comandos
# CLEAR: Comando que limpia la consola
# MOVE: Comando para mover archivos entre carpetas
# CLEAN: Comando para eliminar archivos
# OBJ_DEP: Lo que se elimina al usar "clean"
ifeq ($(OS),Windows_NT)
	LIBS:=$(WIN32LIBS)
	AND:=&
	CLEAR:=cls
	MOVE:=cmd /c move
	CLEAN:=cmd /c del /q
	OBJ_DEP:=$(DIR_OBJ:%/=%)
else
	LIBS:=$(LINUXLIBS)
	AND:=;
	CLEAR:=clear
	MOVE:=mv
	CLEAN:=rm
	OBJ_DEP:=$(DIR_OBJ)*
endif

#################################### REGLAS ####################################

.PHONY:all init clear %-depend clean

# La regla principal. Compila a TARGET.
# Los archivos ".o" y ".d" son movidos a la carpeta correspondiente.
$(TARGET):$(OBJ)
	-@$(MOVE) *.o $(DIR_OBJ)
	-@$(MOVE) *.d $(DIR_OBJ)
	$(CC) $(addprefix $(DIR_OBJ),$(OBJ)) $(LIBS) -o $(TARGET)

# Crea las carpetas del proyecto si no existen.
init:
	-@mkdir $(DIR_SRC) $(DIR_INC) $(DIR_OBJ)
	@echo CARPETAS DEL PROYECTO CREADAS

# Elimina las dependencias de un archivo en particular. Usar si se modifica la
# ubicación o nombre de un archivo.
%-depend:
	-@cd obj $(AND) $(CLEAN) $(*F).o $(AND) $(CLEAN) $(*F).d
	@echo LAS DEPENDENCIAS DE $(*F).$(EXT) HAN SIDO ELIMINADAS.

# Elimina los archivos resultantes de una compilación anterior.
clean:
	-@$(CLEAN) $(OBJ_DEP) $(TARGET) $(TARGET).exe
	@echo COMPILACION ANTERIOR ELIMINADA

# Esto incluye todos los archivos ".d" al Makefile
-include $(DIR_OBJ)*.d
