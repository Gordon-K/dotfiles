# Detect operating system in Makefile.
# Author: He Tao
# Date: 2015-05-30
OSFLAG 				:=
ifeq ($(OS),Windows_NT)
	OSFLAG += -D WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG += -D AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG += -D IA32
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG += -D LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += -D OSX
	endif
		UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		OSFLAG += -D AMD64
	endif
		ifneq ($(filter %86,$(UNAME_P)),)
	OSFLAG += -D IA32
		endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		OSFLAG += -D ARM
	endif
endif

#Set OS specific details
ifeq ($(OS),Windows_NT)
	#Compiler
	CC = gcc
	#Compiler flags
	CFLAGS = -g -Wall -Werror -Wextra -std=c11
	#Include directories
	INCLUDE_DIRS = -IC:\mingw_dev_lib\SDL2-2.0.10\i686-w64-mingw32\include
	#Library directories
	LIB_DIRS = -LC:\mingw_dev_lib\SDL2-2.0.10\i686-w64-mingw32\lib
	#Links
	CLINKS = -lmingw32
	CLINKS += -lSDL2main
	CLINKS += -lSDL2
else ifeq ($(UNAME_S),Linux)
	CC = clang-9
	#Compiler flags
	CFLAGS = -g -Wall -Werror -Wextra -std=c11
	#Include directories
	INCLUDE_DIRS = -I.
	#Links
	CLINKS = -lSDL2
else
	OS = Unknown
endif

#Set files and directories
SRC = src   #All .c and .h files go here
INC = inc   #All outside libraries
BIN = bin   #Executables
OBJ = obj   #All .o files
IMG = img   #All images used to make things pretty

C_SRCFILES = $(wildcard $(SRC)/*.c)
C_OBJFILES = $(patsubst $(SRC)/%.c, $(OBJ)%.o, $(C_SRCFILES))
C_EXE = bin/Sandbox

#all: $(C_OBJFILES)
#	$(CC) $^ -o $(C_EXE)

#$(OBJ)/%.o: $(SRC)/%.c
#	$(CC) $(CFLAGS) -I$(SRC) -c $< -o $@

all: src/main.c
	$(CC) src/main.c $(INCLUDE_DIRS) $(LIB_DIRS) $(CFLAGS) $(CLINKS) -o $(C_EXE)
