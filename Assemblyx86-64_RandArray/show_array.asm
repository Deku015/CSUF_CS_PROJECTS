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
;   File name: show_array.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;  Assemble: nasm -f elf64 -l show_array.lis -o show_array.o show_array.asm
;   Link: g++ -m64 -std=c++17 -fno-pie -no-pie -o rand_array.out executive.o fill_random_array.o show_array.o main.o quick.o
;   Purpose: shows array in IEEE754 and Hex
;========================================================================================================
global show_array

extern printf

segment .data
ieee_SD db "0x%016lx   %-18.13e",10,0  ;format for IEEE and SN

segment .bss

segment .text
show_array:
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

mov r12, rdi ;array
mov r13, rsi  ;size
mov r14, 0  ;index

beginLoop:
    cmp r14, r13   ;if r14 > r13, done
    je done 

    push qword 0
    mov rax, 1
    mov rdi, ieee_SD    ;mov format into rdi
    mov rsi, [r12 + r14*8]    ; put number in rsi
    movsd xmm0, [r12 + r14*8]  ;convert to double
    call printf    ;print
    pop rax

    inc r14    ;inc index
    jmp beginLoop   ;loop over
done:


pop rax
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
