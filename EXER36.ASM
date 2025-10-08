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
  userChoice db ?    
  press db 13,10,10, 'Press Enter to continue.$'
  exitDisplay db 'Exit Program$'

  ; Addition
  displayAddition db 'Addition$'
  promptFirstAddend db 13,'Enter first addend: $'
  promptSecondAddend db 13, 10, 'Enter second addend: $'
  displayFirstAddend db 10, 'First addend is: $'
  displaySecondAddend db 10, 'Second addend is: $'
  displaySum db 10, 'Sum: $'
  firstAddend db ?
  secondAddend db ?
  sum db ?

  ; Subtraction
  displaySubtraction db 'Subtraction$'
  promptMinuend db 13,'Enter minuend: $'
  promptSubtrahend db 13, 10, 'Enter subtrahend: $'
  displayMinuend db 10, 'Minuend is: $'
  displaySubtrahend db 10, 'Subtrahend is: $'
  displayDifference db 10, 'Difference: $'
  minuend db ?
  subtrahend db ?
  difference db ?

  ; Multiplication
  displayMultiplication db 'Multiplication$'
  promptMultiplicand db 13,'Enter multiplicand: $'
  promptMultiplier db 13, 10, 'Enter multiplier: $'
  displayMultiplicand db 10, 'Multiplicand is: $'
  displayMultiplier db 10, 'Multiplier is: $'
  displayProduct db 10, 'Product: $'
  multiplicand db ?
  multiplier db ?
  product db ?

  ; Division
  displayDivision db 'Division$'
  promptDividend db 13,'Enter dividend: $'
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

  ; Clear screen with default color first
  call ClearScreen

  ; Display main menu - reset to default color
  call reset_color
  lea dx, mainMenu
  call print_normal

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display addition option with color
  mov bl, 40h ; black on red background
  lea dx, addition
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display subtraction option with color
  mov bl, 20h ; black on green background
  lea dx, subtraction
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display multiplication option with color
  mov bl, 30h ; black on cyan background
  lea dx, multiplication
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display division option with color
  mov bl, 50h ; black on magenta background
  lea dx, division
  call print_colored

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h

  ; Display exit option with color
  mov bl, 70h ; black on white
  lea dx, exit
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Display choice prompt with normal color
  call reset_color
  lea dx, choice
  call print_normal

  mov ah, 01
  int 21h
  mov userChoice, al

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
  jmp ProgramStart

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
  mov bl, 40h ; black on red
  lea dx, displayAddition
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Reset to normal color for prompts
  call reset_color
  
  ; Prompt for first addend
  lea dx, promptFirstAddend
  call print_normal
  call read_number
  mov firstAddend, al

  ; Prompt for second addend
  lea dx, promptSecondAddend
  call print_normal
  call read_number
  mov secondAddend, al

  ; Display first addend
  lea dx, displayFirstAddend
  call print_normal
  mov al, firstAddend
  call display_number

  ; Display second addend
  lea dx, displaySecondAddend
  call print_normal
  mov al, secondAddend
  call display_number

  ; Calculate sum
  mov al, firstAddend
  add al, secondAddend
  mov sum, al

  ; Display sum
  lea dx, displaySum
  call print_normal
  mov al, sum
  call display_number

  ; Wait for user to press Enter
  lea dx, press
  call print_normal
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
  mov bl, 20h ; black on green
  lea dx, displaySubtraction
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Reset to normal color for prompts
  call reset_color

  ; Prompt for minuend
  lea dx, promptMinuend
  call print_normal
  call read_number
  mov minuend, al

  ; Prompt for subtrahend
  lea dx, promptSubtrahend
  call print_normal
  call read_number
  mov subtrahend, al

  ; Display minuend
  lea dx, displayMinuend
  call print_normal
  mov al, minuend
  call display_number

  ; Display subtrahend
  lea dx, displaySubtrahend
  call print_normal
  mov al, subtrahend
  call display_number

  ; Calculate difference
  mov al, minuend
  sub al, subtrahend
  mov difference, al

  ; Display difference
  lea dx, displayDifference
  call print_normal
  mov al, difference
  call display_number

  ; Wait for user to press Enter
  lea dx, press
  call print_normal
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
  mov bl, 30h ; black on cyan
  lea dx, displayMultiplication
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Reset to normal color for prompts
  call reset_color

  ; Prompt for multiplicand
  lea dx, promptMultiplicand
  call print_normal
  call read_number
  mov multiplicand, al

  ; Prompt for multiplier
  lea dx, promptMultiplier
  call print_normal
  call read_number
  mov multiplier, al

  ; Display multiplicand
  lea dx, displayMultiplicand
  call print_normal
  mov al, multiplicand
  call display_number

  ; Display multiplier
  lea dx, displayMultiplier
  call print_normal
  mov al, multiplier
  call display_number

  ; Calculate product
  mov al, multiplicand
  mul multiplier
  mov product, al

  ; Display product
  lea dx, displayProduct
  call print_normal
  mov al, product
  call display_number

  ; Wait for user to press Enter
  lea dx, press
  call print_normal
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
  mov bl, 50h ; black on magenta
  lea dx, displayDivision
  call print_colored

  mov ah, 02h
  mov dl, 10
  int 21h

  ; Reset to normal color for prompts
  call reset_color

  ; Prompt for dividend
  lea dx, promptDividend
  call print_normal
  call read_number
  mov dividend, al

  ; Prompt for divisor
  lea dx, promptDivisor
  call print_normal
  call read_number
  mov divisor, al

  ; Display dividend
  lea dx, displayDividend
  call print_normal
  mov al, dividend
  call display_number

  ; Display divisor
  lea dx, displayDivisor
  call print_normal
  mov al, divisor
  call display_number

  ; Calculate quotient
  xor ah, ah
  mov al, dividend
  xor dx, dx
  div divisor
  mov quotient, al

  ; Display quotient
  lea dx, displayQuotient
  call print_normal
  mov al, quotient
  call display_number

  ; Wait for user to press Enter
  lea dx, press
  call print_normal
  jmp WaitForEnter

WaitForEnter:
  mov ah, 01h
  int 21h
  cmp al, 0Dh
  jne WaitForEnter

  mov ah, 02h
  mov cl, 10
  mov dl, cl
  int 21h
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
  mov bl, 70h ; black on white
  lea dx, exitDisplay
  call print_colored

  call reset_color
  lea dx, press
  call print_normal

  mov ax, 4C00h
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

; Read a number from keyboard
read_number proc
  mov ah, 01h
  int 21h
  sub al, '0'
  ret
read_number endp

; Display a number in AL
display_number proc
  push ax
  push bx
  push cx
  push dx
  
  xor cx, cx
  mov bl, 10
  
  ; Handle special case of 0
  cmp al, 0
  jne convert_loop
  push ax
  inc cx
  jmp display_digits
  
convert_loop:
  cmp al, 0
  je display_digits
  
  xor ah, ah
  div bl
  push ax
  mov al, al
  inc cx
  jmp convert_loop
  
display_digits:
  cmp cx, 0
  je done_display
  
  pop ax
  mov dl, ah
  add dl, '0'
  mov ah, 02h
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