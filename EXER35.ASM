; Filename: EXER35.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 3, 2025
; Description: Make a program to input two integers. Comapre the two integers. Display which one is smaller and bigger of the two integers.

.model small
.stack 100h

.data
  msg1 db 'Enter a: $'
  msg2 db 13,10,'Enter b: $'
  lesserMsg db 13, 10, 'a is lesser than b.$'
  greaterMsg db 13, 10, 'a is greater than b.$'
  equalMsg db 13, 10, 'a and b are equal.$'
  num1 db ?
  num2 db ?

.code
ProgramStart:
  ; Set up the data segment
  mov ax, @data
  mov ds, ax
  
  ; Prompt for the first number
  mov ah, 09h
  lea dx, msg1
  int 21h

  ; Read first number
  call read_number
  mov num1, al

  ; Prompt for the second number
  mov ah, 09h
  lea dx, msg2
  int 21h

  ; Read second number
  call read_number
  mov num2, al

  ; Compare numbers
  mov al, num1     ; ✅ load num1 into AL
  cmp al, num2     ; ✅ compare AL with num2
  jg AisGreater
  jl BisGreater
  je isEqual

; Read a number from keyboard (assumes single digit input)
read_number proc
  mov ah, 01h ; Function to read character
  int 21h
  sub al, '0' ; Convert ASCII to number
  ret
read_number endp

AisGreater:
  mov dx, OFFSET greaterMsg
  jmp display

BisGreater:
  mov dx, OFFSET lesserMsg
  jmp display

isEqual:
  mov dx, OFFSET equalMsg

display:
  mov ah,9
  int 21h
    
  mov ah, 4ch
  int 21h

END ProgramStart