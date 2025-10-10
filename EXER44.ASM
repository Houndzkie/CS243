; Program Title: EXER44.ASM
; Description : Displays a greetings menu with 4 options:
;               1. Good Morning
;               2. Good Afternoon
;               3. Good Evening
;               4. Exit Program
;             Each optio1n calls its own procedure.
; Author: HELGE JUSTINE O. DANO
; Assembler: Turbo Assembler (TASM)
; Environment: DOSBox (8086 real mode)

.MODEL SMALL ; Small memory model (1 code + 1 data segment)
.STACK 100h ; 256 bytes for stack

.DATA ; ---- Start of data segment ----

; Menu text and messages

menuTitle db 0Dh,0Ah, 'Greetings',0Dh,0Ah,  \
            'Main Menu',0Dh,0Ah,  \
            '1. Good Morning', 0Dh,0Ah, \
            '2. Good Afternoon',0Dh,0Ah,  \
            '3. Good Evening',0Dh,0Ah,  \
            '4. Exit Program',0Dh,0Ah,  \
            'Enter your choice: $'

msgMorning db 0Dh,0Ah,0Dh,0Ah, 'Good Morning!$'
msgAfternoon db 0Dh,0Ah,0Dh,0Ah, 'Good Afternoon!$'
msgEvening db 0Dh,0Ah,0Dh,0Ah, 'Good Evening!$'
msgInvalid db 0Dh,0Ah,0Dh,0Ah, 'Invalid choice. Please try again.$'
msgExit db 0Dh,0Ah,0Dh,0Ah, 'Thank you! Program will now exit.$'

.CODE ; ---- Start of code segment ----

; MAIN PROCEDURE

MAIN PROC
  ; Step 1; Initialize Data Segment

  mov ax, @data ; Load address of data segment
  mov ds, ax ; Copy to DS so we can access variables

MainMenu:

  ; Step 2: Display Main Menu

  mov ah, 09h ; DOS function: Display string
  lea dx, menuTitle ; DX = address of menuTitle string
  int 21h ; Display the menu text

  ; Step 3: Get user input (one character)

  mov ah, 01h ; DOS function: Read character from keyboard
  int 21h ; Wait for keypress
  mov bl, al ; Store character input in BL

  ; Step 4: Print newline for spacing

  mov ah, 02h
  mov dl, 0Dh ; Carriage return
  int 21h
  mov dl, 0Ah ; Line feed
  int 21h

  ; Step 5: Determine which option was chosen
  cmp bl, '1' ; Choice = 1?
  je CallMorning
  cmp bl, '2' ; Choice = 2?
  je CallAfternoon
  cmp bl, '3' ; Choice = 3?
  je CallEvening
  cmp bl, '4' ; Choice = 4?
  je ExitProgram
  jmp InvalidChoice ; If not 1-4, invalid

; Step 6: Call Procedures

CallMorning:
  call GoodMorning
  jmp MainMenu

CallAfternoon:
  call GoodAfternoon
  jmp MainMenu

CallEvening:
  call GoodEvening
  jmp MainMenu

CallExit:
  call ExitProgram ; Terminte program

InvalidChoice:
  call InvalidMsg
  jmp MainMenu

MAIN ENDP

; PROCEDURE: GoodMorning

GoodMorning PROC
  mov ah, 09h
  lea dx, msgMorning
  int 21h
  ret
GoodMorning ENDP

; PROCEDURE: GoodAfternoon

GoodAfternoon PROC
  mov ah, 09h
  lea dx, msgAfternoon
  int 21h
  ret
GoodAfternoon ENDP

; PROCEDURE: GoodEvening
GoodEvening PROC
  mov ah, 09h
  lea dx, msgEvening
  int 21h
  ret
GoodEvening ENDP

; PROCEDURE: InvalidMsg
InvalidMsg PROC
  mov ah, 09h
  lea dx, msgInvalid
  int 21h
  ret
InvalidMsg ENDP

; PROCEDURE: ExitProgram
; Description: Display exit message and terminates execution.

ExitProgram PROC
  mov ah, 09h ; DOS print string function
  lea dx, msgExit ; Display thank-you message
  int 21h 

  mov ah, 4Ch ; DOS termiante program function
  mov al, 00h ; Return code 0
  int 21h
ExitProgram ENDP

; End of Program

END MAIN