; da65 V2.15
; Created:    2017-04-29 19:01:27
; Input file: extract/sedoric4_kern.bin
; Page:       1


        .setcpu "6502"

; ----------------------------------------------------------------------------
BASIC11_INTERPRETER_VECTOR:= $00F0
SEDORIC_FTYPE   := $00F9                        ; FTYPE: #08 si OPEN R (b3 à 1) et #10 si OPEN S (b4 à 1) (ce sont les types SEDORIC: les 'pseudo-fichiers' d'accès Disques n'en ont pas)
STACK           := $0100
BASIC11_KEYBOARD_MATRIX:= $0208                 ; For keyboard decoding
BASIC11_PATTERN_ARG:= $020C
BASIC11_LOWERCASE_UPPERCASE:= $0213
BASIC11_MEMORY_SIZE:= $0220
BASIC10_IRQ_VECTOR:= $0229                      ; Vecteur IRQ Oric -1
BASIC10_IRQ2_VECTOR:= $022C                     ; Vecteur IRQ Oric -1
BASIC11_KEYBOARD_GET_VECTOR:= $023C             ; Vecteur Prendre un caractère au clavier (EB78 ATMOS et 045B SEDORIC)
BASIC11_IRQ_VECTOR:= $0245                      ; Vecteur IRQ (EE22 ATMOS et 0488 SEDORIC)
BASIC11_X       := $0248                        ; Vecteur NMI (F8B2 ATMOS et 04C4 SEDORIC)
BASIC11_CLOADING_SPEED:= $024D
BASIC11_KEYBOARD_DURATION_REPEAT:= $024E        ; Only on atmos
BASIC11_KEYBOARD_REPEAT:= $024F                 ; Only on atmos
BASIC11_NUMBER_OF_COLUMN_FOR_PRINTER:= $0256
BASIC11_NUMBER_OF_LINES_FOR_PRINTER:= $0257
BASIC11_X_TEXT  := $0268
BASIC11_Y_TEXT  := $0269
BASIC11_FLG     := $026A
BASIC11_COLOR_CURSOR:= $0271                    ; Couleur du curseur (#01 ATMOS et #00 SEDORIC)
BASIC11_BLINK_CURSOR:= $0274                    ; Clignotement curseur (#0004 ATMOS et #000B SEDORIC)
BASIC11_TIMER3_VALUE:= $0276                    ; Timer 3 (#6B81 ATMOS et #F6D7 SEDORIC)
BASIC11_DUNNO_VALUE:= $02A0                     ; (#FF ATMOS et #05 SEDORIC)
BASIC11_DUNNO_VALUE2:= $02BE                    ; (#80 ATMOS et #FF SEDORIC)
BASIC11_HIMEM_MAX_ADRESS:= $02C1                ; X
BASIC11_LAST_KEY_PRESSED:= $02DF                ; X
BASIC11_PARAMS  := $02E0
BASIC11_BANG_VECTOR:= $02F5                     ; Vecteur ! (D336 ATMOS et 0467 SEDORIC)
BASIC11_ESPERLUETTE_VECTOR:= $02FC              ; Vecteur &() (D336 ATMOS et 0461 SEDORIC)
V1DRB           := $0300
V1DRA           := $0301
V1DDRB          := $0302
V1DDRA          := $0303
V1T1            := $0304
V1T1L           := $0306
V1T2            := $0308
V1ACR           := $030B
V1PCR           := $030C
V1IFR           := $030D
V1ER            := $030E
V1DRAB          := $030F
MICRODISC_FDC_COMMAND:= $0310
MICRODISC_FDC_TRACK:= $0311
MICRODISC_FDC_SECTOR:= $0312
MICRODISC_FDC_DATA:= $0313
MICRODISC_CONTROL:= $0314
MICRODISC_DRQ   := $0318
DO_EXEVEC       := $0453                        ; Exec code inside overlay
L046B           := $046B
L0471           := $0471
DO_RAMROM       := $0477                        ; Switch from ROM to Overlay and vice-versa
SED_IRQ         := $0488                        ; Replaces IRQ
SED_COLDSTART   := $04A8                        ; Replaces COLDSTART
L04AD           := $04AD
DO_IRQRAM       := $04B3                        ; forwards IRQ/NMI from overlay to ROM
L04D1           := $04D1
SEDORIC_EXERAM  := $04EC
SEDORIC_EXEVEC  := $04EF
RAMROM          := $04F2
IRQRAM          := $04F5
NMIRAM          := $04F8
MICRODISC_CONTROL_SHADOW:= $04FB                ; Caches the control register as it's write-only
SEDORIC_FLAGIF  := $04FC                        ; b7=1 if inside IF
SEDORIC_IDERROR := $04FD                        ; id of Error
SEDORIC_NOLIGN  := $04FE                        ; Line of Error
L09A0           := $09A0
L2020           := $2020
L5B20           := $5B20
LB107           := $B107
SEDORIC_DRIVE   := $C000
SEDORIC_TRACK   := $C001
SEDORIC_SECTOR  := $C002
SEDORIC_RWBUF   := $C003
SEDORIC_type_of_error:= $C005                   ; b5=0 write fault if b5=1 read fault
SEDORIC_number_of_retry:= $C007
SEDORIC_DRVDEF  := $C009
SEDORIC_DRVSYS  := $C00A
SEDORIC_ACTIVATE_DRIVE_AND_TRACK:= $C00B        ; activation drive et piste  contains $00 $0b
SEDORIC_EXTER   := $C00D
SEDORIC_EXTMS   := $C00F
SEDORIC_EXTNB   := $C015
SEDORIC_FLAGERR := $C018                        ; flag ERR (b7 à 1 si SET, à 0 si OFF)
SEDORIC_ERRVEC  := $C01D                        ; adresse de traitement des erreurs (D685 par ex)
SEDORIC_ATMORI  := $C024
SEDORIC_BUFNOM  := $C028
SEDORIC_TABDRV  := $C039                        ; TABDRV D2 D2 D2 D2 table d'activation des lecteurs (4 lecteurs double face, 82 pistes par face)
SEDORIC_MODCLA  := $C03D                        ; mode clavier (b6=ACCENT, b7=AZERTY)
SEDORIC_COMMAND_TYPE_LAUNCHED:= $C048           ; equal to 0. type de code de fonction: * b6=0 si commande SEDORIC (RAM overlay visée) * b6=1 si commande BASIC (ROM visée) * b7=0 si commande re-définissable ou pré-définie * b7=1 dans tous les autres cas
SEDORIC_USER_COMMAND_1_VECTOR:= $C066           ; $23 $DE $80
SEDORIC_USER_COMMAND_2_VECTOR:= $C069           ; $23 $DE $80
SEDORIC_USER_COMMAND_3_VECTOR:= $C06C           ; $23 $DE $80
SEDORIC_USER_COMMAND_4_VECTOR:= $C06F           ; $23 $DE $80
SEDORIC_BACKUP_CHAR_LINPUT:= $C075              ; $2e sauvegarde de caractère pour LINPUT
SEDORIC_BUF1    := $C100                        ; buffer for descriptors
SEDORIC_BUF2    := $C200                        ; buffer for bitmap
SEDORIC_BUF3    := $C300                        ; buffer for directory sector
; ----------------------------------------------------------------------------
SEDKERN_START:
        lda     SEDORIC_number_of_retry         ; C400 AD 07 C0                 ...
        lsr     a                               ; C403 4A                       J
LC404:  lda     #$00                            ; C404 A9 00                    ..
        ror     a                               ; C406 6A                       j
        sta     SEDORIC_ATMORI                  ; C407 8D 24 C0                 .$.
        bpl     LC41B                           ; C40A 10 0F                    ..
LC40D           := * + 1
        lda     #$50                            ; C40C A9 50                    .P
        sta     BASIC11_NUMBER_OF_COLUMN_FOR_PRINTER; C40E 8D 56 02             .V.
        lsr     a                               ; C411 4A                       J
        sta     $31                             ; C412 85 31                    .1
        sta     $32                             ; C414 85 32                    .2
        sta     BASIC11_NUMBER_OF_LINES_FOR_PRINTER; C416 8D 57 02              .W.
        bne     LC421                           ; C419 D0 06                    ..
LC41B:  lda     #$5D                            ; C41B A9 5D                    .]
        sta     $31                             ; C41D 85 31                    .1
        sta     $32                             ; C41F 85 32                    .2
LC421:  inc     BASIC11_HIMEM_MAX_ADRESS        ; C421 EE C1 02                 ...
        inc     BASIC11_HIMEM_MAX_ADRESS+1      ; C424 EE C2 02                 ...
        ldx     #$00                            ; C427 A2 00                    ..
LC429:  lda     page4_oric1,x                   ; C429 BD 00 C6                 ...
        bit     SEDORIC_ATMORI                  ; C42C 2C 24 C0                 ,$.
        bpl     LC434                           ; C42F 10 03                    ..
LC432           := * + 1
        lda     page4_atmos,x                   ; C431 BD 00 C7                 ...
LC434:  sta     $0400,x                         ; C434 9D 00 04                 ...
        inx                                     ; C437 E8                       .
        bne     LC429                           ; C438 D0 EF                    ..
        lda     #$4C                            ; C43A A9 4C                    .L
        ldy     #$00                            ; C43C A0 00                    ..
        ldx     #$04                            ; C43E A2 04                    ..
        sta     $EF                             ; C440 85 EF                    ..
        sty     BASIC11_INTERPRETER_VECTOR      ; C442 84 F0                    ..
        stx     BASIC11_INTERPRETER_VECTOR+1    ; C444 86 F1                    ..
        lda     #$88                            ; C446 A9 88                    ..
        ldy     #$C4                            ; C448 A0 C4                    ..
        bit     SEDORIC_ATMORI                  ; C44A 2C 24 C0                 ,$.
        bpl     LC475                           ; C44D 10 26                    .&
        sta     BASIC11_IRQ_VECTOR              ; C44F 8D 45 02                 .E.
        stx     BASIC11_IRQ_VECTOR+1            ; C452 8E 46 02                 .F.
        sty     BASIC11_X                       ; C455 8C 48 02                 .H.
        stx     BASIC11_X+1                     ; C458 8E 49 02                 .I.
        lda     #$5B                            ; C45B A9 5B                    .[
        sta     BASIC11_KEYBOARD_GET_VECTOR     ; C45D 8D 3C 02                 .<.
        stx     BASIC11_KEYBOARD_GET_VECTOR+1   ; C460 8E 3D 02                 .=.
        lda     #$09                            ; C463 A9 09                    ..
        ldy     #$01                            ; C465 A0 01                    ..
        sta     BASIC11_KEYBOARD_DURATION_REPEAT; C467 8D 4E 02                 .N.
LC46C           := * + 2
        sty     BASIC11_KEYBOARD_REPEAT         ; C46A 8C 4F 02                 .O.
        lda     #$0F                            ; C46D A9 0F                    ..
        ldx     #$70                            ; C46F A2 70                    .p
        ldy     #$D0                            ; C471 A0 D0                    ..
        bne     LC487                           ; C473 D0 12                    ..
LC475:
LC477           := * + 2
        sta     BASIC10_IRQ_VECTOR              ; C475 8D 29 02                 .).
        stx     BASIC10_IRQ_VECTOR+1            ; C478 8E 2A 02                 .*.
        sty     BASIC10_IRQ2_VECTOR             ; C47B 8C 2C 02                 .,.
        stx     BASIC10_IRQ2_VECTOR+1           ; C47E 8E 2D 02                 .-.
        lda     #$07                            ; C481 A9 07                    ..
        ldx     #$E4                            ; C483 A2 E4                    ..
LC486           := * + 1
        ldy     #$CF                            ; C485 A0 CF                    ..
LC487:  sta     BASIC11_FLG                     ; C487 8D 6A 02                 .j.
        stx     $02F9                           ; C48A 8E F9 02                 ...
        sty     $02FA                           ; C48D 8C FA 02                 ...
LC491           := * + 1
        ldx     #$04                            ; C490 A2 04                    ..
        lda     #$A5                            ; C492 A9 A5                    ..
        ldy     #$D0                            ; C494 A0 D0                    ..
        sta     IRQ_VECTOR                      ; C496 8D FE FF                 ...
        sty     IRQ_VECTOR+1                    ; C499 8C FF FF                 ...
LC49C:  lda     #$67                            ; C49C A9 67                    .g
        ldy     #$61                            ; C49E A0 61                    .a
        sta     BASIC11_BANG_VECTOR             ; C4A0 8D F5 02                 ...
LC4A5           := * + 2
        stx     BASIC11_BANG_VECTOR+1           ; C4A3 8E F6 02                 ...
LC4A8           := * + 2
        sty     BASIC11_ESPERLUETTE_VECTOR      ; C4A6 8C FC 02                 ...
        stx     BASIC11_ESPERLUETTE_VECTOR+1    ; C4A9 8E FD 02                 ...
        lda     #$00                            ; C4AC A9 00                    ..
        sta     SEDORIC_DRVDEF                  ; C4AE 8D 09 C0                 ...
        sta     SEDORIC_DRVSYS                  ; C4B1 8D 0A C0                 ...
        sta     SEDORIC_ACTIVATE_DRIVE_AND_TRACK; C4B4 8D 0B C0                 ...
        sta     SEDORIC_ACTIVATE_DRIVE_AND_TRACK+1; C4B7 8D 0C C0               ...
        sta     SEDORIC_EXTNB                   ; C4BA 8D 15 C0                 ...
        sta     SEDORIC_FLAGERR                 ; C4BD 8D 18 C0                 ...
        sta     BASIC11_LAST_KEY_PRESSED        ; C4C0 8D DF 02                 ...
        sta     SEDORIC_COMMAND_TYPE_LAUNCHED   ; C4C3 8D 48 C0                 .H.
        sta     $87                             ; C4C6 85 87                    ..
        lda     #$85                            ; C4C8 A9 85                    ..
        ldy     #$D6                            ; C4CA A0 D6                    ..
        sta     SEDORIC_ERRVEC                  ; C4CC 8D 1D C0                 ...
        sty     SEDORIC_ERRVEC+1                ; C4CF 8C 1E C0                 ...
        lda     MICRODISC_FDC_TRACK             ; C4D2 AD 11 03                 ...
LC4D7           := * + 2
        sta     SEDORIC_ACTIVATE_DRIVE_AND_TRACK+1; C4D5 8D 0C C0               ...
        lda     #$23                            ; C4D8 A9 23                    .#
        ldy     #$DE                            ; C4DA A0 DE                    ..
        ldx     #$80                            ; C4DC A2 80                    ..
        sta     SEDORIC_USER_COMMAND_1_VECTOR   ; C4DE 8D 66 C0                 .f.
        sty     SEDORIC_USER_COMMAND_1_VECTOR+1 ; C4E1 8C 67 C0                 .g.
        stx     SEDORIC_USER_COMMAND_1_VECTOR+2 ; C4E4 8E 68 C0                 .h.
        sta     SEDORIC_USER_COMMAND_2_VECTOR   ; C4E7 8D 69 C0                 .i.
        sty     SEDORIC_USER_COMMAND_2_VECTOR+1 ; C4EA 8C 6A C0                 .j.
        stx     SEDORIC_USER_COMMAND_2_VECTOR+2 ; C4ED 8E 6B C0                 .k.
        sta     SEDORIC_USER_COMMAND_3_VECTOR   ; C4F0 8D 6C C0                 .l.
        sty     SEDORIC_USER_COMMAND_3_VECTOR+1 ; C4F3 8C 6D C0                 .m.
        stx     SEDORIC_USER_COMMAND_3_VECTOR+2 ; C4F6 8E 6E C0                 .n.
        sta     SEDORIC_USER_COMMAND_4_VECTOR   ; C4F9 8D 6F C0                 .o.
        sty     SEDORIC_USER_COMMAND_4_VECTOR+1 ; C4FC 8C 70 C0                 .p.
        stx     SEDORIC_USER_COMMAND_4_VECTOR+2 ; C4FF 8E 71 C0                 .q.
        lda     #$2E                            ; C502 A9 2E                    ..
        sta     SEDORIC_BACKUP_CHAR_LINPUT      ; C504 8D 75 C0                 .u.
        lda     #$1A                            ; C507 A9 1A                    ..
        ldy     #$00                            ; C509 A0 00                    ..
        sta     SEDORIC_EXEVEC+1                ; C50B 8D F0 04                 ...
        sty     SEDORIC_EXEVEC+2                ; C50E 8C F1 04                 ...
        lda     $00                             ; C511 A5 00                    ..
        beq     LC527                           ; C513 F0 12                    ..
        ldx     #$FF                            ; C515 A2 FF                    ..
LC517:  inx                                     ; C517 E8                       .
        lda     MSG_DOS_ALTERED,x               ; C518 BD 74 C5                 .t.
        sta     $B900,x                         ; C51B 9D 00 B9                 ...
        bne     LC517                           ; C51E D0 F7                    ..
        lda     #$00                            ; C520 A9 00                    ..
        ldy     #$B9                            ; C522 A0 B9                    ..
        jsr     SEDORIC_EXERAM                  ; C524 20 EC 04                  ..
LC527:  lda     #$14                            ; C527 A9 14                    ..
        ldy     #$01                            ; C529 A0 01                    ..
        jsr     READ_SECTOR_TRACK               ; C52B 20 5D DA                  ].
        ldx     #$08                            ; C52E A2 08                    ..
LC530:  lda     SEDORIC_BUF1,x                  ; C530 BD 00 C1                 ...
        sta     SEDORIC_TABDRV,x                ; C533 9D 39 C0                 .9.
        cpx     #$05                            ; C536 E0 05                    ..
        bcc     LC53D                           ; C538 90 03                    ..
        sta     SEDORIC_MODCLA,x                ; C53A 9D 3D C0                 .=.
LC53D:  dex                                     ; C53D CA                       .
        bpl     LC530                           ; C53E 10 F0                    ..
        jsr     SEDORIC_XCHAR                   ; C540 20 A3 EB                  ..
        jsr     SEDORIC_XROM                    ; C543 20 D8 D5                  ..
        cpx     #$F7                            ; C546 E0 F7                    ..
        asl     $F8,x                           ; C548 16 F8                    ..
        ldx     #$41                            ; C54A A2 41                    .A
LC54C:  lda     SEDORIC_BUF1+30,x               ; C54C BD 1E C1                 ...
        sta     $36,x                           ; C54F 95 36                    .6
        dex                                     ; C551 CA                       .
        bpl     LC54C                           ; C552 10 F8                    ..
        lda     #$3A                            ; C554 A9 3A                    .:
        sta     $35                             ; C556 85 35                    .5
        jsr     LD206                           ; C558 20 06 D2                  ..
        lda     #$BD                            ; C55B A9 BD                    ..
        ldy     #$C4                            ; C55D A0 C4                    ..
        bit     SEDORIC_ATMORI                  ; C55F 2C 24 C0                 ,$.
        bmi     LC566                           ; C562 30 02                    0.
        lda     #$CD                            ; C564 A9 CD                    ..
LC566:  sta     SEDORIC_EXEVEC+1                ; C566 8D F0 04                 ...
        sty     SEDORIC_EXEVEC+2                ; C569 8C F1 04                 ...
        ldx     #$34                            ; C56C A2 34                    .4
        ldy     #$00                            ; C56E A0 00                    ..
        cli                                     ; C570 58                       X
        jmp     L0471                           ; C571 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
MSG_DOS_ALTERED:
        .byte   $0A,$8C,$81                     ; C574 0A 8C 81                 ...
        .byte   "** "                           ; C577 2A 2A 20                 ** 
LC57A:  .byte   "WARNING **"                    ; C57A 57 41 52 4E 49 4E 47 20  WARNING 
                                                ; C582 2A 2A                    **
        .byte   $88,$87                         ; C584 88 87                    ..
        .byte   "DOS"                           ; C586 44 4F 53                 DOS
LC589:  .byte   " is altered !"                 ; C589 20 69 73 20 61 6C 74 65   is alte
                                                ; C591 72 65 64 20 21           red !
        .byte   $0D,$0A,$00                     ; C596 0D 0A 00                 ...
        .byte   "L"                             ; C599 4C                       L
; ----------------------------------------------------------------------------
        .byte   $64                             ; C59A 64                       d
        .byte   $D3                             ; C59B D3                       .
        rts                                     ; C59C 60                       `

; ----------------------------------------------------------------------------
        lda     LC5AE                           ; C59D AD AE C5                 ...
        ldx     LC5AF                           ; C5A0 AE AF C5                 ...
        sta     SEDORIC_TRACK                   ; C5A3 8D 01 C0                 ...
        stx     SEDORIC_SECTOR                  ; C5A6 8E 02 C0                 ...
        lda     LC5B0                           ; C5A9 AD B0 C5                 ...
        bne     LC589                           ; C5AC D0 DB                    ..
LC5AE:  .byte   $27                             ; C5AE 27                       '
LC5AF:  .byte   $09                             ; C5AF 09                       .
LC5B0:  .byte   $1A                             ; C5B0 1A                       .
SEDORIC_STR_IN_DRIVE:
        .byte   "IN DRIVE"                      ; C5B1 49 4E 20 44 52 49 56 45  IN DRIVE
; ----------------------------------------------------------------------------
        .byte   $A0                             ; C5B9 A0                       .
SEDORIC_STR_LOAD_DISC_FOR_BACKUP:
        .byte   "LOAD DISCS FOR BACKUP FROM"    ; C5BA 4C 4F 41 44 20 44 49 53  LOAD DIS
                                                ; C5C2 43 53 20 46 4F 52 20 42  CS FOR B
                                                ; C5CA 41 43 4B 55 50 20 46 52  ACKUP FR
                                                ; C5D2 4F 4D                    OM
        .byte   $A0                             ; C5D4 A0                       .
        .byte   " TO"                           ; C5D5 20 54 4F                  TO
        .byte   $A0                             ; C5D8 A0                       .
; ----------------------------------------------------------------------------
        .byte   $0D                             ; C5D9 0D                       .
        asl     a                               ; C5DA 0A                       .
SEDORIC_STR_LOAD_SOURCE_DISC:
        .byte   "LOAD SOURCE DISC"              ; C5DB 4C 4F 41 44 20 53 4F 55  LOAD SOU
                                                ; C5E3 52 43 45 20 44 49 53 43  RCE DISC
        .byte   $A0                             ; C5EB A0                       .
; ----------------------------------------------------------------------------
        .byte   $0D                             ; C5EC 0D                       .
        asl     a                               ; C5ED 0A                       .
SEDORIC_STR_LOAD_TARGET_DISC:
        .byte   "LOAD TARGET DISA-"             ; C5EE 4C 4F 41 44 20 54 41 52  LOAD TAR
                                                ; C5F6 47 45 54 20 44 49 53 41  GET DISA
                                                ; C5FE 2D                       -
; ----------------------------------------------------------------------------
        .byte   $2B                             ; C5FF 2B                       +
; Page4, ORIC-1
page4_oric1:
        .byte   $C9,$30,$90,$04,$C9,$3A,$90,$35 ; C600 C9 30 90 04 C9 3A 90 35  .0...:.5
        .byte   $86,$0F,$AA,$30,$2E,$85,$C1,$68 ; C608 86 0F AA 30 2E 85 C1 68  ...0...h
        .byte   $AA,$68,$48,$E0,$F7,$D0,$04,$C9 ; C610 AA 68 48 E0 F7 D0 04 C9  .hH.....
        .byte   $C8,$F0,$09,$E0,$58,$D0,$18,$C9 ; C618 C8 F0 09 E0 58 D0 18 C9  ....X...
        .byte   $CA,$D0,$14,$24,$18,$6E,$FC,$04 ; C620 CA D0 14 24 18 6E FC 04  ...$.n..
        .byte   $A0,$FF,$C8,$B1,$E9,$F0,$11,$C9 ; C628 A0 FF C8 B1 E9 F0 11 C9  ........
        .byte   $3A,$F0,$0D,$C9,$D4,$D0,$F3,$8A ; C630 3A F0 0D C9 D4 D0 F3 8A  :.......
        .byte   $48,$A5,$C1,$A6,$0F,$4C,$41,$EA ; C638 48 A5 C1 A6 0F 4C 41 EA  H....LA.
        .byte   $68,$20,$E9,$04                 ; C640 68 20 E9 04              h ..
LC644:  .byte   $20,$67,$04,$0E,$FC,$04,$B0,$03 ; C644 20 67 04 0E FC 04 B0 03   g......
        .byte   $4C,$AD,$C8,$EA,$EA,$EA,$60,$20 ; C64C 4C AD C8 EA EA EA 60 20  L.....` 
        .byte   $77,$04,$B1,$16,$4C,$77,$04,$EA ; C654 77 04 B1 16 4C 77 04 EA  w...Lw..
        .byte   $EA,$EA,$EA,$EA,$EA,$A9,$8E,$A0 ; C65C EA EA EA EA EA A9 8E A0  ........
        .byte   $F8,$D0,$04,$A9,$AE,$A0,$D3,$8D ; C664 F8 D0 04 A9 AE A0 D3 8D  ........
        .byte   $F0,$04,$8C,$F1,$04,$20,$77,$04 ; C66C F0 04 8C F1 04 20 77 04  ..... w.
        .byte   $20,$EF,$04,$08,$48,$78,$AD,$FB ; C674 20 EF 04 08 48 78 AD FB   ...Hx..
        .byte   $04,$49,$02,$8D,$FB,$04,$8D,$14 ; C67C 04 49 02 8D FB 04 8D 14  .I......
        .byte   $03,$68,$28,$60,$2C,$0D,$03,$50 ; C684 03 68 28 60 2C 0D 03 50  .h(`,..P
        .byte   $0F,$48,$A9,$04,$2D,$6A,$02,$F0 ; C68C 0F 48 A9 04 2D 6A 02 F0  .H..-j..
        .byte   $03,$EE,$74,$02                 ; C694 03 EE 74 02              ..t.
LC698:  .byte   $68,$4C,$03,$EC,$68,$68,$85,$F2 ; C698 68 4C 03 EC 68 68 85 F2  hL..hh..
        .byte   $68,$AA,$A9,$36,$A0,$D1,$D0,$C3 ; C6A0 68 AA A9 36 A0 D1 D0 C3  h..6....
        .byte   $20,$F2,$04,$68,$40,$8D,$14,$03 ; C6A8 20 F2 04 68 40 8D 14 03   ..h@...
        .byte   $6C,$FC,$FF,$18,$20,$77,$04,$48 ; C6B0 6C FC FF 18 20 77 04 48  l... w.H
        .byte   $A9,$04,$48,$A9,$A8,$48,$08,$B0 ; C6B8 A9 04 48 A9 A8 48 08 B0  ..H..H..
        .byte   $03,$4C,$28,$02,$20,$88,$F8,$A9 ; C6C0 03 4C 28 02 20 88 F8 A9  .L(. ...
        .byte   $17,$A0,$EC,$20,$6B,$04,$4C,$75 ; C6C8 17 A0 EC 20 6B 04 4C 75  ... k.Lu
        .byte   $C4,$A9,$04,$48                 ; C6D0 C4 A9 04 48              ...H
LC6D4:  .byte   $A9,$F1,$48,$8A,$48,$98,$48,$20 ; C6D4 A9 F1 48 8A 48 98 48 20  ..H.H.H 
LC6DC:  .byte   $F2,$04,$4C,$70,$D2,$EA,$EA,$EA ; C6DC F2 04 4C 70 D2 EA EA EA  ..Lp....
LC6E4:  .byte   $EA                             ; C6E4 EA                       .
LC6E5:  .byte   $EA                             ; C6E5 EA                       .
LC6E6:  .byte   $EA                             ; C6E6 EA                       .
LC6E7:  .byte   $EA                             ; C6E7 EA                       .
LC6E8:  .byte   $EA                             ; C6E8 EA                       .
LC6E9:  .byte   $4C                             ; C6E9 4C                       L
LC6EA:  .byte   $87                             ; C6EA 87                       .
LC6EB:  .byte   $04                             ; C6EB 04                       .
LC6EC:  .byte   $4C,$71,$04,$4C,$00,$00,$4C,$77 ; C6EC 4C 71 04 4C 00 00 4C 77  Lq.L..Lw
        .byte   $04,$4C,$B3,$04,$4C,$B4,$04,$84 ; C6F4 04 4C B3 04 4C B4 04 84  .L..L...
        .byte   $00,$00,$00,$00                 ; C6FC 00 00 00 00              ....
; Page4, Atmos
page4_atmos:
        .byte   $C9,$30,$90,$04,$C9,$3A,$90,$35 ; C700 C9 30 90 04 C9 3A 90 35  .0...:.5
        .byte   $86,$0F,$AA,$30,$2E,$85,$C1,$68 ; C708 86 0F AA 30 2E 85 C1 68  ...0...h
        .byte   $AA,$68,$48,$E0,$0E,$D0,$04,$C9 ; C710 AA 68 48 E0 0E D0 04 C9  .hH.....
        .byte   $C9,$F0,$09,$E0,$8A,$D0,$18,$C9 ; C718 C9 F0 09 E0 8A D0 18 C9  ........
        .byte   $CA,$D0,$14,$24,$18,$6E,$FC,$04 ; C720 CA D0 14 24 18 6E FC 04  ...$.n..
        .byte   $A0,$FF,$C8,$B1,$E9,$F0,$11,$C9 ; C728 A0 FF C8 B1 E9 F0 11 C9  ........
        .byte   $3A,$F0,$0D,$C9,$D4,$D0,$F3,$8A ; C730 3A F0 0D C9 D4 D0 F3 8A  :.......
        .byte   $48,$A5,$C1,$A6,$0F,$4C,$B9,$EC ; C738 48 A5 C1 A6 0F 4C B9 EC  H....L..
        .byte   $68,$20,$E9,$04,$20,$67,$04,$0E ; C740 68 20 E9 04 20 67 04 0E  h .. g..
        .byte   $FC,$04,$B0,$03,$4C,$C1,$C8,$6E ; C748 FC 04 B0 03 4C C1 C8 6E  ....L..n
        .byte   $52,$02,$60,$20,$77,$04         ; C750 52 02 60 20 77 04        R.` w.
LC756:  .byte   $B1,$16,$4C,$77,$04,$A9,$45,$A0 ; C756 B1 16 4C 77 04 A9 45 A0  ..Lw..E.
        .byte   $D8,$D0,$0A,$A9,$8E,$A0,$F8,$D0 ; C75E D8 D0 0A A9 8E A0 F8 D0  ........
        .byte   $04,$A9,$AE,$A0,$D3,$8D,$F0,$04 ; C766 04 A9 AE A0 D3 8D F0 04  ........
        .byte   $8C,$F1,$04,$20,$77,$04,$20,$EF ; C76E 8C F1 04 20 77 04 20 EF  ... w. .
        .byte   $04,$08,$48,$78,$AD,$FB,$04,$49 ; C776 04 08 48 78 AD FB 04 49  ..Hx...I
        .byte   $02,$8D,$FB,$04,$8D,$14,$03,$68 ; C77E 02 8D FB 04 8D 14 03 68  .......h
        .byte   $28,$60,$2C,$0D,$03,$50,$0F,$48 ; C786 28 60 2C 0D 03 50 0F 48  (`,..P.H
        .byte   $A9,$04,$2D,$6A,$02,$F0,$03,$EE ; C78E A9 04 2D 6A 02 F0 03 EE  ..-j....
        .byte   $74,$02,$68,$4C,$22,$EE,$68,$68 ; C796 74 02 68 4C 22 EE 68 68  t.hL".hh
        .byte   $85,$F2,$68,$AA,$A9,$36,$A0,$D1 ; C79E 85 F2 68 AA A9 36 A0 D1  ..h..6..
        .byte   $D0,$C3,$20,$F2,$04,$68,$40,$8D ; C7A6 D0 C3 20 F2 04 68 40 8D  .. ..h@.
        .byte   $14,$03,$6C,$FC,$FF,$18,$20,$77 ; C7AE 14 03 6C FC FF 18 20 77  ..l... w
        .byte   $04,$48,$A9,$04,$48,$A9,$A8,$48 ; C7B6 04 48 A9 04 48 A9 A8 48  .H..H..H
        .byte   $08,$B0,$03,$4C,$44,$02,$20,$B8 ; C7BE 08 B0 03 4C 44 02 20 B8  ...LD. .
        .byte   $F8,$A9,$17,$A0,$EC,$20,$6B,$04 ; C7C6 F8 A9 17 A0 EC 20 6B 04  ..... k.
        .byte   $4C,$71,$C4,$A9,$04,$48,$A9,$F1 ; C7CE 4C 71 C4 A9 04 48 A9 F1  Lq...H..
        .byte   $48,$8A,$48,$98,$48,$20,$F2,$04 ; C7D6 48 8A 48 98 48 20 F2 04  H.H.H ..
        .byte   $4C,$06,$D3,$EA,$EA,$EA,$EA,$EA ; C7DE 4C 06 D3 EA EA EA EA EA  L.......
        .byte   $EA,$EA,$EA,$4C,$87,$04,$4C,$71 ; C7E6 EA EA EA 4C 87 04 4C 71  ...L..Lq
        .byte   $04,$4C,$00,$00,$4C,$77,$04,$4C ; C7EE 04 4C 00 00 4C 77 04 4C  .L..Lw.L
        .byte   $B3,$04,$4C,$B4,$04,$84,$00,$00 ; C7F6 B3 04 4C B4 04 84 00 00  ..L.....
        .byte   $00,$00                         ; C7FE 00 00                    ..
; Key shortcut table
KEYDEF: .byte   $07,$45,$57,$4B,$00,$18,$07,$08 ; C800 07 45 57 4B 00 18 07 08  .EWK....
        .byte   $59,$7B,$06,$09,$00,$42,$41,$51 ; C808 59 7B 06 09 00 42 41 51  Y{...BAQ
        .byte   $05,$67,$24,$00,$00,$5B,$27,$00 ; C810 05 67 24 00 00 5B 27 00  .g$..['.
        .byte   $1B,$3F,$04,$0A,$00,$5F,$3D,$0D ; C818 1B 3F 04 0A 00 5F 3D 0D  .?..._=.
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; C820 00 00 00 00 00 00 00 00  ........
        .byte   $01,$00,$08,$00,$00,$00,$21,$FF ; C828 01 00 08 00 00 00 21 FF  ......!.
        .byte   $6D,$63,$02,$0C,$00,$0F,$72,$00 ; C830 6D 63 02 0C 00 0F 72 00  mc....r.
        .byte   $03,$32,$29,$00,$00,$0E,$1E,$0B ; C838 03 32 29 00 00 0E 1E 0B  .2).....
        .byte   $17,$B2,$A8,$F1,$00,$8C,$A6,$18 ; C840 17 B2 A8 F1 00 8C A6 18  ........
        .byte   $90,$C9,$16,$19,$00,$92,$A2,$BC ; C848 90 C9 16 19 00 92 A2 BC  ........
        .byte   $15,$9C,$CA,$00,$00,$D2,$9B,$10 ; C850 15 9C CA 00 00 D2 9B 10  ........
        .byte   $EB,$8D,$14,$1A,$00,$87,$C8,$1D ; C858 EB 8D 14 1A 00 87 C8 1D  ........
        .byte   $00,$00,$00,$00,$00,$00,$00,$00 ; C860 00 00 00 00 00 00 00 00  ........
        .byte   $11,$00,$A5,$00,$00,$00,$D1,$FF ; C868 11 00 A5 00 00 00 D1 FF  ........
        .byte   $A4,$9A,$12,$1C,$00,$1F,$CB,$00 ; C870 A4 9A 12 1C 00 1F CB 00  ........
        .byte   $13,$91,$ED,$00,$00,$1E,$B5,$1B ; C878 13 91 ED 00 00 1E B5 1B  ........
; Key shortcut table
REDEF:  .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C880 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$20,$20,$20,$20,$A0 ; C888 20 20 20 20 20 20 20 A0         .
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C890 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$35         ; C898 4B 45 23 32 46 35        KE#2F5
LC89E:  .byte   $2C,$A3,$20,$20,$44,$4F,$4B,$45 ; C89E 2C A3 20 20 44 4F 4B 45  ,.  DOKE
        .byte   $23,$32,$46,$35,$2C,$23,$34,$36 ; C8A6 23 32 46 35 2C 23 34 36  #2F5,#46
        .byte   $37,$8D,$20,$20,$20,$20,$20,$20 ; C8AE 37 8D 20 20 20 20 20 20  7.      
        .byte   $44,$4F,$4B,$45,$23,$32,$46,$39 ; C8B6 44 4F 4B 45 23 32 46 39  DOKE#2F9
        .byte   $2C,$A3,$20,$44,$4F,$4B,$45,$23 ; C8BE 2C A3 20 44 4F 4B 45 23  ,. DOKE#
        .byte   $32,$46,$39,$2C,$23,$44,$30,$37 ; C8C6 32 46 39 2C 23 44 30 37  2F9,#D07
        .byte   $30,$8D,$20,$20,$20,$20,$20,$20 ; C8CE 30 8D 20 20 20 20 20 20  0.      
        .byte   $44,$4F,$4B,$45,$23,$32,$46,$43 ; C8D6 44 4F 4B 45 23 32 46 43  DOKE#2FC
        .byte   $2C,$A3,$20,$20,$44,$4F,$4B,$45 ; C8DE 2C A3 20 20 44 4F 4B 45  ,.  DOKE
        .byte   $23,$32,$46,$43,$2C,$23,$34,$36 ; C8E6 23 32 46 43 2C 23 34 36  #2FC,#46
        .byte   $31,$8D,$20,$20,$20,$20,$50,$41 ; C8EE 31 8D 20 20 20 20 50 41  1.    PA
        .byte   $50,$45,$52,$30,$3A,$49,$4E,$4B ; C8F6 50 45 52 30 3A 49 4E 4B  PER0:INK
        .byte   $37,$8D,$20,$20,$20,$20,$20,$20 ; C8FE 37 8D 20 20 20 20 20 20  7.      
        .byte   $43,$41,$4C,$4C,$23,$46,$38,$44 ; C906 43 41 4C 4C 23 46 38 44  CALL#F8D
        .byte   $30,$8D,$20,$20,$20,$20,$20,$20 ; C90E 30 8D 20 20 20 20 20 20  0.      
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C916 20 20 20 20 20 20 20 20          
        .byte   $20,$FE,$20,$20,$20,$20,$3F,$48 ; C91E 20 FE 20 20 20 20 3F 48   .    ?H
        .byte   $45,$58,$24,$28,$50,$45,$45,$4B ; C926 45 58 24 28 50 45 45 4B  EX$(PEEK
        .byte   $28,$A3,$20,$20,$20,$20,$3F,$48 ; C92E 28 A3 20 20 20 20 3F 48  (.    ?H
        .byte   $45,$58,$24,$28,$44,$45,$45,$4B ; C936 45 58 24 28 44 45 45 4B  EX$(DEEK
        .byte   $28,$A3,$20,$20,$20,$20,$20,$20 ; C93E 28 A3 20 20 20 20 20 20  (.      
        .byte   $20,$20,$20,$20,$50,$45,$45,$4B ; C946 20 20 20 20 50 45 45 4B      PEEK
        .byte   $28,$A3,$20,$20,$20,$20,$20,$20 ; C94E 28 A3 20 20 20 20 20 20  (.      
        .byte   $20,$20,$20,$20,$44,$45,$45,$4B ; C956 20 20 20 20 44 45 45 4B      DEEK
        .byte   $28,$A3,$20,$20,$20,$20,$20,$20 ; C95E 28 A3 20 20 20 20 20 20  (.      
        .byte   $20,$20,$20,$20,$20,$50,$4F,$4B ; C966 20 20 20 20 20 50 4F 4B       POK
        .byte   $45,$A3,$20,$20,$20,$20,$20,$20 ; C96E 45 A3 20 20 20 20 20 20  E.      
        .byte   $20,$20,$20,$20,$20,$44,$4F,$4B ; C976 20 20 20 20 20 44 4F 4B       DOK
        .byte   $45,$A3                         ; C97E 45 A3                    E.
; Key shortcut table
PREDEF: .byte   $48,$45,$58,$24,$A8,$43,$41,$4C ; C980 48 45 58 24 A8 43 41 4C  HEX$.CAL
        .byte   $4C,$A3,$54,$45,$58,$54,$8D,$46 ; C988 4C A3 54 45 58 54 8D 46  L.TEXT.F
        .byte   $4F,$52,$49,$3D,$31,$54,$CF,$4C ; C990 4F 52 49 3D 31 54 CF 4C  ORI=1T.L
        .byte   $45,$46,$54,$24,$A8,$4D,$49,$44 ; C998 45 46 54 24 A8 4D 49 44  EFT$.MID
        .byte   $24,$A8,$52,$49,$47,$48,$54,$24 ; C9A0 24 A8 52 49 47 48 54 24  $.RIGHT$
        .byte   $A8,$53,$54,$52,$24,$A8,$55,$4E ; C9A8 A8 53 54 52 24 A8 55 4E  .STR$.UN
        .byte   $50,$52,$4F,$54,$8D,$E0,$55,$53 ; C9B0 50 52 4F 54 8D E0 55 53  PROT..US
        .byte   $49,$4E,$C7,$56,$49,$53,$55,$48 ; C9B8 49 4E C7 56 49 53 55 48  IN.VISUH
        .byte   $49,$52,$45,$53,$A2,$56,$55,$53 ; C9C0 49 52 45 53 A2 56 55 53  IRES.VUS
        .byte   $45,$52,$8D,$57,$49,$44,$54,$C8 ; C9C8 45 52 8D 57 49 44 54 C8  ER.WIDT.
        .byte   $57,$49,$4E,$44,$4F,$D7,$21,$52 ; C9D0 57 49 4E 44 4F D7 21 52  WINDO.!R
        .byte   $45,$53,$54,$4F,$52,$C5         ; C9D8 45 53 54 4F 52 C5        ESTOR.
; ----------------------------------------------------------------------------
; SEDORIC token table
TOKEN_TABLE:
        .byte   "PP"                            ; C9DE 50 50                    PP
        .byte   $80,$00                         ; C9E0 80 00                    ..
        .byte   "ZERTY"                         ; C9E2 5A 45 52 54 59           ZERTY
        .byte   $00                             ; C9E7 00                       .
        .byte   "CCENT"                         ; C9E8 43 43 45 4E 54           CCENT
        .byte   $00                             ; C9ED 00                       .
        .byte   "OX"                            ; C9EE 4F 58                    OX
        .byte   $00                             ; C9F0 00                       .
        .byte   "ACKUP"                         ; C9F1 41 43 4B 55 50           ACKUP
        .byte   $00                             ; C9F6 00                       .
        .byte   "UILD"                          ; C9F7 55 49 4C 44              UILD
        .byte   $00                             ; C9FB 00                       .
        .byte   "HDIR"                          ; C9FC 48 44 49 52              HDIR
        .byte   $00                             ; CA00 00                       .
        .byte   "HAN"                           ; CA01 48 41 4E                 HAN
LCA04:  .byte   "GE"                            ; CA04 47 45                    GE
        .byte   $00                             ; CA06 00                       .
        .byte   "LOSE"                          ; CA07 4C 4F 53 45              LOSE
        .byte   $00                             ; CA0B 00                       .
        .byte   "OPY"                           ; CA0C 4F 50 59                 OPY
        .byte   $00                             ; CA0F 00                       .
        .byte   "REATEW"                        ; CA10 52 45 41 54 45 57        REATEW
        .byte   $00                             ; CA16 00                       .
        .byte   "RESEC"                         ; CA17 52 45 53 45 43           RESEC
        .byte   $00                             ; CA1C 00                       .
        .byte   "HKSUM"                         ; CA1D 48 4B 53 55 4D           HKSUM
        .byte   $00                             ; CA22 00                       .
        .byte   "ELDIR"                         ; CA23 45 4C 44 49 52           ELDIR
        .byte   $00                             ; CA28 00                       .
        .byte   "E"                             ; CA29 45                       E
        .byte   $96                             ; CA2A 96                       .
        .byte   "E"                             ; CA2B 45                       E
        .byte   $00                             ; CA2C 00                       .
        .byte   "ESTROY"                        ; CA2D 45 53 54 52 4F 59        ESTROY
        .byte   $00                             ; CA33 00                       .
        .byte   "ELBAK"                         ; CA34 45 4C 42 41 4B           ELBAK
        .byte   $00                             ; CA39 00                       .
        .byte   "EL"                            ; CA3A 45 4C                    EL
        .byte   $00                             ; CA3C 00                       .
        .byte   "IR"                            ; CA3D 49 52                    IR
        .byte   $00                             ; CA3F 00                       .
        .byte   "NUM"                           ; CA40 4E 55 4D                 NUM
        .byte   $00                             ; CA43 00                       .
        .byte   "NAME"                          ; CA44 4E 41 4D 45              NAME
        .byte   $00                             ; CA48 00                       .
        .byte   "KEY"                           ; CA49 4B 45 59                 KEY
        .byte   $00                             ; CA4C 00                       .
        .byte   "SYS"                           ; CA4D 53 59 53                 SYS
        .byte   $00                             ; CA50 00                       .
        .byte   "TRACK"                         ; CA51 54 52 41 43 4B           TRACK
        .byte   $00                             ; CA56 00                       .
        .byte   "RR"                            ; CA57 52 52                    RR
        .byte   $97,$00                         ; CA59 97 00                    ..
        .byte   "RRGOTO"                        ; CA5B 52 52 47 4F 54 4F        RRGOTO
        .byte   $00                             ; CA61 00                       .
        .byte   "RROR"                          ; CA62 52 52 4F 52              RROR
        .byte   $00                             ; CA66 00                       .
        .byte   "RR"                            ; CA67 52 52                    RR
        .byte   $D2,$00                         ; CA69 D2 00                    ..
        .byte   "RR"                            ; CA6B 52 52                    RR
        .byte   $00                             ; CA6D 00                       .
        .byte   "SAVE"                          ; CA6E 53 41 56 45              SAVE
        .byte   $00                             ; CA72 00                       .
        .byte   "XT"                            ; CA73 58 54                    XT
        .byte   $00                             ; CA75 00                       .
        .byte   "IELD"                          ; CA76 49 45 4C 44              IELD
        .byte   $00                             ; CA7A 00                       .
        .byte   "RSEC"                          ; CA7B 52 53 45 43              RSEC
        .byte   $00                             ; CA7F 00                       .
        .byte   "CUR"                           ; CA80 43 55 52                 CUR
        .byte   $00                             ; CA83 00                       .
        .byte   "NIT"                           ; CA84 4E 49 54                 NIT
        .byte   $00                             ; CA87 00                       .
        .byte   "NSTR"                          ; CA88 4E 53 54 52              NSTR
        .byte   $00                             ; CA8C 00                       .
        .byte   "NIST"                          ; CA8D 4E 49 53 54              NIST
        .byte   $00                             ; CA91 00                       .
        .byte   "UMP"                           ; CA92 55 4D 50                 UMP
        .byte   $00                             ; CA95 00                       .
        .byte   "EY"                            ; CA96 45 59                    EY
        .byte   $99,$00                         ; CA98 99 00                    ..
        .byte   "EYIF"                          ; CA9A 45 59 49 46              EYIF
        .byte   $00                             ; CA9E 00                       .
        .byte   "EYUSE"                         ; CA9F 45 59 55 53 45           EYUSE
        .byte   $00                             ; CAA4 00                       .
        .byte   "EYDEF"                         ; CAA5 45 59 44 45 46           EYDEF
        .byte   $00                             ; CAAA 00                       .
        .byte   "EY"                            ; CAAB 45 59                    EY
        .byte   $B8,$00                         ; CAAD B8 00                    ..
        .byte   "EYSAVE"                        ; CAAF 45 59 53 41 56 45        EYSAVE
        .byte   $00                             ; CAB5 00                       .
        .byte   "EY"                            ; CAB6 45 59                    EY
        .byte   $00                             ; CAB8 00                       .
        .byte   "INE"                           ; CAB9 49 4E 45                 INE
        .byte   $00                             ; CABC 00                       .
        .byte   "SET"                           ; CABD 53 45 54                 SET
        .byte   $00                             ; CAC0 00                       .
        .byte   "USING"                         ; CAC1 55 53 49 4E 47           USING
        .byte   $00                             ; CAC6 00                       .
        .byte   "U"                             ; CAC7 55                       U
        .byte   $E3                             ; CAC8 E3                       .
        .byte   "G"                             ; CAC9 47                       G
        .byte   $00,$92,$00                     ; CACA 00 92 00                 ...
        .byte   "OAD"                           ; CACD 4F 41 44                 OAD
        .byte   $00                             ; CAD0 00                       .
        .byte   "DIR"                           ; CAD1 44 49 52                 DIR
        .byte   $00                             ; CAD4 00                       .
        .byte   "TYPE"                          ; CAD5 54 59 50 45              TYPE
        .byte   $00                             ; CAD9 00                       .
        .byte   "CUR"                           ; CADA 43 55 52                 CUR
        .byte   $00                             ; CADD 00                       .
        .byte   "KDIR"                          ; CADE 4B 44 49 52              KDIR
        .byte   $00                             ; CAE2 00                       .
        .byte   "OVE"                           ; CAE3 4F 56 45                 OVE
        .byte   $00                             ; CAE6 00                       .
        .byte   "ERGE"                          ; CAE7 45 52 47 45              ERGE
        .byte   $00                             ; CAEB 00                       .
        .byte   "UM"                            ; CAEC 55 4D                    UM
        .byte   $00                             ; CAEE 00                       .
        .byte   "UT"                            ; CAEF 55 54                    UT
        .byte   $00                             ; CAF1 00                       .
        .byte   "LD"                            ; CAF2 4C 44                    LD
        .byte   $00                             ; CAF4 00                       .
        .byte   "PEN"                           ; CAF5 50 45 4E                 PEN
        .byte   $00                             ; CAF8 00                       .
        .byte   "ATHDIR"                        ; CAF9 41 54 48 44 49 52        ATHDIR
        .byte   $00                             ; CAFF 00                       .
        .byte   "UT"                            ; CB00 55 54                    UT
        .byte   $00                             ; CB02 00                       .
        .byte   "ROT"                           ; CB03 52 4F 54                 ROT
        .byte   $00                             ; CB06 00                       .
        .byte   "R"                             ; CB07 52                       R
        .byte   $00                             ; CB08 00                       .
        .byte   "MAP"                           ; CB09 4D 41 50                 MAP
        .byte   $00                             ; CB0C 00                       .
        .byte   "UIT"                           ; CB0D 55 49 54                 UIT
        .byte   $00                             ; CB10 00                       .
        .byte   "WERTY"                         ; CB11 57 45 52 54 59           WERTY
        .byte   $00                             ; CB16 00                       .
        .byte   "ESUME"                         ; CB17 45 53 55 4D 45           ESUME
        .byte   $00                             ; CB1C 00                       .
        .byte   "SET"                           ; CB1D 53 45 54                 SET
        .byte   $00                             ; CB20 00                       .
        .byte   "EWIND"                         ; CB21 45 57 49 4E 44           EWIND
        .byte   $00                             ; CB26 00                       .
        .byte   "ENUM"                          ; CB27 45 4E 55 4D              ENUM
        .byte   $00                             ; CB2B 00                       .
        .byte   "EN"                            ; CB2C 45 4E                    EN
        .byte   $00,$D1                         ; CB2E 00 D1                    ..
        .byte   "OM"                            ; CB30 4F 4D                    OM
        .byte   $00                             ; CB32 00                       .
        .byte   "ANDOM"                         ; CB33 41 4E 44 4F 4D           ANDOM
        .byte   $00                             ; CB38 00                       .
        .byte   "ESET"                          ; CB39 45 53 45 54              ESET
        .byte   $00                             ; CB3D 00                       .
        .byte   "WAP"                           ; CB3E 57 41 50                 WAP
        .byte   $00                             ; CB41 00                       .
        .byte   "EEK"                           ; CB42 45 45 4B                 EEK
        .byte   $00                             ; CB45 00                       .
        .byte   "TRUN"                          ; CB46 54 52 55 4E              TRUN
        .byte   $00                             ; CB4A 00                       .
        .byte   "T"                             ; CB4B 54                       T
        .byte   $98,$00                         ; CB4C 98 00                    ..
        .byte   "YSTEM"                         ; CB4E 59 53 54 45 4D           YSTEM
        .byte   $00                             ; CB53 00                       .
        .byte   "TATUS"                         ; CB54 54 41 54 55 53           TATUS
        .byte   $00                             ; CB59 00                       .
        .byte   "AVEU"                          ; CB5A 41 56 45 55              AVEU
        .byte   $00                             ; CB5E 00                       .
        .byte   "AVEM"                          ; CB5F 41 56 45 4D              AVEM
        .byte   $00                             ; CB63 00                       .
        .byte   "AVEO"                          ; CB64 41 56 45 4F              AVEO
        .byte   $00                             ; CB68 00                       .
        .byte   "AVE"                           ; CB69 41 56 45                 AVE
        .byte   $00                             ; CB6C 00                       .
        .byte   "EARCH"                         ; CB6D 45 41 52 43 48           EARCH
        .byte   $00                             ; CB72 00                       .
        .byte   "YS"                            ; CB73 59 53                    YS
        .byte   $00                             ; CB75 00                       .
        .byte   "MAP"                           ; CB76 4D 41 50                 MAP
        .byte   $00                             ; CB79 00                       .
        .byte   "KEN"                           ; CB7A 4B 45 4E                 KEN
        .byte   $00                             ; CB7D 00                       .
        .byte   "AKE"                           ; CB7E 41 4B 45                 AKE
        .byte   $00                             ; CB81 00                       .
        .byte   "YPE"                           ; CB82 59 50 45                 YPE
        .byte   $00                             ; CB85 00                       .
        .byte   "RACK"                          ; CB86 52 41 43 4B              RACK
        .byte   $00                             ; CB8A 00                       .
        .byte   "SER"                           ; CB8B 53 45 52                 SER
        .byte   $00                             ; CB8E 00                       .
        .byte   "NTKEN"                         ; CB8F 4E 54 4B 45 4E           NTKEN
        .byte   $00,$E3                         ; CB94 00 E3                    ..
        .byte   "G"                             ; CB96 47                       G
        .byte   $00                             ; CB97 00                       .
        .byte   "NPROT"                         ; CB98 4E 50 52 4F 54           NPROT
        .byte   $00                             ; CB9D 00                       .
        .byte   "ISU"                           ; CB9E 49 53 55                 ISU
        .byte   $A2,$00                         ; CBA1 A2 00                    ..
        .byte   "USER"                          ; CBA3 55 53 45 52              USER
        .byte   $00                             ; CBA7 00                       .
        .byte   "IDTH"                          ; CBA8 49 44 54 48              IDTH
        .byte   $00                             ; CBAC 00                       .
        .byte   "INDOW"                         ; CBAD 49 4E 44 4F 57           INDOW
        .byte   $00,$9A,$00                     ; CBB2 00 9A 00                 ...
        .byte   "]"                             ; CBB5 5D                       ]
        .byte   $00,$FF,$00,$00,$00             ; CBB6 00 FF 00 00 00           .....
; ----------------------------------------------------------------------------
; SEDORIC token initials table
TOKEN_INITIALS_TABLE:
        .byte   $DE                             ; CBBB DE                       .
LCBBC:  .byte   $C9                             ; CBBC C9                       .
LCBBD:  .byte   $00,$03,$EE,$C9,$03,$03,$FC,$C9 ; CBBD 00 03 EE C9 03 03 FC C9  ........
        .byte   $06,$07,$23,$CA,$0D,$0B,$57,$CA ; CBC5 06 07 23 CA 0D 0B 57 CA  ..#...W.
        .byte   $18,$07,$76,$CA,$1F,$02,$CC,$CC ; CBCD 18 07 76 CA 1F 02 CC CC  ..v.....
        .byte   $21,$00,$80,$CA,$21,$01,$84,$CA ; CBD5 21 00 80 CA 21 01 84 CA  !...!...
        .byte   $22,$03,$92,$CA,$25,$01,$96,$CA ; CBDD 22 03 92 CA 25 01 96 CA  "...%...
        .byte   $26,$07,$B9,$CA,$2D,$09,$DE,$CA ; CBE5 26 07 B9 CA 2D 09 DE CA  &...-...
        .byte   $36,$03,$EC,$CA,$39,$01,$EF,$CA ; CBED 36 03 EC CA 39 01 EF CA  6...9...
        .byte   $3A,$03,$F9,$CA,$3D,$05,$0D,$CB ; CBF5 3A 03 F9 CA 3D 05 0D CB  :...=...
        .byte   $42,$02,$17,$CB,$44,$08,$3E,$CB ; CBFD 42 02 17 CB 44 08 3E CB  B...D.>.
        .byte   $4C,$0D,$7A,$CB,$59,$04,$8B,$CB ; CC05 4C 0D 7A CB 59 04 8B CB  L.z.Y...
        .byte   $5D,$04,$9E,$CB,$61,$02,$A8,$CB ; CC0D 5D 04 9E CB 61 02 A8 CB  ]...a...
        .byte   $63,$02,$CC,$CC,$65,$00,$CC,$CC ; CC15 63 02 CC CC 65 00 CC CC  c...e...
        .byte   $65,$00,$CC,$CC,$65,$00,$B3,$CB ; CC1D 65 00 CC CC 65 00 B3 CB  e...e...
        .byte   $65,$03                         ; CC25 65 03                    e.
; ----------------------------------------------------------------------------
; SEDORIC token address table
TOKEN_ADDR_TABLE:
        .addr   LFE06                           ; CC27 06 FE                    ..
        .addr   LEBDD                           ; CC29 DD EB                    ..
        .addr   LEB90                           ; CC2B 90 EB                    ..
        .addr   LF0DD                           ; CC2D DD F0                    ..
        .addr   LF150                           ; CC2F 50 F1                    P.
        .addr   LFEDF                           ; CC31 DF FE                    ..
        .addr   LE772                           ; CC33 72 E7                    r.
        .addr   LF147                           ; CC35 47 F1                    G.
        .addr   LFB8C                           ; CC37 8C FB                    ..
        .addr   LF156                           ; CC39 56 F1                    V.
        .addr   LDE4C                           ; CC3B 4C DE                    L.
        .addr   LF9BB                           ; CC3D BB F9                    ..
        .addr   LE9FE                           ; CC3F FE E9                    ..
        .addr   LE775                           ; CC41 75 E7                    u.
        .addr   LF141                           ; CC43 41 F1                    A.
        .addr   LE443                           ; CC45 43 E4                    C.
        .addr   LE436                           ; CC47 36 E4                    6.
        .addr   LE445                           ; CC49 45 E4                    E.
        .addr   LE343                           ; CC4B 43 E3                    C.
        .addr   LF129                           ; CC4D 29 F1                    ).
        .addr   LF144                           ; CC4F 44 F1                    D.
        .addr   LF123                           ; CC51 23 F1                    #.
        .addr   LF126                           ; CC53 26 F1                    &.
        .addr   LF138                           ; CC55 38 F1                    8.
        .addr   LE998                           ; CC57 98 E9                    ..
        .addr   LE998                           ; CC59 98 E9                    ..
        .addr   LE9AF                           ; CC5B AF E9                    ..
        .addr   LE9AF                           ; CC5D AF E9                    ..
        .addr   LE97E                           ; CC5F 7E E9                    ~.
        .addr   LDDDF                           ; CC61 DF DD                    ..
        .addr   LE9EC                           ; CC63 EC E9                    ..
        .addr   LFBBE                           ; CC65 BE FB                    ..
        .addr   LF99B                           ; CC67 9B F9                    ..
        .addr   LEBF4                           ; CC69 F4 EB                    ..
        .addr   LF168                           ; CC6B 68 F1                    h.
        .addr   LEC2D                           ; CC6D 2D EC                    -.
        .addr   LF12C                           ; CC6F 2C F1                    ,.
        .addr   LFE11                           ; CC71 11 FE                    ..
        .addr   LDA1F                           ; CC73 1F DA                    ..
        .addr   LDA1F                           ; CC75 1F DA                    ..
        .addr   LE73F                           ; CC77 3F E7                    ?.
        .addr   LE742                           ; CC79 42 E7                    B.
        .addr   LE742                           ; CC7B 42 E7                    B.
        .addr   LDDCC                           ; CC7D CC DD                    ..
        .addr   LE70A                           ; CC7F 0A E7                    ..
        .addr   LF078                           ; CC81 78 F0                    x.
        .addr   LFC72                           ; CC83 72 FC                    r.
        .addr   LF035                           ; CC85 35 F0                    5.
        .addr   LF035                           ; CC87 35 F0                    5.
        .addr   LEC93                           ; CC89 93 EC                    ..
        .addr   LDFF6                           ; CC8B F6 DF                    ..
        .addr   LE74E                           ; CC8D 4E E7                    N.
        .addr   LFE94                           ; CC8F 94 FE                    ..
        .addr   LEBEB                           ; CC91 EB EB                    ..
        .addr   LE76F                           ; CC93 6F E7                    o.
        .addr   LF135                           ; CC95 35 F1                    5.
        .addr   LF13B                           ; CC97 3B F1                    ;.
        .addr   LE748                           ; CC99 48 E7                    H.
        .addr   LE71E                           ; CC9B 1E E7                    ..
        .addr   LE0AE                           ; CC9D AE E0                    ..
        .addr   LFA4F                           ; CC9F 4F FA                    O.
        .addr   LE778                           ; CCA1 78 E7                    x.
        .addr   LF9CA                           ; CCA3 CA F9                    ..
        .addr   LE9F5                           ; CCA5 F5 E9                    ..
        .addr   LE7BF                           ; CCA7 BF E7                    ..
        .addr   LF98F                           ; CCA9 8F F9                    ..
        .addr   LE7F4                           ; CCAB F4 E7                    ..
        .addr   LEBE0                           ; CCAD E0 EB                    ..
        .addr   LE9BA                           ; CCAF BA E9                    ..
        .addr   LFC74                           ; CCB1 74 FC                    t.
        .addr   LFABA                           ; CCB3 BA FA                    ..
        .addr   LF14D                           ; CCB5 4D F1                    M.
        .addr   LE74B                           ; CCB7 4B E7                    K.
        .addr   LE795                           ; CCB9 95 E7                    ..
        .addr   LE795                           ; CCBB 95 E7                    ..
        .addr   LE7B7                           ; CCBD B7 E7                    ..
        .addr   LEA3A                           ; CCBF 3A EA                    :.
        .addr   LF153                           ; CCC1 53 F1                    S.
        .addr   LE852                           ; CCC3 52 E8                    R.
        .addr   LE852                           ; CCC5 52 E8                    R.
        .addr   LE9FB                           ; CCC7 FB E9                    ..
        .addr   LE9F2                           ; CCC9 F2 E9                    ..
        .addr   LDD4C                           ; CCCB 4C DD                    L.
        .addr   LDD49                           ; CCCD 49 DD                    I.
        .addr   LDD52                           ; CCCF 52 DD                    R.
        .addr   LDD4F                           ; CCD1 4F DD                    O.
        .addr   LE5FB                           ; CCD3 FB E5                    ..
        .addr   LF159                           ; CCD5 59 F1                    Y.
        .addr   LF995                           ; CCD7 95 F9                    ..
        .addr   LE89C                           ; CCD9 9C E8                    ..
        .addr   LF8DE                           ; CCDB DE F8                    ..
        .addr   LFE97                           ; CCDD 97 FE                    ..
        .addr   LF12F                           ; CCDF 2F F1                    /.
        .addr   LEA7E                           ; CCE1 7E EA                    ~.
        .addr   LE8E0                           ; CCE3 E0 E8                    ..
        .addr   LEE98                           ; CCE5 98 EE                    ..
        .addr   LE9F8                           ; CCE7 F8 E9                    ..
        .addr   LE9EF                           ; CCE9 EF E9                    ..
        .addr   LF120                           ; CCEB 20 F1                     .
        .addr   LE745                           ; CCED 45 E7                    E.
        .addr   LF20F                           ; CCEF 0F F2                    ..
        .addr   LE7D8                           ; CCF1 D8 E7                    ..
        .addr   LEC03                           ; CCF3 03 EC                    ..
        .addr   LE83D                           ; CCF5 3D E8                    =.
; ----------------------------------------------------------------------------
; common names and extentions
COMMON_EXT_TABLE:
        .byte   "COM"                           ; CCF7 43 4F 4D                 COM
LCCFA:  .byte   "BAKCOM?????????BAK"            ; CCFA 42 41 4B 43 4F 4D 3F 3F  BAKCOM??
                                                ; CD02 3F 3F 3F 3F 3F 3F 3F 42  ???????B
                                                ; CD0A 41 4B                    AK
; ----------------------------------------------------------------------------
; unknown
MISC1:  .byte   $28,$50,$35,$5D                 ; CD0C 28 50 35 5D              (P5]
LCD10:  .byte   $00,$00,$01,$01,$FA,$BF,$23,$34 ; CD10 00 00 01 01 FA BF 23 34  ......#4
        .byte   $36,$37,$FF,$7B,$0E,$FA,$35,$10 ; CD18 36 37 FF 7B 0E FA 35 10  67.{..5.
        .byte   $81,$C9,$0F,$DA,$A2,$C6,$C9,$88 ; CD20 81 C9 0F DA A2 C6 C9 88  ........
        .byte   $02,$88,$02                     ; CD28 02 88 02                 ...
LCD2B:  .byte   $4F,$46,$46,$53,$45,$54,$C7,$81 ; CD2B 4F 46 46 53 45 54 C7 81  OFFSET..
        .byte   $C2,$82,$45,$D3,$66,$A5,$C8,$A3 ; CD33 C2 82 45 D3 66 A5 C8 A3  ..E.f...
        .byte   $8F,$D2,$42,$B5,$98,$E0         ; CD3B 8F D2 42 B5 98 E0        ..B...
; QWERTY/AZERTY convertion
QWAZERTY_CONV:
        .byte   $B1,$BE,$AE,$AA,$82,$93         ; CD41 B1 BE AE AA 82 93        ......
LCD47:  .byte   $AE,$AA,$B1,$BE,$93,$82         ; CD47 AE AA B1 BE 93 82        ......
; Accented characters
ACCENTED_FONT:
        .byte   $40,$10,$08,$1C,$02,$1E,$22,$1E ; CD4D 40 10 08 1C 02 1E 22 1E  @.....".
        .byte   $00,$5C,$00,$00,$1E,$20,$20,$20 ; CD55 00 5C 00 00 1E 20 20 20  .\...   
        .byte   $1E,$04,$7B,$04,$08,$1C,$22,$3E ; CD5D 1E 04 7B 04 08 1C 22 3E  ..{...">
        .byte   $20,$1E,$00,$7C,$10,$08,$22,$22 ; CD65 20 1E 00 7C 10 08 22 22   ..|..""
        .byte   $22,$26,$1A,$00,$7D,$10,$08,$1C ; CD6D 22 26 1A 00 7D 10 08 1C  "&..}...
        .byte   $22,$3E,$20,$1E,$00,$7E,$1C,$22 ; CD75 22 3E 20 1E 00 7E 1C 22  "> ..~."
        .byte   $1C,$22,$3E,$20,$1E,$00         ; CD7D 1C 22 3E 20 1E 00        ."> ..
; unknown
MISC2:  .byte   $41,$58,$59,$50,$B8             ; CD83 41 58 59 50 B8           AXYP.
LCD88:  .byte   $0A,$64,$E8,$10                 ; CD88 0A 64 E8 10              .d..
LCD8C:  .byte   $00,$00,$03,$27                 ; CD8C 00 00 03 27              ...'
LCD90:  .byte   $84,$A4,$C4,$E4                 ; CD90 84 A4 C4 E4              ....
; ----------------------------------------------------------------------------
; System variable names
SYS_VAR_NAMES:
        .byte   "E"                             ; CD94 45                       E
LCD95:  .byte   "NELINOMSKFTEORARXRYRPEFSTEDEXCX"; CD95 4E 45 4C 49 4E 4F 4D 53 NELINOMS
                                                ; CD9D 4B 46 54 45 4F 52 41 52  KFTEORAR
                                                ; CDA5 58 52 59 52 50 45 46 53  XRYRPEFS
                                                ; CDAD 54 45 44 45 58 43 58     TEDEXCX
        .byte   "CYFPFS"                        ; CDB4 43 59 46 50 46 53        CYFPFS
LCDBA:  .byte   "SCJKE"                         ; CDBA 53 43 4A 4B 45           SCJKE
; Error message strings
ERROR_MESSAGES:
        .byte   "FILE NOT FOUN"                 ; CDBF 46 49 4C 45 20 4E 4F 54  FILE NOT
                                                ; CDC7 20 46 4F 55 4E            FOUN
        .byte   $C4                             ; CDCC C4                       .
        .byte   "DRIVE NOT IN LIN"              ; CDCD 44 52 49 56 45 20 4E 4F  DRIVE NO
                                                ; CDD5 54 20 49 4E 20 4C 49 4E  T IN LIN
        .byte   $C5                             ; CDDD C5                       .
        .byte   "INVALID FILE NAM"              ; CDDE 49 4E 56 41 4C 49 44 20  INVALID 
                                                ; CDE6 46 49 4C 45 20 4E 41 4D  FILE NAM
        .byte   $C5                             ; CDEE C5                       .
        .byte   "DISK I/"                       ; CDEF 44 49 53 4B 20 49 2F     DISK I/
        .byte   $CF                             ; CDF6 CF                       .
        .byte   "WRITE PROTECTE"                ; CDF7 57 52 49 54 45 20 50 52  WRITE PR
                                                ; CDFF 4F 54 45 43 54 45        OTECTE
        .byte   $C4                             ; CE05 C4                       .
        .byte   "WILDCARD(S) NOT ALLOWE"        ; CE06 57 49 4C 44 43 41 52 44  WILDCARD
                                                ; CE0E 28 53 29 20 4E 4F 54 20  (S) NOT 
                                                ; CE16 41 4C 4C 4F 57 45        ALLOWE
        .byte   $C4                             ; CE1C C4                       .
        .byte   "FILE ALREADY EXIST"            ; CE1D 46 49 4C 45 20 41 4C 52  FILE ALR
                                                ; CE25 45 41 44 59 20 45 58 49  EADY EXI
                                                ; CE2D 53 54                    ST
        .byte   $D3                             ; CE2F D3                       .
        .byte   "DISK FUL"                      ; CE30 44 49 53 4B 20 46 55 4C  DISK FUL
        .byte   $CC                             ; CE38 CC                       .
        .byte   "ILLEGAL QUANTIT"               ; CE39 49 4C 4C 45 47 41 4C 20  ILLEGAL 
                                                ; CE41 51 55 41 4E 54 49 54     QUANTIT
        .byte   $D9                             ; CE48 D9                       .
        .byte   "SYNTA"                         ; CE49 53 59 4E 54 41           SYNTA
        .byte   $D8                             ; CE4E D8                       .
        .byte   "UNKNOWN FORMA"                 ; CE4F 55 4E 4B 4E 4F 57 4E 20  UNKNOWN 
                                                ; CE57 46 4F 52 4D 41           FORMA
        .byte   $D4,$D4                         ; CE5C D4 D4                    ..
        .byte   "TYPE MISMATC"                  ; CE5E 54 59 50 45 20 4D 49 53  TYPE MIS
                                                ; CE66 4D 41 54 43              MATC
        .byte   $C8                             ; CE6A C8                       .
        .byte   "FILE TYPE MISMATC"             ; CE6B 46 49 4C 45 20 54 59 50  FILE TYP
                                                ; CE73 45 20 4D 49 53 4D 41 54  E MISMAT
                                                ; CE7B 43                       C
        .byte   $C8                             ; CE7C C8                       .
        .byte   "FILE NOT OPE"                  ; CE7D 46 49 4C 45 20 4E 4F 54  FILE NOT
                                                ; CE85 20 4F 50 45               OPE
        .byte   $CE                             ; CE89 CE                       .
        .byte   "FILE ALREADY OPE"              ; CE8A 46 49 4C 45 20 41 4C 52  FILE ALR
                                                ; CE92 45 41 44 59 20 4F 50 45  EADY OPE
        .byte   $CE                             ; CE9A CE                       .
        .byte   "END OF FIL"                    ; CE9B 45 4E 44 20 4F 46 20 46  END OF F
                                                ; CEA3 49 4C                    IL
        .byte   $C5                             ; CEA5 C5                       .
        .byte   "BAD RECORD NUMBE"              ; CEA6 42 41 44 20 52 45 43 4F  BAD RECO
                                                ; CEAE 52 44 20 4E 55 4D 42 45  RD NUMBE
        .byte   $D2                             ; CEB6 D2                       .
        .byte   "FIELD OVERFLO"                 ; CEB7 46 49 45 4C 44 20 4F 56  FIELD OV
                                                ; CEBF 45 52 46 4C 4F           ERFLO
        .byte   $D7                             ; CEC4 D7                       .
        .byte   "STRING TOO LON"                ; CEC5 53 54 52 49 4E 47 20 54  STRING T
                                                ; CECD 4F 4F 20 4C 4F 4E        OO LON
        .byte   $C7                             ; CED3 C7                       .
        .byte   "UNKNOWN FIELD NAM"             ; CED4 55 4E 4B 4E 4F 57 4E 20  UNKNOWN 
                                                ; CEDC 46 49 45 4C 44 20 4E 41  FIELD NA
                                                ; CEE4 4D                       M
        .byte   $C5,$C5                         ; CEE5 C5 C5                    ..
; Message strings
MESSAGES:
        .byte   $0A,$0D                         ; CEE7 0A 0D                    ..
        .byte   "TRACK"                         ; CEE9 54 52 41 43 4B           TRACK
        .byte   $BA                             ; CEEE BA                       .
        .byte   " SECTOR"                       ; CEEF 20 53 45 43 54 4F 52      SECTOR
        .byte   $BA                             ; CEF6 BA                       .
        .byte   " WRITE FAULT"                  ; CEF7 20 57 52 49 54 45 20 46   WRITE F
                                                ; CEFF 41 55 4C 54              AULT
        .byte   $A0                             ; CF03 A0                       .
        .byte   " READ FAULT"                   ; CF04 20 52 45 41 44 20 46 41   READ FA
                                                ; CF0C 55 4C 54                 ULT
        .byte   $A0,$0A,$0D                     ; CF0F A0 0A 0D                 ...
        .byte   " BREAK ON BYTE "               ; CF12 20 42 52 45 41 4B 20 4F   BREAK O
                                                ; CF1A 4E 20 42 59 54 45 20     N BYTE 
        .byte   $A3,$0D,$0A                     ; CF21 A3 0D 0A                 ...
        .byte   "Drive"                         ; CF24 44 72 69 76 65           Drive
        .byte   $A0                             ; CF29 A0                       .
        .byte   " V4 (Mst)"                     ; CF2A 20 56 34 20 28 4D 73 74   V4 (Mst
                                                ; CF32 29                       )
        .byte   $A0                             ; CF33 A0                       .
        .byte   " free sectors "                ; CF34 20 66 72 65 65 20 73 65   free se
                                                ; CF3C 63 74 6F 72 73 20        ctors 
        .byte   $A8                             ; CF42 A8                       .
        .byte   " Files"                        ; CF43 20 46 69 6C 65 73         Files
        .byte   $A0                             ; CF49 A0                       .
        .byte   " IS PROTECTE"                  ; CF4A 20 49 53 20 50 52 4F 54   IS PROT
                                                ; CF52 45 43 54 45              ECTE
        .byte   $C4                             ; CF56 C4                       .
        .byte   " (Y)es or (N)o"                ; CF57 20 28 59 29 65 73 20 6F   (Y)es o
                                                ; CF5F 72 20 28 4E 29 6F        r (N)o
        .byte   $BA                             ; CF65 BA                       .
        .byte   " DELETED"                      ; CF66 20 44 45 4C 45 54 45 44   DELETED
        .byte   $0D,$8A                         ; CF6E 0D 8A                    ..
        .byte   "INSERT MASTER"                 ; CF70 49 4E 53 45 52 54 20 4D  INSERT M
                                                ; CF78 41 53 54 45 52           ASTER
        .byte   $A0                             ; CF7D A0                       .
        .byte   "AND PRE"                       ; CF7E 41 4E 44 20 50 52 45     AND PRE
LCF85:  .byte   "SS 'RETURN"                    ; CF85 53 53 20 27 52 45 54 55  SS 'RETU
                                                ; CF8D 52 4E                    RN
        .byte   $A7                             ; CF8F A7                       .
        .byte   " ALREADY EXISTS"               ; CF90 20 41 4C 52 45 41 44 59   ALREADY
                                                ; CF98 20 45 58 49 53 54 53      EXISTS
        .byte   $0A,$8D                         ; CF9F 0A 8D                    ..
        .byte   " -->"                          ; CFA1 20 2D 2D 3E               -->
        .byte   $A0                             ; CFA5 A0                       .
        .byte   "USER"                          ; CFA6 55 53 45 52              USER
        .byte   $A0                             ; CFAA A0                       .
        .byte   " V4 (Slv)"                     ; CFAB 20 56 34 20 28 53 6C 76   V4 (Slv
                                                ; CFB3 29                       )
        .byte   $A0                             ; CFB4 A0                       .
        .byte   " (Type"                        ; CFB5 20 28 54 79 70 65         (Type
        .byte   $BD                             ; CFBB BD                       .
        .byte   ")"                             ; CFBC 29                       )
        .byte   $A0                             ; CFBD A0                       .
        .byte   " DISC IN DRIVE"                ; CFBE 20 44 49 53 43 20 49 4E   DISC IN
                                                ; CFC6 20 44 52 49 56 45         DRIVE
        .byte   $A0                             ; CFCC A0                       .
; ----------------------------------------------------------------------------
XRWTS:  php                                     ; CFCD 08                       .
        lda     V1ER                            ; CFCE AD 0E 03                 ...
        pha                                     ; CFD1 48                       H
        tya                                     ; CFD2 98                       .
        pha                                     ; CFD3 48                       H
        lda     #$40                            ; CFD4 A9 40                    .@
        sta     V1ER                            ; CFD6 8D 0E 03                 ...
        jsr     XRWTS_INTERNAL                  ; CFD9 20 E9 CF                  ..
        pla                                     ; CFDC 68                       h
        tay                                     ; CFDD A8                       .
        pla                                     ; CFDE 68                       h
        sta     V1ER                            ; CFDF 8D 0E 03                 ...
        plp                                     ; CFE2 28                       (
        lda     #$FF                            ; CFE3 A9 FF                    ..
        bit     $C017                           ; CFE5 2C 17 C0                 ,..
        rts                                     ; CFE8 60                       `

; ----------------------------------------------------------------------------
XRWTS_INTERNAL:
        ldy     #$02                            ; CFE9 A0 02                    ..
        sty     $C006                           ; CFEB 8C 06 C0                 ...
        ldy     #$08                            ; CFEE A0 08                    ..
        sty     SEDORIC_number_of_retry         ; CFF0 8C 07 C0                 ...
XRWTS_ONCE:
        pha                                     ; CFF3 48                       H
        stx     SEDORIC_type_of_error           ; CFF4 8E 05 C0                 ...
LCFF7:  ldy     SEDORIC_DRIVE                   ; CFF7 AC 00 C0                 ...
        lda     LCD90,y                         ; CFFA B9 90 CD                 ...
        bit     SEDORIC_TRACK                   ; CFFD 2C 01 C0                 ,..
        bpl     LD004                           ; D000 10 02                    ..
        ora     #$10                            ; D002 09 10                    ..
LD004:  sta     MICRODISC_CONTROL_SHADOW        ; D004 8D FB 04                 ...
        cpy     SEDORIC_ACTIVATE_DRIVE_AND_TRACK; D007 CC 0B C0                 ...
        beq     LD016                           ; D00A F0 0A                    ..
        sty     SEDORIC_ACTIVATE_DRIVE_AND_TRACK; D00C 8C 0B C0                 ...
        jsr     SEDORIC_TEST_TRACK_UNDER_HEAD   ; D00F 20 EA D0                  ..
        bcc     LD016                           ; D012 90 02                    ..
        pla                                     ; D014 68                       h
        rts                                     ; D015 60                       `

; ----------------------------------------------------------------------------
LD016:  lda     SEDORIC_RWBUF                   ; D016 AD 03 C0                 ...
        ldy     $C004                           ; D019 AC 04 C0                 ...
        sta     $F3                             ; D01C 85 F3                    ..
        sty     $F4                             ; D01E 84 F4                    ..
        sei                                     ; D020 78                       x
        lda     #$20                            ; D021 A9 20                    . 
        bit     SEDORIC_type_of_error           ; D023 2C 05 C0                 ,..
        bpl     LD051                           ; D026 10 29                    .)
        bvc     LD02C                           ; D028 50 02                    P.
        beq     LD051                           ; D02A F0 25                    .%
LD02C:  lda     SEDORIC_TRACK                   ; D02C AD 01 C0                 ...
        cmp     SEDORIC_ACTIVATE_DRIVE_AND_TRACK+1; D02F CD 0C C0               ...
        beq     LD03A                           ; D032 F0 06                    ..
        pha                                     ; D034 48                       H
        txa                                     ; D035 8A                       .
        ora     #$04                            ; D036 09 04                    ..
        tax                                     ; D038 AA                       .
        pla                                     ; D039 68                       h
LD03A:  and     #$7F                            ; D03A 29 7F                    ).
        cmp     MICRODISC_FDC_TRACK             ; D03C CD 11 03                 ...
        beq     LD051                           ; D03F F0 10                    ..
        txa                                     ; D041 8A                       .
        ldx     #$18                            ; D042 A2 18                    ..
        jsr     XRWTS_ONCE                      ; D044 20 F3 CF                  ..
        sta     SEDORIC_type_of_error           ; D047 8D 05 C0                 ...
        tax                                     ; D04A AA                       .
        lda     MICRODISC_FDC_DATA              ; D04B AD 13 03                 ...
        sta     MICRODISC_FDC_TRACK             ; D04E 8D 11 03                 ...
LD051:  lda     SEDORIC_TRACK                   ; D051 AD 01 C0                 ...
        sta     SEDORIC_ACTIVATE_DRIVE_AND_TRACK+1; D054 8D 0C C0               ...
        and     #$7F                            ; D057 29 7F                    ).
        sta     MICRODISC_FDC_DATA              ; D059 8D 13 03                 ...
        lda     SEDORIC_SECTOR                  ; D05C AD 02 C0                 ...
        sta     MICRODISC_FDC_SECTOR            ; D05F 8D 12 03                 ...
        ldy     #$00                            ; D062 A0 00                    ..
        txa                                     ; D064 8A                       .
        bmi     LD06A                           ; D065 30 03                    0.
LD067:  dey                                     ; D067 88                       .
        bne     LD067                           ; D068 D0 FD                    ..
LD06A:  lda     MICRODISC_CONTROL_SHADOW        ; D06A AD FB 04                 ...
        ora     #$01                            ; D06D 09 01                    ..
        sta     MICRODISC_CONTROL               ; D06F 8D 14 03                 ...
        stx     MICRODISC_FDC_COMMAND           ; D072 8E 10 03                 ...
        txa                                     ; D075 8A                       .
        and     #$F0                            ; D076 29 F0                    ).
        cmp     #$E0                            ; D078 C9 E0                    ..
        cli                                     ; D07A 58                       X
        beq     read_data                       ; D07B F0 04                    ..
        and     #$20                            ; D07D 29 20                    ) 
        bne     write_data                      ; D07F D0 12                    ..
read_data:
        lda     MICRODISC_DRQ                   ; D081 AD 18 03                 ...
        bmi     read_data                       ; D084 30 FB                    0.
        lda     MICRODISC_FDC_DATA              ; D086 AD 13 03                 ...
        sta     ($F3),y                         ; D089 91 F3                    ..
        iny                                     ; D08B C8                       .
        bne     read_data                       ; D08C D0 F3                    ..
        inc     $F4                             ; D08E E6 F4                    ..
        jmp     read_data                       ; D090 4C 81 D0                 L..

; ----------------------------------------------------------------------------
write_data:
        lda     MICRODISC_DRQ                   ; D093 AD 18 03                 ...
        bmi     write_data                      ; D096 30 FB                    0.
        lda     ($F3),y                         ; D098 B1 F3                    ..
        sta     MICRODISC_FDC_DATA              ; D09A 8D 13 03                 ...
        iny                                     ; D09D C8                       .
        bne     write_data                      ; D09E D0 F3                    ..
        inc     $F4                             ; D0A0 E6 F4                    ..
        jmp     write_data                      ; D0A2 4C 93 D0                 L..

; ----------------------------------------------------------------------------
        bit     MICRODISC_CONTROL               ; D0A5 2C 14 03                 ,..
        bpl     LD0AD                           ; D0A8 10 03                    ..
        jmp     IRQRAM                          ; D0AA 4C F5 04                 L..

; ----------------------------------------------------------------------------
LD0AD:  pla                                     ; D0AD 68                       h
        pla                                     ; D0AE 68                       h
        pla                                     ; D0AF 68                       h
        lda     MICRODISC_CONTROL_SHADOW        ; D0B0 AD FB 04                 ...
        sta     MICRODISC_CONTROL               ; D0B3 8D 14 03                 ...
        clc                                     ; D0B6 18                       .
        lda     MICRODISC_FDC_COMMAND           ; D0B7 AD 10 03                 ...
        and     #$5C                            ; D0BA 29 5C                    )\
        tay                                     ; D0BC A8                       .
        ldx     SEDORIC_type_of_error           ; D0BD AE 05 C0                 ...
        bmi     LD0C4                           ; D0C0 30 02                    0.
        ldy     #$00                            ; D0C2 A0 00                    ..
LD0C4:  sty     $C017                           ; D0C4 8C 17 C0                 ...
        and     #$40                            ; D0C7 29 40                    )@
        .byte   $D0                             ; D0C9 D0                       .
LD0CA:  .byte   $0F                             ; D0CA 0F                       .
        tya                                     ; D0CB 98                       .
        and     #$10                            ; D0CC 29 10                    ).
        beq     LD0DD                           ; D0CE F0 0D                    ..
        dec     $C006                           ; D0D0 CE 06 C0                 ...
        beq     LD0DA                           ; D0D3 F0 05                    ..
        jsr     SEDORIC_TEST_TRACK_UNDER_HEAD   ; D0D5 20 EA D0                  ..
        bcc     LD0E7                           ; D0D8 90 0D                    ..
LD0DA:  sec                                     ; D0DA 38                       8
LD0DB:  pla                                     ; D0DB 68                       h
        rts                                     ; D0DC 60                       `

; ----------------------------------------------------------------------------
LD0DD:  tya                                     ; D0DD 98                       .
        and     #$0C                            ; D0DE 29 0C                    ).
        beq     LD0DB                           ; D0E0 F0 F9                    ..
        dec     SEDORIC_number_of_retry         ; D0E2 CE 07 C0                 ...
        beq     LD0DA                           ; D0E5 F0 F3                    ..
LD0E7:  jmp     LCFF7                           ; D0E7 4C F7 CF                 L..

; ----------------------------------------------------------------------------
; Test de la piste sous la tête
SEDORIC_TEST_TRACK_UNDER_HEAD:
        txa                                     ; D0EA 8A                       .
        pha                                     ; D0EB 48                       H
        lda     SEDORIC_RWBUF                   ; D0EC AD 03 C0                 ...
        pha                                     ; D0EF 48                       H
        lda     $C004                           ; D0F0 AD 04 C0                 ...
        pha                                     ; D0F3 48                       H
        lda     #$60                            ; D0F4 A9 60                    .`
        ldy     #$C0                            ; D0F6 A0 C0                    ..
        sta     SEDORIC_RWBUF                   ; D0F8 8D 03 C0                 ...
        sty     $C004                           ; D0FB 8C 04 C0                 ...
        lda     $2006                           ; D0FE AD 06 20                 .. 
        .byte   $3B                             ; D101 3B                       ;
        dec     $C0A9,x                         ; D102 DE A9 C0                 ...
        sta     $C04D                           ; D105 8D 4D C0                 .M.
        jsr     LD79E                           ; D108 20 9E D7                  ..
        sec                                     ; D10B 38                       8
        lda     $C054                           ; D10C AD 54 C0                 .T.
        sbc     $C052                           ; D10F ED 52 C0                 .R.
        sta     $C04F                           ; D112 8D 4F C0                 .O.
        lda     $C055                           ; D115 AD 55 C0                 .U.
        sbc     $C053                           ; D118 ED 53 C0                 .S.
        sta     $C050                           ; D11B 8D 50 C0                 .P.
        bcs     LD19C                           ; D11E B0 7C                    .|
        ldx     #$08                            ; D120 A2 08                    ..
        bit     $09A2                           ; D122 2C A2 09                 ,..
        jmp     LD67E                           ; D125 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        sta     $C04D                           ; D128 8D 4D C0                 .M.
        lda     $9A                             ; D12B A5 9A                    ..
        ldy     $9B                             ; D12D A4 9B                    ..
        sta     $C052                           ; D12F 8D 52 C0                 .R.
        sty     $C053                           ; D132 8C 53 C0                 .S.
        lda     $9C                             ; D135 A5 9C                    ..
        ldy     $9D                             ; D137 A4 9D                    ..
        ldx     #$80                            ; D139 A2 80                    ..
        sta     $C054                           ; D13B 8D 54 C0                 .T.
        sty     $C055                           ; D13E 8C 55 C0                 .U.
        stx     $C051                           ; D141 8E 51 C0                 .Q.
        lda     #$00                            ; D144 A9 00                    ..
        sta     $C056                           ; D146 8D 56 C0                 .V.
        sta     $C057                           ; D149 8D 57 C0                 .W.
LD14C:  rts                                     ; D14C 60                       `

; ----------------------------------------------------------------------------
        jsr     LD44F                           ; D14D 20 4F D4                  O.
        jsr     LDFDE                           ; D150 20 DE DF                  ..
LD153:  jsr     SEDORIC_KEYBOARD_WAIT           ; D153 20 02 D3                  ..
        bpl     LD153                           ; D156 10 FB                    ..
        cmp     #$03                            ; D158 C9 03                    ..
        beq     LD14C                           ; D15A F0 F0                    ..
        cmp     #$13                            ; D15C C9 13                    ..
        bne     LD17C                           ; D15E D0 1C                    ..
        jsr     XCUROFF                         ; D160 20 40 D7                  @.
        lda     #$D0                            ; D163 A9 D0                    ..
        ldy     #$BB                            ; D165 A0 BB                    ..
        sta     $C052                           ; D167 8D 52 C0                 .R.
        sty     $C053                           ; D16A 8C 53 C0                 .S.
        lda     #$B7                            ; D16D A9 B7                    ..
LD16F:  ldy     #$BF                            ; D16F A0 BF                    ..
        ldx     #$60                            ; D171 A2 60                    .`
        jsr     LDE00                           ; D173 20 00 DE                  ..
        .byte   $20                             ; D176 20                        
        .byte   $3E                             ; D177 3E                       >
LD178:  .byte   $D7                             ; D178 D7                       .
        jmp     LDE53                           ; D179 4C 53 DE                 LS.

; ----------------------------------------------------------------------------
LD17C:  cmp     #$17                            ; D17C C9 17                    ..
        bne     LD18E                           ; D17E D0 0E                    ..
LD180:  ldy     BASIC11_Y_TEXT                  ; D180 AC 69 02                 .i.
        lda     #$7F                            ; D183 A9 7F                    ..
        nop                                     ; D185 EA                       .
        nop                                     ; D186 EA                       .
        nop                                     ; D187 EA                       .
LD188:  sta     ($12),y                         ; D188 91 12                    ..
        lda     #$09                            ; D18A A9 09                    ..
        bne     LD197                           ; D18C D0 09                    ..
LD18E:  cmp     #$0D                            ; D18E C9 0D                    ..
        bne     LD197                           ; D190 D0 05                    ..
        .byte   $20                             ; D192 20                        
        rol     a                               ; D193 2A                       *
LD194:  dec     $A9,x                           ; D194 D6 A9                    ..
        asl     a                               ; D196 0A                       .
LD197:  jsr     XAFCAR                          ; D197 20 2A D6                  *.
        bne     LD153                           ; D19A D0 B7                    ..
LD19C:  sei                                     ; D19C 78                       x
        jsr     LDB2D                           ; D19D 20 2D DB                  -.
        beq     LD211                           ; D1A0 F0 6F                    .o
        lda     $C04D                           ; D1A2 AD 4D C0                 .M.
        beq     LD1BD                           ; D1A5 F0 16                    ..
        cmp     #$80                            ; D1A7 C9 80                    ..
        beq     LD1B8                           ; D1A9 F0 0D                    ..
        .byte   $C9                             ; D1AB C9                       .
LD1AC:  cpy     #$F0                            ; D1AC C0 F0                    ..
        asl     $20,x                           ; D1AE 16 20                    . 
        .byte   $07                             ; D1B0 07                       .
        .byte   $DB                             ; D1B1 DB                       .
        jmp     LDF1B                           ; D1B2 4C 1B DF                 L..

; ----------------------------------------------------------------------------
LD1B5:  ldx     #$02                            ; D1B5 A2 02                    ..
        .byte   $2C                             ; D1B7 2C                       ,
LD1B8:  ldx     #$06                            ; D1B8 A2 06                    ..
        .byte   $4C                             ; D1BA 4C                       L
        .byte   $7E                             ; D1BB 7E                       ~
LD1BC:  .byte   $D6                             ; D1BC D6                       .
LD1BD:  jsr     LE264                           ; D1BD 20 64 E2                  d.
        bcs     LD1EF                           ; D1C0 B0 2D                    .-
        .byte   $4C                             ; D1C2 4C                       L
        .byte   $11                             ; D1C3 11                       .
LD1C4:  .byte   $DF                             ; D1C4 DF                       .
LD1C5:  ldy     #$02                            ; D1C5 A0 02                    ..
LD1C7:  lda     $C032,y                         ; D1C7 B9 32 C0                 .2.
        pha                                     ; D1CA 48                       H
        dey                                     ; D1CB 88                       .
LD1CC:  bpl     LD1C7                           ; D1CC 10 F9                    ..
        ldy     #$02                            ; D1CE A0 02                    ..
LD1D0:  lda     $C032,y                         ; D1D0 B9 32 C0                 .2.
        cmp     LCCFA,y                         ; D1D3 D9 FA CC                 ...
        bne     LD1DD                           ; D1D6 D0 05                    ..
        dey                                     ; D1D8 88                       .
        bpl     LD1D0                           ; D1D9 10 F5                    ..
        .byte   $30                             ; D1DB 30                       0
LD1DC:  cld                                     ; D1DC D8                       .
LD1DD:  ldx     #$03                            ; D1DD A2 03                    ..
        jsr     LD34A                           ; D1DF 20 4A D3                  J.
        .byte   $20                             ; D1E2 20                        
LD1E3:  bmi     $D1C0                           ; D1E3 30 DB                    0.
        beq     LD1F1                           ; D1E5 F0 0A                    ..
        jsr     LE264                           ; D1E7 20 64 E2                  d.
        .byte   $90                             ; D1EA 90                       .
LD1EB:  ora     $68                             ; D1EB 05 68                    .h
        pla                                     ; D1ED 68                       h
        pla                                     ; D1EE 68                       h
LD1EF:  cli                                     ; D1EF 58                       X
        rts                                     ; D1F0 60                       `

; ----------------------------------------------------------------------------
LD1F1:  ldy     #$00                            ; D1F1 A0 00                    ..
LD1F3:  pla                                     ; D1F3 68                       h
        sta     $C032,y                         ; D1F4 99 32 C0                 .2.
        iny                                     ; D1F7 C8                       .
        cpy     #$03                            ; D1F8 C0 03                    ..
        bne     LD1F3                           ; D1FA D0 F7                    ..
        jsr     XTVNM                           ; D1FC 20 30 DB                  0.
        ldx     $C027                           ; D1FF AE 27 C0                 .'.
LD202:  lda     LCCFA,y                         ; D202 B9 FA CC                 ...
        .byte   $9D                             ; D205 9D                       .
LD206:  ora     #$C3                            ; D206 09 C3                    ..
        inx                                     ; D208 E8                       .
        iny                                     ; D209 C8                       .
        cpy     #$03                            ; D20A C0 03                    ..
        bne     LD202                           ; D20C D0 F4                    ..
LD20E:  jsr     XSCAT                           ; D20E 20 82 DA                  ..
LD211:  ldx     #$03                            ; D211 A2 03                    ..
        lda     #$00                            ; D213 A9 00                    ..
LD215:  .byte   $9D                             ; D215 9D                       .
LD216:  and     $C0,x                           ; D216 35 C0                    5.
        dex                                     ; D218 CA                       .
LD219:  bpl     LD215                           ; D219 10 FA                    ..
LD21B:  ldx     $C050                           ; D21B AE 50 C0                 .P.
        ldy     #$00                            ; D21E A0 00                    ..
        inx                                     ; D220 E8                       .
        txa                                     ; D221 8A                       .
        bne     LD225                           ; D222 D0 01                    ..
LD224:  iny                                     ; D224 C8                       .
LD225:  jsr     XWDESC                          ; D225 20 C0 DB                  ..
        lda     $C052                           ; D228 AD 52 C0                 .R.
        .byte   $AC                             ; D22B AC                       .
LD22C:  .byte   $53                             ; D22C 53                       S
        .byte   $C0                             ; D22D C0                       .
LD22E:  dey                                     ; D22E 88                       .
        sta     SEDORIC_RWBUF                   ; D22F 8D 03 C0                 ...
        sty     $C004                           ; D232 8C 04 C0                 ...
        ldy     #$0A                            ; D235 A0 0A                    ..
LD237:  .byte   $EE                             ; D237 EE                       .
LD238:  .byte   $04                             ; D238 04                       .
        cpy     #$AD                            ; D239 C0 AD                    ..
        bvc     $D1FD                           ; D23B 50 C0                    P.
        beq     LD256                           ; D23D F0 17                    ..
        dec     $C050                           ; D23F CE 50 C0                 .P.
        .byte   $20                             ; D242 20                        
        plp                                     ; D243 28                       (
LD244:  .byte   $E2                             ; D244 E2                       .
        lda     SEDORIC_BUF1,y                  ; D245 B9 00 C1                 ...
        sta     SEDORIC_TRACK                   ; D248 8D 01 C0                 ...
        .byte   $B9                             ; D24B B9                       .
LD24C:  ora     ($C1,x)                         ; D24C 01 C1                    ..
        sta     SEDORIC_SECTOR                  ; D24E 8D 02 C0                 ...
        jsr     XSVSEC                          ; D251 20 A4 DA                  ..
LD254:  beq     LD237                           ; D254 F0 E1                    ..
LD256:  jsr     LE228                           ; D256 20 28 E2                  (.
        lda     SEDORIC_BUF1,y                  ; D259 B9 00 C1                 ...
LD25C:  pha                                     ; D25C 48                       H
        lda     SEDORIC_BUF1+1,y                ; D25D B9 01 C1                 ...
        pha                                     ; D260 48                       H
        jsr     LDACE                           ; D261 20 CE DA                  ..
LD264:  lda     SEDORIC_RWBUF                   ; D264 AD 03 C0                 ...
        ldy     $C004                           ; D267 AC 04 C0                 ...
        sta     $F2                             ; D26A 85 F2                    ..
        sty     $F3                             ; D26C 84 F3                    ..
        ldy     #$FF                            ; D26E A0 FF                    ..
LD270:  iny                                     ; D270 C8                       .
        lda     ($F2),y                         ; D271 B1 F2                    ..
        .byte   $99                             ; D273 99                       .
LD274:  brk                                     ; D274 00                       .
        cmp     ($CC,x)                         ; D275 C1 CC                    ..
LD277:  .byte   $4F                             ; D277 4F                       O
        cpy     #$D0                            ; D278 C0 D0                    ..
        sbc     $68,x                           ; D27A F5 68                    .h
        tay                                     ; D27C A8                       .
        pla                                     ; D27D 68                       h
        .byte   $20                             ; D27E 20                        
LD27F:  sta     ($DA),y                         ; D27F 91 DA                    ..
        clc                                     ; D281 18                       .
LD282:  lda     $C05A                           ; D282 AD 5A C0                 .Z.
        adc     $C05E                           ; D285 6D 5E C0                 m^.
        bcc     LD28D                           ; D288 90 03                    ..
LD28A:  inc     $C05B                           ; D28A EE 5B C0                 .[.
LD28D:  adc     $C037                           ; D28D 6D 37 C0                 m7.
        .byte   $8D                             ; D290 8D                       .
        .byte   $37                             ; D291 37                       7
LD292:  cpy     #$AD                            ; D292 C0 AD                    ..
        sec                                     ; D294 38                       8
        cpy     #$29                            ; D295 C0 29                    .)
        .byte   $0F                             ; D297 0F                       .
        adc     $C05B                           ; D298 6D 5B C0                 m[.
        ora     #$40                            ; D29B 09 40                    .@
        sta     $C038                           ; D29D 8D 38 C0                 .8.
        .byte   $AD                             ; D2A0 AD                       .
        .byte   $35                             ; D2A1 35                       5
LD2A2:  cpy     #$AC                            ; D2A2 C0 AC                    ..
        rol     $C0,x                           ; D2A4 36 C0                    6.
        beq     LD2C5                           ; D2A6 F0 1D                    ..
LD2A8:  .byte   $20                             ; D2A8 20                        
        .byte   $5D                             ; D2A9 5D                       ]
LD2AA:  .byte   $DA                             ; D2AA DA                       .
        lda     SEDORIC_BUF1                    ; D2AB AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; D2AE AC 01 C1                 ...
        bne     LD2A8                           ; D2B1 D0 F5                    ..
        lda     $C05C                           ; D2B3 AD 5C C0                 .\.
        ldy     $C05D                           ; D2B6 AC 5D C0                 .].
        .byte   $8D                             ; D2B9 8D                       .
LD2BA:  brk                                     ; D2BA 00                       .
        cmp     ($8C,x)                         ; D2BB C1 8C                    ..
        ora     ($C1,x)                         ; D2BD 01 C1                    ..
        jsr     XSVSEC                          ; D2BF 20 A4 DA                  ..
LD2C2:  jmp     LDFD4                           ; D2C2 4C D4 DF                 L..

; ----------------------------------------------------------------------------
LD2C5:  lda     $C05C                           ; D2C5 AD 5C C0                 .\.
        .byte   $AC                             ; D2C8 AC                       .
        .byte   $5D                             ; D2C9 5D                       ]
LD2CA:  cpy     #$8D                            ; D2CA C0 8D                    ..
        and     $C0,x                           ; D2CC 35 C0                    5.
        sty     $C036                           ; D2CE 8C 36 C0                 .6.
        .byte   $20                             ; D2D1 20                        
LD2D2:  .byte   $59                             ; D2D2 59                       Y
        .byte   $DB                             ; D2D3 DB                       .
LD2D4:  jsr     XSMAP                           ; D2D4 20 8A DA                  ..
        jsr     LDAEE                           ; D2D7 20 EE DA                  ..
LD2DA:  cli                                     ; D2DA 58                       X
        jmp     XSCAT                           ; D2DB 4C 82 DA                 L..

; ----------------------------------------------------------------------------
        lda     $021F                           ; D2DE AD 1F 02                 ...
        .byte   $F0                             ; D2E1 F0                       .
LD2E2:  bpl     $D330                           ; D2E2 10 4C                    .L
        .byte   $6F                             ; D2E4 6F                       o
        cmp     ($A9),y                         ; D2E5 D1 A9                    ..
        brk                                     ; D2E7 00                       .
        ldx     #$03                            ; D2E8 A2 03                    ..
LD2EA:  sta     $C04D,x                         ; D2EA 9D 4D C0                 .M.
        dex                                     ; D2ED CA                       .
        bpl     LD2EA                           ; D2EE 10 FA                    ..
        stx     $C072                           ; D2F0 8E 72 C0                 .r.
LD2F3:  rts                                     ; D2F3 60                       `

; ----------------------------------------------------------------------------
LD2F4:  jmp     LDE23                           ; D2F4 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        lda     #$80                            ; D2F7 A9 80                    ..
        .byte   $20                             ; D2F9 20                        
LD2FA:  .byte   $54                             ; D2FA 54                       T
        .byte   $D4                             ; D2FB D4                       .
        jsr     LD79E                           ; D2FC 20 9E D7                  ..
        jsr     LDFE6                           ; D2FF 20 E6 DF                  ..
; Saisit une touche: si touche frappée alors N = 1 et A = code ASCII sinon N = 0
SEDORIC_KEYBOARD_WAIT:
        jsr     LD39E                           ; D302 20 9E D3                  ..
        beq     LD352                           ; D305 F0 4B                    .K
        bne     LD30E                           ; D307 D0 05                    ..
LD309:
LD30A           := * + 1
        jsr     LD398                           ; D309 20 98 D3                  ..
        beq     LD352                           ; D30C F0 44                    .D
LD30E:  jsr     LD22C                           ; D30E 20 2C D2                  ,.
        ldy     #$40                            ; D311 A0 40                    .@
        cmp     #$56                            ; D313 C9 56                    .V
        beq     LD31D                           ; D315 F0 06                    ..
        cmp     #$4E                            ; D317 C9 4E                    .N
        .byte   $D0                             ; D319 D0                       .
LD31A:  .byte   $0C                             ; D31A 0C                       .
        ldy     #$80                            ; D31B A0 80                    ..
LD31D:  lda     $C04D                           ; D31D AD 4D C0                 .M.
        bne     LD2F4                           ; D320 D0 D2                    ..
LD322:  sty     $C04D                           ; D322 8C 4D C0                 .M.
        beq     LD309                           ; D325 F0 E2                    ..
LD327:  cmp     #$4A                            ; D327 C9 4A                    .J
        .byte   $D0                             ; D329 D0                       .
LD32A:  ora     #$AD                            ; D32A 09 AD                    ..
        lsr     $D0C0                           ; D32C 4E C0 D0                 N..
        cpy     $A2                             ; D32F C4 A2                    ..
        .byte   $80                             ; D331 80                       .
LD332:  bmi     LD34B                           ; D332 30 17                    0.
LD334:  cmp     #$41                            ; D334 C9 41                    .A
        bne     LD2F4                           ; D336 D0 BC                    ..
        .byte   $AD                             ; D338 AD                       .
        .byte   $4E                             ; D339 4E                       N
LD33A:  cpy     #$D0                            ; D33A C0 D0                    ..
        .byte   $B7                             ; D33C B7                       .
        jsr     LD398                           ; D33D 20 98 D3                  ..
        .byte   $20                             ; D340 20                        
        .byte   $FA                             ; D341 FA                       .
LD342:  .byte   $D2                             ; D342 D2                       .
        sty     $C052                           ; D343 8C 52 C0                 .R.
        sta     $C053                           ; D346 8D 53 C0                 .S.
        .byte   $A2                             ; D349 A2                       .
LD34A:  rti                                     ; D34A 40                       @

; ----------------------------------------------------------------------------
LD34B:  .byte   $8E                             ; D34B 8E                       .
        .byte   $4E                             ; D34C 4E                       N
LD34D:  cpy     #$30                            ; D34D C0 30                    .0
        lda     $B010,y                         ; D34F B9 10 B0                 ...
LD352:  jsr     LE0E5                           ; D352 20 E5 E0                  ..
        bit     $C04D                           ; D355 2C 4D C0                 ,M.
        bvc     LD385                           ; D358 50 2B                    P+
        .byte   $AD                             ; D35A AD                       .
        .byte   $51                             ; D35B 51                       Q
LD35C:  cpy     #$20                            ; D35C C0 20                    . 
        sbc     ($D7,x)                         ; D35E E1 D7                    ..
        lda     $C052                           ; D360 AD 52 C0                 .R.
        .byte   $AC                             ; D363 AC                       .
LD364:  .byte   $53                             ; D364 53                       S
        cpy     #$20                            ; D365 C0 20                    . 
        sed                                     ; D367 F8                       .
        .byte   $D7                             ; D368 D7                       .
        lda     $C056                           ; D369 AD 56 C0                 .V.
LD36C:  ldy     $C057                           ; D36C AC 57 C0                 .W.
        jsr     LD7FE                           ; D36F 20 FE D7                  ..
LD372:  clc                                     ; D372 18                       .
        lda     $C052                           ; D373 AD 52 C0                 .R.
        adc     $C04F                           ; D376 6D 4F C0                 mO.
        pha                                     ; D379 48                       H
        lda     $C053                           ; D37A AD 53 C0                 .S.
        adc     $C050                           ; D37D 6D 50 C0                 mP.
        tay                                     ; D380 A8                       .
        pla                                     ; D381 68                       h
        jsr     LD7FB                           ; D382 20 FB D7                  ..
LD385:  lda     $C04D                           ; D385 AD 4D C0                 .M.
        asl     a                               ; D388 0A                       .
        bmi     LD3DB                           ; D389 30 50                    0P
        rol     a                               ; D38B 2A                       *
        eor     #$01                            ; D38C 49 01                    I.
        and     $C051                           ; D38E 2D 51 C0                 -Q.
        lsr     a                               ; D391 4A                       J
        lda     $C051                           ; D392 AD 51 C0                 .Q.
        bpl     LD3A4                           ; D395 10 0D                    ..
        php                                     ; D397 08                       .
LD398:  jsr     LE0B4                           ; D398 20 B4 E0                  ..
        plp                                     ; D39B 28                       (
        bcc     LD3A1                           ; D39C 90 03                    ..
LD39E:  jmp     LD1AC                           ; D39E 4C AC D1                 L..

; ----------------------------------------------------------------------------
LD3A1:  jmp     LD180                           ; D3A1 4C 80 D1                 L..

; ----------------------------------------------------------------------------
LD3A4:  bcc     LD3DB                           ; D3A4 90 35                    .5
        lda     $C056                           ; D3A6 AD 56 C0                 .V.
        ldy     $C057                           ; D3A9 AC 57 C0                 .W.
        jmp     L046B                           ; D3AC 4C 6B 04                 Lk.

; ----------------------------------------------------------------------------
        ldy     #$01                            ; D3AF A0 01                    ..
        tya                                     ; D3B1 98                       .
        sta     ($9A),y                         ; D3B2 91 9A                    ..
        php                                     ; D3B4 08                       .
        sei                                     ; D3B5 78                       x
        jsr     LD188                           ; D3B6 20 88 D1                  ..
        ldy     $92                             ; D3B9 A4 92                    ..
        lda     $91                             ; D3BB A5 91                    ..
        clc                                     ; D3BD 18                       .
        adc     #$02                            ; D3BE 69 02                    i.
        bcc     LD3C3                           ; D3C0 90 01                    ..
        iny                                     ; D3C2 C8                       .
LD3C3:  sta     $9C                             ; D3C3 85 9C                    ..
        sty     $9D                             ; D3C5 84 9D                    ..
        sta     $9E                             ; D3C7 85 9E                    ..
        sty     $9F                             ; D3C9 84 9F                    ..
        sta     $A0                             ; D3CB 85 A0                    ..
        sty     $A1                             ; D3CD 84 A1                    ..
        lda     $A6                             ; D3CF A5 A6                    ..
        ldy     $A7                             ; D3D1 A4 A7                    ..
        sta     $A2                             ; D3D3 85 A2                    ..
        sty     $A3                             ; D3D5 84 A3                    ..
        plp                                     ; D3D7 28                       (
        jmp     LD1CC                           ; D3D8 4C CC D1                 L..

; ----------------------------------------------------------------------------
LD3DB:  cli                                     ; D3DB 58                       X
        rts                                     ; D3DC 60                       `

; ----------------------------------------------------------------------------
LD3DD:  ldx     #$00                            ; D3DD A2 00                    ..
        .byte   $2C                             ; D3DF 2C                       ,
LD3E0:  ldx     #$0C                            ; D3E0 A2 0C                    ..
        jmp     LD67E                           ; D3E2 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        jsr     LDB2D                           ; D3E5 20 2D DB                  -.
        beq     LD3DD                           ; D3E8 F0 F3                    ..
        sei                                     ; D3EA 78                       x
        sec                                     ; D3EB 38                       8
        ror     $C072                           ; D3EC 6E 72 C0                 nr.
        lda     $C30C,x                         ; D3EF BD 0C C3                 ...
        ldy     $C30D,x                         ; D3F2 BC 0D C3                 ...
LD3F5:  jsr     READ_SECTOR_TRACK               ; D3F5 20 5D DA                  ].
        ldx     #$02                            ; D3F8 A2 02                    ..
LD3FA:  lda     SEDORIC_BUF1,x                  ; D3FA BD 00 C1                 ...
        cmp     #$FF                            ; D3FD C9 FF                    ..
        beq     LD40E                           ; D3FF F0 0D                    ..
        inx                                     ; D401 E8                       .
        bne     LD3FA                           ; D402 D0 F6                    ..
        lda     SEDORIC_BUF1                    ; D404 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; D407 AC 01 C1                 ...
        beq     LD3DB                           ; D40A F0 CF                    ..
        bne     LD3F5                           ; D40C D0 E7                    ..
LD40E:  lda     SEDORIC_BUF1+1,x                ; D40E BD 01 C1                 ...
        sta     SEDORIC_FTYPE                   ; D411 85 F9                    ..
        and     #$C0                            ; D413 29 C0                    ).
        bne     LD41C                           ; D415 D0 05                    ..
        bit     $C04D                           ; D417 2C 4D C0                 ,M.
        bvc     LD3E0                           ; D41A 50 C4                    P.
LD41C:  bit     $C04E                           ; D41C 2C 4E C0                 ,N.
        bvs     LD43A                           ; D41F 70 19                    p.
        bpl     LD42E                           ; D421 10 0B                    ..
        ldy     $9D                             ; D423 A4 9D                    ..
        lda     $9C                             ; D425 A5 9C                    ..
        sbc     #$02                            ; D427 E9 02                    ..
        bcs     LD434                           ; D429 B0 09                    ..
        dey                                     ; D42B 88                       .
        bcc     LD434                           ; D42C 90 06                    ..
LD42E:  lda     SEDORIC_BUF1+2,x                ; D42E BD 02 C1                 ...
        ldy     SEDORIC_BUF1+3,x                ; D431 BC 03 C1                 ...
LD434:  sta     $C052                           ; D434 8D 52 C0                 .R.
        sty     $C053                           ; D437 8C 53 C0                 .S.
LD43A:  sec                                     ; D43A 38                       8
        lda     SEDORIC_BUF1+4,x                ; D43B BD 04 C1                 ...
        sbc     SEDORIC_BUF1+2,x                ; D43E FD 02 C1                 ...
        sta     $C04F                           ; D441 8D 4F C0                 .O.
        lda     SEDORIC_BUF1+5,x                ; D444 BD 05 C1                 ...
        sbc     SEDORIC_BUF1+3,x                ; D447 FD 03 C1                 ...
        sta     $C050                           ; D44A 8D 50 C0                 .P.
        clc                                     ; D44D 18                       .
        .byte   $AD                             ; D44E AD                       .
LD44F:  .byte   $52                             ; D44F 52                       R
        .byte   $C0                             ; D450 C0                       .
LD451:  sta     SEDORIC_RWBUF                   ; D451 8D 03 C0                 ...
LD454:  adc     $C04F                           ; D454 6D 4F C0                 mO.
        pha                                     ; D457 48                       H
        lda     $C053                           ; D458 AD 53 C0                 .S.
        tay                                     ; D45B A8                       .
        dey                                     ; D45C 88                       .
        sty     $C004                           ; D45D 8C 04 C0                 ...
        adc     $C050                           ; D460 6D 50 C0                 mP.
        tay                                     ; D463 A8                       .
        bit     $C072                           ; D464 2C 72 C0                 ,r.
        bpl     LD475                           ; D467 10 0C                    ..
        lda     SEDORIC_BUF1+6,x                ; D469 BD 06 C1                 ...
        sta     $C056                           ; D46C 8D 56 C0                 .V.
        lda     SEDORIC_BUF1+7,x                ; D46F BD 07 C1                 ...
        sta     $C057                           ; D472 8D 57 C0                 .W.
LD475:  lda     SEDORIC_BUF1+8,x                ; D475 BD 08 C1                 ...
        sta     $F7                             ; D478 85 F7                    ..
        lda     SEDORIC_BUF1+9,x                ; D47A BD 09 C1                 ...
        sta     $F8                             ; D47D 85 F8                    ..
        bit     $C04D                           ; D47F 2C 4D C0                 ,M.
        bvc     LD4B9                           ; D482 50 35                    P5
        lda     $C053                           ; D484 AD 53 C0                 .S.
        jsr     XAFHEX                          ; D487 20 13 D6                  ..
        lda     $C052                           ; D48A AD 52 C0                 .R.
        jsr     XAFHEX                          ; D48D 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; D490 20 28 D6                  (.
        tya                                     ; D493 98                       .
        jsr     XAFHEX                          ; D494 20 13 D6                  ..
        pla                                     ; D497 68                       h
        jsr     XAFHEX                          ; D498 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; D49B 20 28 D6                  (.
        lda     SEDORIC_FTYPE                   ; D49E A5 F9                    ..
        jsr     XAFHEX                          ; D4A0 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; D4A3 20 28 D6                  (.
        lda     $C057                           ; D4A6 AD 57 C0                 .W.
        jsr     XAFHEX                          ; D4A9 20 13 D6                  ..
        lda     $C056                           ; D4AC AD 56 C0                 .V.
        jsr     XAFHEX                          ; D4AF 20 13 D6                  ..
        jsr     XAFCAR_DISPLAY_SPACE            ; D4B2 20 28 D6                  (.
        jsr     LD206                           ; D4B5 20 06 D2                  ..
        .byte   $24                             ; D4B8 24                       $
LD4B9:  pla                                     ; D4B9 68                       h
        txa                                     ; D4BA 8A                       .
        clc                                     ; D4BB 18                       .
        adc     #$06                            ; D4BC 69 06                    i.
        tay                                     ; D4BE A8                       .
        jsr     LE228                           ; D4BF 20 28 E2                  (.
        lda     $F7                             ; D4C2 A5 F7                    ..
        bne     LD4C8                           ; D4C4 D0 02                    ..
        dec     $F8                             ; D4C6 C6 F8                    ..
LD4C8:  dec     $F7                             ; D4C8 C6 F7                    ..
        inc     $C004                           ; D4CA EE 04 C0                 ...
        lda     $F7                             ; D4CD A5 F7                    ..
        ora     $F8                             ; D4CF 05 F8                    ..
        beq     LD4DC                           ; D4D1 F0 09                    ..
        jsr     LE228                           ; D4D3 20 28 E2                  (.
        jsr     LE250                           ; D4D6 20 50 E2                  P.
        jmp     LE1C2                           ; D4D9 4C C2 E1                 L..

; ----------------------------------------------------------------------------
LD4DC:  lda     SEDORIC_RWBUF                   ; D4DC AD 03 C0                 ...
        ldx     $C004                           ; D4DF AE 04 C0                 ...
        sta     $F5                             ; D4E2 85 F5                    ..
        stx     $F6                             ; D4E4 86 F6                    ..
        jsr     LE228                           ; D4E6 20 28 E2                  (.
        tya                                     ; D4E9 98                       .
        pha                                     ; D4EA 48                       H
        lda     #$00                            ; D4EB A9 00                    ..
        ldx     #$C2                            ; D4ED A2 C2                    ..
        sta     SEDORIC_RWBUF                   ; D4EF 8D 03 C0                 ...
        stx     $C004                           ; D4F2 8E 04 C0                 ...
        bit     $C04D                           ; D4F5 2C 4D C0                 ,M.
        bvs     LD50A                           ; D4F8 70 10                    p.
        jsr     LE250                           ; D4FA 20 50 E2                  P.
        ldy     #$FF                            ; D4FD A0 FF                    ..
        iny                                     ; D4FF C8                       .
        cpy     #$A2                            ; D500 C0 A2                    ..
        .byte   $C0                             ; D502 C0                       .
LD503:  ldy     #$01                            ; D503 A0 01                    ..
        jsr     $CFEB                           ; D505 20 EB CF                  ..
        .byte   $8D                             ; D508 8D                       .
        .byte   $06                             ; D509 06                       .
LD50A:  cpy     #$68                            ; D50A C0 68                    .h
        sta     $C004                           ; D50C 8D 04 C0                 ...
        pla                                     ; D50F 68                       h
        sta     SEDORIC_RWBUF                   ; D510 8D 03 C0                 ...
        bcs     LD51B                           ; D513 B0 06                    ..
        lda     MICRODISC_FDC_SECTOR            ; D515 AD 12 03                 ...
        sta     MICRODISC_FDC_TRACK             ; D518 8D 11 03                 ...
LD51B:  pla                                     ; D51B 68                       h
        tax                                     ; D51C AA                       .
        stx     SEDORIC_type_of_error           ; D51D 8E 05 C0                 ...
        rts                                     ; D520 60                       `

; ----------------------------------------------------------------------------
        lda     MICRODISC_CONTROL_SHADOW        ; D521 AD FB 04                 ...
        sta     MICRODISC_CONTROL               ; D524 8D 14 03                 ...
        lda     MICRODISC_FDC_COMMAND           ; D527 AD 10 03                 ...
        lsr     a                               ; D52A 4A                       J
        bcc     LD532                           ; D52B 90 05                    ..
        lda     #$D0                            ; D52D A9 D0                    ..
        sta     MICRODISC_FDC_COMMAND           ; D52F 8D 10 03                 ...
LD532:  sec                                     ; D532 38                       8
        jmp     NMIRAM                          ; D533 4C F8 04                 L..

; ----------------------------------------------------------------------------
        stx     $F3                             ; D536 86 F3                    ..
        ldx     #$04                            ; D538 A2 04                    ..
        jsr     LD36C                           ; D53A 20 6C D3                  l.
        sec                                     ; D53D 38                       8
        ldx     $F3                             ; D53E A6 F3                    ..
        lda     $F2                             ; D540 A5 F2                    ..
        sbc     #$02                            ; D542 E9 02                    ..
        bcs     LD547                           ; D544 B0 01                    ..
        dex                                     ; D546 CA                       .
LD547:  pha                                     ; D547 48                       H
        txa                                     ; D548 8A                       .
        jsr     XAFHEX                          ; D549 20 13 D6                  ..
        pla                                     ; D54C 68                       h
        jsr     XAFHEX                          ; D54D 20 13 D6                  ..
        cli                                     ; D550 58                       X
        ldx     #$FF                            ; D551 A2 FF                    ..
        txs                                     ; D553 9A                       .
        jsr     SEDORIC_XROM                    ; D554 20 D8 D5                  ..
        lda     $A0C4                           ; D557 AD C4 A0                 ...
        cpy     $60                             ; D55A C4 60                    .`
        jsr     SEDORIC_XROM                    ; D55C 20 D8 D5                  ..
        sed                                     ; D55F F8                       .
        .byte   $C3                             ; D560 C3                       .
        .byte   $F4                             ; D561 F4                       .
        .byte   $C3                             ; D562 C3                       .
        rts                                     ; D563 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D564 20 D8 D5                  ..
LD567:  pha                                     ; D567 48                       H
        cpy     $44                             ; D568 C4 44                    .D
        cpy     $60                             ; D56A C4 60                    .`
        ldx     #$4D                            ; D56C A2 4D                    .M
        bit     $A3A2                           ; D56E 2C A2 A3                 ,..
        jsr     SEDORIC_XROM                    ; D571 20 D8 D5                  ..
        sta     $C4                             ; D574 85 C4                    ..
        ror     $20C4,x                         ; D576 7E C4 20                 ~. 
        cld                                     ; D579 D8                       .
        cmp     $A3,x                           ; D57A D5 A3                    ..
        cpy     $96                             ; D57C C4 96                    ..
        cpy     $60                             ; D57E C4 60                    .`
        jsr     SEDORIC_XROM                    ; D580 20 D8 D5                  ..
        lda     $C4,x                           ; D583 B5 C4                    ..
        tay                                     ; D585 A8                       .
        cpy     $60                             ; D586 C4 60                    .`
        lda     $9A                             ; D588 A5 9A                    ..
        ldy     $9B                             ; D58A A4 9B                    ..
        jsr     SEDORIC_XROM                    ; D58C 20 D8 D5                  ..
        .byte   $73                             ; D58F 73                       s
        cmp     $63                             ; D590 C5 63                    .c
        cmp     $60                             ; D592 C5 60                    .`
        jsr     SEDORIC_XROM                    ; D594 20 D8 D5                  ..
        asl     a                               ; D597 0A                       .
        dec     $FA                             ; D598 C6 FA                    ..
        cmp     $60                             ; D59A C5 60                    .`
        jsr     SEDORIC_XROM                    ; D59C 20 D8 D5                  ..
        dec     $B3C6,x                         ; D59F DE C6 B3                 ...
        dec     $60                             ; D5A2 C6 60                    .`
        jsr     SEDORIC_XROM                    ; D5A4 20 D8 D5                  ..
        inc     $C3C6                           ; D5A7 EE C6 C3                 ...
        dec     $60                             ; D5AA C6 60                    .`
LD5AC:  jsr     SEDORIC_XROM                    ; D5AC 20 D8 D5                  ..
        adc     $C7                             ; D5AF 65 C7                    e.
        .byte   $3A                             ; D5B1 3A                       :
        .byte   $C7                             ; D5B2 C7                       .
        rts                                     ; D5B3 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; D5B4 20                        
LD5B5:  cld                                     ; D5B5 D8                       .
        cmp     $99,x                           ; D5B6 D5 99                    ..
        .byte   $C7                             ; D5B8 C7                       .
        jmp     ($60C7)                         ; D5B9 6C C7 60                 l.`

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D5BC 20 D8 D5                  ..
        rti                                     ; D5BF 40                       @

; ----------------------------------------------------------------------------
        iny                                     ; D5C0 C8                       .
        asl     $C8,x                           ; D5C1 16 C8                    ..
        rts                                     ; D5C3 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; D5C4 20                        
        cld                                     ; D5C5 D8                       .
LD5C6:  cmp     $3D,x                           ; D5C6 D5 3D                    .=
        iny                                     ; D5C8 C8                       .
        .byte   $2F                             ; D5C9 2F                       /
        iny                                     ; D5CA C8                       .
        rts                                     ; D5CB 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D5CC 20 D8 D5                  ..
        .byte   $1F                             ; D5CF 1F                       .
        cmp     #$52                            ; D5D0 C9 52                    .R
        cmp     #$60                            ; D5D2 C9 60                    .`
        jsr     SEDORIC_XROM                    ; D5D4 20 D8 D5                  ..
        .byte   $F1                             ; D5D7 F1                       .
SEDORIC_XROM:
        cmp     #$23                            ; D5D8 C9 23                    .#
        dex                                     ; D5DA CA                       .
        rts                                     ; D5DB 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D5DC 20 D8 D5                  ..
        .byte   $1C                             ; D5DF 1C                       .
        dex                                     ; D5E0 CA                       .
        lsr     $20CA                           ; D5E1 4E CA 20                 N. 
        cld                                     ; D5E4 D8                       .
        cmp     $0D,x                           ; D5E5 D5 0D                    ..
        dex                                     ; D5E7 CA                       .
        .byte   $3F                             ; D5E8 3F                       ?
        dex                                     ; D5E9 CA                       .
        rts                                     ; D5EA 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D5EB 20 D8 D5                  ..
        eor     ($CA,x)                         ; D5EE 41 CA                    A.
        .byte   $73                             ; D5F0 73                       s
        dex                                     ; D5F1 CA                       .
        rts                                     ; D5F2 60                       `

; ----------------------------------------------------------------------------
        jsr     LD39E                           ; D5F3 20 9E D3                  ..
        jsr     SEDORIC_XROM                    ; D5F6 20 D8 D5                  ..
        tya                                     ; D5F9 98                       .
        dex                                     ; D5FA CA                       .
        .byte   $E2                             ; D5FB E2                       .
        dex                                     ; D5FC CA                       .
        rts                                     ; D5FD 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D5FE 20 D8 D5                  ..
        .byte   $EF                             ; D601 EF                       .
        dex                                     ; D602 CA                       .
        and     $60CB,y                         ; D603 39 CB 60                 9.`
        jsr     SEDORIC_XROM                    ; D606 20 D8 D5                  ..
        .byte   $9F                             ; D609 9F                       .
        .byte   $CB                             ; D60A CB                       .
        beq     SEDORIC_XROM                    ; D60B F0 CB                    ..
        rts                                     ; D60D 60                       `

; ----------------------------------------------------------------------------
LD60E:  jsr     SEDORIC_XROM                    ; D60E 20 D8 D5                  ..
        .byte   $12                             ; D611 12                       .
        .byte   $CC                             ; D612 CC                       .
XAFHEX: cmp     $60CC,y                         ; D613 D9 CC 60                 ..`
        jsr     LD224                           ; D616 20 24 D2                  $.
        clc                                     ; D619 18                       .
        bit     $38                             ; D61A 24 38                    $8
        .byte   $20                             ; D61C 20                        
        cld                                     ; D61D D8                       .
LD61E:  cmp     $7D,x                           ; D61E D5 7D                    .}
        dec     $CF09                           ; D620 CE 09 CF                 ...
        rts                                     ; D623 60                       `

; ----------------------------------------------------------------------------
LD624:  jsr     SEDORIC_XROM                    ; D624 20 D8 D5                  ..
        .byte   $8B                             ; D627 8B                       .
XAFCAR_DISPLAY_SPACE:
        .byte   $CE                             ; D628 CE                       .
        .byte   $17                             ; D629 17                       .
XAFCAR: .byte   $CF                             ; D62A CF                       .
        rts                                     ; D62B 60                       `

; ----------------------------------------------------------------------------
        lda     #$2C                            ; D62C A9 2C                    .,
        jsr     SEDORIC_XROM                    ; D62E 20 D8 D5                  ..
        .byte   $DB                             ; D631 DB                       .
        .byte   $CF                             ; D632 CF                       .
        .byte   $67                             ; D633 67                       g
        bne     LD682                           ; D634 D0 4C                    .L
        .byte   $A1                             ; D636 A1                       .
XAFSTR: .byte   $D3                             ; D637 D3                       .
        jsr     SEDORIC_XROM                    ; D638 20 D8 D5                  ..
        .byte   $FC                             ; D63B FC                       .
        .byte   $D0                             ; D63C D0                       .
LD63D:  dey                                     ; D63D 88                       .
        cmp     ($85),y                         ; D63E D1 85                    ..
        .byte   $D3                             ; D640 D3                       .
        sty     $D4                             ; D641 84 D4                    ..
        rts                                     ; D643 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D644 20 D8 D5                  ..
        cli                                     ; D647 58                       X
LD648:  cmp     ($E8),y                         ; D648 D1 E8                    ..
        cmp     ($60),y                         ; D64A D1 60                    .`
        jsr     SEDORIC_XROM                    ; D64C 20 D8 D5                  ..
        .byte   $17                             ; D64F 17                       .
        .byte   $D2                             ; D650 D2                       .
        lda     #$D2                            ; D651 A9 D2                    ..
        rts                                     ; D653 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; D654 20                        
LD655:  cld                                     ; D655 D8                       .
        cmp     $ED,x                           ; D656 D5 ED                    ..
        .byte   $D3                             ; D658 D3                       .
        sta     $60D4,y                         ; D659 99 D4 60                 ..`
        jsr     SEDORIC_XROM                    ; D65C 20 D8 D5                  ..
LD65F:  ora     LD2D4,y                         ; D65F 19 D4 D2                 ...
        .byte   $D4                             ; D662 D4                       .
        rts                                     ; D663 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D664 20 D8 D5                  ..
        beq     LD63D                           ; D667 F0 D4                    ..
LD669:  .byte   $AB                             ; D669 AB                       .
        cmp     $60,x                           ; D66A D5 60                    .`
        jsr     SEDORIC_XROM                    ; D66C 20 D8 D5                  ..
        .byte   $C7                             ; D66F C7                       .
        dec     $82,x                           ; D670 D6 82                    ..
        .byte   $D7                             ; D672 D7                       .
        rts                                     ; D673 60                       `

; ----------------------------------------------------------------------------
        jsr     LD21B                           ; D674 20 1B D2                  ..
        jsr     SEDORIC_XROM                    ; D677 20 D8 D5                  ..
        ora     $D7,x                           ; D67A 15 D7                    ..
        bne     LD655                           ; D67C D0 D7                    ..
LD67E:  rts                                     ; D67E 60                       `

; ----------------------------------------------------------------------------
        jsr     LD216                           ; D67F 20 16 D2                  ..
LD682:  jsr     SEDORIC_XROM                    ; D682 20 D8 D5                  ..
        bpl     LD65F                           ; D685 10 D8                    ..
        .byte   $CB                             ; D687 CB                       .
        cld                                     ; D688 D8                       .
        rts                                     ; D689 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D68A 20 D8 D5                  ..
        .byte   $6B                             ; D68D 6B                       k
        cld                                     ; D68E D8                       .
        rol     $D9                             ; D68F 26 D9                    &.
        rts                                     ; D691 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D692 20 D8 D5                  ..
        stx     $D9,y                           ; D695 96 D9                    ..
        .byte   $22                             ; D697 22                       "
        .byte   $DA                             ; D698 DA                       .
        rts                                     ; D699 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D69A 20 D8 D5                  ..
        .byte   $80                             ; D69D 80                       .
        .byte   $DA                             ; D69E DA                       .
        .byte   $0B                             ; D69F 0B                       .
        .byte   $DB                             ; D6A0 DB                       .
        rts                                     ; D6A1 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6A2 20 D8 D5                  ..
        .byte   $97                             ; D6A5 97                       .
        .byte   $DA                             ; D6A6 DA                       .
        .byte   $22                             ; D6A7 22                       "
        .byte   $DB                             ; D6A8 DB                       .
        rts                                     ; D6A9 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6AA 20 D8 D5                  ..
        .byte   $B7                             ; D6AD B7                       .
        .byte   $DC                             ; D6AE DC                       .
        sbc     $60DC                           ; D6AF ED DC 60                 ..`
        jsr     SEDORIC_XROM                    ; D6B2 20 D8 D5                  ..
        cpx     #$DD                            ; D6B5 E0 DD                    ..
        cpx     $DD                             ; D6B7 E4 DD                    ..
        rts                                     ; D6B9 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6BA 20 D8 D5                  ..
        .byte   $73                             ; D6BD 73                       s
        dec     LDE7B,x                         ; D6BE DE 7B DE                 .{.
        rts                                     ; D6C1 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6C2 20 D8 D5                  ..
        lda     $DE                             ; D6C5 A5 DE                    ..
        lda     $60DE                           ; D6C7 AD DE 60                 ..`
        jsr     SEDORIC_XROM                    ; D6CA 20 D8 D5                  ..
        cmp     $D8,x                           ; D6CD D5 D8                    ..
        rti                                     ; D6CF 40                       @

; ----------------------------------------------------------------------------
        .byte   $DF                             ; D6D0 DF                       .
        rts                                     ; D6D1 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6D2 20 D8 D5                  ..
        cmp     ($E0),y                         ; D6D5 D1 E0                    ..
        cmp     $E0,x                           ; D6D7 D5 E0                    ..
        rts                                     ; D6D9 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6DA 20 D8 D5                  ..
        adc     $71E2                           ; D6DD 6D E2 71                 m.q
        .byte   $E2                             ; D6E0 E2                       .
        rts                                     ; D6E1 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6E2 20 D8 D5                  ..
        adc     $7DE3,y                         ; D6E5 79 E3 7D                 y.}
        .byte   $E3                             ; D6E8 E3                       .
        rts                                     ; D6E9 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6EA 20 D8 D5                  ..
        .byte   $87                             ; D6ED 87                       .
        .byte   $E3                             ; D6EE E3                       .
        .byte   $8B                             ; D6EF 8B                       .
        .byte   $E3                             ; D6F0 E3                       .
        rts                                     ; D6F1 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6F2 20 D8 D5                  ..
        stx     $92E3                           ; D6F5 8E E3 92                 ...
        .byte   $E3                             ; D6F8 E3                       .
        rts                                     ; D6F9 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D6FA 20 D8 D5                  ..
        sta     $53E7,x                         ; D6FD 9D E7 53                 ..S
        inx                                     ; D700 E8                       .
        rts                                     ; D701 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D702 20 D8 D5                  ..
        ora     $E9                             ; D705 05 E9                    ..
        sei                                     ; D707 78                       x
        .byte   $EB                             ; D708 EB                       .
        rts                                     ; D709 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D70A 20 D8 D5                  ..
        .byte   $C7                             ; D70D C7                       .
        cpx     LEDE0                           ; D70E EC E0 ED                 ...
        rts                                     ; D711 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D712 20 D8 D5                  ..
        adc     $10F0,y                         ; D715 79 F0 10                 y..
        sbc     ($60),y                         ; D718 F1 60                    .`
        jsr     SEDORIC_XROM                    ; D71A 20 D8 D5                  ..
        .byte   $94                             ; D71D 94                       .
LD71E:  .byte   $F4                             ; D71E F4                       .
        .byte   $EF                             ; D71F EF                       .
        .byte   $F4                             ; D720 F4                       .
        rts                                     ; D721 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D722 20 D8 D5                  ..
        and     $F5,x                           ; D725 35 F5                    5.
        bcc     LD71E                           ; D727 90 F5                    ..
        rts                                     ; D729 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D72A 20 D8 D5                  ..
        .byte   $CB                             ; D72D CB                       .
        .byte   $F7                             ; D72E F7                       .
        ora     ($F8,x)                         ; D72F 01 F8                    ..
        rts                                     ; D731 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D732 20 D8 D5                  ..
        rol     $82F9,x                         ; D735 3E F9 82                 >..
        sbc     $2060,y                         ; D738 F9 60 20                 .` 
LD73B:  cld                                     ; D73B D8                       .
        cmp     $E2,x                           ; D73C D5 E2                    ..
XCURON: brk                                     ; D73E 00                       .
        .byte   $E2                             ; D73F E2                       .
XCUROFF:brk                                     ; D740 00                       .
        rts                                     ; D741 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D742 20 D8 D5                  ..
        inx                                     ; D745 E8                       .
        brk                                     ; D746 00                       .
        inx                                     ; D747 E8                       .
        brk                                     ; D748 00                       .
        rts                                     ; D749 60                       `

; ----------------------------------------------------------------------------
        ldy     #$09                            ; D74A A0 09                    ..
        .byte   $2C                             ; D74C 2C                       ,
        .byte   $A0                             ; D74D A0                       .
LD74E:  brk                                     ; D74E 00                       .
LD74F:  lda     COMMON_EXT_TABLE,x              ; D74F BD F7 CC                 ...
        sta     $C029,y                         ; D752 99 29 C0                 .).
        iny                                     ; D755 C8                       .
LD756:  inx                                     ; D756 E8                       .
        .byte   $C0                             ; D757 C0                       .
LD758:  .byte   $0C                             ; D758 0C                       .
        bne     LD74F                           ; D759 D0 F4                    ..
        rts                                     ; D75B 60                       `

; ----------------------------------------------------------------------------
        lda     SEDORIC_EXTER                   ; D75C AD 0D C0                 ...
        ldy     $C00E                           ; D75F AC 0E C0                 ...
        bne     LD776                           ; D762 D0 12                    ..
        lda     SEDORIC_EXTMS                   ; D764 AD 0F C0                 ...
        ldy     $C010                           ; D767 AC 10 C0                 ...
        bne     LD776                           ; D76A D0 0A                    ..
        lda     #$E6                            ; D76C A9 E6                    ..
        ldy     #$CE                            ; D76E A0 CE                    ..
        bne     LD776                           ; D770 D0 04                    ..
        lda     #$BE                            ; D772 A9 BE                    ..
        ldy     #$CD                            ; D774 A0 CD                    ..
LD776:  sta     $18                             ; D776 85 18                    ..
        sty     $19                             ; D778 84 19                    ..
        ldy     #$00                            ; D77A A0 00                    ..
LD77C:  dex                                     ; D77C CA                       .
        bmi     LD78B                           ; D77D 30 0C                    0.
LD77F:  inc     $18                             ; D77F E6 18                    ..
        bne     LD785                           ; D781 D0 02                    ..
        inc     $19                             ; D783 E6 19                    ..
LD785:  lda     ($18),y                         ; D785 B1 18                    ..
        bpl     LD77F                           ; D787 10 F6                    ..
        bmi     LD77C                           ; D789 30 F1                    0.
LD78B:  iny                                     ; D78B C8                       .
        lda     ($18),y                         ; D78C B1 18                    ..
        php                                     ; D78E 08                       .
        and     #$7F                            ; D78F 29 7F                    ).
        jsr     XAFCAR                          ; D791 20 2A D6                  *.
        plp                                     ; D794 28                       (
        bpl     LD78B                           ; D795 10 F4                    ..
        rts                                     ; D797 60                       `

; ----------------------------------------------------------------------------
        jsr     LD33A                           ; D798 20 3A D3                  :.
        jmp     LD3A1                           ; D79B 4C A1 D3                 L..

; ----------------------------------------------------------------------------
LD79E:  .byte   $20                             ; D79E 20                        
        .byte   $42                             ; D79F 42                       B
LD7A0:  .byte   $D3                             ; D7A0 D3                       .
        php                                     ; D7A1 08                       .
        cmp     #$61                            ; D7A2 C9 61                    .a
        bcc     LD7AC                           ; D7A4 90 06                    ..
        cmp     #$7B                            ; D7A6 C9 7B                    .{
        bcs     LD7AC                           ; D7A8 B0 02                    ..
        and     #$DF                            ; D7AA 29 DF                    ).
LD7AC:  plp                                     ; D7AC 28                       (
        rts                                     ; D7AD 60                       `

; ----------------------------------------------------------------------------
        ldx     #$00                            ; D7AE A2 00                    ..
        stx     SEDORIC_IDERROR                 ; D7B0 8E FD 04                 ...
        tsx                                     ; D7B3 BA                       .
        stx     $C023                           ; D7B4 8E 23 C0                 .#.
        lda     $E9                             ; D7B7 A5 E9                    ..
        ldy     $EA                             ; D7B9 A4 EA                    ..
        .byte   $8D                             ; D7BB 8D                       .
        .byte   $1F                             ; D7BC 1F                       .
LD7BD:  cpy     #$8C                            ; D7BD C0 8C                    ..
        .byte   $20                             ; D7BF 20                        
LD7C0:  cpy     #$20                            ; D7C0 C0 20                    . 
        .byte   $9E                             ; D7C2 9E                       .
        .byte   $D3                             ; D7C3 D3                       .
        sbc     #$41                            ; D7C4 E9 41                    .A
        ldy     #$1A                            ; D7C6 A0 1A                    ..
        .byte   $90                             ; D7C8 90                       .
LD7C9:  php                                     ; D7C9 08                       .
        cmp     #$1A                            ; D7CA C9 1A                    ..
LD7CC:  bcs     LD7D2                           ; D7CC B0 04                    ..
        tay                                     ; D7CE A8                       .
LD7CF:  jsr     LD33A                           ; D7CF 20 3A D3                  :.
LD7D2:  tya                                     ; D7D2 98                       .
        asl     a                               ; D7D3 0A                       .
        asl     a                               ; D7D4 0A                       .
LD7D5:  tay                                     ; D7D5 A8                       .
        .byte   $B9                             ; D7D6 B9                       .
        .byte   $BB                             ; D7D7 BB                       .
LD7D8:  .byte   $CB                             ; D7D8 CB                       .
        sta     $18                             ; D7D9 85 18                    ..
LD7DB:  lda     LCBBC,y                         ; D7DB B9 BC CB                 ...
LD7DE:  sta     $19                             ; D7DE 85 19                    ..
        .byte   $B9                             ; D7E0 B9                       .
LD7E1:  ldx     $85CB,y                         ; D7E1 BE CB 85                 ...
LD7E4:  .byte   $F2                             ; D7E4 F2                       .
        .byte   $BE                             ; D7E5 BE                       .
        .byte   $BD                             ; D7E6 BD                       .
LD7E7:  .byte   $CB                             ; D7E7 CB                       .
LD7E8:  dec     $F2                             ; D7E8 C6 F2                    ..
LD7EA:  bmi     LD828                           ; D7EA 30 3C                    0<
        .byte   $A0                             ; D7EC A0                       .
LD7ED:  .byte   $FF                             ; D7ED FF                       .
LD7EE:  iny                                     ; D7EE C8                       .
        lda     ($18),y                         ; D7EF B1 18                    ..
        .byte   $F0                             ; D7F1 F0                       .
LD7F2:  bit     $85                             ; D7F2 24 85                    $.
        .byte   $F3                             ; D7F4 F3                       .
        lda     ($E9),y                         ; D7F5 B1 E9                    ..
        .byte   $C9                             ; D7F7 C9                       .
LD7F8:  adc     ($90,x)                         ; D7F8 61 90                    a.
        .byte   $06                             ; D7FA 06                       .
LD7FB:  cmp     #$7B                            ; D7FB C9 7B                    .{
        .byte   $B0                             ; D7FD B0                       .
LD7FE:  .byte   $02                             ; D7FE 02                       .
        and     #$DF                            ; D7FF 29 DF                    ).
        cmp     $F3                             ; D801 C5 F3                    ..
        beq     LD7EE                           ; D803 F0 E9                    ..
LD805:  iny                                     ; D805 C8                       .
        lda     ($18),y                         ; D806 B1 18                    ..
        bne     LD805                           ; D808 D0 FB                    ..
        inx                                     ; D80A E8                       .
        sec                                     ; D80B 38                       8
        tya                                     ; D80C 98                       .
        adc     $18                             ; D80D 65 18                    e.
        sta     $18                             ; D80F 85 18                    ..
        bcc     LD7E8                           ; D811 90 D5                    ..
        inc     $19                             ; D813 E6 19                    ..
        bcs     LD7E8                           ; D815 B0 D1                    ..
LD817:  txa                                     ; D817 8A                       .
        asl     a                               ; D818 0A                       .
        tax                                     ; D819 AA                       .
        .byte   $BD                             ; D81A BD                       .
        plp                                     ; D81B 28                       (
LD81C:  cpy     $BD48                           ; D81C CC 48 BD                 .H.
        .byte   $27                             ; D81F 27                       '
        cpy     $2048                           ; D820 CC 48 20                 .H 
        .byte   $E3                             ; D823 E3                       .
        cmp     ($4C),y                         ; D824 D1 4C                    .L
        .byte   $9E                             ; D826 9E                       .
        .byte   $D3                             ; D827 D3                       .
LD828:  lda     $C01F                           ; D828 AD 1F C0                 ...
        ldy     $C020                           ; D82B AC 20 C0                 . .
        sta     $E9                             ; D82E 85 E9                    ..
        sty     $EA                             ; D830 84 EA                    ..
        jsr     LD39E                           ; D832 20 9E D3                  ..
        beq     LD849                           ; D835 F0 12                    ..
        ldy     #$FF                            ; D837 A0 FF                    ..
LD839:  iny                                     ; D839 C8                       .
LD83A:  lda     ($E9),y                         ; D83A B1 E9                    ..
        beq     LD84A                           ; D83C F0 0C                    ..
        cmp     #$3A                            ; D83E C9 3A                    .:
        beq     LD84A                           ; D840 F0 08                    ..
        .byte   $C9                             ; D842 C9                       .
LD843:  .byte   $D3                             ; D843 D3                       .
        .byte   $D0                             ; D844 D0                       .
LD845:  .byte   $F3                             ; D845 F3                       .
        jmp     LF5BA                           ; D846 4C BA F5                 L..

; ----------------------------------------------------------------------------
LD849:  rts                                     ; D849 60                       `

; ----------------------------------------------------------------------------
LD84A:  lda     #$00                            ; D84A A9 00                    ..
        jmp     LDFF9                           ; D84C 4C F9 DF                 L..

; ----------------------------------------------------------------------------
        sec                                     ; D84F 38                       8
        bit     $18                             ; D850 24 18                    $.
        lda     #$80                            ; D852 A9 80                    ..
        php                                     ; D854 08                       .
        sta     $F4                             ; D855 85 F4                    ..
        lsr     $F5                             ; D857 46 F5                    F.
        lda     SEDORIC_DRVDEF                  ; D859 AD 09 C0                 ...
        sta     SEDORIC_BUFNOM                  ; D85C 8D 28 C0                 .(.
        ldx     #$0B                            ; D85F A2 0B                    ..
        lda     #$20                            ; D861 A9 20                    . 
        sta     $F3                             ; D863 85 F3                    ..
LD865:  sta     $C029,x                         ; D865 9D 29 C0                 .).
        dex                                     ; D868 CA                       .
        bpl     LD865                           ; D869 10 FA                    ..
        plp                                     ; D86B 28                       (
        bpl     LD8D0                           ; D86C 10 62                    .b
        .byte   $B0                             ; D86E B0                       .
LD86F:  .byte   $3B                             ; D86F 3B                       ;
        jsr     LD39E                           ; D870 20 9E D3                  ..
        bne     LD881                           ; D873 D0 0C                    ..
LD875:  lda     #$0C                            ; D875 A9 0C                    ..
        sta     $F2                             ; D877 85 F2                    ..
        ldx     #$00                            ; D879 A2 00                    ..
        jsr     LD5B5                           ; D87B 20 B5 D5                  ..
        jmp     LD503                           ; D87E 4C 03 D5                 L..

; ----------------------------------------------------------------------------
LD881:  cmp     #$2C                            ; D881 C9 2C                    .,
        beq     LD875                           ; D883 F0 F0                    ..
        cmp     #$C3                            ; D885 C9 C3                    ..
        beq     LD875                           ; D887 F0 EC                    ..
        sec                                     ; D889 38                       8
        sbc     #$41                            ; D88A E9 41                    .A
        tay                                     ; D88C A8                       .
        cmp     #$04                            ; D88D C9 04                    ..
        bcs     LD8AB                           ; D88F B0 1A                    ..
        jsr     LD398                           ; D891 20 98 D3                  ..
        beq     LD89E                           ; D894 F0 08                    ..
        cmp     #$C3                            ; D896 C9 C3                    ..
        beq     LD89E                           ; D898 F0 04                    ..
        cmp     #$2C                            ; D89A C9 2C                    .,
        bne     LD8A3                           ; D89C D0 05                    ..
LD89E:  sty     SEDORIC_BUFNOM                  ; D89E 8C 28 C0                 .(.
        bcs     LD875                           ; D8A1 B0 D2                    ..
LD8A3:  lda     $E9                             ; D8A3 A5 E9                    ..
        bne     LD8A9                           ; D8A5 D0 02                    ..
        dec     $EA                             ; D8A7 C6 EA                    ..
LD8A9:  dec     $E9                             ; D8A9 C6 E9                    ..
LD8AB:  jsr     LD224                           ; D8AB 20 24 D2                  $.
        jsr     LD274                           ; D8AE 20 74 D2                  t.
        sta     $F3                             ; D8B1 85 F3                    ..
        tay                                     ; D8B3 A8                       .
        dey                                     ; D8B4 88                       .
        bmi     LD932                           ; D8B5 30 7B                    0{
LD8B7:  lda     ($91),y                         ; D8B7 B1 91                    ..
        cmp     #$20                            ; D8B9 C9 20                    . 
        bne     LD8BF                           ; D8BB D0 02                    ..
        dec     $F3                             ; D8BD C6 F3                    ..
LD8BF:  dey                                     ; D8BF 88                       .
        bpl     LD8B7                           ; D8C0 10 F5                    ..
        lda     $E9                             ; D8C2 A5 E9                    ..
        pha                                     ; D8C4 48                       H
        lda     $EA                             ; D8C5 A5 EA                    ..
        pha                                     ; D8C7 48                       H
        lda     $91                             ; D8C8 A5 91                    ..
        sta     $E9                             ; D8CA 85 E9                    ..
        lda     $92                             ; D8CC A5 92                    ..
        sta     $EA                             ; D8CE 85 EA                    ..
LD8D0:  jsr     LD39E                           ; D8D0 20 9E D3                  ..
        sbc     #$41                            ; D8D3 E9 41                    .A
        tax                                     ; D8D5 AA                       .
        cmp     #$04                            ; D8D6 C9 04                    ..
        bcs     LD909                           ; D8D8 B0 2F                    ./
        ldy     #$01                            ; D8DA A0 01                    ..
        lda     ($E9),y                         ; D8DC B1 E9                    ..
        cmp     #$2D                            ; D8DE C9 2D                    .-
        beq     LD8E6                           ; D8E0 F0 04                    ..
        cmp     #$CD                            ; D8E2 C9 CD                    ..
        bne     LD909                           ; D8E4 D0 23                    .#
LD8E6:  stx     SEDORIC_BUFNOM                  ; D8E6 8E 28 C0                 .(.
        dec     $F3                             ; D8E9 C6 F3                    ..
        dec     $F3                             ; D8EB C6 F3                    ..
        beq     LD93D                           ; D8ED F0 4E                    .N
        jsr     LD398                           ; D8EF 20 98 D3                  ..
        jsr     LD398                           ; D8F2 20 98 D3                  ..
        bne     LD909                           ; D8F5 D0 12                    ..
        bit     $F4                             ; D8F7 24 F4                    $.
        bmi     LD932                           ; D8F9 30 37                    07
        pla                                     ; D8FB 68                       h
        pla                                     ; D8FC 68                       h
        jsr     LD7BD                           ; D8FD 20 BD D7                  ..
        jsr     LE5B9                           ; D900 20 B9 E5                  ..
LD903:  jsr     LD7BD                           ; D903 20 BD D7                  ..
        jmp     LD39E                           ; D906 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LD909:  ldx     #$00                            ; D909 A2 00                    ..
        lda     #$09                            ; D90B A9 09                    ..
        sta     $F2                             ; D90D 85 F2                    ..
        lsr     $F6                             ; D90F 46 F6                    F.
        jsr     LD39E                           ; D911 20 9E D3                  ..
LD914:  bit     $F6                             ; D914 24 F6                    $.
        bmi     LD92A                           ; D916 30 12                    0.
        cmp     #$2E                            ; D918 C9 2E                    ..
        bne     LD92A                           ; D91A D0 0E                    ..
        ror     $F6                             ; D91C 66 F6                    f.
        cpx     #$0A                            ; D91E E0 0A                    ..
        bcs     LD93D                           ; D920 B0 1B                    ..
        lda     #$0C                            ; D922 A9 0C                    ..
        sta     $F2                             ; D924 85 F2                    ..
        ldx     #$08                            ; D926 A2 08                    ..
        bne     LD93F                           ; D928 D0 15                    ..
LD92A:  cmp     #$2C                            ; D92A C9 2C                    .,
        bne     LD934                           ; D92C D0 06                    ..
        bit     $F4                             ; D92E 24 F4                    $.
        bpl     LD959                           ; D930 10 27                    .'
LD932:  bmi     LD9AC                           ; D932 30 78                    0x
LD934:  jsr     LD567                           ; D934 20 67 D5                  g.
        sta     $C029,x                         ; D937 9D 29 C0                 .).
        tya                                     ; D93A 98                       .
        cpx     $F2                             ; D93B E4 F2                    ..
LD93D:  bcs     LD9AC                           ; D93D B0 6D                    .m
LD93F:  dec     $F3                             ; D93F C6 F3                    ..
        beq     LD953                           ; D941 F0 10                    ..
        inx                                     ; D943 E8                       .
        bit     $F5                             ; D944 24 F5                    $.
        bmi     LD914                           ; D946 30 CC                    0.
        jsr     LD398                           ; D948 20 98 D3                  ..
        bne     LD914                           ; D94B D0 C7                    ..
        bit     $F4                             ; D94D 24 F4                    $.
        bpl     LD959                           ; D94F 10 08                    ..
        bmi     LD9AC                           ; D951 30 59                    0Y
LD953:  pla                                     ; D953 68                       h
        sta     $EA                             ; D954 85 EA                    ..
        pla                                     ; D956 68                       h
        sta     $E9                             ; D957 85 E9                    ..
LD959:  lda     $C032                           ; D959 AD 32 C0                 .2.
        cmp     #$20                            ; D95C C9 20                    . 
        bne     LD903                           ; D95E D0 A3                    ..
        ldx     #$00                            ; D960 A2 00                    ..
        .byte   $20                             ; D962 20                        
LD963:  lsr     a                               ; D963 4A                       J
        .byte   $D3                             ; D964 D3                       .
        beq     LD903                           ; D965 F0 9C                    ..
        bit     $F5                             ; D967 24 F5                    $.
        bmi     LD98F                           ; D969 30 24                    0$
        tay                                     ; D96B A8                       .
        bpl     LD9B1                           ; D96C 10 43                    .C
        sta     $F5                             ; D96E 85 F5                    ..
        and     #$7F                            ; D970 29 7F                    ).
        sta     $24                             ; D972 85 24                    .$
        lda     #$E9                            ; D974 A9 E9                    ..
        ldy     #$C0                            ; D976 A0 C0                    ..
        sta     $16                             ; D978 85 16                    ..
        sty     $17                             ; D97A 84 17                    ..
        ldy     #$00                            ; D97C A0 00                    ..
LD97E:  dec     $24                             ; D97E C6 24                    .$
        bmi     LD98F                           ; D980 30 0D                    0.
LD982:  inc     $16                             ; D982 E6 16                    ..
        bne     LD988                           ; D984 D0 02                    ..
        inc     $17                             ; D986 E6 17                    ..
LD988:  jsr     DO_EXEVEC                       ; D988 20 53 04                  S.
        bpl     LD982                           ; D98B 10 F5                    ..
        bmi     LD97E                           ; D98D 30 EF                    0.
LD98F:  ldy     #$00                            ; D98F A0 00                    ..
        inc     $16                             ; D991 E6 16                    ..
        bne     LD997                           ; D993 D0 02                    ..
        inc     $17                             ; D995 E6 17                    ..
LD997:  jsr     DO_EXEVEC                       ; D997 20 53 04                  S.
        pha                                     ; D99A 48                       H
        ldy     #$01                            ; D99B A0 01                    ..
        jsr     DO_EXEVEC                       ; D99D 20 53 04                  S.
        tay                                     ; D9A0 A8                       .
        pla                                     ; D9A1 68                       h
        php                                     ; D9A2 08                       .
        and     #$7F                            ; D9A3 29 7F                    ).
        plp                                     ; D9A5 28                       (
        bpl     LD9C1                           ; D9A6 10 19                    ..
        lsr     $F5                             ; D9A8 46 F5                    F.
        bpl     LD9C3                           ; D9AA 10 17                    ..
LD9AC:  ldx     #$02                            ; D9AC A2 02                    ..
        .byte   $4C                             ; D9AE 4C                       L
        .byte   $7E                             ; D9AF 7E                       ~
LD9B0:  .byte   $D6                             ; D9B0 D6                       .
LD9B1:  cmp     #$2A                            ; D9B1 C9 2A                    .*
        bne     LD9C3                           ; D9B3 D0 0E                    ..
        lda     #$3F                            ; D9B5 A9 3F                    .?
LD9B7:  sta     $C029,x                         ; D9B7 9D 29 C0                 .).
        inx                                     ; D9BA E8                       .
        cpx     $F2                             ; D9BB E4 F2                    ..
        .byte   $D0                             ; D9BD D0                       .
LD9BE:  sed                                     ; D9BE F8                       .
        dex                                     ; D9BF CA                       .
        rts                                     ; D9C0 60                       `

; ----------------------------------------------------------------------------
LD9C1:  inc     $F3                             ; D9C1 E6 F3                    ..
LD9C3:  cmp     #$3F                            ; D9C3 C9 3F                    .?
        beq     LD9D7                           ; D9C5 F0 10                    ..
        cmp     #$30                            ; D9C7 C9 30                    .0
        bcc     LD9AC                           ; D9C9 90 E1                    ..
        cmp     #$3A                            ; D9CB C9 3A                    .:
        bcc     LD9D7                           ; D9CD 90 08                    ..
        cmp     #$41                            ; D9CF C9 41                    .A
        bcc     LD9AC                           ; D9D1 90 D9                    ..
        cmp     #$5B                            ; D9D3 C9 5B                    .[
        bcs     LD9AC                           ; D9D5 B0 D5                    ..
LD9D7:  rts                                     ; D9D7 60                       `

; ----------------------------------------------------------------------------
        sta     $0C                             ; D9D8 85 0C                    ..
        sty     $0D                             ; D9DA 84 0D                    ..
        php                                     ; D9DC 08                       .
        pla                                     ; D9DD 68                       h
        sta     $27                             ; D9DE 85 27                    .'
        clc                                     ; D9E0 18                       .
        pla                                     ; D9E1 68                       h
LD9E2:  sta     $0E                             ; D9E2 85 0E                    ..
        adc     #$04                            ; D9E4 69 04                    i.
        tay                                     ; D9E6 A8                       .
        pla                                     ; D9E7 68                       h
        sta     $0F                             ; D9E8 85 0F                    ..
        adc     #$00                            ; D9EA 69 00                    i.
        pha                                     ; D9EC 48                       H
        tya                                     ; D9ED 98                       .
        pha                                     ; D9EE 48                       H
        ldy     #$01                            ; D9EF A0 01                    ..
        lda     SEDORIC_ATMORI                  ; D9F1 AD 24 C0                 .$.
        bpl     LD9F8                           ; D9F4 10 02                    ..
        ldy     #$03                            ; D9F6 A0 03                    ..
LD9F8:  lda     ($0E),y                         ; D9F8 B1 0E                    ..
        sta     SEDORIC_EXEVEC+1                ; D9FA 8D F0 04                 ...
        iny                                     ; D9FD C8                       .
        lda     ($0E),y                         ; D9FE B1 0E                    ..
        sta     SEDORIC_EXEVEC+2                ; DA00 8D F1 04                 ...
        ldy     $0D                             ; DA03 A4 0D                    ..
        lda     $27                             ; DA05 A5 27                    .'
        pha                                     ; DA07 48                       H
        lda     $0C                             ; DA08 A5 0C                    ..
        plp                                     ; DA0A 28                       (
        jmp     L0471                           ; DA0B 4C 71 04                 Lq.

; ----------------------------------------------------------------------------
        clc                                     ; DA0E 18                       .
        adc     #$41                            ; DA0F 69 41                    iA
        bvc     LDA2A                           ; DA11 50 17                    P.
        pha                                     ; DA13 48                       H
        lsr     a                               ; DA14 4A                       J
        lsr     a                               ; DA15 4A                       J
        lsr     a                               ; DA16 4A                       J
        lsr     a                               ; DA17 4A                       J
        jsr     LD61E                           ; DA18 20 1E D6                  ..
        pla                                     ; DA1B 68                       h
        and     #$0F                            ; DA1C 29 0F                    ).
        .byte   $C9                             ; DA1E C9                       .
LDA1F:  asl     a                               ; DA1F 0A                       .
        bcc     LDA24                           ; DA20 90 02                    ..
        adc     #$06                            ; DA22 69 06                    i.
LDA24:  clc                                     ; DA24 18                       .
        adc     #$30                            ; DA25 69 30                    i0
        bit     $20A9                           ; DA27 2C A9 20                 ,. 
LDA2A:  cmp     #$0D                            ; DA2A C9 0D                    ..
        bne     LDA34                           ; DA2C D0 06                    ..
        lda     #$00                            ; DA2E A9 00                    ..
        sta     $30                             ; DA30 85 30                    .0
        lda     #$0D                            ; DA32 A9 0D                    ..
LDA34:  jmp     LD20E                           ; DA34 4C 0E D2                 L..

; ----------------------------------------------------------------------------
        sta     $91                             ; DA37 85 91                    ..
        sty     $92                             ; DA39 84 92                    ..
        ldy     #$00                            ; DA3B A0 00                    ..
LDA3D:  lda     ($91),y                         ; DA3D B1 91                    ..
        beq     LDA47                           ; DA3F F0 06                    ..
        jsr     XAFCAR                          ; DA41 20 2A D6                  *.
        iny                                     ; DA44 C8                       .
        bne     LDA3D                           ; DA45 D0 F6                    ..
LDA47:  rts                                     ; DA47 60                       `

; ----------------------------------------------------------------------------
        ldx     #$14                            ; DA48 A2 14                    ..
        .byte   $20                             ; DA4A 20                        
        .byte   $6C                             ; DA4B 6C                       l
XPMAP:  .byte   $D3                             ; DA4C D3                       .
        lda     SEDORIC_DRIVE                   ; DA4D AD 00 C0                 ...
LDA50:  jsr     LD60E                           ; DA50 20 0E D6                  ..
        jsr     LD206                           ; DA53 20 06 D2                  ..
        ldx     #$0D                            ; DA56 A2 0D                    ..
        jsr     LD36C                           ; DA58 20 6C D3                  l.
        cli                                     ; DA5B 58                       X
        .byte   $20                             ; DA5C 20                        
; $DA5D
READ_SECTOR_TRACK:
        adc     #$D6                            ; DA5D 69 D6                    i.
        sei                                     ; DA5F 78                       x
LDA60:  php                                     ; DA60 08                       .
LDA63           := * + 2
        jsr     LD206                           ; DA61 20 06 D2                  ..
        jsr     LD206                           ; DA64 20 06 D2                  ..
        plp                                     ; DA67 28                       (
        rts                                     ; DA68 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_KEYBOARD_WAIT           ; DA69 20 02 D3                  ..
LDA6D           := * + 1
        cmp     #$1B                            ; DA6C C9 1B                    ..
        beq     LDA75                           ; DA6E F0 05                    ..
        cmp     #$0D                            ; DA70 C9 0D                    ..
        .byte   $D0                             ; DA72 D0                       .
XPRSEC: sbc     $18,x                           ; DA73 F5 18                    ..
LDA75:  rts                                     ; DA75 60                       `

; ----------------------------------------------------------------------------
        jsr     LD669                           ; DA76 20 69 D6                  i.
        bcc     LDA75                           ; DA79 90 FA                    ..
        pla                                     ; DA7B 68                       h
        pla                                     ; DA7C 68                       h
        rts                                     ; DA7D 60                       `

; ----------------------------------------------------------------------------
        inx                                     ; DA7E E8                       .
        stx     SEDORIC_IDERROR                 ; DA7F 8E FD 04                 ...
XSCAT:  jmp     (SEDORIC_ERRVEC)                ; DA82 6C 1D C0                 l..

; ----------------------------------------------------------------------------
        txa                                     ; DA85 8A                       .
        jsr     LD7DE                           ; DA86 20 DE D7                  ..
        .byte   $A5                             ; DA89 A5                       .
XSMAP:  tay                                     ; DA8A A8                       .
        ldy     $A9                             ; DA8B A4 A9                    ..
        .byte   $C0                             ; DA8D C0                       .
LDA8E:  .byte   $FF                             ; DA8E FF                       .
        bne     LDA92                           ; DA8F D0 01                    ..
LDA91:  tya                                     ; DA91 98                       .
LDA92:  sta     SEDORIC_NOLIGN                  ; DA92 8D FE 04                 ...
        sty     SEDORIC_NOLIGN+1                ; DA95 8C FF 04                 ...
        jsr     LD7F2                           ; DA98 20 F2 D7                  ..
        jsr     LD1C4                           ; DA9B 20 C4 D1                  ..
LDA9E:  cli                                     ; DA9E 58                       X
        bit     SEDORIC_FLAGERR                 ; DA9F 2C 18 C0                 ,..
        bpl     LDAC9                           ; DAA2 10 25                    .%
XSVSEC: ldx     $C023                           ; DAA4 AE 23 C0                 .#.
        txs                                     ; DAA7 9A                       .
LDAA8:  lda     $C01B                           ; DAA8 AD 1B C0                 ...
        ldy     $C01C                           ; DAAB AC 1C C0                 ...
        sta     $A8                             ; DAAE 85 A8                    ..
        sty     $A9                             ; DAB0 84 A9                    ..
        .byte   $AD                             ; DAB2 AD                       .
        .byte   $19                             ; DAB3 19                       .
LDAB4:  cpy     #$AC                            ; DAB4 C0 AC                    ..
        .byte   $1A                             ; DAB6 1A                       .
        cpy     #$85                            ; DAB7 C0 85                    ..
        sbc     #$84                            ; DAB9 E9 84                    ..
        nop                                     ; DABB EA                       .
        lda     $C01F                           ; DABC AD 1F C0                 ...
        ldy     $C020                           ; DABF AC 20 C0                 . .
        .byte   $8D                             ; DAC2 8D                       .
LDAC3:  and     ($C0,x)                         ; DAC3 21 C0                    !.
        sty     $C022                           ; DAC5 8C 22 C0                 .".
        rts                                     ; DAC8 60                       `

; ----------------------------------------------------------------------------
LDAC9:  jsr     LD30A                           ; DAC9 20 0A D3                  ..
        .byte   $AE                             ; DACC AE                       .
        .byte   $FD                             ; DACD FD                       .
LDACE:  .byte   $04                             ; DACE 04                       .
        cpx     #$04                            ; DACF E0 04                    ..
        bne     LDB06                           ; DAD1 D0 33                    .3
        .byte   $A2                             ; DAD3 A2                       .
LDAD4:  brk                                     ; DAD4 00                       .
        jsr     LD36C                           ; DAD5 20 6C D3                  l.
        lda     SEDORIC_TRACK                   ; DAD8 AD 01 C0                 ...
        jsr     XAFHEX                          ; DADB 20 13 D6                  ..
        lda     SEDORIC_type_of_error           ; DADE AD 05 C0                 ...
        and     #$F0                            ; DAE1 29 F0                    ).
        eor     #$F0                            ; DAE3 49 F0                    I.
        beq     LDAFB                           ; DAE5 F0 14                    ..
        ldx     #$01                            ; DAE7 A2 01                    ..
        jsr     LD36C                           ; DAE9 20 6C D3                  l.
        .byte   $AD                             ; DAEC AD                       .
        .byte   $02                             ; DAED 02                       .
LDAEE:  cpy     #$20                            ; DAEE C0 20                    . 
        .byte   $13                             ; DAF0 13                       .
        dec     $A2,x                           ; DAF1 D6 A2                    ..
        .byte   $03                             ; DAF3 03                       .
        lda     SEDORIC_type_of_error           ; DAF4 AD 05 C0                 ...
        and     #$20                            ; DAF7 29 20                    ) 
        beq     LDAFD                           ; DAF9 F0 02                    ..
LDAFB:  ldx     #$02                            ; DAFB A2 02                    ..
LDAFD:  .byte   $20                             ; DAFD 20                        
LDAFE:  jmp     ($ADD3)                         ; DAFE 6C D3 AD                 l..

; ----------------------------------------------------------------------------
        .byte   $17                             ; DB01 17                       .
        cpy     #$20                            ; DB02 C0 20                    . 
        .byte   $13                             ; DB04 13                       .
        .byte   $D6                             ; DB05 D6                       .
LDB06:  .byte   $AE                             ; DB06 AE                       .
LDB07:  sbc     LCA04,x                         ; DB07 FD 04 CA                 ...
        jsr     LD206                           ; DB0A 20 06 D2                  ..
        lda     #$3F                            ; DB0D A9 3F                    .?
        jsr     XAFCAR                          ; DB0F 20 2A D6                  *.
        cpx     #$1A                            ; DB12 E0 1A                    ..
        bcs     LDB1B                           ; DB14 B0 05                    ..
        jsr     LD372                           ; DB16 20 72 D3                  r.
        bmi     LDB3B                           ; DB19 30 20                    0 
LDB1B:  cpx     #$32                            ; DB1B E0 32                    .2
        bcc     LDB34                           ; DB1D 90 15                    ..
        ldx     #$10                            ; DB1F A2 10                    ..
        jsr     LD36C                           ; DB21 20 6C D3                  l.
        lda     SEDORIC_IDERROR                 ; DB24 AD FD 04                 ...
        ldy     #$00                            ; DB27 A0 00                    ..
        sty     $C04C                           ; DB29 8C 4C C0                 .L.
        .byte   $A2                             ; DB2C A2                       .
LDB2D:  ora     ($20,x)                         ; DB2D 01 20                    . 
        cli                                     ; DB2F 58                       X
XTVNM:  .byte   $D7                             ; DB30 D7                       .
        jmp     LD73B                           ; DB31 4C 3B D7                 L;.

; ----------------------------------------------------------------------------
LDB34:  txa                                     ; DB34 8A                       .
        sbc     #$19                            ; DB35 E9 19                    ..
        tax                                     ; DB37 AA                       .
        jsr     LD35C                           ; DB38 20 5C D3                  \.
LDB3B:  jmp     LD178                           ; DB3B 4C 78 D1                 Lx.

; ----------------------------------------------------------------------------
        sec                                     ; DB3E 38                       8
        bit     $18                             ; DB3F 24 18                    $.
LDB41:  php                                     ; DB41 08                       .
        lsr     BASIC11_FLG                     ; DB42 4E 6A 02                 Nj.
        plp                                     ; DB45 28                       (
        .byte   $2E                             ; DB46 2E                       .
        ror     a                               ; DB47 6A                       j
LDB48:  .byte   $02                             ; DB48 02                       .
        lda     #$01                            ; DB49 A9 01                    ..
        jmp     LD32A                           ; DB4B 4C 2A D3                 L*.

; ----------------------------------------------------------------------------
        ldx     #$00                            ; DB4E A2 00                    ..
        ldy     #$00                            ; DB50 A0 00                    ..
        bit     $03A2                           ; DB52 2C A2 03                 ,..
        bit     $02A2                           ; DB55 2C A2 02                 ,..
        .byte   $85                             ; DB58 85                       .
XTRVCA: .byte   $F3                             ; DB59 F3                       .
        sty     $F4                             ; DB5A 84 F4                    ..
        lda     #$00                            ; DB5C A9 00                    ..
        sta     $C073                           ; DB5E 8D 73 C0                 .s.
LDB61:  lda     #$FF                            ; DB61 A9 FF                    ..
        sta     $F2                             ; DB63 85 F2                    ..
LDB65:  inc     $F2                             ; DB65 E6 F2                    ..
        sec                                     ; DB67 38                       8
        lda     $F3                             ; DB68 A5 F3                    ..
        tay                                     ; DB6A A8                       .
        sbc     LCD88,x                         ; DB6B FD 88 CD                 ...
        .byte   $85                             ; DB6E 85                       .
LDB6F:  .byte   $F3                             ; DB6F F3                       .
        lda     $F4                             ; DB70 A5 F4                    ..
        pha                                     ; DB72 48                       H
        sbc     LCD8C,x                         ; DB73 FD 8C CD                 ...
        sta     $F4                             ; DB76 85 F4                    ..
        pla                                     ; DB78 68                       h
        bcs     LDB65                           ; DB79 B0 EA                    ..
        sty     $F3                             ; DB7B 84 F3                    ..
        sta     $F4                             ; DB7D 85 F4                    ..
        lda     $F2                             ; DB7F A5 F2                    ..
        beq     LDB88                           ; DB81 F0 05                    ..
        sta     $C073                           ; DB83 8D 73 C0                 .s.
        bne     LDB91                           ; DB86 D0 09                    ..
LDB88:  ldy     $C073                           ; DB88 AC 73 C0                 .s.
        bne     LDB91                           ; DB8B D0 04                    ..
        lda     $C04C                           ; DB8D AD 4C C0                 .L.
        .byte   $2C                             ; DB90 2C                       ,
LDB91:  ora     #$30                            ; DB91 09 30                    .0
        jsr     XAFCAR                          ; DB93 20 2A D6                  *.
        dex                                     ; DB96 CA                       .
        bpl     LDB61                           ; DB97 10 C8                    ..
        lda     $F3                             ; DB99 A5 F3                    ..
        jmp     LD624                           ; DB9B 4C 24 D6                 L$.

; ----------------------------------------------------------------------------
        sec                                     ; DB9E 38                       8
        bit     $18                             ; DB9F 24 18                    $.
        ror     $F2                             ; DBA1 66 F2                    f.
        ldx     #$0B                            ; DBA3 A2 0B                    ..
LDBA5:  lda     $C029,x                         ; DBA5 BD 29 C0                 .).
        cmp     #$3F                            ; DBA8 C9 3F                    .?
        beq     LDBB1                           ; DBAA F0 05                    ..
        dex                                     ; DBAC CA                       .
        bpl     LDBA5                           ; DBAD 10 F6                    ..
        sec                                     ; DBAF 38                       8
LDBB0:  rts                                     ; DBB0 60                       `

; ----------------------------------------------------------------------------
LDBB1:  rol     $F2                             ; DBB1 26 F2                    &.
        bcc     LDBB0                           ; DBB3 90 FB                    ..
        ldx     #$05                            ; DBB5 A2 05                    ..
        .byte   $2C                             ; DBB7 2C                       ,
LDBB8:  ldx     #$01                            ; DBB8 A2 01                    ..
        jmp     LD67E                           ; DBBA 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        ldy     SEDORIC_BUFNOM                  ; DBBD AC 28 C0                 .(.
XWDESC: sty     SEDORIC_DRIVE                   ; DBC0 8C 00 C0                 ...
        lda     SEDORIC_TABDRV,y                ; DBC3 B9 39 C0                 .9.
        beq     LDBB8                           ; DBC6 F0 F0                    ..
        rts                                     ; DBC8 60                       `

; ----------------------------------------------------------------------------
        ldx     #$0E                            ; DBC9 A2 0E                    ..
        bit     $10A2                           ; DBCB 2C A2 10                 ,..
        bit     $12A2                           ; DBCE 2C A2 12                 ,..
        bit     $14A2                           ; DBD1 2C A2 14                 ,..
        bit     $16A2                           ; DBD4 2C A2 16                 ,..
        bit     $06A2                           ; DBD7 2C A2 06                 ,..
        bit     $04A2                           ; DBDA 2C A2 04                 ,..
        bit     a:$A2                           ; DBDD 2C A2 00                 ,..
        bit     $0AA2                           ; DBE0 2C A2 0A                 ,..
        bit     $1EA2                           ; DBE3 2C A2 1E                 ,..
        bit     $20A2                           ; DBE6 2C A2 20                 ,. 
        bit     $22A2                           ; DBE9 2C A2 22                 ,."
        bit     $24A2                           ; DBEC 2C A2 24                 ,.$
        ldy     #$00                            ; DBEF A0 00                    ..
        bit     $02A2                           ; DBF1 2C A2 02                 ,..
        bit     $08A2                           ; DBF4 2C A2 08                 ,..
        bit     $18A2                           ; DBF7 2C A2 18                 ,..
        bit     $1AA2                           ; DBFA 2C A2 1A                 ,..
        bit     $1CA2                           ; DBFD 2C A2 1C                 ,..
        nop                                     ; DC00 EA                       .
        nop                                     ; DC01 EA                       .
        nop                                     ; DC02 EA                       .
        sta     $F2                             ; DC03 85 F2                    ..
        lda     SYS_VAR_NAMES,x                 ; DC05 BD 94 CD                 ...
        sta     $B4                             ; DC08 85 B4                    ..
        lda     LCD95,x                         ; DC0A BD 95 CD                 ...
        sta     $B5                             ; DC0D 85 B5                    ..
        tya                                     ; DC0F 98                       .
        ldy     $F2                             ; DC10 A4 F2                    ..
        jsr     LD2CA                           ; DC12 20 CA D2                  ..
        jsr     LD244                           ; DC15 20 44 D2                  D.
        tax                                     ; DC18 AA                       .
        jmp     LD2C2                           ; DC19 4C C2 D2                 L..

; ----------------------------------------------------------------------------
        inc     $16                             ; DC1C E6 16                    ..
        bne     LDC22                           ; DC1E D0 02                    ..
        inc     $17                             ; DC20 E6 17                    ..
LDC22:  ldy     #$00                            ; DC22 A0 00                    ..
        bit     SEDORIC_COMMAND_TYPE_LAUNCHED   ; DC24 2C 48 C0                 ,H.
        bvc     LDC2C                           ; DC27 50 03                    P.
        jmp     DO_EXEVEC                       ; DC29 4C 53 04                 LS.

; ----------------------------------------------------------------------------
LDC2C:  lda     ($16),y                         ; DC2C B1 16                    ..
        beq     LDC6F                           ; DC2E F0 3F                    .?
        bpl     LDC71                           ; DC30 10 3F                    .?
        bit     SEDORIC_COMMAND_TYPE_LAUNCHED   ; DC32 2C 48 C0                 ,H.
        bpl     LDC6F                           ; DC35 10 38                    .8
        and     #$7F                            ; DC37 29 7F                    ).
        rts                                     ; DC39 60                       `

; ----------------------------------------------------------------------------
        jsr     LEA1E                           ; DC3A 20 1E EA                  ..
        lda     #$08                            ; DC3D A9 08                    ..
        and     V1DRB                           ; DC3F 2D 00 03                 -..
        rts                                     ; DC42 60                       `

; ----------------------------------------------------------------------------
        sec                                     ; DC43 38                       8
        bit     $18                             ; DC44 24 18                    $.
        ror     $C04A                           ; DC46 6E 4A C0                 nJ.
        jsr     SEDORIC_KEYBOARD_WAIT           ; DC49 20 02 D3                  ..
        php                                     ; DC4C 08                       .
        sta     $C046                           ; DC4D 8D 46 C0                 .F.
        stx     $C047                           ; DC50 8E 47 C0                 .G.
        bit     $C049                           ; DC53 2C 49 C0                 ,I.
        bpl     LDC72                           ; DC56 10 1A                    ..
        bit     $C04A                           ; DC58 2C 4A C0                 ,J.
        bmi     LDC64                           ; DC5B 30 07                    0.
        cpx     #$4E                            ; DC5D E0 4E                    .N
        bcc     LDC64                           ; DC5F 90 03                    ..
        lsr     $C049                           ; DC61 4E 49 C0                 NI.
LDC64:  jsr     LD81C                           ; DC64 20 1C D8                  ..
        bpl     XLIBSE                          ; DC67 10 03                    ..
        lsr     $C049                           ; DC69 4E 49 C0                 NI.
XLIBSE: and     #$7F                            ; DC6C 29 7F                    ).
        plp                                     ; DC6E 28                       (
LDC6F:  bit     $E2                             ; DC6F 24 E2                    $.
LDC71:  rts                                     ; DC71 60                       `

; ----------------------------------------------------------------------------
LDC72:  plp                                     ; DC72 28                       (
        bpl     LDC71                           ; DC73 10 FC                    ..
        lda     #$00                            ; DC75 A9 00                    ..
        .byte   $8D                             ; DC77 8D                       .
LDC78:  .byte   $4B                             ; DC78 4B                       K
        cpy     #$8D                            ; DC79 C0 8D                    ..
        pha                                     ; DC7B 48                       H
        cpy     #$A9                            ; DC7C C0 A9                    ..
        .byte   $0E                             ; DC7E 0E                       .
        .byte   $A2                             ; DC7F A2                       .
LDC80:  .byte   $EF                             ; DC80 EF                       .
        jsr     LD322                           ; DC81 20 22 D3                  ".
        lda     #$15                            ; DC84 A9 15                    ..
        jsr     LD83A                           ; DC86 20 3A D8                  :.
LDC89:  bne     LDCC3                           ; DC89 D0 38                    .8
LDC8B:  lda     $C046                           ; DC8B AD 46 C0                 .F.
        .byte   $AE                             ; DC8E AE                       .
        .byte   $47                             ; DC8F 47                       G
LDC90:  cpy     #$2C                            ; DC90 C0 2C                    .,
        and     $10C0,x                         ; DC92 3D C0 10                 =..
        cmp     $08AD,y                         ; DC95 D9 AD 08                 ...
        .byte   $02                             ; DC98 02                       .
        ldx     #$05                            ; DC99 A2 05                    ..
LDC9B:  cmp     QWAZERTY_CONV,x                 ; DC9B DD 41 CD                 .A.
        beq     LDCAC                           ; DC9E F0 0C                    ..
        dex                                     ; DCA0 CA                       .
        bpl     LDC9B                           ; DCA1 10 F8                    ..
        lda     $C046                           ; DCA3 AD 46 C0                 .F.
LDCA6:  .byte   $AE                             ; DCA6 AE                       .
        .byte   $47                             ; DCA7 47                       G
LDCA8:  nop                                     ; DCA8 EA                       .
        jmp     LD86F                           ; DCA9 4C 6F D8                 Lo.

; ----------------------------------------------------------------------------
LDCAC:  .byte   $AD                             ; DCAC AD                       .
LDCAD:  php                                     ; DCAD 08                       .
        .byte   $02                             ; DCAE 02                       .
        pha                                     ; DCAF 48                       H
        lda     LCD47,x                         ; DCB0 BD 47 CD                 .G.
        sta     BASIC11_KEYBOARD_MATRIX         ; DCB3 8D 08 02                 ...
        jsr     LD31A                           ; DCB6 20 1A D3                  ..
        tax                                     ; DCB9 AA                       .
        pla                                     ; DCBA 68                       h
        sta     BASIC11_KEYBOARD_MATRIX         ; DCBB 8D 08 02                 ...
        txa                                     ; DCBE 8A                       .
        and     #$7F                            ; DCBF 29 7F                    ).
        bpl     LDCA6                           ; DCC1 10 E3                    ..
LDCC3:  lda     #$17                            ; DCC3 A9 17                    ..
        jsr     LD83A                           ; DCC5 20 3A D8                  :.
        bne     LDCD1                           ; DCC8 D0 07                    ..
        lda     #$14                            ; DCCA A9 14                    ..
        jsr     LD83A                           ; DCCC 20 3A D8                  :.
        beq     LDCD3                           ; DCCF F0 02                    ..
LDCD1:  lda     #$40                            ; DCD1 A9 40                    .@
LDCD3:  ora     BASIC11_KEYBOARD_MATRIX         ; DCD3 0D 08 02                 ...
LDCD6:  and     #$7F                            ; DCD6 29 7F                    ).
        tax                                     ; DCD8 AA                       .
        lda     KEYDEF,x                        ; DCD9 BD 00 C8                 ...
        tay                                     ; DCDC A8                       .
        iny                                     ; DCDD C8                       .
        bne     LDCE3                           ; DCDE D0 03                    ..
        jmp     LD963                           ; DCE0 4C 63 D9                 Lc.

; ----------------------------------------------------------------------------
LDCE3:  iny                                     ; DCE3 C8                       .
        beq     LDD52                           ; DCE4 F0 6C                    .l
        cmp     #$20                            ; DCE6 C9 20                    . 
        ror     a                               ; DCE8 6A                       j
        sta     SEDORIC_COMMAND_TYPE_LAUNCHED   ; DCE9 8D 48 C0                 .H.
        rol     a                               ; DCEC 2A                       *
        bmi     LDCF3                           ; DCED 30 04                    0.
        bcc     LDCF3                           ; DCEF 90 02                    ..
        sbc     #$20                            ; DCF1 E9 20                    . 
LDCF3:  and     #$7F                            ; DCF3 29 7F                    ).
        tax                                     ; DCF5 AA                       .
        lda     #$E9                            ; DCF6 A9 E9                    ..
        ldy     #$C0                            ; DCF8 A0 C0                    ..
        bit     SEDORIC_COMMAND_TYPE_LAUNCHED   ; DCFA 2C 48 C0                 ,H.
        bvs     LDD28                           ; DCFD 70 29                    p)
        bmi     LDD07                           ; DCFF 30 06                    0.
        lda     #$7F                            ; DD01 A9 7F                    ..
        ldy     #$C8                            ; DD03 A0 C8                    ..
        bne     LDD28                           ; DD05 D0 21                    .!
LDD07:  lda     $F2                             ; DD07 A5 F2                    ..
        pha                                     ; DD09 48                       H
        jsr     LEA30                           ; DD0A 20 30 EA                  0.
        .byte   $A0                             ; DD0D A0                       .
LDD0E:  brk                                     ; DD0E 00                       .
LDD0F:  lda     LCBBD,y                         ; DD0F B9 BD CB                 ...
        inx                                     ; DD12 E8                       .
        iny                                     ; DD13 C8                       .
        iny                                     ; DD14 C8                       .
XDETSE: iny                                     ; DD15 C8                       .
        iny                                     ; DD16 C8                       .
        cmp     $F2                             ; DD17 C5 F2                    ..
        bcc     LDD0F                           ; DD19 90 F4                    ..
        stx     $C04B                           ; DD1B 8E 4B C0                 .K.
        ldx     $F2                             ; DD1E A6 F2                    ..
        dex                                     ; DD20 CA                       .
        pla                                     ; DD21 68                       h
        sta     $F2                             ; DD22 85 F2                    ..
        lda     #$DD                            ; DD24 A9 DD                    ..
        ldy     #$C9                            ; DD26 A0 C9                    ..
LDD28:  sta     $16                             ; DD28 85 16                    ..
        sty     $17                             ; DD2A 84 17                    ..
LDD2C:  dex                                     ; DD2C CA                       .
XCREAY: bmi     LDD36                           ; DD2D 30 07                    0.
LDD2F:  jsr     LD81C                           ; DD2F 20 1C D8                  ..
        bpl     LDD2F                           ; DD32 10 FB                    ..
        bmi     LDD2C                           ; DD34 30 F6                    0.
LDD36:  jsr     LD81C                           ; DD36 20 1C D8                  ..
        cmp     #$20                            ; DD39 C9 20                    . 
        beq     LDD36                           ; DD3B F0 F9                    ..
        lda     $16                             ; DD3D A5 16                    ..
        bne     LDD43                           ; DD3F D0 02                    ..
        dec     $17                             ; DD41 C6 17                    ..
LDD43:  dec     $16                             ; DD43 C6 16                    ..
        lda     $C04B                           ; DD45 AD 4B C0                 .K.
LDD48:  sec                                     ; DD48 38                       8
LDD49:  .byte   $6E                             ; DD49 6E                       n
CMD_SAVEM:
        eor     #$C0                            ; DD4A 49 C0                    I.
LDD4C:  .byte   $AE                             ; DD4C AE                       .
CMD_SAVEU:
        .byte   $47                             ; DD4D 47                       G
        .byte   $C0                             ; DD4E C0                       .
LDD4F:  .byte   $4C                             ; DD4F 4C                       L
CMD_SAVE:
        .byte   $6F                             ; DD50 6F                       o
        cld                                     ; DD51 D8                       .
LDD52:  .byte   $A9                             ; DD52 A9                       .
CMD_SAVEO:
        .byte   $7F                             ; DD53 7F                       .
        bit     $C04A                           ; DD54 2C 4A C0                 ,J.
        bmi     LDD4C                           ; DD57 30 F3                    0.
        ldx     $C047                           ; DD59 AE 47 C0                 .G.
        beq     LDD4C                           ; DD5C F0 EE                    ..
        dex                                     ; DD5E CA                       .
        lda     #$08                            ; DD5F A9 08                    ..
        bne     LDD4F                           ; DD61 D0 EC                    ..
        ldy     $C042                           ; DD63 AC 42 C0                 .B.
        lda     $C043                           ; DD66 AD 43 C0                 .C.
        jsr     LD2CA                           ; DD69 20 CA D2                  ..
        jsr     LD2D2                           ; DD6C 20 D2 D2                  ..
        ldx     #$00                            ; DD6F A2 00                    ..
        stx     $17                             ; DD71 86 17                    ..
        dex                                     ; DD73 CA                       .
        stx     $16                             ; DD74 86 16                    ..
LDD76:  inx                                     ; DD76 E8                       .
        lda     STACK+1,x                       ; DD77 BD 01 01                 ...
        bne     LDD76                           ; DD7A D0 FA                    ..
        sta     STACK+2,x                       ; DD7C 9D 02 01                 ...
        txa                                     ; DD7F 8A                       .
        pha                                     ; DD80 48                       H
        lda     $C042                           ; DD81 AD 42 C0                 .B.
        ldy     $C043                           ; DD84 AC 43 C0                 .C.
        sta     $33                             ; DD87 85 33                    .3
        sty     $34                             ; DD89 84 34                    .4
        jsr     LD19C                           ; DD8B 20 9C D1                  ..
        pla                                     ; DD8E 68                       h
        tax                                     ; DD8F AA                       .
        lda     #$20                            ; DD90 A9 20                    . 
        bcc     LDD96                           ; DD92 90 02                    ..
        lda     #$2A                            ; DD94 A9 2A                    .*
LDD96:  sta     STACK+1,x                       ; DD96 9D 01 01                 ...
        clc                                     ; DD99 18                       .
        lda     $C044                           ; DD9A AD 44 C0                 .D.
        adc     $C042                           ; DD9D 6D 42 C0                 mB.
        sta     $C042                           ; DDA0 8D 42 C0                 .B.
        lda     $C045                           ; DDA3 AD 45 C0                 .E.
        adc     $C043                           ; DDA6 6D 43 C0                 mC.
        sta     $C043                           ; DDA9 8D 43 C0                 .C.
        lda     #$0D                            ; DDAC A9 0D                    ..
        bne     LDD48                           ; DDAE D0 98                    ..
        lda     #$00                            ; DDB0 A9 00                    ..
        sta     LE7D1                           ; DDB2 8D D1 E7                 ...
        sta     LE7D2                           ; DDB5 8D D2 E7                 ...
        sta     LE7D3                           ; DDB8 8D D3 E7                 ...
        jsr     LE55C                           ; DDBB 20 5C E5                  \.
        jsr     LDA63                           ; DDBE 20 63 DA                  c.
        ldx     #$10                            ; DDC1 A2 10                    ..
        cpx     $C302                           ; DDC3 EC 02 C3                 ...
        beq     LDDEC                           ; DDC6 F0 24                    .$
        lda     $C302                           ; DDC8 AD 02 C3                 ...
        sec                                     ; DDCB 38                       8
LDDCC:  .byte   $E9                             ; DDCC E9                       .
CMD_KEYSAVE:
        bpl     LDE19                           ; DDCD 10 4A                    .J
        lsr     a                               ; DDCF 4A                       J
        lsr     a                               ; DDD0 4A                       J
        lsr     a                               ; DDD1 4A                       J
        clc                                     ; DDD2 18                       .
        adc     LE7D1                           ; DDD3 6D D1 E7                 m..
        bcc     LDDDB                           ; DDD6 90 03                    ..
        inc     LE7D2                           ; DDD8 EE D2 E7                 ...
LDDDB:  sta     LE7D1                           ; DDDB 8D D1 E7                 ...
        .byte   $EE                             ; DDDE EE                       .
LDDDF:  .byte   $D3                             ; DDDF D3                       .
CMD_ESAVE:
        .byte   $E7                             ; DDE0 E7                       .
        lda     SEDORIC_BUF3                    ; DDE1 AD 00 C3                 ...
        ldy     $C301                           ; DDE4 AC 01 C3                 ...
        beq     LDDEC                           ; DDE7 F0 03                    ..
        jmp     LD9BE                           ; DDE9 4C BE D9                 L..

; ----------------------------------------------------------------------------
LDDEC:  jsr     LDB2D                           ; DDEC 20 2D DB                  -.
        rts                                     ; DDEF 60                       `

; ----------------------------------------------------------------------------
        lda     LE7D3                           ; DDF0 AD D3 E7                 ...
        sta     SEDORIC_BUF2+8                  ; DDF3 8D 08 C2                 ...
        lda     LE7D1                           ; DDF6 AD D1 E7                 ...
        ldx     LE7D2                           ; DDF9 AE D2 E7                 ...
        rts                                     ; DDFC 60                       `

; ----------------------------------------------------------------------------
        dec     SEDORIC_BUF2+8                  ; DDFD CE 08 C2                 ...
LDE00:  dec     LE7D3                           ; DE00 CE D3 E7                 ...
        rts                                     ; DE03 60                       `

; ----------------------------------------------------------------------------
        lda     LE7D4                           ; DE04 AD D4 E7                 ...
        bne     LDE16                           ; DE07 D0 0D                    ..
        .byte   $AD                             ; DE09 AD                       .
        .byte   $D3                             ; DE0A D3                       .
LDE0B:  .byte   $E7                             ; DE0B E7                       .
        sta     SEDORIC_BUF2+8                  ; DE0C 8D 08 C2                 ...
        lda     LE7D1                           ; DE0F AD D1 E7                 ...
        ldx     LE7D2                           ; DE12 AE D2 E7                 ...
        rts                                     ; DE15 60                       `

; ----------------------------------------------------------------------------
LDE16:  lda     SEDORIC_BUF2+4                  ; DE16 AD 04 C2                 ...
LDE19:  ldx     SEDORIC_BUF2+5                  ; DE19 AE 05 C2                 ...
        rts                                     ; DE1C 60                       `

; ----------------------------------------------------------------------------
        nop                                     ; DE1D EA                       .
        nop                                     ; DE1E EA                       .
        nop                                     ; DE1F EA                       .
LDE20:  jsr     LD27F                           ; DE20 20 7F D2                  ..
LDE23:  php                                     ; DE23 08                       .
        sei                                     ; DE24 78                       x
        txa                                     ; DE25 8A                       .
        pha                                     ; DE26 48                       H
        lsr     a                               ; DE27 4A                       J
LDE28:  lsr     a                               ; DE28 4A                       J
        lsr     a                               ; DE29 4A                       J
        and     #$07                            ; DE2A 29 07                    ).
        tax                                     ; DE2C AA                       .
        clc                                     ; DE2D 18                       .
        lda     #$FF                            ; DE2E A9 FF                    ..
LDE30:  rol     a                               ; DE30 2A                       *
        dex                                     ; DE31 CA                       .
        bpl     LDE30                           ; DE32 10 FC                    ..
        tax                                     ; DE34 AA                       .
        lda     #$0E                            ; DE35 A9 0E                    ..
        jsr     LD322                           ; DE37 20 22 D3                  ".
        pla                                     ; DE3A 68                       h
        and     #$07                            ; DE3B 29 07                    ).
        ora     #$B8                            ; DE3D 09 B8                    ..
        jsr     LD83A                           ; DE3F 20 3A D8                  :.
        sta     $D0                             ; DE42 85 D0                    ..
        plp                                     ; DE44 28                       (
        jsr     LD1EB                           ; DE45 20 EB D1                  ..
        lsr     SEDORIC_FLAGIF                  ; DE48 4E FC 04                 N..
        rts                                     ; DE4B 60                       `

; ----------------------------------------------------------------------------
LDE4C:  .byte   $20                             ; DE4C 20                        
CMD_CREATEW:
        rol     LEAE6                           ; DE4D 2E E6 EA                 ...
        jsr     LDA60                           ; DE50 20 60 DA                  `.
LDE53:  ldx     SEDORIC_BUF2                    ; DE53 AE 00 C2                 ...
        inx                                     ; DE56 E8                       .
        beq     LDECD                           ; DE57 F0 74                    .t
        ldx     #$0A                            ; DE59 A2 0A                    ..
        bne     LDE7F                           ; DE5B D0 22                    ."
        ldx     #$C1                            ; DE5D A2 C1                    ..
        bit     SEDORIC_BUF2+162                ; DE5F 2C A2 C2                 ,..
        bit     $C3A2                           ; DE62 2C A2 C3                 ,..
        stx     $C004                           ; DE65 8E 04 C0                 ...
        ldx     #$00                            ; DE68 A2 00                    ..
        stx     SEDORIC_RWBUF                   ; DE6A 8E 03 C0                 ...
        sta     SEDORIC_TRACK                   ; DE6D 8D 01 C0                 ...
        sty     SEDORIC_SECTOR                  ; DE70 8C 02 C0                 ...
        ldx     #$88                            ; DE73 A2 88                    ..
LDE75:  jsr     XRWTS                           ; DE75 20 CD CF                  ..
        beq     LDECD                           ; DE78 F0 53                    .S
        .byte   $A2                             ; DE7A A2                       .
LDE7B:  .byte   $03                             ; DE7B 03                       .
        bvc     LDE7F                           ; DE7C 50 01                    P.
        inx                                     ; DE7E E8                       .
LDE7F:  jmp     LD67E                           ; DE7F 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        lda     $C025                           ; DE82 AD 25 C0                 .%.
        ldy     $C026                           ; DE85 AC 26 C0                 .&.
        bne     LDE94                           ; DE88 D0 0A                    ..
        jmp     LDC80                           ; DE8A 4C 80 DC                 L..

; ----------------------------------------------------------------------------
        nop                                     ; DE8D EA                       .
        ldx     #$C2                            ; DE8E A2 C2                    ..
        bit     SEDORIC_BUF1+162                ; DE90 2C A2 C1                 ,..
        .byte   $2C                             ; DE93 2C                       ,
LDE94:  ldx     #$C3                            ; DE94 A2 C3                    ..
        stx     $C004                           ; DE96 8E 04 C0                 ...
        ldx     #$00                            ; DE99 A2 00                    ..
        .byte   $8E                             ; DE9B 8E                       .
LDE9C:  .byte   $03                             ; DE9C 03                       .
        cpy     #$8D                            ; DE9D C0 8D                    ..
        ora     ($C0,x)                         ; DE9F 01 C0                    ..
        sty     SEDORIC_SECTOR                  ; DEA1 8C 02 C0                 ...
LDEA4:  ldx     #$A8                            ; DEA4 A2 A8                    ..
        bne     LDE75                           ; DEA6 D0 CD                    ..
        lda     #$00                            ; DEA8 A9 00                    ..
        ldy     #$C1                            ; DEAA A0 C1                    ..
        sta     SEDORIC_RWBUF                   ; DEAC 8D 03 C0                 ...
        sty     $C004                           ; DEAF 8C 04 C0                 ...
        bne     LDEA4                           ; DEB2 D0 F0                    ..
        ldx     $C027                           ; DEB4 AE 27 C0                 .'.
        ldy     #$08                            ; DEB7 A0 08                    ..
        jsr     LDAC3                           ; DEB9 20 C3 DA                  ..
        lda     #$2E                            ; DEBC A9 2E                    ..
        jsr     XAFCAR                          ; DEBE 20 2A D6                  *.
        ldy     #$02                            ; DEC1 A0 02                    ..
LDEC3:  lda     SEDORIC_BUF3,x                  ; DEC3 BD 00 C3                 ...
        jsr     XAFCAR                          ; DEC6 20 2A D6                  *.
        inx                                     ; DEC9 E8                       .
        dey                                     ; DECA 88                       .
        bpl     LDEC3                           ; DECB 10 F6                    ..
LDECD:  rts                                     ; DECD 60                       `

; ----------------------------------------------------------------------------
        lda     #$C1                            ; DECE A9 C1                    ..
        bit     SEDORIC_BUF2+169                ; DED0 2C A9 C2                 ,..
        bit     $C3A9                           ; DED3 2C A9 C3                 ,..
        sta     $0F                             ; DED6 85 0F                    ..
        lda     #$00                            ; DED8 A9 00                    ..
        sta     $0E                             ; DEDA 85 0E                    ..
        ldy     #$00                            ; DEDC A0 00                    ..
        tya                                     ; DEDE 98                       .
LDEDF:  sta     ($0E),y                         ; DEDF 91 0E                    ..
        iny                                     ; DEE1 C8                       .
        bne     LDEDF                           ; DEE2 D0 FB                    ..
        rts                                     ; DEE4 60                       `

; ----------------------------------------------------------------------------
        lda     $C025                           ; DEE5 AD 25 C0                 .%.
        ldy     $C026                           ; DEE8 AC 26 C0                 .&.
        jsr     LDA63                           ; DEEB 20 63 DA                  c.
        ldx     $C027                           ; DEEE AE 27 C0                 .'.
        ldy     #$F0                            ; DEF1 A0 F0                    ..
LDEF3:  lda     $BF39,y                         ; DEF3 B9 39 BF                 .9.
        sta     SEDORIC_BUF3,x                  ; DEF6 9D 00 C3                 ...
        inx                                     ; DEF9 E8                       .
        iny                                     ; DEFA C8                       .
        bne     LDEF3                           ; DEFB D0 F6                    ..
        rts                                     ; DEFD 60                       `

; ----------------------------------------------------------------------------
        lda     $C025                           ; DEFE AD 25 C0                 .%.
        ldy     $C026                           ; DF01 AC 26 C0                 .&.
        jsr     LDA63                           ; DF04 20 63 DA                  c.
        ldx     $C027                           ; DF07 AE 27 C0                 .'.
        ldy     #$F0                            ; DF0A A0 F0                    ..
LDF0C:  lda     SEDORIC_BUF3,x                  ; DF0C BD 00 C3                 ...
        .byte   $99                             ; DF0F 99                       .
        .byte   $39                             ; DF10 39                       9
LDF11:  .byte   $BF                             ; DF11 BF                       .
        inx                                     ; DF12 E8                       .
        iny                                     ; DF13 C8                       .
        bne     LDF0C                           ; DF14 D0 F6                    ..
        rts                                     ; DF16 60                       `

; ----------------------------------------------------------------------------
LDF17:  ldy     #$F4                            ; DF17 A0 F4                    ..
LDF19:  .byte   $B9                             ; DF19 B9                       .
        .byte   $35                             ; DF1A 35                       5
LDF1B:  .byte   $BF                             ; DF1B BF                       .
        cmp     #$3F                            ; DF1C C9 3F                    .?
        beq     LDF25                           ; DF1E F0 05                    ..
        cmp     SEDORIC_BUF3,x                  ; DF20 DD 00 C3                 ...
        bne     LDF41                           ; DF23 D0 1C                    ..
LDF25:  inx                                     ; DF25 E8                       .
        iny                                     ; DF26 C8                       .
        bne     LDF19                           ; DF27 D0 F0                    ..
        ldx     $C027                           ; DF29 AE 27 C0                 .'.
        rts                                     ; DF2C 60                       `

; ----------------------------------------------------------------------------
        jsr     XPMAP                           ; DF2D 20 4C DA                  L.
        jsr     CMD_REN                         ; DF30 20 37 E5                  7.
        nop                                     ; DF33 EA                       .
LDF34:  sta     $C025                           ; DF34 8D 25 C0                 .%.
        sty     $C026                           ; DF37 8C 26 C0                 .&.
        jsr     LDA63                           ; DF3A 20 63 DA                  c.
        ldx     #$10                            ; DF3D A2 10                    ..
        bne     LDF48                           ; DF3F D0 07                    ..
LDF41:  lda     $C027                           ; DF41 AD 27 C0                 .'.
        clc                                     ; DF44 18                       .
        adc     #$10                            ; DF45 69 10                    i.
        tax                                     ; DF47 AA                       .
LDF48:  stx     $C027                           ; DF48 8E 27 C0                 .'.
        cpx     $C302                           ; DF4B EC 02 C3                 ...
        bne     LDF17                           ; DF4E D0 C7                    ..
        lda     SEDORIC_BUF3                    ; DF50 AD 00 C3                 ...
        ldy     $C301                           ; DF53 AC 01 C3                 ...
        bne     LDF34                           ; DF56 D0 DC                    ..
        rts                                     ; DF58 60                       `

; ----------------------------------------------------------------------------
        jsr     LDBA5                           ; DF59 20 A5 DB                  ..
        bne     LDF92                           ; DF5C D0 34                    .4
        jmp     LDB6F                           ; DF5E 4C 6F DB                 Lo.

; ----------------------------------------------------------------------------
        dec     SEDORIC_BUF2+8                  ; DF61 CE 08 C2                 ...
        dec     LE7D3                           ; DF64 CE D3 E7                 ...
        rts                                     ; DF67 60                       `

; ----------------------------------------------------------------------------
        .byte   $C2                             ; DF68 C2                       .
        sta     SEDORIC_BUF2+8                  ; DF69 8D 08 C2                 ...
        jmp     CMD_REN                         ; DF6C 4C 37 E5                 L7.

; ----------------------------------------------------------------------------
        jsr     XLIBSE                          ; DF6F 20 6C DC                  l.
        sta     SEDORIC_BUF3                    ; DF72 8D 00 C3                 ...
        sty     $C301                           ; DF75 8C 01 C3                 ...
        inc     SEDORIC_BUF2+8                  ; DF78 EE 08 C2                 ...
        jsr     XSMAP                           ; DF7B 20 8A DA                  ..
        jsr     XSCAT                           ; DF7E 20 82 DA                  ..
        lda     SEDORIC_BUF3                    ; DF81 AD 00 C3                 ...
        ldy     $C301                           ; DF84 AC 01 C3                 ...
        sta     $C025                           ; DF87 8D 25 C0                 .%.
        sty     $C026                           ; DF8A 8C 26 C0                 .&.
        jsr     LDAD4                           ; DF8D 20 D4 DA                  ..
        ldx     #$10                            ; DF90 A2 10                    ..
LDF92:  txa                                     ; DF92 8A                       .
        stx     $C027                           ; DF93 8E 27 C0                 .'.
        clc                                     ; DF96 18                       .
        adc     #$10                            ; DF97 69 10                    i.
        sta     $C302                           ; DF99 8D 02 C3                 ...
        inc     SEDORIC_BUF2+4                  ; DF9C EE 04 C2                 ...
        bne     LDFBF                           ; DF9F D0 1E                    ..
        inc     SEDORIC_BUF2+5                  ; DFA1 EE 05 C2                 ...
        rts                                     ; DFA4 60                       `

; ----------------------------------------------------------------------------
        jsr     CMD_REN                         ; DFA5 20 37 E5                  7.
        nop                                     ; DFA8 EA                       .
LDFA9:  sta     $C025                           ; DFA9 8D 25 C0                 .%.
        sty     $C026                           ; DFAC 8C 26 C0                 .&.
        jsr     LDA63                           ; DFAF 20 63 DA                  c.
        ldx     $C302                           ; DFB2 AE 02 C3                 ...
        bne     LDFBF                           ; DFB5 D0 08                    ..
        lda     SEDORIC_BUF3                    ; DFB7 AD 00 C3                 ...
        ldy     $C301                           ; DFBA AC 01 C3                 ...
        bne     LDFA9                           ; DFBD D0 EA                    ..
LDFBF:  rts                                     ; DFBF 60                       `

; ----------------------------------------------------------------------------
        sta     $C058                           ; DFC0 8D 58 C0                 .X.
        sty     $C059                           ; DFC3 8C 59 C0                 .Y.
        sta     $C05A                           ; DFC6 8D 5A C0                 .Z.
        sty     $C05B                           ; DFC9 8C 5B C0                 .[.
        jsr     LDACE                           ; DFCC 20 CE DA                  ..
        ldx     #$01                            ; DFCF A2 01                    ..
        stx     $C05E                           ; DFD1 8E 5E C0                 .^.
LDFD4:  jsr     XLIBSE                          ; DFD4 20 6C DC                  l.
        sta     $C05C                           ; DFD7 8D 5C C0                 .\.
        sty     $C05D                           ; DFDA 8C 5D C0                 .].
        .byte   $8D                             ; DFDD 8D                       .
LDFDE:  ora     ($C0,x)                         ; DFDE 01 C0                    ..
        sty     SEDORIC_SECTOR                  ; DFE0 8C 02 C0                 ...
        ldx     #$08                            ; DFE3 A2 08                    ..
LDFE5:  .byte   $BD                             ; DFE5 BD                       .
LDFE6:  eor     ($C0),y                         ; DFE6 51 C0                    Q.
        sta     SEDORIC_BUF1+3,x                ; DFE8 9D 03 C1                 ...
        dex                                     ; DFEB CA                       .
        bpl     LDFE5                           ; DFEC 10 F7                    ..
        stx     SEDORIC_BUF1+2                  ; DFEE 8E 02 C1                 ...
        ldx     #$0C                            ; DFF1 A2 0C                    ..
LDFF3:  stx     $C05F                           ; DFF3 8E 5F C0                 ._.
LDFF6:  .byte   $AD                             ; DFF6 AD                       .
CMD_LOAD:
        cli                                     ; DFF7 58                       X
        .byte   $C0                             ; DFF8 C0                       .
LDFF9:  ora     $C059                           ; DFF9 0D 59 C0                 .Y.
        beq     LE056                           ; DFFC F0 58                    .X
        lda     $C058                           ; DFFE AD 58 C0                 .X.
        bne     LE006                           ; E001 D0 03                    ..
        dec     $C059                           ; E003 CE 59 C0                 .Y.
LE006:  dec     $C058                           ; E006 CE 58 C0                 .X.
        jsr     XLIBSE                          ; E009 20 6C DC                  l.
        ldx     $C05F                           ; E00C AE 5F C0                 ._.
        sta     SEDORIC_BUF1,x                  ; E00F 9D 00 C1                 ...
        inx                                     ; E012 E8                       .
        tya                                     ; E013 98                       .
        sta     SEDORIC_BUF1,x                  ; E014 9D 00 C1                 ...
        inx                                     ; E017 E8                       .
        bne     LDFF3                           ; E018 D0 D9                    ..
        lda     $C058                           ; E01A AD 58 C0                 .X.
        ora     $C059                           ; E01D 0D 59 C0                 .Y.
        beq     LE056                           ; E020 F0 34                    .4
        ldy     SEDORIC_BUF1+1                  ; E022 AC 01 C1                 ...
        bne     LE043                           ; E025 D0 1C                    ..
        jsr     XLIBSE                          ; E027 20 6C DC                  l.
        sta     SEDORIC_BUF1                    ; E02A 8D 00 C1                 ...
        pha                                     ; E02D 48                       H
        sty     SEDORIC_BUF1+1                  ; E02E 8C 01 C1                 ...
        tya                                     ; E031 98                       .
        pha                                     ; E032 48                       H
        jsr     LDAA8                           ; E033 20 A8 DA                  ..
        pla                                     ; E036 68                       h
        sta     SEDORIC_SECTOR                  ; E037 8D 02 C0                 ...
        pla                                     ; E03A 68                       h
        sta     SEDORIC_TRACK                   ; E03B 8D 01 C0                 ...
        inc     $C05E                           ; E03E EE 5E C0                 .^.
        bne     LE04F                           ; E041 D0 0C                    ..
LE043:  jsr     LDAA8                           ; E043 20 A8 DA                  ..
        lda     SEDORIC_BUF1                    ; E046 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; E049 AC 01 C1                 ...
        jsr     READ_SECTOR_TRACK               ; E04C 20 5D DA                  ].
LE04F:  jsr     LDACE                           ; E04F 20 CE DA                  ..
        ldx     #$02                            ; E052 A2 02                    ..
        bne     LDFF3                           ; E054 D0 9D                    ..
LE056:  lda     #$00                            ; E056 A9 00                    ..
        sta     SEDORIC_BUF1                    ; E058 8D 00 C1                 ...
        sta     SEDORIC_BUF1+1                  ; E05B 8D 01 C1                 ...
        jsr     LDAA8                           ; E05E 20 A8 DA                  ..
        lda     $C05C                           ; E061 AD 5C C0                 .\.
        ldy     $C05D                           ; E064 AC 5D C0                 .].
        jmp     READ_SECTOR_TRACK               ; E067 4C 5D DA                 L].

; ----------------------------------------------------------------------------
        clc                                     ; E06A 18                       .
        bit     $38                             ; E06B 24 38                    $8
        lda     SEDORIC_BUF2+2                  ; E06D AD 02 C2                 ...
        tax                                     ; E070 AA                       .
        ora     SEDORIC_BUF2+3                  ; E071 0D 03 C2                 ...
        bne     LE07D                           ; E074 D0 07                    ..
        bcc     LE0D4                           ; E076 90 5C                    .\
        ldx     #$07                            ; E078 A2 07                    ..
        jmp     LD67E                           ; E07A 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LE07D:  jmp     LE67F                           ; E07D 4C 7F E6                 L..

; ----------------------------------------------------------------------------
        bit     $2F                             ; E080 24 2F                    $/
        bpl     LE089                           ; E082 10 05                    ..
        php                                     ; E084 08                       .
        jsr     LE63A                           ; E085 20 3A E6                  :.
        plp                                     ; E088 28                       (
LE089:  ldy     #$02                            ; E089 A0 02                    ..
        lda     #$14                            ; E08B A9 14                    ..
        jmp     LDA8E                           ; E08D 4C 8E DA                 L..

; ----------------------------------------------------------------------------
        lda     #$01                            ; E090 A9 01                    ..
        ldy     #$00                            ; E092 A0 00                    ..
LE094:  pha                                     ; E094 48                       H
        and     SEDORIC_BUF2+16,x               ; E095 3D 10 C2                 =..
        bne     LE09F                           ; E098 D0 05                    ..
        pla                                     ; E09A 68                       h
        asl     a                               ; E09B 0A                       .
        iny                                     ; E09C C8                       .
        bne     LE094                           ; E09D D0 F5                    ..
LE09F:  pla                                     ; E09F 68                       h
        eor     #$FF                            ; E0A0 49 FF                    I.
        and     SEDORIC_BUF2+16,x               ; E0A2 3D 10 C2                 =..
        sta     SEDORIC_BUF2+16,x               ; E0A5 9D 10 C2                 ...
        lda     #$00                            ; E0A8 A9 00                    ..
        sta     $F3                             ; E0AA 85 F3                    ..
        txa                                     ; E0AC 8A                       .
        asl     a                               ; E0AD 0A                       .
LE0AE:  .byte   $26                             ; E0AE 26                       &
CMD_OLD:.byte   $F3                             ; E0AF F3                       .
        asl     a                               ; E0B0 0A                       .
        rol     $F3                             ; E0B1 26 F3                    &.
        asl     a                               ; E0B3 0A                       .
LE0B4:  rol     $F3                             ; E0B4 26 F3                    &.
        sta     $F2                             ; E0B6 85 F2                    ..
        tya                                     ; E0B8 98                       .
        ora     $F2                             ; E0B9 05 F2                    ..
        ldx     #$FF                            ; E0BB A2 FF                    ..
LE0BD:  sec                                     ; E0BD 38                       8
        inx                                     ; E0BE E8                       .
        tay                                     ; E0BF A8                       .
        sbc     SEDORIC_BUF2+7                  ; E0C0 ED 07 C2                 ...
        bcs     LE0BD                           ; E0C3 B0 F8                    ..
        dec     $F3                             ; E0C5 C6 F3                    ..
        bpl     LE0BD                           ; E0C7 10 F4                    ..
        txa                                     ; E0C9 8A                       .
        cpx     SEDORIC_BUF2+6                  ; E0CA EC 06 C2                 ...
        bcc     LE0D4                           ; E0CD 90 05                    ..
        sbc     SEDORIC_BUF2+6                  ; E0CF ED 06 C2                 ...
        ora     #$80                            ; E0D2 09 80                    ..
LE0D4:  iny                                     ; E0D4 C8                       .
        rts                                     ; E0D5 60                       `

; ----------------------------------------------------------------------------
        dey                                     ; E0D6 88                       .
        tax                                     ; E0D7 AA                       .
        bpl     LE0E0                           ; E0D8 10 06                    ..
        and     #$7F                            ; E0DA 29 7F                    ).
        clc                                     ; E0DC 18                       .
LE0DD:  adc     SEDORIC_BUF2+6                  ; E0DD 6D 06 C2                 m..
LE0E0:  tax                                     ; E0E0 AA                       .
        lda     #$00                            ; E0E1 A9 00                    ..
        sta     $F3                             ; E0E3 85 F3                    ..
LE0E5:  cpx     #$00                            ; E0E5 E0 00                    ..
        beq     LE0F4                           ; E0E7 F0 0B                    ..
LE0E9:  clc                                     ; E0E9 18                       .
LE0EA:  adc     SEDORIC_BUF2+7                  ; E0EA 6D 07 C2                 m..
        bcc     LE0F1                           ; E0ED 90 02                    ..
        inc     $F3                             ; E0EF E6 F3                    ..
LE0F1:  dex                                     ; E0F1 CA                       .
        bne     LE0E9                           ; E0F2 D0 F5                    ..
LE0F4:  sta     $F2                             ; E0F4 85 F2                    ..
        clc                                     ; E0F6 18                       .
        tya                                     ; E0F7 98                       .
        adc     $F2                             ; E0F8 65 F2                    e.
LE0FA:  bcc     LE0FE                           ; E0FA 90 02                    ..
        inc     $F3                             ; E0FC E6 F3                    ..
LE0FE:  pha                                     ; E0FE 48                       H
        and     #$07                            ; E0FF 29 07                    ).
        tay                                     ; E101 A8                       .
        pla                                     ; E102 68                       h
        lsr     $F3                             ; E103 46 F3                    F.
        ror     a                               ; E105 6A                       j
        lsr     $F3                             ; E106 46 F3                    F.
        ror     a                               ; E108 6A                       j
        lsr     $F3                             ; E109 46 F3                    F.
        jmp     LE6C4                           ; E10B 4C C4 E6                 L..

; ----------------------------------------------------------------------------
        lda     #$00                            ; E10E A9 00                    ..
LE110:  rol     a                               ; E110 2A                       *
        dey                                     ; E111 88                       .
        bpl     LE110                           ; E112 10 FC                    ..
        rts                                     ; E114 60                       `

; ----------------------------------------------------------------------------
        jsr     LDCD6                           ; E115 20 D6 DC                  ..
        ora     SEDORIC_BUF2+16,x               ; E118 1D 10 C2                 ...
        cmp     SEDORIC_BUF2+16,x               ; E11B DD 10 C2                 ...
        beq     LE12C                           ; E11E F0 0C                    ..
        sta     SEDORIC_BUF2+16,x               ; E120 9D 10 C2                 ...
        inc     SEDORIC_BUF2+2                  ; E123 EE 02 C2                 ...
        bne     LE12C                           ; E126 D0 04                    ..
        inc     SEDORIC_BUF2+3                  ; E128 EE 03 C2                 ...
        clc                                     ; E12B 18                       .
LE12C:  rts                                     ; E12C 60                       `

; ----------------------------------------------------------------------------
        jsr     LDCD6                           ; E12D 20 D6 DC                  ..
        eor     #$FF                            ; E130 49 FF                    I.
        and     SEDORIC_BUF2+16,x               ; E132 3D 10 C2                 =..
        cmp     SEDORIC_BUF2+16,x               ; E135 DD 10 C2                 ...
        beq     LE12C                           ; E138 F0 F2                    ..
        sta     SEDORIC_BUF2+16,x               ; E13A 9D 10 C2                 ...
        lda     SEDORIC_BUF2+2                  ; E13D AD 02 C2                 ...
        bne     LE145                           ; E140 D0 03                    ..
        dec     SEDORIC_BUF2+3                  ; E142 CE 03 C2                 ...
LE145:  dec     SEDORIC_BUF2+2                  ; E145 CE 02 C2                 ...
        clc                                     ; E148 18                       .
        rts                                     ; E149 60                       `

; ----------------------------------------------------------------------------
        lda     #$40                            ; E14A A9 40                    .@
        bit     $C0A9                           ; E14C 2C A9 C0                 ,..
        bit     $80A9                           ; E14F 2C A9 80                 ,..
        bit     a:$A9                           ; E152 2C A9 00                 ,..
        jsr     LDE28                           ; E155 20 28 DE                  (.
        jsr     LD44F                           ; E158 20 4F D4                  O.
        jsr     LD79E                           ; E15B 20 9E D7                  ..
LE15E:  jsr     LD39E                           ; E15E 20 9E D3                  ..
        bne     LE166                           ; E161 D0 03                    ..
        jmp     LDE0B                           ; E163 4C 0B DE                 L..

; ----------------------------------------------------------------------------
LE166:  jsr     LD22C                           ; E166 20 2C D2                  ,.
        cmp     #$54                            ; E169 C9 54                    .T
        bne     LE189                           ; E16B D0 1C                    ..
        jsr     LD398                           ; E16D 20 98 D3                  ..
        jsr     LD2FA                           ; E170 20 FA D2                  ..
        sty     $C056                           ; E173 8C 56 C0                 .V.
        sta     $C057                           ; E176 8D 57 C0                 .W.
        lsr     $C051                           ; E179 4E 51 C0                 NQ.
        sec                                     ; E17C 38                       8
        rol     $C051                           ; E17D 2E 51 C0                 .Q.
        bne     LE15E                           ; E180 D0 DC                    ..
LE182:  lda     #$40                            ; E182 A9 40                    .@
        sta     $C051                           ; E184 8D 51 C0                 .Q.
        bne     LE15E                           ; E187 D0 D5                    ..
LE189:  cmp     #$41                            ; E189 C9 41                    .A
        bne     LE19B                           ; E18B D0 0E                    ..
        jsr     LD398                           ; E18D 20 98 D3                  ..
        jsr     LD2FA                           ; E190 20 FA D2                  ..
        sty     $C052                           ; E193 8C 52 C0                 .R.
        sta     $C053                           ; E196 8D 53 C0                 .S.
        bcc     LE182                           ; E199 90 E7                    ..
LE19B:  cmp     #$45                            ; E19B C9 45                    .E
        bne     LE1AD                           ; E19D D0 0E                    ..
        jsr     LD398                           ; E19F 20 98 D3                  ..
        jsr     LD2FA                           ; E1A2 20 FA D2                  ..
        sty     $C054                           ; E1A5 8C 54 C0                 .T.
        sta     $C055                           ; E1A8 8D 55 C0                 .U.
        bcc     LE182                           ; E1AB 90 D5                    ..
LE1AD:  cmp     #$C7                            ; E1AD C9 C7                    ..
        bne     LE223                           ; E1AF D0 72                    .r
        jsr     LD398                           ; E1B1 20 98 D3                  ..
        bne     LE223                           ; E1B4 D0 6D                    .m
        lsr     $C051                           ; E1B6 4E 51 C0                 NQ.
        sec                                     ; E1B9 38                       8
        rol     $C051                           ; E1BA 2E 51 C0                 .Q.
        bmi     LE20B                           ; E1BD 30 4C                    0L
        lda     $C052                           ; E1BF AD 52 C0                 .R.
LE1C2:  ldy     $C053                           ; E1C2 AC 53 C0                 .S.
        sta     $C056                           ; E1C5 8D 56 C0                 .V.
        sty     $C057                           ; E1C8 8C 57 C0                 .W.
        bcc     LE20B                           ; E1CB 90 3E                    .>
        jsr     LD44F                           ; E1CD 20 4F D4                  O.
        lda     #$00                            ; E1D0 A9 00                    ..
        ldy     #$C8                            ; E1D2 A0 C8                    ..
        sta     $C052                           ; E1D4 8D 52 C0                 .R.
        sty     $C053                           ; E1D7 8C 53 C0                 .S.
        lda     #$DD                            ; E1DA A9 DD                    ..
        ldy     #$C9                            ; E1DC A0 C9                    ..
        bne     LE1FE                           ; E1DE D0 1E                    ..
        jsr     LD44F                           ; E1E0 20 4F D4                  O.
        lda     $021F                           ; E1E3 AD 1F 02                 ...
        bne     LE1F0                           ; E1E6 D0 08                    ..
        ldx     #$80                            ; E1E8 A2 80                    ..
        ldy     #$BB                            ; E1EA A0 BB                    ..
        lda     #$DF                            ; E1EC A9 DF                    ..
        bne     LE1F6                           ; E1EE D0 06                    ..
LE1F0:  ldx     #$00                            ; E1F0 A2 00                    ..
        ldy     #$A0                            ; E1F2 A0 A0                    ..
        lda     #$3F                            ; E1F4 A9 3F                    .?
LE1F6:  stx     $C052                           ; E1F6 8E 52 C0                 .R.
        sty     $C053                           ; E1F9 8C 53 C0                 .S.
        ldy     #$BF                            ; E1FC A0 BF                    ..
LE1FE:  ldx     #$40                            ; E1FE A2 40                    .@
        brk                                     ; E200 00                       .
        brk                                     ; E201 00                       .
        .byte   $07                             ; E202 07                       .
        plp                                     ; E203 28                       (
        jsr     LEB22                           ; E204 20 22 EB                  ".
        jmp     LEB0E                           ; E207 4C 0E EB                 L..

; ----------------------------------------------------------------------------
        plp                                     ; E20A 28                       (
LE20B:  jsr     L0471                           ; E20B 20 71 04                  q.
        pha                                     ; E20E 48                       H
        php                                     ; E20F 08                       .
        txa                                     ; E210 8A                       .
        pha                                     ; E211 48                       H
        tya                                     ; E212 98                       .
        jsr     LD7CF                           ; E213 20 CF D7                  ..
        pla                                     ; E216 68                       h
        jsr     LD7CC                           ; E217 20 CC D7                  ..
        pla                                     ; E21A 68                       h
        jsr     LD7D2                           ; E21B 20 D2 D7                  ..
        pla                                     ; E21E 68                       h
        jmp     LD7C9                           ; E21F 4C C9 D7                 L..

; ----------------------------------------------------------------------------
        .byte   $6C                             ; E222 6C                       l
LE223:  beq     LE229                           ; E223 F0 04                    ..
        inc     SEDORIC_BUF2+11                 ; E225 EE 0B C2                 ...
LE228:  .byte   $D0                             ; E228 D0                       .
LE229:  .byte   $03                             ; E229 03                       .
        inc     SEDORIC_BUF2+12                 ; E22A EE 0C C2                 ...
        ldy     #$F4                            ; E22D A0 F4                    ..
LE22F:  lda     $BF35,y                         ; E22F B9 35 BF                 .5.
        cmp     #$3F                            ; E232 C9 3F                    .?
        beq     LE23B                           ; E234 F0 05                    ..
        .byte   $DD                             ; E236 DD                       .
        brk                                     ; E237 00                       .
LE238:  .byte   $C3                             ; E238 C3                       .
        bne     LE243                           ; E239 D0 08                    ..
LE23B:  inx                                     ; E23B E8                       .
        iny                                     ; E23C C8                       .
        bne     LE22F                           ; E23D D0 F0                    ..
        ldx     $C027                           ; E23F AE 27 C0                 .'.
        rts                                     ; E242 60                       `

; ----------------------------------------------------------------------------
LE243:  jmp     LDB41                           ; E243 4C 41 DB                 LA.

; ----------------------------------------------------------------------------
        iny                                     ; E246 C8                       .
        inx                                     ; E247 E8                       .
        cpx     #$08                            ; E248 E0 08                    ..
        beq     LE24E                           ; E24A F0 02                    ..
        bne     LE238                           ; E24C D0 EA                    ..
LE24E:  lda     #$3E                            ; E24E A9 3E                    .>
LE250:  sta     LD9E2,x                         ; E250 9D E2 D9                 ...
        inx                                     ; E253 E8                       .
        lda     #$00                            ; E254 A9 00                    ..
        sta     LD9E2,x                         ; E256 9D E2 D9                 ...
        lda     #$E0                            ; E259 A9 E0                    ..
        ldy     #$D9                            ; E25B A0 D9                    ..
        jsr     XAFSTR                          ; E25D 20 37 D6                  7.
        rts                                     ; E260 60                       `

; ----------------------------------------------------------------------------
        .byte   $0D                             ; E261 0D                       .
        asl     a                               ; E262 0A                       .
; X
SEDORIC_STR_NOT_EMPTY_DIRECTORY:
        .byte   "?"                             ; E263 3F                       ?
LE264:  .byte   "NO"                            ; E264 4E 4F                    NO
LE266:  .byte   "T EMPTY DIRECTOR"              ; E266 54 20 45 4D 50 54 59 20  T EMPTY 
                                                ; E26E 44 49 52 45 43 54 4F 52  DIRECTOR
        .byte   $D9                             ; E276 D9                       .
; ----------------------------------------------------------------------------
        nop                                     ; E277 EA                       .
        nop                                     ; E278 EA                       .
        nop                                     ; E279 EA                       .
        nop                                     ; E27A EA                       .
        nop                                     ; E27B EA                       .
        nop                                     ; E27C EA                       .
        nop                                     ; E27D EA                       .
        nop                                     ; E27E EA                       .
        nop                                     ; E27F EA                       .
        nop                                     ; E280 EA                       .
        nop                                     ; E281 EA                       .
        nop                                     ; E282 EA                       .
        nop                                     ; E283 EA                       .
        nop                                     ; E284 EA                       .
        nop                                     ; E285 EA                       .
        nop                                     ; E286 EA                       .
        nop                                     ; E287 EA                       .
        nop                                     ; E288 EA                       .
        nop                                     ; E289 EA                       .
        nop                                     ; E28A EA                       .
        nop                                     ; E28B EA                       .
        nop                                     ; E28C EA                       .
        nop                                     ; E28D EA                       .
        nop                                     ; E28E EA                       .
        nop                                     ; E28F EA                       .
        nop                                     ; E290 EA                       .
        jsr     LE94D                           ; E291 20 4D E9                  M.
        jsr     LDFDE                           ; E294 20 DE DF                  ..
        lda     SEDORIC_MODCLA                  ; E297 AD 3D C0                 .=.
        and     #$80                            ; E29A 29 80                    ).
        bcc     LE2A0                           ; E29C 90 02                    ..
        ora     #$40                            ; E29E 09 40                    .@
LE2A0:  sta     SEDORIC_MODCLA                  ; E2A0 8D 3D C0                 .=.
        bit     SEDORIC_MODCLA                  ; E2A3 2C 3D C0                 ,=.
        bvs     LE2AD                           ; E2A6 70 05                    p.
        ldx     #$05                            ; E2A8 A2 05                    ..
        jmp     LD332                           ; E2AA 4C 32 D3                 L2.

; ----------------------------------------------------------------------------
LE2AD:  lda     #$06                            ; E2AD A9 06                    ..
        sta     $F2                             ; E2AF 85 F2                    ..
        ldx     #$00                            ; E2B1 A2 00                    ..
LE2B3:  lda     #$08                            ; E2B3 A9 08                    ..
        sta     $F3                             ; E2B5 85 F3                    ..
        sta     $F5                             ; E2B7 85 F5                    ..
        lda     ACCENTED_FONT,x                 ; E2B9 BD 4D CD                 .M.
        inx                                     ; E2BC E8                       .
        asl     a                               ; E2BD 0A                       .
        asl     a                               ; E2BE 0A                       .
        rol     $F5                             ; E2BF 26 F5                    &.
        asl     a                               ; E2C1 0A                       .
        rol     $F5                             ; E2C2 26 F5                    &.
        sta     $F4                             ; E2C4 85 F4                    ..
        lda     $F5                             ; E2C6 A5 F5                    ..
        adc     #$94                            ; E2C8 69 94                    i.
        sta     $F5                             ; E2CA 85 F5                    ..
        ldy     #$00                            ; E2CC A0 00                    ..
LE2CE:  lda     ACCENTED_FONT,x                 ; E2CE BD 4D CD                 .M.
        .byte   $91                             ; E2D1 91                       .
LE2D2:  .byte   $F4                             ; E2D2 F4                       .
        inx                                     ; E2D3 E8                       .
        iny                                     ; E2D4 C8                       .
        dec     $F3                             ; E2D5 C6 F3                    ..
        bne     LE2CE                           ; E2D7 D0 F5                    ..
        dec     $F2                             ; E2D9 C6 F2                    ..
        bne     LE2B3                           ; E2DB D0 D6                    ..
        rts                                     ; E2DD 60                       `

; ----------------------------------------------------------------------------
        lda     #$C0                            ; E2DE A9 C0                    ..
        bit     a:$A9                           ; E2E0 2C A9 00                 ,..
        sta     SEDORIC_MODCLA                  ; E2E3 8D 3D C0                 .=.
        jsr     LDFDE                           ; E2E6 20 DE DF                  ..
        jmp     SEDORIC_XCHAR                   ; E2E9 4C A3 EB                 L..

; ----------------------------------------------------------------------------
        lda     BASIC11_Y_TEXT                  ; E2EC AD 69 02                 .i.
        ldy     BASIC11_X_TEXT                  ; E2EF AC 68 02                 .h.
        jmp     LEBFB                           ; E2F2 4C FB EB                 L..

; ----------------------------------------------------------------------------
        lda     $0219                           ; E2F5 AD 19 02                 ...
        ldy     $021A                           ; E2F8 AC 1A 02                 ...
        pha                                     ; E2FB 48                       H
        tya                                     ; E2FC 98                       .
        jsr     LD7E7                           ; E2FD 20 E7 D7                  ..
        pla                                     ; E300 68                       h
        jmp     LD7E4                           ; E301 4C E4 D7                 L..

; ----------------------------------------------------------------------------
        php                                     ; E304 08                       .
        pha                                     ; E305 48                       H
        lda     $02F9                           ; E306 AD F9 02                 ...
        ldy     $02FA                           ; E309 AC FA 02                 ...
        sta     SEDORIC_EXEVEC+1                ; E30C 8D F0 04                 ...
        sty     SEDORIC_EXEVEC+2                ; E30F 8C F1 04                 ...
        pla                                     ; E312 68                       h
        plp                                     ; E313 28                       (
        jmp     SEDORIC_EXERAM                  ; E314 4C EC 04                 L..

; ----------------------------------------------------------------------------
        lda     #$10                            ; E317 A9 10                    ..
        ldy     #$07                            ; E319 A0 07                    ..
        sta     $026B                           ; E31B 8D 6B 02                 .k.
        sty     $026C                           ; E31E 8C 6C 02                 .l.
        .byte   $A9                             ; E321 A9                       .
LE322:  .byte   $0F                             ; E322 0F                       .
        sta     BASIC11_FLG                     ; E323 8D 6A 02                 .j.
        lda     #$0C                            ; E326 A9 0C                    ..
        jsr     XAFCAR                          ; E328 20 2A D6                  *.
        jmp     SEDORIC_XCHAR                   ; E32B 4C A3 EB                 L..

; ----------------------------------------------------------------------------
        jsr     LD224                           ; E32E 20 24 D2                  $.
        jsr     LD274                           ; E331 20 74 D2                  t.
        sta     $F2                             ; E334 85 F2                    ..
        tay                                     ; E336 A8                       .
LE337:  dey                                     ; E337 88                       .
        lda     ($91),y                         ; E338 B1 91                    ..
        sta     SEDORIC_BUF1,y                  ; E33A 99 00 C1                 ...
        tya                                     ; E33D 98                       .
        bne     LE337                           ; E33E D0 F7                    ..
        jsr     LD22C                           ; E340 20 2C D2                  ,.
LE343:  .byte   $20                             ; E343 20                        
CMD_DIR:bit     $D2                             ; E344 24 D2                    $.
        jsr     LD274                           ; E346 20 74 D2                  t.
        sta     $F3                             ; E349 85 F3                    ..
        stx     $B8                             ; E34B 86 B8                    ..
        sty     $B9                             ; E34D 84 B9                    ..
        jsr     LD22C                           ; E34F 20 2C D2                  ,.
        jsr     LD27F                           ; E352 20 7F D2                  ..
        bne     LE38E                           ; E355 D0 37                    .7
        dex                                     ; E357 CA                       .
        stx     $F6                             ; E358 86 F6                    ..
        cpx     $F2                             ; E35A E4 F2                    ..
        bcs     LE391                           ; E35C B0 33                    .3
        lda     $F2                             ; E35E A5 F2                    ..
        beq     LE37E                           ; E360 F0 1C                    ..
LE362:  ldx     $F3                             ; E362 A6 F3                    ..
        beq     LE37E                           ; E364 F0 18                    ..
        lda     $F6                             ; E366 A5 F6                    ..
        sta     $F7                             ; E368 85 F7                    ..
        lda     #$C1                            ; E36A A9 C1                    ..
        sta     $F8                             ; E36C 85 F8                    ..
        ldy     #$00                            ; E36E A0 00                    ..
LE370:  lda     ($F7),y                         ; E370 B1 F7                    ..
        cmp     ($B8),y                         ; E372 D1 B8                    ..
        bne     LE384                           ; E374 D0 0E                    ..
        iny                                     ; E376 C8                       .
        dex                                     ; E377 CA                       .
        bne     LE370                           ; E378 D0 F6                    ..
        ldy     $F6                             ; E37A A4 F6                    ..
        iny                                     ; E37C C8                       .
        .byte   $2C                             ; E37D 2C                       ,
LE37E:  ldy     #$00                            ; E37E A0 00                    ..
        tya                                     ; E380 98                       .
        jmp     LD7DB                           ; E381 4C DB D7                 L..

; ----------------------------------------------------------------------------
LE384:  inc     $F6                             ; E384 E6 F6                    ..
        lda     $F6                             ; E386 A5 F6                    ..
        cmp     $F2                             ; E388 C5 F2                    ..
        beq     LE37E                           ; E38A F0 F2                    ..
        bne     LE362                           ; E38C D0 D4                    ..
LE38E:  jmp     LDE23                           ; E38E 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LE391:  jmp     LDE20                           ; E391 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        tax                                     ; E394 AA                       .
        lda     BASIC11_FLG                     ; E395 AD 6A 02                 .j.
        pha                                     ; E398 48                       H
        cpx     #$C6                            ; E399 E0 C6                    ..
        bne     LE3BB                           ; E39B D0 1E                    ..
        jsr     LD398                           ; E39D 20 98 D3                  ..
        jsr     XCUROFF                         ; E3A0 20 40 D7                  @.
        jsr     LD292                           ; E3A3 20 92 D2                  ..
        ldy     $20                             ; E3A6 A4 20                    . 
        sta     $12                             ; E3A8 85 12                    ..
        sty     $13                             ; E3AA 84 13                    ..
        stx     BASIC11_X_TEXT                  ; E3AC 8E 68 02                 .h.
        ldx     $02F8                           ; E3AF AE F8 02                 ...
        stx     BASIC11_Y_TEXT                  ; E3B2 8E 69 02                 .i.
        jsr     LEA36                           ; E3B5 20 36 EA                  6.
        jsr     LD22C                           ; E3B8 20 2C D2                  ,.
LE3BB:  jsr     LD224                           ; E3BB 20 24 D2                  $.
        bit     $28                             ; E3BE 24 28                    $(
        bpl     LE3D7                           ; E3C0 10 15                    ..
        jsr     LD277                           ; E3C2 20 77 D2                  w.
        beq     LE3CC                           ; E3C5 F0 05                    ..
        ldy     #$00                            ; E3C7 A0 00                    ..
        lda     ($91),y                         ; E3C9 B1 91                    ..
        .byte   $2C                             ; E3CB 2C                       ,
LE3CC:  lda     #$2E                            ; E3CC A9 2E                    ..
        sta     SEDORIC_BACKUP_CHAR_LINPUT      ; E3CE 8D 75 C0                 .u.
        jsr     LD22C                           ; E3D1 20 2C D2                  ,.
        jsr     LD224                           ; E3D4 20 24 D2                  $.
LE3D7:  jsr     LD219                           ; E3D7 20 19 D2                  ..
        jsr     LD282                           ; E3DA 20 82 D2                  ..
        txa                                     ; E3DD 8A                       .
        beq     LE42B                           ; E3DE F0 4B                    .K
        stx     $F2                             ; E3E0 86 F2                    ..
        lda     #$3B                            ; E3E2 A9 3B                    .;
        jsr     LD22E                           ; E3E4 20 2E D2                  ..
        sty     $F3                             ; E3E7 84 F3                    ..
        jsr     LED2E                           ; E3E9 20 2E ED                  ..
        jsr     LD21B                           ; E3EC 20 1B D2                  ..
        jsr     LD39E                           ; E3EF 20 9E D3                  ..
        beq     LE419                           ; E3F2 F0 25                    .%
LE3F4:  jsr     LD22C                           ; E3F4 20 2C D2                  ,.
        jsr     LD3A1                           ; E3F7 20 A1 D3                  ..
        ldx     #$04                            ; E3FA A2 04                    ..
        stx     $F4                             ; E3FC 86 F4                    ..
LE3FE:  asl     $F4                             ; E3FE 06 F4                    ..
        cmp     LCDBA,x                         ; E400 DD BA CD                 ...
        beq     LE40A                           ; E403 F0 05                    ..
        dex                                     ; E405 CA                       .
        bpl     LE3FE                           ; E406 10 F6                    ..
        bmi     LE428                           ; E408 30 1E                    0.
LE40A:  lda     $F4                             ; E40A A5 F4                    ..
        eor     $F3                             ; E40C 45 F3                    E.
        cmp     $F3                             ; E40E C5 F3                    ..
        bcc     LE428                           ; E410 90 16                    ..
        sta     $F3                             ; E412 85 F3                    ..
        jsr     LD398                           ; E414 20 98 D3                  ..
        bne     LE3F4                           ; E417 D0 DB                    ..
LE419:  jsr     LED36                           ; E419 20 36 ED                  6.
        jsr     LEE8E                           ; E41C 20 8E EE                  ..
LE41F:  pla                                     ; E41F 68                       h
        sta     BASIC11_FLG                     ; E420 8D 6A 02                 .j.
        lda     $F4                             ; E423 A5 F4                    ..
        jmp     LD7D8                           ; E425 4C D8 D7                 L..

; ----------------------------------------------------------------------------
LE428:  jmp     LDE23                           ; E428 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LE42B:  jmp     LDE20                           ; E42B 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jsr     LD238                           ; E42E 20 38 D2                  8.
        sta     $B8                             ; E431 85 B8                    ..
        sty     $B9                             ; E433 84 B9                    ..
        rts                                     ; E435 60                       `

; ----------------------------------------------------------------------------
LE436:  .byte   $A5                             ; E436 A5                       .
CMD_DELBAK:
        .byte   $F3                             ; E437 F3                       .
        and     #$08                            ; E438 29 08                    ).
        bne     LE452                           ; E43A D0 16                    ..
LE43C:  jsr     XCUROFF                         ; E43C 20 40 D7                  @.
        ldx     $F2                             ; E43F A6 F2                    ..
        .byte   $AD                             ; E441 AD                       .
        .byte   $75                             ; E442 75                       u
LE443:  .byte   $C0                             ; E443 C0                       .
CMD_DESTROY:
        .byte   $20                             ; E444 20                        
LE445:  rol     a                               ; E445 2A                       *
CMD_DEL:dec     $CA,x                           ; E446 D6 CA                    ..
        bne     CMD_DESTROY                     ; E448 D0 FA                    ..
LE44A:  jsr     XCUROFF                         ; E44A 20 40 D7                  @.
        ldx     $F2                             ; E44D A6 F2                    ..
        jsr     LEE69                           ; E44F 20 69 EE                  i.
LE452:  jsr     XCURON                          ; E452 20 3E D7                  >.
        ldx     #$00                            ; E455 A2 00                    ..
        ldy     #$26                            ; E457 A0 26                    .&
        lda     BASIC11_FLG                     ; E459 AD 6A 02                 .j.
        and     #$20                            ; E45C 29 20                    ) 
        beq     LE462                           ; E45E F0 02                    ..
        ldy     #$28                            ; E460 A0 28                    .(
LE462:  sty     $F5                             ; E462 84 F5                    ..
LE464:  jsr     LD843                           ; E464 20 43 D8                  C.
        bpl     LE464                           ; E467 10 FB                    ..
        cmp     #$14                            ; E469 C9 14                    ..
        beq     LE490                           ; E46B F0 23                    .#
        cmp     #$7F                            ; E46D C9 7F                    ..
        bne     LE47F                           ; E46F D0 0E                    ..
        txa                                     ; E471 8A                       .
        beq     LE464                           ; E472 F0 F0                    ..
        jsr     LEE73                           ; E474 20 73 EE                  s.
        lda     SEDORIC_BACKUP_CHAR_LINPUT      ; E477 AD 75 C0                 .u.
        jsr     XAFCAR                          ; E47A 20 2A D6                  *.
        lda     #$08                            ; E47D A9 08                    ..
LE47F:  cmp     #$0E                            ; E47F C9 0E                    ..
        bne     LE488                           ; E481 D0 05                    ..
        jsr     LEE69                           ; E483 20 69 EE                  i.
        beq     LE43C                           ; E486 F0 B4                    ..
LE488:  cmp     #$04                            ; E488 C9 04                    ..
        beq     LE490                           ; E48A F0 04                    ..
        cmp     #$1A                            ; E48C C9 1A                    ..
        bne     LE495                           ; E48E D0 05                    ..
LE490:  jsr     XAFCAR                          ; E490 20 2A D6                  *.
LE493:  bne     LE464                           ; E493 D0 CF                    ..
LE495:  cmp     #$20                            ; E495 C9 20                    . 
        bcc     LE4AD                           ; E497 90 14                    ..
        jsr     XAFCAR                          ; E499 20 2A D6                  *.
        inx                                     ; E49C E8                       .
        cpx     $F2                             ; E49D E4 F2                    ..
        bne     LE464                           ; E49F D0 C3                    ..
        bit     $F3                             ; E4A1 24 F3                    $.
        bvc     LE44A                           ; E4A3 50 A5                    P.
        dex                                     ; E4A5 CA                       .
        jsr     LEE73                           ; E4A6 20 73 EE                  s.
        ldy     #$06                            ; E4A9 A0 06                    ..
        bne     LE504                           ; E4AB D0 57                    .W
LE4AD:  ldy     #$00                            ; E4AD A0 00                    ..
        cmp     #$0D                            ; E4AF C9 0D                    ..
        beq     LE4FC                           ; E4B1 F0 49                    .I
        iny                                     ; E4B3 C8                       .
        cmp     #$1B                            ; E4B4 C9 1B                    ..
        beq     LE4FC                           ; E4B6 F0 44                    .D
        iny                                     ; E4B8 C8                       .
        cmp     #$08                            ; E4B9 C9 08                    ..
        bne     LE4C6                           ; E4BB D0 09                    ..
        txa                                     ; E4BD 8A                       .
        beq     LE4FC                           ; E4BE F0 3C                    .<
        dex                                     ; E4C0 CA                       .
        jsr     LEE73                           ; E4C1 20 73 EE                  s.
        bne     LE464                           ; E4C4 D0 9E                    ..
LE4C6:  iny                                     ; E4C6 C8                       .
        cmp     #$09                            ; E4C7 C9 09                    ..
        bne     LE4D9                           ; E4C9 D0 0E                    ..
        inx                                     ; E4CB E8                       .
        cpx     $F2                             ; E4CC E4 F2                    ..
        beq     LE4D5                           ; E4CE F0 05                    ..
        jsr     LEE76                           ; E4D0 20 76 EE                  v.
        bne     LE493                           ; E4D3 D0 BE                    ..
LE4D5:  dex                                     ; E4D5 CA                       .
        jmp     LEDFC                           ; E4D6 4C FC ED                 L..

; ----------------------------------------------------------------------------
LE4D9:  iny                                     ; E4D9 C8                       .
        cmp     #$0A                            ; E4DA C9 0A                    ..
        bne     LE4ED                           ; E4DC D0 0F                    ..
        clc                                     ; E4DE 18                       .
        txa                                     ; E4DF 8A                       .
        adc     $F5                             ; E4E0 65 F5                    e.
        bcs     LE4FC                           ; E4E2 B0 18                    ..
        cmp     $F2                             ; E4E4 C5 F2                    ..
        bcs     LE4FC                           ; E4E6 B0 14                    ..
        tax                                     ; E4E8 AA                       .
        lda     #$0A                            ; E4E9 A9 0A                    ..
        bne     LE490                           ; E4EB D0 A3                    ..
LE4ED:  iny                                     ; E4ED C8                       .
        cmp     #$0B                            ; E4EE C9 0B                    ..
        bne     LE493                           ; E4F0 D0 A1                    ..
        txa                                     ; E4F2 8A                       .
        sbc     $F5                             ; E4F3 E5 F5                    ..
        bcc     LE4FC                           ; E4F5 90 05                    ..
        tax                                     ; E4F7 AA                       .
        lda     #$0B                            ; E4F8 A9 0B                    ..
        bne     LE490                           ; E4FA D0 94                    ..
LE4FC:  cpy     #$02                            ; E4FC C0 02                    ..
        bcc     LE504                           ; E4FE 90 04                    ..
        lda     $F3                             ; E500 A5 F3                    ..
        bmi     LE493                           ; E502 30 8F                    0.
LE504:  sty     $F4                             ; E504 84 F4                    ..
        jsr     XCUROFF                         ; E506 20 40 D7                  @.
LE509:  inx                                     ; E509 E8                       .
        cpx     $F2                             ; E50A E4 F2                    ..
        bcs     LE513                           ; E50C B0 05                    ..
        jsr     LEE76                           ; E50E 20 76 EE                  v.
        bne     LE509                           ; E511 D0 F6                    ..
LE513:  lda     $F2                             ; E513 A5 F2                    ..
        jsr     LD264                           ; E515 20 64 D2                  d.
        ldy     $F2                             ; E518 A4 F2                    ..
LE51A:  sty     $F5                             ; E51A 84 F5                    ..
        ldy     BASIC11_Y_TEXT                  ; E51C AC 69 02                 .i.
        lda     ($12),y                         ; E51F B1 12                    ..
        cmp     #$20                            ; E521 C9 20                    . 
        bcs     LE527                           ; E523 B0 02                    ..
        ora     #$80                            ; E525 09 80                    ..
LE527:  ldy     $F5                             ; E527 A4 F5                    ..
        dey                                     ; E529 88                       .
        php                                     ; E52A 08                       .
        sta     ($D1),y                         ; E52B 91 D1                    ..
        jsr     LEE73                           ; E52D 20 73 EE                  s.
        plp                                     ; E530 28                       (
        bne     LE51A                           ; E531 D0 E7                    ..
        ldx     $F2                             ; E533 A6 F2                    ..
        .byte   $20                             ; E535 20                        
        .byte   $76                             ; E536 76                       v
CMD_REN:inc     LD0CA                           ; E537 EE CA D0                 ...
        .byte   $FA                             ; E53A FA                       .
        asl     $F3                             ; E53B 06 F3                    ..
        asl     $F3                             ; E53D 06 F3                    ..
        ldy     $F2                             ; E53F A4 F2                    ..
LE541:  dey                                     ; E541 88                       .
        lda     ($D1),y                         ; E542 B1 D1                    ..
        cmp     SEDORIC_BACKUP_CHAR_LINPUT      ; E544 CD 75 C0                 .u.
        bne     LE561                           ; E547 D0 18                    ..
        lda     #$20                            ; E549 A9 20                    . 
        bit     $F3                             ; E54B 24 F3                    $.
        bpl     LE551                           ; E54D 10 02                    ..
        sta     ($D1),y                         ; E54F 91 D1                    ..
LE551:  bvc     LE559                           ; E551 50 06                    P.
        jsr     XAFCAR                          ; E553 20 2A D6                  *.
        jsr     LEE73                           ; E556 20 73 EE                  s.
LE559:  jsr     LEE73                           ; E559 20 73 EE                  s.
LE55C:  tya                                     ; E55C 98                       .
        bne     LE541                           ; E55D D0 E2                    ..
        .byte   $24                             ; E55F 24                       $
LE560:  iny                                     ; E560 C8                       .
LE561:  jsr     LEE76                           ; E561 20 76 EE                  v.
        cpy     $F2                             ; E564 C4 F2                    ..
        bne     LE560                           ; E566 D0 F8                    ..
        rts                                     ; E568 60                       `

; ----------------------------------------------------------------------------
LE569:  txa                                     ; E569 8A                       .
        beq     LE572                           ; E56A F0 06                    ..
        jsr     LEE73                           ; E56C 20 73 EE                  s.
        dex                                     ; E56F CA                       .
        bne     LE569                           ; E570 D0 F7                    ..
LE572:  rts                                     ; E572 60                       `

; ----------------------------------------------------------------------------
        lda     #$08                            ; E573 A9 08                    ..
        .byte   $2C                             ; E575 2C                       ,
LE576:  lda     #$09                            ; E576 A9 09                    ..
        .byte   $24                             ; E578 24                       $
LE579:  pla                                     ; E579 68                       h
        pha                                     ; E57A 48                       H
        jsr     XAFCAR                          ; E57B 20 2A D6                  *.
        lda     BASIC11_FLG                     ; E57E AD 6A 02                 .j.
        and     #$20                            ; E581 29 20                    ) 
LE583:  bne     LE58C                           ; E583 D0 07                    ..
        lda     BASIC11_Y_TEXT                  ; E585 AD 69 02                 .i.
        and     #$FE                            ; E588 29 FE                    ).
        beq     LE579                           ; E58A F0 ED                    ..
LE58C:  pla                                     ; E58C 68                       h
        rts                                     ; E58D 60                       `

; ----------------------------------------------------------------------------
        ldy     #$02                            ; E58E A0 02                    ..
LE590:  lda     $D0,y                           ; E590 B9 D0 00                 ...
        sta     ($B8),y                         ; E593 91 B8                    ..
        dey                                     ; E595 88                       .
        bpl     LE590                           ; E596 10 F8                    ..
        rts                                     ; E598 60                       `

; ----------------------------------------------------------------------------
        jsr     LD216                           ; E599 20 16 D2                  ..
        jsr     LD2D2                           ; E59C 20 D2 D2                  ..
        jsr     LD22C                           ; E59F 20 2C D2                  ,.
        jsr     LD224                           ; E5A2 20 24 D2                  $.
        jsr     LD274                           ; E5A5 20 74 D2                  t.
        sta     $22                             ; E5A8 85 22                    ."
        jsr     LDACE                           ; E5AA 20 CE DA                  ..
        lda     #$30                            ; E5AD A9 30                    .0
        ldy     #$2B                            ; E5AF A0 2B                    .+
        sty     $D7                             ; E5B1 84 D7                    ..
        sta     $D8                             ; E5B3 85 D8                    ..
        sta     $D9                             ; E5B5 85 D9                    ..
        sta     $C5                             ; E5B7 85 C5                    ..
LE5B9:  ldx     #$09                            ; E5B9 A2 09                    ..
LE5BB:  sta     $CD,x                           ; E5BB 95 CD                    ..
        dex                                     ; E5BD CA                       .
        bne     LE5BB                           ; E5BE D0 FB                    ..
        lda     STACK                           ; E5C0 AD 00 01                 ...
        cmp     #$2D                            ; E5C3 C9 2D                    .-
        beq     LE5C9                           ; E5C5 F0 02                    ..
        lda     #$2B                            ; E5C7 A9 2B                    .+
LE5C9:  sta     $C4                             ; E5C9 85 C4                    ..
        stx     $F4                             ; E5CB 86 F4                    ..
        stx     $F5                             ; E5CD 86 F5                    ..
        lda     #$20                            ; E5CF A9 20                    . 
        sta     $F6                             ; E5D1 85 F6                    ..
        ldy     #$01                            ; E5D3 A0 01                    ..
        sty     $F2                             ; E5D5 84 F2                    ..
        dey                                     ; E5D7 88                       .
        .byte   $2C                             ; E5D8 2C                       ,
LE5D9:  ldx     #$09                            ; E5D9 A2 09                    ..
LE5DB:  iny                                     ; E5DB C8                       .
LE5DC:  lda     STACK,y                         ; E5DC B9 00 01                 ...
        beq     LE606                           ; E5DF F0 25                    .%
        cmp     #$2E                            ; E5E1 C9 2E                    ..
        beq     LE5D9                           ; E5E3 F0 F4                    ..
        cmp     #$45                            ; E5E5 C9 45                    .E
        beq     LE5F4                           ; E5E7 F0 0B                    ..
        sta     $C5,x                           ; E5E9 95 C5                    ..
        cpx     #$09                            ; E5EB E0 09                    ..
        bcs     LE5F1                           ; E5ED B0 02                    ..
        sty     $F2                             ; E5EF 84 F2                    ..
LE5F1:  inx                                     ; E5F1 E8                       .
        .byte   $D0                             ; E5F2 D0                       .
LE5F3:  .byte   $E7                             ; E5F3 E7                       .
LE5F4:  lda     STACK+1,y                       ; E5F4 B9 01 01                 ...
        sta     $D7                             ; E5F7 85 D7                    ..
        .byte   $B9                             ; E5F9 B9                       .
        .byte   $02                             ; E5FA 02                       .
LE5FB:  .byte   $01                             ; E5FB 01                       .
CMD_SEARCH:
        tax                                     ; E5FC AA                       .
        lda     STACK+3,y                       ; E5FD B9 03 01                 ...
        beq     LE604                           ; E600 F0 02                    ..
        sta     $D9                             ; E602 85 D9                    ..
LE604:  stx     $D8                             ; E604 86 D8                    ..
LE606:  ldx     $F2                             ; E606 A6 F2                    ..
        ldy     #$08                            ; E608 A0 08                    ..
LE60A:  lda     $C4,x                           ; E60A B5 C4                    ..
        dex                                     ; E60C CA                       .
LE60D:  bpl     LE611                           ; E60D 10 02                    ..
        lda     #$20                            ; E60F A9 20                    . 
LE611:  sta     $C5,y                           ; E611 99 C5 00                 ...
        dey                                     ; E614 88                       .
        bpl     LE60A                           ; E615 10 F3                    ..
        .byte   $2C                             ; E617 2C                       ,
LE618:  sty     $F5                             ; E618 84 F5                    ..
        ldy     $F4                             ; E61A A4 F4                    ..
        cpy     $22                             ; E61C C4 22                    ."
        bne     LE648                           ; E61E D0 28                    .(
        lda     #$00                            ; E620 A9 00                    ..
        sta     $D7                             ; E622 85 D7                    ..
        jsr     LD39E                           ; E624 20 9E D3                  ..
        beq     LE641                           ; E627 F0 18                    ..
        lda     $F5                             ; E629 A5 F5                    ..
        jsr     LD264                           ; E62B 20 64 D2                  d.
        tay                                     ; E62E A8                       .
LE62F:  dey                                     ; E62F 88                       .
        lda     SEDORIC_BUF1,y                  ; E630 B9 00 C1                 ...
        sta     ($D1),y                         ; E633 91 D1                    ..
LE635:  tya                                     ; E635 98                       .
        bne     LE62F                           ; E636 D0 F7                    ..
        .byte   $20                             ; E638 20                        
        .byte   $2C                             ; E639 2C                       ,
LE63A:  .byte   $D2                             ; E63A D2                       .
        .byte   $20                             ; E63B 20                        
LE63C:  sec                                     ; E63C 38                       8
        .byte   $D2                             ; E63D D2                       .
        jmp     LE8D6                           ; E63E 4C D6 E8                 L..

; ----------------------------------------------------------------------------
LE641:  lda     #$00                            ; E641 A9 00                    ..
        ldy     #$C1                            ; E643 A0 C1                    ..
        jmp     XAFSTR                          ; E645 4C 37 D6                 L7.

; ----------------------------------------------------------------------------
LE648:  jsr     LF02B                           ; E648 20 2B F0                  +.
        cmp     #$5E                            ; E64B C9 5E                    .^
        bne     LE668                           ; E64D D0 19                    ..
        ldx     #$FD                            ; E64F A2 FD                    ..
LE651:  lda     LFFDA,x                         ; E651 BD DA FF                 ...
        .byte   $2C                             ; E654 2C                       ,
LE655:  lda     #$20                            ; E655 A9 20                    . 
        .byte   $2C                             ; E657 2C                       ,
LE658:  lda     $C4                             ; E658 A5 C4                    ..
        sta     SEDORIC_BUF1,y                  ; E65A 99 00 C1                 ...
        iny                                     ; E65D C8                       .
        bne     LE663                           ; E65E D0 03                    ..
        jmp     LE977                           ; E660 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LE663:  inx                                     ; E663 E8                       .
        bne     LE651                           ; E664 D0 EB                    ..
        beq     LE618                           ; E666 F0 B0                    ..
LE668:  cmp     #$2B                            ; E668 C9 2B                    .+
        beq     LE658                           ; E66A F0 EC                    ..
        cmp     #$2D                            ; E66C C9 2D                    .-
        bne     LE678                           ; E66E D0 08                    ..
        lda     STACK                           ; E670 AD 00 01                 ...
        lsr     a                               ; E673 4A                       J
        bcs     LE658                           ; E674 B0 E2                    ..
        bcc     LE655                           ; E676 90 DD                    ..
LE678:  cmp     #$23                            ; E678 C9 23                    .#
        bne     LE683                           ; E67A D0 07                    ..
        jsr     LEFA7                           ; E67C 20 A7 EF                  ..
LE67F:  ldx     #$09                            ; E67F A2 09                    ..
        bne     LE693                           ; E681 D0 10                    ..
LE683:  cmp     #$25                            ; E683 C9 25                    .%
        bne     LE6B9                           ; E685 D0 32                    .2
        jsr     LEFA7                           ; E687 20 A7 EF                  ..
        cmp     $F2                             ; E68A C5 F2                    ..
        bcc     LE6B3                           ; E68C 90 25                    .%
        lda     #$09                            ; E68E A9 09                    ..
        sbc     $F3                             ; E690 E5 F3                    ..
        tax                                     ; E692 AA                       .
LE693:  dec     $F3                             ; E693 C6 F3                    ..
        bpl     LE69A                           ; E695 10 03                    ..
        jmp     LEF18                           ; E697 4C 18 EF                 L..

; ----------------------------------------------------------------------------
LE69A:  lda     $C5,x                           ; E69A B5 C5                    ..
        and     #$7F                            ; E69C 29 7F                    ).
        sta     SEDORIC_BUF1,y                  ; E69E 99 00 C1                 ...
        iny                                     ; E6A1 C8                       .
        beq     LE6B6                           ; E6A2 F0 12                    ..
        inx                                     ; E6A4 E8                       .
        bne     LE693                           ; E6A5 D0 EC                    ..
        jsr     LF02B                           ; E6A7 20 2B F0                  +.
        sbc     #$30                            ; E6AA E9 30                    .0
        sta     $F3                             ; E6AC 85 F3                    ..
        cmp     #$0A                            ; E6AE C9 0A                    ..
        bcs     LE6B3                           ; E6B0 B0 01                    ..
        rts                                     ; E6B2 60                       `

; ----------------------------------------------------------------------------
LE6B3:  jmp     LDE20                           ; E6B3 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LE6B6:  jmp     LE977                           ; E6B6 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
LE6B9:  cmp     #$21                            ; E6B9 C9 21                    .!
        bne     LE6FC                           ; E6BB D0 3F                    .?
        jsr     LEFA7                           ; E6BD 20 A7 EF                  ..
        sec                                     ; E6C0 38                       8
        lda     #$09                            ; E6C1 A9 09                    ..
        .byte   $E5                             ; E6C3 E5                       .
LE6C4:  .byte   $F3                             ; E6C4 F3                       .
LE6C5:  sta     $F3                             ; E6C5 85 F3                    ..
        tax                                     ; E6C7 AA                       .
        lda     $C5,x                           ; E6C8 B5 C5                    ..
        cmp     $F6                             ; E6CA C5 F6                    ..
        beq     LE728                           ; E6CC F0 5A                    .Z
        lda     #$30                            ; E6CE A9 30                    .0
        inx                                     ; E6D0 E8                       .
LE6D1:  inx                                     ; E6D1 E8                       .
        cpx     #$12                            ; E6D2 E0 12                    ..
        beq     LE6DA                           ; E6D4 F0 04                    ..
        sta     $C5,x                           ; E6D6 95 C5                    ..
        bne     LE6D1                           ; E6D8 D0 F7                    ..
LE6DA:  ldx     $F3                             ; E6DA A6 F3                    ..
        inx                                     ; E6DC E8                       .
        lda     $C5,x                           ; E6DD B5 C5                    ..
        cmp     #$35                            ; E6DF C9 35                    .5
LE6E1:  lda     #$30                            ; E6E1 A9 30                    .0
LE6E3:  sta     $C5,x                           ; E6E3 95 C5                    ..
LE6E5:  bcc     LE728                           ; E6E5 90 41                    .A
        dex                                     ; E6E7 CA                       .
        bmi     LE728                           ; E6E8 30 3E                    0>
        lda     $C5,x                           ; E6EA B5 C5                    ..
        cmp     $F6                             ; E6EC C5 F6                    ..
        bne     LE6F4                           ; E6EE D0 04                    ..
        inc     $F2                             ; E6F0 E6 F2                    ..
        lda     #$30                            ; E6F2 A9 30                    .0
LE6F4:  cmp     #$39                            ; E6F4 C9 39                    .9
        beq     LE6E1                           ; E6F6 F0 E9                    ..
        adc     #$01                            ; E6F8 69 01                    i.
        bcc     LE6E3                           ; E6FA 90 E7                    ..
LE6FC:  cmp     #$40                            ; E6FC C9 40                    .@
        bne     LE707                           ; E6FE D0 07                    ..
        jsr     LEFA7                           ; E700 20 A7 EF                  ..
        adc     #$08                            ; E703 69 08                    i.
        bcc     LE6C5                           ; E705 90 BE                    ..
LE707:  cmp     #$26                            ; E707 C9 26                    .&
        .byte   $F0                             ; E709 F0                       .
LE70A:  .byte   $03                             ; E70A 03                       .
CMD_KEY:jmp     displayCharInFinalString        ; E70B 4C 5A EF                 LZ.

; ----------------------------------------------------------------------------
        jsr     LF02B                           ; E70E 20 2B F0                  +.
        cmp     #$30                            ; E711 C9 30                    .0
        bne     LE717                           ; E713 D0 02                    ..
        ora     #$80                            ; E715 09 80                    ..
LE717:  tax                                     ; E717 AA                       .
        ldy     #$00                            ; E718 A0 00                    ..
LE71A:  lda     $C5,y                           ; E71A B9 C5 00                 ...
        .byte   $C5                             ; E71D C5                       .
LE71E:  .byte   $F6                             ; E71E F6                       .
CMD_OUT:bne     LE726                           ; E71F D0 05                    ..
        stx     $C5,y                           ; E721 96 C5                    ..
        iny                                     ; E723 C8                       .
        bne     LE71A                           ; E724 D0 F4                    ..
LE726:  stx     $F6                             ; E726 86 F6                    ..
LE728:  jmp     LEF1A                           ; E728 4C 1A EF                 L..

; ----------------------------------------------------------------------------
        ldy     $F4                             ; E72B A4 F4                    ..
        lda     ($91),y                         ; E72D B1 91                    ..
        inc     $F4                             ; E72F E6 F4                    ..
        ldy     $F5                             ; E731 A4 F5                    ..
        ldx     #$FF                            ; E733 A2 FF                    ..
        rts                                     ; E735 60                       `

; ----------------------------------------------------------------------------
        jsr     LE7C5                           ; E736 20 C5 E7                  ..
        jsr     CMD_USING                       ; E739 20 99 EE                  ..
        jmp     LE7D6                           ; E73C 4C D6 E7                 L..

; ----------------------------------------------------------------------------
LE73F:  .byte   $A2                             ; E73F A2                       .
CMD_WIDTH:
        .byte   $05                             ; E740 05                       .
LE741:  .byte   $BD                             ; E741 BD                       .
LE742:  .byte   $1A                             ; E742 1A                       .
        .byte   $CD                             ; E743 CD                       .
        .byte   $9D                             ; E744 9D                       .
LE745:  .byte   $DF                             ; E745 DF                       .
        .byte   $BF                             ; E746 BF                       .
        .byte   $BD                             ; E747 BD                       .
LE748:  .byte   $1F                             ; E748 1F                       .
        .byte   $CD                             ; E749 CD                       .
        .byte   $9D                             ; E74A 9D                       .
LE74B:  sbc     #$BF                            ; E74B E9 BF                    ..
        dex                                     ; E74D CA                       .
LE74E:  bne     LE741                           ; E74E D0 F1                    ..
        inx                                     ; E750 E8                       .
        stx     $C072                           ; E751 8E 72 C0                 .r.
        lda     #$41                            ; E754 A9 41                    .A
        ldy     #$4E                            ; E756 A0 4E                    .N
        sta     $B4                             ; E758 85 B4                    ..
        sty     $B5                             ; E75A 84 B5                    ..
        jsr     LD244                           ; E75C 20 44 D2                  D.
        jsr     LD2BA                           ; E75F 20 BA D2                  ..
        lda     #$E0                            ; E762 A9 E0                    ..
        ldy     #$BF                            ; E764 A0 BF                    ..
        jsr     LD2AA                           ; E766 20 AA D2                  ..
        ldx     #$E0                            ; E769 A2 E0                    ..
        ldy     #$BF                            ; E76B A0 BF                    ..
        .byte   $20                             ; E76D 20                        
        .byte   $C2                             ; E76E C2                       .
LE76F:  .byte   $D2                             ; E76F D2                       .
        .byte   $AD                             ; E770 AD                       .
        .byte   $1F                             ; E771 1F                       .
LE772:  .byte   $02                             ; E772 02                       .
        bne     LE778                           ; E773 D0 03                    ..
LE775:  jmp     LD16F                           ; E775 4C 6F D1                 Lo.

; ----------------------------------------------------------------------------
LE778:  rts                                     ; E778 60                       `

; ----------------------------------------------------------------------------
        jsr     LF03F                           ; E779 20 3F F0                  ?.
        jsr     LD216                           ; E77C 20 16 D2                  ..
        ldx     #$E5                            ; E77F A2 E5                    ..
        ldy     #$BF                            ; E781 A0 BF                    ..
        jsr     LD2C2                           ; E783 20 C2 D2                  ..
        ldx     #$00                            ; E786 A2 00                    ..
LE788:  stx     $F2                             ; E788 86 F2                    ..
LE78A:  lda     #$E0                            ; E78A A9 E0                    ..
        ldy     #$BF                            ; E78C A0 BF                    ..
        jsr     LD2BA                           ; E78E 20 BA D2                  ..
        ldx     $F2                             ; E791 A6 F2                    ..
        beq     LE79E                           ; E793 F0 09                    ..
LE795:  .byte   $20                             ; E795 20                        
CMD_RANDOM:
        .byte   $F2                             ; E796 F2                       .
        .byte   $D2                             ; E797 D2                       .
        jsr     LD2DA                           ; E798 20 DA D2                  ..
LE79B:  jmp     LF0A1                           ; E79B 4C A1 F0                 L..

; ----------------------------------------------------------------------------
LE79E:  jsr     LD2EA                           ; E79E 20 EA D2                  ..
        lda     #$E5                            ; E7A1 A9 E5                    ..
        ldy     #$BF                            ; E7A3 A0 BF                    ..
        jsr     LD2AA                           ; E7A5 20 AA D2                  ..
        jsr     LD28A                           ; E7A8 20 8A D2                  ..
        tax                                     ; E7AB AA                       .
        beq     LE7B2                           ; E7AC F0 04                    ..
        iny                                     ; E7AE C8                       .
        bne     LE7B2                           ; E7AF D0 01                    ..
        inx                                     ; E7B1 E8                       .
LE7B2:  txa                                     ; E7B2 8A                       .
        ldx     $F2                             ; E7B3 A6 F2                    ..
        .byte   $9D                             ; E7B5 9D                       .
        .byte   $E2                             ; E7B6 E2                       .
LE7B7:  .byte   $02                             ; E7B7 02                       .
CMD_RESET:
        tya                                     ; E7B8 98                       .
        sta     BASIC11_PARAMS+1,x              ; E7B9 9D E1 02                 ...
        inx                                     ; E7BC E8                       .
        inx                                     ; E7BD E8                       .
        .byte   $E0                             ; E7BE E0                       .
LE7BF:  .byte   $02                             ; E7BF 02                       .
CMD_PR: beq     LE788                           ; E7C0 F0 C6                    ..
        lsr     $C072                           ; E7C2 4E 72 C0                 Nr.
LE7C5:  bcc     LE7D3                           ; E7C5 90 0C                    ..
        jsr     LD22C                           ; E7C7 20 2C D2                  ,.
        jsr     LD2FA                           ; E7CA 20 FA D2                  ..
        sty     BASIC11_PARAMS+5                ; E7CD 8C E5 02                 ...
CMD_LDIR:
        .byte   $8D                             ; E7D0 8D                       .
LE7D1:  .byte   $E6                             ; E7D1 E6                       .
LE7D2:  .byte   $02                             ; E7D2 02                       .
LE7D3:  .byte   $20                             ; E7D3 20                        
LE7D4:  .byte   $12                             ; E7D4 12                       .
        .byte   $D3                             ; E7D5 D3                       .
LE7D6:  .byte   $4E                             ; E7D6 4E                       N
        .byte   $E0                             ; E7D7 E0                       .
LE7D8:  .byte   $02                             ; E7D8 02                       .
CMD_RESTORE:
        bcc     LE778                           ; E7D9 90 9D                    ..
        jmp     LE97C                           ; E7DB 4C 7C E9                 L|.

; ----------------------------------------------------------------------------
        jsr     LF03F                           ; E7DE 20 3F F0                  ?.
        jsr     LD27F                           ; E7E1 20 7F D2                  ..
        stx     $F3                             ; E7E4 86 F3                    ..
        jsr     LD22C                           ; E7E6 20 2C D2                  ,.
        jsr     LD27F                           ; E7E9 20 7F D2                  ..
        stx     $F4                             ; E7EC 86 F4                    ..
        lda     #$04                            ; E7EE A9 04                    ..
        sta     $F5                             ; E7F0 85 F5                    ..
        lda     #$00                            ; E7F2 A9 00                    ..
LE7F4:  .byte   $85                             ; E7F4 85                       .
CMD_QUIT:
        .byte   $F6                             ; E7F5 F6                       .
LE7F6:  ldx     $F6                             ; E7F6 A6 F6                    ..
        txa                                     ; E7F8 8A                       .
        eor     #$01                            ; E7F9 49 01                    I.
        sta     $F6                             ; E7FB 85 F6                    ..
        ldy     $F3,x                           ; E7FD B4 F3                    ..
        lda     #$00                            ; E7FF A9 00                    ..
        jsr     LD2CA                           ; E801 20 CA D2                  ..
        jsr     LF07F                           ; E804 20 7F F0                  ..
        lda     #$E0                            ; E807 A9 E0                    ..
        ldy     #$BF                            ; E809 A0 BF                    ..
        jsr     LD2BA                           ; E80B 20 BA D2                  ..
        lda     #$EA                            ; E80E A9 EA                    ..
        ldy     #$BF                            ; E810 A0 BF                    ..
        jsr     LD2A2                           ; E812 20 A2 D2                  ..
        ldx     #$E0                            ; E815 A2 E0                    ..
        ldy     #$BF                            ; E817 A0 BF                    ..
        jsr     LD2C2                           ; E819 20 C2 D2                  ..
        dec     $F5                             ; E81C C6 F5                    ..
        bne     LE7F6                           ; E81E D0 D6                    ..
        rts                                     ; E820 60                       `

; ----------------------------------------------------------------------------
        ldy     #$1B                            ; E821 A0 1B                    ..
        bit     $18A0                           ; E823 2C A0 18                 ,..
        bit     $15A0                           ; E826 2C A0 15                 ,..
        bit     $12A0                           ; E829 2C A0 12                 ,..
        bit     $0FA0                           ; E82C 2C A0 0F                 ,..
        bit     $0CA0                           ; E82F 2C A0 0C                 ,..
        ldx     #$56                            ; E832 A2 56                    .V
        bne     LE85E                           ; E834 D0 28                    .(
        ldx     #$42                            ; E836 A2 42                    .B
        bit     $56A2                           ; E838 2C A2 56                 ,.V
        .byte   $2C                             ; E83B 2C                       ,
        .byte   $A2                             ; E83C A2                       .
LE83D:  jmp     L09A0                           ; E83D 4C A0 09                 L..

; ----------------------------------------------------------------------------
        bne     LE85E                           ; E840 D0 1C                    ..
        ldx     #$42                            ; E842 A2 42                    .B
        bit     $56A2                           ; E844 2C A2 56                 ,.V
        bit     $4CA2                           ; E847 2C A2 4C                 ,.L
        ldy     #$06                            ; E84A A0 06                    ..
        bne     LE85E                           ; E84C D0 10                    ..
        ldx     #$42                            ; E84E A2 42                    .B
        .byte   $2C                             ; E850 2C                       ,
        .byte   $A2                             ; E851 A2                       .
LE852:  .byte   $47                             ; E852 47                       G
CMD_STRUN:
        bit     $4CA2                           ; E853 2C A2 4C                 ,.L
        bit     $51A2                           ; E856 2C A2 51                 ,.Q
        bit     $56A2                           ; E859 2C A2 56                 ,.V
        ldy     #$03                            ; E85C A0 03                    ..
LE85E:  lda     #$C4                            ; E85E A9 C4                    ..
        pha                                     ; E860 48                       H
        tya                                     ; E861 98                       .
        pha                                     ; E862 48                       H
        cpx     SEDORIC_EXTNB                   ; E863 EC 15 C0                 ...
        beq     LE8B9                           ; E866 F0 51                    .Q
        bit     $5BA2                           ; E868 2C A2 5B                 ,.[
        txa                                     ; E86B 8A                       .
        pha                                     ; E86C 48                       H
        jsr     LEA06                           ; E86D 20 06 EA                  ..
        beq     LE88F                           ; E870 F0 1D                    ..
        ldx     #$0C                            ; E872 A2 0C                    ..
        jsr     LD36C                           ; E874 20 6C D3                  l.
        nop                                     ; E877 EA                       .
        jsr     LD648                           ; E878 20 48 D6                  H.
        cli                                     ; E87B 58                       X
        php                                     ; E87C 08                       .
        lda     #$0B                            ; E87D A9 0B                    ..
        jsr     XAFCAR                          ; E87F 20 2A D6                  *.
        plp                                     ; E882 28                       (
        bcc     LE88F                           ; E883 90 0A                    ..
        pla                                     ; E885 68                       h
        cmp     #$5B                            ; E886 C9 5B                    .[
        beq     LE88C                           ; E888 F0 02                    ..
        pla                                     ; E88A 68                       h
        pla                                     ; E88B 68                       h
LE88C:  jmp     LD1DC                           ; E88C 4C DC D1                 L..

; ----------------------------------------------------------------------------
LE88F:  jsr     XPMAP                           ; E88F 20 4C DA                  L.
        lda     SEDORIC_BUF2+7                  ; E892 AD 07 C2                 ...
        sta     $C04B                           ; E895 8D 4B C0                 .K.
        lda     SEDORIC_BUF2+10                 ; E898 AD 0A C2                 ...
        .byte   $D0                             ; E89B D0                       .
LE89C:  .byte   $D0                             ; E89C D0                       .
CMD_TKEN:
        ldx     #$FF                            ; E89D A2 FF                    ..
        pla                                     ; E89F 68                       h
        sta     SEDORIC_EXTNB                   ; E8A0 8D 15 C0                 ...
        sec                                     ; E8A3 38                       8
LE8A4:  tay                                     ; E8A4 A8                       .
        inx                                     ; E8A5 E8                       .
        sbc     SEDORIC_BUF2+7                  ; E8A6 ED 07 C2                 ...
        beq     LE8AD                           ; E8A9 F0 02                    ..
        bcs     LE8A4                           ; E8AB B0 F7                    ..
LE8AD:  stx     SEDORIC_TRACK                   ; E8AD 8E 01 C0                 ...
        ldx     #$04                            ; E8B0 A2 04                    ..
        lda     #$C4                            ; E8B2 A9 C4                    ..
        jsr     XDLOAD                          ; E8B4 20 E5 F1                  ..
        sec                                     ; E8B7 38                       8
        .byte   $24                             ; E8B8 24                       $
LE8B9:  clc                                     ; E8B9 18                       .
        ror     $C016                           ; E8BA 6E 16 C0                 n..
        ldx     #$03                            ; E8BD A2 03                    ..
LE8BF:  lda     SEDKERN_START,x                 ; E8BF BD 00 C4                 ...
        sta     SEDORIC_EXTER,x                 ; E8C2 9D 0D C0                 ...
        dex                                     ; E8C5 CA                       .
        bpl     LE8BF                           ; E8C6 10 F7                    ..
        lda     SEDORIC_EXTNB                   ; E8C8 AD 15 C0                 ...
        cmp     #$5B                            ; E8CB C9 5B                    .[
        beq     LE8D2                           ; E8CD F0 03                    ..
        jmp     LD39E                           ; E8CF 4C 9E D3                 L..

; ----------------------------------------------------------------------------
LE8D2:  ldx     #$7C                            ; E8D2 A2 7C                    .|
        lda     #$20                            ; E8D4 A9 20                    . 
LE8D6:  ldy     #$00                            ; E8D6 A0 00                    ..
        sty     SEDORIC_TRACK                   ; E8D8 8C 01 C0                 ...
        iny                                     ; E8DB C8                       .
        jsr     XDLOAD                          ; E8DC 20 E5 F1                  ..
        .byte   $20                             ; E8DF 20                        
LE8E0:  .byte   $9E                             ; E8E0 9E                       .
CMD_UNTKEN:
        .byte   $D3                             ; E8E1 D3                       .
        jmp     LC404                           ; E8E2 4C 04 C4                 L..

; ----------------------------------------------------------------------------
        stx     $F5                             ; E8E5 86 F5                    ..
        sta     $C004                           ; E8E7 8D 04 C0                 ...
        lda     #$00                            ; E8EA A9 00                    ..
        sta     SEDORIC_RWBUF                   ; E8EC 8D 03 C0                 ...
        sei                                     ; E8EF 78                       x
LE8F0:  sty     SEDORIC_SECTOR                  ; E8F0 8C 02 C0                 ...
        jsr     XPRSEC                          ; E8F3 20 73 DA                  s.
        inc     $C004                           ; E8F6 EE 04 C0                 ...
        ldy     SEDORIC_SECTOR                  ; E8F9 AC 02 C0                 ...
        cpy     $C04B                           ; E8FC CC 4B C0                 .K.
        bcc     LE906                           ; E8FF 90 05                    ..
        inc     SEDORIC_TRACK                   ; E901 EE 01 C0                 ...
        ldy     #$00                            ; E904 A0 00                    ..
LE906:  iny                                     ; E906 C8                       .
        dec     $F5                             ; E907 C6 F5                    ..
        bne     LE8F0                           ; E909 D0 E5                    ..
        cli                                     ; E90B 58                       X
        rts                                     ; E90C 60                       `

; ----------------------------------------------------------------------------
LE90D:  jmp     LE0E0                           ; E90D 4C E0 E0                 L..

; ----------------------------------------------------------------------------
        beq     LE939                           ; E910 F0 27                    .'
        jsr     LD44F                           ; E912 20 4F D4                  O.
        jsr     LD79E                           ; E915 20 9E D7                  ..
        jsr     LDFE6                           ; E918 20 E6 DF                  ..
        lda     #$00                            ; E91B A9 00                    ..
        ldy     #$C4                            ; E91D A0 C4                    ..
        sta     $C052                           ; E91F 8D 52 C0                 .R.
        sty     $C053                           ; E922 8C 53 C0                 .S.
        lda     #$40                            ; E925 A9 40                    .@
        sta     $C04E                           ; E927 8D 4E C0                 .N.
        jsr     LE0E5                           ; E92A 20 E5 E0                  ..
        lda     $C051                           ; E92D AD 51 C0                 .Q.
        and     #$20                            ; E930 29 20                    ) 
        beq     LE90D                           ; E932 F0 D9                    ..
        lda     #$01                            ; E934 A9 01                    ..
        sta     SEDORIC_EXTNB                   ; E936 8D 15 C0                 ...
LE939:  ldy     SEDORIC_EXTNB                   ; E939 AC 15 C0                 ...
        dey                                     ; E93C 88                       .
        bne     LE90D                           ; E93D D0 CE                    ..
        lda     BASIC11_FLG                     ; E93F AD 6A 02                 .j.
        pha                                     ; E942 48                       H
        php                                     ; E943 08                       .
        jsr     LDFDE                           ; E944 20 DE DF                  ..
        lda     #$B8                            ; E947 A9 B8                    ..
        ldy     #$BB                            ; E949 A0 BB                    ..
        sta     $F2                             ; E94B 85 F2                    ..
LE94D:  sty     $F3                             ; E94D 84 F3                    ..
        lda     #$E8                            ; E94F A9 E8                    ..
        ldy     #$C3                            ; E951 A0 C3                    ..
        sta     $F4                             ; E953 85 F4                    ..
        sty     $F5                             ; E955 84 F5                    ..
        ldx     #$04                            ; E957 A2 04                    ..
        ldy     #$18                            ; E959 A0 18                    ..
LE95B:  lda     ($F4),y                         ; E95B B1 F4                    ..
        sta     ($F2),y                         ; E95D 91 F2                    ..
        iny                                     ; E95F C8                       .
        bne     LE95B                           ; E960 D0 F9                    ..
        inc     $F3                             ; E962 E6 F3                    ..
        inc     $F5                             ; E964 E6 F5                    ..
        dex                                     ; E966 CA                       .
        bne     LE95B                           ; E967 D0 F2                    ..
        jsr     LF327                           ; E969 20 27 F3                  '.
        jsr     LF309                           ; E96C 20 09 F3                  ..
LE96F:  jsr     XCURON                          ; E96F 20 3E D7                  >.
        cli                                     ; E972 58                       X
        jsr     LD845                           ; E973 20 45 D8                  E.
        .byte   $10                             ; E976 10                       .
LE977:  .byte   $FB                             ; E977 FB                       .
        sei                                     ; E978 78                       x
        cmp     #$03                            ; E979 C9 03                    ..
        .byte   $F0                             ; E97B F0                       .
LE97C:  pla                                     ; E97C 68                       h
        .byte   $C9                             ; E97D C9                       .
LE97E:  .byte   $7F                             ; E97E 7F                       .
CMD_ERR:bne     LE996                           ; E97F D0 15                    ..
        lda     #$08                            ; E981 A9 08                    ..
        jsr     LF2EC                           ; E983 20 EC F2                  ..
        bmi     LE96F                           ; E986 30 E7                    0.
        jsr     LF2CA                           ; E988 20 CA F2                  ..
        bne     LE9A2                           ; E98B D0 15                    ..
        lda     #$09                            ; E98D A9 09                    ..
        jsr     XAFCAR                          ; E98F 20 2A D6                  *.
LE992:  lda     #$7F                            ; E992 A9 7F                    ..
        bne     LE99A                           ; E994 D0 04                    ..
LE996:  cmp     #$20                            ; E996 C9 20                    . 
LE998:  .byte   $90                             ; E998 90                       .
CMD_ERRGOTO:
        asl     a                               ; E999 0A                       .
LE99A:  jsr     XAFCAR                          ; E99A 20 2A D6                  *.
        lda     #$08                            ; E99D A9 08                    ..
        jsr     XAFCAR                          ; E99F 20 2A D6                  *.
LE9A2:  lda     #$09                            ; E9A2 A9 09                    ..
        cmp     #$08                            ; E9A4 C9 08                    ..
        bcc     LE99A                           ; E9A6 90 F2                    ..
        cmp     #$0C                            ; E9A8 C9 0C                    ..
        beq     LE96F                           ; E9AA F0 C3                    ..
        bcc     LE9C0                           ; E9AC 90 12                    ..
        .byte   $C9                             ; E9AE C9                       .
LE9AF:  .byte   $0E                             ; E9AF 0E                       .
CMD_ERROR:
        beq     LE96F                           ; E9B0 F0 BD                    ..
        cmp     #$0D                            ; E9B2 C9 0D                    ..
        bne     LE99A                           ; E9B4 D0 E4                    ..
        lda     #$09                            ; E9B6 A9 09                    ..
LE9B8:  .byte   $20                             ; E9B8 20                        
        .byte   $EC                             ; E9B9 EC                       .
LE9BA:  .byte   $F2                             ; E9BA F2                       .
CMD_RESUME:
        jsr     LF2CA                           ; E9BB 20 CA F2                  ..
        beq     LE9B8                           ; E9BE F0 F8                    ..
LE9C0:  jsr     LF2EC                           ; E9C0 20 EC F2                  ..
        jsr     LF2CA                           ; E9C3 20 CA F2                  ..
        bne     LE9C0                           ; E9C6 D0 F8                    ..
        beq     LE96F                           ; E9C8 F0 A5                    ..
        pha                                     ; E9CA 48                       H
        jsr     XCUROFF                         ; E9CB 20 40 D7                  @.
        clc                                     ; E9CE 18                       .
        lda     $12                             ; E9CF A5 12                    ..
        adc     #$30                            ; E9D1 69 30                    i0
        sta     $F8                             ; E9D3 85 F8                    ..
        lda     $13                             ; E9D5 A5 13                    ..
        adc     #$08                            ; E9D7 69 08                    i.
        sta     SEDORIC_FTYPE                   ; E9D9 85 F9                    ..
        ldy     BASIC11_Y_TEXT                  ; E9DB AC 69 02                 .i.
        lda     ($F8),y                         ; E9DE B1 F8                    ..
        tay                                     ; E9E0 A8                       .
        pla                                     ; E9E1 68                       h
        cpy     #$7F                            ; E9E2 C0 7F                    ..
        rts                                     ; E9E4 60                       `

; ----------------------------------------------------------------------------
        plp                                     ; E9E5 28                       (
        jsr     LF325                           ; E9E6 20 25 F3                  %.
        jmp     LF320                           ; E9E9 4C 20 F3                 L .

; ----------------------------------------------------------------------------
LE9EC:  .byte   $46                             ; E9EC 46                       F
CMD_EXT:.byte   $F2                             ; E9ED F2                       .
        .byte   $20                             ; E9EE 20                        
LE9EF:  rol     a                               ; E9EF 2A                       *
CMD_VISUHIRES:
        dec     $AC,x                           ; E9F0 D6 AC                    ..
LE9F2:  pla                                     ; E9F2 68                       h
CMD_STATUS:
        .byte   $02                             ; E9F3 02                       .
        .byte   $C0                             ; E9F4 C0                       .
LE9F5:  .byte   $01                             ; E9F5 01                       .
CMD_PROT:
        beq     CMD_SYSTEM                      ; E9F6 F0 04                    ..
LE9F8:  .byte   $C0                             ; E9F8 C0                       .
CMD_UNPROT:
        .byte   $1B                             ; E9F9 1B                       .
        .byte   $D0                             ; E9FA D0                       .
LE9FB:  asl     a                               ; E9FB 0A                       .
CMD_SYSTEM:
        bit     $F2                             ; E9FC 24 F2                    $.
LE9FE:  .byte   $30                             ; E9FE 30                       0
CMD_CHKSUM:
        php                                     ; E9FF 08                       .
        lda     SEDORIC_BUF2,y                  ; EA00 B9 00 C2                 ...
        sta     ($F5),y                         ; EA03 91 F5                    ..
        .byte   $CC                             ; EA05 CC                       .
LEA06:  .byte   $4F                             ; EA06 4F                       O
        cpy     #$D0                            ; EA07 C0 D0                    ..
        sbc     $68,x                           ; EA09 F5 68                    .h
        tay                                     ; EA0B A8                       .
        jsr     LE228                           ; EA0C 20 28 E2                  (.
        bcs     LEA4E                           ; EA0F B0 3D                    .=
        tya                                     ; EA11 98                       .
        tax                                     ; EA12 AA                       .
        lda     $C072                           ; EA13 AD 72 C0                 .r.
        bpl     LEA25                           ; EA16 10 0D                    ..
        lsr     $C072                           ; EA18 4E 72 C0                 Nr.
        lda     #$00                            ; EA1B A9 00                    ..
        .byte   $8D                             ; EA1D 8D                       .
LEA1E:  lsr     $A5C0                           ; EA1E 4E C0 A5                 N..
        sbc     $518D,y                         ; EA21 F9 8D 51                 ..Q
        .byte   $C0                             ; EA24 C0                       .
LEA25:  jmp     LE0FA                           ; EA25 4C FA E0                 L..

; ----------------------------------------------------------------------------
        iny                                     ; EA28 C8                       .
        iny                                     ; EA29 C8                       .
        .byte   $D0                             ; EA2A D0                       .
LEA2B:  ora     $03AD,x                         ; EA2B 1D AD 03                 ...
        cpy     #$48                            ; EA2E C0 48                    .H
LEA30:  lda     $C004                           ; EA30 AD 04 C0                 ...
        pha                                     ; EA33 48                       H
        .byte   $AD                             ; EA34 AD                       .
        brk                                     ; EA35 00                       .
LEA36:  cmp     ($AC,x)                         ; EA36 C1 AC                    ..
        ora     ($C1,x)                         ; EA38 01 C1                    ..
LEA3A:  .byte   $F0                             ; EA3A F0                       .
CMD_SWAP:
        .byte   $0F                             ; EA3B 0F                       .
        jsr     READ_SECTOR_TRACK               ; EA3C 20 5D DA                  ].
        pla                                     ; EA3F 68                       h
        sta     $C004                           ; EA40 8D 04 C0                 ...
        pla                                     ; EA43 68                       h
        sta     SEDORIC_RWBUF                   ; EA44 8D 03 C0                 ...
LEA47:  ldy     #$02                            ; EA47 A0 02                    ..
LEA49:  clc                                     ; EA49 18                       .
LEA4A:  rts                                     ; EA4A 60                       `

; ----------------------------------------------------------------------------
        sec                                     ; EA4B 38                       8
        pla                                     ; EA4C 68                       h
        pla                                     ; EA4D 68                       h
LEA4E:  cli                                     ; EA4E 58                       X
        rts                                     ; EA4F 60                       `

; ----------------------------------------------------------------------------
        lda     SEDORIC_BUF1,y                  ; EA50 B9 00 C1                 ...
        sta     SEDORIC_TRACK                   ; EA53 8D 01 C0                 ...
        lda     SEDORIC_BUF1+1,y                ; EA56 B9 01 C1                 ...
        sta     SEDORIC_SECTOR                  ; EA59 8D 02 C0                 ...
        bit     $C04D                           ; EA5C 2C 4D C0                 ,M.
        bvs     LEA4A                           ; EA5F 70 E9                    p.
        jmp     XPRSEC                          ; EA61 4C 73 DA                 Ls.

; ----------------------------------------------------------------------------
        clc                                     ; EA64 18                       .
        bit     $38                             ; EA65 24 38                    $8
        ldx     $C027                           ; EA67 AE 27 C0                 .'.
        ldy     $C30F,x                         ; EA6A BC 0F C3                 ...
        bmi     LEAD0                           ; EA6D 30 61                    0a
        tya                                     ; EA6F 98                       .
        rol     a                               ; EA70 2A                       *
        rol     a                               ; EA71 2A                       *
        bpl     LEA77                           ; EA72 10 03                    ..
        jmp     LE5F3                           ; EA74 4C F3 E5                 L..

; ----------------------------------------------------------------------------
LEA77:  jsr     LE5DC                           ; EA77 20 DC E5                  ..
        lda     $C30C,x                         ; EA7A BD 0C C3                 ...
        pha                                     ; EA7D 48                       H
LEA7E:  .byte   $BD                             ; EA7E BD                       .
CMD_USER:
        ora     $48C3                           ; EA7F 0D C3 48                 ..H
        sec                                     ; EA82 38                       8
        lda     $C302                           ; EA83 AD 02 C3                 ...
        sbc     #$10                            ; EA86 E9 10                    ..
        sta     $C302                           ; EA88 8D 02 C3                 ...
        tay                                     ; EA8B A8                       .
        lda     #$10                            ; EA8C A9 10                    ..
        sta     $F2                             ; EA8E 85 F2                    ..
LEA90:  lda     SEDORIC_BUF3,y                  ; EA90 B9 00 C3                 ...
        stx     $F3                             ; EA93 86 F3                    ..
        cpy     $F3                             ; EA95 C4 F3                    ..
        beq     LEA9C                           ; EA97 F0 03                    ..
        sta     SEDORIC_BUF3,x                  ; EA99 9D 00 C3                 ...
LEA9C:  lda     #$00                            ; EA9C A9 00                    ..
        sta     SEDORIC_BUF3,y                  ; EA9E 99 00 C3                 ...
        inx                                     ; EAA1 E8                       .
        iny                                     ; EAA2 C8                       .
        dec     $F2                             ; EAA3 C6 F2                    ..
        bne     LEA90                           ; EAA5 D0 E9                    ..
        pla                                     ; EAA7 68                       h
        tay                                     ; EAA8 A8                       .
        pla                                     ; EAA9 68                       h
LEAAA:  jsr     READ_SECTOR_TRACK               ; EAAA 20 5D DA                  ].
        lda     SEDORIC_TRACK                   ; EAAD AD 01 C0                 ...
        ldy     SEDORIC_SECTOR                  ; EAB0 AC 02 C0                 ...
        jsr     XDETSE                          ; EAB3 20 15 DD                  ..
        ldx     #$02                            ; EAB6 A2 02                    ..
LEAB8:  lda     SEDORIC_BUF1,x                  ; EAB8 BD 00 C1                 ...
        cmp     #$FF                            ; EABB C9 FF                    ..
        beq     LEADC                           ; EABD F0 1D                    ..
        inx                                     ; EABF E8                       .
        bne     LEAB8                           ; EAC0 D0 F6                    ..
        lda     SEDORIC_BUF1                    ; EAC2 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; EAC5 AC 01 C1                 ...
        bne     LEAAA                           ; EAC8 D0 E0                    ..
LEACA:  jsr     XSMAP                           ; EACA 20 8A DA                  ..
        jmp     XSCAT                           ; EACD 4C 82 DA                 L..

; ----------------------------------------------------------------------------
LEAD0:  bcs     LEAD5                           ; EAD0 B0 03                    ..
        jsr     LDAB4                           ; EAD2 20 B4 DA                  ..
LEAD5:  ldx     #$09                            ; EAD5 A2 09                    ..
        jsr     LD36C                           ; EAD7 20 6C D3                  l.
        sec                                     ; EADA 38                       8
        rts                                     ; EADB 60                       `

; ----------------------------------------------------------------------------
LEADC:  lda     SEDORIC_BUF1+8,x                ; EADC BD 08 C1                 ...
        sta     $F5                             ; EADF 85 F5                    ..
        lda     SEDORIC_BUF1+9,x                ; EAE1 BD 09 C1                 ...
        sta     $F6                             ; EAE4 85 F6                    ..
LEAE6:  txa                                     ; EAE6 8A                       .
        clc                                     ; EAE7 18                       .
        adc     #$0A                            ; EAE8 69 0A                    i.
        tax                                     ; EAEA AA                       .
LEAEB:  txa                                     ; EAEB 8A                       .
        pha                                     ; EAEC 48                       H
        lda     SEDORIC_BUF1,x                  ; EAED BD 00 C1                 ...
        ldy     SEDORIC_BUF1+1,x                ; EAF0 BC 01 C1                 ...
        jsr     XDETSE                          ; EAF3 20 15 DD                  ..
        pla                                     ; EAF6 68                       h
        tax                                     ; EAF7 AA                       .
        inx                                     ; EAF8 E8                       .
        inx                                     ; EAF9 E8                       .
        bne     LEB12                           ; EAFA D0 16                    ..
        lda     SEDORIC_BUF1                    ; EAFC AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; EAFF AC 01 C1                 ...
        beq     LEACA                           ; EB02 F0 C6                    ..
        jsr     READ_SECTOR_TRACK               ; EB04 20 5D DA                  ].
        lda     SEDORIC_TRACK                   ; EB07 AD 01 C0                 ...
        ldy     SEDORIC_SECTOR                  ; EB0A AC 02 C0                 ...
        .byte   $20                             ; EB0D 20                        
LEB0E:  ora     $DD,x                           ; EB0E 15 DD                    ..
        ldx     #$02                            ; EB10 A2 02                    ..
LEB12:  ldy     $F5                             ; EB12 A4 F5                    ..
        bne     LEB18                           ; EB14 D0 02                    ..
        dec     $F6                             ; EB16 C6 F6                    ..
LEB18:  dec     $F5                             ; EB18 C6 F5                    ..
        lda     $F5                             ; EB1A A5 F5                    ..
        ora     $F6                             ; EB1C 05 F6                    ..
        bne     LEAEB                           ; EB1E D0 CB                    ..
        beq     LEAB8                           ; EB20 F0 96                    ..
LEB22:  jsr     LDAB4                           ; EB22 20 B4 DA                  ..
CMD_NUM:lda     #$20                            ; EB25 A9 20                    . 
        sta     $C04C                           ; EB27 8D 4C C0                 .L.
        ldx     $C027                           ; EB2A AE 27 C0                 .'.
        lda     $C30F,x                         ; EB2D BD 0F C3                 ...
        php                                     ; EB30 08                       .
        and     #$0F                            ; EB31 29 0F                    ).
        tay                                     ; EB33 A8                       .
        lda     $C30E,x                         ; EB34 BD 0E C3                 ...
        jsr     LD756                           ; EB37 20 56 D7                  V.
        lda     #$20                            ; EB3A A9 20                    . 
        plp                                     ; EB3C 28                       (
        bpl     LEB41                           ; EB3D 10 02                    ..
        lda     #$50                            ; EB3F A9 50                    .P
LEB41:  jmp     XAFCAR                          ; EB41 4C 2A D6                 L*.

; ----------------------------------------------------------------------------
        jsr     LD451                           ; EB44 20 51 D4                  Q.
        php                                     ; EB47 08                       .
        sei                                     ; EB48 78                       x
        lda     #$14                            ; EB49 A9 14                    ..
        ldy     #$01                            ; EB4B A0 01                    ..
        jsr     READ_SECTOR_TRACK               ; EB4D 20 5D DA                  ].
        jsr     XPMAP                           ; EB50 20 4C DA                  L.
        ldx     #$05                            ; EB53 A2 05                    ..
        jsr     LD36C                           ; EB55 20 6C D3                  l.
        lda     SEDORIC_BUFNOM                  ; EB58 AD 28 C0                 .(.
        jsr     LD60E                           ; EB5B 20 0E D6                  ..
        ldx     #$06                            ; EB5E A2 06                    ..
        ldy     SEDORIC_BUF2+10                 ; EB60 AC 0A C2                 ...
        beq     LEB77                           ; EB63 F0 12                    ..
        ldx     #$11                            ; EB65 A2 11                    ..
        dey                                     ; EB67 88                       .
        beq     LEB77                           ; EB68 F0 0D                    ..
        ldx     #$12                            ; EB6A A2 12                    ..
        jsr     LD36C                           ; EB6C 20 6C D3                  l.
        lda     SEDORIC_BUF2+10                 ; EB6F AD 0A C2                 ...
        jsr     XAFCAR                          ; EB72 20 2A D6                  *.
        ldx     #$13                            ; EB75 A2 13                    ..
LEB77:  jsr     LD36C                           ; EB77 20 6C D3                  l.
        ldy     #$EB                            ; EB7A A0 EB                    ..
LEB7C:  lda     SEDORIC_ERRVEC+1,y              ; EB7C B9 1E C0                 ...
        jsr     XAFCAR                          ; EB7F 20 2A D6                  *.
        iny                                     ; EB82 C8                       .
        bne     LEB7C                           ; EB83 D0 F7                    ..
        jsr     LE41F                           ; EB85 20 1F E4                  ..
        jsr     LD206                           ; EB88 20 06 D2                  ..
        jsr     XTVNM                           ; EB8B 20 30 DB                  0.
        bne     LEB9B                           ; EB8E D0 0B                    ..
LEB90:  .byte   $F0                             ; EB90 F0                       .
CMD_ACCENT:
        .byte   $33                             ; EB91 33                       3
LEB92:  sei                                     ; EB92 78                       x
        jsr     LE41F                           ; EB93 20 1F E4                  ..
        jsr     LDB41                           ; EB96 20 41 DB                  A.
        beq     LEBC2                           ; EB99 F0 27                    .'
LEB9B:  jsr     LE583                           ; EB9B 20 83 E5                  ..
        jsr     LDB41                           ; EB9E 20 41 DB                  A.
        beq     LEBBF                           ; EBA1 F0 1C                    ..
; XCHAR sélectionne le jeu de caractères correct (“normal” ou “accentué”) selon MODCLA. Suite commune aux commandes ACCENT, AZERTY, QWERTY et à la routine XSTATUS en EC17
SEDORIC_XCHAR:
        jsr     XAFCAR_DISPLAY_SPACE            ; EBA3 20 28 D6                  (.
        jsr     XAFCAR_DISPLAY_SPACE            ; EBA6 20 28 D6                  (.
        jsr     LE583                           ; EBA9 20 83 E5                  ..
        cli                                     ; EBAC 58                       X
        jsr     SEDORIC_KEYBOARD_WAIT           ; EBAD 20 02 D3                  ..
        bpl     LEB92                           ; EBB0 10 E0                    ..
LEBB2:  jsr     SEDORIC_KEYBOARD_WAIT           ; EBB2 20 02 D3                  ..
        bpl     LEBB2                           ; EBB5 10 FB                    ..
        cmp     #$20                            ; EBB7 C9 20                    . 
        beq     LEB92                           ; EBB9 F0 D7                    ..
        cmp     #$1B                            ; EBBB C9 1B                    ..
        bne     LEBB2                           ; EBBD D0 F3                    ..
LEBBF:  jsr     LD206                           ; EBBF 20 06 D2                  ..
LEBC2:  jsr     LD206                           ; EBC2 20 06 D2                  ..
        lda     #$20                            ; EBC5 A9 20                    . 
        sta     $C04C                           ; EBC7 8D 4C C0                 .L.
        lda     SEDORIC_BUF2+2                  ; EBCA AD 02 C2                 ...
        ldy     SEDORIC_BUF2+3                  ; EBCD AC 03 C2                 ...
        jsr     LD756                           ; EBD0 20 56 D7                  V.
        ldx     #$07                            ; EBD3 A2 07                    ..
        jsr     LD36C                           ; EBD5 20 6C D3                  l.
        lda     #$00                            ; EBD8 A9 00                    ..
        sta     $C04C                           ; EBDA 8D 4C C0                 .L.
LEBDD:  .byte   $A9                             ; EBDD A9                       .
CMD_AZERTY:
        .byte   $44                             ; EBDE 44                       D
        .byte   $2C                             ; EBDF 2C                       ,
LEBE0:  .byte   $09                             ; EBE0 09                       .
CMD_QWERTY:
        .byte   $C2                             ; EBE1 C2                       .
        bmi     LEBE6                           ; EBE2 30 02                    0.
        lda     #$53                            ; EBE4 A9 53                    .S
LEBE6:  jsr     XAFCAR                          ; EBE6 20 2A D6                  *.
        lda     #$2F                            ; EBE9 A9 2F                    ./
LEBEB:  .byte   $20                             ; EBEB 20                        
CMD_LCUR:
        rol     a                               ; EBEC 2A                       *
        dec     $AD,x                           ; EBED D6 AD                    ..
        asl     $C2                             ; EBEF 06 C2                    ..
        ldx     #$01                            ; EBF1 A2 01                    ..
        .byte   $20                             ; EBF3 20                        
LEBF4:  .byte   $50                             ; EBF4 50                       P
CMD_HCUR:
        .byte   $D7                             ; EBF5 D7                       .
        lda     #$2F                            ; EBF6 A9 2F                    ./
        jsr     XAFCAR                          ; EBF8 20 2A D6                  *.
LEBFB:  lda     SEDORIC_BUF2+7                  ; EBFB AD 07 C2                 ...
        jsr     LD74E                           ; EBFE 20 4E D7                  N.
        lda     #$29                            ; EC01 A9 29                    .)
LEC03:  .byte   $20                             ; EC03 20                        
CMD_LBRACKET:
        rol     a                               ; EC04 2A                       *
        dec     $EA,x                           ; EC05 D6 EA                    ..
        nop                                     ; EC07 EA                       .
        nop                                     ; EC08 EA                       .
        lda     #$20                            ; EC09 A9 20                    . 
        sta     $C04C                           ; EC0B 8D 4C C0                 .L.
        lda     SEDORIC_BUF2+4                  ; EC0E AD 04 C2                 ...
        ldy     SEDORIC_BUF2+5                  ; EC11 AC 05 C2                 ...
        ldx     #$02                            ; EC14 A2 02                    ..
        jsr     LD758                           ; EC16 20 58 D7                  X.
        plp                                     ; EC19 28                       (
        ldx     #$08                            ; EC1A A2 08                    ..
        jsr     LD36C                           ; EC1C 20 6C D3                  l.
        bit     $02F1                           ; EC1F 2C F1 02                 ,..
        bmi     LEC30                           ; EC22 30 0C                    0.
        lda     BASIC11_FLG                     ; EC24 AD 6A 02                 .j.
        and     #$20                            ; EC27 29 20                    ) 
        bne     LEC30                           ; EC29 D0 05                    ..
        .byte   $AD                             ; EC2B AD                       .
        .byte   $24                             ; EC2C 24                       $
LEC2D:  .byte   $C0                             ; EC2D C0                       .
CMD_INSTR:
        bpl     LEC33                           ; EC2E 10 03                    ..
LEC30:  jmp     LD206                           ; EC30 4C 06 D2                 L..

; ----------------------------------------------------------------------------
LEC33:  rts                                     ; EC33 60                       `

; ----------------------------------------------------------------------------
LEC34:  jmp     LDE23                           ; EC34 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        jsr     LE60D                           ; EC37 20 0D E6                  ..
        bne     LEC34                           ; EC3A D0 F8                    ..
        ldx     #$09                            ; EC3C A2 09                    ..
        jsr     LD34D                           ; EC3E 20 4D D3                  M.
        sec                                     ; EC41 38                       8
        bcs     LEC4C                           ; EC42 B0 08                    ..
        sec                                     ; EC44 38                       8
        bit     $18                             ; EC45 24 18                    $.
        php                                     ; EC47 08                       .
        jsr     LD451                           ; EC48 20 51 D4                  Q.
        plp                                     ; EC4B 28                       (
LEC4C:  ror     $C072                           ; EC4C 6E 72 C0                 nr.
        jsr     LD9B0                           ; EC4F 20 B0 D9                  ..
        bne     LEC57                           ; EC52 D0 03                    ..
        jmp     LE0DD                           ; EC54 4C DD E0                 L..

; ----------------------------------------------------------------------------
LEC57:  jsr     LD7A0                           ; EC57 20 A0 D7                  ..
        bcc     LEC73                           ; EC5A 90 17                    ..
        jsr     LE264                           ; EC5C 20 64 E2                  d.
        bcc     LECA7                           ; EC5F 90 46                    .F
LEC61:  rts                                     ; EC61 60                       `

; ----------------------------------------------------------------------------
LEC62:  jsr     XAFCAR                          ; EC62 20 2A D6                  *.
LEC65:  jsr     LD206                           ; EC65 20 06 D2                  ..
        jsr     LDB41                           ; EC68 20 41 DB                  A.
LEC6B:  ldx     $C027                           ; EC6B AE 27 C0                 .'.
        jsr     LDB48                           ; EC6E 20 48 DB                  H.
        beq     LECA7                           ; EC71 F0 34                    .4
LEC73:  jsr     LDAB4                           ; EC73 20 B4 DA                  ..
        bit     $C072                           ; EC76 2C 72 C0                 ,r.
        bmi     LEC9B                           ; EC79 30 20                    0 
        ldx     #$0A                            ; EC7B A2 0A                    ..
        jsr     LD36C                           ; EC7D 20 6C D3                  l.
LEC80:  jsr     SEDORIC_KEYBOARD_WAIT           ; EC80 20 02 D3                  ..
        jsr     LD3A1                           ; EC83 20 A1 D3                  ..
        cmp     #$4E                            ; EC86 C9 4E                    .N
        beq     LEC62                           ; EC88 F0 D8                    ..
        cmp     #$1B                            ; EC8A C9 1B                    ..
        beq     LEC61                           ; EC8C F0 D3                    ..
        cmp     #$59                            ; EC8E C9 59                    .Y
        bne     LEC80                           ; EC90 D0 EE                    ..
        .byte   $20                             ; EC92 20                        
LEC93:  rol     a                               ; EC93 2A                       *
CMD_LINPUT:
        dec     $20,x                           ; EC94 D6 20                    . 
        asl     $D2                             ; EC96 06 D2                    ..
        jsr     LDAB4                           ; EC98 20 B4 DA                  ..
LEC9B:  jsr     LE266                           ; EC9B 20 66 E2                  f.
        bcs     LEC65                           ; EC9E B0 C5                    ..
        ldx     #$0B                            ; ECA0 A2 0B                    ..
        jsr     LD36C                           ; ECA2 20 6C D3                  l.
        bmi     LEC6B                           ; ECA5 30 C4                    0.
LECA7:  lda     #$00                            ; ECA7 A9 00                    ..
        sta     $F5                             ; ECA9 85 F5                    ..
        lda     LE7D1                           ; ECAB AD D1 E7                 ...
        ldx     LE7D2                           ; ECAE AE D2 E7                 ...
        clc                                     ; ECB1 18                       .
        .byte   $24                             ; ECB2 24                       $
LECB3:  sec                                     ; ECB3 38                       8
        sbc     #$0F                            ; ECB4 E9 0F                    ..
        inc     $F5                             ; ECB6 E6 F5                    ..
        bcs     LECB3                           ; ECB8 B0 F9                    ..
        dex                                     ; ECBA CA                       .
        bpl     LECB3                           ; ECBB 10 F6                    ..
        ldx     LE7D3                           ; ECBD AE D3 E7                 ...
        cpx     $F5                             ; ECC0 E4 F5                    ..
        beq     LEC61                           ; ECC2 F0 9D                    ..
        dex                                     ; ECC4 CA                       .
        stx     $F5                             ; ECC5 86 F5                    ..
        jsr     CMD_REN                         ; ECC7 20 37 E5                  7.
        nop                                     ; ECCA EA                       .
LECCB:  dec     $F5                             ; ECCB C6 F5                    ..
        bne     LECD5                           ; ECCD D0 06                    ..
        sta     $C05C                           ; ECCF 8D 5C C0                 .\.
        sty     $C05D                           ; ECD2 8C 5D C0                 .].
LECD5:  jsr     READ_SECTOR_TRACK               ; ECD5 20 5D DA                  ].
        lda     SEDORIC_BUF1                    ; ECD8 AD 00 C1                 ...
        ldy     SEDORIC_BUF1+1                  ; ECDB AC 01 C1                 ...
        bne     LECCB                           ; ECDE D0 EB                    ..
        ldy     #$10                            ; ECE0 A0 10                    ..
        sty     $F5                             ; ECE2 84 F5                    ..
LECE4:  jsr     LDBA5                           ; ECE4 20 A5 DB                  ..
        ldy     $F5                             ; ECE7 A4 F5                    ..
LECE9:  cpy     SEDORIC_BUF1+2                  ; ECE9 CC 02 C1                 ...
        beq     LED02                           ; ECEC F0 14                    ..
        lda     SEDORIC_BUF1,y                  ; ECEE B9 00 C1                 ...
        sta     SEDORIC_BUF3,x                  ; ECF1 9D 00 C3                 ...
        iny                                     ; ECF4 C8                       .
        inx                                     ; ECF5 E8                       .
        stx     $C302                           ; ECF6 8E 02 C3                 ...
        bne     LECE9                           ; ECF9 D0 EE                    ..
        sty     $F5                             ; ECFB 84 F5                    ..
        jsr     XSCAT                           ; ECFD 20 82 DA                  ..
        beq     LECE4                           ; ED00 F0 E2                    ..
LED02:  jsr     XSCAT                           ; ED02 20 82 DA                  ..
        dec     LE7D3                           ; ED05 CE D3 E7                 ...
        lda     $C05C                           ; ED08 AD 5C C0                 .\.
        ldy     $C05D                           ; ED0B AC 5D C0                 .].
        jsr     LDA63                           ; ED0E 20 63 DA                  c.
        lda     SEDORIC_BUF3                    ; ED11 AD 00 C3                 ...
        pha                                     ; ED14 48                       H
        lda     $C301                           ; ED15 AD 01 C3                 ...
        pha                                     ; ED18 48                       H
        lda     #$00                            ; ED19 A9 00                    ..
        sta     SEDORIC_BUF3                    ; ED1B 8D 00 C3                 ...
        sta     $C301                           ; ED1E 8D 01 C3                 ...
        jsr     XSVSEC                          ; ED21 20 A4 DA                  ..
        pla                                     ; ED24 68                       h
        tay                                     ; ED25 A8                       .
        pla                                     ; ED26 68                       h
        ldx     LE7D3                           ; ED27 AE D3 E7                 ...
        cpx     #$01                            ; ED2A E0 01                    ..
        bcc     LED31                           ; ED2C 90 03                    ..
LED2E:  jsr     XDETSE                          ; ED2E 20 15 DD                  ..
LED31:  jsr     XSMAP                           ; ED31 20 8A DA                  ..
        .byte   $4C                             ; ED34 4C                       L
        .byte   $A7                             ; ED35 A7                       .
LED36:  cpx     $AD                             ; ED36 E4 AD                    ..
        .byte   $27                             ; ED38 27                       '
        cpy     #$48                            ; ED39 C0 48                    .H
        ldx     SEDORIC_DRIVE                   ; ED3B AE 00 C0                 ...
        lda     LF638,x                         ; ED3E BD 38 F6                 .8.
        ldy     LF63C,x                         ; ED41 BC 3C F6                 .<.
        jsr     LE576                           ; ED44 20 76 E5                  v.
        adc     #$08                            ; ED47 69 08                    i.
        tay                                     ; ED49 A8                       .
        ldx     #$08                            ; ED4A A2 08                    ..
LED4C:  lda     $C303,x                         ; ED4C BD 03 C3                 ...
        cmp     LE6E5,y                         ; ED4F D9 E5 E6                 ...
        bne     LED66                           ; ED52 D0 12                    ..
        dey                                     ; ED54 88                       .
        dex                                     ; ED55 CA                       .
        bpl     LED4C                           ; ED56 10 F4                    ..
        pla                                     ; ED58 68                       h
        sta     $C027                           ; ED59 8D 27 C0                 .'.
        ldx     SEDORIC_DRIVE                   ; ED5C AE 00 C0                 ...
        lda     LF638,x                         ; ED5F BD 38 F6                 .8.
        ldy     LF63C,x                         ; ED62 BC 3C F6                 .<.
        rts                                     ; ED65 60                       `

; ----------------------------------------------------------------------------
LED66:  pla                                     ; ED66 68                       h
        ldx     SEDORIC_DRIVE                   ; ED67 AE 00 C0                 ...
        ldy     #$04                            ; ED6A A0 04                    ..
        tya                                     ; ED6C 98                       .
        sta     LF63C,x                         ; ED6D 9D 3C F6                 .<.
        lda     #$14                            ; ED70 A9 14                    ..
        sta     LF638,x                         ; ED72 9D 38 F6                 .8.
        rts                                     ; ED75 60                       `

; ----------------------------------------------------------------------------
        jsr     LDA63                           ; ED76 20 63 DA                  c.
        lda     SEDORIC_DRIVE                   ; ED79 AD 00 C0                 ...
        asl     a                               ; ED7C 0A                       .
        asl     a                               ; ED7D 0A                       .
        asl     a                               ; ED7E 0A                       .
        adc     SEDORIC_DRIVE                   ; ED7F 6D 00 C0                 m..
        rts                                     ; ED82 60                       `

; ----------------------------------------------------------------------------
        ldx     $C027                           ; ED83 AE 27 C0                 .'.
        lda     $C30F,x                         ; ED86 BD 0F C3                 ...
        rol     a                               ; ED89 2A                       *
        rol     a                               ; ED8A 2A                       *
        bmi     LED91                           ; ED8B 30 04                    0.
        jsr     LE322                           ; ED8D 20 22 E3                  ".
        rts                                     ; ED90 60                       `

; ----------------------------------------------------------------------------
LED91:  ldy     #$08                            ; ED91 A0 08                    ..
        jsr     LDAC3                           ; ED93 20 C3 DA                  ..
        lda     #$D2                            ; ED96 A9 D2                    ..
        ldy     #$E5                            ; ED98 A0 E5                    ..
        jsr     XAFSTR                          ; ED9A 20 37 D6                  7.
        rts                                     ; ED9D 60                       `

; ----------------------------------------------------------------------------
        stx     SEDORIC_FTYPE                   ; ED9E 86 F9                    ..
        lda     $C30F,x                         ; EDA0 BD 0F C3                 ...
        rol     a                               ; EDA3 2A                       *
        rol     a                               ; EDA4 2A                       *
        bmi     LEDAC                           ; EDA5 30 05                    0.
        bit     $07                             ; EDA7 24 07                    $.
        jmp     LC4D7                           ; EDA9 4C D7 C4                 L..

; ----------------------------------------------------------------------------
LEDAC:  jsr     LDAB4                           ; EDAC 20 B4 DA                  ..
        lda     #$C5                            ; EDAF A9 C5                    ..
        ldy     #$E5                            ; EDB1 A0 E5                    ..
        jsr     XAFSTR                          ; EDB3 20 37 D6                  7.
        jmp     LC57A                           ; EDB6 4C 7A C5                 Lz.

; ----------------------------------------------------------------------------
        stx     SEDORIC_DRVDEF                  ; EDB9 8E 09 C0                 ...
        ldy     #$2E                            ; EDBC A0 2E                    ..
        jsr     LE78A                           ; EDBE 20 8A E7                  ..
        jsr     LC644                           ; EDC1 20 44 C6                  D.
        rts                                     ; EDC4 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; EDC5 20                        
; X
SEDORIC_STR_NOT_ALLOWED:
        .byte   "NOT ALLOWED"                   ; EDC6 4E 4F 54 20 41 4C 4C 4F  NOT ALLO
                                                ; EDCE 57 45 44                 WED
; ----------------------------------------------------------------------------
        brk                                     ; EDD1 00                       .
        jsr     L2020                           ; EDD2 20 20 20                    
        jsr     L5B20                           ; EDD5 20 20 5B                   [
        rol     a                               ; EDD8 2A                       *
        eor     a:$20,x                         ; EDD9 5D 20 00                 ] .
        lda     LE7D1                           ; EDDC AD D1 E7                 ...
        .byte   $D0                             ; EDDF D0                       .
LEDE0:  .byte   $03                             ; EDE0 03                       .
        dec     LE7D2                           ; EDE1 CE D2 E7                 ...
        dec     LE7D1                           ; EDE4 CE D1 E7                 ...
        lda     SEDORIC_BUF2+4                  ; EDE7 AD 04 C2                 ...
        bne     LEDEF                           ; EDEA D0 03                    ..
        dec     SEDORIC_BUF2+5                  ; EDEC CE 05 C2                 ...
LEDEF:  dec     SEDORIC_BUF2+4                  ; EDEF CE 04 C2                 ...
        rts                                     ; EDF2 60                       `

; ----------------------------------------------------------------------------
        lda     #$C5                            ; EDF3 A9 C5                    ..
        ldy     #$E5                            ; EDF5 A0 E5                    ..
        jsr     XAFSTR                          ; EDF7 20 37 D6                  7.
        sec                                     ; EDFA 38                       8
        rts                                     ; EDFB 60                       `

; ----------------------------------------------------------------------------
LEDFC:  jsr     LD451                           ; EDFC 20 51 D4                  Q.
        jsr     LDB2D                           ; EDFF 20 2D DB                  -.
        php                                     ; EE02 08                       .
        lda     #$00                            ; EE03 A9 00                    ..
        plp                                     ; EE05 28                       (
        beq     LEE0A                           ; EE06 F0 02                    ..
        lda     #$01                            ; EE08 A9 01                    ..
LEE0A:  jmp     LD7D5                           ; EE0A 4C D5 D7                 L..

; ----------------------------------------------------------------------------
        ldy     SEDORIC_DRVDEF                  ; EE0D AC 09 C0                 ...
        jsr     LD39E                           ; EE10 20 9E D3                  ..
        beq     LEE22                           ; EE13 F0 0D                    ..
        sbc     #$41                            ; EE15 E9 41                    .A
        cmp     #$04                            ; EE17 C9 04                    ..
        bcs     LEE22                           ; EE19 B0 07                    ..
        tay                                     ; EE1B A8                       .
        jsr     LD7C0                           ; EE1C 20 C0 D7                  ..
        jmp     LD398                           ; EE1F 4C 98 D3                 L..

; ----------------------------------------------------------------------------
LEE22:  jsr     LD7C0                           ; EE22 20 C0 D7                  ..
        jmp     LD39E                           ; EE25 4C 9E D3                 L..

; ----------------------------------------------------------------------------
        jmp     LE0DD                           ; EE28 4C DD E0                 L..

; ----------------------------------------------------------------------------
        jmp     LE2D2                           ; EE2B 4C D2 E2                 L..

; ----------------------------------------------------------------------------
        lda     #$14                            ; EE2E A9 14                    ..
        ldy     #$02                            ; EE30 A0 02                    ..
        sty     $2F                             ; EE32 84 2F                    ./
        rts                                     ; EE34 60                       `

; ----------------------------------------------------------------------------
        ldy     #$03                            ; EE35 A0 03                    ..
        jmp     LDC8B                           ; EE37 4C 8B DC                 L..

; ----------------------------------------------------------------------------
        clc                                     ; EE3A 18                       .
        bit     $38                             ; EE3B 24 38                    $8
        pha                                     ; EE3D 48                       H
        tya                                     ; EE3E 98                       .
        pha                                     ; EE3F 48                       H
        lda     SEDORIC_TRACK                   ; EE40 AD 01 C0                 ...
        pha                                     ; EE43 48                       H
        lda     SEDORIC_SECTOR                  ; EE44 AD 02 C0                 ...
        pha                                     ; EE47 48                       H
        ldx     #$06                            ; EE48 A2 06                    ..
LEE4A:  lda     SEDORIC_BUF2+2,x                ; EE4A BD 02 C2                 ...
        pha                                     ; EE4D 48                       H
        dex                                     ; EE4E CA                       .
        bpl     LEE4A                           ; EE4F 10 F9                    ..
        bcs     LEE5B                           ; EE51 B0 08                    ..
        jsr     LE635                           ; EE53 20 35 E6                  5.
        jsr     XPMAP                           ; EE56 20 4C DA                  L.
        beq     LEE67                           ; EE59 F0 0C                    ..
LEE5B:  stx     $2F                             ; EE5B 86 2F                    ./
        jsr     LDC89                           ; EE5D 20 89 DC                  ..
        lda     #$14                            ; EE60 A9 14                    ..
        ldy     #$03                            ; EE62 A0 03                    ..
        jsr     LDA50                           ; EE64 20 50 DA                  P.
LEE67:  ldx     #$00                            ; EE67 A2 00                    ..
LEE69:  pla                                     ; EE69 68                       h
        sta     SEDORIC_BUF2+2,x                ; EE6A 9D 02 C2                 ...
        inx                                     ; EE6D E8                       .
        cpx     #$07                            ; EE6E E0 07                    ..
        bcc     LEE69                           ; EE70 90 F7                    ..
        pla                                     ; EE72 68                       h
LEE73:  sta     SEDORIC_SECTOR                  ; EE73 8D 02 C0                 ...
LEE76:  pla                                     ; EE76 68                       h
        sta     SEDORIC_TRACK                   ; EE77 8D 01 C0                 ...
        pla                                     ; EE7A 68                       h
        tay                                     ; EE7B A8                       .
        pla                                     ; EE7C 68                       h
        sec                                     ; EE7D 38                       8
        rts                                     ; EE7E 60                       `

; ----------------------------------------------------------------------------
LEE7F:  ldx     #$00                            ; EE7F A2 00                    ..
LEE81:  lda     SEDORIC_BUF2+16,x               ; EE81 BD 10 C2                 ...
        bne     LEE97                           ; EE84 D0 11                    ..
        inx                                     ; EE86 E8                       .
        cpx     #$F0                            ; EE87 E0 F0                    ..
        bne     LEE81                           ; EE89 D0 F6                    ..
        bit     $2F                             ; EE8B 24 2F                    $/
        .byte   $10                             ; EE8D 10                       .
LEE8E:  .byte   $03                             ; EE8E 03                       .
        jmp     LDC78                           ; EE8F 4C 78 DC                 Lx.

; ----------------------------------------------------------------------------
        jsr     LE63C                           ; EE92 20 3C E6                  <.
        bcs     LEE7F                           ; EE95 B0 E8                    ..
LEE97:  .byte   $AD                             ; EE97 AD                       .
LEE98:  .byte   $02                             ; EE98 02                       .
CMD_USING:
        .byte   $C2                             ; EE99 C2                       .
        bne     LEE9F                           ; EE9A D0 03                    ..
        dec     SEDORIC_BUF2+3                  ; EE9C CE 03 C2                 ...
LEE9F:  dec     SEDORIC_BUF2+2                  ; EE9F CE 02 C2                 ...
        bit     $2F                             ; EEA2 24 2F                    $/
        bmi     LEEA9                           ; EEA4 30 03                    0.
        jmp     LDC90                           ; EEA6 4C 90 DC                 L..

; ----------------------------------------------------------------------------
LEEA9:  lda     #$60                            ; EEA9 A9 60                    .`
        sta     LDCA8                           ; EEAB 8D A8 DC                 ...
        jsr     LDC90                           ; EEAE 20 90 DC                  ..
        lda     #$A9                            ; EEB1 A9 A9                    ..
        sta     LDCA8                           ; EEB3 8D A8 DC                 ...
        txa                                     ; EEB6 8A                       .
        ldx     #$00                            ; EEB7 A2 00                    ..
        clc                                     ; EEB9 18                       .
        adc     #$F0                            ; EEBA 69 F0                    i.
        bcc     LEEBF                           ; EEBC 90 01                    ..
        inx                                     ; EEBE E8                       .
LEEBF:  stx     $F3                             ; EEBF 86 F3                    ..
        jmp     LDCAD                           ; EEC1 4C AD DC                 L..

; ----------------------------------------------------------------------------
        ror     a                               ; EEC4 6A                       j
        ldx     $F3                             ; EEC5 A6 F3                    ..
        bne     LEECD                           ; EEC7 D0 04                    ..
        cmp     #$F0                            ; EEC9 C9 F0                    ..
        bcc     LEEDC                           ; EECB 90 0F                    ..
LEECD:  bit     $2F                             ; EECD 24 2F                    $/
        bmi     LEED4                           ; EECF 30 03                    0.
        jsr     LE63C                           ; EED1 20 3C E6                  <.
LEED4:  sec                                     ; EED4 38                       8
        sbc     #$F0                            ; EED5 E9 F0                    ..
LEED7:  tax                                     ; EED7 AA                       .
        sec                                     ; EED8 38                       8
        jmp     LDD0E                           ; EED9 4C 0E DD                 L..

; ----------------------------------------------------------------------------
LEEDC:  bit     $2F                             ; EEDC 24 2F                    $/
        bpl     LEED7                           ; EEDE 10 F7                    ..
        jsr     LE63A                           ; EEE0 20 3A E6                  :.
        bcs     LEED7                           ; EEE3 B0 F2                    ..
        brk                                     ; EEE5 00                       .
        brk                                     ; EEE6 00                       .
        brk                                     ; EEE7 00                       .
        brk                                     ; EEE8 00                       .
        brk                                     ; EEE9 00                       .
        brk                                     ; EEEA 00                       .
        brk                                     ; EEEB 00                       .
        brk                                     ; EEEC 00                       .
        brk                                     ; EEED 00                       .
        brk                                     ; EEEE 00                       .
        brk                                     ; EEEF 00                       .
        brk                                     ; EEF0 00                       .
        brk                                     ; EEF1 00                       .
        brk                                     ; EEF2 00                       .
        brk                                     ; EEF3 00                       .
        brk                                     ; EEF4 00                       .
        brk                                     ; EEF5 00                       .
        brk                                     ; EEF6 00                       .
        brk                                     ; EEF7 00                       .
        brk                                     ; EEF8 00                       .
        brk                                     ; EEF9 00                       .
        brk                                     ; EEFA 00                       .
        brk                                     ; EEFB 00                       .
        brk                                     ; EEFC 00                       .
        brk                                     ; EEFD 00                       .
        brk                                     ; EEFE 00                       .
        brk                                     ; EEFF 00                       .
        brk                                     ; EF00 00                       .
        brk                                     ; EF01 00                       .
        brk                                     ; EF02 00                       .
        brk                                     ; EF03 00                       .
        brk                                     ; EF04 00                       .
        brk                                     ; EF05 00                       .
        brk                                     ; EF06 00                       .
        brk                                     ; EF07 00                       .
        brk                                     ; EF08 00                       .
        brk                                     ; EF09 00                       .
        brk                                     ; EF0A 00                       .
        jsr     LE94D                           ; EF0B 20 4D E9                  M.
        bcc     LEF19                           ; EF0E 90 09                    ..
        lda     V1T1L+1                         ; EF10 AD 07 03                 ...
        sta     V1T1+1                          ; EF13 8D 05 03                 ...
        lda     #$40                            ; EF16 A9 40                    .@
LEF18:  .byte   $2C                             ; EF18 2C                       ,
LEF19:  .byte   $A9                             ; EF19 A9                       .
LEF1A:  brk                                     ; EF1A 00                       .
        sta     V1ACR                           ; EF1B 8D 0B 03                 ...
        rts                                     ; EF1E 60                       `

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; EF1F 20 7F D2                  ..
        php                                     ; EF22 08                       .
        sei                                     ; EF23 78                       x
        stx     V1DRA                           ; EF24 8E 01 03                 ...
        lda     V1DRB                           ; EF27 AD 00 03                 ...
        and     #$EF                            ; EF2A 29 EF                    ).
        sta     V1DRB                           ; EF2C 8D 00 03                 ...
        ora     #$10                            ; EF2F 09 10                    ..
        sta     V1DRB                           ; EF31 8D 00 03                 ...
        plp                                     ; EF34 28                       (
        lda     #$02                            ; EF35 A9 02                    ..
LEF37:  bit     V1IFR                           ; EF37 2C 0D 03                 ,..
        beq     LEF37                           ; EF3A F0 FB                    ..
        rts                                     ; EF3C 60                       `

; ----------------------------------------------------------------------------
        jmp     LDE23                           ; EF3D 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        ldy     #$03                            ; EF40 A0 03                    ..
        bit     $06A0                           ; EF42 2C A0 06                 ,..
        bit     L09A0                           ; EF45 2C A0 09                 ,..
        bit     $0CA0                           ; EF48 2C A0 0C                 ,..
        bit     $0FA0                           ; EF4B 2C A0 0F                 ,..
        .byte   $2C                             ; EF4E 2C                       ,
; $ef4f
display_exp_scientific_notation:
        ldy     #$12                            ; EF4F A0 12                    ..
        nop                                     ; EF51 EA                       .
        nop                                     ; EF52 EA                       .
        nop                                     ; EF53 EA                       .
        .byte   $EA                             ; EF54 EA                       .
; ----------------------------------------------------------------------------
        nop                                     ; EF55 EA                       .
        nop                                     ; EF56 EA                       .
        nop                                     ; EF57 EA                       .
        nop                                     ; EF58 EA                       .
        nop                                     ; EF59 EA                       .
; $ef5a
displayCharInFinalString:
        ldx     #$65                            ; EF5A A2 65                    .e
        jmp     LF15E                           ; EF5C 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        nop                                     ; EF5F EA                       .
        nop                                     ; EF60 EA                       .
        nop                                     ; EF61 EA                       .
        nop                                     ; EF62 EA                       .
        nop                                     ; EF63 EA                       .
        nop                                     ; EF64 EA                       .
        nop                                     ; EF65 EA                       .
        nop                                     ; EF66 EA                       .
        nop                                     ; EF67 EA                       .
        nop                                     ; EF68 EA                       .
        nop                                     ; EF69 EA                       .
        nop                                     ; EF6A EA                       .
        nop                                     ; EF6B EA                       .
        nop                                     ; EF6C EA                       .
        nop                                     ; EF6D EA                       .
        nop                                     ; EF6E EA                       .
        nop                                     ; EF6F EA                       .
        ldy     #$03                            ; EF70 A0 03                    ..
        bit     $06A0                           ; EF72 2C A0 06                 ,..
        bit     L09A0                           ; EF75 2C A0 09                 ,..
        bit     $0CA0                           ; EF78 2C A0 0C                 ,..
        nop                                     ; EF7B EA                       .
        nop                                     ; EF7C EA                       .
        nop                                     ; EF7D EA                       .
        nop                                     ; EF7E EA                       .
        nop                                     ; EF7F EA                       .
        nop                                     ; EF80 EA                       .
        nop                                     ; EF81 EA                       .
        nop                                     ; EF82 EA                       .
        nop                                     ; EF83 EA                       .
        nop                                     ; EF84 EA                       .
        nop                                     ; EF85 EA                       .
        nop                                     ; EF86 EA                       .
        nop                                     ; EF87 EA                       .
        nop                                     ; EF88 EA                       .
        nop                                     ; EF89 EA                       .
        ldx     #$6A                            ; EF8A A2 6A                    .j
        jmp     LF15E                           ; EF8C 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        nop                                     ; EF8F EA                       .
        nop                                     ; EF90 EA                       .
        nop                                     ; EF91 EA                       .
        nop                                     ; EF92 EA                       .
        nop                                     ; EF93 EA                       .
        nop                                     ; EF94 EA                       .
        nop                                     ; EF95 EA                       .
        beq     LEF9E                           ; EF96 F0 06                    ..
        jsr     LD216                           ; EF98 20 16 D2                  ..
        jmp     LD2E2                           ; EF9B 4C E2 D2                 L..

; ----------------------------------------------------------------------------
LEF9E:  lda     V1T1                            ; EF9E AD 04 03                 ...
        ldy     V1T1+1                          ; EFA1 AC 05 03                 ...
        sta     $D0                             ; EFA4 85 D0                    ..
        .byte   $84                             ; EFA6 84                       .
LEFA7:  cmp     ($AD),y                         ; EFA7 D1 AD                    ..
        php                                     ; EFA9 08                       .
        .byte   $03                             ; EFAA 03                       .
        ldy     V1T2+1                          ; EFAB AC 09 03                 ...
        sta     $D2                             ; EFAE 85 D2                    ..
        sty     $D3                             ; EFB0 84 D3                    ..
        jmp     LE79B                           ; EFB2 4C 9B E7                 L..

; ----------------------------------------------------------------------------
LEFB5:  jmp     LDE23                           ; EFB5 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        bne     LEFB5                           ; EFB8 D0 FB                    ..
        sei                                     ; EFBA 78                       x
        lda     #$00                            ; EFBB A9 00                    ..
        jmp     L04AD                           ; EFBD 4C AD 04                 L..

; ----------------------------------------------------------------------------
        jsr     LE94D                           ; EFC0 20 4D E9                  M.
        bcc     LEFD6                           ; EFC3 90 11                    ..
        ldy     SEDORIC_ATMORI                  ; EFC5 AC 24 C0                 .$.
        bne     LEFCD                           ; EFC8 D0 03                    ..
        ror     $02F1                           ; EFCA 6E F1 02                 n..
LEFCD:  jmp     LD1BC                           ; EFCD 4C BC D1                 L..

; ----------------------------------------------------------------------------
        brk                                     ; EFD0 00                       .
        brk                                     ; EFD1 00                       .
        brk                                     ; EFD2 00                       .
        brk                                     ; EFD3 00                       .
        brk                                     ; EFD4 00                       .
        brk                                     ; EFD5 00                       .
LEFD6:  jmp     LD1C4                           ; EFD6 4C C4 D1                 L..

; ----------------------------------------------------------------------------
        php                                     ; EFD9 08                       .
        ldx     $9A                             ; EFDA A6 9A                    ..
        ldy     $9B                             ; EFDC A4 9B                    ..
        plp                                     ; EFDE 28                       (
        beq     LEFEB                           ; EFDF F0 0A                    ..
        jsr     LD2FA                           ; EFE1 20 FA D2                  ..
        jsr     LD19C                           ; EFE4 20 9C D1                  ..
        ldx     $CE                             ; EFE7 A6 CE                    ..
        ldy     $CF                             ; EFE9 A4 CF                    ..
LEFEB:  txa                                     ; EFEB 8A                       .
        bne     LEFEF                           ; EFEC D0 01                    ..
        dey                                     ; EFEE 88                       .
LEFEF:  dex                                     ; EFEF CA                       .
        stx     $B0                             ; EFF0 86 B0                    ..
        sty     $B1                             ; EFF2 84 B1                    ..
        rts                                     ; EFF4 60                       `

; ----------------------------------------------------------------------------
        bne     LEFB5                           ; EFF5 D0 BE                    ..
        lda     $043E                           ; EFF7 AD 3E 04                 .>.
        ldy     $043F                           ; EFFA AC 3F 04                 .?.
        sta     BASIC11_INTERPRETER_VECTOR      ; EFFD 85 F0                    ..
        sty     BASIC11_INTERPRETER_VECTOR+1    ; EFFF 84 F1                    ..
        php                                     ; F001 08                       .
        sei                                     ; F002 78                       x
        bit     SEDORIC_ATMORI                  ; F003 2C 24 C0                 ,$.
        bpl     LF028                           ; F006 10 20                    . 
        lda     #$22                            ; F008 A9 22                    ."
        ldy     #$EE                            ; F00A A0 EE                    ..
        sta     BASIC11_IRQ_VECTOR              ; F00C 8D 45 02                 .E.
        sty     BASIC11_IRQ_VECTOR+1            ; F00F 8C 46 02                 .F.
        lda     #$78                            ; F012 A9 78                    .x
        ldy     #$EB                            ; F014 A0 EB                    ..
        sta     BASIC11_KEYBOARD_GET_VECTOR     ; F016 8D 3C 02                 .<.
        sty     BASIC11_KEYBOARD_GET_VECTOR+1   ; F019 8C 3D 02                 .=.
        lda     #$B2                            ; F01C A9 B2                    ..
        ldy     #$F8                            ; F01E A0 F8                    ..
        sta     BASIC11_X                       ; F020 8D 48 02                 .H.
        sty     BASIC11_X+1                     ; F023 8C 49 02                 .I.
        plp                                     ; F026 28                       (
        rts                                     ; F027 60                       `

; ----------------------------------------------------------------------------
LF028:  lda     #$03                            ; F028 A9 03                    ..
        .byte   $A0                             ; F02A A0                       .
LF02B:  cpx     $298D                           ; F02B EC 8D 29                 ..)
        .byte   $02                             ; F02E 02                       .
        sty     BASIC10_IRQ_VECTOR+1            ; F02F 8C 2A 02                 .*.
        lda     #$30                            ; F032 A9 30                    .0
        .byte   $A0                             ; F034 A0                       .
LF035:  .byte   $F4                             ; F035 F4                       .
CMD_LUSING:
        sta     BASIC10_IRQ2_VECTOR             ; F036 8D 2C 02                 .,.
        sty     BASIC10_IRQ2_VECTOR+1           ; F039 8C 2D 02                 .-.
        plp                                     ; F03C 28                       (
        rts                                     ; F03D 60                       `

; ----------------------------------------------------------------------------
        .byte   $AD                             ; F03E AD                       .
LF03F:  .byte   $13                             ; F03F 13                       .
        cpy     #$AC                            ; F040 C0 AC                    ..
        .byte   $14                             ; F042 14                       .
        cpy     #$85                            ; F043 C0 85                    ..
        sbc     #$84                            ; F045 E9 84                    ..
        nop                                     ; F047 EA                       .
        lda     $C011                           ; F048 AD 11 C0                 ...
        ldy     $C012                           ; F04B AC 12 C0                 ...
        sta     $A8                             ; F04E 85 A8                    ..
        sty     $A9                             ; F050 84 A9                    ..
        rts                                     ; F052 60                       `

; ----------------------------------------------------------------------------
        jsr     LD25C                           ; F053 20 5C D2                  \.
        jsr     LD224                           ; F056 20 24 D2                  $.
        jsr     LD274                           ; F059 20 74 D2                  t.
        cmp     #$44                            ; F05C C9 44                    .D
        bcs     LF09A                           ; F05E B0 3A                    .:
        tax                                     ; F060 AA                       .
        tay                                     ; F061 A8                       .
        dey                                     ; F062 88                       .
LF063:  lda     ($91),y                         ; F063 B1 91                    ..
        sta     $35,y                           ; F065 99 35 00                 .5.
        dey                                     ; F068 88                       .
        bpl     LF063                           ; F069 10 F8                    ..
LF06B:  iny                                     ; F06B C8                       .
        lda     LCD10,y                         ; F06C B9 10 CD                 ...
        sta     $35,x                           ; F06F 95 35                    .5
        inx                                     ; F071 E8                       .
        cpy     #$0A                            ; F072 C0 0A                    ..
        bne     LF06B                           ; F074 D0 F5                    ..
        lda     $E9                             ; F076 A5 E9                    ..
LF078:  .byte   $A4                             ; F078 A4                       .
CMD_LINE:
        nop                                     ; F079 EA                       .
        sta     $C013                           ; F07A 8D 13 C0                 ...
        .byte   $8C                             ; F07D 8C                       .
        .byte   $14                             ; F07E 14                       .
LF07F:  cpy     #$A5                            ; F07F C0 A5                    ..
        tay                                     ; F081 A8                       .
        ldy     $A9                             ; F082 A4 A9                    ..
        sta     $C011                           ; F084 8D 11 C0                 ...
        sty     $C012                           ; F087 8C 12 C0                 ...
        lda     #$34                            ; F08A A9 34                    .4
        ldy     #$00                            ; F08C A0 00                    ..
        ldx     #$3A                            ; F08E A2 3A                    .:
        sta     $E9                             ; F090 85 E9                    ..
        sty     $EA                             ; F092 84 EA                    ..
        stx     $34                             ; F094 86 34                    .4
        dey                                     ; F096 88                       .
        sty     $A9                             ; F097 84 A9                    ..
        rts                                     ; F099 60                       `

; ----------------------------------------------------------------------------
LF09A:  jmp     LE977                           ; F09A 4C 77 E9                 Lw.

; ----------------------------------------------------------------------------
        jsr     LD25C                           ; F09D 20 5C D2                  \.
        .byte   $20                             ; F0A0 20                        
LF0A1:  sec                                     ; F0A1 38                       8
        .byte   $D2                             ; F0A2 D2                       .
        jsr     LD274                           ; F0A3 20 74 D2                  t.
        cmp     #$50                            ; F0A6 C9 50                    .P
        bcs     LF09A                           ; F0A8 B0 F0                    ..
        tax                                     ; F0AA AA                       .
        tay                                     ; F0AB A8                       .
LF0AC:  lda     ($91),y                         ; F0AC B1 91                    ..
        sta     $35,y                           ; F0AE 99 35 00                 .5.
        dey                                     ; F0B1 88                       .
        bpl     LF0AC                           ; F0B2 10 F8                    ..
        iny                                     ; F0B4 C8                       .
        sty     $35,x                           ; F0B5 94 35                    .5
        lda     $E9                             ; F0B7 A5 E9                    ..
        pha                                     ; F0B9 48                       H
        lda     #$35                            ; F0BA A9 35                    .5
        sta     $E9                             ; F0BC 85 E9                    ..
        jsr     LD194                           ; F0BE 20 94 D1                  ..
        pla                                     ; F0C1 68                       h
        sta     $E9                             ; F0C2 85 E9                    ..
        tya                                     ; F0C4 98                       .
        sec                                     ; F0C5 38                       8
        sbc     #$05                            ; F0C6 E9 05                    ..
        jsr     LD264                           ; F0C8 20 64 D2                  d.
        ldy     $D0                             ; F0CB A4 D0                    ..
        nop                                     ; F0CD EA                       .
LF0CE:  lda     $35,y                           ; F0CE B9 35 00                 .5.
        sta     ($D1),y                         ; F0D1 91 D1                    ..
        dey                                     ; F0D3 88                       .
        bpl     LF0CE                           ; F0D4 10 F8                    ..
        ldy     #$02                            ; F0D6 A0 02                    ..
LF0D8:  lda     $D0,y                           ; F0D8 B9 D0 00                 ...
        sta     ($B6),y                         ; F0DB 91 B6                    ..
LF0DD:  dey                                     ; F0DD 88                       .
CMD_BOX:bpl     LF0D8                           ; F0DE 10 F8                    ..
LF0E0:  rts                                     ; F0E0 60                       `

; ----------------------------------------------------------------------------
        jsr     LD238                           ; F0E1 20 38 D2                  8.
        jsr     LD274                           ; F0E4 20 74 D2                  t.
        tax                                     ; F0E7 AA                       .
        beq     LF0E0                           ; F0E8 F0 F6                    ..
        sta     $F3                             ; F0EA 85 F3                    ..
        ldx     #$00                            ; F0EC A2 00                    ..
        ldy     #$00                            ; F0EE A0 00                    ..
LF0F0:  lda     #$E9                            ; F0F0 A9 E9                    ..
        sta     $16                             ; F0F2 85 16                    ..
        lda     #$C0                            ; F0F4 A9 C0                    ..
        sta     $17                             ; F0F6 85 17                    ..
        sty     $F2                             ; F0F8 84 F2                    ..
        lda     ($91),y                         ; F0FA B1 91                    ..
        bpl     LF129                           ; F0FC 10 2B                    .+
        and     #$7F                            ; F0FE 29 7F                    ).
        beq     LF115                           ; F100 F0 13                    ..
        sta     $26                             ; F102 85 26                    .&
        ldy     #$00                            ; F104 A0 00                    ..
LF106:  inc     $16                             ; F106 E6 16                    ..
        bne     LF10C                           ; F108 D0 02                    ..
        inc     $17                             ; F10A E6 17                    ..
LF10C:  jsr     DO_EXEVEC                       ; F10C 20 53 04                  S.
        bpl     LF106                           ; F10F 10 F5                    ..
        dec     $26                             ; F111 C6 26                    .&
        bne     LF106                           ; F113 D0 F1                    ..
LF115:  ldy     #$01                            ; F115 A0 01                    ..
        inx                                     ; F117 E8                       .
        beq     LF138                           ; F118 F0 1E                    ..
        jsr     DO_EXEVEC                       ; F11A 20 53 04                  S.
        php                                     ; F11D 08                       .
        and     #$7F                            ; F11E 29 7F                    ).
LF120:  .byte   $9D                             ; F120 9D                       .
CMD_VUSER:
        .byte   $FF                             ; F121 FF                       .
        .byte   $C0                             ; F122 C0                       .
LF123:  iny                                     ; F123 C8                       .
CMD_DKEY:
        plp                                     ; F124 28                       (
        .byte   $10                             ; F125 10                       .
LF126:  .byte   $F0                             ; F126 F0                       .
CMD_DSYS:
        bmi     LF12F                           ; F127 30 06                    0.
LF129:  inx                                     ; F129 E8                       .
CMD_DNUM:
        beq     LF138                           ; F12A F0 0C                    ..
LF12C:  .byte   $9D                             ; F12C 9D                       .
CMD_INIST:
        .byte   $FF                             ; F12D FF                       .
        .byte   $C0                             ; F12E C0                       .
LF12F:  .byte   $C6                             ; F12F C6                       .
CMD_TRACK:
        .byte   $F3                             ; F130 F3                       .
        beq     LF13B                           ; F131 F0 08                    ..
        ldy     $F2                             ; F133 A4 F2                    ..
LF135:  iny                                     ; F135 C8                       .
CMD_MOVE:
        bne     LF0F0                           ; F136 D0 B8                    ..
LF138:  .byte   $4C                             ; F138 4C                       L
CMD_DTRACK:
        .byte   $77                             ; F139 77                       w
        .byte   $E9                             ; F13A E9                       .
LF13B:  txa                                     ; F13B 8A                       .
CMD_MERGE:
        jsr     LD264                           ; F13C 20 64 D2                  d.
        ldy     $D0                             ; F13F A4 D0                    ..
LF141:  dey                                     ; F141 88                       .
CMD_DELETE:
        .byte   $B9                             ; F142 B9                       .
        brk                                     ; F143 00                       .
LF144:  .byte   $C1                             ; F144 C1                       .
CMD_DNAME:
        sta     ($D1),y                         ; F145 91 D1                    ..
LF147:  tya                                     ; F147 98                       .
CMD_CHANGE:
        bne     LF141                           ; F148 D0 F7                    ..
        jmp     LE8D6                           ; F14A 4C D6 E8                 L..

; ----------------------------------------------------------------------------
LF14D:  .byte   $A0                             ; F14D A0                       .
CMD_RENUM:
        .byte   $02                             ; F14E 02                       .
        .byte   $B1                             ; F14F B1                       .
LF150:  .byte   $E9                             ; F150 E9                       .
CMD_BACKUP:
        and     #$DF                            ; F151 29 DF                    ).
LF153:  .byte   $D9                             ; F153 D9                       .
CMD_SEEK:
        .byte   $2E                             ; F154 2E                       .
        .byte   $CD                             ; F155 CD                       .
LF156:  .byte   $D0                             ; F156 D0                       .
CMD_COPY:
        ora     $88                             ; F157 05 88                    ..
LF159:  .byte   $10                             ; F159 10                       .
CMD_SYS:.byte   $F4                             ; F15A F4                       .
        bmi     LF16C                           ; F15B 30 0F                    0.
        .byte   $A0                             ; F15D A0                       .
LF15E:  .byte   $02                             ; F15E 02                       .
LF15F:  lda     ($E9),y                         ; F15F B1 E9                    ..
        and     #$DF                            ; F161 29 DF                    ).
        cmp     LCD2B,y                         ; F163 D9 2B CD                 .+.
        bne     LF174                           ; F166 D0 0C                    ..
LF168:  dey                                     ; F168 88                       .
CMD_INIT:
        bpl     LF15F                           ; F169 10 F4                    ..
        clc                                     ; F16B 18                       .
LF16C:  php                                     ; F16C 08                       .
        ldy     #$03                            ; F16D A0 03                    ..
        jsr     LD1E3                           ; F16F 20 E3 D1                  ..
        plp                                     ; F172 28                       (
        rts                                     ; F173 60                       `

; ----------------------------------------------------------------------------
LF174:  jmp     LDE23                           ; F174 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        ldx     #$12                            ; F177 A2 12                    ..
        jmp     LD67E                           ; F179 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF17C:  jmp     LDE20                           ; F17C 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jsr     LE94D                           ; F17F 20 4D E9                  M.
        lda     #$00                            ; F182 A9 00                    ..
        sta     $C01C                           ; F184 8D 1C C0                 ...
        sta     $C01B                           ; F187 8D 1B C0                 ...
        ror     a                               ; F18A 6A                       j
        sta     SEDORIC_FLAGERR                 ; F18B 8D 18 C0                 ...
        ldy     #$37                            ; F18E A0 37                    .7
        ldx     #$FF                            ; F190 A2 FF                    ..
        sty     $C019                           ; F192 8C 19 C0                 ...
        stx     $C01A                           ; F195 8E 1A C0                 ...
        rts                                     ; F198 60                       `

; ----------------------------------------------------------------------------
        jsr     LD2FA                           ; F199 20 FA D2                  ..
        sta     $C01C                           ; F19C 8D 1C C0                 ...
        sty     $C01B                           ; F19F 8C 1B C0                 ...
        jsr     LD19C                           ; F1A2 20 9C D1                  ..
        ldx     $CF                             ; F1A5 A6 CF                    ..
        ldy     $CE                             ; F1A7 A4 CE                    ..
        bne     LF1AC                           ; F1A9 D0 01                    ..
        dex                                     ; F1AB CA                       .
LF1AC:  dey                                     ; F1AC 88                       .
        jmp     LE992                           ; F1AD 4C 92 E9                 L..

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; F1B0 20 7F D2                  ..
        cpx     #$32                            ; F1B3 E0 32                    .2
        bcc     LF17C                           ; F1B5 90 C5                    ..
        dex                                     ; F1B7 CA                       .
        jmp     LD67E                           ; F1B8 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        beq     LF1C3                           ; F1BB F0 06                    ..
        lda     #$90                            ; F1BD A9 90                    ..
        jsr     LD22E                           ; F1BF 20 2E D2                  ..
        iny                                     ; F1C2 C8                       .
LF1C3:  php                                     ; F1C3 08                       .
        lda     $C021                           ; F1C4 AD 21 C0                 .!.
        ldy     $C022                           ; F1C7 AC 22 C0                 .".
        sta     $E9                             ; F1CA 85 E9                    ..
        sty     $EA                             ; F1CC 84 EA                    ..
        lda     SEDORIC_NOLIGN                  ; F1CE AD FE 04                 ...
        ldy     SEDORIC_NOLIGN+1                ; F1D1 AC FF 04                 ...
        sta     $A8                             ; F1D4 85 A8                    ..
        sty     $A9                             ; F1D6 84 A9                    ..
        plp                                     ; F1D8 28                       (
        beq     LF1DE                           ; F1D9 F0 03                    ..
        jmp     LD1DC                           ; F1DB 4C DC D1                 L..

; ----------------------------------------------------------------------------
LF1DE:  dec     $EA                             ; F1DE C6 EA                    ..
        ldy     #$FF                            ; F1E0 A0 FF                    ..
        lda     ($E9),y                         ; F1E2 B1 E9                    ..
        .byte   $C9                             ; F1E4 C9                       .
XDLOAD: .byte   $3A                             ; F1E5 3A                       :
        beq     LF1EA                           ; F1E6 F0 02                    ..
        ldy     #$FB                            ; F1E8 A0 FB                    ..
LF1EA:  jmp     LD1E3                           ; F1EA 4C E3 D1                 L..

; ----------------------------------------------------------------------------
        ldy     #$03                            ; F1ED A0 03                    ..
        bit     $51A0                           ; F1EF 2C A0 51                 ,.Q
        bit     $54A0                           ; F1F2 2C A0 54                 ,.T
        bit     $57A0                           ; F1F5 2C A0 57                 ,.W
        bit     $5AA0                           ; F1F8 2C A0 5A                 ,.Z
        bit     $5DA0                           ; F1FB 2C A0 5D                 ,.]
        bit     $79A0                           ; F1FE 2C A0 79                 ,.y
        ldx     #$60                            ; F201 A2 60                    .`
        jmp     LF15E                           ; F203 4C 5E F1                 L^.

; ----------------------------------------------------------------------------
        ldy     #$02                            ; F206 A0 02                    ..
        lda     SEDORIC_DRVSYS                  ; F208 AD 0A C0                 ...
        sta     SEDORIC_DRIVE                   ; F20B 8D 00 C0                 ...
        .byte   $A9                             ; F20E A9                       .
LF20F:  brk                                     ; F20F 00                       .
CMD_WINDOW:
        jsr     LDA60                           ; F210 20 60 DA                  `.
        ldx     SEDORIC_BUF2+22                 ; F213 AE 16 C2                 ...
        bne     LF21D                           ; F216 D0 05                    ..
        ldx     SEDORIC_BUF2+218                ; F218 AE DA C2                 ...
        cpx     #$34                            ; F21B E0 34                    .4
LF21D:  rts                                     ; F21D 60                       `

; ----------------------------------------------------------------------------
        pha                                     ; F21E 48                       H
        lda     #$20                            ; F21F A9 20                    . 
        and     V1DRB                           ; F221 2D 00 03                 -..
        sta     LEA2B                           ; F224 8D 2B EA                 .+.
        pla                                     ; F227 68                       h
        and     #$DF                            ; F228 29 DF                    ).
        ora     #$00                            ; F22A 09 00                    ..
        sta     V1DRB                           ; F22C 8D 00 03                 ...
        rts                                     ; F22F 60                       `

; ----------------------------------------------------------------------------
        inx                                     ; F230 E8                       .
        stx     $F2                             ; F231 86 F2                    ..
        ldx     #$3F                            ; F233 A2 3F                    .?
        rts                                     ; F235 60                       `

; ----------------------------------------------------------------------------
        stx     $30                             ; F236 86 30                    .0
        jmp     XCURON                          ; F238 4C 3E D7                 L>.

; ----------------------------------------------------------------------------
        jsr     LD238                           ; F23B 20 38 D2                  8.
        sta     $B8                             ; F23E 85 B8                    ..
        sty     $B9                             ; F240 84 B9                    ..
        lda     $28                             ; F242 A5 28                    .(
        pha                                     ; F244 48                       H
        lda     $29                             ; F245 A5 29                    .)
        pha                                     ; F247 48                       H
        jsr     LD22C                           ; F248 20 2C D2                  ,.
        jsr     LD238                           ; F24B 20 38 D2                  8.
        sta     $91                             ; F24E 85 91                    ..
        sty     $92                             ; F250 84 92                    ..
        pla                                     ; F252 68                       h
        cmp     $29                             ; F253 C5 29                    .)
        bne     LF277                           ; F255 D0 20                    . 
        pla                                     ; F257 68                       h
        cmp     $28                             ; F258 C5 28                    .(
        bne     LF277                           ; F25A D0 1B                    ..
        ldy     #$01                            ; F25C A0 01                    ..
        bit     $28                             ; F25E 24 28                    $(
        bmi     LF268                           ; F260 30 06                    0.
        bit     $29                             ; F262 24 29                    $)
        bmi     LF269                           ; F264 30 03                    0.
        iny                                     ; F266 C8                       .
        iny                                     ; F267 C8                       .
LF268:  iny                                     ; F268 C8                       .
LF269:  lda     ($91),y                         ; F269 B1 91                    ..
        tax                                     ; F26B AA                       .
        lda     ($B8),y                         ; F26C B1 B8                    ..
        sta     ($91),y                         ; F26E 91 91                    ..
        txa                                     ; F270 8A                       .
        sta     ($B8),y                         ; F271 91 B8                    ..
        dey                                     ; F273 88                       .
        bpl     LF269                           ; F274 10 F3                    ..
        rts                                     ; F276 60                       `

; ----------------------------------------------------------------------------
LF277:  ldx     #$0B                            ; F277 A2 0B                    ..
        jmp     LD67E                           ; F279 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF27C:  jmp     LDE20                           ; F27C 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; F27F 20 7F D2                  ..
        txa                                     ; F282 8A                       .
        cmp     #$04                            ; F283 C9 04                    ..
        bcs     LF27C                           ; F285 B0 F5                    ..
        asl     a                               ; F287 0A                       .
        adc     $D4                             ; F288 65 D4                    e.
        sta     $F6                             ; F28A 85 F6                    ..
        tax                                     ; F28C AA                       .
        lda     SEDORIC_USER_COMMAND_1_VECTOR+2,x; F28D BD 68 C0                .h.
        sta     $F7                             ; F290 85 F7                    ..
        lda     #$00                            ; F292 A9 00                    ..
        ldx     #$03                            ; F294 A2 03                    ..
LF296:  sta     $F2,x                           ; F296 95 F2                    ..
        dex                                     ; F298 CA                       .
        bpl     LF296                           ; F299 10 FB                    ..
LF29B:  jsr     LD39E                           ; F29B 20 9E D3                  ..
        cmp     #$2C                            ; F29E C9 2C                    .,
        bne     LF2E8                           ; F2A0 D0 46                    .F
        jsr     LD398                           ; F2A2 20 98 D3                  ..
        ldy     #$04                            ; F2A5 A0 04                    ..
LF2A7:  cmp     MISC2,y                         ; F2A7 D9 83 CD                 ...
        beq     LF2B1                           ; F2AA F0 05                    ..
        dey                                     ; F2AC 88                       .
        bpl     LF2A7                           ; F2AD 10 F8                    ..
        bmi     LF2E8                           ; F2AF 30 37                    07
LF2B1:  jsr     LD398                           ; F2B1 20 98 D3                  ..
        cpy     #$04                            ; F2B4 C0 04                    ..
        bne     LF2DA                           ; F2B6 D0 22                    ."
        jsr     LD2FA                           ; F2B8 20 FA D2                  ..
        ldx     $F6                             ; F2BB A6 F6                    ..
        sta     SEDORIC_USER_COMMAND_1_VECTOR+1,x; F2BD 9D 67 C0                .g.
        tya                                     ; F2C0 98                       .
        sta     SEDORIC_USER_COMMAND_1_VECTOR,x ; F2C1 9D 66 C0                 .f.
        jsr     LD39E                           ; F2C4 20 9E D3                  ..
        beq     LF2D3                           ; F2C7 F0 0A                    ..
        .byte   $20                             ; F2C9 20                        
LF2CA:  bit     $A9D2                           ; F2CA 2C D2 A9                 ,..
        .byte   $4F                             ; F2CD 4F                       O
        jsr     LD22E                           ; F2CE 20 2E D2                  ..
        ldx     #$80                            ; F2D1 A2 80                    ..
LF2D3:  txa                                     ; F2D3 8A                       .
        ldx     $F6                             ; F2D4 A6 F6                    ..
        sta     SEDORIC_USER_COMMAND_1_VECTOR+2,x; F2D6 9D 68 C0                .h.
        rts                                     ; F2D9 60                       `

; ----------------------------------------------------------------------------
LF2DA:  tya                                     ; F2DA 98                       .
        pha                                     ; F2DB 48                       H
        jsr     LD27F                           ; F2DC 20 7F D2                  ..
        pla                                     ; F2DF 68                       h
        tay                                     ; F2E0 A8                       .
        stx     $F2,y                           ; F2E1 96 F2                    ..
        jsr     LD39E                           ; F2E3 20 9E D3                  ..
        bne     LF29B                           ; F2E6 D0 B3                    ..
LF2E8:  ldy     $F4                             ; F2E8 A4 F4                    ..
        lda     $F5                             ; F2EA A5 F5                    ..
LF2EC:  pha                                     ; F2EC 48                       H
        ldx     $F6                             ; F2ED A6 F6                    ..
        lda     SEDORIC_USER_COMMAND_1_VECTOR,x ; F2EF BD 66 C0                 .f.
        sta     SEDORIC_EXEVEC+1                ; F2F2 8D F0 04                 ...
        lda     SEDORIC_USER_COMMAND_1_VECTOR+1,x; F2F5 BD 67 C0                .g.
        sta     SEDORIC_EXEVEC+2                ; F2F8 8D F1 04                 ...
        lda     $F2                             ; F2FB A5 F2                    ..
        ldx     $F3                             ; F2FD A6 F3                    ..
        bit     $D0                             ; F2FF 24 D0                    $.
        lda     ($20,x)                         ; F301 A1 20                    . 
        ldy     $DA                             ; F303 A4 DA                    ..
        ldy     #$06                            ; F305 A0 06                    ..
LF307:  lda     ($00),y                         ; F307 B1 00                    ..
LF309:  sta     $C022,y                         ; F309 99 22 C0                 .".
        iny                                     ; F30C C8                       .
        cpy     #$17                            ; F30D C0 17                    ..
        bne     LF307                           ; F30F D0 F6                    ..
        jsr     XTVNM                           ; F311 20 30 DB                  0.
        bne     LF319                           ; F314 D0 03                    ..
        jmp     LE0DD                           ; F316 4C DD E0                 L..

; ----------------------------------------------------------------------------
LF319:  jsr     LDAEE                           ; F319 20 EE DA                  ..
        jsr     XSMAP                           ; F31C 20 8A DA                  ..
        .byte   $20                             ; F31F 20                        
LF320:  .byte   $82                             ; F320 82                       .
        .byte   $DA                             ; F321 DA                       .
        jsr     LF4A8                           ; F322 20 A8 F4                  ..
LF325:  ldy     #$13                            ; F325 A0 13                    ..
LF327:  lda     ($00),y                         ; F327 B1 00                    ..
        sta     SEDORIC_TRACK                   ; F329 8D 01 C0                 ...
        iny                                     ; F32C C8                       .
        lda     ($00),y                         ; F32D B1 00                    ..
        sta     SEDORIC_SECTOR                  ; F32F 8D 02 C0                 ...
        jsr     LF85F                           ; F332 20 5F F8                  _.
        jmp     XSVSEC                          ; F335 4C A4 DA                 L..

; ----------------------------------------------------------------------------
        ldy     #$0A                            ; F338 A0 0A                    ..
        inc     $03                             ; F33A E6 03                    ..
        lda     ($02),y                         ; F33C B1 02                    ..
        clc                                     ; F33E 18                       .
        adc     #$01                            ; F33F 69 01                    i.
        sta     ($02),y                         ; F341 91 02                    ..
        iny                                     ; F343 C8                       .
        lda     ($02),y                         ; F344 B1 02                    ..
        adc     #$00                            ; F346 69 00                    i.
        sta     ($02),y                         ; F348 91 02                    ..
        dec     $03                             ; F34A C6 03                    ..
        ldy     #$15                            ; F34C A0 15                    ..
        lda     ($00),y                         ; F34E B1 00                    ..
        clc                                     ; F350 18                       .
        adc     #$01                            ; F351 69 01                    i.
        sta     ($00),y                         ; F353 91 00                    ..
        iny                                     ; F355 C8                       .
        lda     ($00),y                         ; F356 B1 00                    ..
        adc     #$00                            ; F358 69 00                    i.
        sta     ($00),y                         ; F35A 91 00                    ..
        jmp     XLIBSE                          ; F35C 4C 6C DC                 Ll.

; ----------------------------------------------------------------------------
        lda     $04                             ; F35F A5 04                    ..
        sta     SEDORIC_RWBUF                   ; F361 8D 03 C0                 ...
        lda     $05                             ; F364 A5 05                    ..
        sta     $C004                           ; F366 8D 04 C0                 ...
        rts                                     ; F369 60                       `

; ----------------------------------------------------------------------------
        inc     $05                             ; F36A E6 05                    ..
        clc                                     ; F36C 18                       .
        ldy     #$02                            ; F36D A0 02                    ..
        lda     ($00),y                         ; F36F B1 00                    ..
        adc     #$01                            ; F371 69 01                    i.
        sta     ($00),y                         ; F373 91 00                    ..
        lda     $04                             ; F375 A5 04                    ..
        ldy     $05                             ; F377 A4 05                    ..
        jsr     LF885                           ; F379 20 85 F8                  ..
        lda     #$01                            ; F37C A9 01                    ..
        sta     $F2                             ; F37E 85 F2                    ..
        lda     #$00                            ; F380 A9 00                    ..
        jmp     LF425                           ; F382 4C 25 F4                 L%.

; ----------------------------------------------------------------------------
        sec                                     ; F385 38                       8
        sbc     $9E                             ; F386 E5 9E                    ..
        tax                                     ; F388 AA                       .
        tya                                     ; F389 98                       .
        sbc     $9F                             ; F38A E5 9F                    ..
        tay                                     ; F38C A8                       .
        rts                                     ; F38D 60                       `

; ----------------------------------------------------------------------------
        jsr     LD24C                           ; F38E 20 4C D2                  L.
        lda     $D4                             ; F391 A5 D4                    ..
        ldx     $D3                             ; F393 A6 D3                    ..
        bpl     LF3A3                           ; F395 10 0C                    ..
        eor     #$FF                            ; F397 49 FF                    I.
        clc                                     ; F399 18                       .
        adc     #$01                            ; F39A 69 01                    i.
        cpx     #$FF                            ; F39C E0 FF                    ..
        beq     LF3A7                           ; F39E F0 07                    ..
LF3A0:  jmp     LDE20                           ; F3A0 4C 20 DE                 L .

; ----------------------------------------------------------------------------
LF3A3:  cpx     #$00                            ; F3A3 E0 00                    ..
        bne     LF3A0                           ; F3A5 D0 F9                    ..
LF3A7:  jsr     LF473                           ; F3A7 20 73 F4                  s.
        jsr     LF4A8                           ; F3AA 20 A8 F4                  ..
        bmi     LF3D2                           ; F3AD 30 23                    0#
        bne     LF3CF                           ; F3AF D0 1E                    ..
        lda     $C083                           ; F3B1 AD 83 C0                 ...
        bit     $D3                             ; F3B4 24 D3                    $.
        bmi     LF3C3                           ; F3B6 30 0B                    0.
        ldy     #$04                            ; F3B8 A0 04                    ..
        lda     ($04),y                         ; F3BA B1 04                    ..
        pha                                     ; F3BC 48                       H
        iny                                     ; F3BD C8                       .
        lda     ($04),y                         ; F3BE B1 04                    ..
        tay                                     ; F3C0 A8                       .
        pla                                     ; F3C1 68                       h
        .byte   $2C                             ; F3C2 2C                       ,
LF3C3:  ldy     #$00                            ; F3C3 A0 00                    ..
        .byte   $24                             ; F3C5 24                       $
LF3C6:  tay                                     ; F3C6 A8                       .
        sta     $F2                             ; F3C7 85 F2                    ..
        tya                                     ; F3C9 98                       .
        ldy     $F2                             ; F3CA A4 F2                    ..
        jmp     LD254                           ; F3CC 4C 54 D2                 LT.

; ----------------------------------------------------------------------------
LF3CF:  jmp     LE0E0                           ; F3CF 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LF3D2:  jsr     LFD0E                           ; F3D2 20 0E FD                  ..
        beq     LF3C6                           ; F3D5 F0 EF                    ..
        bit     $D3                             ; F3D7 24 D3                    $.
        bmi     LF3C3                           ; F3D9 30 E8                    0.
        lda     #$00                            ; F3DB A9 00                    ..
        beq     LF3C3                           ; F3DD F0 E4                    ..
        jsr     LF956                           ; F3DF 20 56 F9                  V.
        bne     LF3EA                           ; F3E2 D0 06                    ..
        jsr     LF96B                           ; F3E4 20 6B F9                  k.
        jmp     XPRSEC                          ; F3E7 4C 73 DA                 Ls.

; ----------------------------------------------------------------------------
LF3EA:  bcs     LF3FD                           ; F3EA B0 11                    ..
        jsr     LF91F                           ; F3EC 20 1F F9                  ..
        php                                     ; F3EF 08                       .
        sei                                     ; F3F0 78                       x
        .byte   $20                             ; F3F1 20                        
        .byte   $84                             ; F3F2 84                       .
LF3F3:  .byte   $F6                             ; F3F3 F6                       .
LF3F4:  lda     ($06),y                         ; F3F4 B1 06                    ..
        sta     ($02),y                         ; F3F6 91 02                    ..
        iny                                     ; F3F8 C8                       .
        bne     LF3F4                           ; F3F9 D0 F9                    ..
        plp                                     ; F3FB 28                       (
LF3FC:  rts                                     ; F3FC 60                       `

; ----------------------------------------------------------------------------
LF3FD:  jsr     LED2E                           ; F3FD 20 2E ED                  ..
        jsr     LFDD9                           ; F400 20 D9 FD                  ..
        txa                                     ; F403 8A                       .
        jsr     LF67D                           ; F404 20 7D F6                  }.
        lda     $06                             ; F407 A5 06                    ..
        ldy     $07                             ; F409 A4 07                    ..
        sta     $02                             ; F40B 85 02                    ..
        sty     $03                             ; F40D 84 03                    ..
        jsr     LF5DC                           ; F40F 20 DC F5                  ..
        jsr     LD39E                           ; F412 20 9E D3                  ..
        beq     LF3FC                           ; F415 F0 E5                    ..
        jsr     LD22C                           ; F417 20 2C D2                  ,.
        jmp     LF8FD                           ; F41A 4C FD F8                 L..

; ----------------------------------------------------------------------------
        clc                                     ; F41D 18                       .
        bit     $38                             ; F41E 24 38                    $8
        php                                     ; F420 08                       .
        jsr     LD2FA                           ; F421 20 FA D2                  ..
        .byte   $A0                             ; F424 A0                       .
LF425:  .byte   $04                             ; F425 04                       .
        lda     ($04),y                         ; F426 B1 04                    ..
        cmp     $33                             ; F428 C5 33                    .3
        iny                                     ; F42A C8                       .
        lda     ($04),y                         ; F42B B1 04                    ..
        sbc     $34                             ; F42D E5 34                    .4
        bcs     LF439                           ; F42F B0 08                    ..
        plp                                     ; F431 28                       (
        bcc     LF43B                           ; F432 90 07                    ..
        ldx     #$10                            ; F434 A2 10                    ..
        jmp     LD67E                           ; F436 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
LF439:  plp                                     ; F439 28                       (
        rts                                     ; F43A 60                       `

; ----------------------------------------------------------------------------
LF43B:  ldy     #$04                            ; F43B A0 04                    ..
        lda     $33                             ; F43D A5 33                    .3
        sta     ($04),y                         ; F43F 91 04                    ..
        iny                                     ; F441 C8                       .
        lda     $34                             ; F442 A5 34                    .4
        sta     ($04),y                         ; F444 91 04                    ..
        jsr     LF85F                           ; F446 20 5F F8                  _.
        ldy     #$13                            ; F449 A0 13                    ..
        lda     ($00),y                         ; F44B B1 00                    ..
        pha                                     ; F44D 48                       H
        iny                                     ; F44E C8                       .
        lda     ($00),y                         ; F44F B1 00                    ..
        tay                                     ; F451 A8                       .
        pla                                     ; F452 68                       h
        jmp     LDA9E                           ; F453 4C 9E DA                 L..

; ----------------------------------------------------------------------------
        jsr     LF47D                           ; F456 20 7D F4                  }.
        jsr     LD22C                           ; F459 20 2C D2                  ,.
        jsr     LF4A8                           ; F45C 20 A8 F4                  ..
        pha                                     ; F45F 48                       H
        ldy     #$06                            ; F460 A0 06                    ..
        lda     ($00),y                         ; F462 B1 00                    ..
        sta     SEDORIC_DRIVE                   ; F464 8D 00 C0                 ...
        pla                                     ; F467 68                       h
        cmp     #$01                            ; F468 C9 01                    ..
        rts                                     ; F46A 60                       `

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; F46B 20 7F D2                  ..
        stx     SEDORIC_TRACK                   ; F46E 8E 01 C0                 ...
        .byte   $20                             ; F471 20                        
        .byte   $2C                             ; F472 2C                       ,
LF473:  .byte   $D2                             ; F473 D2                       .
        jsr     LD27F                           ; F474 20 7F D2                  ..
        stx     SEDORIC_SECTOR                  ; F477 8E 02 C0                 ...
        beq     LF482                           ; F47A F0 06                    ..
        .byte   $20                             ; F47C 20                        
LF47D:  .byte   $2C                             ; F47D 2C                       ,
        .byte   $D2                             ; F47E D2                       .
LF47F:  jsr     LE60D                           ; F47F 20 0D E6                  ..
LF482:  jsr     LF4A8                           ; F482 20 A8 F4                  ..
        lda     $02                             ; F485 A5 02                    ..
        ldy     $03                             ; F487 A4 03                    ..
        sta     SEDORIC_RWBUF                   ; F489 8D 03 C0                 ...
        sty     $C004                           ; F48C 8C 04 C0                 ...
        rts                                     ; F48F 60                       `

; ----------------------------------------------------------------------------
        jsr     LE60D                           ; F490 20 0D E6                  ..
        jmp     XPMAP                           ; F493 4C 4C DA                 LL.

; ----------------------------------------------------------------------------
        jsr     LE60D                           ; F496 20 0D E6                  ..
        jmp     XSMAP                           ; F499 4C 8A DA                 L..

; ----------------------------------------------------------------------------
        jsr     LD27F                           ; F49C 20 7F D2                  ..
        txa                                     ; F49F 8A                       .
        pha                                     ; F4A0 48                       H
        and     #$7F                            ; F4A1 29 7F                    ).
        cmp     SEDORIC_BUF2+6                  ; F4A3 CD 06 C2                 ...
        bcs     LF4C8                           ; F4A6 B0 20                    . 
LF4A8:  jsr     LD22C                           ; F4A8 20 2C D2                  ,.
        jsr     LD27F                           ; F4AB 20 7F D2                  ..
        txa                                     ; F4AE 8A                       .
        dex                                     ; F4AF CA                       .
        bmi     LF4C8                           ; F4B0 30 16                    0.
        cpx     SEDORIC_BUF2+7                  ; F4B2 EC 07 C2                 ...
        bcs     LF4C8                           ; F4B5 B0 11                    ..
        tay                                     ; F4B7 A8                       .
        pla                                     ; F4B8 68                       h
        jmp     XDETSE                          ; F4B9 4C 15 DD                 L..

; ----------------------------------------------------------------------------
        jsr     XLIBSE                          ; F4BC 20 6C DC                  l.
        pha                                     ; F4BF 48                       H
        tya                                     ; F4C0 98                       .
        jsr     LD7ED                           ; F4C1 20 ED D7                  ..
        pla                                     ; F4C4 68                       h
        jmp     LD7EA                           ; F4C5 4C EA D7                 L..

; ----------------------------------------------------------------------------
LF4C8:  jmp     LDE20                           ; F4C8 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        jsr     LF956                           ; F4CB 20 56 F9                  V.
        bne     LF4D6                           ; F4CE D0 06                    ..
        jsr     LF96B                           ; F4D0 20 6B F9                  k.
        jmp     XSVSEC                          ; F4D3 4C A4 DA                 L..

; ----------------------------------------------------------------------------
LF4D6:  bcs     LF4EF                           ; F4D6 B0 17                    ..
        jsr     LF91D                           ; F4D8 20 1D F9                  ..
        php                                     ; F4DB 08                       .
LF4DC:  sei                                     ; F4DC 78                       x
        jsr     LF684                           ; F4DD 20 84 F6                  ..
LF4E0:  lda     ($02),y                         ; F4E0 B1 02                    ..
        sta     ($06),y                         ; F4E2 91 06                    ..
        iny                                     ; F4E4 C8                       .
        .byte   $CC                             ; F4E5 CC                       .
LF4E6:  .byte   $83                             ; F4E6 83                       .
        cpy     #$D0                            ; F4E7 C0 D0                    ..
LF4E9:  inc     $20,x                           ; F4E9 F6 20                    . 
        .byte   $27                             ; F4EB 27                       '
LF4EC:  .byte   $F7                             ; F4EC F7                       .
        plp                                     ; F4ED 28                       (
        rts                                     ; F4EE 60                       `

; ----------------------------------------------------------------------------
LF4EF:  jsr     LD224                           ; F4EF 20 24 D2                  $.
        jsr     LFD0E                           ; F4F2 20 0E FD                  ..
        bne     LF51B                           ; F4F5 D0 24                    .$
        ldx     #$05                            ; F4F7 A2 05                    ..
        ldy     #$00                            ; F4F9 A0 00                    ..
        bit     $28                             ; F4FB 24 28                    $(
        bpl     LF50C                           ; F4FD 10 0D                    ..
        lda     $D3                             ; F4FF A5 D3                    ..
        ldx     $D4                             ; F501 A6 D4                    ..
        sta     $91                             ; F503 85 91                    ..
        stx     $92                             ; F505 86 92                    ..
        lda     ($91),y                         ; F507 B1 91                    ..
        tax                                     ; F509 AA                       .
        ldy     #$80                            ; F50A A0 80                    ..
LF50C:  sty     $C07F                           ; F50C 8C 7F C0                 ...
        jsr     LFA39                           ; F50F 20 39 FA                  9.
        lda     #$FF                            ; F512 A9 FF                    ..
        jsr     LFDCC                           ; F514 20 CC FD                  ..
        sta     ($02),y                         ; F517 91 02                    ..
        bmi     LF52B                           ; F519 30 10                    0.
LF51B:  jsr     LFDD9                           ; F51B 20 D9 FD                  ..
        pha                                     ; F51E 48                       H
        txa                                     ; F51F 8A                       .
        jsr     LF67D                           ; F520 20 7D F6                  }.
        jsr     LFD2A                           ; F523 20 2A FD                  *.
        pla                                     ; F526 68                       h
        tax                                     ; F527 AA                       .
        jsr     LFA39                           ; F528 20 39 FA                  9.
LF52B:  jsr     LD39E                           ; F52B 20 9E D3                  ..
        beq     LF536                           ; F52E F0 06                    ..
        jsr     LD22C                           ; F530 20 2C D2                  ,.
        jmp     LF9EF                           ; F533 4C EF F9                 L..

; ----------------------------------------------------------------------------
LF536:  jmp     LFD46                           ; F536 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
        stx     $C07E                           ; F539 8E 7E C0                 .~.
        lda     $06                             ; F53C A5 06                    ..
        ldy     $07                             ; F53E A4 07                    ..
        sta     $02                             ; F540 85 02                    ..
        sty     $03                             ; F542 84 03                    ..
        clc                                     ; F544 18                       .
        ldy     #$00                            ; F545 A0 00                    ..
        jsr     LFC9E                           ; F547 20 9E FC                  ..
        jsr     LF4A8                           ; F54A 20 A8 F4                  ..
        jmp     LFE38                           ; F54D 4C 38 FE                 L8.

; ----------------------------------------------------------------------------
        pha                                     ; F550 48                       H
        jsr     LD398                           ; F551 20 98 D3                  ..
        jsr     LD22C                           ; F554 20 2C D2                  ,.
        pla                                     ; F557 68                       h
        cmp     #$44                            ; F558 C9 44                    .D
        bne     LF57C                           ; F55A D0 20                    . 
        lda     SEDORIC_DRVDEF                  ; F55C AD 09 C0                 ...
        sta     SEDORIC_DRIVE                   ; F55F 8D 00 C0                 ...
        jsr     LF47F                           ; F562 20 7F F4                  ..
        beq     LF56D                           ; F565 F0 06                    ..
        jsr     LD22C                           ; F567 20 2C D2                  ,.
        jsr     LE60D                           ; F56A 20 0D E6                  ..
LF56D:  lda     #$00                            ; F56D A9 00                    ..
        ldy     #$01                            ; F56F A0 01                    ..
        jsr     LFACB                           ; F571 20 CB FA                  ..
        ldy     #$06                            ; F574 A0 06                    ..
        lda     SEDORIC_DRIVE                   ; F576 AD 00 C0                 ...
        sta     ($00),y                         ; F579 91 00                    ..
LF57B:  rts                                     ; F57B 60                       `

; ----------------------------------------------------------------------------
LF57C:  cmp     #$52                            ; F57C C9 52                    .R
        bne     LF592                           ; F57E D0 12                    ..
        lda     #$00                            ; F580 A9 00                    ..
        ldy     #$08                            ; F582 A0 08                    ..
LF584:  jsr     LFB08                           ; F584 20 08 FB                  ..
        bne     LF57B                           ; F587 D0 F2                    ..
        jsr     LD22C                           ; F589 20 2C D2                  ,.
        jmp     LF9D8                           ; F58C 4C D8 F9                 L..

; ----------------------------------------------------------------------------
LF58F:  jmp     LDE23                           ; F58F 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
LF592:  cmp     #$53                            ; F592 C9 53                    .S
        bne     LF58F                           ; F594 D0 F9                    ..
        lda     #$80                            ; F596 A9 80                    ..
        ldy     #$10                            ; F598 A0 10                    ..
        jsr     LFB08                           ; F59A 20 08 FB                  ..
LF59D:  php                                     ; F59D 08                       .
        ldy     #$03                            ; F59E A0 03                    ..
        lda     #$0C                            ; F5A0 A9 0C                    ..
        sta     ($00),y                         ; F5A2 91 00                    ..
        iny                                     ; F5A4 C8                       .
        lda     #$00                            ; F5A5 A9 00                    ..
        sta     ($00),y                         ; F5A7 91 00                    ..
        iny                                     ; F5A9 C8                       .
        sta     ($00),y                         ; F5AA 91 00                    ..
        plp                                     ; F5AC 28                       (
        bne     LF5B8                           ; F5AD D0 09                    ..
        ldy     #$00                            ; F5AF A0 00                    ..
        lda     #$FF                            ; F5B1 A9 FF                    ..
        sta     ($02),y                         ; F5B3 91 02                    ..
        jmp     LFD46                           ; F5B5 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
LF5B8:  .byte   $4C                             ; F5B8 4C                       L
        .byte   $44                             ; F5B9 44                       D
LF5BA:  sbc     $C020,x                         ; F5BA FD 20 C0                 . .
        .byte   $FA                             ; F5BD FA                       .
        bmi     LF59D                           ; F5BE 30 DD                    0.
        jsr     LF47D                           ; F5C0 20 7D F4                  }.
        jsr     LF4A8                           ; F5C3 20 A8 F4                  ..
        bmi     LF57B                           ; F5C6 30 B3                    0.
        jmp     LE0E0                           ; F5C8 4C E0 E0                 L..

; ----------------------------------------------------------------------------
        pha                                     ; F5CB 48                       H
        tya                                     ; F5CC 98                       .
        pha                                     ; F5CD 48                       H
        ldy     #$05                            ; F5CE A0 05                    ..
        lda     ($9E),y                         ; F5D0 B1 9E                    ..
        bne     LF5D6                           ; F5D2 D0 02                    ..
        ldy     #$03                            ; F5D4 A0 03                    ..
LF5D6:  dey                                     ; F5D6 88                       .
        lda     ($9E),y                         ; F5D7 B1 9E                    ..
        tax                                     ; F5D9 AA                       .
        pha                                     ; F5DA 48                       H
        iny                                     ; F5DB C8                       .
LF5DC:  lda     ($9E),y                         ; F5DC B1 9E                    ..
        pha                                     ; F5DE 48                       H
        tay                                     ; F5DF A8                       .
        lda     #$01                            ; F5E0 A9 01                    ..
        sta     $F2                             ; F5E2 85 F2                    ..
        lda     #$21                            ; F5E4 A9 21                    .!
        jsr     LF425                           ; F5E6 20 25 F4                  %.
        jsr     LF3CF                           ; F5E9 20 CF F3                  ..
        iny                                     ; F5EC C8                       .
        pla                                     ; F5ED 68                       h
        sta     ($F2),y                         ; F5EE 91 F2                    ..
        dey                                     ; F5F0 88                       .
        pla                                     ; F5F1 68                       h
        sta     ($F2),y                         ; F5F2 91 F2                    ..
        jsr     LF4A8                           ; F5F4 20 A8 F4                  ..
        pla                                     ; F5F7 68                       h
        sta     ($00),y                         ; F5F8 91 00                    ..
        pla                                     ; F5FA 68                       h
        iny                                     ; F5FB C8                       .
        sta     ($00),y                         ; F5FC 91 00                    ..
        sta     $C083                           ; F5FE 8D 83 C0                 ...
        rts                                     ; F601 60                       `

; ----------------------------------------------------------------------------
LF602:  jmp     LE0E0                           ; F602 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LF605:  jmp     LDE20                           ; F605 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        sta     $0B                             ; F608 85 0B                    ..
        sty     SEDORIC_FTYPE                   ; F60A 84 F9                    ..
        jsr     LD44F                           ; F60C 20 4F D4                  O.
        jsr     LD79E                           ; F60F 20 9E D7                  ..
        jsr     LD22C                           ; F612 20 2C D2                  ,.
        jsr     LF47F                           ; F615 20 7F F4                  ..
        jsr     LDB2D                           ; F618 20 2D DB                  -.
        php                                     ; F61B 08                       .
        bne     LF640                           ; F61C D0 22                    ."
        ldx     #$00                            ; F61E A2 00                    ..
        bit     $0B                             ; F620 24 0B                    $.
        bmi     LF62E                           ; F622 30 0A                    0.
        jsr     LD22C                           ; F624 20 2C D2                  ,.
        jsr     LD27F                           ; F627 20 7F D2                  ..
        cpx     #$03                            ; F62A E0 03                    ..
        bcc     LF605                           ; F62C 90 D7                    ..
LF62E:  lda     #$00                            ; F62E A9 00                    ..
        sta     $C052                           ; F630 8D 52 C0                 .R.
        sta     $C053                           ; F633 8D 53 C0                 .S.
        tay                                     ; F636 A8                       .
        txa                                     ; F637 8A                       .
LF638:  ldx     SEDORIC_FTYPE                   ; F638 A6 F9                    ..
        .byte   $20                             ; F63A 20                        
        brk                                     ; F63B 00                       .
LF63C:  dec     $3020,x                         ; F63C DE 20 30                 . 0
        .byte   $DB                             ; F63F DB                       .
LF640:  lda     $C30C,x                         ; F640 BD 0C C3                 ...
        ldy     $C30D,x                         ; F643 BC 0D C3                 ...
        jsr     READ_SECTOR_TRACK               ; F646 20 5D DA                  ].
        lda     SEDORIC_BUF1+3                  ; F649 AD 03 C1                 ...
        cmp     SEDORIC_FTYPE                   ; F64C C5 F9                    ..
        bne     LF602                           ; F64E D0 B2                    ..
        lda     SEDORIC_BUF1+6                  ; F650 AD 06 C1                 ...
        ldy     $0B                             ; F653 A4 0B                    ..
        jsr     LFACB                           ; F655 20 CB FA                  ..
        ldy     #$07                            ; F658 A0 07                    ..
        ldx     $C027                           ; F65A AE 27 C0                 .'.
LF65D:  lda     SEDORIC_BUF3,x                  ; F65D BD 00 C3                 ...
        sta     ($00),y                         ; F660 91 00                    ..
        inx                                     ; F662 E8                       .
        iny                                     ; F663 C8                       .
        cpy     #$17                            ; F664 C0 17                    ..
        bne     LF65D                           ; F666 D0 F5                    ..
        lda     #$FF                            ; F668 A9 FF                    ..
        ldy     #$02                            ; F66A A0 02                    ..
        sta     ($00),y                         ; F66C 91 00                    ..
        dec     $05                             ; F66E C6 05                    ..
        jsr     LF86A                           ; F670 20 6A F8                  j.
        jsr     LF85F                           ; F673 20 5F F8                  _.
        jsr     XPRSEC                          ; F676 20 73 DA                  s.
        .byte   $A0                             ; F679 A0                       .
LF67A:  brk                                     ; F67A 00                       .
        lda     ($04),y                         ; F67B B1 04                    ..
LF67D:  sta     SEDORIC_TRACK                   ; F67D 8D 01 C0                 ...
        iny                                     ; F680 C8                       .
        lda     ($04),y                         ; F681 B1 04                    ..
        .byte   $8D                             ; F683 8D                       .
LF684:  .byte   $02                             ; F684 02                       .
        cpy     #$D0                            ; F685 C0 D0                    ..
        inx                                     ; F687 E8                       .
        jsr     LFA74                           ; F688 20 74 FA                  t.
        plp                                     ; F68B 28                       (
        rts                                     ; F68C 60                       `

; ----------------------------------------------------------------------------
        beq     LF6A0                           ; F68D F0 11                    ..
        jsr     LF47D                           ; F68F 20 7D F4                  }.
        jsr     LFBAF                           ; F692 20 AF FB                  ..
        jsr     LD39E                           ; F695 20 9E D3                  ..
        beq     LF6AE                           ; F698 F0 14                    ..
        jsr     LD22C                           ; F69A 20 2C D2                  ,.
        jmp     LFB8F                           ; F69D 4C 8F FB                 L..

; ----------------------------------------------------------------------------
LF6A0:  jsr     LF3F3                           ; F6A0 20 F3 F3                  ..
        lda     #$3F                            ; F6A3 A9 3F                    .?
        sta     $0A                             ; F6A5 85 0A                    ..
LF6A7:  jsr     LFBAF                           ; F6A7 20 AF FB                  ..
        dec     $0A                             ; F6AA C6 0A                    ..
        bpl     LF6A7                           ; F6AC 10 F9                    ..
LF6AE:  rts                                     ; F6AE 60                       `

; ----------------------------------------------------------------------------
        jsr     LF3CF                           ; F6AF 20 CF F3                  ..
        tya                                     ; F6B2 98                       .
        iny                                     ; F6B3 C8                       .
        sta     ($F2),y                         ; F6B4 91 F2                    ..
        jmp     LF4E6                           ; F6B6 4C E6 F4                 L..

; ----------------------------------------------------------------------------
LF6B9:  jmp     LE0E0                           ; F6B9 4C E0 E0                 L..

; ----------------------------------------------------------------------------
LF6BC:  jmp     LDE23                           ; F6BC 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        jsr     LF47D                           ; F6BF 20 7D F4                  }.
        jsr     LD22C                           ; F6C2 20 2C D2                  ,.
        jsr     LF4A8                           ; F6C5 20 A8 F4                  ..
        bmi     LF6B9                           ; F6C8 30 EF                    0.
        lda     $C080                           ; F6CA AD 80 C0                 ...
        cmp     $0A                             ; F6CD C5 0A                    ..
        beq     LF6D6                           ; F6CF F0 05                    ..
        lda     #$00                            ; F6D1 A9 00                    ..
        sta     $C081                           ; F6D3 8D 81 C0                 ...
LF6D6:  jsr     LF640                           ; F6D6 20 40 F6                  @.
        lda     #$C3                            ; F6D9 A9 C3                    ..
        jsr     LD22E                           ; F6DB 20 2E D2                  ..
        beq     LF6BC                           ; F6DE F0 DC                    ..
        pha                                     ; F6E0 48                       H
        jsr     LD398                           ; F6E1 20 98 D3                  ..
        pla                                     ; F6E4 68                       h
        ldy     #$00                            ; F6E5 A0 00                    ..
        ldx     #$05                            ; F6E7 A2 05                    ..
        cmp     #$C0                            ; F6E9 C9 C0                    ..
        beq     LF707                           ; F6EB F0 1A                    ..
        ldx     #$02                            ; F6ED A2 02                    ..
        iny                                     ; F6EF C8                       .
        cmp     #$25                            ; F6F0 C9 25                    .%
        beq     LF707                           ; F6F2 F0 13                    ..
        dex                                     ; F6F4 CA                       .
        ldy     #$40                            ; F6F5 A0 40                    .@
        cmp     #$4F                            ; F6F7 C9 4F                    .O
        beq     LF707                           ; F6F9 F0 0C                    ..
        cmp     #$24                            ; F6FB C9 24                    .$
        bne     LF6BC                           ; F6FD D0 BD                    ..
        jsr     LD27F                           ; F6FF 20 7F D2                  ..
        txa                                     ; F702 8A                       .
        beq     LF754                           ; F703 F0 4F                    .O
        ldy     #$80                            ; F705 A0 80                    ..
LF707:  sty     $C07F                           ; F707 8C 7F C0                 ...
        stx     $C07E                           ; F70A 8E 7E C0                 .~.
        lda     $C081                           ; F70D AD 81 C0                 ...
        ldy     $0A                             ; F710 A4 0A                    ..
        sta     $C07D                           ; F712 8D 7D C0                 .}.
        sty     $C07C                           ; F715 8C 7C C0                 .|.
        clc                                     ; F718 18                       .
        ldx     $0B                             ; F719 A6 0B                    ..
        bne     LF722                           ; F71B D0 05                    ..
        adc     #$02                            ; F71D 69 02                    i.
        jsr     LFC57                           ; F71F 20 57 FC                  W.
LF722:  adc     $C07E                           ; F722 6D 7E C0                 m~.
        .byte   $20                             ; F725 20                        
        .byte   $57                             ; F726 57                       W
LF727:  .byte   $FC                             ; F727 FC                       .
        sta     $C081                           ; F728 8D 81 C0                 ...
        jsr     LF4EC                           ; F72B 20 EC F4                  ..
        bcs     LF733                           ; F72E B0 03                    ..
        jsr     LF4EF                           ; F730 20 EF F4                  ..
LF733:  ldy     #$09                            ; F733 A0 09                    ..
LF735:  lda     SEDORIC_BACKUP_CHAR_LINPUT+1,y  ; F735 B9 76 C0                 .v.
        sta     ($F4),y                         ; F738 91 F4                    ..
        dey                                     ; F73A 88                       .
        bpl     LF735                           ; F73B 10 F8                    ..
        ldx     #$00                            ; F73D A2 00                    ..
        jsr     LD39E                           ; F73F 20 9E D3                  ..
        bne     LF748                           ; F742 D0 04                    ..
        stx     $C081                           ; F744 8E 81 C0                 ...
        rts                                     ; F747 60                       `

; ----------------------------------------------------------------------------
LF748:  jsr     LD22C                           ; F748 20 2C D2                  ,.
        bne     LF6D6                           ; F74B D0 89                    ..
        lda     $0A                             ; F74D A5 0A                    ..
        sta     $C080                           ; F74F 8D 80 C0                 ...
LF752:  clc                                     ; F752 18                       .
        rts                                     ; F753 60                       `

; ----------------------------------------------------------------------------
LF754:  jmp     LDE20                           ; F754 4C 20 DE                 L .

; ----------------------------------------------------------------------------
        beq     LF769                           ; F757 F0 10                    ..
        .byte   $B0                             ; F759 B0                       .
LF75A:  .byte   $13                             ; F75A 13                       .
        ldx     $C083                           ; F75B AE 83 C0                 ...
        beq     LF752                           ; F75E F0 F2                    ..
        cmp     $C083                           ; F760 CD 83 C0                 ...
        beq     LF752                           ; F763 F0 ED                    ..
        bcc     LF752                           ; F765 90 EB                    ..
        bcs     LF76E                           ; F767 B0 05                    ..
LF769:  ldx     $C083                           ; F769 AE 83 C0                 ...
        beq     LF752                           ; F76C F0 E4                    ..
LF76E:  ldx     #$11                            ; F76E A2 11                    ..
        jmp     LD67E                           ; F770 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        clc                                     ; F773 18                       .
        bit     $38                             ; F774 24 38                    $8
        php                                     ; F776 08                       .
        jsr     LF3F3                           ; F777 20 F3 F3                  ..
        jsr     LF640                           ; F77A 20 40 F6                  @.
        lda     #$D5                            ; F77D A9 D5                    ..
        jsr     LD22E                           ; F77F 20 2E D2                  ..
        jsr     LD224                           ; F782 20 24 D2                  $.
        jsr     LF4E9                           ; F785 20 E9 F4                  ..
        jsr     LF67A                           ; F788 20 7A F6                  z.
        jsr     LF4A8                           ; F78B 20 A8 F4                  ..
        lda     $C07C                           ; F78E AD 7C C0                 .|.
        sta     $0A                             ; F791 85 0A                    ..
        ldy     $C07D                           ; F793 AC 7D C0                 .}.
        ldx     $C07E                           ; F796 AE 7E C0                 .~.
        lda     $0B                             ; F799 A5 0B                    ..
        bne     LF7A9                           ; F79B D0 0C                    ..
        plp                                     ; F79D 28                       (
        php                                     ; F79E 08                       .
        lda     $C07F                           ; F79F AD 7F C0                 ...
        sta     ($02),y                         ; F7A2 91 02                    ..
        iny                                     ; F7A4 C8                       .
        txa                                     ; F7A5 8A                       .
        sta     ($02),y                         ; F7A6 91 02                    ..
        iny                                     ; F7A8 C8                       .
LF7A9:  tya                                     ; F7A9 98                       .
        jsr     LF4DC                           ; F7AA 20 DC F4                  ..
        plp                                     ; F7AD 28                       (
        ldy     #$00                            ; F7AE A0 00                    ..
        lda     $C07F                           ; F7B0 AD 7F C0                 ...
        bmi     LF7D7                           ; F7B3 30 22                    0"
        beq     LF7D0                           ; F7B5 F0 19                    ..
        jsr     LD24C                           ; F7B7 20 4C D2                  L.
        ldy     #$00                            ; F7BA A0 00                    ..
        lda     $D4                             ; F7BC A5 D4                    ..
        sta     ($02),y                         ; F7BE 91 02                    ..
        bit     $C07F                           ; F7C0 2C 7F C0                 ,..
        bvc     LF7CA                           ; F7C3 50 05                    P.
        lda     $D3                             ; F7C5 A5 D3                    ..
        bne     LF754                           ; F7C7 D0 8B                    ..
        rts                                     ; F7C9 60                       `

; ----------------------------------------------------------------------------
LF7CA:  iny                                     ; F7CA C8                       .
        lda     $D3                             ; F7CB A5 D3                    ..
        sta     ($02),y                         ; F7CD 91 02                    ..
        rts                                     ; F7CF 60                       `

; ----------------------------------------------------------------------------
LF7D0:  ldx     $02                             ; F7D0 A6 02                    ..
        ldy     $03                             ; F7D2 A4 03                    ..
        jmp     LD2C2                           ; F7D4 4C C2 D2                 L..

; ----------------------------------------------------------------------------
LF7D7:  php                                     ; F7D7 08                       .
        jsr     LD274                           ; F7D8 20 74 D2                  t.
        sta     $D0                             ; F7DB 85 D0                    ..
        ldy     $C07E                           ; F7DD AC 7E C0                 .~.
        beq     LF7E9                           ; F7E0 F0 07                    ..
        lda     #$20                            ; F7E2 A9 20                    . 
LF7E4:  dey                                     ; F7E4 88                       .
        sta     ($02),y                         ; F7E5 91 02                    ..
        bne     LF7E4                           ; F7E7 D0 FB                    ..
LF7E9:  plp                                     ; F7E9 28                       (
        bcs     LF7FA                           ; F7EA B0 0E                    ..
        nop                                     ; F7EC EA                       .
        nop                                     ; F7ED EA                       .
LF7EE:  cpy     $D0                             ; F7EE C4 D0                    ..
        bcs     LF7F9                           ; F7F0 B0 07                    ..
        lda     ($91),y                         ; F7F2 B1 91                    ..
        sta     ($02),y                         ; F7F4 91 02                    ..
        iny                                     ; F7F6 C8                       .
        bne     LF7EE                           ; F7F7 D0 F5                    ..
LF7F9:  rts                                     ; F7F9 60                       `

; ----------------------------------------------------------------------------
LF7FA:  ldy     $D0                             ; F7FA A4 D0                    ..
        beq     LF80D                           ; F7FC F0 0F                    ..
        dey                                     ; F7FE 88                       .
        dec     $D0                             ; F7FF C6 D0                    ..
        lda     ($91),y                         ; F801 B1 91                    ..
        dec     $C07E                           ; F803 CE 7E C0                 .~.
        ldy     $C07E                           ; F806 AC 7E C0                 .~.
        sta     ($02),y                         ; F809 91 02                    ..
        bne     LF7FA                           ; F80B D0 ED                    ..
LF80D:  rts                                     ; F80D 60                       `

; ----------------------------------------------------------------------------
        jsr     LF4A8                           ; F80E 20 A8 F4                  ..
        ldy     #$03                            ; F811 A0 03                    ..
        lda     ($00),y                         ; F813 B1 00                    ..
        sta     $C086                           ; F815 8D 86 C0                 ...
        iny                                     ; F818 C8                       .
        lda     ($00),y                         ; F819 B1 00                    ..
        sta     $C087                           ; F81B 8D 87 C0                 ...
        iny                                     ; F81E C8                       .
        lda     ($00),y                         ; F81F B1 00                    ..
        sta     $C088                           ; F821 8D 88 C0                 ...
        tay                                     ; F824 A8                       .
        lda     ($02),y                         ; F825 B1 02                    ..
        cmp     #$FF                            ; F827 C9 FF                    ..
LF829:  rts                                     ; F829 60                       `

; ----------------------------------------------------------------------------
        jsr     LF4A8                           ; F82A 20 A8 F4                  ..
        ldy     #$05                            ; F82D A0 05                    ..
        lda     $C088                           ; F82F AD 88 C0                 ...
        sta     ($00),y                         ; F832 91 00                    ..
        dey                                     ; F834 88                       .
        lda     $C087                           ; F835 AD 87 C0                 ...
        sta     ($00),y                         ; F838 91 00                    ..
        dey                                     ; F83A 88                       .
        lda     $C086                           ; F83B AD 86 C0                 ...
        cmp     ($00),y                         ; F83E D1 00                    ..
        sta     ($00),y                         ; F840 91 00                    ..
        beq     LF829                           ; F842 F0 E5                    ..
        clc                                     ; F844 18                       .
        bit     $38                             ; F845 24 38                    $8
        php                                     ; F847 08                       .
        jsr     LF4A8                           ; F848 20 A8 F4                  ..
        lda     $02                             ; F84B A5 02                    ..
        ldy     $03                             ; F84D A4 03                    ..
        sta     SEDORIC_RWBUF                   ; F84F 8D 03 C0                 ...
        sty     $C004                           ; F852 8C 04 C0                 ...
        ldy     #$04                            ; F855 A0 04                    ..
        lda     ($00),y                         ; F857 B1 00                    ..
        clc                                     ; F859 18                       .
        adc     $05                             ; F85A 65 05                    e.
        sta     $05                             ; F85C 85 05                    ..
        dey                                     ; F85E 88                       .
LF85F:  lda     ($00),y                         ; F85F B1 00                    ..
        tay                                     ; F861 A8                       .
        lda     ($04),y                         ; F862 B1 04                    ..
        pha                                     ; F864 48                       H
        iny                                     ; F865 C8                       .
        lda     ($04),y                         ; F866 B1 04                    ..
        tay                                     ; F868 A8                       .
        pla                                     ; F869 68                       h
LF86A:  plp                                     ; F86A 28                       (
        bcc     LF870                           ; F86B 90 03                    ..
        jmp     LDA9E                           ; F86D 4C 9E DA                 L..

; ----------------------------------------------------------------------------
LF870:  jmp     LDA6D                           ; F870 4C 6D DA                 Lm.

; ----------------------------------------------------------------------------
        jsr     LFDCC                           ; F873 20 CC FD                  ..
        sta     ($02),y                         ; F876 91 02                    ..
        sec                                     ; F878 38                       8
        bit     $18                             ; F879 24 18                    $.
        jsr     LFDCC                           ; F87B 20 CC FD                  ..
        iny                                     ; F87E C8                       .
        bne     LF8C3                           ; F87F D0 42                    .B
        bcc     LF8A4                           ; F881 90 21                    .!
        .byte   $20                             ; F883 20                        
        .byte   $46                             ; F884 46                       F
LF885:  sbc     BASIC11_DUNNO_VALUE,x           ; F885 FD A0 02                 ...
        lda     ($00),y                         ; F888 B1 00                    ..
        ldy     #$04                            ; F88A A0 04                    ..
        cmp     ($00),y                         ; F88C D1 00                    ..
        bne     LF8A4                           ; F88E D0 14                    ..
        dey                                     ; F890 88                       .
        lda     ($00),y                         ; F891 B1 00                    ..
        tay                                     ; F893 A8                       .
        iny                                     ; F894 C8                       .
        iny                                     ; F895 C8                       .
        beq     LF89D                           ; F896 F0 05                    ..
        iny                                     ; F898 C8                       .
        lda     ($04),y                         ; F899 B1 04                    ..
        bne     LF8A4                           ; F89B D0 07                    ..
LF89D:  lda     #$03                            ; F89D A9 03                    ..
        ldy     #$00                            ; F89F A0 00                    ..
        jsr     LF75A                           ; F8A1 20 5A F7                  Z.
LF8A4:  jsr     LF4A8                           ; F8A4 20 A8 F4                  ..
        ldy     #$03                            ; F8A7 A0 03                    ..
        lda     ($00),y                         ; F8A9 B1 00                    ..
        clc                                     ; F8AB 18                       .
        adc     #$02                            ; F8AC 69 02                    i.
        bne     LF8BA                           ; F8AE D0 0A                    ..
        ldy     #$04                            ; F8B0 A0 04                    ..
        lda     ($00),y                         ; F8B2 B1 00                    ..
        adc     #$00                            ; F8B4 69 00                    i.
        sta     ($00),y                         ; F8B6 91 00                    ..
        lda     #$02                            ; F8B8 A9 02                    ..
LF8BA:  ldy     #$03                            ; F8BA A0 03                    ..
        sta     ($00),y                         ; F8BC 91 00                    ..
        jsr     LFD44                           ; F8BE 20 44 FD                  D.
        ldy     #$00                            ; F8C1 A0 00                    ..
LF8C3:  tya                                     ; F8C3 98                       .
        ldy     #$05                            ; F8C4 A0 05                    ..
        sta     ($00),y                         ; F8C6 91 00                    ..
        tay                                     ; F8C8 A8                       .
        lda     ($02),y                         ; F8C9 B1 02                    ..
        rts                                     ; F8CB 60                       `

; ----------------------------------------------------------------------------
        ldy     #$05                            ; F8CC A0 05                    ..
        pha                                     ; F8CE 48                       H
        lda     ($00),y                         ; F8CF B1 00                    ..
        tay                                     ; F8D1 A8                       .
        pla                                     ; F8D2 68                       h
        rts                                     ; F8D3 60                       `

; ----------------------------------------------------------------------------
LF8D4:  ldx     #$0F                            ; F8D4 A2 0F                    ..
        jmp     LD67E                           ; F8D6 4C 7E D6                 L~.

; ----------------------------------------------------------------------------
        jsr     LFD0E                           ; F8D9 20 0E FD                  ..
        beq     LF8D4                           ; F8DC F0 F6                    ..
LF8DE:  ldy     #$00                            ; F8DE A0 00                    ..
        sta     ($06),y                         ; F8E0 91 06                    ..
        jsr     LFD7A                           ; F8E2 20 7A FD                  z.
        ldy     #$01                            ; F8E5 A0 01                    ..
        sta     ($06),y                         ; F8E7 91 06                    ..
        iny                                     ; F8E9 C8                       .
        sty     $F5                             ; F8EA 84 F5                    ..
        sta     $F6                             ; F8EC 85 F6                    ..
        inc     $F6                             ; F8EE E6 F6                    ..
LF8F0:  jsr     LFD7A                           ; F8F0 20 7A FD                  z.
        ldy     $F5                             ; F8F3 A4 F5                    ..
        inc     $F5                             ; F8F5 E6 F5                    ..
        sta     ($06),y                         ; F8F7 91 06                    ..
        dec     $F6                             ; F8F9 C6 F6                    ..
        bne     LF8F0                           ; F8FB D0 F3                    ..
LF8FD:  ldy     #$00                            ; F8FD A0 00                    ..
        lda     ($06),y                         ; F8FF B1 06                    ..
        tax                                     ; F901 AA                       .
        iny                                     ; F902 C8                       .
        lda     ($06),y                         ; F903 B1 06                    ..
        rts                                     ; F905 60                       `

; ----------------------------------------------------------------------------
        nop                                     ; F906 EA                       .
        jsr     LFAC0                           ; F907 20 C0 FA                  ..
        lda     #$FF                            ; F90A A9 FF                    ..
        sta     $33                             ; F90C 85 33                    .3
        sta     $34                             ; F90E 85 34                    .4
        bmi     LF91B                           ; F910 30 09                    0.
        jsr     LFAC0                           ; F912 20 C0 FA                  ..
        jsr     LD22C                           ; F915 20 2C D2                  ,.
        jsr     LD2FA                           ; F918 20 FA D2                  ..
LF91B:  php                                     ; F91B 08                       .
        sei                                     ; F91C 78                       x
LF91D:  lda     $33                             ; F91D A5 33                    .3
LF91F:  ora     $34                             ; F91F 05 34                    .4
        beq     LF936                           ; F921 F0 13                    ..
        lda     $33                             ; F923 A5 33                    .3
        bne     LF929                           ; F925 D0 02                    ..
        dec     $34                             ; F927 C6 34                    .4
LF929:  dec     $33                             ; F929 C6 33                    .3
        jsr     LFD0E                           ; F92B 20 0E FD                  ..
        beq     LF936                           ; F92E F0 06                    ..
        jsr     LFDD9                           ; F930 20 D9 FD                  ..
        jmp     LFE1D                           ; F933 4C 1D FE                 L..

; ----------------------------------------------------------------------------
LF936:  plp                                     ; F936 28                       (
        rts                                     ; F937 60                       `

; ----------------------------------------------------------------------------
        ldy     #$00                            ; F938 A0 00                    ..
        lda     ($06),y                         ; F93A B1 06                    ..
        jsr     LFD73                           ; F93C 20 73 FD                  s.
        ldy     #$01                            ; F93F A0 01                    ..
        lda     ($06),y                         ; F941 B1 06                    ..
        iny                                     ; F943 C8                       .
        sty     $F7                             ; F944 84 F7                    ..
        sta     $F8                             ; F946 85 F8                    ..
        inc     $F8                             ; F948 E6 F8                    ..
        jsr     LFD73                           ; F94A 20 73 FD                  s.
        ldy     $F7                             ; F94D A4 F7                    ..
        lda     ($06),y                         ; F94F B1 06                    ..
        inc     $F7                             ; F951 E6 F7                    ..
        dec     $F8                             ; F953 C6 F8                    ..
        .byte   $D0                             ; F955 D0                       .
LF956:  .byte   $F3                             ; F956 F3                       .
        rts                                     ; F957 60                       `

; ----------------------------------------------------------------------------
        lsr     $F2                             ; F958 46 F2                    F.
        .byte   $46                             ; F95A 46                       F
LF95B:  .byte   $F4                             ; F95B F4                       .
        ldx     #$0C                            ; F95C A2 0C                    ..
LF95E:  dex                                     ; F95E CA                       .
        bmi     LF983                           ; F95F 30 22                    0"
        lda     $C091,x                         ; F961 BD 91 C0                 ...
        sta     $C029,x                         ; F964 9D 29 C0                 .).
        ldy     $C09E,x                         ; F967 BC 9E C0                 ...
        .byte   $C9                             ; F96A C9                       .
LF96B:  .byte   $3F                             ; F96B 3F                       ?
        beq     LF976                           ; F96C F0 08                    ..
        cpy     #$3F                            ; F96E C0 3F                    .?
        bne     LF95E                           ; F970 D0 EC                    ..
        ror     $F2                             ; F972 66 F2                    f.
        bne     LF95E                           ; F974 D0 E8                    ..
LF976:  ror     $F4                             ; F976 66 F4                    f.
        bit     $16                             ; F978 24 16                    $.
        bvs     LF95E                           ; F97A 70 E2                    p.
        cpy     #$3F                            ; F97C C0 3F                    .?
        beq     LF95E                           ; F97E F0 DE                    ..
        jmp     LD5AC                           ; F980 4C AC D5                 L..

; ----------------------------------------------------------------------------
LF983:  bit     $F2                             ; F983 24 F2                    $.
        bpl     LF993                           ; F985 10 0C                    ..
        ldx     #$0C                            ; F987 A2 0C                    ..
LF989:  lda     $C09D,x                         ; F989 BD 9D C0                 ...
        cmp     #$3F                            ; F98C C9 3F                    .?
        .byte   $D0                             ; F98E D0                       .
LF98F:  beq     LF95B                           ; F98F F0 CA                    ..
        bne     LF989                           ; F991 D0 F6                    ..
LF993:  cli                                     ; F993 58                       X
        rts                                     ; F994 60                       `

; ----------------------------------------------------------------------------
LF995:  jsr     LE7C5                           ; F995 20 C5 E7                  ..
        jsr     LFAC0                           ; F998 20 C0 FA                  ..
LF99B:  jsr     SEDORIC_KEYBOARD_WAIT           ; F99B 20 02 D3                  ..
        bpl     LF9AC                           ; F99E 10 0C                    ..
LF9A0:  jsr     LFF3D                           ; F9A0 20 3D FF                  =.
        cmp     #$20                            ; F9A3 C9 20                    . 
        beq     LF9AC                           ; F9A5 F0 05                    ..
        cmp     #$03                            ; F9A7 C9 03                    ..
        bne     LF9A0                           ; F9A9 D0 F5                    ..
        rts                                     ; F9AB 60                       `

; ----------------------------------------------------------------------------
LF9AC:  jsr     LFD0E                           ; F9AC 20 0E FD                  ..
        beq     LF9C7                           ; F9AF F0 16                    ..
        jsr     LFDD9                           ; F9B1 20 D9 FD                  ..
        beq     LF99B                           ; F9B4 F0 E5                    ..
        sta     $F2                             ; F9B6 85 F2                    ..
        txa                                     ; F9B8 8A                       .
        bpl     LF9CA                           ; F9B9 10 0F                    ..
LF9BB:  iny                                     ; F9BB C8                       .
        lda     ($06),y                         ; F9BC B1 06                    ..
        jsr     XAFCAR                          ; F9BE 20 2A D6                  *.
        dec     $F2                             ; F9C1 C6 F2                    ..
        bne     LF9BB                           ; F9C3 D0 F6                    ..
        beq     LF99B                           ; F9C5 F0 D4                    ..
LF9C7:  jmp     LE7D6                           ; F9C7 4C D6 E7                 L..

; ----------------------------------------------------------------------------
LF9CA:  clc                                     ; F9CA 18                       .
        lda     $06                             ; F9CB A5 06                    ..
        ldy     $07                             ; F9CD A4 07                    ..
        adc     #$02                            ; F9CF 69 02                    i.
        bcc     LF9D4                           ; F9D1 90 01                    ..
        iny                                     ; F9D3 C8                       .
LF9D4:  jsr     LD2BA                           ; F9D4 20 BA D2                  ..
        .byte   $20                             ; F9D7 20                        
LF9D8:  .byte   $D2                             ; F9D8 D2                       .
        .byte   $D2                             ; F9D9 D2                       .
        jsr     XAFSTR                          ; F9DA 20 37 D6                  7.
        jmp     LFE9B                           ; F9DD 4C 9B FE                 L..

; ----------------------------------------------------------------------------
        jsr     LFE07                           ; F9E0 20 07 FE                  ..
        jsr     LFF00                           ; F9E3 20 00 FF                  ..
        jsr     LFF3D                           ; F9E6 20 3D FF                  =.
        ldy     $F2                             ; F9E9 A4 F2                    ..
        cmp     #$03                            ; F9EB C9 03                    ..
        beq     LFA37                           ; F9ED F0 48                    .H
LF9EF:  cmp     #$0D                            ; F9EF C9 0D                    ..
        bne     LF9F8                           ; F9F1 D0 05                    ..
        jsr     LFF1B                           ; F9F3 20 1B FF                  ..
        lda     #$0A                            ; F9F6 A9 0A                    ..
LF9F8:  jsr     LFF1B                           ; F9F8 20 1B FF                  ..
        sty     $F2                             ; F9FB 84 F2                    ..
        jmp     LFEE6                           ; F9FD 4C E6 FE                 L..

; ----------------------------------------------------------------------------
        brk                                     ; FA00 00                       .
        brk                                     ; FA01 00                       .
        .byte   $F4                             ; FA02 F4                       .
        lda     #$80                            ; FA03 A9 80                    ..
        sta     ($06),y                         ; FA05 91 06                    ..
        iny                                     ; FA07 C8                       .
        lda     #$D8                            ; FA08 A9 D8                    ..
        sta     ($06),y                         ; FA0A 91 06                    ..
        lda     #$00                            ; FA0C A9 00                    ..
        iny                                     ; FA0E C8                       .
        sty     $F2                             ; FA0F 84 F2                    ..
LFA11:  sta     ($06),y                         ; FA11 91 06                    ..
        iny                                     ; FA13 C8                       .
        cpy     #$DA                            ; FA14 C0 DA                    ..
        bne     LFA11                           ; FA16 D0 F9                    ..
        ldy     #$02                            ; FA18 A0 02                    ..
LFA1A:  rts                                     ; FA1A 60                       `

; ----------------------------------------------------------------------------
        sta     ($06),y                         ; FA1B 91 06                    ..
        jsr     XAFCAR                          ; FA1D 20 2A D6                  *.
        iny                                     ; FA20 C8                       .
        cpy     #$DA                            ; FA21 C0 DA                    ..
        bne     LFA1A                           ; FA23 D0 F5                    ..
        jsr     LFE38                           ; FA25 20 38 FE                  8.
        lda     #$FF                            ; FA28 A9 FF                    ..
        jsr     LFDCC                           ; FA2A 20 CC FD                  ..
        sta     ($02),y                         ; FA2D 91 02                    ..
        jsr     LFD46                           ; FA2F 20 46 FD                  F.
        ldy     #$02                            ; FA32 A0 02                    ..
        jmp     LFF00                           ; FA34 4C 00 FF                 L..

; ----------------------------------------------------------------------------
LFA37:  .byte   $20                             ; FA37 20                        
        .byte   $25                             ; FA38 25                       %
LFA39:  .byte   $FF                             ; FA39 FF                       .
        jmp     LFD46                           ; FA3A 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
LFA3D:  jsr     LD845                           ; FA3D 20 45 D8                  E.
        bpl     LFA3D                           ; FA40 10 FB                    ..
        rts                                     ; FA42 60                       `

; ----------------------------------------------------------------------------
        jmp     LED36                           ; FA43 4C 36 ED                 L6.

; ----------------------------------------------------------------------------
        jmp     LD398                           ; FA46 4C 98 D3                 L..

; ----------------------------------------------------------------------------
        jmp     LD39E                           ; FA49 4C 9E D3                 L..

; ----------------------------------------------------------------------------
        jmp     LD44F                           ; FA4C 4C 4F D4                 LO.

; ----------------------------------------------------------------------------
LFA4F:  jmp     LD451                           ; FA4F 4C 51 D4                 LQ.

; ----------------------------------------------------------------------------
        jmp     LD364                           ; FA52 4C 64 D3                 Ld.

; ----------------------------------------------------------------------------
        jmp     LF3F3                           ; FA55 4C F3 F3                 L..

; ----------------------------------------------------------------------------
        jmp     LF4A8                           ; FA58 4C A8 F4                 L..

; ----------------------------------------------------------------------------
        jmp     LFDD9                           ; FA5B 4C D9 FD                 L..

; ----------------------------------------------------------------------------
        jmp     LFE38                           ; FA5E 4C 38 FE                 L8.

; ----------------------------------------------------------------------------
        jmp     LFD46                           ; FA61 4C 46 FD                 LF.

; ----------------------------------------------------------------------------
        jmp     XAFCAR                          ; FA64 4C 2A D6                 L*.

; ----------------------------------------------------------------------------
        jmp     XAFHEX                          ; FA67 4C 13 D6                 L..

; ----------------------------------------------------------------------------
        jmp     XAFSTR                          ; FA6A 4C 37 D6                 L7.

; ----------------------------------------------------------------------------
        jmp     SEDORIC_XROM                    ; FA6D 4C D8 D5                 L..

; ----------------------------------------------------------------------------
        jmp     LE0EA                           ; FA70 4C EA E0                 L..

; ----------------------------------------------------------------------------
        .byte   $4C                             ; FA73 4C                       L
LFA74:  sbc     $E0                             ; FA74 E5 E0                    ..
        jmp     LDE28                           ; FA76 4C 28 DE                 L(.

; ----------------------------------------------------------------------------
        jmp     LDFE6                           ; FA79 4C E6 DF                 L..

; ----------------------------------------------------------------------------
        jmp     LDE9C                           ; FA7C 4C 9C DE                 L..

; ----------------------------------------------------------------------------
        jmp     LE266                           ; FA7F 4C 66 E2                 Lf.

; ----------------------------------------------------------------------------
        jmp     XCREAY                          ; FA82 4C 2D DD                 L-.

; ----------------------------------------------------------------------------
        jmp     XDETSE                          ; FA85 4C 15 DD                 L..

; ----------------------------------------------------------------------------
        jmp     XLIBSE                          ; FA88 4C 6C DC                 Ll.

; ----------------------------------------------------------------------------
        jmp     XWDESC                          ; FA8B 4C C0 DB                 L..

; ----------------------------------------------------------------------------
        jmp     XTRVCA                          ; FA8E 4C 59 DB                 LY.

; ----------------------------------------------------------------------------
        jmp     LDBA5                           ; FA91 4C A5 DB                 L..

; ----------------------------------------------------------------------------
        jmp     LDB41                           ; FA94 4C 41 DB                 LA.

; ----------------------------------------------------------------------------
        jmp     XTVNM                           ; FA97 4C 30 DB                 L0.

; ----------------------------------------------------------------------------
        jmp     LDB2D                           ; FA9A 4C 2D DB                 L-.

; ----------------------------------------------------------------------------
        jmp     LDB07                           ; FA9D 4C 07 DB                 L..

; ----------------------------------------------------------------------------
        jmp     LDAFE                           ; FAA0 4C FE DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDAEE                           ; FAA3 4C EE DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDACE                           ; FAA6 4C CE DA                 L..

; ----------------------------------------------------------------------------
        jmp     XSVSEC                          ; FAA9 4C A4 DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDA9E                           ; FAAC 4C 9E DA                 L..

; ----------------------------------------------------------------------------
        jmp     LDA91                           ; FAAF 4C 91 DA                 L..

; ----------------------------------------------------------------------------
        jmp     XSCAT                           ; FAB2 4C 82 DA                 L..

; ----------------------------------------------------------------------------
        jmp     XSMAP                           ; FAB5 4C 8A DA                 L..

; ----------------------------------------------------------------------------
        .byte   $4C                             ; FAB8 4C                       L
        .byte   $73                             ; FAB9 73                       s
LFABA:  .byte   $DA                             ; FABA DA                       .
        jmp     LDA6D                           ; FABB 4C 6D DA                 Lm.

; ----------------------------------------------------------------------------
        .byte   $4C                             ; FABE 4C                       L
        .byte   $5D                             ; FABF 5D                       ]
LFAC0:  .byte   $DA                             ; FAC0 DA                       .
        jmp     XPMAP                           ; FAC1 4C 4C DA                 LL.

; ----------------------------------------------------------------------------
        jmp     XRWTS                           ; FAC4 4C CD CF                 L..

; ----------------------------------------------------------------------------
; Sedoric copyright
SEDORIC_COPYRIGHT:
        .byte   "SEDO"                          ; FAC7 53 45 44 4F              SEDO
LFACB:  .byte   "RIC 1.0 par F.BROCHE et D.SEBBA"; FACB 52 49 43 20 31 2E 30 20 RIC 1.0 
                                                ; FAD3 70 61 72 20 46 2E 42 52  par F.BR
                                                ; FADB 4F 43 48 45 20 65 74 20  OCHE et 
                                                ; FAE3 44 2E 53 45 42 42 41     D.SEBBA
        .byte   "G(c) 1985 EUREKA!"             ; FAEA 47 28 63 29 20 31 39 38  G(c) 198
                                                ; FAF2 35 20 45 55 52 45 4B 41  5 EUREKA
                                                ; FAFA 21                       !
; ----------------------------------------------------------------------------
        cmp     ($10),y                         ; FAFB D1 10                    ..
        .byte   $23                             ; FAFD 23                       #
        .byte   $7B                             ; FAFE 7B                       {
        lda     $00,y                           ; FAFF B9 00 00                 ...
        .byte   $FF                             ; FB02 FF                       .
        rti                                     ; FB03 40                       @

; ----------------------------------------------------------------------------
        brk                                     ; FB04 00                       .
        cpy     $FF                             ; FB05 C4 FF                    ..
        .byte   $C7                             ; FB07 C7                       .
LFB08:  brk                                     ; FB08 00                       .
        brk                                     ; FB09 00                       .
        .byte   $04                             ; FB0A 04                       .
        brk                                     ; FB0B 00                       .
        .byte   $03                             ; FB0C 03                       .
        .byte   $0F                             ; FB0D 0F                       .
        .byte   $03                             ; FB0E 03                       .
        bpl     LFB14                           ; FB0F 10 03                    ..
        ora     ($04),y                         ; FB11 11 04                    ..
        .byte   $01                             ; FB13 01                       .
LFB14:  brk                                     ; FB14 00                       .
        brk                                     ; FB15 00                       .
        brk                                     ; FB16 00                       .
        brk                                     ; FB17 00                       .
        brk                                     ; FB18 00                       .
        brk                                     ; FB19 00                       .
        brk                                     ; FB1A 00                       .
        brk                                     ; FB1B 00                       .
        brk                                     ; FB1C 00                       .
        brk                                     ; FB1D 00                       .
        brk                                     ; FB1E 00                       .
        brk                                     ; FB1F 00                       .
        brk                                     ; FB20 00                       .
        brk                                     ; FB21 00                       .
        brk                                     ; FB22 00                       .
        brk                                     ; FB23 00                       .
        brk                                     ; FB24 00                       .
        brk                                     ; FB25 00                       .
        brk                                     ; FB26 00                       .
        brk                                     ; FB27 00                       .
        brk                                     ; FB28 00                       .
        brk                                     ; FB29 00                       .
        brk                                     ; FB2A 00                       .
        brk                                     ; FB2B 00                       .
        brk                                     ; FB2C 00                       .
        brk                                     ; FB2D 00                       .
        brk                                     ; FB2E 00                       .
        brk                                     ; FB2F 00                       .
        brk                                     ; FB30 00                       .
        brk                                     ; FB31 00                       .
        brk                                     ; FB32 00                       .
        brk                                     ; FB33 00                       .
        brk                                     ; FB34 00                       .
        brk                                     ; FB35 00                       .
        brk                                     ; FB36 00                       .
        brk                                     ; FB37 00                       .
        brk                                     ; FB38 00                       .
        brk                                     ; FB39 00                       .
        brk                                     ; FB3A 00                       .
        brk                                     ; FB3B 00                       .
        brk                                     ; FB3C 00                       .
        brk                                     ; FB3D 00                       .
        brk                                     ; FB3E 00                       .
        brk                                     ; FB3F 00                       .
        brk                                     ; FB40 00                       .
        brk                                     ; FB41 00                       .
        brk                                     ; FB42 00                       .
        brk                                     ; FB43 00                       .
        brk                                     ; FB44 00                       .
        brk                                     ; FB45 00                       .
        brk                                     ; FB46 00                       .
        brk                                     ; FB47 00                       .
        brk                                     ; FB48 00                       .
        brk                                     ; FB49 00                       .
        brk                                     ; FB4A 00                       .
        brk                                     ; FB4B 00                       .
        brk                                     ; FB4C 00                       .
        brk                                     ; FB4D 00                       .
        brk                                     ; FB4E 00                       .
        brk                                     ; FB4F 00                       .
        brk                                     ; FB50 00                       .
        brk                                     ; FB51 00                       .
        brk                                     ; FB52 00                       .
        brk                                     ; FB53 00                       .
        brk                                     ; FB54 00                       .
        brk                                     ; FB55 00                       .
        brk                                     ; FB56 00                       .
        brk                                     ; FB57 00                       .
        brk                                     ; FB58 00                       .
        brk                                     ; FB59 00                       .
        brk                                     ; FB5A 00                       .
        brk                                     ; FB5B 00                       .
        brk                                     ; FB5C 00                       .
        brk                                     ; FB5D 00                       .
        brk                                     ; FB5E 00                       .
        brk                                     ; FB5F 00                       .
        brk                                     ; FB60 00                       .
        brk                                     ; FB61 00                       .
        brk                                     ; FB62 00                       .
        brk                                     ; FB63 00                       .
        brk                                     ; FB64 00                       .
        brk                                     ; FB65 00                       .
        brk                                     ; FB66 00                       .
        brk                                     ; FB67 00                       .
        brk                                     ; FB68 00                       .
        brk                                     ; FB69 00                       .
        brk                                     ; FB6A 00                       .
        brk                                     ; FB6B 00                       .
        brk                                     ; FB6C 00                       .
        brk                                     ; FB6D 00                       .
        brk                                     ; FB6E 00                       .
        brk                                     ; FB6F 00                       .
        brk                                     ; FB70 00                       .
        brk                                     ; FB71 00                       .
        brk                                     ; FB72 00                       .
        brk                                     ; FB73 00                       .
        brk                                     ; FB74 00                       .
        brk                                     ; FB75 00                       .
        brk                                     ; FB76 00                       .
        brk                                     ; FB77 00                       .
        brk                                     ; FB78 00                       .
        brk                                     ; FB79 00                       .
        brk                                     ; FB7A 00                       .
        brk                                     ; FB7B 00                       .
        brk                                     ; FB7C 00                       .
        brk                                     ; FB7D 00                       .
        brk                                     ; FB7E 00                       .
        brk                                     ; FB7F 00                       .
        brk                                     ; FB80 00                       .
        brk                                     ; FB81 00                       .
        brk                                     ; FB82 00                       .
        brk                                     ; FB83 00                       .
        brk                                     ; FB84 00                       .
        brk                                     ; FB85 00                       .
        brk                                     ; FB86 00                       .
        brk                                     ; FB87 00                       .
        brk                                     ; FB88 00                       .
        brk                                     ; FB89 00                       .
        brk                                     ; FB8A 00                       .
        brk                                     ; FB8B 00                       .
LFB8C:  brk                                     ; FB8C 00                       .
        brk                                     ; FB8D 00                       .
        brk                                     ; FB8E 00                       .
LFB8F:  brk                                     ; FB8F 00                       .
        brk                                     ; FB90 00                       .
        brk                                     ; FB91 00                       .
        brk                                     ; FB92 00                       .
        brk                                     ; FB93 00                       .
        brk                                     ; FB94 00                       .
        brk                                     ; FB95 00                       .
        brk                                     ; FB96 00                       .
        brk                                     ; FB97 00                       .
        brk                                     ; FB98 00                       .
        brk                                     ; FB99 00                       .
        brk                                     ; FB9A 00                       .
        brk                                     ; FB9B 00                       .
        brk                                     ; FB9C 00                       .
        brk                                     ; FB9D 00                       .
        brk                                     ; FB9E 00                       .
        brk                                     ; FB9F 00                       .
        brk                                     ; FBA0 00                       .
        brk                                     ; FBA1 00                       .
        brk                                     ; FBA2 00                       .
        brk                                     ; FBA3 00                       .
        brk                                     ; FBA4 00                       .
        brk                                     ; FBA5 00                       .
        brk                                     ; FBA6 00                       .
        brk                                     ; FBA7 00                       .
        brk                                     ; FBA8 00                       .
        brk                                     ; FBA9 00                       .
        brk                                     ; FBAA 00                       .
        brk                                     ; FBAB 00                       .
        brk                                     ; FBAC 00                       .
        brk                                     ; FBAD 00                       .
        brk                                     ; FBAE 00                       .
LFBAF:  brk                                     ; FBAF 00                       .
        brk                                     ; FBB0 00                       .
        brk                                     ; FBB1 00                       .
        brk                                     ; FBB2 00                       .
        brk                                     ; FBB3 00                       .
        brk                                     ; FBB4 00                       .
        brk                                     ; FBB5 00                       .
        brk                                     ; FBB6 00                       .
        brk                                     ; FBB7 00                       .
        brk                                     ; FBB8 00                       .
        brk                                     ; FBB9 00                       .
        brk                                     ; FBBA 00                       .
        brk                                     ; FBBB 00                       .
        brk                                     ; FBBC 00                       .
        brk                                     ; FBBD 00                       .
LFBBE:  brk                                     ; FBBE 00                       .
        brk                                     ; FBBF 00                       .
        brk                                     ; FBC0 00                       .
        brk                                     ; FBC1 00                       .
        brk                                     ; FBC2 00                       .
        brk                                     ; FBC3 00                       .
        brk                                     ; FBC4 00                       .
        brk                                     ; FBC5 00                       .
        brk                                     ; FBC6 00                       .
        brk                                     ; FBC7 00                       .
        brk                                     ; FBC8 00                       .
        brk                                     ; FBC9 00                       .
        brk                                     ; FBCA 00                       .
        brk                                     ; FBCB 00                       .
        brk                                     ; FBCC 00                       .
        brk                                     ; FBCD 00                       .
        brk                                     ; FBCE 00                       .
        brk                                     ; FBCF 00                       .
        brk                                     ; FBD0 00                       .
        brk                                     ; FBD1 00                       .
        brk                                     ; FBD2 00                       .
        brk                                     ; FBD3 00                       .
        brk                                     ; FBD4 00                       .
        brk                                     ; FBD5 00                       .
        brk                                     ; FBD6 00                       .
        brk                                     ; FBD7 00                       .
        brk                                     ; FBD8 00                       .
        brk                                     ; FBD9 00                       .
        brk                                     ; FBDA 00                       .
        brk                                     ; FBDB 00                       .
        brk                                     ; FBDC 00                       .
        brk                                     ; FBDD 00                       .
        brk                                     ; FBDE 00                       .
        brk                                     ; FBDF 00                       .
        brk                                     ; FBE0 00                       .
        brk                                     ; FBE1 00                       .
        brk                                     ; FBE2 00                       .
        brk                                     ; FBE3 00                       .
        brk                                     ; FBE4 00                       .
        brk                                     ; FBE5 00                       .
        brk                                     ; FBE6 00                       .
        brk                                     ; FBE7 00                       .
        brk                                     ; FBE8 00                       .
        brk                                     ; FBE9 00                       .
        brk                                     ; FBEA 00                       .
        brk                                     ; FBEB 00                       .
        brk                                     ; FBEC 00                       .
        brk                                     ; FBED 00                       .
        brk                                     ; FBEE 00                       .
        brk                                     ; FBEF 00                       .
        brk                                     ; FBF0 00                       .
        brk                                     ; FBF1 00                       .
        brk                                     ; FBF2 00                       .
        brk                                     ; FBF3 00                       .
        brk                                     ; FBF4 00                       .
        brk                                     ; FBF5 00                       .
        brk                                     ; FBF6 00                       .
        brk                                     ; FBF7 00                       .
        brk                                     ; FBF8 00                       .
        brk                                     ; FBF9 00                       .
        brk                                     ; FBFA 00                       .
        brk                                     ; FBFB 00                       .
        brk                                     ; FBFC 00                       .
        brk                                     ; FBFD 00                       .
        brk                                     ; FBFE 00                       .
        brk                                     ; FBFF 00                       .
        brk                                     ; FC00 00                       .
        brk                                     ; FC01 00                       .
        brk                                     ; FC02 00                       .
        brk                                     ; FC03 00                       .
        jmp     LC432                           ; FC04 4C 32 C4                 L2.

; ----------------------------------------------------------------------------
        jmp     LC6EC                           ; FC07 4C EC C6                 L..

; ----------------------------------------------------------------------------
        jmp     LC756                           ; FC0A 4C 56 C7                 LV.

; ----------------------------------------------------------------------------
        ldx     #$03                            ; FC0D A2 03                    ..
LFC0F:  lda     $C03E,x                         ; FC0F BD 3E C0                 .>.
        sta     LC6E4,x                         ; FC12 9D E4 C6                 ...
        dex                                     ; FC15 CA                       .
        bpl     LFC0F                           ; FC16 10 F7                    ..
        stx     LC6EA                           ; FC18 8E EA C6                 ...
        stx     LC6EB                           ; FC1B 8E EB C6                 ...
        inx                                     ; FC1E E8                       .
        stx     LC6E8                           ; FC1F 8E E8 C6                 ...
        stx     LC6E9                           ; FC22 8E E9 C6                 ...
        rts                                     ; FC25 60                       `

; ----------------------------------------------------------------------------
LFC26:  jsr     LD398                           ; FC26 20 98 D3                  ..
        inx                                     ; FC29 E8                       .
        inx                                     ; FC2A E8                       .
        cpx     #$08                            ; FC2B E0 08                    ..
        bne     LFC35                           ; FC2D D0 06                    ..
        jmp     LDE23                           ; FC2F 4C 23 DE                 L#.

; ----------------------------------------------------------------------------
        jsr     LC40D                           ; FC32 20 0D C4                  ..
LFC35:  jsr     LD39E                           ; FC35 20 9E D3                  ..
        beq     LFC4E                           ; FC38 F0 14                    ..
        cmp     #$2C                            ; FC3A C9 2C                    .,
        beq     LFC26                           ; FC3C F0 E8                    ..
        stx     $F2                             ; FC3E 86 F2                    ..
        jsr     LD2FA                           ; FC40 20 FA D2                  ..
        ldx     $F2                             ; FC43 A6 F2                    ..
        sta     LC6E5,x                         ; FC45 9D E5 C6                 ...
        tya                                     ; FC48 98                       .
        sta     LC6E4,x                         ; FC49 9D E4 C6                 ...
        bcc     LFC35                           ; FC4C 90 E7                    ..
LFC4E:  lda     $A6                             ; FC4E A5 A6                    ..
        ldy     $A7                             ; FC50 A4 A7                    ..
        sta     $04                             ; FC52 85 04                    ..
        sty     $05                             ; FC54 84 05                    ..
        .byte   $A5                             ; FC56 A5                       .
LFC57:  txs                                     ; FC57 9A                       .
        ldy     $9B                             ; FC58 A4 9B                    ..
        sta     $00                             ; FC5A 85 00                    ..
        sty     $01                             ; FC5C 84 01                    ..
        lda     $9C                             ; FC5E A5 9C                    ..
        ldy     $9D                             ; FC60 A4 9D                    ..
        sta     $02                             ; FC62 85 02                    ..
        sty     $03                             ; FC64 84 03                    ..
        jsr     LC4A8                           ; FC66 20 A8 C4                  ..
        jmp     LE0B4                           ; FC69 4C B4 E0                 L..

; ----------------------------------------------------------------------------
        stx     $33                             ; FC6C 86 33                    .3
        sta     $34                             ; FC6E 85 34                    .4
        lda     $00                             ; FC70 A5 00                    ..
LFC72:  ldx     $01                             ; FC72 A6 01                    ..
LFC74:  jmp     LC6DC                           ; FC74 4C DC C6                 L..

; ----------------------------------------------------------------------------
        sta     ($F4),y                         ; FC77 91 F4                    ..
        inc     $E9                             ; FC79 E6 E9                    ..
        bne     LFC7F                           ; FC7B D0 02                    ..
        inc     $EA                             ; FC7D E6 EA                    ..
LFC7F:  inc     $F4                             ; FC7F E6 F4                    ..
        bne     LFC90                           ; FC81 D0 0D                    ..
        inc     $F5                             ; FC83 E6 F5                    ..
        rts                                     ; FC85 60                       `

; ----------------------------------------------------------------------------
        tya                                     ; FC86 98                       .
        clc                                     ; FC87 18                       .
        adc     $08                             ; FC88 65 08                    e.
        sta     $08                             ; FC8A 85 08                    ..
        bcc     LFC90                           ; FC8C 90 02                    ..
        inc     $09                             ; FC8E E6 09                    ..
LFC90:  rts                                     ; FC90 60                       `

; ----------------------------------------------------------------------------
        tya                                     ; FC91 98                       .
        clc                                     ; FC92 18                       .
        adc     $0A                             ; FC93 65 0A                    e.
        sta     $0A                             ; FC95 85 0A                    ..
        bcc     LFC90                           ; FC97 90 F7                    ..
        inc     $0B                             ; FC99 E6 0B                    ..
        rts                                     ; FC9B 60                       `

; ----------------------------------------------------------------------------
        clc                                     ; FC9C 18                       .
        .byte   $A9                             ; FC9D A9                       .
LFC9E:  ora     $65                             ; FC9E 05 65                    .e
        .byte   $F4                             ; FCA0 F4                       .
        sta     $F4                             ; FCA1 85 F4                    ..
        bcc     LFC90                           ; FCA3 90 EB                    ..
        inc     $F5                             ; FCA5 E6 F5                    ..
        rts                                     ; FCA7 60                       `

; ----------------------------------------------------------------------------
        sei                                     ; FCA8 78                       x
        ldy     $01                             ; FCA9 A4 01                    ..
        ldx     $00                             ; FCAB A6 00                    ..
        bne     LFCB0                           ; FCAD D0 01                    ..
        dey                                     ; FCAF 88                       .
LFCB0:  dex                                     ; FCB0 CA                       .
        stx     $CE                             ; FCB1 86 CE                    ..
        sty     $CF                             ; FCB3 84 CF                    ..
        stx     $08                             ; FCB5 86 08                    ..
        sty     $09                             ; FCB7 84 09                    ..
        stx     $0A                             ; FCB9 86 0A                    ..
        sty     $0B                             ; FCBB 84 0B                    ..
        lda     $02                             ; FCBD A5 02                    ..
        ldy     $03                             ; FCBF A4 03                    ..
        sta     $C9                             ; FCC1 85 C9                    ..
        sty     $CA                             ; FCC3 84 CA                    ..
        lda     $04                             ; FCC5 A5 04                    ..
        ldy     $05                             ; FCC7 A4 05                    ..
        sta     $C7                             ; FCC9 85 C7                    ..
        sty     $C8                             ; FCCB 84 C8                    ..
        jsr     LC6D4                           ; FCCD 20 D4 C6                  ..
        inc     $C8                             ; FCD0 E6 C8                    ..
        lda     $C7                             ; FCD2 A5 C7                    ..
        ldy     $C8                             ; FCD4 A4 C8                    ..
        sta     $E9                             ; FCD6 85 E9                    ..
        sty     $EA                             ; FCD8 84 EA                    ..
        lda     $CE                             ; FCDA A5 CE                    ..
        ldy     $CF                             ; FCDC A4 CF                    ..
        sta     $F4                             ; FCDE 85 F4                    ..
        sty     $F5                             ; FCE0 84 F5                    ..
        lda     #$F3                            ; FCE2 A9 F3                    ..
        ldy     #$00                            ; FCE4 A0 00                    ..
        sta     $F8                             ; FCE6 85 F8                    ..
        sty     SEDORIC_FTYPE                   ; FCE8 84 F9                    ..
LFCEA:  ldy     #$00                            ; FCEA A0 00                    ..
        lda     ($E9),y                         ; FCEC B1 E9                    ..
        bne     LFD15                           ; FCEE D0 25                    .%
        ldy     #$02                            ; FCF0 A0 02                    ..
        lda     ($E9),y                         ; FCF2 B1 E9                    ..
        beq     LFD04                           ; FCF4 F0 0E                    ..
        ldy     #$00                            ; FCF6 A0 00                    ..
        ldx     #$04                            ; FCF8 A2 04                    ..
LFCFA:  lda     ($E9),y                         ; FCFA B1 E9                    ..
        jsr     LC477                           ; FCFC 20 77 C4                  w.
        dex                                     ; FCFF CA                       .
        bpl     LFCFA                           ; FD00 10 F8                    ..
        bmi     LFCEA                           ; FD02 30 E6                    0.
LFD04:  sta     ($F4),y                         ; FD04 91 F4                    ..
        dey                                     ; FD06 88                       .
        bpl     LFD04                           ; FD07 10 FB                    ..
        ldy     #$04                            ; FD09 A0 04                    ..
        sta     ($F8),y                         ; FD0B 91 F8                    ..
        .byte   $4C                             ; FD0D 4C                       L
LFD0E:  .byte   $99                             ; FD0E 99                       .
        .byte   $C5                             ; FD0F C5                       .
LFD10:  jsr     LC477                           ; FD10 20 77 C4                  w.
        bne     LFCEA                           ; FD13 D0 D5                    ..
LFD15:  cmp     #$97                            ; FD15 C9 97                    ..
        beq     LFD2D                           ; FD17 F0 14                    ..
        cmp     #$9B                            ; FD19 C9 9B                    ..
        beq     LFD2D                           ; FD1B F0 10                    ..
        cmp     #$C8                            ; FD1D C9 C8                    ..
        beq     LFD2D                           ; FD1F F0 0C                    ..
        cmp     #$C9                            ; FD21 C9 C9                    ..
        beq     LFD2D                           ; FD23 F0 08                    ..
        cmp     #$9A                            ; FD25 C9 9A                    ..
        beq     LFD2D                           ; FD27 F0 04                    ..
        .byte   $C9                             ; FD29 C9                       .
LFD2A:  tya                                     ; FD2A 98                       .
        bne     LFD10                           ; FD2B D0 E3                    ..
LFD2D:  jsr     LC477                           ; FD2D 20 77 C4                  w.
        lda     ($E9),y                         ; FD30 B1 E9                    ..
        beq     LFCEA                           ; FD32 F0 B6                    ..
        cmp     #$20                            ; FD34 C9 20                    . 
        beq     LFD2D                           ; FD36 F0 F5                    ..
        cmp     #$30                            ; FD38 C9 30                    .0
        bcc     LFD10                           ; FD3A 90 D4                    ..
        cmp     #$97                            ; FD3C C9 97                    ..
        beq     LFD2D                           ; FD3E F0 ED                    ..
        cmp     #$9B                            ; FD40 C9 9B                    ..
        beq     LFD2D                           ; FD42 F0 E9                    ..
LFD44:  cmp     #$3A                            ; FD44 C9 3A                    .:
LFD46:  bcs     LFD10                           ; FD46 B0 C8                    ..
LFD48:  iny                                     ; FD48 C8                       .
        lda     ($E9),y                         ; FD49 B1 E9                    ..
        beq     LFD67                           ; FD4B F0 1A                    ..
        cmp     #$27                            ; FD4D C9 27                    .'
        beq     LFD67                           ; FD4F F0 16                    ..
        cmp     #$30                            ; FD51 C9 30                    .0
        bcc     LFD5B                           ; FD53 90 06                    ..
        cmp     #$3A                            ; FD55 C9 3A                    .:
        bcc     LFD48                           ; FD57 90 EF                    ..
        beq     LFD67                           ; FD59 F0 0C                    ..
LFD5B:  cmp     #$C8                            ; FD5B C9 C8                    ..
        beq     LFD67                           ; FD5D F0 08                    ..
        cmp     #$2C                            ; FD5F C9 2C                    .,
        beq     LFD67                           ; FD61 F0 04                    ..
        cmp     #$20                            ; FD63 C9 20                    . 
LFD65:  bne     LFCEA                           ; FD65 D0 83                    ..
LFD67:  pha                                     ; FD67 48                       H
        lda     #$00                            ; FD68 A9 00                    ..
        sta     ($E9),y                         ; FD6A 91 E9                    ..
        ldx     $F4                             ; FD6C A6 F4                    ..
        txa                                     ; FD6E 8A                       .
        ldy     #$03                            ; FD6F A0 03                    ..
        sta     ($F8),y                         ; FD71 91 F8                    ..
LFD73:  iny                                     ; FD73 C8                       .
        lda     $F5                             ; FD74 A5 F5                    ..
        sta     ($F8),y                         ; FD76 91 F8                    ..
        stx     $F8                             ; FD78 86 F8                    ..
LFD7A:  sta     SEDORIC_FTYPE                   ; FD7A 85 F9                    ..
        jsr     LD2FA                           ; FD7C 20 FA D2                  ..
        ldy     #$02                            ; FD7F A0 02                    ..
        sta     ($F4),y                         ; FD81 91 F4                    ..
        dey                                     ; FD83 88                       .
        lda     $33                             ; FD84 A5 33                    .3
        sta     ($F4),y                         ; FD86 91 F4                    ..
        dey                                     ; FD88 88                       .
        lda     #$FF                            ; FD89 A9 FF                    ..
        sta     ($F4),y                         ; FD8B 91 F4                    ..
        jsr     LC49C                           ; FD8D 20 9C C4                  ..
        pla                                     ; FD90 68                       h
        sta     ($E9),y                         ; FD91 91 E9                    ..
        cmp     #$2C                            ; FD93 C9 2C                    .,
        beq     LFD2D                           ; FD95 F0 96                    ..
        bne     LFD65                           ; FD97 D0 CC                    ..
        ldx     $00                             ; FD99 A6 00                    ..
        lda     $01                             ; FD9B A5 01                    ..
        clc                                     ; FD9D 18                       .
        ldy     #$01                            ; FD9E A0 01                    ..
LFDA0:  stx     $F4                             ; FDA0 86 F4                    ..
        sta     $F5                             ; FDA2 85 F5                    ..
        lda     ($F4),y                         ; FDA4 B1 F4                    ..
        beq     LFDCA                           ; FDA6 F0 22                    ."
        ldy     #$03                            ; FDA8 A0 03                    ..
LFDAA:  iny                                     ; FDAA C8                       .
LFDAB:  lda     ($F4),y                         ; FDAB B1 F4                    ..
        beq     LFDB9                           ; FDAD F0 0A                    ..
        cmp     #$FF                            ; FDAF C9 FF                    ..
        bne     LFDAA                           ; FDB1 D0 F7                    ..
        tya                                     ; FDB3 98                       .
        adc     #$04                            ; FDB4 69 04                    i.
        tay                                     ; FDB6 A8                       .
        bcc     LFDAB                           ; FDB7 90 F2                    ..
LFDB9:  tya                                     ; FDB9 98                       .
        sec                                     ; FDBA 38                       8
        adc     $F4                             ; FDBB 65 F4                    e.
        tax                                     ; FDBD AA                       .
        ldy     #$00                            ; FDBE A0 00                    ..
        sta     ($F4),y                         ; FDC0 91 F4                    ..
        tya                                     ; FDC2 98                       .
        adc     $F5                             ; FDC3 65 F5                    e.
        iny                                     ; FDC5 C8                       .
        sta     ($F4),y                         ; FDC6 91 F4                    ..
        bcc     LFDA0                           ; FDC8 90 D6                    ..
LFDCA:  ldx     $F6                             ; FDCA A6 F6                    ..
LFDCC:  lda     $F7                             ; FDCC A5 F7                    ..
LFDCE:  beq     LFDF3                           ; FDCE F0 23                    .#
        stx     $F4                             ; FDD0 86 F4                    ..
        sta     $F5                             ; FDD2 85 F5                    ..
        ldy     #$01                            ; FDD4 A0 01                    ..
        lda     ($F4),y                         ; FDD6 B1 F4                    ..
        tax                                     ; FDD8 AA                       .
LFDD9:  iny                                     ; FDD9 C8                       .
        lda     ($F4),y                         ; FDDA B1 F4                    ..
        jsr     LC46C                           ; FDDC 20 6C C4                  l.
        ldy     #$01                            ; FDDF A0 01                    ..
        lda     $CE                             ; FDE1 A5 CE                    ..
        sta     ($F4),y                         ; FDE3 91 F4                    ..
        iny                                     ; FDE5 C8                       .
        lda     $CF                             ; FDE6 A5 CF                    ..
        sta     ($F4),y                         ; FDE8 91 F4                    ..
        iny                                     ; FDEA C8                       .
        lda     ($F4),y                         ; FDEB B1 F4                    ..
        tax                                     ; FDED AA                       .
        iny                                     ; FDEE C8                       .
        lda     ($F4),y                         ; FDEF B1 F4                    ..
        bne     LFDCE                           ; FDF1 D0 DB                    ..
LFDF3:  ldx     LC6EA                           ; FDF3 AE EA C6                 ...
        lda     LC6EB                           ; FDF6 AD EB C6                 ...
        jsr     LC46C                           ; FDF9 20 6C C4                  l.
        ldy     #$01                            ; FDFC A0 01                    ..
        lda     ($CE),y                         ; FDFE B1 CE                    ..
        pha                                     ; FE00 48                       H
        lda     #$00                            ; FE01 A9 00                    ..
        sta     ($CE),y                         ; FE03 91 CE                    ..
        .byte   $AE                             ; FE05 AE                       .
LFE06:  inx                                     ; FE06 E8                       .
LFE07:  dec     $AD                             ; FE07 C6 AD                    ..
        sbc     #$C6                            ; FE09 E9 C6                    ..
        jsr     LC46C                           ; FE0B 20 6C C4                  l.
LFE0E:  ldy     #$03                            ; FE0E A0 03                    ..
        .byte   $AD                             ; FE10 AD                       .
LFE11:  sbc     $C6                             ; FE11 E5 C6                    ..
        sta     ($CE),y                         ; FE13 91 CE                    ..
        dey                                     ; FE15 88                       .
        lda     LC6E4                           ; FE16 AD E4 C6                 ...
        sta     ($CE),y                         ; FE19 91 CE                    ..
        clc                                     ; FE1B 18                       .
        .byte   $6D                             ; FE1C 6D                       m
LFE1D:  inc     $C6                             ; FE1D E6 C6                    ..
        sta     LC6E4                           ; FE1F 8D E4 C6                 ...
        lda     LC6E5                           ; FE22 AD E5 C6                 ...
        adc     LC6E7                           ; FE25 6D E7 C6                 m..
        sta     LC6E5                           ; FE28 8D E5 C6                 ...
        bcs     LFE3D                           ; FE2B B0 10                    ..
        ldy     #$00                            ; FE2D A0 00                    ..
        lda     ($CE),y                         ; FE2F B1 CE                    ..
        tax                                     ; FE31 AA                       .
        iny                                     ; FE32 C8                       .
        lda     ($CE),y                         ; FE33 B1 CE                    ..
        beq     LFE4F                           ; FE35 F0 18                    ..
        .byte   $86                             ; FE37 86                       .
LFE38:  dec     LCF85                           ; FE38 CE 85 CF                 ...
        bne     LFE0E                           ; FE3B D0 D1                    ..
LFE3D:  pla                                     ; FE3D 68                       h
        jsr     LC40D                           ; FE3E 20 0D C4                  ..
        ldy     #$03                            ; FE41 A0 03                    ..
        txa                                     ; FE43 8A                       .
LFE44:  sta     LC6E4,y                         ; FE44 99 E4 C6                 ...
        dey                                     ; FE47 88                       .
        bpl     LFE44                           ; FE48 10 FA                    ..
        inc     LC6E6                           ; FE4A EE E6 C6                 ...
        bne     LFDF3                           ; FE4D D0 A4                    ..
LFE4F:  pla                                     ; FE4F 68                       h
        sta     ($CE),y                         ; FE50 91 CE                    ..
        lda     $F7                             ; FE52 A5 F7                    ..
        beq     LFE98                           ; FE54 F0 42                    .B
        ldy     #$01                            ; FE56 A0 01                    ..
        lda     ($F6),y                         ; FE58 B1 F6                    ..
        sta     $F8                             ; FE5A 85 F8                    ..
        iny                                     ; FE5C C8                       .
        lda     ($F6),y                         ; FE5D B1 F6                    ..
        sta     SEDORIC_FTYPE                   ; FE5F 85 F9                    ..
        iny                                     ; FE61 C8                       .
        lda     ($F6),y                         ; FE62 B1 F6                    ..
        pha                                     ; FE64 48                       H
        iny                                     ; FE65 C8                       .
        lda     ($F6),y                         ; FE66 B1 F6                    ..
        pha                                     ; FE68 48                       H
        ldy     #$03                            ; FE69 A0 03                    ..
        lda     ($F8),y                         ; FE6B B1 F8                    ..
        pha                                     ; FE6D 48                       H
        dey                                     ; FE6E 88                       .
        lda     ($F8),y                         ; FE6F B1 F8                    ..
        tay                                     ; FE71 A8                       .
        pla                                     ; FE72 68                       h
        jsr     LD2CA                           ; FE73 20 CA D2                  ..
        jsr     LD2D2                           ; FE76 20 D2 D2                  ..
        ldy     #$00                            ; FE79 A0 00                    ..
LFE7B:  lda     STACK+1,y                       ; FE7B B9 01 01                 ...
        beq     LFE85                           ; FE7E F0 05                    ..
        sta     ($F6),y                         ; FE80 91 F6                    ..
        iny                                     ; FE82 C8                       .
        bne     LFE7B                           ; FE83 D0 F6                    ..
LFE85:  lda     #$FF                            ; FE85 A9 FF                    ..
LFE87:  cpy     #$05                            ; FE87 C0 05                    ..
        beq     LFE90                           ; FE89 F0 05                    ..
        sta     ($F6),y                         ; FE8B 91 F6                    ..
        iny                                     ; FE8D C8                       .
        bne     LFE87                           ; FE8E D0 F7                    ..
LFE90:  pla                                     ; FE90 68                       h
        sta     $F7                             ; FE91 85 F7                    ..
        pla                                     ; FE93 68                       h
LFE94:  sta     $F6                             ; FE94 85 F6                    ..
        .byte   $B0                             ; FE96 B0                       .
LFE97:  tsx                                     ; FE97 BA                       .
LFE98:  ldy     #$00                            ; FE98 A0 00                    ..
LFE9A:  .byte   $B1                             ; FE9A B1                       .
LFE9B:  php                                     ; FE9B 08                       .
        beq     LFEB1                           ; FE9C F0 13                    ..
        cmp     #$FF                            ; FE9E C9 FF                    ..
        beq     LFEA7                           ; FEA0 F0 05                    ..
        sta     ($0A),y                         ; FEA2 91 0A                    ..
        iny                                     ; FEA4 C8                       .
        bne     LFE9A                           ; FEA5 D0 F3                    ..
LFEA7:  jsr     LC491                           ; FEA7 20 91 C4                  ..
        iny                                     ; FEAA C8                       .
        jsr     LC486                           ; FEAB 20 86 C4                  ..
        jmp     LC698                           ; FEAE 4C 98 C6                 L..

; ----------------------------------------------------------------------------
LFEB1:  iny                                     ; FEB1 C8                       .
        iny                                     ; FEB2 C8                       .
        lda     ($08),y                         ; FEB3 B1 08                    ..
        php                                     ; FEB5 08                       .
        dey                                     ; FEB6 88                       .
        dey                                     ; FEB7 88                       .
        ldx     #$04                            ; FEB8 A2 04                    ..
LFEBA:  lda     ($08),y                         ; FEBA B1 08                    ..
        sta     ($0A),y                         ; FEBC 91 0A                    ..
        iny                                     ; FEBE C8                       .
        dex                                     ; FEBF CA                       .
        bpl     LFEBA                           ; FEC0 10 F8                    ..
        plp                                     ; FEC2 28                       (
        beq     LFECE                           ; FEC3 F0 09                    ..
        jsr     LC486                           ; FEC5 20 86 C4                  ..
        jsr     LC491                           ; FEC8 20 91 C4                  ..
        jmp     LC698                           ; FECB 4C 98 C6                 L..

; ----------------------------------------------------------------------------
LFECE:  dey                                     ; FECE 88                       .
        dey                                     ; FECF 88                       .
        cli                                     ; FED0 58                       X
        jmp     LC491                           ; FED1 4C 91 C4                 L..

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; FED4 20 D8 D5                  ..
        .byte   $FB                             ; FED7 FB                       .
        .byte   $C3                             ; FED8 C3                       .
        .byte   $F7                             ; FED9 F7                       .
        .byte   $C3                             ; FEDA C3                       .
        rts                                     ; FEDB 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; FEDC 20 D8 D5                  ..
LFEDF:  inx                                     ; FEDF E8                       .
        dec     $BD                             ; FEE0 C6 BD                    ..
        dec     $60                             ; FEE2 C6 60                    .`
        brk                                     ; FEE4 00                       .
        brk                                     ; FEE5 00                       .
LFEE6:  brk                                     ; FEE6 00                       .
        brk                                     ; FEE7 00                       .
        brk                                     ; FEE8 00                       .
        brk                                     ; FEE9 00                       .
        brk                                     ; FEEA 00                       .
        brk                                     ; FEEB 00                       .
        .byte   $20                             ; FEEC 20                        
        .byte   $F3                             ; FEED F3                       .
LFEEE:  cmp     ($20),y                         ; FEEE D1 20                    . 
        .byte   $9C                             ; FEF0 9C                       .
        cmp     ($A5),y                         ; FEF1 D1 A5                    ..
        dec     $F285                           ; FEF3 CE 85 F2                 ...
        stx     $F3                             ; FEF6 86 F3                    ..
        lda     #$FF                            ; FEF8 A9 FF                    ..
        sta     $33                             ; FEFA 85 33                    .3
        sta     $34                             ; FEFC 85 34                    .4
        lda     #$CD                            ; FEFE A9 CD                    ..
LFF00:  ror     $F2                             ; FF00 66 F2                    f.
        eor     #$01                            ; FF02 49 01                    I.
        bne     LFEEE                           ; FF04 D0 E8                    ..
        bit     $F2                             ; FF06 24 F2                    $.
        rts                                     ; FF08 60                       `

; ----------------------------------------------------------------------------
        lda     #$1E                            ; FF09 A9 1E                    ..
        jsr     XAFCAR                          ; FF0B 20 2A D6                  *.
        jsr     LD206                           ; FF0E 20 06 D2                  ..
LFF11:  jsr     LF2CA                           ; FF11 20 CA F2                  ..
        beq     LFF24                           ; FF14 F0 0E                    ..
        lda     #$09                            ; FF16 A9 09                    ..
        jsr     LF2EC                           ; FF18 20 EC F2                  ..
LFF1B:  bpl     LFF11                           ; FF1B 10 F4                    ..
        pla                                     ; FF1D 68                       h
        pla                                     ; FF1E 68                       h
        plp                                     ; FF1F 28                       (
        pla                                     ; FF20 68                       h
        sta     BASIC11_FLG                     ; FF21 8D 6A 02                 .j.
LFF24:  rts                                     ; FF24 60                       `

; ----------------------------------------------------------------------------
        clc                                     ; FF25 18                       .
        bit     $38                             ; FF26 24 38                    $8
        ror     $C072                           ; FF28 6E 72 C0                 nr.
        jsr     LF309                           ; FF2B 20 09 F3                  ..
        lda     #$57                            ; FF2E A9 57                    .W
        ldy     #$C9                            ; FF30 A0 C9                    ..
        sta     $B4                             ; FF32 85 B4                    ..
        sty     $B5                             ; FF34 84 B5                    ..
        lda     #$00                            ; FF36 A9 00                    ..
        sta     $F6                             ; FF38 85 F6                    ..
        sta     $F7                             ; FF3A 85 F7                    ..
        .byte   $A0                             ; FF3C A0                       .
LFF3D:  ora     ($84,x)                         ; FF3D 01 84                    ..
        rol     $88                             ; FF3F 26 88                    &.
        sty     $29                             ; FF41 84 29                    .)
; System Vectors
SEDORIC_VECTORS:
        sty     $27                             ; FF43 84 27                    .'
        dey                                     ; FF45 88                       .
        sty     $28                             ; FF46 84 28                    .(
        ldy     $F6                             ; FF48 A4 F6                    ..
        ldx     $F7                             ; FF4A A6 F7                    ..
        inc     $F6                             ; FF4C E6 F6                    ..
        bne     LFF52                           ; FF4E D0 02                    ..
        inc     $F7                             ; FF50 E6 F7                    ..
LFF52:  jsr     L04D1                           ; FF52 20 D1 04                  ..
        ldy     #$00                            ; FF55 A0 00                    ..
        lda     ($B6),y                         ; FF57 B1 B6                    ..
        sta     $F2                             ; FF59 85 F2                    ..
        iny                                     ; FF5B C8                       .
        lda     ($B6),y                         ; FF5C B1 B6                    ..
        sta     $91                             ; FF5E 85 91                    ..
        iny                                     ; FF60 C8                       .
        lda     ($B6),y                         ; FF61 B1 B6                    ..
        sta     $92                             ; FF63 85 92                    ..
        ldx     #$00                            ; FF65 A2 00                    ..
LFF67:  bit     $C072                           ; FF67 2C 72 C0                 ,r.
        bpl     LFF80                           ; FF6A 10 14                    ..
        cpx     $F2                             ; FF6C E4 F2                    ..
        txa                                     ; FF6E 8A                       .
        inx                                     ; FF6F E8                       .
        beq     LFFCB                           ; FF70 F0 59                    .Y
        tay                                     ; FF72 A8                       .
        lda     ($91),y                         ; FF73 B1 91                    ..
        bcc     LFF93                           ; FF75 90 1C                    ..
        lda     #$7F                            ; FF77 A9 7F                    ..
        ldy     BASIC11_Y_TEXT                  ; FF79 AC 69 02                 .i.
        sta     ($12),y                         ; FF7C 91 12                    ..
        bcs     LFF91                           ; FF7E B0 11                    ..
LFF80:  ldy     BASIC11_Y_TEXT                  ; FF80 AC 69 02                 .i.
        lda     ($12),y                         ; FF83 B1 12                    ..
        cmp     #$7F                            ; FF85 C9 7F                    ..
        bne     LFF8B                           ; FF87 D0 02                    ..
        lda     #$20                            ; FF89 A9 20                    . 
LFF8B:  sta     SEDORIC_BUF1,x                  ; FF8B 9D 00 C1                 ...
        inx                                     ; FF8E E8                       .
        beq     LFFCB                           ; FF8F F0 3A                    .:
LFF91:  lda     #$09                            ; FF91 A9 09                    ..
LFF93:  jsr     XAFCAR                          ; FF93 20 2A D6                  *.
        jsr     LF2CA                           ; FF96 20 CA F2                  ..
        beq     LFF67                           ; FF99 F0 CC                    ..
        bit     $C072                           ; FF9B 2C 72 C0                 ,r.
        bmi     LFFBC                           ; FF9E 30 1C                    0.
        stx     $F2                             ; FFA0 86 F2                    ..
        txa                                     ; FFA2 8A                       .
        jsr     LD264                           ; FFA3 20 64 D2                  d.
        ldy     #$00                            ; FFA6 A0 00                    ..
LFFA8:  lda     SEDORIC_BUF1,y                  ; FFA8 B9 00 C1                 ...
        sta     ($D1),y                         ; FFAB 91 D1                    ..
        iny                                     ; FFAD C8                       .
        cpy     $F2                             ; FFAE C4 F2                    ..
        bne     LFFA8                           ; FFB0 D0 F6                    ..
        ldy     #$02                            ; FFB2 A0 02                    ..
LFFB4:  lda     $D0,y                           ; FFB4 B9 D0 00                 ...
        sta     ($B6),y                         ; FFB7 91 B6                    ..
        dey                                     ; FFB9 88                       .
        bpl     LFFB4                           ; FFBA 10 F8                    ..
LFFBC:  lda     #$09                            ; FFBC A9 09                    ..
        jsr     LF2EC                           ; FFBE 20 EC F2                  ..
        bmi     LFFCE                           ; FFC1 30 0B                    0.
        jsr     LF2CA                           ; FFC3 20 CA F2                  ..
COPYRIGHT_TEXT  := * + 1
        bne     LFFBC                           ; FFC6 D0 F4                    ..
        .byte   "L<"                            ; FFC8 4C 3C                    L<
        .byte   $F3                             ; FFCA F3                       .
LFFCB:  .byte   "Lw"                            ; FFCB 4C 77                    Lw
        .byte   $E9                             ; FFCD E9                       .
LFFCE:  .byte   "`"                             ; FFCE 60                       `
        .byte   $A5,$0A,$0A                     ; FFCF A5 0A 0A                 ...
        .byte   "i"                             ; FFD2 69                       i
        .byte   $08,$D0,$0B,$A0,$04,$B1,$9E     ; FFD3 08 D0 0B A0 04 B1 9E     .......
LFFDA:  .byte   "H"                             ; FFDA 48                       H
        .byte   $C8,$B1,$9E,$A8                 ; FFDB C8 B1 9E A8              ....
        .byte   "h,"                            ; FFDF 68 2C                    h,
        .byte   $A0,$00,$18                     ; FFE1 A0 00 18                 ...
        .byte   "e"                             ; FFE4 65                       e
        .byte   $9E,$85,$F2                     ; FFE5 9E 85 F2                 ...
        .byte   "H"                             ; FFE8 48                       H
        .byte   $98                             ; FFE9 98                       .
        .byte   "e"                             ; FFEA 65                       e
        .byte   $9F,$85,$F3,$AA                 ; FFEB 9F 85 F3 AA              ....
        .byte   "h"                             ; FFEF 68                       h
        .byte   $A0,$00                         ; FFF0 A0 00                    ..
        .byte   "`"                             ; FFF2 60                       `
        .byte   $A0,$00,$A5,$9F,$C5,$A1,$F0     ; FFF3 A0 00 A5 9F C5 A1 F0     .......
; ----------------------------------------------------------------------------
NMI_VECTOR:
        .addr   LB107                           ; FFFA 07 B1                    ..
RESET_VECTOR:
        .addr   LC89E                           ; FFFC 9E C8                    ..
; ----------------------------------------------------------------------------
IRQ_VECTOR:
        .word   $9E31                           ; FFFE 31 9E                    1.
