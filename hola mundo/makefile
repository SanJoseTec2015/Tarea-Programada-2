.SUFFIXES: .o .c
.c.o:
	$(CC) -c $(CFLAGS) $<


# Macros

CC = as
CC2 = ld
CFLAGS = -o
CFLAGS2 = -s -o
SRC = hola.asm
OBJ = hola.o


# Reglas expl�citas

all: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(SRC)
	$(CC2) $(CFLAGS2) main $(OBJ)

# Reglas impl�citas

funciones.o: funciones.c funciones.h
main.o: main.c funciones.h
