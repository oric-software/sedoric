; da65 V2.15
; Created:    2017-04-28 22:14:56
; Input file: sedoric4_kern.bin
; Page:       1


        .setcpu "6502"

BASIC11_INTERPRETER_VECTOR:= $00F0
SEDORIC_FTYPE   := $00F9                        ; FTYPE: #08 si OPEN R (b3 à 1) et #10 si OPEN S (b4 à 1) (ce sont les types SEDORIC: les 'pseudo-fichiers' d'accès Disques n'en ont pas)
STACK           := $0100
BASIC11_KEYBOARD_MATRIX:= $0208                 ; For keyboard decoding
BASIC11_PATTERN_ARG:= $020C
BASIC11_LOWERCASE_UPPERCASE:= $0213
BASIC11_MEMORY_SIZE:= $0220
BASIC11_KEYBOARD_ZGET_VECTOR:= $023C            ; Vecteur Prendre un caractère au clavier (EB78 ATMOS et 045B SEDORIC)
BASIC11_IRQ_VECTOR:= $0245                      ; Vecteur IRQ (EE22 ATMOS et 0488 SEDORIC)
BASIC11_X       := $0248                        ; Vecteur NMI (F8B2 ATMOS et 04C4 SEDORIC)
BASIC11_CLOADING_SPEED:= $024D
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
BASIC11_HIMEM_MAX_ADRESS:= $02C1
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
EXERAM          := $04EC
EXEVEC          := $04EF
RAMROM          := $04F2
IRQRAM          := $04F5
NMIRAM          := $04F8
MICRODISC_CONTROL_SHADOW:= $04FB                ; Caches the control register as it's write-only
FLAGIF          := $04FC                        ; b7=1 if inside IF
SEDORIC_IDERROR := $04FD                        ; id of Error
NOLIGN          := $04FE                        ; Line of Error
L09A0           := $09A0
L2020           := $2020
L4142           := $4142
L414F           := $414F
L4154           := $4154
L4944           := $4944
L4C41           := $4C41
L4D45           := $4D45
L4F46           := $4F46
L4F4E           := $4F4E
L4F53           := $4F53
L5244           := $5244
L5246           := $5246
L574F           := $574F
L5B20           := $5B20
DRIVE           := $C000
PISTE           := $C001
SECTEUR         := $C002
RWBUF           := $C003
type_of_error   := $C005                        ; b5=0 write fault if b5=1 read fault
number_of_retry := $C007
DRVDEF          := $C009
DRVSYS          := $C00A
EXTER           := $C00D
EXTMS           := $C00F
EXTNB           := $C015
LC01D           := $C01D
ATMORI          := $C024
BUF1            := $C100                        ; buffer for descriptors
BUF2            := $C200                        ; buffer for bitmap
BUF3            := $C300                        ; buffer for directory sector
LF425           := $F425
LF473           := $F473
LF4A8           := $F4A8
LF5BA           := $F5BA
LF684           := $F684
LF85F           := $F85F
LF885           := $F885
LF8DE           := $F8DE
LF91F           := $F91F
LF956           := $F956
LF96B           := $F96B
LF98F           := $F98F
LF995           := $F995
LF99B           := $F99B
LF9BB           := $F9BB
LF9CA           := $F9CA
LFA4F           := $FA4F
LFABA           := $FABA
LFB8C           := $FB8C
LFBBE           := $FBBE
LFC72           := $FC72
LFC74           := $FC74
LFD0E           := $FD0E
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
SEDKERN_START:
        lda     number_of_retry
        lsr     a
LC404:  lda     #$00
        ror     a
        sta     ATMORI
        bpl     LC41B
        lda     #$50
        sta     BASIC11_NUMBER_OF_COLUMN_FOR_PRINTER
        lsr     a
        sta     $31
        sta     $32
        sta     BASIC11_NUMBER_OF_LINES_FOR_PRINTER
        bne     LC421
LC41B:  lda     #$5D
        sta     $31
        sta     $32
LC421:  inc     BASIC11_HIMEM_MAX_ADRESS
        inc     BASIC11_HIMEM_MAX_ADRESS+1
        ldx     #$00
LC429:  lda     page4_oric1,x
        bit     ATMORI
        bpl     LC434
        lda     page4_atmos,x
LC434:  sta     $0400,x
        inx
        bne     LC429
        lda     #$4C
        ldy     #$00
        ldx     #$04
        sta     $EF
        sty     BASIC11_INTERPRETER_VECTOR
        stx     BASIC11_INTERPRETER_VECTOR+1
        lda     #$88
        ldy     #$C4
        bit     ATMORI
        bpl     LC475
        sta     BASIC11_IRQ_VECTOR
        stx     BASIC11_IRQ_VECTOR+1
        sty     BASIC11_X
        stx     BASIC11_X+1
        lda     #$5B
        sta     BASIC11_KEYBOARD_ZGET_VECTOR
        stx     BASIC11_KEYBOARD_ZGET_VECTOR+1
        lda     #$09
        ldy     #$01
        sta     $024E
        sty     $024F
        lda     #$0F
        ldx     #$70
        ldy     #$D0
        bne     LC487
LC475:  sta     $0229
        stx     $022A
        sty     $022C
        stx     $022D
        lda     #$07
        ldx     #$E4
        ldy     #$CF
LC487:  sta     BASIC11_FLG
        stx     $02F9
        sty     $02FA
        ldx     #$04
        lda     #$A5
        ldy     #$D0
        sta     IRQ_VECTOR
        sty     $FFFF
        lda     #$67
        ldy     #$61
        sta     BASIC11_BANG_VECTOR
LC4A5           := * + 2
        stx     BASIC11_BANG_VECTOR+1
        sty     BASIC11_ESPERLUETTE_VECTOR
        stx     BASIC11_ESPERLUETTE_VECTOR+1
        lda     #$00
        sta     DRVDEF
        sta     DRVSYS
        sta     $C00B
        sta     $C00C
        sta     EXTNB
        sta     $C018
        sta     $02DF
        sta     $C048
        sta     $87
        lda     #$85
        ldy     #$D6
        sta     LC01D
        sty     $C01E
        lda     MICRODISC_FDC_TRACK
LC4D7           := * + 2
        sta     $C00C
        lda     #$23
        ldy     #$DE
        ldx     #$80
        sta     $C066
        sty     $C067
        stx     $C068
        sta     $C069
        sty     $C06A
        stx     $C06B
        sta     $C06C
        sty     $C06D
        stx     $C06E
        sta     $C06F
        sty     $C070
        stx     $C071
        lda     #$2E
        sta     $C075
        lda     #$1A
        ldy     #$00
        sta     EXEVEC+1
        sty     EXEVEC+2
        lda     $00
        beq     LC527
        ldx     #$FF
LC517:  inx
        lda     MSG_DOS_ALTERED,x
        sta     $B900,x
        bne     LC517
        lda     #$00
        ldy     #$B9
        jsr     EXERAM
LC527:  lda     #$14
        ldy     #$01
        jsr     LDA5D
        ldx     #$08
LC530:  lda     BUF1,x
        sta     $C039,x
        cpx     #$05
        bcc     LC53D
        sta     $C03D,x
LC53D:  dex
        bpl     LC530
        jsr     LEBA3
        jsr     XROM
        cpx     #$F7
        asl     $F8,x
        ldx     #$41
LC54C:  lda     $C11E,x
        sta     $36,x
        dex
        bpl     LC54C
        lda     #$3A
        sta     $35
        jsr     LD206
        lda     #$BD
        ldy     #$C4
        bit     ATMORI
        bmi     LC566
        lda     #$CD
LC566:  sta     EXEVEC+1
        sty     EXEVEC+2
        ldx     #$34
        ldy     #$00
        cli
        jmp     L0471

MSG_DOS_ALTERED:
        .byte   $0A,$8C,$81
        .byte   "** "
LC57A:  .byte   "WARNING **"

        .byte   $88,$87
        .byte   "DOS"
LC589:  .byte   " is altered !"

        .byte   $0D,$0A,$00
        .byte   "L"
        .byte   $64
        .byte   $D3
        rts

        lda     LC5AE
        ldx     LC5AF
        sta     PISTE
        stx     SECTEUR
        lda     LC5B0
        bne     LC589
LC5AE:  .byte   $27
LC5AF:  .byte   $09
LC5B0:  .byte   $1A
        eor     #$4E
        jsr     L5244
        eor     #$56
        eor     $A0
        jmp     L414F

        .byte   $44
        jsr     L4944
        .byte   $53
        .byte   $43
        .byte   $53
        jsr     L4F46
        .byte   $52
        jsr     L4142
        .byte   $43
        .byte   $4B
        eor     $50,x
        jsr     L5246
        .byte   $4F
        eor     $20A0
        .byte   $54
        .byte   $4F
        ldy     #$0D
        asl     a
        jmp     L414F

        .byte   $44
        jsr     L4F53
        eor     $52,x
        .byte   $43
        eor     $20
        .byte   $44
        eor     #$53
        .byte   $43
        ldy     #$0D
        asl     a
        jmp     L414F

        .byte   $44
        jsr     L4154
        .byte   $52
        .byte   $47
        eor     $54
        jsr     L4944
        .byte   $53
        eor     ($2D,x)
        .byte   $2B
; Page4, ORIC-1
page4_oric1:
        .byte   $C9,$30,$90,$04,$C9,$3A,$90,$35
        .byte   $86,$0F,$AA,$30,$2E,$85,$C1,$68
        .byte   $AA,$68,$48,$E0,$F7,$D0,$04,$C9
        .byte   $C8,$F0,$09,$E0,$58,$D0,$18,$C9
        .byte   $CA,$D0,$14,$24,$18,$6E,$FC,$04
        .byte   $A0,$FF,$C8,$B1,$E9,$F0,$11,$C9
        .byte   $3A,$F0,$0D,$C9,$D4,$D0,$F3,$8A
        .byte   $48,$A5,$C1,$A6,$0F,$4C,$41,$EA
        .byte   $68,$20,$E9,$04
LC644:  .byte   $20,$67,$04,$0E,$FC,$04,$B0,$03
        .byte   $4C,$AD,$C8,$EA,$EA,$EA,$60,$20
        .byte   $77,$04,$B1,$16,$4C,$77,$04,$EA
        .byte   $EA,$EA,$EA,$EA,$EA,$A9,$8E,$A0
        .byte   $F8,$D0,$04,$A9,$AE,$A0,$D3,$8D
        .byte   $F0,$04,$8C,$F1,$04,$20,$77,$04
        .byte   $20,$EF,$04,$08,$48,$78,$AD,$FB
        .byte   $04,$49,$02,$8D,$FB,$04,$8D,$14
        .byte   $03,$68,$28,$60,$2C,$0D,$03,$50
        .byte   $0F,$48,$A9,$04,$2D,$6A,$02,$F0
        .byte   $03,$EE,$74,$02,$68,$4C,$03,$EC
        .byte   $68,$68,$85,$F2,$68,$AA,$A9,$36
        .byte   $A0,$D1,$D0,$C3,$20,$F2,$04,$68
        .byte   $40,$8D,$14,$03,$6C,$FC,$FF,$18
        .byte   $20,$77,$04,$48,$A9,$04,$48,$A9
        .byte   $A8,$48,$08,$B0,$03,$4C,$28,$02
        .byte   $20,$88,$F8,$A9,$17,$A0,$EC,$20
        .byte   $6B,$04,$4C,$75,$C4,$A9,$04,$48
        .byte   $A9,$F1,$48,$8A,$48,$98,$48,$20
        .byte   $F2,$04,$4C,$70,$D2,$EA,$EA,$EA
        .byte   $EA,$EA,$EA,$EA,$EA,$4C,$87,$04
        .byte   $4C,$71,$04,$4C,$00,$00,$4C,$77
        .byte   $04,$4C,$B3,$04,$4C,$B4,$04,$84
        .byte   $00,$00,$00,$00
; Page4, Atmos
page4_atmos:
        .byte   $C9,$30,$90,$04,$C9,$3A,$90,$35
        .byte   $86,$0F,$AA,$30,$2E,$85,$C1,$68
        .byte   $AA,$68,$48,$E0,$0E,$D0,$04,$C9
        .byte   $C9,$F0,$09,$E0,$8A,$D0,$18,$C9
        .byte   $CA,$D0,$14,$24,$18,$6E,$FC,$04
        .byte   $A0,$FF,$C8,$B1,$E9,$F0,$11,$C9
        .byte   $3A,$F0,$0D,$C9,$D4,$D0,$F3,$8A
        .byte   $48,$A5,$C1,$A6,$0F,$4C,$B9,$EC
        .byte   $68,$20,$E9,$04,$20,$67,$04,$0E
        .byte   $FC,$04,$B0,$03,$4C,$C1,$C8,$6E
        .byte   $52,$02,$60,$20,$77,$04,$B1,$16
        .byte   $4C,$77,$04,$A9,$45,$A0,$D8,$D0
        .byte   $0A,$A9,$8E,$A0,$F8,$D0,$04,$A9
        .byte   $AE,$A0,$D3,$8D,$F0,$04,$8C,$F1
        .byte   $04,$20,$77,$04,$20,$EF,$04,$08
        .byte   $48,$78,$AD,$FB,$04,$49,$02,$8D
        .byte   $FB,$04,$8D,$14,$03,$68,$28,$60
        .byte   $2C,$0D,$03,$50,$0F,$48,$A9,$04
        .byte   $2D,$6A,$02,$F0,$03,$EE,$74,$02
        .byte   $68,$4C,$22,$EE,$68,$68,$85,$F2
        .byte   $68,$AA,$A9,$36,$A0,$D1,$D0,$C3
        .byte   $20,$F2,$04,$68,$40,$8D,$14,$03
        .byte   $6C,$FC,$FF,$18,$20,$77,$04,$48
        .byte   $A9,$04,$48,$A9,$A8,$48,$08,$B0
        .byte   $03,$4C,$44,$02,$20,$B8,$F8,$A9
        .byte   $17,$A0,$EC,$20,$6B,$04,$4C,$71
        .byte   $C4,$A9,$04,$48,$A9,$F1,$48,$8A
        .byte   $48,$98,$48,$20,$F2,$04,$4C,$06
        .byte   $D3,$EA,$EA,$EA,$EA,$EA,$EA,$EA
        .byte   $EA,$4C,$87,$04,$4C,$71,$04,$4C
        .byte   $00,$00,$4C,$77,$04,$4C,$B3,$04
        .byte   $4C,$B4,$04,$84,$00,$00,$00,$00
; Key shortcut table
KEYDEF: .byte   $07,$45,$57,$4B,$00,$18,$07,$08
        .byte   $59,$7B,$06,$09,$00,$42,$41,$51
        .byte   $05,$67,$24,$00,$00,$5B,$27,$00
        .byte   $1B,$3F,$04,$0A,$00,$5F,$3D,$0D
        .byte   $00,$00,$00,$00,$00,$00,$00,$00
        .byte   $01,$00,$08,$00,$00,$00,$21,$FF
        .byte   $6D,$63,$02,$0C,$00,$0F,$72,$00
        .byte   $03,$32,$29,$00,$00,$0E,$1E,$0B
        .byte   $17,$B2,$A8,$F1,$00,$8C,$A6,$18
        .byte   $90,$C9,$16,$19,$00,$92,$A2,$BC
        .byte   $15,$9C,$CA,$00,$00,$D2,$9B,$10
        .byte   $EB,$8D,$14,$1A,$00,$87,$C8,$1D
        .byte   $00,$00,$00,$00,$00,$00,$00,$00
        .byte   $11,$00,$A5,$00,$00,$00,$D1,$FF
        .byte   $A4,$9A,$12,$1C,$00,$1F,$CB,$00
        .byte   $13,$91,$ED,$00,$00,$1E,$B5,$1B
; Key shortcut table
REDEF:  .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$20,$20,$20,$20,$20,$A0
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F
        .byte   $4B,$45,$23,$32,$46,$35,$2C,$A3
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32
        .byte   $46,$35,$2C,$23,$34,$36,$37,$8D
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F
        .byte   $4B,$45,$23,$32,$46,$39,$2C,$A3
        .byte   $20,$44,$4F,$4B,$45,$23,$32,$46
        .byte   $39,$2C,$23,$44,$30,$37,$30,$8D
        .byte   $20,$20,$20,$20,$20,$20,$44,$4F
        .byte   $4B,$45,$23,$32,$46,$43,$2C,$A3
        .byte   $20,$20,$44,$4F,$4B,$45,$23,$32
        .byte   $46,$43,$2C,$23,$34,$36,$31,$8D
        .byte   $20,$20,$20,$20,$50,$41,$50,$45
        .byte   $52,$30,$3A,$49,$4E,$4B,$37,$8D
        .byte   $20,$20,$20,$20,$20,$20,$43,$41
        .byte   $4C,$4C,$23,$46,$38,$44,$30,$8D
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$20,$20,$20,$20,$20,$FE
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58
        .byte   $24,$28,$50,$45,$45,$4B,$28,$A3
        .byte   $20,$20,$20,$20,$3F,$48,$45,$58
        .byte   $24,$28,$44,$45,$45,$4B,$28,$A3
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$50,$45,$45,$4B,$28,$A3
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$44,$45,$45,$4B,$28,$A3
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$20,$50,$4F,$4B,$45,$A3
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$20,$44,$4F,$4B,$45,$A3
; Key shortcut table
PREDEF: .byte   $48,$45,$58,$24,$A8,$43,$41,$4C
        .byte   $4C,$A3,$54,$45,$58,$54,$8D,$46
        .byte   $4F,$52,$49,$3D,$31,$54,$CF,$4C
        .byte   $45,$46,$54,$24,$A8,$4D,$49,$44
        .byte   $24,$A8,$52,$49,$47,$48,$54,$24
        .byte   $A8,$53,$54,$52,$24,$A8,$55,$4E
        .byte   $50,$52,$4F,$54,$8D,$E0,$55,$53
        .byte   $49,$4E,$C7,$56,$49,$53,$55,$48
        .byte   $49,$52,$45,$53,$A2,$56,$55,$53
        .byte   $45,$52,$8D,$57,$49,$44,$54,$C8
        .byte   $57,$49,$4E,$44,$4F,$D7,$21,$52
        .byte   $45,$53,$54,$4F,$52,$C5
; SEDORIC token table
TOKEN_TABLE:
        .byte   "PP"
        .byte   $80,$00
        .byte   "ZERTY"
        .byte   $00
        .byte   "CCENT"
        .byte   $00
        .byte   "OX"
        .byte   $00
        .byte   "ACKUP"
        .byte   $00
        .byte   "UILD"
        .byte   $00
        .byte   "HDIR"
        .byte   $00
        .byte   "HAN"
LCA04:  .byte   "GE"
        .byte   $00
        .byte   "LOSE"
        .byte   $00
        .byte   "OPY"
        .byte   $00
        .byte   "REATEW"
        .byte   $00
        .byte   "RESEC"
        .byte   $00
        .byte   "HKSUM"
        .byte   $00
        .byte   "ELDIR"
        .byte   $00
        .byte   "E"
        .byte   $96
        .byte   "E"
        .byte   $00
        .byte   "ESTROY"
        .byte   $00
        .byte   "ELBAK"
        .byte   $00
        .byte   "EL"
        .byte   $00
        .byte   "IR"
        .byte   $00
        .byte   "NUM"
        .byte   $00
        .byte   "NAME"
        .byte   $00
        .byte   "KEY"
        .byte   $00
        .byte   "SYS"
        .byte   $00
        .byte   "TRACK"
        .byte   $00
        .byte   "RR"
        .byte   $97,$00
        .byte   "RRGOTO"
        .byte   $00
        .byte   "RROR"
        .byte   $00
        .byte   "RR"
        .byte   $D2,$00
        .byte   "RR"
        .byte   $00
        .byte   "SAVE"
        .byte   $00
        .byte   "XT"
        .byte   $00
        .byte   "IELD"
        .byte   $00
        .byte   "RSEC"
        .byte   $00
        .byte   "CUR"
        .byte   $00
        .byte   "NIT"
        .byte   $00
        .byte   "NSTR"
        .byte   $00
        .byte   "NIST"
        .byte   $00
        .byte   "UMP"
        .byte   $00
        .byte   "EY"
        .byte   $99,$00
        .byte   "EYIF"
        .byte   $00
        .byte   "EYUSE"
        .byte   $00
        .byte   "EYDEF"
        .byte   $00
        .byte   "EY"
        .byte   $B8,$00
        .byte   "EYSAVE"
        .byte   $00
        .byte   "EY"
        .byte   $00
        .byte   "INE"
        .byte   $00
        .byte   "SET"
        .byte   $00
        .byte   "USING"
        .byte   $00
        .byte   "U"
        .byte   $E3
        .byte   "G"
        .byte   $00,$92,$00
        .byte   "OAD"
        .byte   $00
        .byte   "DIR"
        .byte   $00
        .byte   "TYPE"
        .byte   $00
        .byte   "CUR"
        .byte   $00
        .byte   "KDIR"
        .byte   $00
        .byte   "OVE"
        .byte   $00
        .byte   "ERGE"
        .byte   $00
        .byte   "UM"
        .byte   $00
        .byte   "UT"
        .byte   $00
        .byte   "LD"
        .byte   $00
        .byte   "PEN"
        .byte   $00
        .byte   "ATHDIR"
        .byte   $00
        .byte   "UT"
        .byte   $00
        .byte   "ROT"
        .byte   $00
        .byte   "R"
        .byte   $00
        .byte   "MAP"
        .byte   $00
        .byte   "UIT"
        .byte   $00
        .byte   "WERTY"
        .byte   $00
        .byte   "ESUME"
        .byte   $00
        .byte   "SET"
        .byte   $00
        .byte   "EWIND"
        .byte   $00
        .byte   "ENUM"
        .byte   $00
        .byte   "EN"
        .byte   $00,$D1
        .byte   "OM"
        .byte   $00
        .byte   "ANDOM"
        .byte   $00
        .byte   "ESET"
        .byte   $00
        .byte   "WAP"
        .byte   $00
        .byte   "EEK"
        .byte   $00
        .byte   "TRUN"
        .byte   $00
        .byte   "T"
        .byte   $98,$00
        .byte   "YSTEM"
        .byte   $00
        .byte   "TATUS"
        .byte   $00
        .byte   "AVEU"
        .byte   $00
        .byte   "AVEM"
        .byte   $00
        .byte   "AVEO"
        .byte   $00
        .byte   "AVE"
        .byte   $00
        .byte   "EARCH"
        .byte   $00
        .byte   "YS"
        .byte   $00
        .byte   "MAP"
        .byte   $00
        .byte   "KEN"
        .byte   $00
        .byte   "AKE"
        .byte   $00
        .byte   "YPE"
        .byte   $00
        .byte   "RACK"
        .byte   $00
        .byte   "SER"
        .byte   $00
        .byte   "NTKEN"
        .byte   $00,$E3
        .byte   "G"
        .byte   $00
        .byte   "NPROT"
        .byte   $00
        .byte   "ISU"
        .byte   $A2,$00
        .byte   "USER"
        .byte   $00
        .byte   "IDTH"
        .byte   $00
        .byte   "INDOW"
        .byte   $00,$9A,$00
        .byte   "]"
        .byte   $00,$FF,$00,$00,$00
; SEDORIC token initials table
TOKEN_INITIALS_TABLE:
        .byte   $DE
LCBBC:  .byte   $C9
LCBBD:  .byte   $00,$03,$EE,$C9,$03,$03,$FC,$C9
        .byte   $06,$07,$23,$CA,$0D,$0B,$57,$CA
        .byte   $18,$07,$76,$CA,$1F,$02,$CC,$CC
        .byte   $21,$00,$80,$CA,$21,$01,$84,$CA
        .byte   $22,$03,$92,$CA,$25,$01,$96,$CA
        .byte   $26,$07,$B9,$CA,$2D,$09,$DE,$CA
        .byte   $36,$03,$EC,$CA,$39,$01,$EF,$CA
        .byte   $3A,$03,$F9,$CA,$3D,$05,$0D,$CB
        .byte   $42,$02,$17,$CB,$44,$08,$3E,$CB
        .byte   $4C,$0D,$7A,$CB,$59,$04,$8B,$CB
        .byte   $5D,$04,$9E,$CB,$61,$02,$A8,$CB
        .byte   $63,$02,$CC,$CC,$65,$00,$CC,$CC
        .byte   $65,$00,$CC,$CC,$65,$00,$B3,$CB
        .byte   $65,$03
; SEDORIC token address table
TOKEN_ADDR_TABLE:
        .addr   LFE06
        .addr   LEBDD
        .addr   LEB90
        .addr   LF0DD
        .addr   LF150
        .addr   LFEDF
        .addr   LE772
        .addr   LF147
        .addr   LFB8C
        .addr   LF156
        .addr   LDE4C
        .addr   LF9BB
        .addr   LE9FE
        .addr   LE775
        .addr   LF141
        .addr   LE443
        .addr   LE436
        .addr   LE445
        .addr   LE343
        .addr   LF129
        .addr   LF144
        .addr   LF123
        .addr   LF126
        .addr   LF138
        .addr   LE998
        .addr   LE998
        .addr   LE9AF
        .addr   LE9AF
        .addr   LE97E
        .addr   LDDDF
        .addr   LE9EC
        .addr   LFBBE
        .addr   LF99B
        .addr   LEBF4
        .addr   LF168
        .addr   LEC2D
        .addr   LF12C
        .addr   LFE11
        .addr   LDA1F
        .addr   LDA1F
        .addr   LE73F
        .addr   LE742
        .addr   LE742
        .addr   LDDCC
        .addr   LE70A
        .addr   LF078
        .addr   LFC72
        .addr   LF035
        .addr   LF035
        .addr   LEC93
        .addr   LDFF6
        .addr   LE74E
        .addr   LFE94
        .addr   LEBEB
        .addr   LE76F
        .addr   LF135
        .addr   LF13B
        .addr   LE748
        .addr   LE71E
        .addr   LE0AE
        .addr   LFA4F
        .addr   LE778
        .addr   LF9CA
        .addr   LE9F5
        .addr   LE7BF
        .addr   LF98F
        .addr   LE7F4
        .addr   LEBE0
        .addr   LE9BA
        .addr   LFC74
        .addr   LFABA
        .addr   LF14D
        .addr   LE74B
        .addr   LE795
        .addr   LE795
        .addr   LE7B7
        .addr   LEA3A
        .addr   LF153
        .addr   LE852
        .addr   LE852
        .addr   LE9FB
        .addr   LE9F2
        .addr   LDD4C
        .addr   LDD49
        .addr   LDD52
        .addr   LDD4F
        .addr   LE5FB
        .addr   LF159
        .addr   LF995
        .addr   LE89C
        .addr   LF8DE
        .addr   LFE97
        .addr   LF12F
        .addr   LEA7E
        .addr   LE8E0
        .addr   LEE98
        .addr   LE9F8
        .addr   LE9EF
        .addr   LF120
        .addr   LE745
        .addr   LF20F
        .addr   LE7D8
        .addr   LEC03
        .addr   LE83D
; common names and extentions
COMMON_EXT_TABLE:
        .byte   "COM"
LCCFA:  .byte   "BAKCOM?????????BAK"


; unknown
MISC1:  .byte   $28,$50,$35,$5D
LCD10:  .byte   $00,$00,$01,$01,$FA,$BF,$23,$34
        .byte   $36,$37,$FF,$7B,$0E,$FA,$35,$10
        .byte   $81,$C9,$0F,$DA,$A2,$C6,$C9,$88
        .byte   $02,$88,$02
LCD2B:  .byte   $4F,$46,$46,$53,$45,$54,$C7,$81
        .byte   $C2,$82,$45,$D3,$66,$A5,$C8,$A3
        .byte   $8F,$D2,$42,$B5,$98,$E0
; QWERTY/AZERTY convertion
QWAZERTY_CONV:
        .byte   $B1,$BE,$AE,$AA,$82,$93
LCD47:  .byte   $AE,$AA,$B1,$BE,$93,$82
; Accented characters
ACCENTED_FONT:
        .byte   $40,$10,$08,$1C,$02,$1E,$22,$1E
        .byte   $00,$5C,$00,$00,$1E,$20,$20,$20
        .byte   $1E,$04,$7B,$04,$08,$1C,$22,$3E
        .byte   $20,$1E,$00,$7C,$10,$08,$22,$22
        .byte   $22,$26,$1A,$00,$7D,$10,$08,$1C
        .byte   $22,$3E,$20,$1E,$00,$7E,$1C,$22
        .byte   $1C,$22,$3E,$20,$1E,$00
; unknown
MISC2:  .byte   $41,$58,$59,$50,$B8
LCD88:  .byte   $0A,$64,$E8,$10
LCD8C:  .byte   $00,$00,$03,$27
LCD90:  .byte   $84,$A4,$C4,$E4
; System variable names
SYS_VAR_NAMES:
        .byte   "E"
LCD95:  .byte   "NELINOMSKFTEORARXRYRPEFSTEDEXCX"



        .byte   "CYFPFS"
LCDBA:  .byte   "SCJKE"
; Error message strings
ERROR_MESSAGES:
        .byte   "FILE NOT FOUN"

        .byte   $C4
        .byte   "DRIVE NOT IN LIN"

        .byte   $C5
        .byte   "INVALID FILE NAM"

        .byte   $C5
        .byte   "DISK I/"
        .byte   $CF
        .byte   "WRITE PROTECTE"

        .byte   $C4
        .byte   "WILDCARD(S) NOT ALLOWE"


        .byte   $C4
        .byte   "FILE ALREADY EXIST"


        .byte   $D3
        .byte   "DISK FUL"
        .byte   $CC
        .byte   "ILLEGAL QUANTIT"

        .byte   $D9
        .byte   "SYNTA"
        .byte   $D8
        .byte   "UNKNOWN FORMA"

        .byte   $D4,$D4
        .byte   "TYPE MISMATC"

        .byte   $C8
        .byte   "FILE TYPE MISMATC"


        .byte   $C8
        .byte   "FILE NOT OPE"

        .byte   $CE
        .byte   "FILE ALREADY OPE"

        .byte   $CE
        .byte   "END OF FIL"

        .byte   $C5
        .byte   "BAD RECORD NUMBE"

        .byte   $D2
        .byte   "FIELD OVERFLO"

        .byte   $D7
        .byte   "STRING TOO LON"

        .byte   $C7
        .byte   "UNKNOWN FIELD NAM"


        .byte   $C5,$C5
; Message strings
MESSAGES:
        .byte   $0A,$0D
        .byte   "TRACK"
        .byte   $BA
        .byte   " SECTOR"
        .byte   $BA
        .byte   " WRITE FAULT"

        .byte   $A0
        .byte   " READ FAULT"

        .byte   $A0,$0A,$0D
        .byte   " BREAK ON BYTE "

        .byte   $A3,$0D,$0A
        .byte   "Drive"
        .byte   $A0
        .byte   " V4 (Mst)"

        .byte   $A0
        .byte   " free sectors "

        .byte   $A8
        .byte   " Files"
        .byte   $A0
        .byte   " IS PROTECTE"

        .byte   $C4
        .byte   " (Y)es or (N)o"

        .byte   $BA
        .byte   " DELETED"
        .byte   $0D,$8A
        .byte   "INSERT MASTER"

        .byte   $A0
        .byte   "AND PRESS 'RETURN"


        .byte   $A7
        .byte   " ALREADY EXISTS"

        .byte   $0A,$8D
        .byte   " -->"
        .byte   $A0
        .byte   "USER"
        .byte   $A0
        .byte   " V4 (Slv)"

        .byte   $A0
        .byte   " (Type"
        .byte   $BD
        .byte   ")"
        .byte   $A0
        .byte   " DISC IN DRIVE"

        .byte   $A0
XRWTS:  php
        lda     V1ER
        pha
        tya
        pha
        lda     #$40
        sta     V1ER
        jsr     XRWTS_INTERNAL
        pla
        tay
        pla
        sta     V1ER
        plp
        lda     #$FF
        bit     $C017
        rts

XRWTS_INTERNAL:
        ldy     #$02
        sty     $C006
        ldy     #$08
        sty     number_of_retry
XRWTS_ONCE:
        pha
        stx     type_of_error
LCFF7:  ldy     DRIVE
        lda     LCD90,y
        bit     PISTE
        bpl     LD004
        ora     #$10
LD004:  sta     MICRODISC_CONTROL_SHADOW
        cpy     $C00B
        beq     LD016
        sty     $C00B
        jsr     LD0EA
        bcc     LD016
        pla
        rts

LD016:  lda     RWBUF
        ldy     $C004
        sta     $F3
        sty     $F4
        sei
        lda     #$20
        bit     type_of_error
        bpl     LD051
        bvc     LD02C
        beq     LD051
LD02C:  lda     PISTE
        cmp     $C00C
        beq     LD03A
        pha
        txa
        ora     #$04
        tax
        pla
LD03A:  and     #$7F
        cmp     MICRODISC_FDC_TRACK
        beq     LD051
        txa
        ldx     #$18
        jsr     XRWTS_ONCE
        sta     type_of_error
        tax
        lda     MICRODISC_FDC_DATA
        sta     MICRODISC_FDC_TRACK
LD051:  lda     PISTE
        sta     $C00C
        and     #$7F
        sta     MICRODISC_FDC_DATA
        lda     SECTEUR
        sta     MICRODISC_FDC_SECTOR
        ldy     #$00
        txa
        bmi     LD06A
LD067:  dey
        bne     LD067
LD06A:  lda     MICRODISC_CONTROL_SHADOW
        ora     #$01
        sta     MICRODISC_CONTROL
        stx     MICRODISC_FDC_COMMAND
        txa
        and     #$F0
        cmp     #$E0
        cli
        beq     LD081
        and     #$20
        bne     LD093
LD081:  lda     MICRODISC_DRQ
        bmi     LD081
        lda     MICRODISC_FDC_DATA
        sta     ($F3),y
        iny
        bne     LD081
        inc     $F4
        jmp     LD081

LD093:  lda     MICRODISC_DRQ
        bmi     LD093
        lda     ($F3),y
        sta     MICRODISC_FDC_DATA
        iny
        bne     LD093
        inc     $F4
        jmp     LD093

        bit     MICRODISC_CONTROL
        bpl     LD0AD
        jmp     IRQRAM

LD0AD:  pla
        pla
        pla
        lda     MICRODISC_CONTROL_SHADOW
        sta     MICRODISC_CONTROL
        clc
        lda     MICRODISC_FDC_COMMAND
        and     #$5C
        tay
        ldx     type_of_error
        bmi     LD0C4
        ldy     #$00
LD0C4:  sty     $C017
        and     #$40
        .byte   $D0
LD0CA:  .byte   $0F
        tya
        and     #$10
        beq     LD0DD
        dec     $C006
        beq     LD0DA
        jsr     LD0EA
        bcc     LD0E7
LD0DA:  sec
LD0DB:  pla
        rts

LD0DD:  tya
        and     #$0C
        beq     LD0DB
        dec     number_of_retry
        beq     LD0DA
LD0E7:  jmp     LCFF7

LD0EA:  txa
        pha
        lda     RWBUF
        pha
        lda     $C004
        pha
        lda     #$60
        ldy     #$C0
        sta     RWBUF
        sty     $C004
        lda     $2006
        .byte   $3B
        dec     $C0A9,x
        sta     $C04D
        jsr     LD79E
        sec
        lda     $C054
        sbc     $C052
        sta     $C04F
        lda     $C055
        sbc     $C053
        sta     $C050
        bcs     LD19C
        ldx     #$08
        bit     $09A2
        jmp     LD67E

        sta     $C04D
        lda     $9A
        ldy     $9B
        sta     $C052
        sty     $C053
        lda     $9C
        ldy     $9D
        ldx     #$80
        sta     $C054
        sty     $C055
        stx     $C051
        lda     #$00
        sta     $C056
        sta     $C057
LD14C:  rts

        jsr     LD44F
        jsr     LDFDE
LD153:  jsr     LD302
        bpl     LD153
        cmp     #$03
        beq     LD14C
        cmp     #$13
        bne     LD17C
        jsr     XCUROFF
        lda     #$D0
        ldy     #$BB
        sta     $C052
        sty     $C053
        lda     #$B7
LD16F:  ldy     #$BF
        ldx     #$60
        jsr     LDE00
        .byte   $20
        .byte   $3E
LD178:  .byte   $D7
        jmp     LDE53

LD17C:  cmp     #$17
        bne     LD18E
LD180:  ldy     BASIC11_Y_TEXT
        lda     #$7F
        nop
        nop
        nop
LD188:  sta     ($12),y
        lda     #$09
        bne     LD197
LD18E:  cmp     #$0D
        bne     LD197
        .byte   $20
        rol     a
LD194:  dec     $A9,x
        asl     a
LD197:  jsr     XAFCAR
        bne     LD153
LD19C:  sei
        jsr     LDB2D
        beq     LD211
        lda     $C04D
        beq     LD1BD
        cmp     #$80
        beq     LD1B8
        .byte   $C9
LD1AC:  cpy     #$F0
        asl     $20,x
        .byte   $07
        .byte   $DB
        jmp     LDF1B

LD1B5:  ldx     #$02
        .byte   $2C
LD1B8:  ldx     #$06
        .byte   $4C
        .byte   $7E
LD1BC:  .byte   $D6
LD1BD:  jsr     LE264
        bcs     LD1EF
        .byte   $4C
        .byte   $11
LD1C4:  .byte   $DF
LD1C5:  ldy     #$02
LD1C7:  lda     $C032,y
        pha
        dey
LD1CC:  bpl     LD1C7
        ldy     #$02
LD1D0:  lda     $C032,y
        cmp     LCCFA,y
        bne     LD1DD
        dey
        bpl     LD1D0
        .byte   $30
LD1DC:  cld
LD1DD:  ldx     #$03
        jsr     LD34A
        .byte   $20
LD1E3:  bmi     $D1C0
        beq     LD1F1
        jsr     LE264
        .byte   $90
LD1EB:  ora     $68
        pla
        pla
LD1EF:  cli
        rts

LD1F1:  ldy     #$00
LD1F3:  pla
        sta     $C032,y
        iny
        cpy     #$03
        bne     LD1F3
        jsr     XTVNM
        ldx     $C027
LD202:  lda     LCCFA,y
        .byte   $9D
LD206:  ora     #$C3
        inx
        iny
        cpy     #$03
        bne     LD202
LD20E:  jsr     XSCAT
LD211:  ldx     #$03
        lda     #$00
LD215:  .byte   $9D
LD216:  and     $C0,x
        dex
LD219:  bpl     LD215
LD21B:  ldx     $C050
        ldy     #$00
        inx
        txa
        bne     LD225
LD224:  iny
LD225:  jsr     XWDESC
        lda     $C052
        .byte   $AC
LD22C:  .byte   $53
        .byte   $C0
LD22E:  dey
        sta     RWBUF
        sty     $C004
        ldy     #$0A
LD237:  .byte   $EE
LD238:  .byte   $04
        cpy     #$AD
        bvc     $D1FD
        beq     LD256
        dec     $C050
        .byte   $20
        plp
LD244:  .byte   $E2
        lda     BUF1,y
        sta     PISTE
        .byte   $B9
LD24C:  ora     ($C1,x)
        sta     SECTEUR
        jsr     XSVSEC
LD254:  beq     LD237
LD256:  jsr     LE228
        lda     BUF1,y
LD25C:  pha
        lda     $C101,y
        pha
        jsr     LDACE
LD264:  lda     RWBUF
        ldy     $C004
        sta     $F2
        sty     $F3
        ldy     #$FF
LD270:  iny
        lda     ($F2),y
        .byte   $99
LD274:  brk
        cmp     ($CC,x)
LD277:  .byte   $4F
        cpy     #$D0
        sbc     $68,x
        tay
        pla
        .byte   $20
LD27F:  sta     ($DA),y
        clc
LD282:  lda     $C05A
        adc     $C05E
        bcc     LD28D
LD28A:  inc     $C05B
LD28D:  adc     $C037
        .byte   $8D
        .byte   $37
LD292:  cpy     #$AD
        sec
        cpy     #$29
        .byte   $0F
        adc     $C05B
        ora     #$40
        sta     $C038
        .byte   $AD
        .byte   $35
LD2A2:  cpy     #$AC
        rol     $C0,x
        beq     LD2C5
LD2A8:  .byte   $20
        .byte   $5D
LD2AA:  .byte   $DA
        lda     BUF1
        ldy     $C101
        bne     LD2A8
        lda     $C05C
        ldy     $C05D
        .byte   $8D
LD2BA:  brk
        cmp     ($8C,x)
        ora     ($C1,x)
        jsr     XSVSEC
LD2C2:  jmp     LDFD4

LD2C5:  lda     $C05C
        .byte   $AC
        .byte   $5D
LD2CA:  cpy     #$8D
        and     $C0,x
        sty     $C036
        .byte   $20
LD2D2:  .byte   $59
        .byte   $DB
LD2D4:  jsr     XSMAP
        jsr     LDAEE
LD2DA:  cli
        jmp     XSCAT

        lda     $021F
        .byte   $F0
LD2E2:  bpl     $D330
        .byte   $6F
        cmp     ($A9),y
        brk
        ldx     #$03
LD2EA:  sta     $C04D,x
        dex
        bpl     LD2EA
        stx     $C072
LD2F3:  rts

LD2F4:  jmp     LDE23

        lda     #$80
        .byte   $20
LD2FA:  .byte   $54
        .byte   $D4
        jsr     LD79E
        jsr     LDFE6
LD302:  jsr     LD39E
        beq     LD352
        bne     LD30E
LD309:  .byte   $20
LD30A:  tya
        .byte   $D3
        beq     LD352
LD30E:  jsr     LD22C
        ldy     #$40
        cmp     #$56
        beq     LD31D
        cmp     #$4E
        .byte   $D0
LD31A:  .byte   $0C
        ldy     #$80
LD31D:  lda     $C04D
        bne     LD2F4
LD322:  sty     $C04D
        beq     LD309
LD327:  cmp     #$4A
        .byte   $D0
LD32A:  ora     #$AD
        lsr     $D0C0
        cpy     $A2
        .byte   $80
LD332:  bmi     LD34B
LD334:  cmp     #$41
        bne     LD2F4
        .byte   $AD
        .byte   $4E
LD33A:  cpy     #$D0
        .byte   $B7
        jsr     LD398
        .byte   $20
        .byte   $FA
LD342:  .byte   $D2
        sty     $C052
        sta     $C053
        .byte   $A2
LD34A:  rti

LD34B:  .byte   $8E
        .byte   $4E
LD34D:  cpy     #$30
        lda     $B010,y
LD352:  jsr     LE0E5
        bit     $C04D
        bvc     LD385
        .byte   $AD
        .byte   $51
LD35C:  cpy     #$20
        sbc     ($D7,x)
        lda     $C052
        ldy     $C053
        jsr     LD7F8
        lda     $C056
LD36C:  ldy     $C057
        jsr     LD7FE
LD372:  clc
        lda     $C052
        adc     $C04F
        pha
        lda     $C053
        adc     $C050
        tay
        pla
        jsr     LD7FB
LD385:  lda     $C04D
        asl     a
        bmi     LD3DB
        rol     a
        eor     #$01
        and     $C051
        lsr     a
        lda     $C051
        bpl     LD3A4
        php
LD398:  jsr     LE0B4
        plp
        bcc     LD3A1
LD39E:  jmp     LD1AC

LD3A1:  jmp     LD180

LD3A4:  bcc     LD3DB
        lda     $C056
        ldy     $C057
        jmp     L046B

        ldy     #$01
        tya
        sta     ($9A),y
        php
        sei
        jsr     LD188
        ldy     $92
        lda     $91
        clc
        adc     #$02
        bcc     LD3C3
        iny
LD3C3:  sta     $9C
        sty     $9D
        sta     $9E
        sty     $9F
        sta     $A0
        sty     $A1
        lda     $A6
        ldy     $A7
        sta     $A2
        sty     $A3
        plp
        jmp     LD1CC

LD3DB:  cli
        rts

LD3DD:  ldx     #$00
        .byte   $2C
LD3E0:  ldx     #$0C
        jmp     LD67E

        jsr     LDB2D
        beq     LD3DD
        sei
        sec
        ror     $C072
        lda     $C30C,x
        ldy     $C30D,x
LD3F5:  jsr     LDA5D
        ldx     #$02
LD3FA:  lda     BUF1,x
        cmp     #$FF
        beq     LD40E
        inx
        bne     LD3FA
        lda     BUF1
        ldy     $C101
        beq     LD3DB
        bne     LD3F5
LD40E:  lda     $C101,x
        sta     SEDORIC_FTYPE
        and     #$C0
        bne     LD41C
        bit     $C04D
        bvc     LD3E0
LD41C:  bit     $C04E
        bvs     LD43A
        bpl     LD42E
        ldy     $9D
        lda     $9C
        sbc     #$02
        bcs     LD434
        dey
        bcc     LD434
LD42E:  lda     $C102,x
        ldy     $C103,x
LD434:  sta     $C052
        sty     $C053
LD43A:  sec
        lda     $C104,x
        sbc     $C102,x
        sta     $C04F
        lda     $C105,x
        sbc     $C103,x
        sta     $C050
        clc
        .byte   $AD
LD44F:  .byte   $52
        .byte   $C0
LD451:  sta     RWBUF
LD454:  adc     $C04F
        pha
        lda     $C053
        tay
        dey
        sty     $C004
        adc     $C050
        tay
        bit     $C072
        bpl     LD475
        lda     $C106,x
        sta     $C056
        lda     $C107,x
        sta     $C057
LD475:  lda     $C108,x
        sta     $F7
        lda     $C109,x
        sta     $F8
        bit     $C04D
        bvc     LD4B9
        lda     $C053
        jsr     XAFHEX
        lda     $C052
        jsr     XAFHEX
        jsr     LD628
        tya
        jsr     XAFHEX
        pla
        jsr     XAFHEX
        jsr     LD628
        lda     SEDORIC_FTYPE
        jsr     XAFHEX
        jsr     LD628
        lda     $C057
        jsr     XAFHEX
        lda     $C056
        jsr     XAFHEX
        jsr     LD628
        jsr     LD206
        .byte   $24
LD4B9:  pla
        txa
        clc
        adc     #$06
        tay
        jsr     LE228
        lda     $F7
        bne     LD4C8
        dec     $F8
LD4C8:  dec     $F7
        inc     $C004
        lda     $F7
        ora     $F8
        beq     LD4DC
        jsr     LE228
        jsr     LE250
        jmp     LE1C2

LD4DC:  lda     RWBUF
        ldx     $C004
        sta     $F5
        stx     $F6
        jsr     LE228
        tya
        pha
        lda     #$00
        ldx     #$C2
        sta     RWBUF
        stx     $C004
        bit     $C04D
        bvs     LD50A
        jsr     LE250
        ldy     #$FF
        iny
        cpy     #$A2
        .byte   $C0
LD503:  ldy     #$01
        jsr     $CFEB
        .byte   $8D
        .byte   $06
LD50A:  cpy     #$68
        sta     $C004
        pla
        sta     RWBUF
        bcs     LD51B
        lda     MICRODISC_FDC_SECTOR
        sta     MICRODISC_FDC_TRACK
LD51B:  pla
        tax
        stx     type_of_error
        rts

        lda     MICRODISC_CONTROL_SHADOW
        sta     MICRODISC_CONTROL
        lda     MICRODISC_FDC_COMMAND
        lsr     a
        bcc     LD532
        lda     #$D0
        sta     MICRODISC_FDC_COMMAND
LD532:  sec
        jmp     NMIRAM

        stx     $F3
        ldx     #$04
        jsr     LD36C
        sec
        ldx     $F3
        lda     $F2
        sbc     #$02
        bcs     LD547
        dex
LD547:  pha
        txa
        jsr     XAFHEX
        pla
        jsr     XAFHEX
        cli
        ldx     #$FF
        txs
        jsr     XROM
        lda     $A0C4
        cpy     $60
        jsr     XROM
        sed
        .byte   $C3
        .byte   $F4
        .byte   $C3
        rts

        jsr     XROM
LD567:  pha
        cpy     $44
        cpy     $60
        ldx     #$4D
        bit     $A3A2
        jsr     XROM
        sta     $C4
        ror     $20C4,x
        cld
        cmp     $A3,x
        cpy     $96
        cpy     $60
        jsr     XROM
        lda     $C4,x
        tay
        cpy     $60
        lda     $9A
        ldy     $9B
        jsr     XROM
        .byte   $73
        cmp     $63
        cmp     $60
        jsr     XROM
        asl     a
        dec     $FA
        cmp     $60
        jsr     XROM
        dec     $B3C6,x
        dec     $60
        jsr     XROM
        inc     $C3C6
        dec     $60
        jsr     XROM
        adc     $C7
        .byte   $3A
        .byte   $C7
        rts

        .byte   $20
LD5B5:  cld
        cmp     $99,x
        .byte   $C7
        jmp     ($60C7)

        jsr     XROM
        rti

        iny
        asl     $C8,x
        rts

        .byte   $20
        cld
LD5C6:  cmp     $3D,x
        iny
        .byte   $2F
        iny
        rts

        jsr     XROM
        .byte   $1F
        cmp     #$52
        cmp     #$60
        jsr     XROM
        .byte   $F1
XROM:   cmp     #$23
        dex
        rts

        jsr     XROM
        .byte   $1C
        dex
        lsr     $20CA
        cld
        cmp     $0D,x
        dex
        .byte   $3F
        dex
        rts

        jsr     XROM
        eor     ($CA,x)
        .byte   $73
        dex
        rts

        jsr     LD39E
        jsr     XROM
        tya
        dex
        .byte   $E2
        dex
        rts

        jsr     XROM
        .byte   $EF
        dex
        and     $60CB,y
        jsr     XROM
        .byte   $9F
        .byte   $CB
        beq     XROM
        rts

LD60E:  jsr     XROM
        .byte   $12
        .byte   $CC
XAFHEX: cmp     $60CC,y
        jsr     LD224
        clc
        bit     $38
        .byte   $20
        cld
LD61E:  cmp     $7D,x
        dec     $CF09
        rts

LD624:  jsr     XROM
        .byte   $8B
LD628:  .byte   $CE
        .byte   $17
XAFCAR: .byte   $CF
        rts

        lda     #$2C
        jsr     XROM
        .byte   $DB
        .byte   $CF
        .byte   $67
        bne     LD682
        .byte   $A1
XAFSTR: .byte   $D3
        jsr     XROM
        .byte   $FC
        .byte   $D0
LD63D:  dey
        cmp     ($85),y
        .byte   $D3
        sty     $D4
        rts

        jsr     XROM
        cli
LD648:  cmp     ($E8),y
        cmp     ($60),y
        jsr     XROM
        .byte   $17
        .byte   $D2
        lda     #$D2
        rts

        .byte   $20
LD655:  cld
        cmp     $ED,x
        .byte   $D3
        sta     $60D4,y
        jsr     XROM
LD65F:  ora     LD2D4,y
        .byte   $D4
        rts

        jsr     XROM
        beq     LD63D
LD669:  .byte   $AB
        cmp     $60,x
        jsr     XROM
        .byte   $C7
        dec     $82,x
        .byte   $D7
        rts

        jsr     LD21B
        jsr     XROM
        ora     $D7,x
        bne     LD655
LD67E:  rts

        jsr     LD216
LD682:  jsr     XROM
        bpl     LD65F
        .byte   $CB
        cld
        rts

        jsr     XROM
        .byte   $6B
        cld
        rol     $D9
        rts

        jsr     XROM
        stx     $D9,y
        .byte   $22
        .byte   $DA
        rts

        jsr     XROM
        .byte   $80
        .byte   $DA
        .byte   $0B
        .byte   $DB
        rts

        jsr     XROM
        .byte   $97
        .byte   $DA
        .byte   $22
        .byte   $DB
        rts

        jsr     XROM
        .byte   $B7
        .byte   $DC
        sbc     $60DC
        jsr     XROM
        cpx     #$DD
        cpx     $DD
        rts

        jsr     XROM
        .byte   $73
        dec     LDE7B,x
        rts

        jsr     XROM
        lda     $DE
        lda     $60DE
        jsr     XROM
        cmp     $D8,x
        rti

        .byte   $DF
        rts

        jsr     XROM
        cmp     ($E0),y
        cmp     $E0,x
        rts

        jsr     XROM
        adc     $71E2
        .byte   $E2
        rts

        jsr     XROM
        adc     $7DE3,y
        .byte   $E3
        rts

        jsr     XROM
        .byte   $87
        .byte   $E3
        .byte   $8B
        .byte   $E3
        rts

        jsr     XROM
        stx     $92E3
        .byte   $E3
        rts

        jsr     XROM
        sta     $53E7,x
        inx
        rts

        jsr     XROM
        ora     $E9
        sei
        .byte   $EB
        rts

        jsr     XROM
        .byte   $C7
        cpx     LEDE0
        rts

        jsr     XROM
        adc     $10F0,y
        sbc     ($60),y
        jsr     XROM
        .byte   $94
LD71E:  .byte   $F4
        .byte   $EF
        .byte   $F4
        rts

        jsr     XROM
        and     $F5,x
        bcc     LD71E
        rts

        jsr     XROM
        .byte   $CB
        .byte   $F7
        ora     ($F8,x)
        rts

        jsr     XROM
        rol     $82F9,x
        sbc     $2060,y
LD73B:  cld
        cmp     $E2,x
XCURON: brk
        .byte   $E2
XCUROFF:brk
        rts

        jsr     XROM
        inx
        brk
        inx
        brk
        rts

        ldy     #$09
        .byte   $2C
        .byte   $A0
LD74E:  brk
LD74F:  lda     COMMON_EXT_TABLE,x
        sta     $C029,y
        iny
LD756:  inx
        .byte   $C0
LD758:  .byte   $0C
        bne     LD74F
        rts

        lda     EXTER
        ldy     $C00E
        bne     LD776
        lda     EXTMS
        ldy     $C010
        bne     LD776
        lda     #$E6
        ldy     #$CE
        bne     LD776
        lda     #$BE
        ldy     #$CD
LD776:  sta     $18
        sty     $19
        ldy     #$00
LD77C:  dex
        bmi     LD78B
LD77F:  inc     $18
        bne     LD785
        inc     $19
LD785:  lda     ($18),y
        bpl     LD77F
        bmi     LD77C
LD78B:  iny
        lda     ($18),y
        php
        and     #$7F
        jsr     XAFCAR
        plp
        bpl     LD78B
        rts

        jsr     LD33A
        jmp     LD3A1

LD79E:  .byte   $20
        .byte   $42
LD7A0:  .byte   $D3
        php
        cmp     #$61
        bcc     LD7AC
        cmp     #$7B
        bcs     LD7AC
        and     #$DF
LD7AC:  plp
        rts

        ldx     #$00
        stx     SEDORIC_IDERROR
        tsx
        stx     $C023
        lda     $E9
        ldy     $EA
        .byte   $8D
        .byte   $1F
LD7BD:  cpy     #$8C
        .byte   $20
LD7C0:  cpy     #$20
        .byte   $9E
        .byte   $D3
        sbc     #$41
        ldy     #$1A
        .byte   $90
LD7C9:  php
        cmp     #$1A
LD7CC:  bcs     LD7D2
        tay
LD7CF:  jsr     LD33A
LD7D2:  tya
        asl     a
        asl     a
LD7D5:  tay
        .byte   $B9
        .byte   $BB
LD7D8:  .byte   $CB
        sta     $18
LD7DB:  lda     LCBBC,y
LD7DE:  sta     $19
        .byte   $B9
LD7E1:  ldx     $85CB,y
LD7E4:  .byte   $F2
        .byte   $BE
        .byte   $BD
LD7E7:  .byte   $CB
LD7E8:  dec     $F2
        bmi     LD828
        ldy     #$FF
LD7EE:  iny
        lda     ($18),y
        .byte   $F0
LD7F2:  bit     $85
        .byte   $F3
        lda     ($E9),y
        .byte   $C9
LD7F8:  adc     ($90,x)
        .byte   $06
LD7FB:  cmp     #$7B
        .byte   $B0
LD7FE:  .byte   $02
        and     #$DF
        cmp     $F3
        beq     LD7EE
LD805:  iny
        lda     ($18),y
        bne     LD805
        inx
        sec
        tya
        adc     $18
        sta     $18
        bcc     LD7E8
        inc     $19
        bcs     LD7E8
LD817:  txa
        asl     a
        tax
        .byte   $BD
        plp
LD81C:  cpy     $BD48
        .byte   $27
        cpy     $2048
        .byte   $E3
        cmp     ($4C),y
        .byte   $9E
        .byte   $D3
LD828:  lda     $C01F
        ldy     $C020
        sta     $E9
        sty     $EA
        jsr     LD39E
        beq     LD849
        ldy     #$FF
LD839:  iny
LD83A:  lda     ($E9),y
        beq     LD84A
        cmp     #$3A
        beq     LD84A
        .byte   $C9
LD843:  .byte   $D3
        .byte   $D0
LD845:  .byte   $F3
        jmp     LF5BA

LD849:  rts

LD84A:  lda     #$00
        jmp     LDFF9

        sec
        bit     $18
        lda     #$80
        php
        sta     $F4
        lsr     $F5
        lda     DRVDEF
        sta     $C028
        ldx     #$0B
        lda     #$20
        sta     $F3
LD865:  sta     $C029,x
        dex
        bpl     LD865
        plp
        bpl     LD8D0
        .byte   $B0
LD86F:  .byte   $3B
        jsr     LD39E
        bne     LD881
LD875:  lda     #$0C
        sta     $F2
        ldx     #$00
        jsr     LD5B5
        jmp     LD503

LD881:  cmp     #$2C
        beq     LD875
        cmp     #$C3
        beq     LD875
        sec
        sbc     #$41
        tay
        cmp     #$04
        bcs     LD8AB
        jsr     LD398
        beq     LD89E
        cmp     #$C3
        beq     LD89E
        cmp     #$2C
        bne     LD8A3
LD89E:  sty     $C028
        bcs     LD875
LD8A3:  lda     $E9
        bne     LD8A9
        dec     $EA
LD8A9:  dec     $E9
LD8AB:  jsr     LD224
        jsr     LD274
        sta     $F3
        tay
        dey
        bmi     LD932
LD8B7:  lda     ($91),y
        cmp     #$20
        bne     LD8BF
        dec     $F3
LD8BF:  dey
        bpl     LD8B7
        lda     $E9
        pha
        lda     $EA
        pha
        lda     $91
        sta     $E9
        lda     $92
        sta     $EA
LD8D0:  jsr     LD39E
        sbc     #$41
        tax
        cmp     #$04
        bcs     LD909
        ldy     #$01
        lda     ($E9),y
        cmp     #$2D
        beq     LD8E6
        cmp     #$CD
        bne     LD909
LD8E6:  stx     $C028
        dec     $F3
        dec     $F3
        beq     LD93D
        jsr     LD398
        jsr     LD398
        bne     LD909
        bit     $F4
        bmi     LD932
        pla
        pla
        jsr     LD7BD
        jsr     LE5B9
LD903:  jsr     LD7BD
        jmp     LD39E

LD909:  ldx     #$00
        lda     #$09
        sta     $F2
        lsr     $F6
        jsr     LD39E
LD914:  bit     $F6
        bmi     LD92A
        cmp     #$2E
        bne     LD92A
        ror     $F6
        cpx     #$0A
        bcs     LD93D
        lda     #$0C
        sta     $F2
        ldx     #$08
        bne     LD93F
LD92A:  cmp     #$2C
        bne     LD934
        bit     $F4
        bpl     LD959
LD932:  bmi     LD9AC
LD934:  jsr     LD567
        sta     $C029,x
        tya
        cpx     $F2
LD93D:  bcs     LD9AC
LD93F:  dec     $F3
        beq     LD953
        inx
        bit     $F5
        bmi     LD914
        jsr     LD398
        bne     LD914
        bit     $F4
        bpl     LD959
        bmi     LD9AC
LD953:  pla
        sta     $EA
        pla
        sta     $E9
LD959:  lda     $C032
        cmp     #$20
        bne     LD903
        ldx     #$00
        .byte   $20
LD963:  lsr     a
        .byte   $D3
        beq     LD903
        bit     $F5
        bmi     LD98F
        tay
        bpl     LD9B1
        sta     $F5
        and     #$7F
        sta     $24
        lda     #$E9
        ldy     #$C0
        sta     $16
        sty     $17
        ldy     #$00
LD97E:  dec     $24
        bmi     LD98F
LD982:  inc     $16
        bne     LD988
        inc     $17
LD988:  jsr     DO_EXEVEC
        bpl     LD982
        bmi     LD97E
LD98F:  ldy     #$00
        inc     $16
        bne     LD997
        inc     $17
LD997:  jsr     DO_EXEVEC
        pha
        ldy     #$01
        jsr     DO_EXEVEC
        tay
        pla
        php
        and     #$7F
        plp
        bpl     LD9C1
        lsr     $F5
        bpl     LD9C3
LD9AC:  ldx     #$02
        .byte   $4C
        .byte   $7E
LD9B0:  .byte   $D6
LD9B1:  cmp     #$2A
        bne     LD9C3
        lda     #$3F
LD9B7:  sta     $C029,x
        inx
        cpx     $F2
        .byte   $D0
LD9BE:  sed
        dex
        rts

LD9C1:  inc     $F3
LD9C3:  cmp     #$3F
        beq     LD9D7
        cmp     #$30
        bcc     LD9AC
        cmp     #$3A
        bcc     LD9D7
        cmp     #$41
        bcc     LD9AC
        cmp     #$5B
        bcs     LD9AC
LD9D7:  rts

        sta     $0C
        sty     $0D
        php
        pla
        sta     $27
        clc
        pla
LD9E2:  sta     $0E
        adc     #$04
        tay
        pla
        sta     $0F
        adc     #$00
        pha
        tya
        pha
        ldy     #$01
        lda     ATMORI
        bpl     LD9F8
        ldy     #$03
LD9F8:  lda     ($0E),y
        sta     EXEVEC+1
        iny
        lda     ($0E),y
        sta     EXEVEC+2
        ldy     $0D
        lda     $27
        pha
        lda     $0C
        plp
        jmp     L0471

        clc
        adc     #$41
        bvc     LDA2A
        pha
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        jsr     LD61E
        pla
        and     #$0F
        .byte   $C9
LDA1F:  asl     a
        bcc     LDA24
        adc     #$06
LDA24:  clc
        adc     #$30
        bit     $20A9
LDA2A:  cmp     #$0D
        bne     LDA34
        lda     #$00
        sta     $30
        lda     #$0D
LDA34:  jmp     LD20E

        sta     $91
        sty     $92
        ldy     #$00
LDA3D:  lda     ($91),y
        beq     LDA47
        jsr     XAFCAR
        iny
        bne     LDA3D
LDA47:  rts

        ldx     #$14
        .byte   $20
        .byte   $6C
XPMAP:  .byte   $D3
        lda     DRIVE
LDA50:  jsr     LD60E
        jsr     LD206
        ldx     #$0D
        jsr     LD36C
        cli
        .byte   $20
LDA5D:  adc     #$D6
        sei
LDA60:  php
        .byte   $20
        .byte   $06
LDA63:  .byte   $D2
        jsr     LD206
        plp
        rts

        jsr     LD302
        cmp     #$1B
        beq     LDA75
        cmp     #$0D
        .byte   $D0
XPRSEC: sbc     $18,x
LDA75:  rts

        jsr     LD669
        bcc     LDA75
        pla
        pla
        rts

        inx
        stx     SEDORIC_IDERROR
XSCAT:  jmp     (LC01D)

        txa
        jsr     LD7DE
        .byte   $A5
XSMAP:  tay
        ldy     $A9
        .byte   $C0
LDA8E:  .byte   $FF
        bne     LDA92
LDA91:  tya
LDA92:  sta     NOLIGN
        sty     NOLIGN+1
        jsr     LD7F2
        jsr     LD1C4
        cli
        bit     $C018
        bpl     LDAC9
XSVSEC: ldx     $C023
        txs
LDAA8:  lda     $C01B
        ldy     $C01C
        sta     $A8
        sty     $A9
        .byte   $AD
        .byte   $19
LDAB4:  cpy     #$AC
        .byte   $1A
        cpy     #$85
        sbc     #$84
        nop
        lda     $C01F
        ldy     $C020
        .byte   $8D
LDAC3:  and     ($C0,x)
        sty     $C022
        rts

LDAC9:  jsr     LD30A
        .byte   $AE
        .byte   $FD
LDACE:  .byte   $04
        cpx     #$04
        bne     LDB06
        .byte   $A2
LDAD4:  brk
        jsr     LD36C
        lda     PISTE
        jsr     XAFHEX
        lda     type_of_error
        and     #$F0
        eor     #$F0
        beq     LDAFB
        ldx     #$01
        jsr     LD36C
        .byte   $AD
        .byte   $02
LDAEE:  cpy     #$20
        .byte   $13
        dec     $A2,x
        .byte   $03
        lda     type_of_error
        and     #$20
        beq     LDAFD
LDAFB:  ldx     #$02
LDAFD:  jsr     LD36C
        lda     $C017
        jsr     XAFHEX
LDB06:  .byte   $AE
LDB07:  sbc     LCA04,x
        jsr     LD206
        lda     #$3F
        jsr     XAFCAR
        cpx     #$1A
        bcs     LDB1B
        jsr     LD372
        bmi     LDB3B
LDB1B:  cpx     #$32
        bcc     LDB34
        ldx     #$10
        jsr     LD36C
        lda     SEDORIC_IDERROR
        ldy     #$00
        sty     $C04C
        .byte   $A2
LDB2D:  ora     ($20,x)
        cli
XTVNM:  .byte   $D7
        jmp     LD73B

LDB34:  txa
        sbc     #$19
        tax
        jsr     LD35C
LDB3B:  jmp     LD178

        sec
        bit     $18
LDB41:  php
        lsr     BASIC11_FLG
        plp
        .byte   $2E
        ror     a
LDB48:  .byte   $02
        lda     #$01
        jmp     LD32A

        ldx     #$00
        ldy     #$00
        bit     $03A2
        bit     $02A2
        .byte   $85
XTRVCA: .byte   $F3
        sty     $F4
        lda     #$00
        sta     $C073
LDB61:  lda     #$FF
        sta     $F2
LDB65:  inc     $F2
        sec
        lda     $F3
        tay
        sbc     LCD88,x
        .byte   $85
LDB6F:  .byte   $F3
        lda     $F4
        pha
        sbc     LCD8C,x
        sta     $F4
        pla
        bcs     LDB65
        sty     $F3
        sta     $F4
        lda     $F2
        beq     LDB88
        sta     $C073
        bne     LDB91
LDB88:  ldy     $C073
        bne     LDB91
        lda     $C04C
        .byte   $2C
LDB91:  ora     #$30
        jsr     XAFCAR
        dex
        bpl     LDB61
        lda     $F3
        jmp     LD624

        sec
        bit     $18
        ror     $F2
        ldx     #$0B
LDBA5:  lda     $C029,x
        cmp     #$3F
        beq     LDBB1
        dex
        bpl     LDBA5
        sec
LDBB0:  rts

LDBB1:  rol     $F2
        bcc     LDBB0
        ldx     #$05
        .byte   $2C
LDBB8:  ldx     #$01
        jmp     LD67E

        ldy     $C028
XWDESC: sty     DRIVE
        lda     $C039,y
        beq     LDBB8
        rts

        ldx     #$0E
        bit     $10A2
        bit     $12A2
        bit     $14A2
        bit     $16A2
        bit     $06A2
        bit     $04A2
        bit     a:$A2
        bit     $0AA2
        bit     $1EA2
        bit     $20A2
        bit     $22A2
        bit     $24A2
        ldy     #$00
        bit     $02A2
        bit     $08A2
        bit     $18A2
        bit     $1AA2
        bit     $1CA2
        nop
        nop
        nop
        sta     $F2
        lda     SYS_VAR_NAMES,x
        sta     $B4
        lda     LCD95,x
        sta     $B5
        tya
        ldy     $F2
        jsr     LD2CA
        jsr     LD244
        tax
        jmp     LD2C2

        inc     $16
        bne     LDC22
        inc     $17
LDC22:  ldy     #$00
        bit     $C048
        bvc     LDC2C
        jmp     DO_EXEVEC

LDC2C:  lda     ($16),y
        beq     LDC6F
        bpl     LDC71
        bit     $C048
        bpl     LDC6F
        and     #$7F
        rts

        jsr     LEA1E
        lda     #$08
        and     V1DRB
        rts

        sec
        bit     $18
        ror     $C04A
        jsr     LD302
        php
        sta     $C046
        stx     $C047
        bit     $C049
        bpl     LDC72
        bit     $C04A
        bmi     LDC64
        cpx     #$4E
        bcc     LDC64
        lsr     $C049
LDC64:  jsr     LD81C
        bpl     XLIBSE
        lsr     $C049
XLIBSE: and     #$7F
        plp
LDC6F:  bit     $E2
LDC71:  rts

LDC72:  plp
        bpl     LDC71
        lda     #$00
        .byte   $8D
LDC78:  .byte   $4B
        cpy     #$8D
        pha
        cpy     #$A9
        .byte   $0E
        .byte   $A2
LDC80:  .byte   $EF
        jsr     LD322
        lda     #$15
        jsr     LD83A
LDC89:  bne     LDCC3
LDC8B:  lda     $C046
        .byte   $AE
        .byte   $47
LDC90:  cpy     #$2C
        and     $10C0,x
        cmp     $08AD,y
        .byte   $02
        ldx     #$05
LDC9B:  cmp     QWAZERTY_CONV,x
        beq     LDCAC
        dex
        bpl     LDC9B
        lda     $C046
LDCA6:  .byte   $AE
        .byte   $47
LDCA8:  nop
        jmp     LD86F

LDCAC:  .byte   $AD
LDCAD:  php
        .byte   $02
        pha
        lda     LCD47,x
        sta     BASIC11_KEYBOARD_MATRIX
        jsr     LD31A
        tax
        pla
        sta     BASIC11_KEYBOARD_MATRIX
        txa
        and     #$7F
        bpl     LDCA6
LDCC3:  lda     #$17
        jsr     LD83A
        bne     LDCD1
        lda     #$14
        jsr     LD83A
        beq     LDCD3
LDCD1:  lda     #$40
LDCD3:  ora     BASIC11_KEYBOARD_MATRIX
LDCD6:  and     #$7F
        tax
        lda     KEYDEF,x
        tay
        iny
        bne     LDCE3
        jmp     LD963

LDCE3:  iny
        beq     LDD52
        cmp     #$20
        ror     a
        sta     $C048
        rol     a
        bmi     LDCF3
        bcc     LDCF3
        sbc     #$20
LDCF3:  and     #$7F
        tax
        lda     #$E9
        ldy     #$C0
        bit     $C048
        bvs     LDD28
        bmi     LDD07
        lda     #$7F
        ldy     #$C8
        bne     LDD28
LDD07:  lda     $F2
        pha
        jsr     LEA30
        .byte   $A0
LDD0E:  brk
LDD0F:  lda     LCBBD,y
        inx
        iny
        iny
XDETSE: iny
        iny
        cmp     $F2
        bcc     LDD0F
        stx     $C04B
        ldx     $F2
        dex
        pla
        sta     $F2
        lda     #$DD
        ldy     #$C9
LDD28:  sta     $16
        sty     $17
LDD2C:  dex
XCREAY: bmi     LDD36
LDD2F:  jsr     LD81C
        bpl     LDD2F
        bmi     LDD2C
LDD36:  jsr     LD81C
        cmp     #$20
        beq     LDD36
        lda     $16
        bne     LDD43
        dec     $17
LDD43:  dec     $16
        lda     $C04B
LDD48:  sec
LDD49:  .byte   $6E
CMD_SAVEM:
        eor     #$C0
LDD4C:  .byte   $AE
CMD_SAVEU:
        .byte   $47
        .byte   $C0
LDD4F:  .byte   $4C
CMD_SAVE:
        .byte   $6F
        cld
LDD52:  .byte   $A9
CMD_SAVEO:
        .byte   $7F
        bit     $C04A
        bmi     LDD4C
        ldx     $C047
        beq     LDD4C
        dex
        lda     #$08
        bne     LDD4F
        ldy     $C042
        lda     $C043
        jsr     LD2CA
        jsr     LD2D2
        ldx     #$00
        stx     $17
        dex
        stx     $16
LDD76:  inx
        lda     STACK+1,x
        bne     LDD76
        sta     STACK+2,x
        txa
        pha
        lda     $C042
        ldy     $C043
        sta     $33
        sty     $34
        jsr     LD19C
        pla
        tax
        lda     #$20
        bcc     LDD96
        lda     #$2A
LDD96:  sta     STACK+1,x
        clc
        lda     $C044
        adc     $C042
        sta     $C042
        lda     $C045
        adc     $C043
        sta     $C043
        lda     #$0D
        bne     LDD48
        lda     #$00
        sta     LE7D1
        sta     LE7D2
        sta     LE7D3
        jsr     LE55C
        jsr     LDA63
        ldx     #$10
        cpx     $C302
        beq     LDDEC
        lda     $C302
        sec
LDDCC:  .byte   $E9
CMD_KEYSAVE:
        bpl     LDE19
        lsr     a
        lsr     a
        lsr     a
        clc
        adc     LE7D1
        bcc     LDDDB
        inc     LE7D2
LDDDB:  sta     LE7D1
        .byte   $EE
LDDDF:  .byte   $D3
CMD_ESAVE:
        .byte   $E7
        lda     BUF3
        ldy     $C301
        beq     LDDEC
        jmp     LD9BE

LDDEC:  jsr     LDB2D
        rts

        lda     LE7D3
        sta     $C208
        lda     LE7D1
        ldx     LE7D2
        rts

        dec     $C208
LDE00:  dec     LE7D3
        rts

        lda     LE7D4
        bne     LDE16
        .byte   $AD
        .byte   $D3
LDE0B:  .byte   $E7
        sta     $C208
        lda     LE7D1
        ldx     LE7D2
        rts

LDE16:  lda     $C204
LDE19:  ldx     $C205
        rts

        nop
        nop
        nop
LDE20:  jsr     LD27F
LDE23:  php
        sei
        txa
        pha
        lsr     a
LDE28:  lsr     a
        lsr     a
        and     #$07
        tax
        clc
        lda     #$FF
LDE30:  rol     a
        dex
        bpl     LDE30
        tax
        lda     #$0E
        jsr     LD322
        pla
        and     #$07
        ora     #$B8
        jsr     LD83A
        sta     $D0
        plp
        jsr     LD1EB
        lsr     FLAGIF
        rts

LDE4C:  .byte   $20
CMD_CREATEW:
        rol     LEAE6
        jsr     LDA60
LDE53:  ldx     BUF2
        inx
        beq     LDECD
        ldx     #$0A
        bne     LDE7F
        ldx     #$C1
        bit     $C2A2
        bit     $C3A2
        stx     $C004
        ldx     #$00
        stx     RWBUF
        sta     PISTE
        sty     SECTEUR
        ldx     #$88
LDE75:  jsr     XRWTS
        beq     LDECD
        .byte   $A2
LDE7B:  .byte   $03
        bvc     LDE7F
        inx
LDE7F:  jmp     LD67E

        lda     $C025
        ldy     $C026
        bne     LDE94
        jmp     LDC80

        nop
        ldx     #$C2
        bit     $C1A2
        .byte   $2C
LDE94:  ldx     #$C3
        stx     $C004
        ldx     #$00
        stx     RWBUF
        sta     PISTE
        sty     SECTEUR
LDEA4:  ldx     #$A8
        bne     LDE75
        lda     #$00
        ldy     #$C1
        sta     RWBUF
        sty     $C004
        bne     LDEA4
        ldx     $C027
        ldy     #$08
        jsr     LDAC3
        lda     #$2E
        jsr     XAFCAR
        ldy     #$02
LDEC3:  lda     BUF3,x
        jsr     XAFCAR
        inx
        dey
        bpl     LDEC3
LDECD:  rts

        lda     #$C1
        bit     $C2A9
        bit     $C3A9
        sta     $0F
        lda     #$00
        sta     $0E
        ldy     #$00
        tya
LDEDF:  sta     ($0E),y
        iny
        bne     LDEDF
        rts

        lda     $C025
        ldy     $C026
        jsr     LDA63
        ldx     $C027
        ldy     #$F0
LDEF3:  lda     $BF39,y
        sta     BUF3,x
        inx
        iny
        bne     LDEF3
        rts

        lda     $C025
        ldy     $C026
        jsr     LDA63
        ldx     $C027
        ldy     #$F0
LDF0C:  lda     BUF3,x
        .byte   $99
        .byte   $39
LDF11:  .byte   $BF
        inx
        iny
        bne     LDF0C
        rts

LDF17:  ldy     #$F4
LDF19:  .byte   $B9
        .byte   $35
LDF1B:  .byte   $BF
        cmp     #$3F
        beq     LDF25
        cmp     BUF3,x
        bne     LDF41
LDF25:  inx
        iny
        bne     LDF19
        ldx     $C027
        rts

        jsr     XPMAP
        jsr     CMD_REN
        nop
LDF34:  sta     $C025
        sty     $C026
        jsr     LDA63
        ldx     #$10
        bne     LDF48
LDF41:  lda     $C027
        clc
        adc     #$10
        tax
LDF48:  stx     $C027
        cpx     $C302
        bne     LDF17
        lda     BUF3
        ldy     $C301
        bne     LDF34
        rts

        jsr     LDBA5
        bne     LDF92
        jmp     LDB6F

        dec     $C208
        dec     LE7D3
        rts

        .byte   $C2
        sta     $C208
        jmp     CMD_REN

        jsr     XLIBSE
        sta     BUF3
        sty     $C301
        inc     $C208
        jsr     XSMAP
        jsr     XSCAT
        lda     BUF3
        ldy     $C301
        sta     $C025
        sty     $C026
        jsr     LDAD4
        ldx     #$10
LDF92:  txa
        stx     $C027
        clc
        adc     #$10
        sta     $C302
        inc     $C204
        bne     LDFBF
        inc     $C205
        rts

        jsr     CMD_REN
        nop
LDFA9:  sta     $C025
        sty     $C026
        jsr     LDA63
        ldx     $C302
        bne     LDFBF
        lda     BUF3
        ldy     $C301
        bne     LDFA9
LDFBF:  rts

        sta     $C058
        sty     $C059
        sta     $C05A
        sty     $C05B
        jsr     LDACE
        ldx     #$01
        stx     $C05E
LDFD4:  jsr     XLIBSE
        sta     $C05C
        sty     $C05D
        .byte   $8D
LDFDE:  ora     ($C0,x)
        sty     SECTEUR
        ldx     #$08
LDFE5:  .byte   $BD
LDFE6:  eor     ($C0),y
        sta     $C103,x
        dex
        bpl     LDFE5
        stx     $C102
        ldx     #$0C
LDFF3:  stx     $C05F
LDFF6:  .byte   $AD
CMD_LOAD:
        cli
        .byte   $C0
LDFF9:  ora     $C059
        beq     LE056
        lda     $C058
        bne     LE006
        dec     $C059
LE006:  dec     $C058
        jsr     XLIBSE
        ldx     $C05F
        sta     BUF1,x
        inx
        tya
        sta     BUF1,x
        inx
        bne     LDFF3
        lda     $C058
        ora     $C059
        beq     LE056
        ldy     $C101
        bne     LE043
        jsr     XLIBSE
        sta     BUF1
        pha
        sty     $C101
        tya
        pha
        jsr     LDAA8
        pla
        sta     SECTEUR
        pla
        sta     PISTE
        inc     $C05E
        bne     LE04F
LE043:  jsr     LDAA8
        lda     BUF1
        ldy     $C101
        jsr     LDA5D
LE04F:  jsr     LDACE
        ldx     #$02
        bne     LDFF3
LE056:  lda     #$00
        sta     BUF1
        sta     $C101
        jsr     LDAA8
        lda     $C05C
        ldy     $C05D
        jmp     LDA5D

        clc
        bit     $38
        lda     $C202
        tax
        ora     $C203
        bne     LE07D
        bcc     LE0D4
        ldx     #$07
        jmp     LD67E

LE07D:  jmp     LE67F

        bit     $2F
        bpl     LE089
        php
        jsr     LE63A
        plp
LE089:  ldy     #$02
        lda     #$14
        jmp     LDA8E

        lda     #$01
        ldy     #$00
LE094:  pha
        and     $C210,x
        bne     LE09F
        pla
        asl     a
        iny
        bne     LE094
LE09F:  pla
        eor     #$FF
        and     $C210,x
        sta     $C210,x
        lda     #$00
        sta     $F3
        txa
        asl     a
LE0AE:  .byte   $26
CMD_OLD:.byte   $F3
        asl     a
        rol     $F3
        asl     a
LE0B4:  rol     $F3
        sta     $F2
        tya
        ora     $F2
        ldx     #$FF
LE0BD:  sec
        inx
        tay
        sbc     $C207
        bcs     LE0BD
        dec     $F3
        bpl     LE0BD
        txa
        cpx     $C206
        bcc     LE0D4
        sbc     $C206
        ora     #$80
LE0D4:  iny
        rts

        dey
        tax
        bpl     LE0E0
        and     #$7F
        clc
LE0DD:  adc     $C206
LE0E0:  tax
        lda     #$00
        sta     $F3
LE0E5:  cpx     #$00
        beq     LE0F4
LE0E9:  clc
        adc     $C207
        bcc     LE0F1
        inc     $F3
LE0F1:  dex
        bne     LE0E9
LE0F4:  sta     $F2
        clc
        tya
        adc     $F2
LE0FA:  bcc     LE0FE
        inc     $F3
LE0FE:  pha
        and     #$07
        tay
        pla
        lsr     $F3
        ror     a
        lsr     $F3
        ror     a
        lsr     $F3
        jmp     LE6C4

        lda     #$00
LE110:  rol     a
        dey
        bpl     LE110
        rts

        jsr     LDCD6
        ora     $C210,x
        cmp     $C210,x
        beq     LE12C
        sta     $C210,x
        inc     $C202
        bne     LE12C
        inc     $C203
        clc
LE12C:  rts

        jsr     LDCD6
        eor     #$FF
        and     $C210,x
        cmp     $C210,x
        beq     LE12C
        sta     $C210,x
        lda     $C202
        bne     LE145
        dec     $C203
LE145:  dec     $C202
        clc
        rts

        lda     #$40
        bit     $C0A9
        bit     $80A9
        bit     a:$A9
        jsr     LDE28
        jsr     LD44F
        jsr     LD79E
LE15E:  jsr     LD39E
        bne     LE166
        jmp     LDE0B

LE166:  jsr     LD22C
        cmp     #$54
        bne     LE189
        jsr     LD398
        jsr     LD2FA
        sty     $C056
        sta     $C057
        lsr     $C051
        sec
        rol     $C051
        bne     LE15E
LE182:  lda     #$40
        sta     $C051
        bne     LE15E
LE189:  cmp     #$41
        bne     LE19B
        jsr     LD398
        jsr     LD2FA
        sty     $C052
        sta     $C053
        bcc     LE182
LE19B:  cmp     #$45
        bne     LE1AD
        jsr     LD398
        jsr     LD2FA
        sty     $C054
        sta     $C055
        bcc     LE182
LE1AD:  cmp     #$C7
        bne     LE223
        jsr     LD398
        bne     LE223
        lsr     $C051
        sec
        rol     $C051
        bmi     LE20B
        lda     $C052
LE1C2:  ldy     $C053
        sta     $C056
        sty     $C057
        bcc     LE20B
        jsr     LD44F
        lda     #$00
        ldy     #$C8
        sta     $C052
        sty     $C053
        lda     #$DD
        ldy     #$C9
        bne     LE1FE
        jsr     LD44F
        lda     $021F
        bne     LE1F0
        ldx     #$80
        ldy     #$BB
        lda     #$DF
        bne     LE1F6
LE1F0:  ldx     #$00
        ldy     #$A0
        lda     #$3F
LE1F6:  stx     $C052
        sty     $C053
        ldy     #$BF
LE1FE:  ldx     #$40
        brk
        brk
        .byte   $07
        plp
        jsr     LEB22
        jmp     LEB0E

        plp
LE20B:  jsr     L0471
        pha
        php
        txa
        pha
        tya
        jsr     LD7CF
        pla
        jsr     LD7CC
        pla
        jsr     LD7D2
        pla
        jmp     LD7C9

        .byte   $6C
LE223:  beq     LE229
        inc     $C20B
LE228:  .byte   $D0
LE229:  .byte   $03
        inc     $C20C
        ldy     #$F4
LE22F:  lda     $BF35,y
        cmp     #$3F
        beq     LE23B
        .byte   $DD
        brk
LE238:  .byte   $C3
        bne     LE243
LE23B:  inx
        iny
        bne     LE22F
        ldx     $C027
        rts

LE243:  jmp     LDB41

        iny
        inx
        cpx     #$08
        beq     LE24E
        bne     LE238
LE24E:  lda     #$3E
LE250:  sta     LD9E2,x
        inx
        lda     #$00
        sta     LD9E2,x
        lda     #$E0
        ldy     #$D9
        jsr     XAFSTR
        rts

        ora     $3F0A
LE264:  .byte   $4E
        .byte   $4F
LE266:  .byte   $54
        jsr     L4D45
        bvc     LE2C0
        eor     $4420,y
        eor     #$52
        eor     $43
        .byte   $54
        .byte   $4F
        .byte   $52
        cmp     LEAEA,y
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        jsr     LE94D
        jsr     LDFDE
        lda     $C03D
        and     #$80
        bcc     LE2A0
        ora     #$40
LE2A0:  sta     $C03D
        bit     $C03D
        bvs     LE2AD
        ldx     #$05
        jmp     LD332

LE2AD:  lda     #$06
        sta     $F2
        ldx     #$00
LE2B3:  lda     #$08
        sta     $F3
        sta     $F5
        lda     ACCENTED_FONT,x
        inx
        asl     a
        asl     a
        .byte   $26
LE2C0:  sbc     $0A,x
        rol     $F5
        sta     $F4
        lda     $F5
        adc     #$94
        sta     $F5
        ldy     #$00
LE2CE:  lda     ACCENTED_FONT,x
        .byte   $91
LE2D2:  .byte   $F4
        inx
        iny
        dec     $F3
        bne     LE2CE
        dec     $F2
        bne     LE2B3
        rts

        lda     #$C0
        bit     a:$A9
        sta     $C03D
        jsr     LDFDE
        jmp     LEBA3

        lda     BASIC11_Y_TEXT
        ldy     BASIC11_X_TEXT
        jmp     LEBFB

        lda     $0219
        ldy     $021A
        pha
        tya
        jsr     LD7E7
        pla
        jmp     LD7E4

        php
        pha
        lda     $02F9
        ldy     $02FA
        sta     EXEVEC+1
        sty     EXEVEC+2
        pla
        plp
        jmp     EXERAM

        lda     #$10
        ldy     #$07
        sta     $026B
        sty     $026C
        .byte   $A9
LE322:  .byte   $0F
        sta     BASIC11_FLG
        lda     #$0C
        jsr     XAFCAR
        jmp     LEBA3

        jsr     LD224
        jsr     LD274
        sta     $F2
        tay
LE337:  dey
        lda     ($91),y
        sta     BUF1,y
        tya
        bne     LE337
        jsr     LD22C
LE343:  .byte   $20
CMD_DIR:bit     $D2
        jsr     LD274
        sta     $F3
        stx     $B8
        sty     $B9
        jsr     LD22C
        jsr     LD27F
        bne     LE38E
        dex
        stx     $F6
        cpx     $F2
        bcs     LE391
        lda     $F2
        beq     LE37E
LE362:  ldx     $F3
        beq     LE37E
        lda     $F6
        sta     $F7
        lda     #$C1
        sta     $F8
        ldy     #$00
LE370:  lda     ($F7),y
        cmp     ($B8),y
        bne     LE384
        iny
        dex
        bne     LE370
        ldy     $F6
        iny
        .byte   $2C
LE37E:  ldy     #$00
        tya
        jmp     LD7DB

LE384:  inc     $F6
        lda     $F6
        cmp     $F2
        beq     LE37E
        bne     LE362
LE38E:  jmp     LDE23

LE391:  jmp     LDE20

        tax
        lda     BASIC11_FLG
        pha
        cpx     #$C6
        bne     LE3BB
        jsr     LD398
        jsr     XCUROFF
        jsr     LD292
        ldy     $20
        sta     $12
        sty     $13
        stx     BASIC11_X_TEXT
        ldx     $02F8
        stx     BASIC11_Y_TEXT
        jsr     LEA36
        jsr     LD22C
LE3BB:  jsr     LD224
        bit     $28
        bpl     LE3D7
        jsr     LD277
        beq     LE3CC
        ldy     #$00
        lda     ($91),y
        .byte   $2C
LE3CC:  lda     #$2E
        sta     $C075
        jsr     LD22C
        jsr     LD224
LE3D7:  jsr     LD219
        jsr     LD282
        txa
        beq     LE42B
        stx     $F2
        lda     #$3B
        jsr     LD22E
        sty     $F3
        jsr     LED2E
        jsr     LD21B
        jsr     LD39E
        beq     LE419
LE3F4:  jsr     LD22C
        jsr     LD3A1
        ldx     #$04
        stx     $F4
LE3FE:  asl     $F4
        cmp     LCDBA,x
        beq     LE40A
        dex
        bpl     LE3FE
        bmi     LE428
LE40A:  lda     $F4
        eor     $F3
        cmp     $F3
        bcc     LE428
        sta     $F3
        jsr     LD398
        bne     LE3F4
LE419:  jsr     LED36
        jsr     LEE8E
LE41F:  pla
        sta     BASIC11_FLG
        lda     $F4
        jmp     LD7D8

LE428:  jmp     LDE23

LE42B:  jmp     LDE20

        jsr     LD238
        sta     $B8
        sty     $B9
        rts

LE436:  .byte   $A5
CMD_DELBAK:
        .byte   $F3
        and     #$08
        bne     LE452
LE43C:  jsr     XCUROFF
        ldx     $F2
        .byte   $AD
        .byte   $75
LE443:  .byte   $C0
CMD_DESTROY:
        .byte   $20
LE445:  rol     a
CMD_DEL:dec     $CA,x
        bne     CMD_DESTROY
LE44A:  jsr     XCUROFF
        ldx     $F2
        jsr     LEE69
LE452:  jsr     XCURON
        ldx     #$00
        ldy     #$26
        lda     BASIC11_FLG
        and     #$20
        beq     LE462
        ldy     #$28
LE462:  sty     $F5
LE464:  jsr     LD843
        bpl     LE464
        cmp     #$14
        beq     LE490
        cmp     #$7F
        bne     LE47F
        txa
        beq     LE464
        jsr     LEE73
        lda     $C075
        jsr     XAFCAR
        lda     #$08
LE47F:  cmp     #$0E
        bne     LE488
        jsr     LEE69
        beq     LE43C
LE488:  cmp     #$04
        beq     LE490
        cmp     #$1A
        bne     LE495
LE490:  jsr     XAFCAR
LE493:  bne     LE464
LE495:  cmp     #$20
        bcc     LE4AD
        jsr     XAFCAR
        inx
        cpx     $F2
        bne     LE464
        bit     $F3
        bvc     LE44A
        dex
        jsr     LEE73
        ldy     #$06
        bne     LE504
LE4AD:  ldy     #$00
        cmp     #$0D
        beq     LE4FC
        iny
        cmp     #$1B
        beq     LE4FC
        iny
        cmp     #$08
        bne     LE4C6
        txa
        beq     LE4FC
        dex
        jsr     LEE73
        bne     LE464
LE4C6:  iny
        cmp     #$09
        bne     LE4D9
        inx
        cpx     $F2
        beq     LE4D5
        jsr     LEE76
        bne     LE493
LE4D5:  dex
        jmp     LEDFC

LE4D9:  iny
        cmp     #$0A
        bne     LE4ED
        clc
        txa
        adc     $F5
        bcs     LE4FC
        cmp     $F2
        bcs     LE4FC
        tax
        lda     #$0A
        bne     LE490
LE4ED:  iny
        cmp     #$0B
        bne     LE493
        txa
        sbc     $F5
        bcc     LE4FC
        tax
        lda     #$0B
        bne     LE490
LE4FC:  cpy     #$02
        bcc     LE504
        lda     $F3
        bmi     LE493
LE504:  sty     $F4
        jsr     XCUROFF
LE509:  inx
        cpx     $F2
        bcs     LE513
        jsr     LEE76
        bne     LE509
LE513:  lda     $F2
        jsr     LD264
        ldy     $F2
LE51A:  sty     $F5
        ldy     BASIC11_Y_TEXT
        lda     ($12),y
        cmp     #$20
        bcs     LE527
        ora     #$80
LE527:  ldy     $F5
        dey
        php
        sta     ($D1),y
        jsr     LEE73
        plp
        bne     LE51A
        ldx     $F2
        .byte   $20
        .byte   $76
CMD_REN:inc     LD0CA
        .byte   $FA
        asl     $F3
        asl     $F3
        ldy     $F2
LE541:  dey
        lda     ($D1),y
        cmp     $C075
        bne     LE561
        lda     #$20
        bit     $F3
        bpl     LE551
        sta     ($D1),y
LE551:  bvc     LE559
        jsr     XAFCAR
        jsr     LEE73
LE559:  jsr     LEE73
LE55C:  tya
        bne     LE541
        .byte   $24
LE560:  iny
LE561:  jsr     LEE76
        cpy     $F2
        bne     LE560
        rts

LE569:  txa
        beq     LE572
        jsr     LEE73
        dex
        bne     LE569
LE572:  rts

        lda     #$08
        .byte   $2C
LE576:  lda     #$09
        .byte   $24
LE579:  pla
        pha
        jsr     XAFCAR
        lda     BASIC11_FLG
        and     #$20
LE583:  bne     LE58C
        lda     BASIC11_Y_TEXT
        and     #$FE
        beq     LE579
LE58C:  pla
        rts

        ldy     #$02
LE590:  lda     $D0,y
        sta     ($B8),y
        dey
        bpl     LE590
        rts

        jsr     LD216
        jsr     LD2D2
        jsr     LD22C
        jsr     LD224
        jsr     LD274
        sta     $22
        jsr     LDACE
        lda     #$30
        ldy     #$2B
        sty     $D7
        sta     $D8
        sta     $D9
        sta     $C5
LE5B9:  ldx     #$09
LE5BB:  sta     $CD,x
        dex
        bne     LE5BB
        lda     STACK
        cmp     #$2D
        beq     LE5C9
        lda     #$2B
LE5C9:  sta     $C4
        stx     $F4
        stx     $F5
        lda     #$20
        sta     $F6
        ldy     #$01
        sty     $F2
        dey
        .byte   $2C
LE5D9:  ldx     #$09
LE5DB:  iny
LE5DC:  lda     STACK,y
        beq     LE606
        cmp     #$2E
        beq     LE5D9
        cmp     #$45
        beq     LE5F4
        sta     $C5,x
        cpx     #$09
        bcs     LE5F1
        sty     $F2
LE5F1:  inx
        .byte   $D0
LE5F3:  .byte   $E7
LE5F4:  lda     STACK+1,y
        sta     $D7
        .byte   $B9
        .byte   $02
LE5FB:  .byte   $01
CMD_SEARCH:
        tax
        lda     STACK+3,y
        beq     LE604
        sta     $D9
LE604:  stx     $D8
LE606:  ldx     $F2
        ldy     #$08
LE60A:  lda     $C4,x
        dex
LE60D:  bpl     LE611
        lda     #$20
LE611:  sta     $C5,y
        dey
        bpl     LE60A
        .byte   $2C
LE618:  sty     $F5
        ldy     $F4
        cpy     $22
        bne     LE648
        lda     #$00
        sta     $D7
        jsr     LD39E
        beq     LE641
        lda     $F5
        jsr     LD264
        tay
LE62F:  dey
        lda     BUF1,y
        sta     ($D1),y
LE635:  tya
        bne     LE62F
        .byte   $20
        .byte   $2C
LE63A:  .byte   $D2
        .byte   $20
LE63C:  sec
        .byte   $D2
        jmp     LE8D6

LE641:  lda     #$00
        ldy     #$C1
        jmp     XAFSTR

LE648:  jsr     LF02B
        cmp     #$5E
        bne     LE668
        ldx     #$FD
LE651:  lda     $FFDA,x
        .byte   $2C
LE655:  lda     #$20
        .byte   $2C
LE658:  lda     $C4
        sta     BUF1,y
        iny
        bne     LE663
        jmp     LE977

LE663:  inx
        bne     LE651
        beq     LE618
LE668:  cmp     #$2B
        beq     LE658
        cmp     #$2D
        bne     LE678
        lda     STACK
        lsr     a
        bcs     LE658
        bcc     LE655
LE678:  cmp     #$23
        bne     LE683
        jsr     LEFA7
LE67F:  ldx     #$09
        bne     LE693
LE683:  cmp     #$25
        bne     LE6B9
        jsr     LEFA7
        cmp     $F2
        bcc     LE6B3
        lda     #$09
        sbc     $F3
        tax
LE693:  dec     $F3
        bpl     LE69A
        jmp     LEF18

LE69A:  lda     $C5,x
        and     #$7F
        sta     BUF1,y
        iny
        beq     LE6B6
        inx
        bne     LE693
        jsr     LF02B
        sbc     #$30
        sta     $F3
        cmp     #$0A
        bcs     LE6B3
        rts

LE6B3:  jmp     LDE20

LE6B6:  jmp     LE977

LE6B9:  cmp     #$21
        bne     LE6FC
        jsr     LEFA7
        sec
        lda     #$09
        .byte   $E5
LE6C4:  .byte   $F3
LE6C5:  sta     $F3
        tax
        lda     $C5,x
        cmp     $F6
        beq     LE728
        lda     #$30
        inx
LE6D1:  inx
        cpx     #$12
        beq     LE6DA
        sta     $C5,x
        bne     LE6D1
LE6DA:  ldx     $F3
        inx
        lda     $C5,x
        cmp     #$35
LE6E1:  lda     #$30
LE6E3:  sta     $C5,x
LE6E5:  bcc     LE728
        dex
        bmi     LE728
        lda     $C5,x
        cmp     $F6
        bne     LE6F4
        inc     $F2
        lda     #$30
LE6F4:  cmp     #$39
        beq     LE6E1
        adc     #$01
        bcc     LE6E3
LE6FC:  cmp     #$40
        bne     LE707
        jsr     LEFA7
        adc     #$08
        bcc     LE6C5
LE707:  cmp     #$26
        .byte   $F0
LE70A:  .byte   $03
CMD_KEY:jmp     display_char_in final_string

        jsr     LF02B
        cmp     #$30
        bne     LE717
        ora     #$80
LE717:  tax
        ldy     #$00
LE71A:  lda     $C5,y
        .byte   $C5
LE71E:  .byte   $F6
CMD_OUT:bne     LE726
        stx     $C5,y
        iny
        bne     LE71A
LE726:  stx     $F6
LE728:  jmp     LEF1A

        ldy     $F4
        lda     ($91),y
        inc     $F4
        ldy     $F5
        ldx     #$FF
        rts

        jsr     LE7C5
        jsr     CMD_USING
        jmp     LE7D6

LE73F:  .byte   $A2
CMD_WIDTH:
        .byte   $05
LE741:  .byte   $BD
LE742:  .byte   $1A
        .byte   $CD
        .byte   $9D
LE745:  .byte   $DF
        .byte   $BF
        .byte   $BD
LE748:  .byte   $1F
        .byte   $CD
        .byte   $9D
LE74B:  sbc     #$BF
        dex
LE74E:  bne     LE741
        inx
        stx     $C072
        lda     #$41
        ldy     #$4E
        sta     $B4
        sty     $B5
        jsr     LD244
        jsr     LD2BA
        lda     #$E0
        ldy     #$BF
        jsr     LD2AA
        ldx     #$E0
        ldy     #$BF
        .byte   $20
        .byte   $C2
LE76F:  .byte   $D2
        .byte   $AD
        .byte   $1F
LE772:  .byte   $02
        bne     LE778
LE775:  jmp     LD16F

LE778:  rts

        jsr     LF03F
        jsr     LD216
        ldx     #$E5
        ldy     #$BF
        jsr     LD2C2
        ldx     #$00
LE788:  stx     $F2
LE78A:  lda     #$E0
        ldy     #$BF
        jsr     LD2BA
        ldx     $F2
        beq     LE79E
LE795:  .byte   $20
CMD_RANDOM:
        .byte   $F2
        .byte   $D2
        jsr     LD2DA
LE79B:  jmp     LF0A1

LE79E:  jsr     LD2EA
        lda     #$E5
        ldy     #$BF
        jsr     LD2AA
        jsr     LD28A
        tax
        beq     LE7B2
        iny
        bne     LE7B2
        inx
LE7B2:  txa
        ldx     $F2
        .byte   $9D
        .byte   $E2
LE7B7:  .byte   $02
CMD_RESET:
        tya
        sta     BASIC11_PARAMS+1,x
        inx
        inx
        .byte   $E0
LE7BF:  .byte   $02
CMD_PR: beq     LE788
        lsr     $C072
LE7C5:  bcc     LE7D3
        jsr     LD22C
        jsr     LD2FA
        sty     BASIC11_PARAMS+5
CMD_LDIR:
        .byte   $8D
LE7D1:  .byte   $E6
LE7D2:  .byte   $02
LE7D3:  .byte   $20
LE7D4:  .byte   $12
        .byte   $D3
LE7D6:  .byte   $4E
        .byte   $E0
LE7D8:  .byte   $02
CMD_RESTORE:
        bcc     LE778
        jmp     LE97C

        jsr     LF03F
        jsr     LD27F
        stx     $F3
        jsr     LD22C
        jsr     LD27F
        stx     $F4
        lda     #$04
        sta     $F5
        lda     #$00
LE7F4:  .byte   $85
CMD_QUIT:
        .byte   $F6
LE7F6:  ldx     $F6
        txa
        eor     #$01
        sta     $F6
        ldy     $F3,x
        lda     #$00
        jsr     LD2CA
        jsr     LF07F
        lda     #$E0
        ldy     #$BF
        jsr     LD2BA
        lda     #$EA
        ldy     #$BF
        jsr     LD2A2
        ldx     #$E0
        ldy     #$BF
        jsr     LD2C2
        dec     $F5
        bne     LE7F6
        rts

        ldy     #$1B
        bit     $18A0
        bit     $15A0
        bit     $12A0
        bit     $0FA0
        bit     $0CA0
        ldx     #$56
        bne     LE85E
        ldx     #$42
        bit     $56A2
        .byte   $2C
        .byte   $A2
LE83D:  jmp     L09A0

        bne     LE85E
        ldx     #$42
        bit     $56A2
        bit     $4CA2
        ldy     #$06
        bne     LE85E
        ldx     #$42
        .byte   $2C
        .byte   $A2
LE852:  .byte   $47
CMD_STRUN:
        bit     $4CA2
        bit     $51A2
        bit     $56A2
        ldy     #$03
LE85E:  lda     #$C4
        pha
        tya
        pha
        cpx     EXTNB
        beq     LE8B9
        bit     $5BA2
        txa
        pha
        jsr     LEA06
        beq     LE88F
        ldx     #$0C
        jsr     LD36C
        nop
        jsr     LD648
        cli
        php
        lda     #$0B
        jsr     XAFCAR
        plp
        bcc     LE88F
        pla
        cmp     #$5B
        beq     LE88C
        pla
        pla
LE88C:  jmp     LD1DC

LE88F:  jsr     XPMAP
        lda     $C207
        sta     $C04B
        lda     $C20A
        .byte   $D0
LE89C:  .byte   $D0
CMD_TKEN:
        ldx     #$FF
        pla
        sta     EXTNB
        sec
LE8A4:  tay
        inx
        sbc     $C207
        beq     LE8AD
        bcs     LE8A4
LE8AD:  stx     PISTE
        ldx     #$04
        lda     #$C4
        jsr     XDLOAD
        sec
        .byte   $24
LE8B9:  clc
        ror     $C016
        ldx     #$03
LE8BF:  lda     SEDKERN_START,x
        sta     EXTER,x
        dex
        bpl     LE8BF
        lda     EXTNB
        cmp     #$5B
        beq     LE8D2
        jmp     LD39E

LE8D2:  ldx     #$7C
        lda     #$20
LE8D6:  ldy     #$00
        sty     PISTE
        iny
        jsr     XDLOAD
        .byte   $20
LE8E0:  .byte   $9E
CMD_UNTKEN:
        .byte   $D3
        jmp     LC404

        stx     $F5
        sta     $C004
        lda     #$00
        sta     RWBUF
        sei
LE8F0:  sty     SECTEUR
        jsr     XPRSEC
        inc     $C004
        ldy     SECTEUR
        cpy     $C04B
        bcc     LE906
        inc     PISTE
        ldy     #$00
LE906:  iny
        dec     $F5
        bne     LE8F0
        cli
        rts

LE90D:  jmp     LE0E0

        beq     LE939
        jsr     LD44F
        jsr     LD79E
        jsr     LDFE6
        lda     #$00
        ldy     #$C4
        sta     $C052
        sty     $C053
        lda     #$40
        sta     $C04E
        jsr     LE0E5
        lda     $C051
        and     #$20
        beq     LE90D
        lda     #$01
        sta     EXTNB
LE939:  ldy     EXTNB
        dey
        bne     LE90D
        lda     BASIC11_FLG
        pha
        php
        jsr     LDFDE
        lda     #$B8
        ldy     #$BB
        sta     $F2
LE94D:  sty     $F3
        lda     #$E8
        ldy     #$C3
        sta     $F4
        sty     $F5
        ldx     #$04
        ldy     #$18
LE95B:  lda     ($F4),y
        sta     ($F2),y
        iny
        bne     LE95B
        inc     $F3
        inc     $F5
        dex
        bne     LE95B
        jsr     LF327
        jsr     LF309
LE96F:  jsr     XCURON
        cli
        jsr     LD845
        .byte   $10
LE977:  .byte   $FB
        sei
        cmp     #$03
        .byte   $F0
LE97C:  pla
        .byte   $C9
LE97E:  .byte   $7F
CMD_ERR:bne     LE996
        lda     #$08
        jsr     LF2EC
        bmi     LE96F
        jsr     LF2CA
        bne     LE9A2
        lda     #$09
        jsr     XAFCAR
LE992:  lda     #$7F
        bne     LE99A
LE996:  cmp     #$20
LE998:  .byte   $90
CMD_ERRGOTO:
        asl     a
LE99A:  jsr     XAFCAR
        lda     #$08
        jsr     XAFCAR
LE9A2:  lda     #$09
        cmp     #$08
        bcc     LE99A
        cmp     #$0C
        beq     LE96F
        bcc     LE9C0
        .byte   $C9
LE9AF:  .byte   $0E
CMD_ERROR:
        beq     LE96F
        cmp     #$0D
        bne     LE99A
        lda     #$09
LE9B8:  .byte   $20
        .byte   $EC
LE9BA:  .byte   $F2
CMD_RESUME:
        jsr     LF2CA
        beq     LE9B8
LE9C0:  jsr     LF2EC
        jsr     LF2CA
        bne     LE9C0
        beq     LE96F
        pha
        jsr     XCUROFF
        clc
        lda     $12
        adc     #$30
        sta     $F8
        lda     $13
        adc     #$08
        sta     SEDORIC_FTYPE
        ldy     BASIC11_Y_TEXT
        lda     ($F8),y
        tay
        pla
        cpy     #$7F
        rts

        plp
        jsr     LF325
        jmp     LF320

LE9EC:  .byte   $46
CMD_EXT:.byte   $F2
        .byte   $20
LE9EF:  rol     a
CMD_VISUHIRES:
        dec     $AC,x
LE9F2:  pla
CMD_STATUS:
        .byte   $02
        .byte   $C0
LE9F5:  .byte   $01
CMD_PROT:
        beq     CMD_SYSTEM
LE9F8:  .byte   $C0
CMD_UNPROT:
        .byte   $1B
        .byte   $D0
LE9FB:  asl     a
CMD_SYSTEM:
        bit     $F2
LE9FE:  .byte   $30
CMD_CHKSUM:
        php
        lda     BUF2,y
        sta     ($F5),y
        .byte   $CC
LEA06:  .byte   $4F
        cpy     #$D0
        sbc     $68,x
        tay
        jsr     LE228
        bcs     LEA4E
        tya
        tax
        lda     $C072
        bpl     LEA25
        lsr     $C072
        lda     #$00
        .byte   $8D
LEA1E:  lsr     $A5C0
        sbc     $518D,y
        .byte   $C0
LEA25:  jmp     LE0FA

        iny
        iny
        .byte   $D0
LEA2B:  ora     $03AD,x
        cpy     #$48
LEA30:  lda     $C004
        pha
        .byte   $AD
        brk
LEA36:  cmp     ($AC,x)
        ora     ($C1,x)
LEA3A:  .byte   $F0
CMD_SWAP:
        .byte   $0F
        jsr     LDA5D
        pla
        sta     $C004
        pla
        sta     RWBUF
LEA47:  ldy     #$02
LEA49:  clc
LEA4A:  rts

        sec
        pla
        pla
LEA4E:  cli
        rts

        lda     BUF1,y
        sta     PISTE
        lda     $C101,y
        sta     SECTEUR
        bit     $C04D
        bvs     LEA4A
        jmp     XPRSEC

        clc
        bit     $38
        ldx     $C027
        ldy     $C30F,x
        bmi     LEAD0
        tya
        rol     a
        rol     a
        bpl     LEA77
        jmp     LE5F3

LEA77:  jsr     LE5DC
        lda     $C30C,x
        pha
LEA7E:  .byte   $BD
CMD_USER:
        ora     $48C3
        sec
        lda     $C302
        sbc     #$10
        sta     $C302
        tay
        lda     #$10
        sta     $F2
LEA90:  lda     BUF3,y
        stx     $F3
        cpy     $F3
        beq     LEA9C
        sta     BUF3,x
LEA9C:  lda     #$00
        sta     BUF3,y
        inx
        iny
        dec     $F2
        bne     LEA90
        pla
        tay
        pla
LEAAA:  jsr     LDA5D
        lda     PISTE
        ldy     SECTEUR
        jsr     XDETSE
        ldx     #$02
LEAB8:  lda     BUF1,x
        cmp     #$FF
        beq     LEADC
        inx
        bne     LEAB8
        lda     BUF1
        ldy     $C101
        bne     LEAAA
LEACA:  jsr     XSMAP
        jmp     XSCAT

LEAD0:  bcs     LEAD5
        jsr     LDAB4
LEAD5:  ldx     #$09
        jsr     LD36C
        sec
        rts

LEADC:  lda     $C108,x
        sta     $F5
        lda     $C109,x
        sta     $F6
LEAE6:  txa
        clc
        adc     #$0A
LEAEA:  tax
LEAEB:  txa
        pha
        lda     BUF1,x
        ldy     $C101,x
        jsr     XDETSE
        pla
        tax
        inx
        inx
        bne     LEB12
        lda     BUF1
        ldy     $C101
        beq     LEACA
        jsr     LDA5D
        lda     PISTE
        ldy     SECTEUR
        .byte   $20
LEB0E:  ora     $DD,x
        ldx     #$02
LEB12:  ldy     $F5
        bne     LEB18
        dec     $F6
LEB18:  dec     $F5
        lda     $F5
        ora     $F6
        bne     LEAEB
        beq     LEAB8
LEB22:  jsr     LDAB4
CMD_NUM:lda     #$20
        sta     $C04C
        ldx     $C027
        lda     $C30F,x
        php
        and     #$0F
        tay
        lda     $C30E,x
        jsr     LD756
        lda     #$20
        plp
        bpl     LEB41
        lda     #$50
LEB41:  jmp     XAFCAR

        jsr     LD451
        php
        sei
        lda     #$14
        ldy     #$01
        jsr     LDA5D
        jsr     XPMAP
        ldx     #$05
        jsr     LD36C
        lda     $C028
        jsr     LD60E
        ldx     #$06
        ldy     $C20A
        beq     LEB77
        ldx     #$11
        dey
        beq     LEB77
        ldx     #$12
        jsr     LD36C
        lda     $C20A
        jsr     XAFCAR
        ldx     #$13
LEB77:  jsr     LD36C
        ldy     #$EB
LEB7C:  lda     $C01E,y
        jsr     XAFCAR
        iny
        bne     LEB7C
        jsr     LE41F
        jsr     LD206
        jsr     XTVNM
        bne     LEB9B
LEB90:  .byte   $F0
CMD_ACCENT:
        .byte   $33
LEB92:  sei
        jsr     LE41F
        jsr     LDB41
        beq     LEBC2
LEB9B:  jsr     LE583
        jsr     LDB41
        beq     LEBBF
LEBA3:  jsr     LD628
        jsr     LD628
        jsr     LE583
        cli
        jsr     LD302
        bpl     LEB92
LEBB2:  jsr     LD302
        bpl     LEBB2
        cmp     #$20
        beq     LEB92
        cmp     #$1B
        bne     LEBB2
LEBBF:  jsr     LD206
LEBC2:  jsr     LD206
        lda     #$20
        sta     $C04C
        lda     $C202
        ldy     $C203
        jsr     LD756
        ldx     #$07
        jsr     LD36C
        lda     #$00
        sta     $C04C
LEBDD:  .byte   $A9
CMD_AZERTY:
        .byte   $44
        .byte   $2C
LEBE0:  .byte   $09
CMD_QWERTY:
        .byte   $C2
        bmi     LEBE6
        lda     #$53
LEBE6:  jsr     XAFCAR
        lda     #$2F
LEBEB:  .byte   $20
CMD_LCUR:
        rol     a
        dec     $AD,x
        asl     $C2
        ldx     #$01
        .byte   $20
LEBF4:  .byte   $50
CMD_HCUR:
        .byte   $D7
        lda     #$2F
        jsr     XAFCAR
LEBFB:  lda     $C207
        jsr     LD74E
        lda     #$29
LEC03:  .byte   $20
CMD_LBRACKET:
        rol     a
        dec     $EA,x
        nop
        nop
        lda     #$20
        sta     $C04C
        lda     $C204
        ldy     $C205
        ldx     #$02
        jsr     LD758
        plp
        ldx     #$08
        jsr     LD36C
        bit     $02F1
        bmi     LEC30
        lda     BASIC11_FLG
        and     #$20
        bne     LEC30
        .byte   $AD
        .byte   $24
LEC2D:  .byte   $C0
CMD_INSTR:
        bpl     LEC33
LEC30:  jmp     LD206

LEC33:  rts

LEC34:  jmp     LDE23

        jsr     LE60D
        bne     LEC34
        ldx     #$09
        jsr     LD34D
        sec
        bcs     LEC4C
        sec
        bit     $18
        php
        jsr     LD451
        plp
LEC4C:  ror     $C072
        jsr     LD9B0
        bne     LEC57
        jmp     LE0DD

LEC57:  jsr     LD7A0
        bcc     LEC73
        jsr     LE264
        bcc     LECA7
LEC61:  rts

LEC62:  jsr     XAFCAR
LEC65:  jsr     LD206
        jsr     LDB41
LEC6B:  ldx     $C027
        jsr     LDB48
        beq     LECA7
LEC73:  jsr     LDAB4
        bit     $C072
        bmi     LEC9B
        ldx     #$0A
        jsr     LD36C
LEC80:  jsr     LD302
        jsr     LD3A1
        cmp     #$4E
        beq     LEC62
        cmp     #$1B
        beq     LEC61
        cmp     #$59
        bne     LEC80
        .byte   $20
LEC93:  rol     a
CMD_LINPUT:
        dec     $20,x
        asl     $D2
        jsr     LDAB4
LEC9B:  jsr     LE266
        bcs     LEC65
        ldx     #$0B
        jsr     LD36C
        bmi     LEC6B
LECA7:  lda     #$00
        sta     $F5
        lda     LE7D1
        ldx     LE7D2
        clc
        .byte   $24
LECB3:  sec
        sbc     #$0F
        inc     $F5
        bcs     LECB3
        dex
        bpl     LECB3
        ldx     LE7D3
        cpx     $F5
        beq     LEC61
        dex
        stx     $F5
        jsr     CMD_REN
        nop
LECCB:  dec     $F5
        bne     LECD5
        sta     $C05C
        sty     $C05D
LECD5:  jsr     LDA5D
        lda     BUF1
        ldy     $C101
        bne     LECCB
        ldy     #$10
        sty     $F5
LECE4:  jsr     LDBA5
        ldy     $F5
LECE9:  cpy     $C102
        beq     LED02
        lda     BUF1,y
        sta     BUF3,x
        iny
        inx
        stx     $C302
        bne     LECE9
        sty     $F5
        jsr     XSCAT
        beq     LECE4
LED02:  jsr     XSCAT
        dec     LE7D3
        lda     $C05C
        ldy     $C05D
        jsr     LDA63
        lda     BUF3
        pha
        lda     $C301
        pha
        lda     #$00
        sta     BUF3
        sta     $C301
        jsr     XSVSEC
        pla
        tay
        pla
        ldx     LE7D3
        cpx     #$01
        bcc     LED31
LED2E:  jsr     XDETSE
LED31:  jsr     XSMAP
        .byte   $4C
        .byte   $A7
LED36:  cpx     $AD
        .byte   $27
        cpy     #$48
        ldx     DRIVE
        lda     $F638,x
        ldy     $F63C,x
        jsr     LE576
        adc     #$08
        tay
        ldx     #$08
LED4C:  lda     $C303,x
        cmp     LE6E5,y
        bne     LED66
        dey
        dex
        bpl     LED4C
        pla
        sta     $C027
        ldx     DRIVE
        lda     $F638,x
        ldy     $F63C,x
        rts

LED66:  pla
        ldx     DRIVE
        ldy     #$04
        tya
        sta     $F63C,x
        lda     #$14
        sta     $F638,x
        rts

        jsr     LDA63
        lda     DRIVE
        asl     a
        asl     a
        asl     a
        adc     DRIVE
        rts

        ldx     $C027
        lda     $C30F,x
        rol     a
        rol     a
        bmi     LED91
        jsr     LE322
        rts

LED91:  ldy     #$08
        jsr     LDAC3
        lda     #$D2
        ldy     #$E5
        jsr     XAFSTR
        rts

        stx     SEDORIC_FTYPE
        lda     $C30F,x
        rol     a
        rol     a
        bmi     LEDAC
        bit     $07
        jmp     LC4D7

LEDAC:  jsr     LDAB4
        lda     #$C5
        ldy     #$E5
        jsr     XAFSTR
        jmp     LC57A

        stx     DRVDEF
        ldy     #$2E
        jsr     LE78A
        jsr     LC644
        rts

        jsr     L4F4E
        .byte   $54
        jsr     L4C41
        jmp     L574F

        eor     $44
        brk
        jsr     L2020
        jsr     L5B20
        rol     a
        eor     a:$20,x
        lda     LE7D1
        .byte   $D0
LEDE0:  .byte   $03
        dec     LE7D2
        dec     LE7D1
        lda     $C204
        bne     LEDEF
        dec     $C205
LEDEF:  dec     $C204
        rts

        lda     #$C5
        ldy     #$E5
        jsr     XAFSTR
        sec
        rts

LEDFC:  jsr     LD451
        jsr     LDB2D
        php
        lda     #$00
        plp
        beq     LEE0A
        lda     #$01
LEE0A:  jmp     LD7D5

        ldy     DRVDEF
        jsr     LD39E
        beq     LEE22
        sbc     #$41
        cmp     #$04
        bcs     LEE22
        tay
        jsr     LD7C0
        jmp     LD398

LEE22:  jsr     LD7C0
        jmp     LD39E

        jmp     LE0DD

        jmp     LE2D2

        lda     #$14
        ldy     #$02
        sty     $2F
        rts

        ldy     #$03
        jmp     LDC8B

        clc
        bit     $38
        pha
        tya
        pha
        lda     PISTE
        pha
        lda     SECTEUR
        pha
        ldx     #$06
LEE4A:  lda     $C202,x
        pha
        dex
        bpl     LEE4A
        bcs     LEE5B
        jsr     LE635
        jsr     XPMAP
        beq     LEE67
LEE5B:  stx     $2F
        jsr     LDC89
        lda     #$14
        ldy     #$03
        jsr     LDA50
LEE67:  ldx     #$00
LEE69:  pla
        sta     $C202,x
        inx
        cpx     #$07
        bcc     LEE69
        pla
LEE73:  sta     SECTEUR
LEE76:  pla
        sta     PISTE
        pla
        tay
        pla
        sec
        rts

LEE7F:  ldx     #$00
LEE81:  lda     $C210,x
        bne     LEE97
        inx
        cpx     #$F0
        bne     LEE81
        bit     $2F
        .byte   $10
LEE8E:  .byte   $03
        jmp     LDC78

        jsr     LE63C
        bcs     LEE7F
LEE97:  .byte   $AD
LEE98:  .byte   $02
CMD_USING:
        .byte   $C2
        bne     LEE9F
        dec     $C203
LEE9F:  dec     $C202
        bit     $2F
        bmi     LEEA9
        jmp     LDC90

LEEA9:  lda     #$60
        sta     LDCA8
        jsr     LDC90
        lda     #$A9
        sta     LDCA8
        txa
        ldx     #$00
        clc
        adc     #$F0
        bcc     LEEBF
        inx
LEEBF:  stx     $F3
        jmp     LDCAD

        ror     a
        ldx     $F3
        bne     LEECD
        cmp     #$F0
        bcc     LEEDC
LEECD:  bit     $2F
        bmi     LEED4
        jsr     LE63C
LEED4:  sec
        sbc     #$F0
LEED7:  tax
        sec
        jmp     LDD0E

LEEDC:  bit     $2F
        bpl     LEED7
        jsr     LE63A
        bcs     LEED7
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        brk
        jsr     LE94D
        bcc     LEF19
        lda     V1T1L+1
        sta     V1T1+1
        lda     #$40
LEF18:  .byte   $2C
LEF19:  .byte   $A9
LEF1A:  brk
        sta     V1ACR
        rts

        jsr     LD27F
        php
        sei
        stx     V1DRA
        lda     V1DRB
        and     #$EF
        sta     V1DRB
        ora     #$10
        sta     V1DRB
        plp
        lda     #$02
LEF37:  bit     V1IFR
        beq     LEF37
        rts

        jmp     LDE23

        ldy     #$03
        bit     $06A0
        bit     L09A0
        bit     $0CA0
        bit     $0FA0
        .byte   $2C
; $ef4f
display_exp_scientific_notation:
        ldy     #$12
        nop
        nop
        nop
        .byte   $EA
        nop
        nop
        nop
        nop
        nop
; $ef5a
display_char_in final_string:
        ldx     #$65
        jmp     LF15E

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        ldy     #$03
        bit     $06A0
        bit     L09A0
        bit     $0CA0
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        ldx     #$6A
        jmp     LF15E

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        beq     LEF9E
        jsr     LD216
        jmp     LD2E2

LEF9E:  lda     V1T1
        ldy     V1T1+1
        sta     $D0
        .byte   $84
LEFA7:  cmp     ($AD),y
        php
        .byte   $03
        ldy     V1T2+1
        sta     $D2
        sty     $D3
        jmp     LE79B

LEFB5:  jmp     LDE23

        bne     LEFB5
        sei
        lda     #$00
        jmp     L04AD

        jsr     LE94D
        bcc     LEFD6
        ldy     ATMORI
        bne     LEFCD
        ror     $02F1
LEFCD:  jmp     LD1BC

        brk
        brk
        brk
        brk
        brk
        brk
LEFD6:  jmp     LD1C4

        php
        ldx     $9A
        ldy     $9B
        plp
        beq     LEFEB
        jsr     LD2FA
        jsr     LD19C
        ldx     $CE
        ldy     $CF
LEFEB:  txa
        bne     LEFEF
        dey
LEFEF:  dex
        stx     $B0
        sty     $B1
        rts

        bne     LEFB5
        lda     $043E
        ldy     $043F
        sta     BASIC11_INTERPRETER_VECTOR
        sty     BASIC11_INTERPRETER_VECTOR+1
        php
        sei
        bit     ATMORI
        bpl     LF028
        lda     #$22
        ldy     #$EE
        sta     BASIC11_IRQ_VECTOR
        sty     BASIC11_IRQ_VECTOR+1
        lda     #$78
        ldy     #$EB
        sta     BASIC11_KEYBOARD_ZGET_VECTOR
        sty     BASIC11_KEYBOARD_ZGET_VECTOR+1
        lda     #$B2
        ldy     #$F8
        sta     BASIC11_X
        sty     BASIC11_X+1
        plp
        rts

LF028:  lda     #$03
        .byte   $A0
LF02B:  cpx     $298D
        .byte   $02
        sty     $022A
        lda     #$30
        .byte   $A0
LF035:  .byte   $F4
CMD_LUSING:
        sta     $022C
        sty     $022D
        plp
        rts

        .byte   $AD
LF03F:  .byte   $13
        cpy     #$AC
        .byte   $14
        cpy     #$85
        sbc     #$84
        nop
        lda     $C011
        ldy     $C012
        sta     $A8
        sty     $A9
        rts

        jsr     LD25C
        jsr     LD224
        jsr     LD274
        cmp     #$44
        bcs     LF09A
        tax
        tay
        dey
LF063:  lda     ($91),y
        sta     $35,y
        dey
        bpl     LF063
LF06B:  iny
        lda     LCD10,y
        sta     $35,x
        inx
        cpy     #$0A
        bne     LF06B
        lda     $E9
LF078:  .byte   $A4
CMD_LINE:
        nop
        sta     $C013
        .byte   $8C
        .byte   $14
LF07F:  cpy     #$A5
        tay
        ldy     $A9
        sta     $C011
        sty     $C012
        lda     #$34
        ldy     #$00
        ldx     #$3A
        sta     $E9
        sty     $EA
        stx     $34
        dey
        sty     $A9
        rts

LF09A:  jmp     LE977

        jsr     LD25C
        .byte   $20
LF0A1:  sec
        .byte   $D2
        jsr     LD274
        cmp     #$50
        bcs     LF09A
        tax
        tay
LF0AC:  lda     ($91),y
        sta     $35,y
        dey
        bpl     LF0AC
        iny
        sty     $35,x
        lda     $E9
        pha
        lda     #$35
        sta     $E9
        jsr     LD194
        pla
        sta     $E9
        tya
        sec
        sbc     #$05
        jsr     LD264
        ldy     $D0
        nop
LF0CE:  lda     $35,y
        sta     ($D1),y
        dey
        bpl     LF0CE
        ldy     #$02
LF0D8:  lda     $D0,y
        sta     ($B6),y
LF0DD:  dey
CMD_BOX:bpl     LF0D8
LF0E0:  rts

        jsr     LD238
        jsr     LD274
        tax
        beq     LF0E0
        sta     $F3
        ldx     #$00
        ldy     #$00
LF0F0:  lda     #$E9
        sta     $16
        lda     #$C0
        sta     $17
        sty     $F2
        lda     ($91),y
        bpl     LF129
        and     #$7F
        beq     LF115
        sta     $26
        ldy     #$00
LF106:  inc     $16
        bne     LF10C
        inc     $17
LF10C:  jsr     DO_EXEVEC
        bpl     LF106
        dec     $26
        bne     LF106
LF115:  ldy     #$01
        inx
        beq     LF138
        jsr     DO_EXEVEC
        php
        and     #$7F
LF120:  .byte   $9D
CMD_VUSER:
        .byte   $FF
        .byte   $C0
LF123:  iny
CMD_DKEY:
        plp
        .byte   $10
LF126:  .byte   $F0
CMD_DSYS:
        bmi     LF12F
LF129:  inx
CMD_DNUM:
        beq     LF138
LF12C:  .byte   $9D
CMD_INIST:
        .byte   $FF
        .byte   $C0
LF12F:  .byte   $C6
CMD_TRACK:
        .byte   $F3
        beq     LF13B
        ldy     $F2
LF135:  iny
CMD_MOVE:
        bne     LF0F0
LF138:  .byte   $4C
CMD_DTRACK:
        .byte   $77
        .byte   $E9
LF13B:  txa
CMD_MERGE:
        jsr     LD264
        ldy     $D0
LF141:  dey
CMD_DELETE:
        .byte   $B9
        brk
LF144:  .byte   $C1
CMD_DNAME:
        sta     ($D1),y
LF147:  tya
CMD_CHANGE:
        bne     LF141
        jmp     LE8D6

LF14D:  .byte   $A0
CMD_RENUM:
        .byte   $02
        .byte   $B1
LF150:  .byte   $E9
CMD_BACKUP:
        and     #$DF
LF153:  .byte   $D9
CMD_SEEK:
        .byte   $2E
        .byte   $CD
LF156:  .byte   $D0
CMD_COPY:
        ora     $88
LF159:  .byte   $10
CMD_SYS:.byte   $F4
        bmi     LF16C
        .byte   $A0
LF15E:  .byte   $02
LF15F:  lda     ($E9),y
        and     #$DF
        cmp     LCD2B,y
        bne     LF174
LF168:  dey
CMD_INIT:
        bpl     LF15F
        clc
LF16C:  php
        ldy     #$03
        jsr     LD1E3
        plp
        rts

LF174:  jmp     LDE23

        ldx     #$12
        jmp     LD67E

LF17C:  jmp     LDE20

        jsr     LE94D
        lda     #$00
        sta     $C01C
        sta     $C01B
        ror     a
        sta     $C018
        ldy     #$37
        ldx     #$FF
        sty     $C019
        stx     $C01A
        rts

        jsr     LD2FA
        sta     $C01C
        sty     $C01B
        jsr     LD19C
        ldx     $CF
        ldy     $CE
        bne     LF1AC
        dex
LF1AC:  dey
        jmp     LE992

        jsr     LD27F
        cpx     #$32
        bcc     LF17C
        dex
        jmp     LD67E

        beq     LF1C3
        lda     #$90
        jsr     LD22E
        iny
LF1C3:  php
        lda     $C021
        ldy     $C022
        sta     $E9
        sty     $EA
        lda     NOLIGN
        ldy     NOLIGN+1
        sta     $A8
        sty     $A9
        plp
        beq     LF1DE
        jmp     LD1DC

LF1DE:  dec     $EA
        ldy     #$FF
        lda     ($E9),y
        .byte   $C9
XDLOAD: .byte   $3A
        beq     LF1EA
        ldy     #$FB
LF1EA:  jmp     LD1E3

        ldy     #$03
        bit     $51A0
        bit     $54A0
        bit     $57A0
        bit     $5AA0
        bit     $5DA0
        bit     $79A0
        ldx     #$60
        jmp     LF15E

        ldy     #$02
        lda     DRVSYS
        sta     DRIVE
        .byte   $A9
LF20F:  brk
CMD_WINDOW:
        jsr     LDA60
        ldx     $C216
        bne     LF21D
        ldx     $C2DA
        cpx     #$34
LF21D:  rts

        pha
        lda     #$20
        and     V1DRB
        sta     LEA2B
        pla
        and     #$DF
        ora     #$00
        sta     V1DRB
        rts

        inx
        stx     $F2
        ldx     #$3F
        rts

        stx     $30
        jmp     XCURON

        jsr     LD238
        sta     $B8
        sty     $B9
        lda     $28
        pha
        lda     $29
        pha
        jsr     LD22C
        jsr     LD238
        sta     $91
        sty     $92
        pla
        cmp     $29
        bne     LF277
        pla
        cmp     $28
        bne     LF277
        ldy     #$01
        bit     $28
        bmi     LF268
        bit     $29
        bmi     LF269
        iny
        iny
LF268:  iny
LF269:  lda     ($91),y
        tax
        lda     ($B8),y
        sta     ($91),y
        txa
        sta     ($B8),y
        dey
        bpl     LF269
        rts

LF277:  ldx     #$0B
        jmp     LD67E

LF27C:  jmp     LDE20

        jsr     LD27F
        txa
        cmp     #$04
        bcs     LF27C
        asl     a
        adc     $D4
        sta     $F6
        tax
        lda     $C068,x
        sta     $F7
        lda     #$00
        ldx     #$03
LF296:  sta     $F2,x
        dex
        bpl     LF296
LF29B:  jsr     LD39E
        cmp     #$2C
        bne     LF2E8
        jsr     LD398
        ldy     #$04
LF2A7:  cmp     MISC2,y
        beq     LF2B1
        dey
        bpl     LF2A7
        bmi     LF2E8
LF2B1:  jsr     LD398
        cpy     #$04
        bne     LF2DA
        jsr     LD2FA
        ldx     $F6
        sta     $C067,x
        tya
        sta     $C066,x
        jsr     LD39E
        beq     LF2D3
        .byte   $20
LF2CA:  bit     $A9D2
        .byte   $4F
        jsr     LD22E
        ldx     #$80
LF2D3:  txa
        ldx     $F6
        sta     $C068,x
        rts

LF2DA:  tya
        pha
        jsr     LD27F
        pla
        tay
        stx     $F2,y
        jsr     LD39E
        bne     LF29B
LF2E8:  ldy     $F4
        lda     $F5
LF2EC:  pha
        ldx     $F6
        lda     $C066,x
        sta     EXEVEC+1
        lda     $C067,x
        sta     EXEVEC+2
        lda     $F2
        ldx     $F3
        bit     $D0
        lda     ($20,x)
        ldy     $DA
        ldy     #$06
LF307:  lda     ($00),y
LF309:  sta     $C022,y
        iny
        cpy     #$17
        bne     LF307
        jsr     XTVNM
        bne     LF319
        jmp     LE0DD

LF319:  jsr     LDAEE
        jsr     XSMAP
        .byte   $20
LF320:  .byte   $82
        .byte   $DA
        jsr     LF4A8
LF325:  ldy     #$13
LF327:  lda     ($00),y
        sta     PISTE
        iny
        lda     ($00),y
        sta     SECTEUR
        jsr     LF85F
        jmp     XSVSEC

        ldy     #$0A
        inc     $03
        lda     ($02),y
        clc
        adc     #$01
        sta     ($02),y
        iny
        lda     ($02),y
        adc     #$00
        sta     ($02),y
        dec     $03
        ldy     #$15
        lda     ($00),y
        clc
        adc     #$01
        sta     ($00),y
        iny
        lda     ($00),y
        adc     #$00
        sta     ($00),y
        jmp     XLIBSE

        lda     $04
        sta     RWBUF
        lda     $05
        sta     $C004
        rts

        inc     $05
        clc
        ldy     #$02
        lda     ($00),y
        adc     #$01
        sta     ($00),y
        lda     $04
        ldy     $05
        jsr     LF885
        lda     #$01
        sta     $F2
        lda     #$00
        jmp     LF425

        sec
        sbc     $9E
        tax
        tya
        sbc     $9F
        tay
        rts

        jsr     LD24C
        lda     $D4
        ldx     $D3
        bpl     LF3A3
        eor     #$FF
        clc
        adc     #$01
        cpx     #$FF
        beq     LF3A7
LF3A0:  jmp     LDE20

LF3A3:  cpx     #$00
        bne     LF3A0
LF3A7:  jsr     LF473
        jsr     LF4A8
        bmi     LF3D2
        bne     LF3CF
        lda     $C083
        bit     $D3
        bmi     LF3C3
        ldy     #$04
        lda     ($04),y
        pha
        iny
        lda     ($04),y
        tay
        pla
        .byte   $2C
LF3C3:  ldy     #$00
        .byte   $24
LF3C6:  tay
        sta     $F2
        tya
        ldy     $F2
        jmp     LD254

LF3CF:  jmp     LE0E0

LF3D2:  jsr     LFD0E
        beq     LF3C6
        bit     $D3
        bmi     LF3C3
        lda     #$00
        beq     LF3C3
        jsr     LF956
        bne     LF3EA
        jsr     LF96B
        jmp     XPRSEC

LF3EA:  bcs     LF3FD
        jsr     LF91F
        php
        sei
        jsr     LF684
LF3F4:  lda     ($06),y
        sta     ($02),y
        iny
        bne     LF3F4
        plp
        rts

LF3FD:  jsr     LED2E
