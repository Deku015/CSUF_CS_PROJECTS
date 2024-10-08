;***************************************************************************************************************************
;Program name: "Pythagoras".  This program demonstrates how to call an assembly function in C++ function 
; in order to calculate the hypotenuseo of a right triangle given user input of the two sides
; Copyright (C) 2023 Shadi Hirbawi                                                                             *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************

;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

;Author information
;  Author name: Shadi Hirbawi
;  Author email: hirbawishadi@fullerton.edu
;
;Program information
;  Program name: Pythagoras
;  Programming languages: Main function in C++; double receiving value in X86-64
;  Date program began: 2023-Feb-05
;  Date of last update: 2023-Feb-05
;  Comments reorganized: 2023-Feb-05
;  Files in the program: pythagoras.asm,driver.cpp,r.sh
;
;Purpose
;  The intent of this program is to input two sides of a triangle with asm x86-64 
;   language and calculate to output the hypotenuse to a double in the C++ file to return to the user.
;
;This file
;  File name: pythagoras.asm
;  Language: X86-64
;  Syntax: Intel
;  Max page width: 172 columns
;  Optimal print specification: Landscape, 7-point font, monospace, 172 columns, 8½x11 paper
;  Assemble: nasm -f elf64 -l pythagoras.lis -o pythagoras.o pythagoras.asm
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;===== Begin code area ====================================================================================================================================================

extern printf
extern scanf
global pythagoras

segment .data
firstside db "Enter the length of the first side of the triangle: ",0
secondside db "Enter the length of the second side of the triangle: ",0


double_form db "%lf",0
response db "Thank you. You entered two sides: %.6lf and %.6lf",10,0
answer db "The length of the hypotenuse is %.6lf.",10,0

segment .bss

segment .text
pythagoras:

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

mov rax,0
mov rdi, firstside
call printf

push qword 0
mov rax,1
mov rdi,double_form
mov rsi,rsp
call scanf
movsd xmm15,[rsp]
pop rax

mov rax,0
mov rdi, secondside
call printf

push qword 0
mov rax,1
mov rdi,double_form
mov rsi,rsp
call scanf
movsd xmm14,[rsp]
pop rax

push qword 0
mov rax,2
mov rdi,response
movsd xmm0,xmm15
movsd xmm1,xmm14
call printf
pop rax

push qword 0
mov rax, 2
mov rdi, answer
mulsd xmm15,xmm15
mulsd xmm14,xmm14
addsd xmm15,xmm14
sqrtsd xmm15,xmm15
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