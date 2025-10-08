; Filename: EXER36.ASM
; Programmer Name: Helge Justine O. Dano
; Date: October 3, 2025
; Description: Create a calculator program to perform the actual math operations and display the results.

.model small
.stack 100h
.data
  mainMenu db 'Main Menu$'
  addition db 'a - Addition$'
  subtraction db 's - Subtraction$'
  multiplication db 'm - Multiplication$'
  division db 'd - Division$'
  exit db 'e - Exit$'

  choice db 'Enter your choice: $'
  userChoice db ?    ; Add this new variable for storing user input
  press db 13,10,10, 'Press Enter to continue.$'
  exitDisplay db 'Exit Program$'
  okra db '                                                            '

  ; Addition
  displayAddition db 13,'Addition$'
  promptFirstAddend db 13,'Enter first addend: $'
  promptSecondAddend db 13, 10, 'Enter second addend: $'
  displayFirstAddend db 10, 'First addend is: $'
  displaySecondAddend db 10, 'Second addend is: $'
  displaySum db 10, 'Sum: $'
  firstAddend db ?
  secondAddend db ?
  sum db ?

  ; Subtraction
  displaySubtraction db 13,'Subtraction$'
  promptMinuend db 13,10, 'Enter minuend: $'
  promptSubtrahend db 13, 10, 'Enter subtrahend: $'
  displayMinuend db 10, 'Minuend is: $'
  displaySubtrahend db 10, 'Subtrahend is: $'
  displayDifference db 10, 'Difference: $'
  minuend db ?
  subtrahend db ?
  difference db ?

  ; Multiplication
  displayMultiplication db 13,'Multiplication$'
  promptMultiplicand db 13, 10,10, 'Enter multiplicand: $'
  promptMultiplier db 13, 10, 'Enter multiplier: $'
  displayMultiplicand db 10, 'Multiplicand is: $'
  displayMultiplier db 10, 'Multiplier is: $'
  displayProduct db 10, 'Product: $'
  multiplicand db ?
  multiplier db ?
  product db ?

  ; Division
  displayDivision db 13,'Division$'
  promptDividend db 13,10, 10, 'Enter dividend: $'
  promptDivisor db 13, 10, 'Enter divisor: $'
  displayDividend db 10, 'Dividend is: $'
  displayDivisor db 10, 'Divisor is: $'
  displayQuotient db 10, 'Quotient: $'
  dividend db ?
  divisor db ?
  quotient db ?

.code
ProgramStart:
  ; Set up the data segment
  mov ax, @data
  mov ds, ax

  ; Display main menu with color
  mov bl, 07h ; white color for main menu
  lea dx, mainMenu
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display addition option with color
  mov bl, 40h ; red background
  lea dx, addition
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display subtraction option with color
  mov bl, 20h ; green background
  lea dx, subtraction
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display multiplication option with color
  mov bl, 30h ; cyan background
  lea dx, multiplication
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display division option with color
  mov bl, 50h ; magenta background
  lea dx, division
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display exit option with color
  mov bl, 70h ; white on black
  lea dx, exit
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Display choice prompt (no color)
  mov ah, 09h
  lea dx, choice
  int 21h

  mov ah, 01
  int 21h
  mov userChoice, al    ; Store in userChoice

  cmp al, 'a'
  je additionOperation
  cmp al, 's'
  je subjmp1
  cmp al, 'm'
  je muljmp1
  cmp al, 'd'
  je divjmp1
  cmp al, 'e'
  je exitjmp1
  mov ah,02h
  mov cl,10
  mov dl,cl
  int 21h
  mov ah,02h
  mov cl,10
  mov dl,cl
  int 21h
  jmp ProgramStart ; Invalid choice, restart

subjmp1:
  jmp subjmp2
muljmp1:
  jmp muljmp2
divjmp1:
  jmp divjmp2
exitjmp1:
  jmp exitjmp2

additionOperation:
  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display "Addition" header with color
  mov bl, 40h ; red background
  lea dx, displayAddition
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Prompt for first addend
  mov ah, 09h
  lea dx, promptFirstAddend
  int 21h
  call read_number
  mov firstAddend, al

  ; Prompt for second addend
  mov ah, 09h
  lea dx, promptSecondAddend
  int 21h
  call read_number
  mov secondAddend, al

  ; Display first addend
  mov ah, 09h
  lea dx, displayFirstAddend
  int 21h
  mov al, firstAddend
  call display_number

  ; Display second addend
  mov ah, 09h
  lea dx, displaySecondAddend
  int 21h
  mov al, secondAddend
  call display_number

  ; Calculate sum
  mov al, firstAddend
  add al, secondAddend
  mov sum, al

  ; Display sum
  mov ah, 09h
  lea dx, displaySum
  int 21h
  mov al, sum
  call display_number

  ; Wait for user to press Enter
  mov ah, 09h
  lea dx, press
  int 21h
  jmp WaitForEnter

subjmp2:
  jmp subtractionOperation
muljmp2:
  jmp muljmp3
divjmp2:
  jmp divjmp3
exitjmp2:
  jmp exitjmp3

subtractionOperation:
  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display "Subtraction" header with color
  mov bl, 20h ; green background
  lea dx, displaySubtraction
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Prompt for minuend
  mov ah, 09h
  lea dx, promptMinuend
  int 21h
  call read_number
  mov minuend, al

  ; Prompt for subtrahend
  mov ah, 09h
  lea dx, promptSubtrahend
  int 21h
  call read_number
  mov subtrahend, al

  ; Display minuend
  mov ah, 09h
  lea dx, displayMinuend
  int 21h
  mov al, minuend
  call display_number

  ; Display subtrahend
  mov ah, 09h
  lea dx, displaySubtrahend
  int 21h
  mov al, subtrahend
  call display_number

  ; Calculate difference
  mov al, minuend
  sub al, subtrahend
  mov difference, al

  ; Display difference
  mov ah, 09h
  lea dx, displayDifference
  int 21h
  mov al, difference
  call display_number

  ; Wait for user to press Enter
  mov ah, 09h
  lea dx, press
  int 21h
  jmp WaitForEnter

muljmp3:
  jmp multiplicationOperation
divjmp3:
  jmp divjmp4
exitjmp3:
  jmp exitjmp4

multiplicationOperation:
  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display "Multiplication" header with color
  mov bl, 30h ; cyan background
  lea dx, displayMultiplication
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Prompt for multiplicand
  mov ah, 09h
  lea dx, promptMultiplicand
  int 21h
  call read_number
  mov multiplicand, al

  ; Prompt for multiplier
  mov ah, 09h
  lea dx, promptMultiplier
  int 21h
  call read_number
  mov multiplier, al

  ; Display multiplicand
  mov ah, 09h
  lea dx, displayMultiplicand
  int 21h
  mov al, multiplicand
  call display_number

  ; Display multiplier
  mov ah, 09h
  lea dx, displayMultiplier
  int 21h
  mov al, multiplier
  call display_number

  ; Calculate product
  mov al, multiplicand
  mul multiplier ; AL = AL * multiplier (result in AX)
  mov product, al ; Store lower byte of result in product

  ; Display product
  mov ah, 09h
  lea dx, displayProduct
  int 21h
  mov al, product
  call display_number

  ; Wait for user to press Enter
  mov ah, 09h
  lea dx, press
  int 21h
  jmp WaitForEnter
  
divjmp4:
  jmp divisionOperation
exitjmp4:
  jmp exitjmp5

divisionOperation:
  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display "Division" header with color
  mov bl, 50h ; magenta background
  lea dx, displayDivision
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Prompt for dividend
  mov ah, 09h
  lea dx, promptDividend
  int 21h
  call read_number
  mov dividend, al

  ; Prompt for divisor
  mov ah, 09h
  lea dx, promptDivisor
  int 21h
  call read_number
  mov divisor, al

  ; Display dividend
  mov ah, 09h
  lea dx, displayDividend
  int 21h
  mov al, dividend
  call display_number

  ; Display divisor
  mov ah, 09h
  lea dx, displayDivisor
  int 21h
  mov al, divisor
  call display_number

  ; Calculate quotient (integer division)
  xor ah, ah ; Clear AH for division (AL will hold the quotient)
  mov al, dividend
  xor dx, dx ; Clear DX for division (DX:AX will hold the dividend)
  div divisor ; AL = AL / divisor (result in AL)
  mov quotient, al ; Store result in quotient

  ; Display quotient
  mov ah, 09h
  lea dx, displayQuotient
  int 21h
  mov al, quotient
  call display_number

  ; Wait for user to press Enter
  mov ah, 09h
  lea dx, press
  int 21h
  jmp WaitForEnter

WaitForEnter:
  mov ah, 01h     ; DOS keyboard input (waits for keypress)
  int 21h
  cmp al, 0Dh     ; Enter key has ASCII code 13 (0Dh)
  jne WaitForEnter  ; If not Enter, keep waiting

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h
  call ClearScreen
  jmp ProgramStart

exitjmp5:
  jmp exitProgram

exitProgram:
  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display "Exit Program" with color
  mov bl, 70h ; white on black
  lea dx, exitDisplay
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  mov ah, 09h
  lea dx, press
  int 21h

  mov ax, 4C00h
  int 21h

; Clear screen procedure
ClearScreen proc
    mov ax, 0600h        ; scroll entire screen up
    mov cx, 0000h        ; top-left corner
    mov dx, 184Fh        ; bottom-right corner
    int 10h
    ret
ClearScreen endp

; New print_colored procedure - prints string character by character with color
print_colored PROC
    push ax
    push bx
    push cx
    push dx
    push si
    mov si, dx          ; SI points to string
    mov ah, 03h         ; Get cursor position
    mov bh, 0
    int 10h
next_char:
    mov al, [si]        ; Get character
    cmp al, '$'         ; Check for end of string
    je done_color
    mov ah, 09h         ; Write character with attribute
    mov bh, 0           ; Page 0
    mov cx, 1           ; Write 1 character
    int 10h
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

; Read a number from keyboard (assumes single digit input)
read_number proc
  mov ah, 01h ; Function to read character
  int 21h
  sub al, '0' ; Convert ASCII to number
  ret
read_number endp

; Display a number in AL (handles numbers 0-255)
display_number proc
  push ax
  push bx
  push cx
  push dx
  
  xor cx, cx        ; Clear counter for digits
  mov bl, 10        ; Divisor = 10
  
  ; Handle special case of 0
  cmp al, 0
  jne convert_loop
  push ax           ; Push 0 onto stack
  inc cx
  jmp display_digits
  
convert_loop:
  cmp al, 0
  je display_digits
  
  xor ah, ah        ; Clear AH for division
  div bl            ; AL = AL / 10, AH = remainder
  push ax           ; Save remainder (digit) on stack
  mov al, al        ; Keep quotient in AL
  inc cx            ; Increment digit counter
  jmp convert_loop
  
display_digits:
  cmp cx, 0
  je done_display
  
  pop ax            ; Get digit from stack
  mov dl, ah        ; Remainder is in AH
  add dl, '0'       ; Convert to ASCII
  mov ah, 02h       ; Display character function
  int 21h
  dec cx
  jmp display_digits
  
done_display:
  pop dx
  pop cx
  pop bx
  pop ax
  ret
display_number endp

end ProgramStart