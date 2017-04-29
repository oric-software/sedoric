; da65 V2.15
; Created:    2017-04-29 21:48:07
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
L0471           := $0471
DO_RAMROM       := $0477                        ; Switch from ROM to Overlay and vice-versa
SED_IRQ         := $0488                        ; Replaces IRQ
SED_COLDSTART   := $04A8                        ; Replaces COLDSTART
DO_IRQRAM       := $04B3                        ; forwards IRQ/NMI from overlay to ROM
SEDORIC_EXERAM  := $04EC
SEDORIC_EXEVEC  := $04EF
RAMROM          := $04F2
IRQRAM          := $04F5
NMIRAM          := $04F8
MICRODISC_CONTROL_SHADOW:= $04FB                ; Caches the control register as it's write-only
SEDORIC_FLAGIF  := $04FC                        ; b7=1 if inside IF
SEDORIC_IDERROR := $04FD                        ; id of Error
SEDORIC_NOLIGN  := $04FE                        ; Line of Error
SEDORIC_DRIVE   := $C000
SEDORIC_TRACK   := $C001
SEDORIC_SECTOR  := $C002
SEDORIC_RWBUF   := $C003
SEDORIC_type_of_error:= $C005                   ; b5=0 write fault if b5=1 read fault
SEDORIC_XRWTS_RERY:= $C006                      ; XRWTS (nombre de tentatives possibles en cas de secteur non trouvé)
SEDORIC_number_of_retry:= $C007
SEDORIC_DRVDEF  := $C009
SEDORIC_DRVSYS  := $C00A
SEDORIC_ACTIVATE_DRIVE_AND_TRACK:= $C00B        ; activation drive et piste  contains $00 $0b
SEDORIC_EXTER   := $C00D
SEDORIC_EXTMS   := $C00F
SEDORIC_EXTNB   := $C015
SEDORIC_IO_ERROR:= $C017                        ; number of I/O error
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
LD206           := $D206
SEDORIC_KEYBOARD_WAIT:= $D302                   ; Saisit une touche: si touche frappée alors N = 1 et A = code ASCII sinon N = 0
LD36C           := $D36C
LD39E           := $D39E
SEDORIC_XROM    := $D5D8
XAFHEX          := $D613
XAFCAR_DISPLAY_SPACE:= $D628
XAFCAR          := $D62A
XAFSTR          := $D637
XCURON          := $D73E
XCUROFF         := $D740
LDA1F           := $DA1F
XPMAP           := $DA4C
READ_SECTOR_TRACK:= $DA5D                       ; $DA5D
XPRSEC          := $DA73
XSCAT           := $DA82
XSMAP           := $DA8A
XSVSEC          := $DAA4
XTVNM           := $DB30
XTRVCA          := $DB59
XWDESC          := $DBC0
XLIBSE          := $DC6C
XDETSE          := $DD15
XCREAY          := $DD2D
LDD49           := $DD49
CMD_SAVEM       := $DD4A
LDD4C           := $DD4C
CMD_SAVEU       := $DD4D
LDD4F           := $DD4F
CMD_SAVE        := $DD50
LDD52           := $DD52
CMD_SAVEO       := $DD53
LDDCC           := $DDCC
CMD_KEYSAVE     := $DDCD
LDDDF           := $DDDF
CMD_ESAVE       := $DDE0
LDE4C           := $DE4C
CMD_CREATEW     := $DE4D
LDFF6           := $DFF6
CMD_LOAD        := $DFF7
LE0AE           := $E0AE
CMD_OLD         := $E0AF
SEDORIC_STR_NOT_EMPTY_DIRECTORY:= $E263         ; X
LE343           := $E343
CMD_DIR         := $E344
LE436           := $E436
CMD_DELBAK      := $E437
LE443           := $E443
CMD_DESTROY     := $E444
LE445           := $E445
CMD_DEL         := $E446
CMD_REN         := $E537
LE5FB           := $E5FB
CMD_SEARCH      := $E5FC
LE70A           := $E70A
CMD_KEY         := $E70B
LE71E           := $E71E
CMD_OUT         := $E71F
LE73F           := $E73F
CMD_WIDTH       := $E740
LE742           := $E742
LE745           := $E745
LE748           := $E748
LE74B           := $E74B
LE74E           := $E74E
LE76F           := $E76F
LE772           := $E772
LE775           := $E775
LE778           := $E778
LE795           := $E795
CMD_RANDOM      := $E796
LE7B7           := $E7B7
CMD_RESET       := $E7B8
LE7BF           := $E7BF
CMD_PR          := $E7C0
CMD_LDIR        := $E7D0
LE7D8           := $E7D8
CMD_RESTORE     := $E7D9
LE7F4           := $E7F4
CMD_QUIT        := $E7F5
LE83D           := $E83D
LE852           := $E852
CMD_STRUN       := $E853
LE89C           := $E89C
CMD_TKEN        := $E89D
LE8E0           := $E8E0
CMD_UNTKEN      := $E8E1
LE97E           := $E97E
CMD_ERR         := $E97F
LE998           := $E998
CMD_ERRGOTO     := $E999
LE9AF           := $E9AF
CMD_ERROR       := $E9B0
LE9BA           := $E9BA
CMD_RESUME      := $E9BB
LE9EC           := $E9EC
CMD_EXT         := $E9ED
LE9EF           := $E9EF
CMD_VISUHIRES   := $E9F0
LE9F2           := $E9F2
CMD_STATUS      := $E9F3
LE9F5           := $E9F5
CMD_PROT        := $E9F6
LE9F8           := $E9F8
CMD_UNPROT      := $E9F9
LE9FB           := $E9FB
CMD_SYSTEM      := $E9FC
LE9FE           := $E9FE
CMD_CHKSUM      := $E9FF
LEA3A           := $EA3A
CMD_SWAP        := $EA3B
LEA7E           := $EA7E
CMD_USER        := $EA7F
CMD_NUM         := $EB25
LEB90           := $EB90
CMD_ACCENT      := $EB91
SEDORIC_XCHAR   := $EBA3                        ; XCHAR sélectionne le jeu de caractères correct (“normal” ou “accentué”) selon MODCLA. Suite commune aux commandes ACCENT, AZERTY, QWERTY et à la routine XSTATUS en EC17
LEBDD           := $EBDD
CMD_AZERTY      := $EBDE
LEBE0           := $EBE0
CMD_QWERTY      := $EBE1
LEBEB           := $EBEB
CMD_LCUR        := $EBEC
LEBF4           := $EBF4
CMD_HCUR        := $EBF5
LEC03           := $EC03
CMD_LBRACKET    := $EC04
LEC2D           := $EC2D
CMD_INSTR       := $EC2E
LEC93           := $EC93
CMD_LINPUT      := $EC94
SEDORIC_STR_NOT_ALLOWED:= $EDC6                 ; X
LEE98           := $EE98
CMD_USING       := $EE99
display_exp_scientific_notation:= $EF4F         ; $ef4f
displayCharInFinalString:= $EF5A                ; $ef5a
LF035           := $F035
CMD_LUSING      := $F036
LF078           := $F078
CMD_LINE        := $F079
LF0DD           := $F0DD
CMD_BOX         := $F0DE
LF120           := $F120
CMD_VUSER       := $F121
LF123           := $F123
CMD_DKEY        := $F124
LF126           := $F126
CMD_DSYS        := $F127
LF129           := $F129
CMD_DNUM        := $F12A
LF12C           := $F12C
CMD_INIST       := $F12D
LF12F           := $F12F
CMD_TRACK       := $F130
LF135           := $F135
CMD_MOVE        := $F136
LF138           := $F138
CMD_DTRACK      := $F139
LF13B           := $F13B
CMD_MERGE       := $F13C
LF141           := $F141
CMD_DELETE      := $F142
LF144           := $F144
CMD_DNAME       := $F145
LF147           := $F147
CMD_CHANGE      := $F148
LF14D           := $F14D
CMD_RENUM       := $F14E
LF150           := $F150
CMD_BACKUP      := $F151
LF153           := $F153
CMD_SEEK        := $F154
LF156           := $F156
CMD_COPY        := $F157
LF159           := $F159
CMD_SYS         := $F15A
LF168           := $F168
CMD_INIT        := $F169
XDLOAD          := $F1E5
LF20F           := $F20F
CMD_WINDOW      := $F210
LF8DE           := $F8DE
LF98F           := $F98F
LF995           := $F995
LF99B           := $F99B
LF9BB           := $F9BB
LF9CA           := $F9CA
LFA4F           := $FA4F
LFABA           := $FABA
SEDORIC_COPYRIGHT:= $FAC7                       ; Sedoric copyright
LFB8C           := $FB8C
LFBBE           := $FBBE
LFC72           := $FC72
LFC74           := $FC74
LFE06           := $FE06
LFE11           := $FE11
LFE94           := $FE94
LFE97           := $FE97
LFEDF           := $FEDF
SEDORIC_VECTORS := $FF43                        ; System Vectors
COPYRIGHT_TEXT  := $FFC7
NMI_VECTOR      := $FFFA
RESET_VECTOR    := $FFFC
IRQ_VECTOR      := $FFFE
; ----------------------------------------------------------------------------
SEDKERN_START:
        lda     SEDORIC_number_of_retry         ; C400 AD 07 C0                 ...
        lsr     a                               ; C403 4A                       J
        lda     #$00                            ; C404 A9 00                    ..
        ror     a                               ; C406 6A                       j
        sta     SEDORIC_ATMORI                  ; C407 8D 24 C0                 .$.
        bpl     LC41B                           ; C40A 10 0F                    ..
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
        sty     BASIC11_KEYBOARD_REPEAT         ; C46A 8C 4F 02                 .O.
        lda     #$0F                            ; C46D A9 0F                    ..
        ldx     #$70                            ; C46F A2 70                    .p
        ldy     #$D0                            ; C471 A0 D0                    ..
        bne     LC487                           ; C473 D0 12                    ..
LC475:  sta     BASIC10_IRQ_VECTOR              ; C475 8D 29 02                 .).
        stx     BASIC10_IRQ_VECTOR+1            ; C478 8E 2A 02                 .*.
        sty     BASIC10_IRQ2_VECTOR             ; C47B 8C 2C 02                 .,.
        stx     BASIC10_IRQ2_VECTOR+1           ; C47E 8E 2D 02                 .-.
        lda     #$07                            ; C481 A9 07                    ..
        ldx     #$E4                            ; C483 A2 E4                    ..
        ldy     #$CF                            ; C485 A0 CF                    ..
LC487:  sta     BASIC11_FLG                     ; C487 8D 6A 02                 .j.
        stx     $02F9                           ; C48A 8E F9 02                 ...
        sty     $02FA                           ; C48D 8C FA 02                 ...
        ldx     #$04                            ; C490 A2 04                    ..
        lda     #$A5                            ; C492 A9 A5                    ..
        ldy     #$D0                            ; C494 A0 D0                    ..
        sta     IRQ_VECTOR                      ; C496 8D FE FF                 ...
        sty     $FFFF                           ; C499 8C FF FF                 ...
        lda     #$67                            ; C49C A9 67                    .g
        ldy     #$61                            ; C49E A0 61                    .a
        sta     BASIC11_BANG_VECTOR             ; C4A0 8D F5 02                 ...
        stx     BASIC11_BANG_VECTOR+1           ; C4A3 8E F6 02                 ...
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
        .byte   "** WARNING **"                 ; C577 2A 2A 20 57 41 52 4E 49  ** WARNI
                                                ; C57F 4E 47 20 2A 2A           NG **
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
        .byte   $68,$20,$E9,$04,$20,$67,$04,$0E ; C640 68 20 E9 04 20 67 04 0E  h .. g..
        .byte   $FC,$04,$B0,$03,$4C,$AD,$C8,$EA ; C648 FC 04 B0 03 4C AD C8 EA  ....L...
        .byte   $EA,$EA,$60,$20,$77,$04,$B1,$16 ; C650 EA EA 60 20 77 04 B1 16  ..` w...
        .byte   $4C,$77,$04,$EA,$EA,$EA,$EA,$EA ; C658 4C 77 04 EA EA EA EA EA  Lw......
        .byte   $EA,$A9,$8E,$A0,$F8,$D0,$04,$A9 ; C660 EA A9 8E A0 F8 D0 04 A9  ........
        .byte   $AE,$A0,$D3,$8D,$F0,$04,$8C,$F1 ; C668 AE A0 D3 8D F0 04 8C F1  ........
        .byte   $04,$20,$77,$04,$20,$EF,$04,$08 ; C670 04 20 77 04 20 EF 04 08  . w. ...
        .byte   $48,$78,$AD,$FB,$04,$49,$02,$8D ; C678 48 78 AD FB 04 49 02 8D  Hx...I..
        .byte   $FB,$04,$8D,$14,$03,$68,$28,$60 ; C680 FB 04 8D 14 03 68 28 60  .....h(`
        .byte   $2C,$0D,$03,$50,$0F,$48,$A9,$04 ; C688 2C 0D 03 50 0F 48 A9 04  ,..P.H..
        .byte   $2D,$6A,$02,$F0,$03,$EE,$74,$02 ; C690 2D 6A 02 F0 03 EE 74 02  -j....t.
        .byte   $68,$4C,$03,$EC,$68,$68,$85,$F2 ; C698 68 4C 03 EC 68 68 85 F2  hL..hh..
        .byte   $68,$AA,$A9,$36,$A0,$D1,$D0,$C3 ; C6A0 68 AA A9 36 A0 D1 D0 C3  h..6....
        .byte   $20,$F2,$04,$68,$40,$8D,$14,$03 ; C6A8 20 F2 04 68 40 8D 14 03   ..h@...
        .byte   $6C,$FC,$FF,$18,$20,$77,$04,$48 ; C6B0 6C FC FF 18 20 77 04 48  l... w.H
        .byte   $A9,$04,$48,$A9,$A8,$48,$08,$B0 ; C6B8 A9 04 48 A9 A8 48 08 B0  ..H..H..
        .byte   $03,$4C,$28,$02,$20,$88,$F8,$A9 ; C6C0 03 4C 28 02 20 88 F8 A9  .L(. ...
        .byte   $17,$A0,$EC,$20,$6B,$04,$4C,$75 ; C6C8 17 A0 EC 20 6B 04 4C 75  ... k.Lu
        .byte   $C4,$A9,$04,$48,$A9,$F1,$48,$8A ; C6D0 C4 A9 04 48 A9 F1 48 8A  ...H..H.
        .byte   $48,$98,$48,$20,$F2,$04,$4C,$70 ; C6D8 48 98 48 20 F2 04 4C 70  H.H ..Lp
        .byte   $D2,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; C6E0 D2 EA EA EA EA EA EA EA  ........
        .byte   $EA,$4C,$87,$04,$4C,$71,$04,$4C ; C6E8 EA 4C 87 04 4C 71 04 4C  .L..Lq.L
        .byte   $00,$00,$4C,$77,$04,$4C,$B3,$04 ; C6F0 00 00 4C 77 04 4C B3 04  ..Lw.L..
        .byte   $4C,$B4,$04,$84,$00,$00,$00,$00 ; C6F8 4C B4 04 84 00 00 00 00  L.......
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
        .byte   $52,$02,$60,$20,$77,$04,$B1,$16 ; C750 52 02 60 20 77 04 B1 16  R.` w...
        .byte   $4C,$77,$04,$A9,$45,$A0,$D8,$D0 ; C758 4C 77 04 A9 45 A0 D8 D0  Lw..E...
        .byte   $0A,$A9,$8E,$A0,$F8,$D0,$04,$A9 ; C760 0A A9 8E A0 F8 D0 04 A9  ........
        .byte   $AE,$A0,$D3,$8D,$F0,$04,$8C,$F1 ; C768 AE A0 D3 8D F0 04 8C F1  ........
        .byte   $04,$20,$77,$04,$20,$EF,$04,$08 ; C770 04 20 77 04 20 EF 04 08  . w. ...
        .byte   $48,$78,$AD,$FB,$04,$49,$02,$8D ; C778 48 78 AD FB 04 49 02 8D  Hx...I..
        .byte   $FB,$04,$8D,$14,$03,$68,$28,$60 ; C780 FB 04 8D 14 03 68 28 60  .....h(`
        .byte   $2C,$0D,$03,$50,$0F,$48,$A9,$04 ; C788 2C 0D 03 50 0F 48 A9 04  ,..P.H..
        .byte   $2D,$6A,$02,$F0,$03,$EE,$74,$02 ; C790 2D 6A 02 F0 03 EE 74 02  -j....t.
        .byte   $68,$4C,$22,$EE,$68,$68,$85,$F2 ; C798 68 4C 22 EE 68 68 85 F2  hL".hh..
        .byte   $68,$AA,$A9,$36,$A0,$D1,$D0,$C3 ; C7A0 68 AA A9 36 A0 D1 D0 C3  h..6....
        .byte   $20,$F2,$04,$68,$40,$8D,$14,$03 ; C7A8 20 F2 04 68 40 8D 14 03   ..h@...
        .byte   $6C,$FC,$FF,$18,$20,$77,$04,$48 ; C7B0 6C FC FF 18 20 77 04 48  l... w.H
        .byte   $A9,$04,$48,$A9,$A8,$48,$08,$B0 ; C7B8 A9 04 48 A9 A8 48 08 B0  ..H..H..
        .byte   $03,$4C,$44,$02,$20,$B8,$F8,$A9 ; C7C0 03 4C 44 02 20 B8 F8 A9  .LD. ...
        .byte   $17,$A0,$EC,$20,$6B,$04,$4C,$71 ; C7C8 17 A0 EC 20 6B 04 4C 71  ... k.Lq
        .byte   $C4,$A9,$04,$48,$A9,$F1,$48,$8A ; C7D0 C4 A9 04 48 A9 F1 48 8A  ...H..H.
        .byte   $48,$98,$48,$20,$F2,$04,$4C,$06 ; C7D8 48 98 48 20 F2 04 4C 06  H.H ..L.
        .byte   $D3,$EA,$EA,$EA,$EA,$EA,$EA,$EA ; C7E0 D3 EA EA EA EA EA EA EA  ........
        .byte   $EA,$4C,$87,$04,$4C,$71,$04,$4C ; C7E8 EA 4C 87 04 4C 71 04 4C  .L..Lq.L
        .byte   $00,$00,$4C,$77,$04,$4C,$B3,$04 ; C7F0 00 00 4C 77 04 4C B3 04  ..Lw.L..
        .byte   $4C,$B4,$04,$84,$00,$00,$00,$00 ; C7F8 4C B4 04 84 00 00 00 00  L.......
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
        .byte   $4B,$45,$23,$32,$46,$35,$2C,$A3 ; C898 4B 45 23 32 46 35 2C A3  KE#2F5,.
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32 ; C8A0 20 20 44 4F 4B 45 23 32    DOKE#2
        .byte   $46,$35,$2C,$23,$34,$36,$37,$8D ; C8A8 46 35 2C 23 34 36 37 8D  F5,#467.
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C8B0 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$39,$2C,$A3 ; C8B8 4B 45 23 32 46 39 2C A3  KE#2F9,.
        .byte   $20,$44,$4F,$4B,$45,$23,$32,$46 ; C8C0 20 44 4F 4B 45 23 32 46   DOKE#2F
        .byte   $39,$2C,$23,$44,$30,$37,$30,$8D ; C8C8 39 2C 23 44 30 37 30 8D  9,#D070.
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F ; C8D0 20 20 20 20 20 20 44 4F        DO
        .byte   $4B,$45,$23,$32,$46,$43,$2C,$A3 ; C8D8 4B 45 23 32 46 43 2C A3  KE#2FC,.
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32 ; C8E0 20 20 44 4F 4B 45 23 32    DOKE#2
        .byte   $46,$43,$2C,$23,$34,$36,$31,$8D ; C8E8 46 43 2C 23 34 36 31 8D  FC,#461.
        .byte   $20,$20,$20,$20,$50,$41,$50,$45 ; C8F0 20 20 20 20 50 41 50 45      PAPE
        .byte   $52,$30,$3A,$49,$4E,$4B,$37,$8D ; C8F8 52 30 3A 49 4E 4B 37 8D  R0:INK7.
        .byte   $20,$20,$20,$20,$20,$20,$43,$41 ; C900 20 20 20 20 20 20 43 41        CA
        .byte   $4C,$4C,$23,$46,$38,$44,$30,$8D ; C908 4C 4C 23 46 38 44 30 8D  LL#F8D0.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C910 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$20,$20,$20,$20,$FE ; C918 20 20 20 20 20 20 20 FE         .
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58 ; C920 20 20 20 20 3F 48 45 58      ?HEX
        .byte   $24,$28,$50,$45,$45,$4B,$28,$A3 ; C928 24 28 50 45 45 4B 28 A3  $(PEEK(.
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58 ; C930 20 20 20 20 3F 48 45 58      ?HEX
        .byte   $24,$28,$44,$45,$45,$4B,$28,$A3 ; C938 24 28 44 45 45 4B 28 A3  $(DEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C940 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$50,$45,$45,$4B,$28,$A3 ; C948 20 20 50 45 45 4B 28 A3    PEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C950 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$44,$45,$45,$4B,$28,$A3 ; C958 20 20 44 45 45 4B 28 A3    DEEK(.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C960 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$50,$4F,$4B,$45,$A3 ; C968 20 20 20 50 4F 4B 45 A3     POKE.
        .byte   $20,$20,$20,$20,$20,$20,$20,$20 ; C970 20 20 20 20 20 20 20 20          
        .byte   $20,$20,$20,$44,$4F,$4B,$45,$A3 ; C978 20 20 20 44 4F 4B 45 A3     DOKE.
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
        .byte   "HANGE"                         ; CA01 48 41 4E 47 45           HANGE
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
        .byte   $DE,$C9,$00,$03,$EE,$C9,$03,$03 ; CBBB DE C9 00 03 EE C9 03 03  ........
        .byte   $FC,$C9,$06,$07,$23,$CA,$0D,$0B ; CBC3 FC C9 06 07 23 CA 0D 0B  ....#...
        .byte   $57,$CA,$18,$07,$76,$CA,$1F,$02 ; CBCB 57 CA 18 07 76 CA 1F 02  W...v...
        .byte   $CC,$CC,$21,$00,$80,$CA,$21,$01 ; CBD3 CC CC 21 00 80 CA 21 01  ..!...!.
        .byte   $84,$CA,$22,$03,$92,$CA,$25,$01 ; CBDB 84 CA 22 03 92 CA 25 01  .."...%.
        .byte   $96,$CA,$26,$07,$B9,$CA,$2D,$09 ; CBE3 96 CA 26 07 B9 CA 2D 09  ..&...-.
        .byte   $DE,$CA,$36,$03,$EC,$CA,$39,$01 ; CBEB DE CA 36 03 EC CA 39 01  ..6...9.
        .byte   $EF,$CA,$3A,$03,$F9,$CA,$3D,$05 ; CBF3 EF CA 3A 03 F9 CA 3D 05  ..:...=.
        .byte   $0D,$CB,$42,$02,$17,$CB,$44,$08 ; CBFB 0D CB 42 02 17 CB 44 08  ..B...D.
        .byte   $3E,$CB,$4C,$0D,$7A,$CB,$59,$04 ; CC03 3E CB 4C 0D 7A CB 59 04  >.L.z.Y.
        .byte   $8B,$CB,$5D,$04,$9E,$CB,$61,$02 ; CC0B 8B CB 5D 04 9E CB 61 02  ..]...a.
        .byte   $A8,$CB,$63,$02,$CC,$CC,$65,$00 ; CC13 A8 CB 63 02 CC CC 65 00  ..c...e.
        .byte   $CC,$CC,$65,$00,$CC,$CC,$65,$00 ; CC1B CC CC 65 00 CC CC 65 00  ..e...e.
        .byte   $B3,$CB,$65,$03                 ; CC23 B3 CB 65 03              ..e.
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
        .byte   "COMBAKCOM?????????BAK"         ; CCF7 43 4F 4D 42 41 4B 43 4F  COMBAKCO
                                                ; CCFF 4D 3F 3F 3F 3F 3F 3F 3F  M???????
                                                ; CD07 3F 3F 42 41 4B           ??BAK
; ----------------------------------------------------------------------------
; unknown
MISC1:  .byte   $28,$50,$35,$5D,$00,$00,$01,$01 ; CD0C 28 50 35 5D 00 00 01 01  (P5]....
        .byte   $FA,$BF,$23,$34,$36,$37,$FF,$7B ; CD14 FA BF 23 34 36 37 FF 7B  ..#467.{
        .byte   $0E,$FA,$35,$10,$81,$C9,$0F,$DA ; CD1C 0E FA 35 10 81 C9 0F DA  ..5.....
        .byte   $A2,$C6,$C9,$88,$02,$88,$02,$4F ; CD24 A2 C6 C9 88 02 88 02 4F  .......O
        .byte   $46,$46,$53,$45,$54,$C7,$81,$C2 ; CD2C 46 46 53 45 54 C7 81 C2  FFSET...
        .byte   $82,$45,$D3,$66,$A5,$C8,$A3,$8F ; CD34 82 45 D3 66 A5 C8 A3 8F  .E.f....
        .byte   $D2,$42,$B5,$98,$E0             ; CD3C D2 42 B5 98 E0           .B...
; QWERTY/AZERTY convertion
QWAZERTY_CONV:
        .byte   $B1,$BE,$AE,$AA,$82,$93,$AE,$AA ; CD41 B1 BE AE AA 82 93 AE AA  ........
        .byte   $B1,$BE,$93,$82                 ; CD49 B1 BE 93 82              ....
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
MISC2:  .byte   $41,$58,$59,$50,$B8,$0A,$64,$E8 ; CD83 41 58 59 50 B8 0A 64 E8  AXYP..d.
        .byte   $10,$00,$00,$03,$27             ; CD8B 10 00 00 03 27           ....'
LCD90:  .byte   $84,$A4,$C4,$E4                 ; CD90 84 A4 C4 E4              ....
; ----------------------------------------------------------------------------
; System variable names
SYS_VAR_NAMES:
        .byte   "ENELINOMSKFTEORARXRYRPEFSTEDEXC"; CD94 45 4E 45 4C 49 4E 4F 4D ENELINOM
                                                ; CD9C 53 4B 46 54 45 4F 52 41  SKFTEORA
                                                ; CDA4 52 58 52 59 52 50 45 46  RXRYRPEF
                                                ; CDAC 53 54 45 44 45 58 43     STEDEXC
        .byte   "XCYFPFSSCJKE"                  ; CDB3 58 43 59 46 50 46 53 53  XCYFPFSS
                                                ; CDBB 43 4A 4B 45              CJKE
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
        .byte   "AND PRESS 'RETURN"             ; CF7E 41 4E 44 20 50 52 45 53  AND PRES
                                                ; CF86 53 20 27 52 45 54 55 52  S 'RETUR
                                                ; CF8E 4E                       N
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
        bit     SEDORIC_IO_ERROR                ; CFE5 2C 17 C0                 ,..
        rts                                     ; CFE8 60                       `

; ----------------------------------------------------------------------------
XRWTS_INTERNAL:
        ldy     #$02                            ; CFE9 A0 02                    ..
; Entrée secondaire pour rebouclage
XRWTS_INTERNAL_LOOP:
        sty     SEDORIC_XRWTS_RERY              ; CFEB 8C 06 C0                 ...
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
        ldy     SEDORIC_RWBUF+1                 ; D019 AC 04 C0                 ...
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
LD0C4:  sty     SEDORIC_IO_ERROR                ; D0C4 8C 17 C0                 ...
        and     #$40                            ; D0C7 29 40                    )@
        bne     LD0DA                           ; D0C9 D0 0F                    ..
        tya                                     ; D0CB 98                       .
        and     #$10                            ; D0CC 29 10                    ).
        beq     LD0DD                           ; D0CE F0 0D                    ..
        dec     SEDORIC_XRWTS_RERY              ; D0D0 CE 06 C0                 ...
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
; Test de la piste sous la tête. Bug ? lda $20xx
SEDORIC_TEST_TRACK_UNDER_HEAD:
        txa                                     ; D0EA 8A                       .
        pha                                     ; D0EB 48                       H
        lda     SEDORIC_RWBUF                   ; D0EC AD 03 C0                 ...
        pha                                     ; D0EF 48                       H
        lda     SEDORIC_RWBUF+1                 ; D0F0 AD 04 C0                 ...
        pha                                     ; D0F3 48                       H
        lda     #$60                            ; D0F4 A9 60                    .`
        ldy     #$C0                            ; D0F6 A0 C0                    ..
        sta     SEDORIC_RWBUF                   ; D0F8 8D 03 C0                 ...
        sty     SEDORIC_RWBUF+1                 ; D0FB 8C 04 C0                 ...
        lda     SEDORIC_XRWTS_RERY              ; D0FE AD 06 C0                 ...
        ldx     #$C0                            ; D101 A2 C0                    ..
        ldy     #$01                            ; D103 A0 01                    ..
        jsr     XRWTS_INTERNAL_LOOP             ; D105 20 EB CF                  ..
        sta     SEDORIC_XRWTS_RERY              ; D108 8D 06 C0                 ...
        pla                                     ; D10B 68                       h
        sta     SEDORIC_RWBUF+1                 ; D10C 8D 04 C0                 ...
        pla                                     ; D10F 68                       h
        sta     SEDORIC_RWBUF                   ; D110 8D 03 C0                 ...
        bcs     LD11B                           ; D113 B0 06                    ..
        lda     MICRODISC_FDC_SECTOR            ; D115 AD 12 03                 ...
        sta     MICRODISC_FDC_TRACK             ; D118 8D 11 03                 ...
LD11B:  pla                                     ; D11B 68                       h
        tax                                     ; D11C AA                       .
        stx     SEDORIC_type_of_error           ; D11D 8E 05 C0                 ...
        rts                                     ; D120 60                       `

; ----------------------------------------------------------------------------
        lda     MICRODISC_CONTROL_SHADOW        ; D121 AD FB 04                 ...
        sta     MICRODISC_CONTROL               ; D124 8D 14 03                 ...
        lda     MICRODISC_FDC_COMMAND           ; D127 AD 10 03                 ...
        lsr     a                               ; D12A 4A                       J
        bcc     LD132                           ; D12B 90 05                    ..
        lda     #$D0                            ; D12D A9 D0                    ..
        sta     MICRODISC_FDC_COMMAND           ; D12F 8D 10 03                 ...
LD132:  sec                                     ; D132 38                       8
        jmp     NMIRAM                          ; D133 4C F8 04                 L..

; ----------------------------------------------------------------------------
        stx     $F3                             ; D136 86 F3                    ..
        ldx     #$04                            ; D138 A2 04                    ..
        jsr     LD36C                           ; D13A 20 6C D3                  l.
        sec                                     ; D13D 38                       8
        ldx     $F3                             ; D13E A6 F3                    ..
        lda     $F2                             ; D140 A5 F2                    ..
        sbc     #$02                            ; D142 E9 02                    ..
        bcs     LD147                           ; D144 B0 01                    ..
        dex                                     ; D146 CA                       .
LD147:  pha                                     ; D147 48                       H
        txa                                     ; D148 8A                       .
        jsr     XAFHEX                          ; D149 20 13 D6                  ..
        pla                                     ; D14C 68                       h
        jsr     XAFHEX                          ; D14D 20 13 D6                  ..
        cli                                     ; D150 58                       X
        ldx     #$FF                            ; D151 A2 FF                    ..
        txs                                     ; D153 9A                       .
        jsr     SEDORIC_XROM                    ; D154 20 D8 D5                  ..
        lda     $A0C4                           ; D157 AD C4 A0                 ...
        cpy     $60                             ; D15A C4 60                    .`
        jsr     SEDORIC_XROM                    ; D15C 20 D8 D5                  ..
        sed                                     ; D15F F8                       .
        .byte   $C3                             ; D160 C3                       .
        .byte   $F4                             ; D161 F4                       .
        .byte   $C3                             ; D162 C3                       .
        rts                                     ; D163 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D164 20 D8 D5                  ..
        pha                                     ; D167 48                       H
        cpy     $44                             ; D168 C4 44                    .D
        cpy     $60                             ; D16A C4 60                    .`
        ldx     #$4D                            ; D16C A2 4D                    .M
        bit     $A3A2                           ; D16E 2C A2 A3                 ,..
        jsr     SEDORIC_XROM                    ; D171 20 D8 D5                  ..
        sta     $C4                             ; D174 85 C4                    ..
        ror     $20C4,x                         ; D176 7E C4 20                 ~. 
        cld                                     ; D179 D8                       .
        cmp     $A3,x                           ; D17A D5 A3                    ..
        cpy     $96                             ; D17C C4 96                    ..
        cpy     $60                             ; D17E C4 60                    .`
        jsr     SEDORIC_XROM                    ; D180 20 D8 D5                  ..
        lda     $C4,x                           ; D183 B5 C4                    ..
        tay                                     ; D185 A8                       .
        cpy     $60                             ; D186 C4 60                    .`
        lda     $9A                             ; D188 A5 9A                    ..
        ldy     $9B                             ; D18A A4 9B                    ..
        jsr     SEDORIC_XROM                    ; D18C 20 D8 D5                  ..
        .byte   $73                             ; D18F 73                       s
        cmp     $63                             ; D190 C5 63                    .c
        cmp     $60                             ; D192 C5 60                    .`
        jsr     SEDORIC_XROM                    ; D194 20 D8 D5                  ..
        asl     a                               ; D197 0A                       .
        dec     $FA                             ; D198 C6 FA                    ..
        cmp     $60                             ; D19A C5 60                    .`
        jsr     SEDORIC_XROM                    ; D19C 20 D8 D5                  ..
        dec     $B3C6,x                         ; D19F DE C6 B3                 ...
        dec     $60                             ; D1A2 C6 60                    .`
        jsr     SEDORIC_XROM                    ; D1A4 20 D8 D5                  ..
        inc     $C3C6                           ; D1A7 EE C6 C3                 ...
        dec     $60                             ; D1AA C6 60                    .`
        jsr     SEDORIC_XROM                    ; D1AC 20 D8 D5                  ..
        adc     $C7                             ; D1AF 65 C7                    e.
        .byte   $3A                             ; D1B1 3A                       :
        .byte   $C7                             ; D1B2 C7                       .
        rts                                     ; D1B3 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D1B4 20 D8 D5                  ..
        sta     $6CC7,y                         ; D1B7 99 C7 6C                 ..l
        .byte   $C7                             ; D1BA C7                       .
        rts                                     ; D1BB 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D1BC 20 D8 D5                  ..
        rti                                     ; D1BF 40                       @

; ----------------------------------------------------------------------------
        iny                                     ; D1C0 C8                       .
        asl     $C8,x                           ; D1C1 16 C8                    ..
        rts                                     ; D1C3 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D1C4 20 D8 D5                  ..
        and     $2FC8,x                         ; D1C7 3D C8 2F                 =./
        iny                                     ; D1CA C8                       .
        rts                                     ; D1CB 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D1CC 20 D8 D5                  ..
        .byte   $1F                             ; D1CF 1F                       .
        cmp     #$52                            ; D1D0 C9 52                    .R
        cmp     #$60                            ; D1D2 C9 60                    .`
        jsr     SEDORIC_XROM                    ; D1D4 20 D8 D5                  ..
        sbc     ($C9),y                         ; D1D7 F1 C9                    ..
        .byte   $23                             ; D1D9 23                       #
        dex                                     ; D1DA CA                       .
        rts                                     ; D1DB 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D1DC 20 D8 D5                  ..
        .byte   $1C                             ; D1DF 1C                       .
        dex                                     ; D1E0 CA                       .
        lsr     $20CA                           ; D1E1 4E CA 20                 N. 
        cld                                     ; D1E4 D8                       .
        cmp     $0D,x                           ; D1E5 D5 0D                    ..
        dex                                     ; D1E7 CA                       .
        .byte   $3F                             ; D1E8 3F                       ?
        dex                                     ; D1E9 CA                       .
        rts                                     ; D1EA 60                       `

; ----------------------------------------------------------------------------
        jsr     SEDORIC_XROM                    ; D1EB 20 D8 D5                  ..
        eor     ($CA,x)                         ; D1EE 41 CA                    A.
        .byte   $73                             ; D1F0 73                       s
        dex                                     ; D1F1 CA                       .
        rts                                     ; D1F2 60                       `

; ----------------------------------------------------------------------------
        jsr     LD39E                           ; D1F3 20 9E D3                  ..
        jsr     SEDORIC_XROM                    ; D1F6 20 D8 D5                  ..
        tya                                     ; D1F9 98                       .
        dex                                     ; D1FA CA                       .
        .byte   $E2                             ; D1FB E2                       .
        dex                                     ; D1FC CA                       .
        rts                                     ; D1FD 60                       `

; ----------------------------------------------------------------------------
        .byte   $20                             ; D1FE 20                        
        cld                                     ; D1FF D8                       .
