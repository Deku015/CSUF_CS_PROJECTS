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
;   File name: manager.asm
;   Language: X86 with Intel syntax.
;   Max page width: 132 columns
;  Assemble: nasm -f elf64 -l manager.lis -o manager.o manager.asm
;   Link: g++ -m64 -no-pie -o array.out manager.o input_array.o magnitude.o append.o display_array.o main.o
;   Purpose: This is the central module that will direct calls to different functions including magnitude, append, input_array, and Display
;   and it will combine the arrays and show magnitudes.
;========================================================================================================
extern printf
extern scanf
extern Display
extern input_array
extern magnitude
extern append

global manager

length equ 20

;prompt messages for printing numbers of array and magnitudes
segment .data
prompt_A db "The program will manage your arrays of 64-bit floats",10,"For array A enter a sequence of 64-bit floats separated by white space.",10,"After the last input press enter followed by Control+D",10,0
received_one db "These numbers were received and placed into array A:",10,0
magnitude_A db 10,"The magnitude of array A is %.5lf",10,0
prompt_B db  "For array B enter a sequence of 64-bit floats separated by white space.",10,"After the last input press enter followed by Control+D:",10,0
received_two db "These numbers were received and placed into array B:",10,0
magnitude_B db 10,"The magnitude of array B is %.5lf",10,0
appended db "Arrays A and B have been appended and given the name A+B.",10,"A+B contains",10,0
appended_mag db 10,"The magnitude of A+B is %.5lf",10,0

;reserve array space
segment .bss
myarrayA resq length
myarrayB resq length
myarrayAB resq 40

segment .text
manager:
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
;print prompt a
push qword 0
mov rax, 0
mov rdi, prompt_A
call printf
pop rax
;input array and store counter in r15
push qword 0
mov rax,0
mov rdi, myarrayA
mov rsi, length
call input_array
mov r15,rax
pop rax
;print received array message
push qword 0
mov rax,0
mov rdi, received_one
call printf
pop rax
;print array values using Display c function
push qword 0
mov rax,0
mov rdi, myarrayA
mov rsi, r15
call Display
pop rax
;calls magnitude and stores it in xmm15
push qword 0
mov rax,1
mov rdi,myarrayA
mov rsi,r15
call magnitude
movsd xmm15, xmm0
pop rax
;prints out magnitude A with message
push qword 0
mov rax,1
mov rdi, magnitude_A
movsd xmm0,xmm15
call printf
pop rax
;prompt B for arrayB
push qword 0
mov rax, 0
mov rdi, prompt_B
call printf
pop rax
;inputs values into array B, stores counter in r14
push qword 0
mov rax,0
mov rdi, myarrayB
mov rsi, length
call input_array
mov r14,rax
pop rax
;received message
push qword 0
mov rax,0
mov rdi, received_two
call printf
pop rax
;displays array B contents
push qword 0
mov rax,0
mov rdi, myarrayB
mov rsi, r14
call Display
pop rax
;calculates array B magnitude, stores in xmm15
push qword 0
mov rax,1
mov rdi,myarrayB
mov rsi,r14
call magnitude
movsd xmm15, xmm0
pop rax
;prints array B magnitude from xmm0
push qword 0
mov rax,1
mov rdi, magnitude_B
movsd xmm0,xmm15
call printf
pop rax
;prints appended arrays message
push qword 0
mov rax,0
mov rdi,appended
call printf
pop rax
;sends 3 arrays and two counters to append and stores the counter for array AB in r13
push qword 0
mov rax,0
mov rdi,myarrayA
mov rsi,myarrayB
mov rdx,myarrayAB
mov rcx,r15
mov r8,r14
call append
mov r13, rax
pop rax
;displays array AB
push qword 0
mov rax,0
mov rdi,myarrayAB
mov rsi,r13
call Display
pop rax
;calculates array AB magnitude
push qword 0
mov rax,1
mov rdi, myarrayAB
mov rsi, r13
call magnitude
movsd xmm15, xmm0
pop rax
;print message and magnitude for AB
push qword 0
mov rax,1
mov rdi, appended_mag
movsd xmm0,xmm15
call printf
pop rax


pop rax
movsd xmm0,xmm15

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