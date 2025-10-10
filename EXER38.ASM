; Filename: EXER38.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 10, 2025
; Description: Using a loop, horizontally display the numbers 1 to 20, with space between each number.

.model small
.stack 100h

.data
    space db ' ', '$'

.code
main:
    mov ax, @data
    mov ds, ax
    
    mov bl, 1           ; start with 1
    
loop_display:
    ; display the current number
    mov ah, 2           ; function to display character
    
    ; check if number is 10 or greater
    cmp bl, 10
    jl single_digit
    
    cmp bl, 20
    je display_20
    
    ; display 10-19 (tens digit is always '1')
    mov dl, '1'
    int 21h
    
    ; display ones digit
    mov al, bl
    sub al, 10          ; subtract 10 to get the ones digit
    add al, '0'
    mov dl, al
    int 21h
    jmp show_space
    
display_20:
    mov dl, '2'
    int 21h
    mov dl, '0'
    int 21h
    jmp show_space
    
single_digit:
    mov al, bl          ; move number to al
    add al, '0'         ; convert number to ASCII
    mov dl, al          ; move ASCII to dl for display
    int 21h             ; call DOS interrupt
    
show_space:
    ; display space
    mov ah, 2
    mov dl, ' '
    int 21h
    
    ; prepare for next iteration
    inc bl              ; increment number
    cmp bl, 21          ; compare bl with 21
    jne loop_display    ; jump if not equal (continue loop)
    
    ; exit program
    mov ah, 4Ch         ; function to exit
    mov al, 0           ; return code
    int 21h             ; call DOS interrupt
    
end main