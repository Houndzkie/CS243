; Filename: EXER37.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 10, 2025
; Description: Using a loop, vertically dislpay the numbers 1 to 10.

.model small
.stack 100h

.data
    newline db 0Dh, 0Ah, '$'

.code
main:
    mov ax, @data
    mov ds, ax
    
    mov cx, 10          ; loop counter (1 to 10)
    mov bl, 1           ; start with 1 (use bl instead of al)
    
loop_display:
    ; display the current number
    mov ah, 2           ; function to display character
    
    ; check if number is 10
    cmp bl, 10
    jne single_digit
    
    ; display '1' for 10
    mov dl, '1'
    int 21h
    mov dl, '0'
    int 21h
    jmp show_newline
    
single_digit:
    mov al, bl          ; move number to al
    add al, '0'         ; convert number to ASCII
    mov dl, al          ; move ASCII to dl for display
    int 21h             ; call DOS interrupt
    
show_newline:
    
    ; display newline
    mov ah, 9           ; function to display string
    lea dx, [newline]   ; load newline string
    int 21h             ; call DOS interrupt
    
    ; prepare for next iteration
    inc bl              ; increment number
    cmp bl, 11          ; compare bl with 11
    jne loop_display    ; jump if not equal (continue loop)
    
    ; exit program
    mov ah, 4Ch         ; function to exit
    mov al, 0           ; return code
    int 21h             ; call DOS interrupt
    
end main