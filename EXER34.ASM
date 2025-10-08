; Filename: EXER34.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 3, 2025
; Description: Create a program that inputs a number. Display the following messages based on the value of the number entered:
; "The number is equal to 5."
; "The number is less than 5."
; "The number is greater than 5."

.model small
.stack 100h
.data
    msg db 'Enter a number: $'
    equalMsg db 13, 10, 'The number is equal to 5.$'
    lessMsg db 13, 10, 'The number is less than 5.$'
    greaterMsg db 13, 10, 'The number is greater than 5.$'

.code
ProgramStart:
    mov ax,@data
    mov ds,ax ; set DS to point to data segment
    mov dx,OFFSET msg ; point to the time prompt
    mov ah,9 ; DOS print string function
    int 21h ; display time prompt

    mov ah,1 ; DOS get character function
    int 21h ; get single character response
    sub al, '0'          ; convert ASCII to numeric value

    cmp al,5
    jg Greater
    jl Lesser
    je Equal

Greater:
    mov dx,OFFSET greaterMsg
    jmp display
  
Lesser:
  mov dx,OFFSET lessMsg
  jmp display

Equal:
  mov dx,OFFSET equalMsg

display:
    mov ah,9
    int 21h
    
    mov ah, 4ch
    int 21h
END ProgramStart