; Filename: EXER39.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 10, 2025
; Description: Ask user to input a number from 1 to 8. Display error mesage if number entered is less than 1 or greater than 8. If input is correct, horizontally display the numbers, with space betwee5n each number, from 1 to the number entered by the user.

.model small
.stack 100h

.data
    prompt db 'Enter a number from 1 to 8: ', '$'
    error db 'Error: Number out of range!', 0Dh, 0Ah, '$'
    newline db 0Dh, 0Ah, '$'

.code
main:
    mov ax, @data
    mov ds, ax
    
input_loop:
    ; display prompt
    mov ah, 9
    lea dx, [prompt]
    int 21h
    
    ; read character input
    mov ah, 1
    int 21h
    mov ch, al          ; save input in ch
    
    ; display newline
    mov ah, 9
    lea dx, [newline]
    int 21h
    
    ; convert ASCII to number
    mov al, ch
    sub al, '0'         ; convert to digit
    mov bl, al          ; store in bl
    
    ; check if number is valid (1-8)
    cmp bl, 1
    jl invalid_input
    cmp bl, 8
    jg invalid_input
    
    ; valid input - display numbers from 1 to bl
    mov cl, 1           ; start counter at 1
    
display_loop:
    ; display current number
    mov ah, 2
    mov al, cl
    add al, '0'         ; convert to ASCII for display
    mov dl, al
    int 21h
    
    ; check if we reached bl
    cmp cl, bl
    je display_done
    
    ; display space
    mov ah, 2
    mov dl, ' '
    int 21h
    
    ; increment counter
    inc cl
    jmp display_loop
    
display_done:
    ; display newline
    mov ah, 9
    lea dx, [newline]
    int 21h
    
    ; exit program
    mov ah, 4Ch
    mov al, 0
    int 21h
    
invalid_input:
    ; display error message
    mov ah, 9
    lea dx, [error]
    int 21h
    
    ; jump back to input prompt
    jmp input_loop
    
end main