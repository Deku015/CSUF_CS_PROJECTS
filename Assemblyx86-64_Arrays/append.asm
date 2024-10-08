;****************************************************************************************************************************
;Program name: "Add arrays".
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
;  Program name: Homework 2(ARRAYS)
;  Programming languages: Assembly, C, bash
;  Date program began: 2023 February 10
;  Date of last update: 2023 February 19
;  Date of reorganization of comments: 2023 February 19
;  Files in this program: append.asm,display_array.c,input_array.asm,magnitude.asm,main.c,manager.asm,r.sh
;  Status: Finished.  
;
;This file
;   File name: append.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;  Assemble: nasm -f elf64 -l append.lis -o append.o append.asm
;   Link: g++ -m64 -no-pie -o array.out manager.o input_array.o magnitude.o append.o display_array.o main.o
;   Purpose: appends two arrays together
;========================================================================================================
extern printf
extern scanf

global append


segment .data


segment .bss
;empty

segment .text
append:
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

mov r15,rdi ;arraya
mov r14,rsi ;arrayb
mov r13,rdx ;arrayab
mov r12,rcx ;arraya length
mov r11,r8 ;array b length

;loop through first array add to array AB
mov r10,0
loop1beg:
    cmp r10,r12
    je outLoop1

    movsd xmm15,[r15+8*r10]
    movsd[r13 + 8*r10],xmm15
    inc r10
    jmp loop1beg
outLoop1:

mov r9 ,0
;loop through second array add to AB, stores total size counter in r10
loop2beg:
    cmp r9,r11
    je outLoop2

    movsd xmm15,[r14+8*r9]
    movsd[r13 + 8*r10],xmm15
    inc r9
    inc r10
    jmp loop2beg
outLoop2:

pop rax
mov rax,r10

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



