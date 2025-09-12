; Filename: EXER14.ASM
; Practice creating UI
; Name: Helge Justine O. Dano
; Date: August 29, 2025

.model small
.data
    header db     'Band Camp Registration$'
    info db       'Student Information$'
    nam db        'Name$'
    first db      '  First$'
    last db       '  Last$'
    birth db      'Date of Birth          Email                  Grade$'
    email db      'Email$'
    grade db      'Grade$'
    address db    'Address$'
    address1 db   '  Address Line 1$'
    address2 db   'Address line 2$'
    city db       '  City$'
    state db      'State$'
    zipcode db    'Zip Code$'
    tshirt db     'T-shirt Size$'
    instrument db 'Instrument$'
    allergies db  'Does your student have any food allergies that program staff should consider?$'
    yes db        'Yes$'
    no db         'No$'
    parent db     'Parent/Guardian Information$'
    phone db      'Phone$'
    submit db     'Submit$'

.code
.startup

main1:
    mov ax,@data ; import data
    mov ds, ax

    ; line 1

    mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 100
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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 02h
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah,09h ; scanner

     mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 22
    int 10h

    mov dx, offset header ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 3

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 4
    
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
    mov cl, ' '
    mov dl, cl
    int 21h

    mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 19
    int 10h

     mov ah,09h ; scanner

    mov dx, offset info ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 5

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 6

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 4
    int 10h

     mov ah,09h ; scanner

    mov dx, offset nam ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 7

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 30
    int 10h

     mov ah,09h ; scanner

    mov dx, offset first ; print text
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

    mov ah, 09h
    mov bl, 20h ; print color
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
    mov bl, 7Fh ; print color
    mov cx, 30
    int 10h

    mov ah,09h ; scanner

    mov dx, offset last ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 8

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 9

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 65
    int 10h

     mov ah,09h ; scanner

    mov dx, offset birth ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 10

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 19
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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 4
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

     mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 19
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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 22h ; print color
    mov cx, 4
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

     mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 18
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h
    
    ; line 11

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 12

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 7
    int 10h

     mov ah,09h ; scanner

    mov dx, offset address ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 13

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 7Fh ; print color
    mov cx, 65
    int 10h

     mov ah,09h ; scanner

    mov dx, offset address1 ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 14

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 7Fh ; print color
    mov cx, 65
    int 10h

     mov ah,09h ; scanner

    mov dx, offset city ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 15

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 16

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
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 27
    int 10h

     mov ah,09h ; scanner

    mov dx, offset parent ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

    ; line 17

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 65
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

      mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 4
    int 10h

     mov ah,09h ; scanner

    mov dx, offset nam ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 19

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 30
    int 10h

     mov ah,09h ; scanner

    mov dx, offset first ; print text
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

    mov ah, 09h
    mov bl, 20h ; print color
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
    mov bl, 7Fh ; print color
    mov cx, 30
    int 10h

    mov ah,09h ; scanner

    mov dx, offset last ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 20

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 21

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
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 09h
    mov bl, 20h ; print color
    mov cx, 5
    int 10h

     mov ah,09h ; scanner

    mov dx, offset phone ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 22

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
    mov cl, ' '
    mov dl, cl
    int 21h

     mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 65
    int 10h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 23

      mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

     ; line 24

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
    mov cl, ' '
    mov dl, cl
    int 21h

      mov ah, 09h
    mov bl, 7fh ; print color
    mov cx, 6
    int 10h

     mov ah,09h ; scanner

    mov dx, offset submit ; print text
    int 21h

    mov ah, 02h
    mov cl, 0Ah
    mov dl, cl
    int 21h

int 27h
end main1