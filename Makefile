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
# Ubicacion de los archivos fuente
SRCDIR = .
# Ubicacion de los archivos .o
OBJDIR = .
# Al finalizar:
# 0 No hacer nada
# 1 Eliminar archivos .d
# 2 Eliminar archivos .d y .o
AFT = 0

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

################################# COMPILACION ##################################

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
	ifeq ($(AFT),0)
	endif
	ifeq ($(AFT),1)
		$(RM) $(DEP)
	endif
	ifeq ($(AFT),2)
		$(RM) $(DEP) $(DELOBJ)
	endif

######################## LIMPIEZA PARA SISTEMAS WINDOWS ########################

# Elimina todos menos la fuente
.PHONY: cleanw
cleanw:
	$(DEL) $(WDELOBJ) $(DEP) $(APPNAME)$(EXE) $(APPNAME)

# Elimina archivos temporales
.PHONY: cleandepw
cleandepw:
	ifeq ($(AFT),0)
	endif
	ifeq ($(AFT),1)
		$(DEL) $(DEP)
	endif
	ifeq ($(AFT),2)
		$(DEL) $(DEP) $(WDELOBJ)
	endif

##################################### FIN ######################################