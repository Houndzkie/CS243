; Filename: EXER33.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 3, 2025
; Description: Create a program that inputs a character. If the character is the capital letter A, display message "You entered A.", else display "You entered not A."

.model small
.stack 100h

.data
  msg db 'Enter a character: $'
  isA db 13, 10, 'You entered A.$'
  notA db 13, 10, 'You entered not A.$'

.code
ProgramStart:
    mov ax,@data
    mov ds,ax ; set DS to point to data segment
    mov dx,OFFSET msg ; point to the time prompt
    mov ah,9 ; DOS print string function
    int 21h ; display time prompt

    mov ah,1 ; DOS get character function
    int 21h ; get single character response

    cmp al,'A' 
    jz IsLetterA 
    jnz IsNotLetterA

IsLetterA:
    mov dx,OFFSET isA
    jmp display
  
IsNotLetterA:
  mov dx,OFFSET notA

display:
    mov ah,9
    int 21h
    
    mov ah, 4ch
    int 21h
END ProgramStart