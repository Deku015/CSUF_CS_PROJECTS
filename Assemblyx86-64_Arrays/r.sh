#!bin/bash

#Program: 2 Array addition and magnitude
#Author: Shadi Hirbawi

rm *.o
rm *.out
rm *.lis

echo "Assemble manager.asm"
nasm -f elf64 -l manager.lis -o manager.o manager.asm

echo "compile input_array.asm"
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

echo "compile magnitude.asm"
nasm -f elf64 -l magnitude.lis -o magnitude.o magnitude.asm

echo "compile append.asm"
nasm -f elf64 -l append.lis -o append.o append.asm

echo "compile display_array.c using the gcc compiler standard 2017"
gcc -c -Wall -no-pie -m64 -std=c17 -o display_array.o display_array.c

echo "compile main.c using the gcc compiler standard 2017"
gcc -c -Wall -no-pie -m64 -std=c17 -o main.o main.c

echo "Link object files using gcc Linker standard 2017"
g++ -m64 -no-pie -o array.out manager.o input_array.o magnitude.o append.o display_array.o main.o

echo "Run Array Program:"
./array.out

echo "Script file has terminated"

rm *.o
rm *.out
rm *.lis
