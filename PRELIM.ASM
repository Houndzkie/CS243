; Filename: PRELIM.ASM
; Creating Google login page using Assembly Language
; Name: Helge Justine O. Dano
; Date: September 12, 2025

.model small
.data
    header db    '     Please enter your details$'
    welcome db   '     Welcome back$'
    email db     '  Email address                                                     $'
    password db  '  Password                                                          $'
    remember db  ' Remember me for 30 days$'
    forgot db    '                          Forgot password$'
    signup1 db    '                               Sign up                              $'
    signin db    '                        Sign in with Google                         $'
    signup2 db 'Sign up$'
    noaccount db "                        Don't have an account?  $"
    nam db       '     Created by: HELGE JUSTINE O. DANO$'

.code
.startup

main1:
    mov ax,@data ; import data
    mov ds, ax

    ; line 1

    mov ah, 09h
    mov bl, 44h ; print color
    mov cx, 80
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 2

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 3

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 78h ; print color
    mov cx, 78
    int 10h

    mov ah,09h ; scanner

    mov dx, offset header ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 4

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 5

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 70h ; print color
    mov cx, 78
    int 10h

      mov ah,09h ; scanner

    mov dx, offset welcome ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 6

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 7

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 78h ; print color
    mov cx, 5
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 09h
    mov bl, 38h ; print color
    mov cx, 68
    int 10h

    mov ah,09h ; scanner

    mov dx, offset email ; print text
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 5
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 8

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 9

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 78h ; print color
    mov cx, 5
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 09h
    mov bl, 38h ; print color
    mov cx, 68
    int 10h

    mov ah,09h ; scanner

    mov dx, offset password ; print text
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 5
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 10

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 11

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 70h ; print color
    mov cx, 5
    int 10h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 09h
    mov bl, 00h ; print color
    mov cx, 2
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 70h ; print color
    mov cx, 24
    int 10h

    mov ah,09h ; scanner

    mov dx, offset remember ; print text
    int 21h

      mov ah, 09h
    mov bl, 79h ; print color
    mov cx, 43
    int 10h

    mov ah,09h ; scanner

    mov dx, offset forgot ; print text
    int 21h

      mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 6
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 12

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 13

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 5
    int 10h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 17h ; print color
    mov cx, 68
    int 10h

    mov ah,09h ; scanner

    mov dx, offset signup1 ; print text
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 5
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 14

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 15

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 5
    int 10h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 38h ; print color
    mov cx, 68
    int 10h

    mov ah,09h ; scanner

    mov dx, offset signin ; print text
    int 21h

      mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 5
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 16

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 17

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 78h ; print color
    mov cx, 48
    int 10h

    mov ah,09h ; scanner

    mov dx, offset noaccount ; print text
    int 21h

    mov ah, 09h
    mov bl, 79h ; print color
    mov cx, 7
    int 10h

    mov ah,09h ; scanner

    mov dx, offset signup2 ; print text
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 23
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 18

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 19

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 70h ; print color
    mov cx, 78
    int 10h

    mov ah,09h ; scanner

    mov dx, offset nam ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 20

      mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 77h ; print color
    mov cx, 78
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 21

int 27h
end main1