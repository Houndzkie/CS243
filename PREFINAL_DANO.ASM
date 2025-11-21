; Filename: AC_FIXED_BLINK.ASM
; CIT-U Air Condition Unit Controller
; Programmer: HELGE JUSTINE DANO
; Date: November 21, 2025

.MODEL SMALL
.STACK 100h

.DATA
    ; Feature status (0 = Off, 1 = On)
    power_status    DB 0
    swing_status    DB 0
    quiet_status    DB 0
    eco_status      DB 0
    fan_status      DB 0
    cool_status     DB 0
    turbo_status    DB 0
    timer_status    DB 0
    sleep_status    DB 0

    ; Strings
    header          DB 'CIT-U AIR CONDITION UNIT$'
    programmer      DB 'Programmer: HELGE JUSTINE DANO$'
    welcome         DB 'WELCOME!$'
    menustatus      DB 'MAIN MENU STATUS$'

    ; Labels
    lbl_1           DB '1 Power: $'
    lbl_4           DB '4 Eco Mode: $'
    lbl_7           DB '7 Turbo: $'
    lbl_2           DB '2 Swing: $'
    lbl_5           DB '5 Fan:      $' 
    lbl_8           DB '8 Timer: $'
    lbl_3           DB '3 Quiet: $'
    lbl_6           DB '6 Cool:     $'
    lbl_9           DB '9 Sleep: $'
    lbl_exit        DB '0 Exit Program$'
    
    prompt          DB 'Enter choice: $'
    
    on_text         DB 'On $'
    off_text        DB 'Off$' 

    ; Messages
    error_msg       DB 'INPUT ERROR! Press Enter...$'
    poweroff_msg    DB 'POWER IS OFF! Press Enter...$'
    thanks_msg      DB 'Thank you. Be cool always!$'
    
    ; Cleaning strings
    blank_line      DB '                                       $' 
    blank_input     DB '       $' ; Small blank for input area

    ; Input variables
    user_choice     DB ?
    extra_flag      DB 0  

.CODE
ProgramStart:
    MOV AX, @DATA
    MOV DS, AX

    ; -------------------------------------------------------
    ; ENABLE HARDWARE BLINKING
    ; INT 10h, AX=1003h, BL=01h sets Bit 7 to Blink (not Intensity)
    ; -------------------------------------------------------
    MOV AX, 1003h
    MOV BX, 0001h 
    INT 10h

MainLoop:
    CALL ShowMainMenu

AskInput:
    ; 1. Clear previous input (if any) to keep UI clean
    MOV DH, 20
    MOV DL, 46      ; Position after "Enter choice: "
    CALL SetCursor
    LEA DX, blank_input
    MOV BL, 1Fh
    CALL PrintString

    ; 2. Position cursor for prompt
    MOV DH, 20      
    MOV DL, 32      
    CALL SetCursor

    ; 3. Print Prompt
    LEA DX, prompt
    MOV BL, 1Eh     ; Yellow on Blue
    CALL PrintString

    ; 4. Read Input
    MOV AH, 01h
    INT 21h         
    
    ; Check if user just hit ENTER without typing
    CMP AL, 0Dh     
    JE AskInput     

    MOV user_choice, AL
    MOV extra_flag, 0

    ; 5. Consume extra chars (Buffer flush)
ReadRestLoop:
    MOV AH, 01h
    INT 21h         
    CMP AL, 0Dh
    JE AfterEnter
    MOV extra_flag, 1
    JMP ReadRestLoop

AfterEnter:
    ; Check validity
    CMP extra_flag, 1
    JE InvalidInput

    MOV AL, user_choice

    ; Range Check
    CMP AL, '0'
    JE ExitProgram
    CMP AL, '1'
    JL InvalidInput
    CMP AL, '9'
    JG InvalidInput

    ; Power Check
    CMP AL, '1'
    JE AllowToggle
    
    MOV BL, power_status
    CMP BL, 0
    JE PowerOffError 

AllowToggle:
    CALL ToggleFeature
    JMP MainLoop    ; Valid input -> Update Status (Redraw UI)

PowerOffError:
    CALL ShowPowerOffError
    JMP AskInput    ; Error -> Clear Error, Ask Input Again

InvalidInput:
    CALL ShowError
    JMP AskInput    ; Error -> Clear Error, Ask Input Again

ExitProgram:
    CALL ClearScreen
    
    ; Center goodbye message
    MOV DH, 12
    MOV DL, 27
    CALL SetCursor
    
    LEA DX, thanks_msg
    MOV BL, 1Fh     ; White on Blue
    CALL PrintString
    
    MOV DH, 23
    MOV DL, 0
    CALL SetCursor

    MOV AH, 4Ch
    INT 21h

; =============================================================
;                      PROCEDURES
; =============================================================

ShowMainMenu PROC
    PUSH AX
    PUSH BX
    PUSH DX

    CALL ClearScreen
    CALL DrawBorder

    ; Header
    MOV DH, 4
    MOV DL, 28      
    CALL SetCursor
    LEA DX, header
    MOV BL, 1Fh
    CALL PrintString

    MOV DH, 5
    MOV DL, 24
    CALL SetCursor
    LEA DX, programmer
    MOV BL, 1Fh
    CALL PrintString

    MOV DH, 7
    MOV DL, 36
    CALL SetCursor
    LEA DX, welcome
    MOV BL, 1Ah
    CALL PrintString

    MOV DH, 9
    MOV DL, 32
    CALL SetCursor
    LEA DX, menustatus
    MOV BL, 1Dh
    CALL PrintString

    ; Grid Layout
    ; ROW 1
    MOV DH, 11
    MOV DL, 18
    CALL SetCursor
    LEA DX, lbl_1
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, power_status
    CALL DisplayStatus

    MOV DH, 11      
    MOV DL, 38
    CALL SetCursor
    LEA DX, lbl_4
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, eco_status
    CALL DisplayStatus

    MOV DH, 11
    MOV DL, 58
    CALL SetCursor
    LEA DX, lbl_7
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, turbo_status
    CALL DisplayStatus

    ; ROW 2
    MOV DH, 13
    MOV DL, 18
    CALL SetCursor
    LEA DX, lbl_2
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, swing_status
    CALL DisplayStatus

    MOV DH, 13
    MOV DL, 38
    CALL SetCursor
    LEA DX, lbl_5
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, fan_status
    CALL DisplayStatus

    MOV DH, 13
    MOV DL, 58
    CALL SetCursor
    LEA DX, lbl_8
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, timer_status
    CALL DisplayStatus

    ; ROW 3
    MOV DH, 15
    MOV DL, 18
    CALL SetCursor
    LEA DX, lbl_3
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, quiet_status
    CALL DisplayStatus

    MOV DH, 15
    MOV DL, 38
    CALL SetCursor
    LEA DX, lbl_6
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, cool_status
    CALL DisplayStatus

    MOV DH, 15
    MOV DL, 58
    CALL SetCursor
    LEA DX, lbl_9
    MOV BL, 1Fh
    CALL PrintString
    MOV AL, sleep_status
    CALL DisplayStatus

    ; Footer
    MOV DH, 17
    MOV DL, 33
    CALL SetCursor
    LEA DX, lbl_exit
    MOV BL, 1Fh
    CALL PrintString

    POP DX
    POP BX
    POP AX
    RET
ShowMainMenu ENDP

DisplayStatus PROC
    PUSH AX
    PUSH BX
    PUSH DX
    CMP AL, 1
    JE IsOn
    LEA DX, off_text
    MOV BL, 1Ch     ; Red on Blue
    JMP PrintStat
IsOn:
    LEA DX, on_text
    MOV BL, 1Ah     ; Green on Blue
PrintStat:
    CALL PrintString
    POP DX
    POP BX
    POP AX
    RET
DisplayStatus ENDP

ToggleFeature PROC
    PUSH AX
    MOV AL, user_choice
    CMP AL,'1'
    JE T_Power
    CMP AL,'2'
    JE T_Swing
    CMP AL,'3'
    JE T_Quiet
    CMP AL,'4'
    JE T_Eco
    CMP AL,'5'
    JE T_Fan
    CMP AL,'6'
    JE T_Cool
    CMP AL,'7'
    JE T_Turbo
    CMP AL,'8'
    JE T_Timer
    CMP AL,'9'
    JE T_Sleep
    JMP TF_Done
T_Power: XOR power_status, 1 
         JMP TF_Done
T_Swing: XOR swing_status, 1 
         JMP TF_Done
T_Quiet: XOR quiet_status, 1 
         JMP TF_Done
T_Eco:   XOR eco_status, 1 
         JMP TF_Done
T_Fan:   XOR fan_status, 1 
         JMP TF_Done
T_Cool:  XOR cool_status, 1 
         JMP TF_Done
T_Turbo: XOR turbo_status, 1 
         JMP TF_Done
T_Timer: XOR timer_status, 1 
         JMP TF_Done
T_Sleep: XOR sleep_status, 1
TF_Done:
    POP AX
    RET
ToggleFeature ENDP

DrawBorder PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV BL, 1Fh     
    MOV DH, 2       
    MOV DL, 5       
    CALL SetCursor
    MOV AH, 02h
    MOV DL, 201     
    INT 21h
    MOV CX, 69      
TopLoop:
    MOV DL, 205     
    INT 21h
    LOOP TopLoop
    MOV DL, 187     
    INT 21h
    MOV CX, 20      
    MOV DH, 3       
SideLoop:
    PUSH CX
    MOV DL, 5
    CALL SetCursor
    MOV AH, 02h
    MOV DL, 186     
    INT 21h
    MOV DL, 75
    CALL SetCursor
    MOV AH, 02h
    MOV DL, 186     
    INT 21h
    INC DH          
    POP CX
    LOOP SideLoop
    MOV DH, 23      
    MOV DL, 5
    CALL SetCursor
    MOV AH, 02h
    MOV DL, 200     
    INT 21h
    MOV CX, 69
BotLoop:
    MOV DL, 205     
    INT 21h
    LOOP BotLoop
    MOV DL, 188     
    INT 21h
    POP DX
    POP CX
    POP BX
    POP AX
    RET
DrawBorder ENDP

; -------------------------------------------------------
; ShowError: Prints Blinking Message, Waits for Enter, Clears
; -------------------------------------------------------
ShowError PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    ; 1. Print Blinking Message
    MOV DH, 22
    MOV DL, 28      ; Center
    CALL SetCursor
    
    LEA DX, error_msg
    ; Attribute: 0CEh (1100 1110)
    ; 1 (Blink) | 100 (Red Back) | 1110 (Yellow Fore)
    MOV BL, 0CEh     
    CALL PrintString

    ; 2. Wait strictly for ENTER key
    CALL WaitForEnter

    ; 3. Clear the error message
    MOV DH, 22
    MOV DL, 28
    CALL SetCursor
    LEA DX, blank_line
    MOV BL, 1Fh
    CALL PrintString

    POP DX
    POP CX
    POP BX
    POP AX
    RET
ShowError ENDP

; -------------------------------------------------------
; ShowPowerOffError: Same logic as ShowError
; -------------------------------------------------------
ShowPowerOffError PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX

    MOV DH, 22
    MOV DL, 25      
    CALL SetCursor

    LEA DX, poweroff_msg
    MOV BL, 0CEh     ; Blinking Yellow on Red
    CALL PrintString

    CALL WaitForEnter

    MOV DH, 22
    MOV DL, 25
    CALL SetCursor
    LEA DX, blank_line
    MOV BL, 1Fh
    CALL PrintString

    POP DX
    POP CX
    POP BX
    POP AX
    RET
ShowPowerOffError ENDP

; -------------------------------------------------------
; WaitForEnter: Loops until user presses Enter
; -------------------------------------------------------
WaitForEnter PROC
    PUSH AX
Wait_Loop:
    MOV AH, 07h     ; Input without echo
    INT 21h
    CMP AL, 0Dh     ; Is it Enter?
    JNE Wait_Loop   ; If not, keep waiting
    POP AX
    RET
WaitForEnter ENDP

ClearScreen PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    MOV AX, 0600h
    MOV BH, 1Fh     
    MOV CX, 0000h   
    MOV DX, 184Fh   
    INT 10h
    POP DX
    POP CX
    POP BX
    POP AX
    RET
ClearScreen ENDP

SetCursor PROC
    PUSH AX
    PUSH BX
    MOV AH, 02h
    MOV BH, 00h
    INT 10h
    POP BX
    POP AX
    RET
SetCursor ENDP

PrintString PROC
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    PUSH SI
    MOV SI, DX      
PStr_Loop:
    MOV AL, [SI]
    CMP AL, '$'
    JE PStr_Done
    MOV AH, 09h     
    MOV BH, 00h
    MOV CX, 1
    INT 10h
    PUSH BX         
    MOV AH, 03h     
    MOV BH, 00h
    INT 10h
    INC DL          
    MOV AH, 02h     
    INT 10h
    POP BX          
    INC SI
    JMP PStr_Loop
PStr_Done:
    POP SI
    POP DX
    POP CX
    POP BX
    POP AX
    RET
PrintString ENDP

END ProgramStart