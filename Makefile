################################################################################
################################### OPCIONES ###################################
################################################################################

################################## COMPILADOR ##################################

# Compilador
CC = gcc
# Parametros
CXXFLAGS = -g -Wall
LDFLAGS = 

################################### PROYECTO ###################################

# Nombre del ejecutable
APPNAME = main
# Extension de los archivos fuente
EXT = .c
# Ubicacion de los archivos fuente ("." para raiz)
SRCDIR = .
# Ubicacion de los archivos .o ("." para raiz)
OBJDIR = .
# Al finalizar:
# 0 - No hacer nada
# 1 - Eliminar archivos .d
# 2 - Eliminar archivos .d y .o
AFT := 0

################################################################################
####################### NO CAMBIAR NADA DESDE ESTE PUNTO #######################
################################################################################

SRC = $(wildcard $(SRCDIR)/*$(EXT))
OBJ = $(SRC:$(SRCDIR)/%$(EXT)=$(OBJDIR)/%.o)
DEP = $(OBJ:$(OBJDIR)/%.o=%.d)
# Para sistemas UNIX
RM = rm
DELOBJ = $(OBJ)
# Para sistemas Windows
DEL = del
EXE = .exe
WDELOBJ = $(SRC:$(SRCDIR)/%$(EXT)=$(OBJDIR)\\%.o)
ifeq ($(AFT),0)
	AFTL = @echo [Ningun archivo eliminado]
	AFTW = @echo [Ningun archivo eliminado]
endif
ifeq ($(AFT),1)
	AFTL = $(RM) $(DEP)
	AFTW = $(DEL) $(DEP)
endif
ifeq ($(AFT),2)
	AFTL = $(RM) $(DEP) $(DELOBJ)
	AFTW = $(DEL) $(DEP) $(WDELOBJ)
endif

################################# COMPILACION ##################################

.PHONY: all
all: $(APPNAME)

# Builds the app
$(APPNAME): $(OBJ)
	$(CC) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

# Creates the dependecy rules
%.d: $(SRCDIR)/%$(EXT)
	@$(CPP) $(CFLAGS) $< -MM -MT $(@:%.d=$(OBJDIR)/%.o) >$@

# Includes all .h files
-include $(DEP)

# Building rule for .o files and its .c/.cpp in combination with all .h
$(OBJDIR)/%.o: $(SRCDIR)/%$(EXT)
	$(CC) $(CXXFLAGS) -o $@ -c $<

######################### LIMPIEZA PARA SISTEMAS UNIX ##########################

# Elimina todos menos la fuente
.PHONY: clean
clean:
	$(RM) $(DELOBJ) $(DEP) $(APPNAME) $(WDELOBJ) $(APPNAME)$(EXE)

# Elimina archivos temporales
.PHONY: cleandep
cleandep:
	$(AFTL)

######################## LIMPIEZA PARA SISTEMAS WINDOWS ########################

# Elimina todos menos la fuente
.PHONY: cleanw
cleanw:
	$(DEL) $(WDELOBJ) $(DEP) $(APPNAME)$(EXE) $(APPNAME)

# Elimina archivos temporales
.PHONY: cleandepw
cleandepw:
	$(AFTW)

##################################### FIN ######################################