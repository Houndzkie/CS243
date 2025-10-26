; Filename: EXER45.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 17, 2025
; Description: Create an Assembly Language program to display a main menu that lets users choose which 2025 calendar month to display.

.model small
.stack 100h

.data

  header db '2025 Calendar$'
  programmer db 'Programmer: HELGE JUSTINE O. DANO$'
  finished db 'Date Finished: OCTOBER 26, 2025$'
  menu db 'Main Menu$'

  top db 218,196,196,196,196,196,196,196,196,196,196,196,196,196,194,196,196,196,196,196,196,196,196,196,196,196,194,196,196,196,196,196,196,196,196,196,196,196,196,196,196,191,'$'
  bot db 212,196,196,196,196,196,196,196,196,196,196,196,196,196,193,196,196,196,196,196,196,196,196,196,196,196,193,196,196,196,196,196,196,196,196,196,196,196,196,196,196,190,'$'
  row1 db 179, ' 1 January   ', 179, ' 5 May     ', 179, ' 9 September  ', 179, '$'
  row2 db 179, ' 2 February  ', 179, ' 6 June    ', 179, ' 10 October   ', 179, '$'
  row3 db 179, ' 3 March     ', 179, ' 7 July    ', 179, ' 11 November  ', 179, '$'
  row4 db 179, ' 4 April     ', 179, ' 8 August  ', 179, ' 12 December  ', 179, '$'

  choice db 'Enter choice: $'
  input db 4      ; max length user can type (2 digits + enter)
        db ?       ; actual number of chars typed (filled by DOS)
        db 4 dup(?) ; buffer

  ; calendar lines
  days db 179,'  S  ',179,'  M  ',179,'  T  ',179,'  W  ',179,'  T  ',179,'  F  ',179,'  S  ',179,'$'
  caltop db 218,196,196,196,196,196,194,196,196,196,196,196,194,196,196,196,196,196,194,196,196,196,196,196,194,196,196,196,196,196,194,196,196,196,196,196,194,196,196,196,196,196,191,'$'
  calmid db 195,196,196,196,196,196,197,196,196,196,196,196,197,196,196,196,196,196,197,196,196,196,196,196,197,196,196,196,196,196,197,196,196,196,196,196,197,196,196,196,196,196,180,'$'
  calbot db 192,196,196,196,196,196,193,196,196,196,196,196,193,196,196,196,196,196,193,196,196,196,196,196,193,196,196,196,196,196,193,196,196,196,196,196,193,196,196,196,196,196,217,'$'

  ; display month calendar
  jan db 'January 2025$'
  jan1 db 179, '     ', 179, '     ', 179, '     ', 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '$'
  jan2 db 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '$'
  jan3 db 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '$'
  jan4 db 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '$'
  jan5 db 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '  31 ', 179, '     ', 179, '$'
  jan6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  feb db 'February 2025$'
  feb1 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '   1 ', 179, '$'
  feb2 db 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '$'
  feb3 db 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '$'
  feb4 db 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '$'
  feb5 db 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '     ', 179, '$'
  feb6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  mar db 'March 2025$'
  mar1 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '   1 ', 179, '$'
  mar2 db 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '$'
  mar3 db 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '$'
  mar4 db 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '$'
  mar5 db 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '$'
  mar6 db 179, '  30 ', 179, '  31 ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  apr db 'April 2025$'
  apr1 db 179, '     ', 179, '     ', 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '$'
  apr2 db 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '$'
  apr3 db 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '$'
  apr4 db 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '$'
  apr5 db 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '     ', 179, '     ', 179, '     ', 179, '$'
  apr6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  may db 'May 2025$'
  may1 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '$'
  may2 db 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '$'
  may3 db 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '$'
  may4 db 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '$'
  may5 db 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '  31 ', 179, '$'
  may6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  jun db 'June 2025$'
  jun1 db 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '$'
  jun2 db 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '$'
  jun3 db 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '$'
  jun4 db 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '$'
  jun5 db 179, '  29 ', 179, '  30 ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'
  jun6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  jul db 'July 2025$'
  jul1 db 179, '     ', 179, '     ', 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '$'
  jul2 db 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '$'
  jul3 db 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '$'
  jul4 db 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '$'
  jul5 db 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '  31 ', 179, '     ', 179, '     ', 179, '$'
  jul6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  aug db 'August 2025$'
  aug1 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '   1 ', 179, '   2 ', 179, '$'
  aug2 db 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '$'
  aug3 db 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '$'
  aug4 db 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '$'
  aug5 db 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '$'
  aug6 db 179, '  31 ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  sep db 'September 2025$'
  sep1 db 179, '     ', 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '$'
  sep2 db 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '$'
  sep3 db 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '$'
  sep4 db 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '$'
  sep5 db 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'
  sep6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  oct db 'October 2025$'
  oct1 db 179, '     ', 179, '     ', 179, '     ', 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '$'
  oct2 db 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '$'
  oct3 db 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '$'
  oct4 db 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '$'
  oct5 db 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '  31 ', 179, '     ', 179, '$'
  oct6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  nov db 'November 2025$'
  nov1 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '   1 ', 179, '$'
  nov2 db 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '   7 ', 179, '   8 ', 179, '$'
  nov3 db 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '  14 ', 179, '  15 ', 179, '$'
  nov4 db 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '  21 ', 179, '  22 ', 179, '$'
  nov5 db 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '  28 ', 179, '  29 ', 179, '$'
  nov6 db 179, '  30 ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  deb db 'December 2025$'
  deb1 db 179, '     ', 179, '   1 ', 179, '   2 ', 179, '   3 ', 179, '   4 ', 179, '   5 ', 179, '   6 ', 179, '$'
  deb2 db 179, '   7 ', 179, '   8 ', 179, '   9 ', 179, '  10 ', 179, '  11 ', 179, '  12 ', 179, '  13 ', 179, '$'
  deb3 db 179, '  14 ', 179, '  15 ', 179, '  16 ', 179, '  17 ', 179, '  18 ', 179, '  19 ', 179, '  20 ', 179, '$'
  deb4 db 179, '  21 ', 179, '  22 ', 179, '  23 ', 179, '  24 ', 179, '  25 ', 179, '  26 ', 179, '  27 ', 179, '$'
  deb5 db 179, '  28 ', 179, '  29 ', 179, '  30 ', 179, '  31 ', 179, '     ', 179, '     ', 179, '     ', 179, '$'
  deb6 db 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '     ', 179, '$'

  invalid db 'INVALID ENTRY!$'
  againprompt db 'Again Y/N: $'
  ty db 'Thank you. Come back soon.$'

.code
ProgramStart:
  mov ax, @data
  mov ds, ax

  call ClearScreen

  call reset_color

  ; Display title
  lea dx, header
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  lea dx, programmer
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  lea dx, finished
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  lea dx, menu
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Show options
  
  lea dx, top
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  
  lea dx, row1
  call print_normal
  
  mov ah, 02h
  mov dl, 10
  int 21h

  
  lea dx, row2
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  
  lea dx, row3
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  
  lea dx, row4
  call print_normal
  
  mov ah, 02h
  mov dl, 10
  int 21h

  
  lea dx, bot
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Get user choice
  
  lea dx, choice
  call print_normal

  mov ah, 0Ah
  lea dx, input
  int 21h

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Validate input - check if it's between 1 and 12
  mov si, offset input
  mov cl, [si+1]    ; Get actual length entered
  cmp cl, 0         ; Check if nothing was entered
  je DecJmp1        ; If empty, show December
  
  ; Get first character
  mov al, [si+2]
  
  ; Check if it's a single digit (1-9)
  cmp cl, 1
  je CheckSingleDigit
  
  ; Check if it's two digits (10-12)
  cmp cl, 2
  je ct1

  jmp InvalidEntry

ps1:
  jmp ProgramStart

CheckSingleDigit:
  cmp al, '1'
  je JanJmp1
  cmp al, '2'
  je FebJmp1
  cmp al, '3'
  je MarJmp1
  cmp al, '4'
  je AprJmp1
  cmp al, '5'
  je MayJmp1
  cmp al, '6'
  je JunJmp1
  cmp al, '7'
  je JulJmp1
  cmp al, '8'
  je AugJmp1
  cmp al, '9'
  je SepJmp1
  jmp InvalidEntry

JanJmp1:
  jmp ShowJanuary
FebJmp1:
  jmp FebJmp2
MarJmp1:
  jmp MarJmp2
AprJmp1:
  jmp AprJmp2
MayJmp1:
  jmp MayJmp2
JunJmp1:
  jmp JunJmp2
JulJmp1:
  jmp JulJmp2
AugJmp1:
  jmp AugJmp2
SepJmp1:
  jmp SepJmp2
OctJmp1:
  jmp OctJmp2
NovJmp1:
  jmp NovJmp2
DecJmp1:
  jmp DecJmp2
ExitJmp1:
  jmp ExitJmp2
ct1:
  jmp CheckTwoDigits

InvalidEntry:
  ; Display invalid entry message
  mov bl, 9EH;
  lea dx, invalid
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  jmp YesNo

YesNo:
  lea dx, againprompt
  call print_normal

  mov ah, 01h
  int 21h
  mov bl, al          ; save user's input in BL

  call WaitForEnter   ; now we can safely overwrite AL

  cmp bl, 'Y'
  je ps1
  cmp bl, 'y'
  je ps1
  cmp bl, 'N'
  je ExitJmp1
  cmp bl, 'n'
  je ExitJmp1
  jmp InvalidEntry

WaitForEnter:
    mov ah, 01h     ; Wait for a single keypress
    int 21h         ; Result -> AL
    cmp al, 13      ; 13 = ASCII for Enter (Carriage Return)
    jne WaitForEnter ; Loop until Enter is pressed
    ret

CheckTwoDigits:
  ; First digit must be '1'
  cmp al, '1'
  jne InvalidEntry        ; If not '1', invalid
  
  ; Get second digit
  mov al, [si+3]
  
  ; Second digit must be '0', '1', or '2'
  cmp al, '0'
  je OctJmp1
  cmp al, '1'
  je NovJmp1
  cmp al, '2'
  je DecJmp1
  jmp InvalidEntry

ShowJanuary:
  ; Display month name WITHOUT color
  
  lea dx, jan
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, jan1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, jan2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, jan3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, jan4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, jan5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, jan6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4Fh
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

FebJmp2:
  jmp ShowFebruary
MarJmp2:
  jmp MarJmp3
AprJmp2:
  jmp AprJmp3
MayJmp2:
  jmp MayJmp3
JunJmp2:
  jmp JunJmp3
JulJmp2:
  jmp JulJmp3
AugJmp2:
  jmp AugJmp3
SepJmp2:
  jmp SepJmp3
OctJmp2:
  jmp OctJmp3
NovJmp2:
  jmp NovJmp3
DecJmp2:
  jmp DecJmp3
ExitJmp2:
  jmp ExitJmp3


ShowFebruary:
  ; Display month name WITHOUT color
  
  lea dx, feb
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, feb1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, feb2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, feb3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, feb4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, feb5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, feb6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

MarJmp3:
  jmp ShowMarch
AprJmp3:
  jmp AprJmp4
MayJmp3:
  jmp MayJmp4
JunJmp3:
  jmp JunJmp4
JulJmp3:
  jmp JulJmp4
AugJmp3:
  jmp AugJmp4
SepJmp3:
  jmp SepJmp4
OctJmp3:
  jmp OctJmp4
NovJmp3:
  jmp NovJmp4
DecJmp3:
  jmp DecJmp4
ExitJmp3:
  jmp ExitJmp4

ShowMarch:
  ; Display month name WITHOUT color
  
  lea dx, mar
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, mar1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, mar2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, mar3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, mar4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, mar5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, mar6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

AprJmp4:
  jmp ShowApril
MayJmp4:
  jmp MayJmp5
JunJmp4:
  jmp JunJmp5
JulJmp4:
  jmp JulJmp5
AugJmp4:
  jmp AugJmp5
SepJmp4:
  jmp SepJmp5
OctJmp4:
  jmp OctJmp5
NovJmp4:
  jmp NovJmp5
DecJmp4:
  jmp DecJmp5
ExitJmp4:
  jmp ExitJmp5

ShowApril:
  ; Display month name WITHOUT color
  
  lea dx, apr
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, apr1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, apr2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, apr3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, apr4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, apr5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, apr6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

MayJmp5:
  jmp ShowMay
JunJmp5:
  jmp JunJmp6
JulJmp5:
  jmp JulJmp6
AugJmp5:
  jmp AugJmp6
SepJmp5:
  jmp SepJmp6
OctJmp5:
  jmp OctJmp6
NovJmp5:
  jmp NovJmp6
DecJmp5:
  jmp DecJmp6
ExitJmp5:
  jmp ExitJmp6

ShowMay:
  ; Display month name WITHOUT color
  
  lea dx, may
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, may1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, may2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, may3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, may4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, may5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, may6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

JunJmp6:
  jmp ShowJune
JulJmp6:
  jmp JulJmp7
AugJmp6:
  jmp AugJmp7
SepJmp6:
  jmp SepJmp7
OctJmp6:
  jmp OctJmp7
NovJmp6:
  jmp NovJmp7
DecJmp6:
  jmp DecJmp7
ExitJmp6:
  jmp ExitJmp7

ShowJune:
  ; Display month name WITHOUT color
  
  lea dx, jun
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, jun1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, jun2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, jun3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, jun4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, jun5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, jun6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

JulJmp7:
  jmp ShowJuly
AugJmp7:
  jmp AugJmp8
SepJmp7:
  jmp SepJmp8
OctJmp7:
  jmp OctJmp8
NovJmp7:
  jmp NovJmp8
DecJmp7:
  jmp DecJmp8
ExitJmp7:
  jmp ExitJmp8

ShowJuly:
  ; Display month name WITHOUT color
  
  lea dx, jul
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, jul1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, jul2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, jul3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, jul4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, jul5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, jul6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 4FH
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

AugJmp8:
  jmp ShowAugust
SepJmp8:
  jmp SepJmp9
OctJmp8:
  jmp OctJmp9
NovJmp8:
  jmp NovJmp9
DecJmp8:
  jmp DecJmp9
ExitJmp8:
  jmp ExitJmp9

ShowAugust:
  ; Display month name WITHOUT color
  
  lea dx, aug
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, aug1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, aug2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, aug3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, aug4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, aug5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, aug6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 50H
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

SepJmp9:
  jmp ShowSeptember
OctJmp9:
  jmp OctJmp10
NovJmp9:
  jmp NovJmp10
DecJmp9:
  jmp DecJmp10
ExitJmp9:
  jmp ExitJmp10

ShowSeptember:
  ; Display month name WITHOUT color
  
  lea dx, sep
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, sep1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, sep2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, sep3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, sep4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, sep5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, sep6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 6FH
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

OctJmp10:
  jmp ShowOctober
NovJmp10:
  jmp NovJmp11
DecJmp10:
  jmp DecJmp11
ExitJmp10:
  jmp ExitJmp11

ShowOctober:
  ; Display month name WITHOUT color
  
  lea dx, oct
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, oct1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, oct2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, oct3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, oct4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, oct5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, oct6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 20H
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

NovJmp11:
  jmp ShowNovember
DecJmp11:
  jmp DecJmp12
ExitJmp11:
  jmp ExitJmp12

ShowNovember:
  ; Display month name WITHOUT color
  
  lea dx, nov
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, nov1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, nov2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, nov3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, nov4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, nov5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, nov6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 1FH
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

DecJmp12:
  jmp ShowDecember
ExitJmp12:
  jmp ExitProgram

ShowDecember:
  ; Display month name WITHOUT color
  
  lea dx, deb
  call print_normal

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, caltop
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, days
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, calmid
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, deb1
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, deb2
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, deb3
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, deb4
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, deb5
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, deb6
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h

  mov bl, 30H
  lea dx, calbot
  call print_colored
  call clear_rest_of_line ; fill rest of line with normal color

  mov ah, 02h
  mov dl, 10
  int 21h
  call clear_rest_of_line ; fill rest of line with normal color

  call reset_color

  jmp YesNo

ExitProgram:
  lea dx, ty
  call print_normal
  
  mov ah, 4Ch        ; Exit to DOS
  int 21h

; Clear screen procedure with default color
ClearScreen proc
    mov ax, 0600h        ; scroll entire screen up
    mov bh, 07h          ; default color (white on black)
    mov cx, 0000h        ; top-left corner
    mov dx, 184Fh        ; bottom-right corner
    int 10h
    
    ; Reset cursor to top-left
    mov ah, 02h
    mov bh, 0
    mov dh, 0
    mov dl, 0
    int 10h
    
    ret
ClearScreen endp

; Reset color to default
reset_color proc
    push ax
    push bx
    push cx
    
    ; Clear any existing color attributes
    mov ah, 09h
    mov al, ' '
    mov bl, 07h  ; default white on black
    mov bh, 0
    mov cx, 1
    int 10h
    
    pop cx
    pop bx
    pop ax
    ret
reset_color endp

; Print string with normal color (no special coloring)
print_normal proc
    push ax
    mov ah, 09h
    int 21h
    pop ax
    ret
print_normal endp

; Print colored string - only colors the specific string
print_colored PROC
    push ax
    push bx
    push cx
    push dx
    push si
    
    mov si, dx          ; SI points to string
    
    ; Get current cursor position
    mov ah, 03h
    mov bh, 0
    int 10h
    
next_char:
    mov al, [si]        ; Get character
    cmp al, '$'         ; Check for end of string
    je done_color
    
    ; Write character with color attribute
    mov ah, 09h         ; Write character with attribute
    mov bh, 0           ; Page 0
    mov cx, 1           ; Write 1 character
    int 10h
    
    ; Move to next position
    inc si              ; Next character
    inc dl              ; Move cursor right
    mov ah, 02h         ; Set cursor position
    int 10h
    jmp next_char
    
done_color:
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_colored ENDP

clear_rest_of_line proc
    push ax
    push bx
    push cx
    push dx

    ; Get current cursor position
    mov ah, 03h
    mov bh, 0
    int 10h

    ; Compute remaining columns
    mov al, 80        ; screen width
    sub al, dl        ; how many spaces left
    xor ch, ch
    mov cl, al        ; move to CX for count

    ; Print that many spaces in default color
    mov ah, 09h
    mov al, ' '
    mov bh, 0
    mov bl, 07h       ; white on black
    int 10h

    pop dx
    pop cx
    pop bx
    pop ax
    ret
clear_rest_of_line endp

end ProgramStart