#Compiler
CC = gcc
#Compiler Flags
CFLAGS = -g -Wall -std=c11

#Source file directory; contains .c and .h files
SRCDIR = src
#Object file directory; contains compiled .o files
OBJDIR = build
#Executable file directory; contains compiled executable files
EXEDIR = bin

#Source files
Project_C_SRCFILES = $(wildcard $(SRCDIR)/*.c)
#Object files
Project_C_OBJFILES = $(patsubst $(SRCDIR)/%.c, $(OBJDIR)/%.o, $(Project_C_SRCFILES))
#Executable file
Project_C_EXE = $(EXEDIR)/sandbox

#Copied stuff from
# https://stackoverflow.com/questions/40621451/makefile-automatically-compile-all-c-files-keeping-o-files-in-separate-folde

all: $(Project_C_OBJFILES)
	$(CC) $^ -o $(Project_C_EXE)

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -I$(SRCDIR) -c $< -o $@

clean: 
	rm -f $(OBJDIR)/*
	rm -f $(EXEDIR)/*

test: all
	./$(Project_C_EXE)
