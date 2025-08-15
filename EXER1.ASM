; Filename: EXER1.ASM
; Displaying single characters, numbers, and symbols
; Name: Helge Justine O. Dano
; Date: August 15, 2025

.model small ; directive to use "small" memory model
.code ; section of program containing executable code.
.stack 100 ; define the size of the program's stack.
start: ; start of program

    ; A
    mov ah,02h ; Set AH to display a character
    mov cl,41h ; 41h is a capital A
    mov dl,cl  ; copies 8-bit value in cl to dl
    int 21h    ; interrupt for input/output

    ; B
    mov ah,02h
    mov cl,42h
    mov dl,cl
    int 21h

int 27h ; terminate
end start ; end program