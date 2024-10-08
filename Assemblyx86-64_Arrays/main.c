/*;****************************************************************************************************************************
;Program name: "Add arrays".
; This program will allow a user to input float numbers in an array A and array B, print the magnitude, and be able to unionize them.
; Copyright (C) 2023 Shadi Hirbawi                                                                           *
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
;  Program name: Homework 2(ARRAYS)
;  Programming languages: Assembly, C, bash
;  Date program began: 2023 February 10
;  Date of last update: 2023 February 19
;  Date of reorganization of comments: 2023 February 19
;  Files in this program: append.asm,display_array.c,input_array.asm,magnitude.asm,main.c,manager.asm,r.sh
;  Status: Finished.  
;
;This file
;   File name: main.c
;   Language: C language
;   Max page width: 132 columns
;   Link: g++ -m64 -no-pie -o array.out manager.o input_array.o magnitude.o append.o display_array.o main.o
;   Purpose: to call the manager and let the assembly program start
;========================================================================================================
*/
#include <stdio.h>
#include <stdint.h>
#include <time.h>
#include <sys/time.h>
#include <stdlib.h>

extern double manager();

int main(int argc, char *argv[])
{
    printf("Welcome to Arrays of Integers\nBrought to you by Shadi Hirbawi\n");
    double mag = manager();
    printf("Main received %.10lf.,and will keep it for future use\nMain will return 0 to operating system. Bye.",mag);
    return 0;
}