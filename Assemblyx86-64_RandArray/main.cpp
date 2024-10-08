/*; This program will allow a user to input float numbers in an array A and array B, print the magnitude, and be able to unionize them.
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
;   File name: main.cpp
;   Language: C++
;   Max page width: 132 columns
;  Assemble: nasm -f elf64 -l executive.lis -o executive.o executive.asm
;   Link: g++ -m64 -std=c++17 -fno-pie -no-pie -o rand_array.out executive.o fill_random_array.o show_array.o main.o quick.o
;   Purpose: calls executive to start the program
;========================================================================================================
*/
#include <iostream>
using namespace std;

extern "C" char* executive();   //allows executive to be called in c++

int main(int argc, char *argv[])
{
    cout << "Welcome to Random Products, LLC.\n" << "This software is maintained by Shadi Hirbawi\n";
    const char* name  = executive();
    cout << "Oh " << name << ". We hope you enjoyed your arrays. Do come again. A zero will be returned to the operating system.";
    return 0;
}