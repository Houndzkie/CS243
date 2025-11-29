.model small
.stack 100h

.data
    ; ================= UI STRINGS =================
    header_main     db 13, 10, '========================================='
                    db 13, 10, '      FOOD OVERFLOW - ORDERING SYSTEM    '
                    db 13, 10, '=========================================$'
    
    ; Landing Page
    str_welcome     db 13, 10, '1. LOGIN'
                    db 13, 10, '2. SIGN-UP'
                    db 13, 10, '3. EXIT PROGRAM'
                    db 13, 10, 'Enter choice: $'

    ; Auth Strings
    str_ask_user    db 13, 10, 'Username: $'
    str_ask_pass    db 13, 10, 'Password: $'
    str_create_ok   db 13, 10, '>> Account Created! Please Login.$'
    str_login_err   db 13, 10, '>> Invalid Credentials! Press any key.$'
    str_login_ok    db 13, 10, '>> Login Successful!$'
    
    ; Main Menu
    str_menu        db 13, 10, 13, 10, '--- MAIN MENU ---'
                    db 13, 10, '1. Select Order'
                    db 13, 10, '2. View Order'
                    db 13, 10, '3. Remove Order (Clear)'
                    db 13, 10, '4. Buy Order'
                    db 13, 10, '5. Logout'
                    db 13, 10, 'Select: $'

    ; Categories
    str_cats        db 13, 10, 13, 10, '--- CATEGORIES ---'
                    db 13, 10, '1. Main Dishes'
                    db 13, 10, '2. Snacks'
                    db 13, 10, '3. Desserts'
                    db 13, 10, '4. Drinks'
                    db 13, 10, '5. Back$'

    ; Items
    str_mains       db 13, 10, '1. Chicken (150)  2. Steak (100)  3. Fillet (120)$'
    str_snacks      db 13, 10, '1. Burger (50)    2. Fries (40)   3. Pizza (90)$'
    str_desrt       db 13, 10, '1. IceCrm (30)    2. Pie (35)     3. Shake (60)$'
    str_drnks       db 13, 10, '1. Water (15)     2. Soda (25)    3. Juice (30)$'
    
    str_pick_item   db 13, 10, 'Choose Item No: $'
    str_qty         db 13, 10, 'Quantity (1-9): $'
    str_added       db ' >> Added to cart!$'

    ; Cart / Receipt
    str_cart_head   db 13, 10, '--- YOUR CART ---$'
    str_empty       db 13, 10, 'Cart is empty.$'
    str_total       db 13, 10, 'Total Price: P$'
    str_cleared     db 13, 10, '>> Cart Cleared.$'
    str_receipt     db 13, 10, '--- RECEIPT ---', 13, 10, 'Payment Success. Redirecting...$'
    str_pause       db 13, 10, 'Press any key...$'

    ; ================= VARIABLES =================
    ; Buffers for input (Max 20 chars)
    in_user_buf     db 21, ?, 21 dup('$')
    in_pass_buf     db 21, ?, 21 dup('$')
    
    ; Stored Credentials (Simulated DB)
    db_user         db 21 dup('$')
    db_pass         db 21 dup('$')
    db_user_len     db 0
    db_pass_len     db 0
    
    ; Order Data
    current_price   dw 0
    total_bill      dw 0
    item_count      dw 0
    temp_qty        dw 0
    
.code

; =============================================================
; MACRO HELPER
; =============================================================
Display macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax 

; =============================================================
; LANDING PAGE ROUTER
; =============================================================
start_screen:
    mov ax, 03h ; Clear Screen
    int 10h
    
    Display header_main
    Display str_welcome
    
    mov ah, 01h ; Read char
    int 21h
    
    ; --- SAFE JUMP PATTERN ---
    cmp al, '1'
    jne try_signup
    jmp login_page      ; Unconditional Jumps have unlimited range
    
try_signup:
    cmp al, '2'
    jne try_exit
    jmp signup_page

try_exit:
    cmp al, '3'
    jne reload_start
    jmp exit_dos
    
reload_start:
    jmp start_screen

; =============================================================
; SIGN UP LOGIC
; =============================================================
signup_page:
    mov ax, 03h
    int 10h
    Display header_main
    
    Display str_ask_user
    lea dx, in_user_buf
    mov ah, 0Ah
    int 21h
    
    Display str_ask_pass
    lea dx, in_pass_buf
    mov ah, 0Ah
    int 21h
    
    ; Save credentials
    mov al, in_user_buf+1
    mov db_user_len, al
    lea si, in_user_buf+2 
    lea di, db_user         
    mov cl, db_user_len
    xor ch, ch
    cld
    rep movsb               
    
    mov al, in_pass_buf+1
    mov db_pass_len, al
    lea si, in_pass_buf+2
    lea di, db_pass
    mov cl, db_pass_len
    xor ch, ch
    rep movsb
    
    Display str_create_ok
    mov ah, 01h ; Pause
    int 21h
    jmp start_screen

; =============================================================
; LOGIN LOGIC
; =============================================================
login_page:
    mov ax, 03h
    int 10h
    Display header_main
    
    Display str_ask_user
    lea dx, in_user_buf
    mov ah, 0Ah
    int 21h
    
    Display str_ask_pass
    lea dx, in_pass_buf
    mov ah, 0Ah
    int 21h
    
    ; --- VALIDATION (With Safe Jumps) ---
    ; 1. Check User Length
    mov al, in_user_buf+1
    cmp al, db_user_len
    jne goto_login_fail ; Safe jump
    
    ; 2. Check User String
    lea si, in_user_buf+2
    lea di, db_user
    mov cl, db_user_len
    xor ch, ch
    cld
    repe cmpsb
    jne goto_login_fail
    
    ; 3. Check Pass Length
    mov al, in_pass_buf+1
    cmp al, db_pass_len
    jne goto_login_fail
    
    ; 4. Check Pass String
    lea si, in_pass_buf+2
    lea di, db_pass
    mov cl, db_pass_len
    xor ch, ch
    repe cmpsb
    jne goto_login_fail
    
    ; Success
    Display str_login_ok
    call reset_cart_proc
    jmp main_menu_page

goto_login_fail:
    jmp login_fail_handle

; =============================================================
; MAIN MENU LOGIC
; =============================================================
main_menu_page:
    mov ax, 03h
    int 10h
    Display header_main
    Display str_menu
    
    mov ah, 01h
    int 21h
    
    ; --- SAFE MENU DISPATCHER ---
    cmp al, '1'
    jne m_try2
    jmp select_order_page
    
m_try2:
    cmp al, '2'
    jne m_try3
    jmp view_order_page

m_try3:
    cmp al, '3'
    jne m_try4
    jmp remove_order_page

m_try4:
    cmp al, '4'
    jne m_try5
    jmp buy_order_page

m_try5:
    cmp al, '5'
    jne m_invalid
    jmp start_screen ; Logout

m_invalid:
    jmp main_menu_page

; =============================================================
; SELECT ORDER (Process)
; =============================================================
select_order_page:
    mov ax, 03h
    int 10h
    Display header_main
    Display str_cats
    Display str_pick_item
    
    mov ah, 01h
    int 21h
    
    ; --- SAFE CATEGORY DISPATCHER ---
    cmp al, '1'
    jne c_try2
    jmp proc_main_dish
c_try2:
    cmp al, '2'
    jne c_try3
    jmp proc_snacks
c_try3:
    cmp al, '3'
    jne c_try4
    jmp proc_desserts
c_try4:
    cmp al, '4'
    jne c_back
    jmp proc_drinks
c_back:
    jmp main_menu_page

; --- ITEM LOGIC (Using Trampoline to Calc) ---

proc_main_dish:
    Display str_mains
    Display str_pick_item
    mov ah, 01h
    int 21h
    
    ; Safe Checks
    cmp al, '1'
    jne md_2
    mov bx, 150
    jmp go_calc
md_2:
    cmp al, '2'
    jne md_3
    mov bx, 100
    jmp go_calc
md_3:
    cmp al, '3'
    jne md_retry
    mov bx, 120
    jmp go_calc
md_retry:
    jmp select_order_page

proc_snacks:
    Display str_snacks
    Display str_pick_item
    mov ah, 01h
    int 21h
    
    cmp al, '1'
    jne sn_2
    mov bx, 50
    jmp go_calc
sn_2:
    cmp al, '2'
    jne sn_3
    mov bx, 40
    jmp go_calc
sn_3:
    cmp al, '3'
    jne sn_retry
    mov bx, 90
    jmp go_calc
sn_retry:
    jmp select_order_page

proc_desserts:
    Display str_desrt
    Display str_pick_item
    mov ah, 01h
    int 21h
    
    cmp al, '1'
    jne ds_2
    mov bx, 30
    jmp go_calc
ds_2:
    cmp al, '2'
    jne ds_3
    mov bx, 35
    jmp go_calc
ds_3:
    cmp al, '3'
    jne ds_retry
    mov bx, 60
    jmp go_calc
ds_retry:
    jmp select_order_page

proc_drinks:
    Display str_drnks
    Display str_pick_item
    mov ah, 01h
    int 21h
    
    cmp al, '1'
    jne dr_2
    mov bx, 15
    jmp go_calc
dr_2:
    cmp al, '2'
    jne dr_3
    mov bx, 25
    jmp go_calc
dr_3:
    cmp al, '3'
    jne dr_retry
    mov bx, 30
    jmp go_calc
dr_retry:
    jmp select_order_page

; --- CENTRAL CALCULATION TRAMPOLINE ---
go_calc:
    jmp ask_quantity_logic

; =============================================================
; VIEW ORDER
; =============================================================
view_order_page:
    mov ax, 03h
    int 10h
    Display header_main
    Display str_cart_head
    
    cmp total_bill, 0
    jne show_bill_details
    
    Display str_empty
    jmp view_wait

show_bill_details:
    Display str_total
    mov ax, total_bill
    call print_num_proc
    
view_wait:
    Display str_pause
    mov ah, 01h
    int 21h
    jmp main_menu_page

; =============================================================
; REMOVE ORDER
; =============================================================
remove_order_page:
    call reset_cart_proc
    Display str_cleared
    mov ah, 01h
    int 21h
    jmp main_menu_page

; =============================================================
; BUY ORDER
; =============================================================
buy_order_page:
    mov ax, 03h
    int 10h
    
    cmp total_bill, 0
    jne process_payment ; Safe Jump logic
    
    ; If empty
    Display str_empty
    mov ah, 01h
    int 21h
    jmp main_menu_page

process_payment:
    Display str_receipt
    Display str_total
    mov ax, total_bill
    call print_num_proc
    
    Display str_pause
    mov ah, 01h
    int 21h
    
    call reset_cart_proc
    jmp start_screen 

; =============================================================
; SHARED LOGIC (Moved here to be accessible)
; =============================================================

ask_quantity_logic:
    mov current_price, bx 
    Display str_qty
    mov ah, 01h
    int 21h
    sub al, '0'      
    xor ah, ah
    mov cx, ax       
    
    mov ax, bx
    mul cx           
    add total_bill, ax
    
    Display str_added
    mov ah, 01h      
    int 21h
    jmp select_order_page

login_fail_handle:
    Display str_login_err
    mov ah, 01h
    int 21h
    jmp start_screen

exit_dos:
    mov ah, 4Ch
    int 21h

; =============================================================
; PROCEDURES
; =============================================================
reset_cart_proc proc
    mov total_bill, 0
    mov item_count, 0
    ret
reset_cart_proc endp

print_num_proc proc
    push ax
    push bx
    push cx
    push dx
    
    xor cx, cx
    mov bx, 10
    
loop_div:
    xor dx, dx
    div bx      
    push dx     
    inc cx      
    cmp ax, 0
    jne loop_div
    
loop_print:
    pop dx      
    add dl, '0' 
    mov ah, 02h
    int 21h
    loop loop_print
    
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_num_proc endp

main endp
end main