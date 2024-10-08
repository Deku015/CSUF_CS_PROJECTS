/*; This program will take an array size and fill/print random IEEE numbers and hex digits
; Copyright (C) 2023 Shadi Hirbawi.                                                                           *
;                                                                                                                           *
;This file is part of the software program "Add arrays".
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https:;www.gnu.org/licenses/>.                            *
;****************************************************************************************************************************
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3**
;
;Author information
;  Author name: Shadi Hirbawi
;  Author email: hirbawishadi@csu.fullerton.edu
;
;Program information
;  Program name: Homework 3
;  Programming languages: Assembly, C, bash, C++
;  Date program began: 2023 March 13
;  Date of last update: 2023 March 13
;  Date of reorganization of comments: 2023 March 13
;  Files in this program: quick.c, executive.asm, fill_random_array.asm, main.cpp, r.sh, show_array.asm
;  Status: Finished.  
;
;This file
;   File name: quick.c
;   Language: C
;   Max page width: 132 columns
;  Assemble: nasm -f elf64 -l quick.lis -o quick.o quick.asm
;   Link: g++ -m64 -std=c++17 -fno-pie -no-pie -o rand_array.out executive.o fill_random_array.o show_array.o main.o quick.o
;   Purpose: compares so that the qsort in the main function can work
;========================================================================================================
*/
#include <stdlib.h>
#include <stdbool.h>

extern int quick(const void * a,const void * b);

int quick(const void * a,const void * b)
{
    //compares size of array and bytes
    if (*(double*)a > *(double*)b) return 1;
    if (*(double*)a < *(double*)b) return -1;
    return 0;
}