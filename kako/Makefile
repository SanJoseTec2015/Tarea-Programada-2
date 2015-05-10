# Macros

CC = yasm
CC2 = ld
CFLAGS = -f elf64 -o
CFLAGS2 = -o
SRC = progra2.asm
OBJ = progra2.o


# Reglas expl�citas

all: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(SRC)
	$(CC2) $(CFLAGS2) progra2 $(OBJ)
