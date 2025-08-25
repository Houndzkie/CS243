; Filename: EXER12.ASM
; Display string
; Name: Helge Justine O. Dano
; Date: August 22, 2025

.model small
.data
    msg1 db 'Helge Justine Oviedo Dano', 0Ah, '$'
    msg2 db 'Bachelor of Science in Computer Science 2nd Year', 0Ah, '$'
    msg3 db 'College of Computer Studies', 0Ah, '$'
    msg4 db 'Cebu Institute of Technology - University$'

.code
.startup

main1:
    mov ax,@data ; import data
    mov ds, ax

    mov ah,09h ; scanner

    mov dx, offset msg1 ; print text
    int 21h


    mov dx, offset msg2 ; print text
    int 21h


    mov dx, offset msg3 ; print text
    int 21h


    mov dx, offset msg4 ; print text
    int 21h


int 27h
end main1