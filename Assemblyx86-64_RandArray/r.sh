#!bin/bash

#Program: Fill array with rand numbers
#Author: Shadi Hirbawi

rm *.o
rm *.out
rm *.lis

echo "Assemble executive.asm"
nasm -f elf64 -l executive.lis -o executive.o executive.asm

echo "Assemble fill_random_array.asm"
nasm -f elf64 -l fill_random_array.lis -o fill_random_array.o fill_random_array.asm

echo "Assemble show_array.asm"
nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm

echo "compile quick.c using the gcc compiler standard 2017"
gcc -c -Wall -no-pie -m64 -std=c17 -o quick.o quick.c

echo "compile main.cpp using the g++ compiler standard 2017"
g++ -c -Wall -no-pie -m64 -std=c++17 -o main.o main.cpp

echo "Link object files using gcc Linker standard 2017"
g++ -m64 -std=c++17 -fno-pie -no-pie -o rand_array.out executive.o fill_random_array.o show_array.o main.o quick.o

echo "Run Executable:"
./rand_array.out

echo "Script file has terminated"

rm *.o
rm *.out
rm *.lis
