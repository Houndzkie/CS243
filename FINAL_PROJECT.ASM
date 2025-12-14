; FOOD OVERFLOW
; An Online Food Ordering System where users can create and login to their own accounts, order food, and remove orders. Data will be stored in a simple database in the program memory.
; Programmer: Helge Justine O. Dano
; November 30, 2025 - December 15, 2025

.model small
.stack 100h

.data
    ; ================= UI GRAPHICS =================
    ; Increased width from 50 to 60 for better fit
    box_top         db 0C9h, 60 dup(0CDh), 0BBh, '$'
    box_mid         db 0BAh, 60 dup(' '),  0BAh, '$'
    box_bot         db 0C8h, 60 dup(0CDh), 0BCh, '$'
    
    ; --- TITLES ---
    app_title       db '      F O O D   O V E R F L O W      $'
    
    open_big_1      db '  _____  _____  _____  _____    $'
    open_big_2      db ' |   __| |     | |     | |     \   $'
    open_big_3      db ' |   __| |  |  | |  |  | |  |  |   $'
    open_big_4      db ' |__|    |_____| |_____| |_____/   $'
    
    open_sub_big    db '   O V E R F L O W   $'
    open_sub_small  db '   ONLINE FOOD ORDERING SYSTEM   $'
    open_prompt     db '   [ PRESS ANY KEY TO ORDER ]    $'
    
    close_big       db '      T H A N K   Y O U !        $'
    close_small     db '     Have a wonderful meal!      $'
    
    ; --- HUD ---
    hud_spent       db ' Spent: P$'
    hud_limit       db '/500$'
    hud_ord         db 'Orders: $'
    hud_ord_lim     db '/10$'
    
    ; --- ACCOUNT COUNTER ---
    txt_acc_lbl     db 'Accounts: $'
    txt_acc_max     db '/5$'

    ; --- MENU TEXT ---
    txt_land_1      db '             1.  LOGIN                   $'
    txt_land_2      db '             2.  SIGN-UP                 $'
    txt_land_3      db '             3.  EXIT                    $'
    txt_land_p      db '        Enter choice: $'

    txt_user        db ' Username: $'
    txt_pass        db ' Password: $'
    
    head_signup     db '          --- CREATE ACCOUNT ---          $'
    head_login      db '              --- LOGIN ---               $'
    head_menu       db '            --- MAIN MENU ---             $'
    head_cats       db '           --- CATEGORIES ---             $'
    head_cart       db '            --- YOUR CART ---             $'
    head_rcpt       db '             --- RECEIPT ---              $'

    menu_1          db '           1. Select Order                $'
    menu_2          db '           2. View Order                  $'
    menu_3          db '           3. Clear Order                 $'
    menu_4          db '           4. Buy Order                   $'
    menu_5          db '           5. Logout                      $'
    menu_sel        db '           Select: $'

    ; Padded category text for cleaner alignment
    cat_1           db '           1. Main Dishes                 $'
    cat_2           db '           2. Snacks                      $'
    cat_3           db '           3. Desserts                    $'
    cat_4           db '           4. Drinks                      $'
    cat_5           db '           5. Back                        $'

    ; Expanded Item strings to fit new box width
    str_mains       db ' 1.Chicken(150)   2.Steak(100)    3.Fillet(120)$'
    str_snacks      db ' 1.Burger(50)     2.Fries(40)     3.Pizza(90)  $'
    str_desrt       db ' 1.IceCrm(30)     2.Pie(35)       3.Shake(60)  $'
    str_drnks       db ' 1.Water(15)      2.Soda(25)      3.Juice(30)  $'
    
    txt_pick        db ' Choose Item No: $'
    txt_qty         db ' Quantity (1-10): $'
    
    ; Messages
    msg_empty       db ' >> Error: Input cannot be empty!$'
    msg_full        db ' >> Error: Database Full (Max 5)!$'
    msg_dup         db ' >> Error: Username taken!$'
    msg_inv_sel     db ' >> Error: Invalid selection!$'
    msg_inv_qty     db ' >> Error: Invalid qty (1-10)!$'
    msg_limit       db ' >> Error: Order limit (10) reached!$'
    msg_budget      db ' >> Error: Budget limit (P500) exceeded!$'
    
    msg_created     db ' >> Account Created! Login now.$'
    msg_fail        db ' >> Invalid Username/Password.$'
    msg_ok          db ' >> Login Successful! Cart Restored.$'
    msg_add         db ' >> Item Added!$'
    msg_cleared     db ' >> Cart Cleared.$'
    msg_empty_c     db ' >> Cart is empty.$'
    msg_pause       db ' Press any key...$'
    msg_confirm     db ' Are you sure you want to buy? (Y/N): $'
    msg_saved       db ' >> Cart Saved. Logging out...$'

    ; Receipt Logic
    n_00 db 'Fried Chicken $'
    n_01 db 'Burger Steak  $'
    n_02 db 'Chkn Fillet   $'
    n_03 db 'Burger        $'
    n_04 db 'French Fries  $'
    n_05 db 'Pizza         $'
    n_06 db 'Ice Cream     $'
    n_07 db 'Peach Pie     $'
    n_08 db 'Milkshake     $'
    n_09 db 'Water         $'
    n_10 db 'Softdrinks    $'
    n_11 db 'Juice         $'
    
    str_x           db ' x $'
    str_eq          db ' = P$'
    str_total       db ' Total Price: P$'

    newline         db 13, 10, '$'

    ; ================= VARIABLES =================
    in_user_buf     db 51, ?, 51 dup('$')
    in_pass_buf     db 51, ?, 51 dup('$')
    in_qty_buf      db 4, ?, 4 dup('$')
    
    ; --- USER DATABASE ---
    MAX_USERS       equ 5
    SLOT_SIZE       equ 52 
    db_users        db 260 dup(0) 
    db_pass         db 260 dup(0)
    acc_count       db 0
    
    curr_chk_idx    db 0
    current_user_id db 0  
    temp_offset     dw 0
    is_duplicate    db 0
    
    ; --- PERSISTENT CART STORAGE ---
    db_carts        db 80 dup(0)
    
    ; --- ACTIVE SESSION CART (RAM) ---
    cart_qty        db 12 dup(0)
    item_prices     dw 150, 100, 120, 50, 40, 90, 30, 35, 60, 15, 25, 30
    
    selected_idx    dw 0 
    current_price   dw 0
    total_bill      dw 0
    item_count      dw 0 
    
    calc_qty        dw 0
    calc_cost       dw 0
    
.code

; =============================================================
; MACROS
; =============================================================
Prt macro msg
    lea dx, msg
    mov ah, 09h
    int 21h
endm

GoXY macro col, row
    mov ah, 02h
    mov bh, 00h
    mov dl, col
    mov dh, row
    int 10h
endm

Cls macro
    mov ax, 0600h   
    mov bh, 4Eh     ; RED BACKGROUND (4), YELLOW TEXT (E)
    mov cx, 0000h   
    mov dx, 184Fh   
    int 10h
endm

main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

    Cls

; =============================================================
; OPENING SCREEN
; =============================================================
opening_screen:
    Cls
    ; Start Box at Col 10 to center 60 chars (80-60)/2 = 10
    GoXY 10, 6
    Prt box_top
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 8
    Prt box_mid
    GoXY 10, 9
    Prt box_mid
    GoXY 10, 10
    Prt box_mid
    GoXY 10, 11
    Prt box_mid
    GoXY 10, 12
    Prt box_mid
    GoXY 10, 13
    Prt box_mid
    GoXY 10, 14
    Prt box_mid
    GoXY 10, 15
    Prt box_mid
    GoXY 10, 16
    Prt box_bot
    
    ; Centered Art relative to box
    GoXY 22, 7
    Prt open_big_1
    GoXY 22, 8
    Prt open_big_2
    GoXY 22, 9
    Prt open_big_3
    GoXY 22, 10
    Prt open_big_4
    GoXY 28, 11
    Prt open_sub_big
    GoXY 23, 13
    Prt open_sub_small
    GoXY 23, 15
    Prt open_prompt
    
    mov ah, 07h
    int 21h

; =============================================================
; LANDING PAGE
; =============================================================
start_screen:
    Cls
    ; --- Draw UI Box (Expanded Height for spacing) ---
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 8
    Prt box_mid 
    GoXY 10, 9
    Prt box_mid 
    GoXY 10, 10
    Prt box_mid 
    GoXY 10, 11
    Prt box_mid 
    GoXY 10, 12
    Prt box_mid 
    GoXY 10, 13
    Prt box_mid
    GoXY 10, 14
    Prt box_mid
    GoXY 10, 15
    Prt box_mid
    GoXY 10, 16
    Prt box_bot
    
    ; --- Account Counter (Upper Right) ---
    GoXY 54, 6      ; Position inside the box, top right
    Prt txt_acc_lbl
    xor ax, ax
    mov al, acc_count
    call print_num_proc
    Prt txt_acc_max
    
    ; --- Content ---
    GoXY 25, 8
    Prt app_title
    
    GoXY 10, 10
    Prt txt_land_1
    GoXY 10, 11
    Prt txt_land_2
    GoXY 10, 12
    Prt txt_land_3
    
    GoXY 10, 14
    Prt txt_land_p
    
    mov ah, 01h 
    int 21h
    
    ; --- Safe Jumping Logic ---
    cmp al, '1'
    je safe_go_login
    cmp al, '2'
    je safe_go_signup
    cmp al, '3'
    je safe_go_exit
    jmp start_invalid

safe_go_login:
    jmp login_page
safe_go_signup:
    jmp signup_page
safe_go_exit:
    jmp exit_dos
    
start_invalid:
    GoXY 10, 18
    Prt msg_inv_sel
    mov ah, 07h
    int 21h
    jmp start_screen

; =============================================================
; SIGN UP
; =============================================================
signup_page:
    Cls
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt head_signup
    GoXY 10, 8
    Prt box_mid
    GoXY 10, 9
    Prt box_mid
    GoXY 10, 10
    Prt box_mid
    GoXY 10, 11
    Prt box_mid
    GoXY 10, 12
    Prt box_mid
    GoXY 10, 13
    Prt box_mid
    GoXY 10, 14
    Prt box_bot
    
    mov al, acc_count
    cmp al, MAX_USERS
    jl proceed_signup
    GoXY 10, 16
    Prt msg_full
    mov ah, 07h
    int 21h
    jmp start_screen

proceed_signup:
get_user_create:
    GoXY 14, 9
    Prt txt_user
    lea dx, in_user_buf
    mov ah, 0Ah
    int 21h
    lea bx, in_user_buf
    call strip_whitespace_proc
    cmp in_user_buf+1, 0
    jne check_dupe
    GoXY 14, 15
    Prt msg_empty
    mov ah, 07h
    int 21h
    jmp signup_page
check_dupe:
    call check_duplicate_proc
    cmp is_duplicate, 1
    jne get_pass_create
    GoXY 14, 15
    Prt msg_dup
    mov ah, 07h
    int 21h
    jmp signup_page
get_pass_create:
    GoXY 14, 11
    Prt txt_pass
    lea dx, in_pass_buf
    mov ah, 0Ah
    int 21h
    lea bx, in_pass_buf
    call strip_whitespace_proc
    cmp in_pass_buf+1, 0
    jne save_acc
    GoXY 14, 15
    Prt msg_empty
    mov ah, 07h
    int 21h
    jmp signup_page
save_acc:
    xor ax, ax
    mov al, acc_count
    mov bl, SLOT_SIZE
    mul bl
    mov di, ax
    lea bx, db_users
    add bx, di
    mov al, in_user_buf+1
    mov [bx], al
    inc bx
    lea si, in_user_buf+2 
    mov cl, in_user_buf+1
    xor ch, ch
    push di
    mov di, bx
    cld
    rep movsb
    pop di
    lea bx, db_pass
    add bx, di
    mov al, in_pass_buf+1
    mov [bx], al
    inc bx
    lea si, in_pass_buf+2
    mov cl, in_pass_buf+1
    xor ch, ch
    mov di, bx
    cld
    rep movsb
    inc acc_count
    GoXY 14, 16
    Prt msg_created
    mov ah, 07h
    int 21h
    jmp start_screen

; =============================================================
; LOGIN
; =============================================================
login_page:
    Cls
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt head_login
    GoXY 10, 8
    Prt box_mid
    GoXY 10, 9
    Prt box_mid
    GoXY 10, 10
    Prt box_mid
    GoXY 10, 11
    Prt box_mid
    GoXY 10, 12
    Prt box_mid
    GoXY 10, 13
    Prt box_mid
    GoXY 10, 14
    Prt box_bot
    
    GoXY 14, 9
    Prt txt_user
    lea dx, in_user_buf
    mov ah, 0Ah
    int 21h
    lea bx, in_user_buf
    call strip_whitespace_proc
    
    GoXY 14, 11
    Prt txt_pass
    lea dx, in_pass_buf
    mov ah, 0Ah
    int 21h
    lea bx, in_pass_buf
    call strip_whitespace_proc
    
    mov curr_chk_idx, 0
search_loop:
    mov al, curr_chk_idx
    cmp al, acc_count
    je login_fail_j
    xor ax, ax
    mov al, curr_chk_idx
    mov bl, SLOT_SIZE
    mul bl
    mov temp_offset, ax
    lea bx, db_users
    add bx, temp_offset 
    mov al, [bx]
    cmp al, in_user_buf+1
    jne next_iter
    inc bx
    lea si, in_user_buf+2
    mov di, bx
    mov cl, in_user_buf+1
    xor ch, ch
    cld
    repe cmpsb
    jne next_iter
    lea bx, db_pass
    add bx, temp_offset
    mov al, [bx]
    cmp al, in_pass_buf+1
    jne login_fail_j
    inc bx
    lea si, in_pass_buf+2
    mov di, bx
    mov cl, in_pass_buf+1
    xor ch, ch
    cld
    repe cmpsb
    jne login_fail_j
    
    ; --- LOGIN SUCCESS ---
    mov al, curr_chk_idx
    mov current_user_id, al
    
    call load_cart_proc
    
    GoXY 14, 16
    Prt msg_ok
    mov ah, 07h
    int 21h
    jmp main_menu_page
    
next_iter:
    inc curr_chk_idx
    jmp search_loop
login_fail_j:
    GoXY 14, 16
    Prt msg_fail
    mov ah, 07h
    int 21h
    jmp start_screen

; =============================================================
; MAIN MENU
; =============================================================
main_menu_page:
    Cls
    call draw_hud_proc
    
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt head_menu
    GoXY 10, 8
    Prt box_mid
    GoXY 10, 9
    Prt menu_1
    GoXY 10, 10
    Prt menu_2
    GoXY 10, 11
    Prt menu_3
    GoXY 10, 12
    Prt menu_4
    GoXY 10, 13
    Prt menu_5
    GoXY 10, 14
    Prt box_mid
    GoXY 10, 15
    Prt menu_sel
    GoXY 10, 16
    Prt box_bot
    
    GoXY 28, 15
    mov ah, 01h
    int 21h
    
    ; --- Safe Jumps ---
    cmp al, '1'
    jne s_2
    jmp t_order
s_2: cmp al, '2'
    jne s_3
    jmp t_view
s_3: cmp al, '3'
    jne s_4
    jmp t_clear
s_4: cmp al, '4'
    jne s_5
    jmp t_buy
s_5: cmp al, '5'
    jne s_err
    jmp t_logout
    
s_err:
    GoXY 14, 18
    Prt msg_inv_sel
    mov ah, 07h
    int 21h
    jmp main_menu_page

t_order:  jmp select_order_page
t_view:   jmp view_order_page
t_clear:  jmp clear_order_page
t_buy:    jmp buy_order_page
t_logout: jmp logout_logic

; =============================================================
; LOGOUT LOGIC (SAVE CART)
; =============================================================
logout_logic:
    call save_cart_proc 
    call clear_active_cart
    
    GoXY 14, 18
    Prt msg_saved
    mov ah, 07h
    int 21h
    jmp start_screen

; =============================================================
; SELECT CATEGORY
; =============================================================
select_order_page:
    Cls
    call draw_hud_proc
    
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt head_cats
    GoXY 10, 8
    Prt box_mid
    GoXY 10, 9
    Prt cat_1
    GoXY 10, 10
    Prt cat_2
    GoXY 10, 11
    Prt cat_3
    GoXY 10, 12
    Prt cat_4
    GoXY 10, 13
    Prt cat_5
    GoXY 10, 14
    Prt box_mid
    GoXY 10, 15
    Prt menu_sel
    GoXY 10, 16
    Prt box_bot
    
    GoXY 28, 15
    mov ah, 01h
    int 21h
    
    cmp al, '1'
    jne cc_2
    jmp c_2
cc_2: cmp al, '2'
    jne cc_3
    jmp c_3
cc_3: cmp al, '3'
    jne cc_4
    jmp c_4
cc_4: cmp al, '4'
    jne cc_5
    jmp c_5
cc_5: cmp al, '5'
    jne cc_err
    jmp c_back
    
cc_err:
    GoXY 14, 18
    Prt msg_inv_sel
    mov ah, 07h
    int 21h
    jmp select_order_page

c_2: jmp proc_main_dish
c_3: jmp proc_snacks
c_4: jmp proc_desserts
c_5: jmp proc_drinks
c_back: jmp main_menu_page

; =============================================================
; ITEMS
; =============================================================
proc_main_dish:
    Cls
    call draw_hud_proc
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt str_mains
    GoXY 10, 8
    Prt box_bot
    GoXY 10, 10
    Prt txt_pick
    mov ah, 01h
    int 21h
    
    cmp al, '1'
    je md1
    cmp al, '2'
    je md2
    cmp al, '3'
    je md3
    jmp item_err
md1: mov di, 0
     mov bx, 150
     jmp go_calc
md2: mov di, 1
     mov bx, 100
     jmp go_calc
md3: mov di, 2
     mov bx, 120
     jmp go_calc

proc_snacks:
    Cls
    call draw_hud_proc
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt str_snacks
    GoXY 10, 8
    Prt box_bot
    GoXY 10, 10
    Prt txt_pick
    mov ah, 01h
    int 21h
    cmp al, '1'
    je sn1
    cmp al, '2'
    je sn2
    cmp al, '3'
    je sn3
    jmp item_err
sn1: mov di, 3
     mov bx, 50
     jmp go_calc
sn2: mov di, 4
     mov bx, 40
     jmp go_calc
sn3: mov di, 5
     mov bx, 90
     jmp go_calc

proc_desserts:
    Cls
    call draw_hud_proc
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt str_desrt
    GoXY 10, 8
    Prt box_bot
    GoXY 10, 10
    Prt txt_pick
    mov ah, 01h
    int 21h
    cmp al, '1'
    je ds1
    cmp al, '2'
    je ds2
    cmp al, '3'
    je ds3
    jmp item_err
ds1: mov di, 6
     mov bx, 30
     jmp go_calc
ds2: mov di, 7
     mov bx, 35
     jmp go_calc
ds3: mov di, 8
     mov bx, 60
     jmp go_calc

proc_drinks:
    Cls
    call draw_hud_proc
    GoXY 10, 5
    Prt box_top
    GoXY 10, 6
    Prt box_mid
    GoXY 25, 6
    Prt app_title
    GoXY 10, 7
    Prt box_mid
    GoXY 10, 7
    Prt str_drnks
    GoXY 10, 8
    Prt box_bot
    GoXY 10, 10
    Prt txt_pick
    mov ah, 01h
    int 21h
    cmp al, '1'
    je dr1
    cmp al, '2'
    je dr2
    cmp al, '3'
    je dr3
    jmp item_err
dr1: mov di, 9
     mov bx, 15
     jmp go_calc
dr2: mov di, 10
     mov bx, 25
     jmp go_calc
dr3: mov di, 11
     mov bx, 30
     jmp go_calc

item_err:
    GoXY 14, 12
    Prt msg_inv_sel
    mov ah, 07h
    int 21h
    jmp select_order_page

; --- CALCULATION (Dispatcher) ---
go_calc:
    mov selected_idx, di
    mov current_price, bx
    
    GoXY 10, 12
    Prt txt_qty
    
    lea dx, in_qty_buf
    mov ah, 0Ah
    int 21h
    
    mov cl, in_qty_buf+1 
    
    cmp cl, 0
    je dispatch_error
    cmp cl, 1
    je dispatch_single
    cmp cl, 2
    je dispatch_double
    jmp dispatch_error 

dispatch_error:
    jmp qty_error
dispatch_single:
    jmp parse_single_digit
dispatch_double:
    jmp parse_two_digits

parse_single_digit:
    mov al, in_qty_buf+2
    cmp al, '1'
    jl range_error_1
    cmp al, '9'
    jg range_error_1
    sub al, '0'
    xor ah, ah
    jmp finalize_qty
range_error_1:
    jmp qty_error

parse_two_digits:
    mov al, in_qty_buf+2
    cmp al, '1'
    jne range_error_2
    mov al, in_qty_buf+3
    cmp al, '0'
    jne range_error_2
    mov ax, 10
    jmp finalize_qty
range_error_2:
    jmp qty_error

finalize_qty:
    mov cx, ax
    mov calc_qty, ax 
    
    mov ax, item_count
    add ax, cx
    cmp ax, 10
    jle check_budget_limit 
    jmp limit_error

check_budget_limit:
    mov ax, current_price
    mul calc_qty
    mov calc_cost, ax
    
    mov ax, total_bill
    add ax, calc_cost
    cmp ax, 500
    jle process_order      
    jmp budget_error

process_order:
    mov ax, item_count
    add ax, calc_qty
    mov item_count, ax
    
    mov di, selected_idx
    mov ax, calc_qty
    add cart_qty[di], al
    
    mov ax, total_bill
    add ax, calc_cost
    mov total_bill, ax
    
    GoXY 14, 14
    Prt msg_add
    mov ah, 07h
    int 21h
    jmp select_order_page

qty_error:
    GoXY 14, 14
    Prt msg_inv_qty
    mov ah, 07h
    int 21h
    jmp select_order_page

limit_error:
    GoXY 14, 14
    Prt msg_limit
    mov ah, 07h
    int 21h
    jmp select_order_page

budget_error:
    GoXY 14, 14
    Prt msg_budget
    mov ah, 07h
    int 21h
    jmp select_order_page

; =============================================================
; VIEW ORDER
; =============================================================
view_order_page:
    Cls
    call draw_hud_proc
    GoXY 25, 2
    Prt app_title
    GoXY 14, 3
    Prt head_cart
    
    cmp total_bill, 0
    jne show_list
    GoXY 14, 5
    Prt msg_empty_c
    jmp view_pause

show_list:
    mov di, 0 
    mov si, 5 ; Row Counter
view_loop:
    cmp di, 12
    je view_total_line
    mov al, cart_qty[di]
    cmp al, 0
    je next_view_item
    
    mov ax, si
    GoXY 14, al
    
    call print_name_proc
    Prt str_x
    xor ax, ax
    mov al, cart_qty[di]
    call print_num_proc
    Prt str_eq
    
    mov bx, di
    shl bx, 1       
    mov ax, item_prices[bx]
    xor cx, cx
    mov cl, cart_qty[di]
    mul cx          
    call print_num_proc
    
    inc si 
next_view_item:
    inc di
    jmp view_loop

view_total_line:
    add si, 1
    mov ax, si
    GoXY 14, al
    
    Prt str_total
    mov ax, total_bill
    call print_num_proc

view_pause:
    add si, 2
    mov ax, si
    GoXY 14, al
    
    Prt msg_pause
    mov ah, 07h
    int 21h
    jmp main_menu_page

; =============================================================
; CLEAR ORDER
; =============================================================
clear_order_page:
    call clear_active_cart
    Cls
    GoXY 14, 10
    Prt msg_cleared
    mov ah, 07h
    int 21h
    jmp main_menu_page

; =============================================================
; BUY ORDER (WITH CONFIRMATION & DB WIPE)
; =============================================================
buy_order_page:
    Cls
    cmp total_bill, 0
    jne ask_confirm
    GoXY 14, 10
    Prt msg_empty_c
    mov ah, 07h
    int 21h
    jmp main_menu_page

ask_confirm:
    GoXY 25, 5
    Prt app_title
    GoXY 14, 8
    Prt str_total
    mov ax, total_bill
    call print_num_proc
    
    GoXY 14, 10
    Prt msg_confirm
    
    mov ah, 01h
    int 21h
    
    cmp al, 'y'
    je do_buy
    cmp al, 'Y'
    je do_buy
    cmp al, 'n'
    je cancel_buy
    cmp al, 'N'
    je cancel_buy
    jmp ask_confirm

cancel_buy:
    jmp main_menu_page

do_buy:
    Cls
    GoXY 25, 5
    Prt app_title
    GoXY 14, 6
    Prt head_rcpt
    GoXY 14, 8
    Prt str_total
    mov ax, total_bill
    call print_num_proc
    GoXY 14, 10
    Prt msg_pause
    mov ah, 07h
    int 21h
    
    ; WIPE DB SLOT + ACTIVE RAM
    call wipe_db_slot_proc
    call clear_active_cart
    
    jmp start_screen

; =============================================================
; EXIT & CLOSING SCREEN
; =============================================================
exit_dos:
    Cls
    GoXY 10, 8
    Prt box_top
    GoXY 10, 9
    Prt box_mid
    GoXY 10, 10
    Prt box_mid
    GoXY 10, 11
    Prt box_mid
    GoXY 10, 12
    Prt box_bot
    
    GoXY 22, 10
    Prt close_big
    GoXY 22, 11
    Prt close_small
    
    mov ah, 07h
    int 21h
    
    mov ah, 4Ch
    int 21h

; =============================================================
; PROCEDURES
; =============================================================

draw_hud_proc proc
    push ax
    push dx
    
    GoXY 2, 2
    Prt hud_spent
    mov ax, total_bill
    call print_num_proc
    Prt hud_limit
    
    GoXY 60, 2
    Prt hud_ord
    mov ax, item_count
    call print_num_proc
    Prt hud_ord_lim
    
    pop dx
    pop ax
    ret
draw_hud_proc endp

; --- DB PROCS ---

; Clear Active RAM variables
clear_active_cart proc
    mov total_bill, 0
    mov item_count, 0
    mov cx, 12
    mov di, 0
clr_loop:
    mov cart_qty[di], 0
    inc di
    loop clr_loop
    ret
clear_active_cart endp

; Wipe specific DB slot (Used on Buy)
wipe_db_slot_proc proc
    push ax
    push bx
    push cx
    push di
    
    xor ax, ax
    mov al, current_user_id
    mov bl, 16 ; 16 byte slot
    mul bl
    mov di, ax
    
    ; Loop 16 times to clear slot
    mov cx, 16
    lea bx, db_carts
    add bx, di
wipe_loop:
    mov byte ptr [bx], 0
    inc bx
    loop wipe_loop
    
    pop di
    pop cx
    pop bx
    pop ax
    ret
wipe_db_slot_proc endp

; Load Cart from DB -> RAM
load_cart_proc proc
    push ax
    push bx
    push cx
    push si
    push di
    
    ; Calculate Offset
    xor ax, ax
    mov al, current_user_id
    mov bl, 16
    mul bl
    mov di, ax ; Offset
    
    ; 1. Copy Qty (12 bytes)
    lea si, db_carts
    add si, di
    lea di, cart_qty
    mov cx, 12
    cld
    rep movsb
    
    ; 2. Copy total_bill (Word)
    lea si, db_carts
    xor ax, ax
    mov al, current_user_id
    mov bl, 16
    mul bl
    add si, ax
    add si, 12 ; Skip 12 qty bytes
    
    mov ax, [si]
    mov total_bill, ax
    
    ; 3. Copy item_count (Word)
    add si, 2
    mov ax, [si]
    mov item_count, ax
    
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret
load_cart_proc endp

; Save Cart RAM -> DB
save_cart_proc proc
    push ax
    push bx
    push cx
    push si
    push di
    
    xor ax, ax
    mov al, current_user_id
    mov bl, 16
    mul bl
    mov di, ax ; Dest Offset
    
    ; 1. Copy Qty
    lea si, cart_qty
    lea di, db_carts
    add di, ax ; Add offset
    mov cx, 12
    cld
    rep movsb
    
    ; 2. Copy Bill
    lea di, db_carts
    xor ax, ax
    mov al, current_user_id
    mov bl, 16
    mul bl
    add di, ax
    add di, 12
    
    mov ax, total_bill
    mov [di], ax
    
    ; 3. Copy Count
    add di, 2
    mov ax, item_count
    mov [di], ax
    
    pop di
    pop si
    pop cx
    pop bx
    pop ax
    ret
save_cart_proc endp

print_name_proc proc
    cmp di, 0
    je p0
    cmp di, 1
    je p1
    cmp di, 2
    je p2
    cmp di, 3
    je p3
    cmp di, 4
    je p4
    cmp di, 5
    je p5
    cmp di, 6
    je p6
    cmp di, 7
    je p7
    cmp di, 8
    je p8
    cmp di, 9
    je p9
    cmp di, 10
    je p10
    cmp di, 11
    je p11
    ret
p0: Prt n_00
    ret
p1: Prt n_01
    ret
p2: Prt n_02
    ret
p3: Prt n_03
    ret
p4: Prt n_04
    ret
p5: Prt n_05
    ret
p6: Prt n_06
    ret
p7: Prt n_07
    ret
p8: Prt n_08
    ret
p9: Prt n_09
    ret
p10: Prt n_10
    ret
p11: Prt n_11
    ret
print_name_proc endp

strip_whitespace_proc proc
    push ax
    push cx
    push si
    xor cx, cx
    mov cl, [bx+1] 
    cmp cl, 0
    je strip_done
    mov si, bx
    add si, 2
    add si, cx
    dec si
strip_loop:
    cmp cx, 0
    je strip_update
    mov al, [si]
    cmp al, ' '
    jne strip_update
    dec si
    dec cx
    jmp strip_loop
strip_update:
    mov [bx+1], cl
strip_done:
    pop si
    pop cx
    pop ax
    ret
strip_whitespace_proc endp

check_duplicate_proc proc
    push ax
    push bx
    push cx
    push dx
    push si
    push di
    mov is_duplicate, 0
    mov curr_chk_idx, 0
check_loop_d:
    mov al, curr_chk_idx
    cmp al, acc_count
    je check_done_d
    xor ax, ax
    mov al, curr_chk_idx
    mov bl, SLOT_SIZE
    mul bl
    mov temp_offset, ax
    lea bx, db_users
    add bx, temp_offset
    mov al, [bx]
    cmp al, in_user_buf+1
    jne check_next_d
    inc bx
    lea si, in_user_buf+2
    mov di, bx
    mov cl, in_user_buf+1
    xor ch, ch
    cld
    repe cmpsb
    jne check_next_d
    mov is_duplicate, 1
    jmp check_done_d
check_next_d:
    inc curr_chk_idx
    jmp check_loop_d
check_done_d:
    pop di
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret
check_duplicate_proc endp

print_num_proc proc
    push ax
    push bx
    push cx
    push dx
    xor cx, cx
    mov bx, 10
p_div:
    xor dx, dx
    div bx
    push dx
    inc cx
    cmp ax, 0
    jne p_div
p_prt:
    pop dx
    add dl, '0'
    mov ah, 02h
    int 21h
    loop p_prt
    pop dx
    pop cx
    pop bx
    pop ax
    ret
print_num_proc endp

main endp
end main