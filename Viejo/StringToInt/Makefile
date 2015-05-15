# Macros

CC = yasm
CC2 = ld
CFLAGS = -f elf64 -o
CFLAGS2 = -o
SRC = String-to-int.asm
OBJ = String-to-int.o


# Reglas expl�citas

all: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) $(SRC)
	$(CC2) $(CFLAGS2) main $(OBJ)
