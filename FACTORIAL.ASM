.MODEL SMALL
.STACK 100H

.DATA
    ; Variables
    N       DW ?                ; User input limit
    I       DW ?                ; Counter
    PROD    DW ?                ; Result

    ; Messages
    MSG_PROMPT  DB 13, 10, 'Enter N (Max 8): $'
    MSG_RES     DB 13, 10, 'Factorial: $'
    MSG_ERR     DB 13, 10, 'Error: Overflow (N > 8) or Invalid Input!$'
    NEWLINE     DB 13, 10, '$'

    ; Buffer for number printing
    OUT_BUFF    DB 6 DUP('$')   

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; ==========================================
    ; 1. GET USER INPUT (N)
    ; ==========================================
    LEA DX, MSG_PROMPT
    MOV AH, 09H
    INT 21H

    CALL READ_NUMBER    ; Read input into AX
    JC  SHOW_ERROR      ; If Carry Flag set, input was bad
    
    ; Edge Case: Check Overflow (N > 8)
    CMP AX, 8
    JA  SHOW_ERROR      
    
    MOV N, AX           ; Store Input to N

    ; ==========================================
    ; 2. INITIALIZE VARIABLES
    ; prod = 1; i = 1;
    ; ==========================================
    MOV AX, 1
    MOV PROD, AX
    MOV I, AX

    ; ==========================================
    ; 3. WHILE LOOP (Stack Machine Style)
    ; while (i <= n)
    ; ==========================================
WHILE_LOOP:
    ; --- Condition Check: i <= n ---
    PUSH N              ; Push operand 2
    PUSH I              ; Push operand 1
    CALL OP_COMPARE_LE  ; Stack Logic: Pops 2, pushes 1 (1=True, 0=False)
    
    POP AX              ; Get boolean result
    CMP AX, 0           ; If 0 (False)
    JE  END_LOOP        ; Break loop

    ; --- Body: prod = prod * i ---
    PUSH PROD           ; Push Op1
    PUSH I              ; Push Op2
    CALL OP_MULTIPLY    ; Pops 2, Multiplies, Pushes Result
    POP PROD            ; Store result back to variable

    ; --- Body: i = i + 1 ---
    PUSH I              ; Push Op1
    PUSH 1              ; Push Op2 (Immediate value)
    CALL OP_ADD         ; Pops 2, Adds, Pushes Result
    POP I               ; Store result back to variable

    JMP WHILE_LOOP      ; Repeat

END_LOOP:
    ; ==========================================
    ; 4. PRINT RESULT
    ; ==========================================
    LEA DX, MSG_RES
    MOV AH, 09H
    INT 21H

    MOV AX, PROD        ; Load result to print
    CALL PRINT_NUMBER
    
    JMP EXIT_PROG

SHOW_ERROR:
    LEA DX, MSG_ERR
    MOV AH, 09H
    INT 21H

EXIT_PROG:
    MOV AH, 4CH
    INT 21H
MAIN ENDP

; ==========================================
; STACK MACHINE OPERATIONS
; ==========================================

; ------------------------------------------
; OP_MULTIPLY
; Logic: Pop A, Pop B -> B * A -> Push Result
; Note: We must preserve Return Address (IP)
; ------------------------------------------
OP_MULTIPLY PROC
    POP BX          ; Save Return Address (IP)
    POP CX          ; Pop Operand 2 (Top of stack)
    POP AX          ; Pop Operand 1
    MUL CX          ; DX:AX = AX * CX (We assume 16-bit result)
    PUSH AX         ; Push Result
    PUSH BX         ; Restore Return Address
    RET
OP_MULTIPLY ENDP

; ------------------------------------------
; OP_ADD
; Logic: Pop A, Pop B -> B + A -> Push Result
; ------------------------------------------
OP_ADD PROC
    POP BX          ; Save Return Address
    POP CX          ; Pop Operand 2
    POP AX          ; Pop Operand 1
    ADD AX, CX      ; AX = AX + CX
    PUSH AX         ; Push Result
    PUSH BX         ; Restore Return Address
    RET
OP_ADD ENDP

; ------------------------------------------
; OP_COMPARE_LE (Less or Equal)
; Logic: Pop A (I), Pop B (N). 
; If A <= B Push 1, Else Push 0
; ------------------------------------------
OP_COMPARE_LE PROC
    POP BX          ; Save Return Address
    POP CX          ; Pop Operand 1 (I)
    POP AX          ; Pop Operand 2 (N)
    
    CMP CX, AX      ; Compare I vs N
    JBE IS_TRUE     ; Jump if Below or Equal
    
    ; False
    MOV AX, 0
    JMP DONE_CMP
IS_TRUE:
    MOV AX, 1
DONE_CMP:
    PUSH AX         ; Push Boolean Result
    PUSH BX         ; Restore Return Address
    RET
OP_COMPARE_LE ENDP

; ==========================================
; HELPER PROCEDURES (I/O)
; ==========================================

; ------------------------------------------
; READ_NUMBER
; Reads string from user, converts to INT in AX
; Sets Carry Flag (CF) if error
; ------------------------------------------
READ_NUMBER PROC
    XOR CX, CX      ; Clear CX (Accumulator)
    XOR BX, BX      ; Clear BX
    
READ_CHAR:
    MOV AH, 01H
    INT 21H
    
    CMP AL, 13      ; Check for Enter key
    JE  DONE_READ
    
    CMP AL, '0'
    JB  READ_ERR
    CMP AL, '9'
    JA  READ_ERR
    
    SUB AL, '0'     ; Convert ASCII to Digit
    MOV AH, 0
    PUSH AX         ; Save digit
    
    MOV AX, CX
    MOV DX, 10
    MUL DX          ; CX = CX * 10
    MOV CX, AX
    
    POP AX          ; Restore digit
    ADD CX, AX      ; CX = CX + Digit
    
    JMP READ_CHAR
    
READ_ERR:
    STC             ; Set Carry Flag for error
    RET

DONE_READ:
    MOV AX, CX
    CLC             ; Clear Carry Flag
    RET
READ_NUMBER ENDP

; ------------------------------------------
; PRINT_NUMBER
; Converts AX to ASCII and prints it
; ------------------------------------------
PRINT_NUMBER PROC
    MOV CX, 0       ; Digit counter
    MOV BX, 10      ; Divisor
    
DIV_LOOP:
    XOR DX, DX      ; Clear DX for division
    DIV BX          ; AX / 10, Remainder in DX
    PUSH DX         ; Push remainder (digit)
    INC CX
    CMP AX, 0
    JNE DIV_LOOP
    
PRINT_LOOP:
    POP DX          ; Pop digit
    ADD DL, '0'     ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP PRINT_LOOP
    RET
PRINT_NUMBER ENDP

END MAIN