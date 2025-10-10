; Filename: EXER40.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 10, 2025
; Description: Repeatedly ask user to input a single digit whole number until the number entered is a zero. Display "Thank you." When the number entered is zero.

.MODEL small
.STACK 100h
.DATA
  prompt db 'Enter a single digit number: $'
  newline db 0Dh, 0Ah, '$'
  thankyou db 13, 10,'Thank you.$'
.CODE
ProgramStart:
  ; Set up the data segment
  mov ax, @data
  mov ds, ax

  EchoLoop:
    mov ah, 09h ; DOS display string function
    lea dx, prompt ; load prompt string
    int 21h ; display prompt

    mov ah,1 ; DOS keyboard input function
    int 21h ; get the next key

    sub al, '0' ; convert ASCII to number
    cmp al,0 ; check if the key is 0
    jz EchoDone ; yes , so we're done echoing

    mov ah, 09h ; DOS display string function
    lea dx, [newline] ; load newline string
    int 21h ; display newline

    jmp EchoLoop ; loop again

  EchoDone:
    mov ah, 09h ; DOS display string function
    lea dx, thankyou ; load thank you string
    int 21h ; display thank you message

    mov ah,4ch ; DOS terminate program function
    int 21h ; terminate the program

END ProgramStart