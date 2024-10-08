;****************************************************************************************************************************
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
;   File name: magnitude.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;  Assemble: nasm -f elf64 -l magnitude.lis -o magnitude.o magnitude.asm
;   Link:g++ -m64 -no-pie -o array.out manager.o input_array.o magnitude.o append.o display_array.o main.o
;   Purpose: to produce the magnitude of a given array
;========================================================================================================
global magnitude

segment .data

segment .bss

segment .text

magnitude:

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
;move the array to r15 and the size to r14
mov r15,rdi
mov r14,rsi
;loop through array given and calcuate the magnitude and send back in xmm0
mov rax,2
mov rdx,0
cvtsi2sd xmm15,rdx
mov r13,0
beginLoop:
    cmp r13,r14
    je outOfLoop
    movsd xmm14, [r15+8*r13]
    mulsd xmm14,xmm14
    addsd xmm15,xmm14
    inc r13
    jmp beginLoop
outOfLoop:


sqrtsd xmm15,xmm15
movsd xmm0,xmm15
pop rax


;-----------------------
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