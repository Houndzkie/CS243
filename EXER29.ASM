; Filename: EXER29.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 3, 2025
; Description: This assembly language program will input two single-digit numbers, add the two numbers, and display the sum of the two numbers.

.model small
.stack 100h
.data
  num1 db ?
  num2 db ?
  sum db ?
  msg1 db 'Enter first number (0-9): $'
  msg2 db 13, 10, 'Enter second number (0-9): $'
  msg3 db 13, 10, 'The sum is: $'

.code
main proc
  ; Initialize data segment
  mov ax, @data
  mov ds, ax

  ; Input first number
  lea dx, msg1
  mov ah, 09h
  int 21h

  ; Read character input
  mov ah, 01h
  int 21h
  sub al, '0' ; Convert ASCII to number
  mov num1, al
  
  ; Input second number
  lea dx, msg2
  mov ah, 09h
  int 21h

  mov ah, 01h
  int 21h
  sub al, '0' ; Convert ASCII to number
  mov num2, al
  
  ; Calculate sum
  mov al, num1
  add al, num2
  mov sum, al

  ; Display result
  lea dx, msg3
  mov ah, 09h
  int 21h

  ; Convert sum to ASCII
  add sum, '0'
  mov dl, sum
  mov ah, 02h
  int 21h

  ; Exit program
  mov ax, 4c00h
  int 21h

main endp
end main