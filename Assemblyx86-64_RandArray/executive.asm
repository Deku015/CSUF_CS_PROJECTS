; This program will allow a user to input float numbers in an array A and array B, print the magnitude, and be able to unionize them.
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
;   File name: executive.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;  Assemble: nasm -f elf64 -l executive.lis -o executive.o executive.asm
;   Link: g++ -m64 -std=c++17 -fno-pie -no-pie -o rand_array.out executive.o fill_random_array.o show_array.o main.o quick.o
;   Purpose: control all array functions and print out prompts
;========================================================================================================
global executive

extern printf
extern scanf
extern fgets
extern stdin 
extern strlen

extern fill_random_array
extern qsort
extern show_array
extern quick

LARGE_BOUND equ 64
SMALL_BOUND equ 16
INPUT_LEN equ 256

segment .data

align SMALL_BOUND
    format db "%s", 0 ;Null terminating string
    enter_Name db "Please enter your name: ", 0
    enter_Title db "Please enter your title (Mr,Ms,Sargent,Chief,Project Leader,etc): ",0
    hello db "Nice to meet you ",0
    spc db " ",0
    prompt db 10, "This program will generate 64-bit IEEE float numbers.",10,"How many numbers do you want. Today's limit is 100 per customer. ",0
    num_format db "%ld",0
    prompt_2 db 10,"Your numbers have been stored in an array. Here is that array.",10, "IEEE754              Scientific Decimal",10,0
    sort db 10,"The array is now being sorted",10,"Here is the updated array.",10, "IEEE754                Scientific Decimal",10,0
    goodbye db 10,"Good bye ",0
    goodbye_2 db ". You are welcome any time.",10,0
align LARGE_BOUND
    segment .bss
    title resb INPUT_LEN
    name resb INPUT_LEN
    myArray resq 100


segment .text
executive:
;---------------------
push rbp
mov  rbp,rsp
push rdi                                                    
push rsi                                                    
push rdx                                                    
push rcx                                                    
push r8                                                     
push r9                                                     
push r10                                                    
push r11                                                    
push r12                                                  
push r13                                                    
push r14                                                    
push r15                                                    
push rbx                                                    
pushf                                                      
;----------------------
push qword 0

push qword 0
mov rax,0
mov rdi, format
mov rsi, enter_Name
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, name
mov rsi, INPUT_LEN
mov rdx, [stdin]
call fgets
pop rax

push qword 0
mov rax, 0
mov rdi, name
call strlen

sub rax, 1 
mov byte [name + rax], 0
pop rax

push qword 0
mov rax, 0
mov rdi, format
mov rsi, enter_Title
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, title
mov rsi, INPUT_LEN
mov rdx, [stdin]
call fgets
pop rax

push qword 0
mov rax, 0
mov rdi, title
call strlen

sub rax, 1 
mov byte [title + rax], 0
pop rax

push qword 0
mov rax,0
mov rdi, format
mov rsi, hello
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, format
mov rsi, title
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, format
mov rsi, spc
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, format
mov rsi, name 
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, format
mov rsi, prompt
call printf
pop rax

push qword 0
mov rax,0
mov rdi, num_format
mov rsi, rsp
call scanf
pop r15

push qword 0
mov rax, 0
mov rdi, prompt_2
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, myArray
mov rsi, r15
call fill_random_array
pop rax

push qword 0
mov rax, 0
mov rdi, myArray
mov rsi, r15
call show_array
pop rax

push qword 0
mov rax, 0
mov rdi, sort
call printf
pop rax

push qword 0
mov rdi, myArray
mov rsi, r15
mov rdx, 8
mov rcx, quick
call qsort
pop rax

push qword 0
mov rax, 0
mov rdi, myArray
mov rsi, r15
call show_array
pop rax



push qword 0
mov rax, 0
mov rdi, format
mov rsi, goodbye
call printf
pop rax

push qword 0
mov rax, 0
mov rdi, format
mov rsi, title
call printf
pop rax

push qword 0
mov rax,0
mov rdi, format
mov rsi, goodbye_2
call printf
pop rax



pop rax
mov rax, name
;---------------------
popf                                                        
pop rbx                                                    
pop r15                                                   
pop r14                                                   
pop r13                                                     
pop r12                                                     
pop r11                                                     
pop r10                                                     
pop r9                                                      
pop r8                                                      
pop rcx                                                     
pop rdx                                                    
pop rsi                                                     
pop rdi                                                     
pop rbp                                                     


ret 
