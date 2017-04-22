; da65 V2.15
; Created:    2017-04-22 21:38:26
; Input file: SEDKERN.TAP
; Page:       1


        .setcpu "6502"

L0000           := $0000
STACK           := $0100
L0228           := $0228
L0244           := $0244
BASIC11_IRQ_VECTOR:= $0245
NUMBER_OF_COLUMN_FOR_PRINTER:= $0256
NUMBER_OF_LINES_FOR_PRINTER:= $0257
L02B0           := $02B0
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
L0467           := $0467
L046B           := $046B
L0471           := $0471
DO_RAMROM       := $0477                        ; Switch from ROM to Overlay and vice-versa
L0487           := $0487
SED_IRQ         := $0488                        ; Replaces IRQ
SED_COLDSTART   := $04A8                        ; Replaces COLDSTART
DO_IRQRAM       := $04B3                        ; forwards IRQ/NMI from overlay to ROM
L04B4           := $04B4
L04D1           := $04D1
L04E9           := $04E9
EXERAM          := $04EC
EXEVEC          := $04EF
RAMROM          := $04F2
IRQRAM          := $04F5
NMIRAM          := $04F8
MICRODISC_CONTROL_SHADOW:= $04FB                ; Caches the control register as it's write-only
FLAGIF          := $04FC                        ; b7=1 if inside IF
NOERROR         := $04FD                        ; Number of Error
NOLIGN          := $04FE                        ; Line of Error
L2310           := $2310
L4142           := $4142
L414F           := $414F
L4154           := $4154
L4944           := $4944
L4F46           := $4F46
L4F53           := $4F53
L5244           := $5244
L5246           := $5246
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
SEDKERN_START:
        lda     number_of_retry
        lsr     a
LC404:  lda     #$00
        ror     a
        sta     ATMORI
        bpl     LC41B
        lda     #$50
        sta     NUMBER_OF_COLUMN_FOR_PRINTER
        lsr     a
        sta     $31
        sta     $32
        sta     NUMBER_OF_LINES_FOR_PRINTER
        bne     LC421
LC41B:  lda     #$5D
        sta     $31
        sta     $32
LC421:  inc     $02C1
        inc     $02C2
        ldx     #$00
LC429:  lda     LC600,x
        bit     ATMORI
        bpl     LC434
        lda     LC700,x
LC434:  sta     $0400,x
        inx
        bne     LC429
        lda     #$4C
        ldy     #$00
        ldx     #$04
        sta     $EF
        sty     $F0
        stx     $F1
; Modify irq and nmi vector
MODIFY_IRQ_NMI:
        lda     #$88
        ldy     #$C4
        bit     ATMORI
        bpl     LC475
        sta     BASIC11_IRQ_VECTOR
        stx     BASIC11_IRQ_VECTOR+1
        sty     BASIC11_IRQ_VECTOR+3
        stx     $0249
        lda     #$5B
        sta     $023C
        stx     $023D
        lda     #$09
        ldy     #$01
        sta     $024E
        sty     $024F
        lda     #$0F
        ldx     #$70
LC471:  ldy     #$D0
        bne     LC487
LC475:  sta     $0229
        stx     $022A
        sty     $022C
        stx     $022D
        lda     #$07
        ldx     #$E4
        ldy     #$CF
LC487:  sta     $026A
        stx     $02F9
        sty     $02FA
        ldx     #$04
        lda     #$A5
        ldy     #$D0
        sta     IRQ_VECTOR
        sty     IRQ_VECTOR+1
        lda     #$67
        ldy     #$61
        sta     $02F5
        .byte   $8E
        .byte   $F6
LC4A5:  .byte   $02
        sty     $02FC
        stx     $02FD
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
        lda     L0000
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
        .byte   "** WARNING **"

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
LC600:  cmp     #$30
        bcc     LC608
        cmp     #$3A
        bcc     LC63D
LC608:  stx     $0F
        tax
        bmi     LC63B
        sta     $C1
        pla
        tax
        pla
        pha
        cpx     #$F7
        bne     LC61B
        cmp     #$C8
        beq     LC624
LC61B:  cpx     #$58
        bne     LC637
        cmp     #$CA
        bne     LC637
        .byte   $24
LC624:  clc
        ror     FLAGIF
        ldy     #$FF
LC62A:  iny
        lda     ($E9),y
        beq     LC640
        cmp     #$3A
        beq     LC640
        cmp     #$D4
        bne     LC62A
LC637:  txa
        pha
        lda     $C1
LC63B:  ldx     $0F
LC63D:  jmp     LEA41

LC640:  pla
        jsr     L04E9
        jsr     L0467
        asl     FLAGIF
        bcs     LC64F
        jmp     LC8AD

LC64F:  nop
        nop
        nop
        rts

        jsr     DO_RAMROM
        lda     ($16),y
        jmp     DO_RAMROM

        nop
        nop
        nop
        nop
        nop
        nop
        lda     #$8E
        ldy     #$F8
        bne     LC66B
        lda     #$AE
        ldy     #$D3
LC66B:  sta     EXEVEC+1
        sty     EXEVEC+2
        jsr     DO_RAMROM
        jsr     EXEVEC
        php
        pha
        sei
        lda     MICRODISC_CONTROL_SHADOW
        eor     #$02
        sta     MICRODISC_CONTROL_SHADOW
        sta     MICRODISC_CONTROL
        pla
        plp
        rts

        bit     V1IFR
        bvc     LC69C
        pha
        lda     #$04
        and     $026A
        beq     LC698
        inc     $0274
LC698:  pla
        jmp     LEC03

LC69C:  pla
        pla
        sta     $F2
        pla
        tax
        lda     #$36
        ldy     #$D1
        bne     LC66B
        jsr     RAMROM
        pla
        rti

        sta     MICRODISC_CONTROL
        jmp     (RESET_VECTOR)

        clc
        jsr     DO_RAMROM
        pha
        lda     #$04
        pha
        lda     #$A8
        pha
        php
        bcs     LC6C4
        jmp     L0228

LC6C4:  jsr     LF888
        lda     #$17
        ldy     #$EC
        jsr     L046B
        jmp     LC475

        lda     #$04
        pha
        lda     #$F1
        pha
        txa
        pha
        tya
        pha
        jsr     RAMROM
        jmp     LD270

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        jmp     L0487

; $c6ec
DELETE_COMMAND:
        jmp     L0471

        jmp     L0000

        jmp     DO_RAMROM

        jmp     DO_IRQRAM

        jmp     L04B4

        sty     L0000
        brk
        brk
        brk
LC700:  cmp     #$30
        bcc     LC708
        cmp     #$3A
        bcc     LC73D
LC708:  stx     $0F
        tax
        bmi     LC73B
        sta     $C1
        pla
        tax
        pla
        pha
        cpx     #$0E
        bne     LC71B
        cmp     #$C9
        beq     LC724
LC71B:  cpx     #$8A
        bne     LC737
        cmp     #$CA
        bne     LC737
        .byte   $24
LC724:  clc
        ror     FLAGIF
        ldy     #$FF
LC72A:  iny
        lda     ($E9),y
        beq     LC740
        cmp     #$3A
        beq     LC740
        cmp     #$D4
        bne     LC72A
LC737:  txa
        pha
        lda     $C1
LC73B:  ldx     $0F
LC73D:  jmp     LECB9

LC740:  pla
        jsr     L04E9
        jsr     L0467
        asl     FLAGIF
        bcs     LC74F
        jmp     LC8C1

LC74F:  ror     $0252
        rts

        jsr     DO_RAMROM
; $c756
MOVE_COMMAND:
        lda     ($16),y
        jmp     DO_RAMROM

        lda     #$45
        ldy     #$D8
        bne     LC76B
        lda     #$8E
        ldy     #$F8
        bne     LC76B
        lda     #$AE
        ldy     #$D3
LC76B:  sta     EXEVEC+1
        sty     EXEVEC+2
        jsr     DO_RAMROM
        jsr     EXEVEC
        php
        pha
        sei
        lda     MICRODISC_CONTROL_SHADOW
        eor     #$02
        sta     MICRODISC_CONTROL_SHADOW
        sta     MICRODISC_CONTROL
        pla
        plp
        rts

        bit     V1IFR
        bvc     LC79C
        pha
        lda     #$04
        and     $026A
        beq     LC798
        inc     $0274
LC798:  pla
        jmp     LEE22

LC79C:  pla
        pla
        sta     $F2
        pla
        tax
        lda     #$36
        ldy     #$D1
        bne     LC76B
        jsr     RAMROM
        pla
        rti

        sta     MICRODISC_CONTROL
        jmp     (RESET_VECTOR)

        clc
        jsr     DO_RAMROM
        pha
        lda     #$04
        pha
        lda     #$A8
        pha
        php
        bcs     LC7C4
        jmp     L0244

LC7C4:  jsr     LF8B8
        lda     #$17
        ldy     #$EC
        jsr     L046B
        jmp     LC471

        lda     #$04
        pha
        lda     #$F1
        pha
        txa
        pha
        tya
        pha
        jsr     RAMROM
        jmp     LD306

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
        jmp     L0487

        jmp     L0471

        jmp     L0000

        jmp     DO_RAMROM

        jmp     DO_IRQRAM

        jmp     L04B4

        sty     L0000
        brk
        brk
        brk
; Key shortcut table
KEYDEF: .byte   $07,$45,$57,$4B,$00,$18,$07,$08
        .byte   $59,$7B,$06,$09,$00,$42,$41,$52
        .byte   $05,$66,$25,$00,$00,$5B,$27,$00
        .byte   $1B,$3F,$04,$0A,$00,$5E,$3D,$0D
        .byte   $00,$00,$00,$00,$00,$00,$00,$00
        .byte   $01,$00,$08,$00,$00,$00,$22,$FF
        .byte   $6D,$62,$02,$0C,$00,$0F,$72,$00
        .byte   $03,$31,$29,$00,$00,$0E,$1E,$0B
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
        .byte   $46,$35,$2C,$23,$34
LC8AD:  .byte   $36,$37,$8D,$20,$20,$20,$20,$20
        .byte   $20,$44,$4F,$4B,$45,$23,$32,$46
        .byte   $39,$2C,$A3,$20
LC8C1:  .byte   $44,$4F,$4B,$45,$23,$32,$46,$39
        .byte   $2C,$23,$44,$30,$37,$30,$8D,$20
        .byte   $20,$20,$20,$20,$20,$44,$4F,$4B
        .byte   $45,$23,$32,$46,$43,$2C,$A3,$20
        .byte   $20,$44,$4F,$4B,$45,$23,$32,$46
        .byte   $43,$2C,$23,$34,$36,$31,$8D,$20
        .byte   $20,$20,$20,$50,$41,$50,$45,$52
        .byte   $30,$3A,$49,$4E,$4B,$37,$8D,$20
        .byte   $20,$20,$20,$20,$20,$43,$41,$4C
        .byte   $4C,$23,$46,$38,$44,$30,$8D,$20
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$20,$20,$20,$20,$FE,$20
        .byte   $20,$20,$20,$3F,$48,$45,$58,$24
        .byte   $28,$50,$45,$45,$4B,$28,$A3,$20
        .byte   $20,$20,$20,$3F,$48,$45,$58,$24
        .byte   $28,$44,$45,$45,$4B,$28,$A3,$20
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$50,$45,$45,$4B,$28,$A3,$20
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$44,$45,$45,$4B,$28,$A3,$20
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$50,$4F,$4B,$45,$A3,$20
        .byte   $20,$20,$20,$20,$20,$20,$20,$20
        .byte   $20,$20,$44,$4F,$4B,$45,$A3
; Key shortcut table
PREDEF: .byte   $48,$45,$58,$24,$A8,$43,$41,$4C
        .byte   $4C,$A3,$54,$45,$58,$54,$8D,$46
        .byte   $4F,$52,$49,$3D,$31,$54,$CF,$4C
        .byte   $45,$46,$54,$24,$A8,$4D,$49,$44
        .byte   $24,$A8,$52,$49,$47,$48,$54,$24
        .byte   $A8,$53,$54,$52,$24,$A8,$55,$4E
        .byte   $50,$52,$4F,$54,$8D,$E0,$55,$53
        .byte   $49,$4E,$C7,$56,$49,$45,$57,$48
        .byte   $49,$52,$45,$53,$A2,$56,$55,$53
        .byte   $45,$52,$8D,$57,$49,$44,$54,$C8
        .byte   $57,$49,$4E,$44,$4F,$D7,$21,$52
        .byte   $45,$53,$54,$4F,$52,$C5
; SEDORIC token table
TOKEN_TABLE:
        .byte   "PP"
        .byte   $80,$00
        .byte   "PPEND"
        .byte   $00
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
        .byte   "HANGE"
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
        .byte   "TRACK"
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
        .byte   "INPUT"
        .byte   $00
        .byte   "OAD"
        .byte   $00
        .byte   "DIR"
        .byte   $00
        .byte   "TYPE"
        .byte   $00
        .byte   "CUR"
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
        .byte   "ESTORE"
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
        .byte   "IEW"
        .byte   $A2,$00
        .byte   "USER"
        .byte   $00
        .byte   "IDTH"
        .byte   $00
        .byte   "INDOW"
        .byte   $00,$9A,$00
        .byte   "]"
        .byte   $00,$FF,$00
; SEDORIC token initials table
TOKEN_INITIALS_TABLE:
        .byte   $DE
LCBBC:  .byte   $C9
LCBBD:  .byte   $00
LCBBE:  .byte   $04,$F4,$C9,$04,$03,$02,$CA,$07
        .byte   $06,$24,$CA,$0D,$0B,$58,$CA,$18
        .byte   $07,$77,$CA,$1F,$02,$CC,$CC,$21
        .byte   $00,$81,$CA,$21,$01,$85,$CA,$22
        .byte   $03,$93,$CA,$25,$01,$97,$CA,$26
        .byte   $07,$BA,$CA,$2D,$0A,$E5,$CA,$37
        .byte   $02,$EE,$CA,$39,$01,$F1,$CA,$3A
        .byte   $03,$FB,$CA,$3D,$04,$08,$CB,$41
        .byte   $02,$12,$CB,$43,$09,$40,$CB,$4C
        .byte   $0D,$7C,$CB,$59,$04,$8D,$CB,$5D
        .byte   $04,$A0,$CB,$61,$02,$AA,$CB,$63
        .byte   $02,$CC,$CC,$65,$00,$CC,$CC,$65
        .byte   $00,$CC,$CC,$65,$00,$B5,$CB,$65
        .byte   $03
; SEDORIC token address table
TOKEN_ADDR_TABLE:
        .addr   LFE06
        .addr   LFE06
        .addr   LEBDD
        .addr   LEB90
        .addr   LF0DD
        .addr   LF150
        .addr   LFEDF
        .addr   LF147
        .addr   LFB8C
        .addr   LF156
        .addr   LDE4C
        .addr   LF9BB
        .addr   LE9FE
        .addr   LF141
        .addr   LE443
        .addr   LE436
        .addr   LE445
        .addr   LE343
        .addr   LF138
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
        .addr   LD9AF
        .addr   LD9FC
        .addr   LD9FC
        .addr   LDDCC
        .addr   LE70A
        .addr   LF078
        .addr   LFC72
        .addr   LF035
        .addr   LF035
        .addr   LEC93
        .addr   LEC93
        .addr   LDFF6
        .addr   LE7CF
        .addr   LFE94
        .addr   LEBEB
        .addr   LF135
        .addr   LF13B
        .addr   LEB24
        .addr   LE71E
        .addr   LE0AE
        .addr   LFA4F
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
        .addr   LE536
        .addr   LE795
        .addr   LE795
        .addr   LE7D8
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
        .addr   LE73F
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
        .byte   $36,$37
LCD1A:  .byte   $FF,$7B,$0E,$FA,$35
LCD1F:  .byte   $10,$81,$C9,$0F,$DA,$A2
LCD25:  .byte   $C6,$C9,$88,$02,$88,$02
LCD2B:  .byte   $4F,$46,$46
LCD2E:  .byte   $53,$45,$54,$C7,$81,$C2,$82,$45
        .byte   $D3,$66,$A5,$C8,$A3,$8F,$D2,$42
        .byte   $B5,$98,$E0
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
        .byte   "UNKNOW'N FORMA"

        .byte   $D4
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
        .byte   "UNKNOW'N FIELD NAM"


        .byte   $C5
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
        .byte   " BREA"
LCF17:  .byte   "K ON BYTE "

        .byte   $A3,$0D,$0A
        .byte   "Drive"
        .byte   $A0
        .byte   " V3 (Mst)"

        .byte   $A0
        .byte   " sectors free "

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
        .byte   " V3 (Slv)"

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
LCFEB:  sty     $C006
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
        bne     LD0DA
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
        lda     $C006
        ldx     #$C0
        ldy     #$01
        jsr     LCFEB
        sta     $C006
        pla
        sta     $C004
        pla
        sta     RWBUF
        bcs     LD11B
        lda     MICRODISC_FDC_SECTOR
        sta     MICRODISC_FDC_TRACK
LD11B:  pla
        tax
        stx     type_of_error
        rts

LD121:  lda     MICRODISC_CONTROL_SHADOW
        sta     MICRODISC_CONTROL
        lda     MICRODISC_FDC_COMMAND
        lsr     a
        bcc     LD132
        lda     #$D0
        sta     MICRODISC_FDC_COMMAND
LD132:  sec
        jmp     NMIRAM

        stx     $F3
        ldx     #$04
        jsr     LD36C
        sec
        ldx     $F3
        lda     $F2
        sbc     #$02
        bcs     LD147
        dex
LD147:  pha
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
LD15C:  jsr     XROM
        sed
        .byte   $C3
        .byte   $F4
        .byte   $C3
        rts

        jsr     XROM
        pha
        cpy     $44
        cpy     $60
        ldx     #$4D
        .byte   $2C
LD16F:  lda     #$A3
        jsr     XROM
        sta     $C4
        .byte   $7E
        .byte   $C4
LD178:  jsr     XROM
        .byte   $A3
        cpy     $96
        cpy     $60
LD180:  jsr     XROM
        lda     $C4,x
        tay
        cpy     $60
LD188:  lda     $9A
        ldy     $9B
        jsr     XROM
        .byte   $73
        cmp     $63
        cmp     $60
LD194:  jsr     XROM
        asl     a
        dec     $FA
        cmp     $60
LD19C:  jsr     XROM
        dec     $B3C6,x
        dec     $60
        jsr     XROM
        inc     $C3C6
        dec     $60
LD1AC:  jsr     XROM
        adc     $C7
        .byte   $3A
        .byte   $C7
        rts

        jsr     XROM
        sta     $6CC7,y
        .byte   $C7
        rts

        jsr     XROM
        rti

        iny
        asl     $C8,x
        rts

LD1C4:  .byte   $20
        cld
LD1C6:  cmp     $3D,x
        iny
        .byte   $2F
        iny
        rts

LD1CC:  jsr     XROM
        .byte   $1F
        cmp     #$52
        cmp     #$60
        jsr     XROM
        .byte   $F1
LD1D8:  cmp     #$23
        dex
        rts

LD1DC:  jsr     XROM
        .byte   $1C
        dex
        .byte   $4E
        dex
LD1E3:  jsr     XROM
        ora     $3FCA
        dex
        rts

LD1EB:  jsr     XROM
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

LD1FE:  jsr     XROM
        .byte   $EF
        dex
        and     $60CB,y
LD206:  jsr     XROM
        .byte   $9F
        .byte   $CB
        beq     LD1D8
        rts

LD20E:  jsr     XROM
        .byte   $12
        cpy     TOKEN_ADDR_TABLE+178
        rts

LD216:  jsr     LD224
LD219:  clc
        .byte   $24
LD21B:  sec
LD21C:  jsr     XROM
        adc     $09CE,x
        .byte   $CF
        rts

LD224:  jsr     XROM
        .byte   $8B
        dec     LCF17
        rts

LD22C:  lda     #$2C
LD22E:  jsr     XROM
        .byte   $DB
        .byte   $CF
        .byte   $67
        bne     LD282
        lda     ($D3,x)
LD238:  jsr     XROM
        .byte   $FC
        .byte   $D0
LD23D:  dey
        cmp     ($85),y
        .byte   $D3
        sty     $D4
        rts

LD244:  jsr     XROM
        cli
        cmp     ($E8),y
        cmp     ($60),y
LD24C:  jsr     XROM
        .byte   $17
        .byte   $D2
        lda     #$D2
        rts

LD254:  .byte   $20
LD255:  cld
        cmp     $ED,x
        .byte   $D3
        sta     $60D4,y
LD25C:  jsr     XROM
LD25F:  ora     LD2D4,y
        .byte   $D4
        rts

LD264:  jsr     XROM
        beq     LD23D
        .byte   $AB
        cmp     $60,x
        jsr     XROM
        .byte   $C7
LD270:  dec     $82,x
        .byte   $D7
        rts

LD274:  jsr     LD21B
LD277:  jsr     XROM
        ora     $D7,x
        bne     LD255
        rts

LD27F:  jsr     LD216
LD282:  jsr     XROM
        bpl     LD25F
        .byte   $CB
        cld
        rts

LD28A:  jsr     XROM
        .byte   $6B
        cld
        rol     $D9
        rts

LD292:  jsr     XROM
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

LD2A2:  jsr     XROM
        .byte   $97
        .byte   $DA
        .byte   $22
        .byte   $DB
        rts

LD2AA:  jsr     XROM
        .byte   $B7
        .byte   $DC
        sbc     $60DC
        jsr     XROM
        cpx     #$DD
        cpx     $DD
        rts

LD2BA:  jsr     XROM
        .byte   $73
        dec     LDE7B,x
        rts

LD2C2:  jsr     XROM
        lda     $DE
        lda     $60DE
LD2CA:  jsr     XROM
        cmp     $D8,x
        rti

        .byte   $DF
        rts

LD2D2:  .byte   $20
        cld
LD2D4:  cmp     $D1,x
        cpx     #$D5
        cpx     #$60
LD2DA:  jsr     XROM
        adc     $71E2
        .byte   $E2
        rts

LD2E2:  jsr     XROM
        adc     $7DE3,y
        .byte   $E3
        rts

LD2EA:  jsr     XROM
        .byte   $87
        .byte   $E3
        .byte   $8B
        .byte   $E3
        rts

LD2F2:  jsr     XROM
        stx     $92E3
        .byte   $E3
        rts

LD2FA:  jsr     XROM
        sta     $53E7,x
        inx
        rts

LD302:  jsr     XROM
        .byte   $05
LD306:  sbc     #$78
        .byte   $EB
        rts

LD30A:  jsr     XROM
        .byte   $C7
        cpx     LEDE0
        rts

LD312:  jsr     XROM
        adc     $10F0,y
        sbc     ($60),y
LD31A:  jsr     XROM
        .byte   $94
LD31E:  .byte   $F4
        .byte   $EF
        .byte   $F4
        rts

LD322:  jsr     XROM
        and     $F5,x
        bcc     LD31E
        rts

LD32A:  jsr     XROM
        .byte   $CB
        .byte   $F7
        ora     ($F8,x)
        rts

LD332:  jsr     XROM
        rol     $82F9,x
        .byte   $F9
        rts

LD33A:  jsr     XROM
        .byte   $E2
        brk
        .byte   $E2
        brk
        rts

LD342:  jsr     XROM
        inx
        brk
        inx
        brk
        rts

LD34A:  ldy     #$09
        .byte   $2C
LD34D:  ldy     #$00
LD34F:  lda     COMMON_EXT_TABLE,x
        sta     $C029,y
        iny
        inx
        cpy     #$0C
        bne     LD34F
        rts

LD35C:  lda     EXTER
        ldy     $C00E
        bne     LD376
LD364:  lda     EXTMS
        ldy     $C010
        bne     LD376
LD36C:  lda     #$E6
        ldy     #$CE
        bne     LD376
LD372:  lda     #$BE
        ldy     #$CD
LD376:  sta     $18
        sty     $19
        ldy     #$00
LD37C:  dex
        bmi     LD38B
LD37F:  inc     $18
        bne     LD385
        inc     $19
LD385:  lda     ($18),y
        bpl     LD37F
        bmi     LD37C
LD38B:  iny
        lda     ($18),y
        php
        and     #$7F
        jsr     XAFCAR
        plp
        bpl     LD38B
        rts

LD398:  jsr     LD33A
        jmp     LD3A1

LD39E:  jsr     LD342
LD3A1:  php
        cmp     #$61
        bcc     LD3AC
        cmp     #$7B
        bcs     LD3AC
        and     #$DF
LD3AC:  plp
        rts

        ldx     #$00
        stx     NOERROR
        tsx
        stx     $C023
        lda     $E9
        ldy     $EA
        sta     $C01F
        sty     $C020
        jsr     LD39E
        sbc     #$41
        ldy     #$1A
        bcc     LD3D2
        cmp     #$1A
        bcs     LD3D2
        tay
        jsr     LD33A
LD3D2:  tya
        asl     a
        asl     a
        tay
        lda     TOKEN_INITIALS_TABLE,y
        sta     $18
        lda     LCBBC,y
        sta     $19
        lda     LCBBE,y
        sta     $F2
        ldx     LCBBD,y
LD3E8:  dec     $F2
        bmi     LD428
        ldy     #$FF
LD3EE:  iny
        lda     ($18),y
        beq     LD417
        sta     $F3
        lda     ($E9),y
        cmp     #$61
        bcc     LD401
        cmp     #$7B
        bcs     LD401
        and     #$DF
LD401:  cmp     $F3
        beq     LD3EE
LD405:  iny
        lda     ($18),y
        bne     LD405
        inx
        sec
        tya
        adc     $18
        sta     $18
        bcc     LD3E8
        inc     $19
        bcs     LD3E8
LD417:  txa
        asl     a
        tax
        lda     TOKEN_ADDR_TABLE+1,x
        pha
        lda     TOKEN_ADDR_TABLE,x
        pha
        jsr     LD1E3
        jmp     LD39E

LD428:  lda     $C01F
        ldy     $C020
        sta     $E9
        sty     $EA
        jsr     LD39E
        beq     LD449
        ldy     #$FF
LD439:  iny
        lda     ($E9),y
        beq     LD44A
        cmp     #$3A
        beq     LD44A
        cmp     #$D3
        bne     LD439
        jmp     LF5BA

LD449:  rts

LD44A:  lda     #$00
        jmp     LDFF9

LD44F:  sec
        .byte   $24
LD451:  clc
        lda     #$80
LD454:  php
        sta     $F4
        lsr     $F5
        lda     DRVDEF
        sta     $C028
        ldx     #$0B
        lda     #$20
        sta     $F3
LD465:  sta     $C029,x
        dex
        bpl     LD465
        plp
        bpl     LD4D0
        bcs     LD4AB
        jsr     LD39E
        bne     LD481
LD475:  lda     #$0C
        sta     $F2
        jsr     LD5B5
        beq     LD481
        jmp     LD503

LD481:  cmp     #$2C
        beq     LD475
        cmp     #$C3
        beq     LD475
        sec
        sbc     #$41
        tay
        cmp     #$04
        bcs     LD4AB
        jsr     LD398
        beq     LD49E
        cmp     #$C3
        beq     LD49E
        cmp     #$2C
        bne     LD4A3
LD49E:  sty     $C028
        bcs     LD475
LD4A3:  lda     $E9
        bne     LD4A9
        dec     $EA
LD4A9:  dec     $E9
LD4AB:  jsr     LD224
        jsr     LD274
        sta     $F3
        tay
        dey
        bmi     LD532
LD4B7:  lda     ($91),y
        cmp     #$20
        bne     LD4BF
        dec     $F3
LD4BF:  dey
        bpl     LD4B7
        lda     $E9
        pha
        lda     $EA
        pha
        lda     $91
        sta     $E9
        lda     $92
        sta     $EA
LD4D0:  jsr     LD39E
        sbc     #$41
        tax
        cmp     #$04
        bcs     LD509
        ldy     #$01
        lda     ($E9),y
        cmp     #$2D
        beq     LD4E6
        cmp     #$CD
        bne     LD509
LD4E6:  stx     $C028
        dec     $F3
        dec     $F3
        beq     LD53D
        jsr     LD398
        jsr     LD398
        bne     LD509
        bit     $F4
        bmi     LD532
        pla
        pla
        jsr     LD7BD
        stx     DRVDEF
LD503:  jsr     LD7BD
        jmp     LD39E

LD509:  ldx     #$00
        lda     #$09
        sta     $F2
        lsr     $F6
        jsr     LD39E
LD514:  bit     $F6
        bmi     LD52A
        cmp     #$2E
        bne     LD52A
        ror     $F6
        cpx     #$0A
        bcs     LD53D
        lda     #$0C
        sta     $F2
        ldx     #$08
        bne     LD53F
LD52A:  cmp     #$2C
        bne     LD534
        bit     $F4
        bpl     LD559
LD532:  bmi     LD5AC
LD534:  jsr     LD567
        sta     $C029,x
        tya
        cpx     $F2
LD53D:  bcs     LD5AC
LD53F:  dec     $F3
        beq     LD553
        inx
        bit     $F5
        bmi     LD514
        jsr     LD398
        bne     LD514
        bit     $F4
        bpl     LD559
        bmi     LD5AC
LD553:  pla
        sta     $EA
        pla
        sta     $E9
LD559:  lda     $C032
        cmp     #$20
        bne     LD503
        ldx     #$00
        jsr     LD34A
        beq     LD503
LD567:  bit     $F5
        bmi     LD58F
        tay
        bpl     LD5B1
        sta     $F5
        and     #$7F
        sta     $24
        lda     #$E9
        ldy     #$C0
        sta     $16
        sty     $17
        ldy     #$00
LD57E:  dec     $24
        bmi     LD58F
LD582:  inc     $16
        bne     LD588
        inc     $17
LD588:  jsr     DO_EXEVEC
        bpl     LD582
        bmi     LD57E
LD58F:  ldy     #$00
        inc     $16
        bne     LD597
        inc     $17
LD597:  jsr     DO_EXEVEC
        pha
        ldy     #$01
        jsr     DO_EXEVEC
        tay
        pla
        php
        and     #$7F
        plp
        bpl     LD5C1
        lsr     $F5
        bpl     LD5C3
LD5AC:  ldx     #$02
        jmp     LD67E

LD5B1:  cmp     #$2A
        bne     LD5C3
LD5B5:  lda     #$3F
LD5B7:  sta     $C029,x
        inx
        cpx     $F2
        bne     LD5B7
        dex
        rts

LD5C1:  inc     $F3
LD5C3:  cmp     #$3F
        beq     LD5D7
        cmp     #$30
        bcc     LD5AC
        cmp     #$3A
        bcc     LD5D7
        cmp     #$41
        bcc     LD5AC
        cmp     #$5B
        bcs     LD5AC
LD5D7:  rts

XROM:   sta     $0C
        sty     $0D
        php
        pla
        sta     $27
        clc
        pla
        sta     $0E
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
        bpl     LD5F8
        ldy     #$03
LD5F8:  lda     ($0E),y
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

LD60E:  clc
        adc     #$41
        bvc     XAFCAR
XAFHEX: pha
        lsr     a
        lsr     a
        lsr     a
        lsr     a
        jsr     LD61E
        pla
        and     #$0F
LD61E:  cmp     #$0A
        bcc     LD624
        adc     #$06
LD624:  clc
        adc     #$30
        .byte   $2C
LD628:  lda     #$20
XAFCAR: cmp     #$0D
        bne     LD634
        lda     #$00
        sta     $30
        lda     #$0D
LD634:  jmp     LD20E

XAFSTR: sta     $91
        sty     $92
        ldy     #$00
LD63D:  lda     ($91),y
        beq     LD647
        jsr     XAFCAR
        iny
        bne     LD63D
LD647:  rts

LD648:  ldx     #$14
        jsr     LD36C
        lda     DRIVE
        jsr     LD60E
        jsr     LD206
        ldx     #$0D
        jsr     LD36C
        cli
        jsr     LD669
        sei
        php
        jsr     LD206
        jsr     LD206
        plp
        rts

LD669:  jsr     LD302
        cmp     #$1B
        beq     LD675
        cmp     #$0D
        bne     LD669
        clc
LD675:  rts

        jsr     LD669
        bcc     LD675
        pla
        pla
        rts

LD67E:  inx
        stx     NOERROR
        jmp     (LC01D)

        txa
        jsr     LD7DE
        lda     $A8
        ldy     $A9
        cpy     #$FF
        bne     LD692
        tya
LD692:  sta     NOLIGN
        sty     NOLIGN+1
        jsr     LD7F2
        jsr     LD1C4
        cli
        bit     $C018
        bpl     LD6C9
        ldx     $C023
        txs
        lda     $C01B
        ldy     $C01C
        sta     $A8
        sty     $A9
        lda     $C019
        ldy     $C01A
        sta     $E9
        sty     $EA
        lda     $C01F
        ldy     $C020
        sta     $C021
        sty     $C022
        rts

LD6C9:  jsr     LD30A
        ldx     NOERROR
        cpx     #$04
        bne     LD706
        ldx     #$00
        jsr     LD36C
        lda     PISTE
        jsr     XAFHEX
        lda     type_of_error
        and     #$F0
        eor     #$F0
        beq     LD6FB
        ldx     #$01
        jsr     LD36C
        lda     SECTEUR
        jsr     XAFHEX
        ldx     #$03
        lda     type_of_error
        and     #$20
        beq     LD6FD
LD6FB:  ldx     #$02
LD6FD:  jsr     LD36C
        lda     $C017
        jsr     XAFHEX
LD706:  ldx     NOERROR
        dex
        jsr     LD206
        lda     #$3F
        jsr     XAFCAR
        cpx     #$1A
        bcs     LD71B
        jsr     LD372
        bmi     LD73B
LD71B:  cpx     #$31
        bcc     LD734
        ldx     #$10
        jsr     LD36C
        lda     NOERROR
        ldy     #$00
        sty     $C04C
        ldx     #$01
        jsr     LD758
        jmp     LD73B

LD734:  txa
        sbc     #$19
        tax
        jsr     LD35C
LD73B:  jmp     LD178

XCURON: sec
        .byte   $24
XCUROFF:clc
        php
        lsr     $026A
        plp
        rol     $026A
        lda     #$01
        jmp     LD32A

LD74E:  ldx     #$00
LD750:  ldy     #$00
        bit     $03A2
        .byte   $2C
LD756:  ldx     #$02
LD758:  sta     $F3
        sty     $F4
        lda     #$00
        sta     $C073
LD761:  lda     #$FF
        sta     $F2
LD765:  inc     $F2
        sec
        lda     $F3
        tay
        sbc     LCD88,x
        sta     $F3
        lda     $F4
        pha
        sbc     LCD8C,x
        sta     $F4
        pla
        bcs     LD765
        sty     $F3
        sta     $F4
        lda     $F2
        beq     LD788
        sta     $C073
        bne     LD791
LD788:  ldy     $C073
        bne     LD791
        lda     $C04C
        .byte   $2C
LD791:  ora     #$30
        jsr     XAFCAR
        dex
        bpl     LD761
        lda     $F3
        jmp     LD624

LD79E:  sec
        .byte   $24
LD7A0:  clc
        ror     $F2
        ldx     #$0B
LD7A5:  lda     $C029,x
        cmp     #$3F
        beq     LD7B1
        dex
        bpl     LD7A5
        sec
LD7B0:  rts

LD7B1:  rol     $F2
        bcc     LD7B0
        ldx     #$05
        .byte   $2C
LD7B8:  ldx     #$01
        jmp     LD67E

LD7BD:  ldy     $C028
LD7C0:  sty     DRIVE
        lda     $C039,y
        beq     LD7B8
        rts

LD7C9:  ldx     #$0E
        .byte   $2C
LD7CC:  ldx     #$10
        .byte   $2C
LD7CF:  ldx     #$12
        .byte   $2C
LD7D2:  ldx     #$14
        .byte   $2C
LD7D5:  ldx     #$16
        .byte   $2C
LD7D8:  ldx     #$06
        .byte   $2C
LD7DB:  ldx     #$04
        .byte   $2C
LD7DE:  ldx     #$00
        .byte   $2C
LD7E1:  ldx     #$0A
        bit     $1EA2
        .byte   $2C
LD7E7:  ldx     #$20
        .byte   $2C
LD7EA:  ldx     #$22
        .byte   $2C
LD7ED:  ldx     #$24
        ldy     #$00
        .byte   $2C
LD7F2:  ldx     #$02
        bit     $08A2
        .byte   $2C
LD7F8:  ldx     #$18
        .byte   $2C
LD7FB:  ldx     #$1A
        .byte   $2C
LD7FE:  ldx     #$1C
        bit     $0CA2
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

LD81C:  inc     $16
        bne     LD822
        inc     $17
LD822:  ldy     #$00
        bit     $C048
        bvc     LD82C
        jmp     DO_EXEVEC

LD82C:  lda     ($16),y
        beq     LD86F
        bpl     LD871
        bit     $C048
        bpl     LD86F
        and     #$7F
        rts

LD83A:  sta     V1DRB
        lda     #$08
        and     V1DRB
        rts

LD843:  sec
        .byte   $24
LD845:  clc
        ror     $C04A
        jsr     LD302
        php
        sta     $C046
        stx     $C047
        bit     $C049
        bpl     LD872
        bit     $C04A
        bmi     LD864
        cpx     #$4E
        bcc     LD864
        lsr     $C049
LD864:  jsr     LD81C
        bpl     LD86C
        lsr     $C049
LD86C:  and     #$7F
        plp
LD86F:  bit     $E2
LD871:  rts

LD872:  plp
        bpl     LD871
        lda     #$00
        sta     $C04B
        sta     $C048
        lda     #$0E
        ldx     #$EF
        jsr     LD322
        lda     #$15
        jsr     LD83A
        bne     LD8C3
        lda     $C046
        ldx     $C047
        bit     $C03D
        bpl     LD86F
        lda     $0208
        ldx     #$05
LD89B:  cmp     QWAZERTY_CONV,x
        beq     LD8AC
        dex
        bpl     LD89B
        lda     $C046
LD8A6:  ldx     $C047
        jmp     LD86F

LD8AC:  lda     $0208
        pha
        lda     LCD47,x
        sta     $0208
        jsr     LD31A
        tax
        pla
        sta     $0208
        txa
        and     #$7F
        bpl     LD8A6
LD8C3:  lda     #$17
        jsr     LD83A
        bne     LD8D1
        lda     #$14
        jsr     LD83A
        beq     LD8D3
LD8D1:  lda     #$40
LD8D3:  ora     $0208
        and     #$7F
        tax
        lda     KEYDEF,x
        tay
        iny
        bne     LD8E3
        jmp     LD963

LD8E3:  iny
        beq     LD952
        cmp     #$20
        ror     a
        sta     $C048
        rol     a
        bmi     LD8F3
        bcc     LD8F3
        sbc     #$20
LD8F3:  and     #$7F
        tax
        lda     #$E9
        ldy     #$C0
        bit     $C048
        bvs     LD928
        bmi     LD907
        lda     #$7F
        ldy     #$C8
        bne     LD928
LD907:  lda     $F2
        pha
        jsr     LEA30
        ldy     #$00
LD90F:  lda     LCBBD,y
        inx
        iny
        iny
        iny
        iny
        cmp     $F2
        bcc     LD90F
        stx     $C04B
        ldx     $F2
        dex
        pla
        sta     $F2
        lda     #$DD
        ldy     #$C9
LD928:  sta     $16
        sty     $17
LD92C:  dex
        bmi     LD936
LD92F:  jsr     LD81C
        bpl     LD92F
        bmi     LD92C
LD936:  jsr     LD81C
        cmp     #$20
        beq     LD936
        lda     $16
        bne     LD943
        dec     $17
LD943:  dec     $16
        lda     $C04B
        sec
        ror     $C049
LD94C:  ldx     $C047
LD94F:  jmp     LD86F

LD952:  lda     #$7F
        bit     $C04A
        bmi     LD94C
        ldx     $C047
        beq     LD94C
        dex
        lda     #$08
        bne     LD94F
LD963:  ldy     $C042
        lda     $C043
        jsr     LD2CA
        jsr     LD2D2
        ldx     #$00
        stx     $17
        dex
        stx     $16
LD976:  inx
        lda     STACK+1,x
        bne     LD976
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
        bcc     LD996
        lda     #$2A
LD996:  sta     STACK+1,x
        clc
        lda     $C044
        adc     $C042
        sta     $C042
        lda     $C045
        adc     $C043
        sta     $C043
        lda     #$0D
        .byte   $D0
LD9AF:  tya
        jsr     LD27F
        cpx     #$10
        bcs     LD9F5
        txa
        asl     a
        asl     a
        asl     a
        asl     a
        pha
        jsr     LD22C
        jsr     LD224
        jsr     LD274
        cmp     #$11
        bcs     LD9F8
        tay
        beq     LD9F8
        pla
        tax
        lda     #$10
        sta     $F2
        lda     #$20
LD9D5:  sta     REDEF,x
        inx
        dec     $F2
        bne     LD9D5
        dey
        dex
        lda     ($91),y
        ora     #$80
        sta     REDEF,x
LD9E6:  dex
        dey
        bmi     LDA1F
        lda     ($91),y
        beq     LD9F5
        bmi     LD9F5
        sta     REDEF,x
        bcc     LD9E6
LD9F5:  ldx     #$08
        .byte   $2C
LD9F8:  ldx     #$12
        .byte   $4C
        .byte   $7E
LD9FC:  dec     $20,x
        .byte   $7F
        .byte   $D2
        lsr     $02DF
LDA03:  jsr     LD302
        bpl     LDA03
        lda     $0208
        ldy     $0209
        cpy     #$A4
        beq     LDA16
        cpy     #$A7
        bne     LDA18
LDA16:  ora     #$40
LDA18:  and     #$7F
        tay
        txa
        sta     KEYDEF,y
LDA1F:  rts

        jsr     LD27F
        php
        sei
        txa
        pha
        lsr     a
        lsr     a
        lsr     a
        and     #$07
        tax
        clc
        lda     #$FF
LDA30:  rol     a
        dex
        bpl     LDA30
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

XPMAP:  jsr     LE62E
        nop
LDA50:  jsr     LDA60
        ldx     BUF2
        inx
        beq     LDACD
        ldx     #$0A
        bne     LDA7F
LDA5D:  ldx     #$C1
        .byte   $2C
LDA60:  ldx     #$C2
        .byte   $2C
LDA63:  ldx     #$C3
        stx     $C004
        ldx     #$00
        stx     RWBUF
LDA6D:  sta     PISTE
        sty     SECTEUR
XPRSEC: ldx     #$88
LDA75:  jsr     XRWTS
        beq     LDACD
        ldx     #$03
        bvc     LDA7F
        inx
LDA7F:  jmp     LD67E

XSCAT:  lda     $C025
        ldy     $C026
        bne     LDA94
XSMAP:  jmp     LDC80

        nop
LDA8E:  ldx     #$C2
        .byte   $2C
LDA91:  ldx     #$C1
        .byte   $2C
LDA94:  ldx     #$C3
        stx     $C004
        ldx     #$00
        stx     RWBUF
LDA9E:  sta     PISTE
        sty     SECTEUR
XSVSEC: ldx     #$A8
        bne     LDA75
LDAA8:  lda     #$00
        ldy     #$C1
        sta     RWBUF
        sty     $C004
        bne     XSVSEC
LDAB4:  ldx     $C027
        ldy     #$08
        jsr     LDAC3
        lda     #$2E
        jsr     XAFCAR
        ldy     #$02
LDAC3:  lda     BUF3,x
        jsr     XAFCAR
        inx
        dey
        bpl     LDAC3
LDACD:  rts

LDACE:  lda     #$C1
        bit     $C2A9
        .byte   $2C
LDAD4:  lda     #$C3
        sta     $0F
        lda     #$00
        sta     $0E
        ldy     #$00
        tya
LDADF:  sta     ($0E),y
        iny
        bne     LDADF
        rts

        lda     $C025
        ldy     $C026
        jsr     LDA63
LDAEE:  ldx     $C027
        ldy     #$F0
LDAF3:  lda     $BF39,y
        sta     BUF3,x
        inx
        iny
        bne     LDAF3
        rts

LDAFE:  lda     $C025
        ldy     $C026
        jsr     LDA63
LDB07:  ldx     $C027
        ldy     #$F0
LDB0C:  lda     BUF3,x
        sta     $BF39,y
        inx
        iny
        bne     LDB0C
        rts

LDB17:  ldy     #$F4
LDB19:  lda     $BF35,y
        cmp     #$3F
        beq     LDB25
        cmp     BUF3,x
        bne     LDB41
LDB25:  inx
        iny
        bne     LDB19
        ldx     $C027
        rts

LDB2D:  jsr     XPMAP
XTVNM:  lda     #$14
        ldy     #$04
LDB34:  sta     $C025
        sty     $C026
        jsr     LDA63
        ldx     #$10
        bne     LDB48
LDB41:  lda     $C027
        clc
        adc     #$10
        tax
LDB48:  stx     $C027
        cpx     $C302
        bne     LDB17
        lda     BUF3
        ldy     $C301
        bne     LDB34
        rts

XTRVCA: jsr     LDBA5
        bne     LDB92
        lda     $C208
        cmp     #$05
        bcs     LDB6F
        lda     SECTEUR
        adc     #$03
        tay
        lda     #$14
        bne     LDB72
LDB6F:  jsr     XLIBSE
LDB72:  sta     BUF3
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
LDB92:  txa
        stx     $C027
        clc
        adc     #$10
        sta     $C302
        inc     $C204
        bne     LDBBF
        inc     $C205
        rts

LDBA5:  lda     #$14
        ldy     #$04
LDBA9:  sta     $C025
        sty     $C026
        jsr     LDA63
        ldx     $C302
        bne     LDBBF
        lda     BUF3
        ldy     $C301
        bne     LDBA9
LDBBF:  rts

XWDESC: sta     $C058
        sty     $C059
        sta     $C05A
        sty     $C05B
        jsr     LDACE
        ldx     #$01
        stx     $C05E
        jsr     XLIBSE
        sta     $C05C
        sty     $C05D
        sta     PISTE
        sty     SECTEUR
        ldx     #$08
LDBE5:  lda     $C051,x
        sta     $C103,x
        dex
        bpl     LDBE5
        stx     $C102
        ldx     #$0C
LDBF3:  stx     $C05F
        lda     $C058
        ora     $C059
        beq     LDC56
        lda     $C058
        bne     LDC06
        dec     $C059
LDC06:  dec     $C058
        jsr     XLIBSE
        ldx     $C05F
        sta     BUF1,x
        inx
        tya
        sta     BUF1,x
        inx
        bne     LDBF3
        lda     $C058
        ora     $C059
        beq     LDC56
        ldy     $C101
        bne     LDC43
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
        bne     LDC4F
LDC43:  jsr     LDAA8
        lda     BUF1
        ldy     $C101
        jsr     LDA5D
LDC4F:  jsr     LDACE
        ldx     #$02
        bne     LDBF3
LDC56:  lda     #$00
        sta     BUF1
        sta     $C101
        jsr     LDAA8
        lda     $C05C
        ldy     $C05D
        jmp     LDA5D

        clc
        .byte   $24
XLIBSE: sec
        lda     $C202
        tax
        ora     $C203
        bne     LDC7D
        bcc     LDCD4
LDC78:  ldx     #$07
        jmp     LD67E

LDC7D:  jmp     LE67F

LDC80:  bit     $2F
        bpl     LDC89
        php
        jsr     LE63A
        plp
LDC89:  ldy     #$02
LDC8B:  lda     #$14
        jmp     LDA8E

LDC90:  lda     #$01
        ldy     #$00
LDC94:  pha
        and     $C210,x
        bne     LDC9F
        pla
        asl     a
        iny
        bne     LDC94
LDC9F:  pla
        eor     #$FF
        and     $C210,x
        sta     $C210,x
LDCA8:  lda     #$00
        sta     $F3
        txa
LDCAD:  asl     a
        rol     $F3
        asl     a
        rol     $F3
        asl     a
        rol     $F3
        sta     $F2
        tya
        ora     $F2
        ldx     #$FF
LDCBD:  sec
        inx
        tay
        sbc     $C207
        bcs     LDCBD
        dec     $F3
        bpl     LDCBD
        txa
        cpx     $C206
        bcc     LDCD4
        sbc     $C206
        ora     #$80
LDCD4:  iny
        rts

LDCD6:  dey
        tax
        bpl     LDCE0
        and     #$7F
        clc
        adc     $C206
LDCE0:  tax
        lda     #$00
        sta     $F3
        cpx     #$00
        beq     LDCF4
LDCE9:  clc
        adc     $C207
        bcc     LDCF1
        inc     $F3
LDCF1:  dex
        bne     LDCE9
LDCF4:  sta     $F2
        clc
        tya
        adc     $F2
        bcc     LDCFE
        inc     $F3
LDCFE:  pha
        and     #$07
        tay
        pla
        lsr     $F3
        ror     a
        lsr     $F3
        ror     a
        lsr     $F3
        jmp     LE6C4

LDD0E:  lda     #$00
LDD10:  rol     a
        dey
        bpl     LDD10
        rts

XDETSE: jsr     LDCD6
        ora     $C210,x
        cmp     $C210,x
        beq     LDD2C
        sta     $C210,x
        inc     $C202
        bne     LDD2C
        inc     $C203
        clc
LDD2C:  rts

XCREAY: jsr     LDCD6
        eor     #$FF
        and     $C210,x
        cmp     $C210,x
        beq     LDD2C
        sta     $C210,x
        lda     $C202
        bne     LDD45
        dec     $C203
LDD45:  dec     $C202
        clc
LDD49:  rts

CMD_SAVEM:
        lda     #$40
LDD4C:  .byte   $2C
CMD_SAVEU:
        lda     #$C0
LDD4F:  .byte   $2C
CMD_SAVE:
        lda     #$80
LDD52:  .byte   $2C
CMD_SAVEO:
        lda     #$00
        jsr     LDE28
        jsr     LD44F
        jsr     LD79E
LDD5E:  jsr     LD39E
        bne     LDD66
        jmp     LDE0B

LDD66:  jsr     LD22C
        cmp     #$54
        bne     LDD89
        jsr     LD398
        jsr     LD2FA
        sty     $C056
        sta     $C057
        lsr     $C051
        sec
        rol     $C051
        bne     LDD5E
LDD82:  lda     #$40
        sta     $C051
        bne     LDD5E
LDD89:  cmp     #$41
        bne     LDD9B
        jsr     LD398
        jsr     LD2FA
        sty     $C052
        sta     $C053
        bcc     LDD82
LDD9B:  cmp     #$45
        bne     LDDAD
        jsr     LD398
        jsr     LD2FA
        sty     $C054
        sta     $C055
        bcc     LDD82
LDDAD:  cmp     #$C7
        bne     LDE23
        jsr     LD398
        bne     LDE23
        lsr     $C051
        sec
        rol     $C051
        bmi     LDE0B
        lda     $C052
        ldy     $C053
        sta     $C056
        sty     $C057
        .byte   $90
LDDCC:  .byte   $3E
CMD_KEYSAVE:
        jsr     LD44F
        lda     #$00
        ldy     #$C8
        sta     $C052
        sty     $C053
        lda     #$DD
        ldy     #$C9
        .byte   $D0
LDDDF:  .byte   $1E
CMD_ESAVE:
        jsr     LD44F
        lda     $021F
        bne     LDDF0
        ldx     #$80
        ldy     #$BB
        lda     #$DF
        bne     LDDF6
LDDF0:  ldx     #$00
        ldy     #$A0
        lda     #$3F
LDDF6:  stx     $C052
        sty     $C053
        ldy     #$BF
        ldx     #$40
LDE00:  jsr     LDE3B
        lda     #$C0
        sta     $C04D
        jsr     LD79E
LDE0B:  sec
        lda     $C054
        sbc     $C052
        sta     $C04F
        lda     $C055
        sbc     $C053
        sta     $C050
        bcs     LDE9C
LDE20:  ldx     #$08
        .byte   $2C
LDE23:  ldx     #$09
        jmp     LD67E

LDE28:  sta     $C04D
        lda     $9A
        ldy     $9B
        sta     $C052
        sty     $C053
        lda     $9C
        ldy     $9D
        ldx     #$80
LDE3B:  sta     $C054
        sty     $C055
        stx     $C051
        lda     #$00
        sta     $C056
        sta     $C057
LDE4C:  rts

CMD_CREATEW:
        jsr     LD44F
        jsr     LDFDE
LDE53:  jsr     LD302
        bpl     LDE53
        cmp     #$03
        beq     LDE4C
        cmp     #$13
        bne     LDE7C
        jsr     XCUROFF
        lda     #$D0
        ldy     #$BB
        sta     $C052
        sty     $C053
        lda     #$B7
        ldy     #$BF
        ldx     #$60
        jsr     LDE00
        jsr     XCURON
        .byte   $4C
        .byte   $53
LDE7B:  .byte   $DE
LDE7C:  cmp     #$17
        bne     LDE8E
        ldy     $0269
        lda     #$7F
        ldy     $0269
        sta     ($12),y
        lda     #$09
        bne     LDE97
LDE8E:  cmp     #$0D
        bne     LDE97
        jsr     XAFCAR
        lda     #$0A
LDE97:  jsr     XAFCAR
        bne     LDE53
LDE9C:  sei
        jsr     LDB2D
        beq     LDF11
        lda     $C04D
        beq     LDEBD
        cmp     #$80
        beq     LDEB8
        cmp     #$C0
        beq     LDEC5
        jsr     LDB07
        jmp     LDF1B

LDEB5:  ldx     #$02
        .byte   $2C
LDEB8:  ldx     #$06
        jmp     LD67E

LDEBD:  jsr     LE264
        bcs     LDEEF
        jmp     LDF11

LDEC5:  ldy     #$02
LDEC7:  lda     $C032,y
        pha
        dey
        bpl     LDEC7
        ldy     #$02
LDED0:  lda     $C032,y
        cmp     LCCFA,y
        bne     LDEDD
        dey
        bpl     LDED0
        bmi     LDEB5
LDEDD:  ldx     #$03
        jsr     LD34A
        jsr     XTVNM
        beq     LDEF1
        jsr     LE264
        bcc     LDEF1
        pla
        pla
        pla
LDEEF:  cli
        rts

LDEF1:  ldy     #$00
LDEF3:  pla
        sta     $C032,y
        iny
        cpy     #$03
        bne     LDEF3
        jsr     XTVNM
        ldx     $C027
LDF02:  lda     LCCFA,y
        sta     $C309,x
        inx
        iny
        cpy     #$03
        bne     LDF02
        jsr     XSCAT
LDF11:  ldx     #$03
        lda     #$00
LDF15:  sta     $C035,x
        dex
        bpl     LDF15
LDF1B:  ldx     $C050
        ldy     #$00
        inx
        txa
        bne     LDF25
        iny
LDF25:  jsr     XWDESC
        lda     $C052
        ldy     $C053
        dey
        sta     RWBUF
        sty     $C004
        ldy     #$0A
LDF37:  inc     $C004
        lda     $C050
        beq     LDF56
        dec     $C050
        jsr     LE228
        lda     BUF1,y
        sta     PISTE
        lda     $C101,y
        sta     SECTEUR
        jsr     XSVSEC
        beq     LDF37
LDF56:  jsr     LE228
        lda     BUF1,y
        pha
        lda     $C101,y
        pha
        jsr     LDACE
        lda     RWBUF
        ldy     $C004
        sta     $F2
        sty     $F3
        ldy     #$FF
LDF70:  iny
        lda     ($F2),y
        sta     BUF1,y
        cpy     $C04F
        bne     LDF70
        pla
        tay
        pla
        jsr     LDA91
        clc
        lda     $C05A
        adc     $C05E
        bcc     LDF8D
        inc     $C05B
LDF8D:  adc     $C037
        sta     $C037
        lda     $C038
        and     #$0F
        adc     $C05B
        ora     #$40
        sta     $C038
        lda     $C035
        ldy     $C036
        beq     LDFC5
LDFA8:  jsr     LDA5D
        lda     BUF1
        ldy     $C101
        bne     LDFA8
        lda     $C05C
        ldy     $C05D
        sta     BUF1
        sty     $C101
        jsr     XSVSEC
        jmp     LDFD4

LDFC5:  lda     $C05C
        ldy     $C05D
        sta     $C035
        sty     $C036
        jsr     XTRVCA
LDFD4:  jsr     XSMAP
        jsr     LDAEE
        cli
        jmp     XSCAT

LDFDE:  lda     $021F
        beq     LDFF3
        jmp     LD16F

LDFE6:  lda     #$00
        ldx     #$03
LDFEA:  sta     $C04D,x
        dex
        bpl     LDFEA
        stx     $C072
LDFF3:  rts

LDFF4:  .byte   $4C
        .byte   $23
LDFF6:  .byte   $DE
CMD_LOAD:
        lda     #$80
LDFF9:  jsr     LD454
        jsr     LD79E
        jsr     LDFE6
LE002:  jsr     LD39E
        beq     LE052
        bne     LE00E
LE009:  jsr     LD398
        beq     LE052
LE00E:  jsr     LD22C
        ldy     #$40
        cmp     #$56
        beq     LE01D
        cmp     #$4E
        bne     LE027
        ldy     #$80
LE01D:  lda     $C04D
        bne     LDFF4
        sty     $C04D
        beq     LE009
LE027:  cmp     #$4A
        bne     LE034
        lda     $C04E
        bne     LDFF4
        ldx     #$80
        bmi     LE04B
LE034:  cmp     #$41
        bne     LDFF4
        lda     $C04E
        bne     LDFF4
        jsr     LD398
        jsr     LD2FA
        sty     $C052
        sta     $C053
        ldx     #$40
LE04B:  stx     $C04E
        bmi     LE009
        bpl     LE002
LE052:  jsr     LE0E5
        bit     $C04D
        bvc     LE085
        lda     $C051
        jsr     LD7E1
        lda     $C052
        ldy     $C053
        jsr     LD7F8
        lda     $C056
        ldy     $C057
        jsr     LD7FE
        clc
        lda     $C052
        adc     $C04F
        pha
        lda     $C053
        adc     $C050
        tay
        pla
        jsr     LD7FB
LE085:  lda     $C04D
        asl     a
        bmi     LE0DB
        rol     a
        eor     #$01
        and     $C051
        lsr     a
        lda     $C051
        bpl     LE0A4
        php
        jsr     LE0B4
        plp
        bcc     LE0A1
        jmp     LD1AC

LE0A1:  jmp     LD180

LE0A4:  bcc     LE0DB
        lda     $C056
        ldy     $C057
        .byte   $4C
        .byte   $6B
LE0AE:  .byte   $04
CMD_OLD:ldy     #$01
        tya
        sta     ($9A),y
LE0B4:  php
        sei
        jsr     LD188
        ldy     $92
        lda     $91
        clc
        adc     #$02
        bcc     LE0C3
        iny
LE0C3:  sta     $9C
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

LE0DB:  cli
        rts

LE0DD:  ldx     #$00
        .byte   $2C
LE0E0:  ldx     #$0C
        jmp     LD67E

LE0E5:  jsr     LDB2D
        beq     LE0DD
LE0EA:  sei
        sec
        ror     $C072
        lda     $C30C,x
        ldy     $C30D,x
LE0F5:  jsr     LDA5D
        ldx     #$02
LE0FA:  lda     BUF1,x
        cmp     #$FF
        beq     LE10E
        inx
        bne     LE0FA
        lda     BUF1
        ldy     $C101
        beq     LE0DB
        bne     LE0F5
LE10E:  lda     $C101,x
        sta     $F9
        and     #$C0
        bne     LE11C
        bit     $C04D
        bvc     LE0E0
LE11C:  bit     $C04E
        bvs     LE13A
        bpl     LE12E
        ldy     $9D
        lda     $9C
        sbc     #$02
        bcs     LE134
        dey
        bcc     LE134
LE12E:  lda     $C102,x
        ldy     $C103,x
LE134:  sta     $C052
        sty     $C053
LE13A:  sec
        lda     $C104,x
        sbc     $C102,x
        sta     $C04F
        lda     $C105,x
        sbc     $C103,x
        sta     $C050
        clc
        lda     $C052
        sta     RWBUF
        adc     $C04F
        pha
        lda     $C053
        tay
        dey
        sty     $C004
        adc     $C050
        tay
        bit     $C072
        bpl     LE175
        lda     $C106,x
        sta     $C056
        lda     $C107,x
        sta     $C057
LE175:  lda     $C108,x
        sta     $F7
        lda     $C109,x
        sta     $F8
        bit     $C04D
        bvc     LE1B9
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
        lda     $F9
        jsr     XAFHEX
        jsr     LD628
        lda     $C057
        jsr     XAFHEX
        lda     $C056
        jsr     XAFHEX
        jsr     LD628
        jsr     LD206
        .byte   $24
LE1B9:  pla
        txa
        clc
        adc     #$06
        tay
        jsr     LE228
LE1C2:  lda     $F7
        bne     LE1C8
        dec     $F8
LE1C8:  dec     $F7
        inc     $C004
        lda     $F7
        ora     $F8
        beq     LE1DC
        jsr     LE228
        jsr     LE250
        jmp     LE1C2

LE1DC:  lda     RWBUF
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
        bvs     LE208
        jsr     LE250
        ldy     #$FF
LE1FF:  iny
        lda     BUF2,y
        sta     ($F5),y
        cpy     $C04F
LE208:  bne     LE1FF
        pla
        tay
        jsr     LE228
        bcs     LE24E
        tya
        tax
        lda     $C072
        bpl     LE225
        lsr     $C072
        lda     #$00
        sta     $C04E
        lda     $F9
        sta     $C051
LE225:  jmp     LE0FA

LE228:  iny
        iny
        bne     LE249
        lda     RWBUF
        pha
        lda     $C004
        pha
        lda     BUF1
        ldy     $C101
        beq     LE24B
        jsr     LDA5D
        pla
        sta     $C004
        pla
        sta     RWBUF
        ldy     #$02
LE249:  clc
LE24A:  rts

LE24B:  sec
        pla
        pla
LE24E:  cli
        rts

LE250:  lda     BUF1,y
        sta     PISTE
        lda     $C101,y
        sta     SECTEUR
        bit     $C04D
        bvs     LE24A
        jmp     XPRSEC

LE264:  clc
        .byte   $24
LE266:  sec
        ldx     $C027
        ldy     $C30F,x
        bmi     LE2D0
        lda     $C204
        bne     LE277
        dec     $C205
LE277:  dec     $C204
        lda     $C30C,x
        pha
        lda     $C30D,x
        pha
        sec
        lda     $C302
        sbc     #$10
        sta     $C302
        tay
        lda     #$10
        sta     $F2
LE290:  lda     BUF3,y
        stx     $F3
        cpy     $F3
        beq     LE29C
        sta     BUF3,x
LE29C:  lda     #$00
        sta     BUF3,y
        inx
        iny
        dec     $F2
        bne     LE290
        pla
        tay
        pla
LE2AA:  jsr     LDA5D
        lda     PISTE
        ldy     SECTEUR
        jsr     XDETSE
        ldx     #$02
LE2B8:  lda     BUF1,x
        cmp     #$FF
        beq     LE2DC
        inx
        bne     LE2B8
        lda     BUF1
        ldy     $C101
        bne     LE2AA
LE2CA:  jsr     XSMAP
        jmp     XSCAT

LE2D0:  bcs     LE2D5
LE2D2:  jsr     LDAB4
LE2D5:  ldx     #$09
        jsr     LD36C
        sec
        rts

LE2DC:  lda     $C108,x
        sta     $F5
        lda     $C109,x
        sta     $F6
        txa
        clc
        adc     #$0A
        tax
LE2EB:  txa
        pha
        lda     BUF1,x
        ldy     $C101,x
        jsr     XDETSE
        pla
        tax
        inx
        inx
        bne     LE312
        lda     BUF1
        ldy     $C101
        beq     LE2CA
        jsr     LDA5D
        lda     PISTE
        ldy     SECTEUR
        jsr     XDETSE
        ldx     #$02
LE312:  ldy     $F5
        bne     LE318
        dec     $F6
LE318:  dec     $F5
        lda     $F5
        ora     $F6
        bne     LE2EB
        beq     LE2B8
LE322:  jsr     LDAB4
        lda     #$20
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
        bpl     LE341
        lda     #$50
LE341:  .byte   $4C
        rol     a
LE343:  .byte   $D6
CMD_DIR:jsr     LD451
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
        beq     LE377
        ldx     #$11
        dey
        beq     LE377
        ldx     #$12
        jsr     LD36C
        lda     $C20A
        jsr     XAFCAR
        ldx     #$13
LE377:  jsr     LD36C
        ldy     #$EB
LE37C:  lda     $C01E,y
        jsr     XAFCAR
        iny
        bne     LE37C
        jsr     LE41F
        jsr     LD206
        jsr     XTVNM
        bne     LE399
        beq     LE3C5
LE392:  sei
        jsr     LE41F
        jsr     LDB41
LE399:  beq     LE3C2
        jsr     LE322
        jsr     LDB41
        beq     LE3BF
        jsr     LD628
        jsr     LD628
        jsr     LE322
        cli
        jsr     LD302
        bpl     LE392
LE3B2:  jsr     LD302
        bpl     LE3B2
        cmp     #$20
        beq     LE392
        cmp     #$1B
        bne     LE3B2
LE3BF:  jsr     LD206
LE3C2:  jsr     LD206
LE3C5:  lda     #$2A
        sta     $C04C
        lda     $C202
        ldy     $C203
        jsr     LD756
        ldx     #$07
        jsr     LD36C
        lda     #$00
        sta     $C04C
        lda     #$44
        bit     $C209
        bmi     LE3E6
        lda     #$53
LE3E6:  jsr     XAFCAR
        lda     #$2F
        jsr     XAFCAR
        lda     $C206
        ldx     #$01
        jsr     LD750
        lda     #$2F
        jsr     XAFCAR
        lda     $C207
        jsr     LD74E
        lda     #$29
        jsr     XAFCAR
        nop
        nop
        nop
        lda     #$20
        sta     $C04C
        lda     $C204
        ldy     $C205
        ldx     #$01
        jsr     LD758
        plp
        ldx     #$08
        jsr     LD36C
LE41F:  bit     $02F1
        bmi     LE430
        lda     $026A
        and     #$20
        bne     LE430
        lda     ATMORI
        bpl     LE433
LE430:  jmp     LD206

LE433:  rts

LE434:  .byte   $4C
        .byte   $23
LE436:  .byte   $DE
CMD_DELBAK:
        jsr     LE60D
        bne     LE434
        ldx     #$09
        jsr     LD34D
        sec
        .byte   $B0
LE443:  php
CMD_DESTROY:
        sec
LE445:  .byte   $24
CMD_DEL:clc
        php
        jsr     LD451
        plp
        ror     $C072
        jsr     LDB2D
        bne     LE457
        jmp     LE0DD

LE457:  jsr     LD7A0
        bcc     LE473
        jsr     LE264
        bcc     LE4A7
LE461:  rts

LE462:  jsr     XAFCAR
LE465:  jsr     LD206
        jsr     LDB41
LE46B:  ldx     $C027
        jsr     LDB48
        beq     LE4A7
LE473:  jsr     LDAB4
        bit     $C072
        bmi     LE49B
        ldx     #$0A
        jsr     LD36C
LE480:  jsr     LD302
        jsr     LD3A1
        cmp     #$4E
        beq     LE462
        cmp     #$1B
        beq     LE461
        cmp     #$59
        bne     LE480
        jsr     XAFCAR
        jsr     LD206
        jsr     LDAB4
LE49B:  jsr     LE266
        bcs     LE465
        ldx     #$0B
        jsr     LD36C
        bmi     LE46B
LE4A7:  lda     #$00
        sta     $F5
        lda     $C204
        ldx     $C205
        clc
        .byte   $24
LE4B3:  sec
        sbc     #$0F
        inc     $F5
        bcs     LE4B3
        dex
        bpl     LE4B3
        ldx     $C208
        cpx     $F5
        beq     LE461
        dex
        lda     #$14
        ldy     #$04
        stx     $F5
LE4CB:  dec     $F5
        bne     LE4D5
        sta     $C05C
        sty     $C05D
LE4D5:  jsr     LDA5D
        lda     BUF1
        ldy     $C101
        bne     LE4CB
        ldy     #$10
        sty     $F5
LE4E4:  jsr     LDBA5
        ldy     $F5
LE4E9:  cpy     $C102
        beq     LE502
        lda     BUF1,y
        sta     BUF3,x
        iny
        inx
        stx     $C302
        bne     LE4E9
        sty     $F5
        jsr     XSCAT
        beq     LE4E4
LE502:  jsr     XSCAT
        dec     $C208
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
        ldx     $C208
        cpx     #$05
        bcc     LE531
        jsr     XDETSE
LE531:  jsr     XSMAP
        .byte   $4C
        .byte   $A7
LE536:  .byte   $E4
CMD_REN:jsr     LD451
        ldx     #$0B
LE53C:  lda     $C029,x
        sta     BUF1,x
        dex
        bpl     LE53C
        lda     $C028
        pha
        lda     #$C3
        jsr     LD22E
        jsr     LD451
        pla
        cmp     $C028
        bne     LE56A
        ldx     #$0C
LE559:  ldy     $C029,x
        lda     BUF1,x
        sta     $C029,x
        cmp     #$3F
        beq     LE56D
        cpy     #$3F
        bne     LE571
LE56A:  jmp     LD5AC

LE56D:  cpy     #$3F
        bne     LE56A
LE571:  tya
        sta     $C110,x
        dex
        bpl     LE559
        jsr     LDB2D
        bne     LE585
        jmp     LE0DD

LE580:  jsr     LDB41
        beq     LE5FB
LE585:  lda     $C025
        ldy     $C026
        sta     $F5
        sty     $F6
        stx     $F7
        ldy     #$00
LE593:  lda     $C029,y
        cmp     #$3F
        bne     LE59F
        lda     BUF3,x
        bcs     LE5A2
LE59F:  lda     $C110,y
LE5A2:  sta     $C029,y
        inx
        iny
        cpy     #$0C
        bne     LE593
LE5AB:  lda     BUF3,x
        sta     $C029,y
        inx
        iny
        cpy     #$10
        bne     LE5AB
        jsr     XTVNM
        php
        beq     LE5C5
        jsr     LDAB4
        ldx     #$0E
        jsr     LD36C
LE5C5:  lda     $F5
        ldy     $F6
        sta     $C025
        sty     $C026
        ldx     $F7
        stx     $C027
        plp
        bne     LE5EE
        jsr     LDA63
        jsr     LDAB4
        jsr     LDAEE
        ldx     #$0F
        jsr     LD36C
        jsr     XSCAT
        jsr     LDAB4
        jsr     LD206
LE5EE:  ldy     #$0B
LE5F0:  lda     BUF1,y
        sta     $C029,y
        dey
        bpl     LE5F0
        bmi     LE580
LE5FB:  rts

CMD_SEARCH:
        jsr     LD451
        jsr     LDB2D
        php
        lda     #$00
        plp
        beq     LE60A
        lda     #$01
LE60A:  jmp     LD7D5

LE60D:  ldy     DRVDEF
        jsr     LD39E
        beq     LE622
        sbc     #$41
        cmp     #$04
        bcs     LE622
        tay
        jsr     LD7C0
        jmp     LD398

LE622:  jsr     LD7C0
        jmp     LD39E

        jmp     LE0DD

        jmp     LE2D2

LE62E:  lda     #$14
        ldy     #$02
        sty     $2F
        rts

LE635:  ldy     #$03
        jmp     LDC8B

LE63A:  clc
        .byte   $24
LE63C:  sec
        pha
        tya
        pha
        lda     PISTE
        pha
        lda     SECTEUR
        pha
        ldx     #$06
LE64A:  lda     $C202,x
        pha
        dex
        bpl     LE64A
        bcs     LE65B
        jsr     LE635
        jsr     XPMAP
        beq     LE667
LE65B:  stx     $2F
        jsr     LDC89
        lda     #$14
        ldy     #$03
        jsr     LDA50
LE667:  ldx     #$00
LE669:  pla
        sta     $C202,x
        inx
        cpx     #$07
        bcc     LE669
        pla
        sta     SECTEUR
        pla
        sta     PISTE
        pla
        tay
        pla
        sec
        rts

LE67F:  ldx     #$00
LE681:  lda     $C210,x
        bne     LE697
        inx
        cpx     #$F0
        bne     LE681
        bit     $2F
        bpl     LE692
        jmp     LDC78

LE692:  jsr     LE63C
        bcs     LE67F
LE697:  lda     $C202
        bne     LE69F
        dec     $C203
LE69F:  dec     $C202
        bit     $2F
        bmi     LE6A9
        jmp     LDC90

LE6A9:  lda     #$60
        sta     LDCA8
        jsr     LDC90
        lda     #$A9
        sta     LDCA8
        txa
        ldx     #$00
        clc
        adc     #$F0
        bcc     LE6BF
        inx
LE6BF:  stx     $F3
        jmp     LDCAD

LE6C4:  ror     a
        ldx     $F3
        bne     LE6CD
        cmp     #$F0
        bcc     LE6DC
LE6CD:  bit     $2F
        bmi     LE6D4
        jsr     LE63C
LE6D4:  sec
        sbc     #$F0
LE6D7:  tax
        sec
        jmp     LDD0E

LE6DC:  bit     $2F
        bpl     LE6D7
        jsr     LE63A
        bcs     LE6D7
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
LE70A:  nop
CMD_KEY:jsr     LE94D
        bcc     LE719
        lda     V1T1L+1
        sta     V1T1+1
        lda     #$40
        .byte   $2C
LE719:  lda     #$00
        sta     V1ACR
LE71E:  rts

CMD_OUT:jsr     LD27F
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
LE737:  bit     V1IFR
        beq     LE737
        rts

        .byte   $4C
        .byte   $23
LE73F:  .byte   $DE
CMD_WIDTH:
        php
        ldx     #$00
        plp
        beq     LE74E
        cmp     #$8F
        bne     LE74E
        jsr     LD398
        inx
LE74E:  txa
        pha
        bit     ATMORI
        bmi     LE757
        inx
        inx
LE757:  lda     MISC1,x
        tax
        jsr     LD39E
        beq     LE763
        jsr     LD27F
LE763:  bit     ATMORI
        bmi     LE77B
        pla
LE769:  stx     $31
        txa
        sec
LE76D:  sbc     #$08
        bcs     LE76D
        eor     #$FF
        sbc     #$06
        clc
        adc     $31
        sta     $32
        rts

LE77B:  bit     $02F1
        bpl     LE78A
        pla
        bne     LE769
        stx     NUMBER_OF_LINES_FOR_PRINTER
        sta     $0259
        rts

LE78A:  pla
        beq     LE769
        stx     NUMBER_OF_COLUMN_FOR_PRINTER
        lda     #$00
        sta     $0258
LE795:  rts

CMD_RANDOM:
        beq     LE79E
        jsr     LD216
LE79B:  jmp     LD2E2

LE79E:  lda     V1T1
        ldy     V1T1+1
        sta     $D0
        sty     $D1
        lda     V1T2
        ldy     V1T2+1
        sta     $D2
        sty     $D3
        jmp     LE79B

LE7B5:  .byte   $4C
        .byte   $23
LE7B7:  .byte   $DE
CMD_RESET:
        bne     LE7B5
        sei
        lda     #$00
        .byte   $4C
        .byte   $AD
LE7BF:  .byte   $04
CMD_PR: jsr     LE94D
        bcc     LE7D6
LE7C5:  ldy     ATMORI
        bne     LE7CD
        ror     $02F1
LE7CD:  .byte   $4C
        .byte   $BC
LE7CF:  .byte   $D1
CMD_LDIR:
        jsr     LE7C5
        jsr     CMD_DIR
LE7D6:  .byte   $4C
        .byte   $C4
LE7D8:  .byte   $D1
CMD_RESTORE:
        php
        ldx     $9A
        ldy     $9B
        plp
        beq     LE7EB
        jsr     LD2FA
        jsr     LD19C
        ldx     $CE
        ldy     $CF
LE7EB:  txa
        bne     LE7EF
        dey
LE7EF:  dex
        stx     $B0
        sty     $B1
LE7F4:  rts

CMD_QUIT:
        bne     LE7B5
        lda     $043E
        ldy     $043F
        sta     $F0
        sty     $F1
        php
        sei
        bit     ATMORI
        bpl     LE828
        lda     #$22
        ldy     #$EE
        sta     BASIC11_IRQ_VECTOR
        sty     BASIC11_IRQ_VECTOR+1
        lda     #$78
        ldy     #$EB
        sta     $023C
        sty     $023D
        lda     #$B2
        ldy     #$F8
        sta     BASIC11_IRQ_VECTOR+3
        sty     $0249
        plp
        rts

LE828:  lda     #$03
        ldy     #$EC
        sta     $0229
        sty     $022A
        lda     #$30
        ldy     #$F4
        sta     $022C
        sty     $022D
        plp
LE83D:  rts

        lda     $C013
        ldy     $C014
        sta     $E9
        sty     $EA
        lda     $C011
        ldy     $C012
        sta     $A8
        sty     $A9
LE852:  rts

CMD_STRUN:
        jsr     LD25C
        jsr     LD224
        jsr     LD274
        cmp     #$44
        bcs     LE89A
        tax
        tay
        dey
LE863:  lda     ($91),y
        sta     $35,y
        dey
        bpl     LE863
LE86B:  iny
        lda     LCD10,y
        sta     $35,x
        inx
        cpy     #$0A
        bne     LE86B
        lda     $E9
        ldy     $EA
        sta     $C013
        sty     $C014
        lda     $A8
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

LE89A:  .byte   $4C
        .byte   $77
LE89C:  .byte   $E9
CMD_TKEN:
        jsr     LD25C
        jsr     LD238
        jsr     LD274
        cmp     #$4F
        bcs     LE89A
        tax
        tay
LE8AC:  lda     ($91),y
        sta     $35,y
        dey
        bpl     LE8AC
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
        dey
LE8CE:  lda     $35,y
        sta     ($D1),y
        dey
        bpl     LE8CE
LE8D6:  ldy     #$02
LE8D8:  lda     $D0,y
        sta     ($B6),y
        dey
        bpl     LE8D8
LE8E0:  rts

CMD_UNTKEN:
        jsr     LD238
        jsr     LD274
        tax
        beq     LE8E0
        sta     $F3
        ldx     #$00
        ldy     #$00
LE8F0:  lda     #$E9
        sta     $16
        lda     #$C0
        sta     $17
        sty     $F2
        lda     ($91),y
        bpl     LE929
        and     #$7F
        beq     LE915
        sta     $26
        ldy     #$00
LE906:  inc     $16
        bne     LE90C
        inc     $17
LE90C:  jsr     DO_EXEVEC
        bpl     LE906
        dec     $26
        bne     LE906
LE915:  ldy     #$01
LE917:  inx
        beq     LE938
        jsr     DO_EXEVEC
        php
        and     #$7F
        sta     $C0FF,x
        iny
        plp
        bpl     LE917
        bmi     LE92F
LE929:  inx
        beq     LE938
        sta     $C0FF,x
LE92F:  dec     $F3
        beq     LE93B
        ldy     $F2
        iny
        bne     LE8F0
LE938:  jmp     LE977

LE93B:  txa
        jsr     LD264
        ldy     $D0
LE941:  dey
        lda     BUF1,y
        sta     ($D1),y
        tya
        bne     LE941
        jmp     LE8D6

LE94D:  ldy     #$02
LE94F:  lda     ($E9),y
        and     #$DF
        cmp     LCD2E,y
        bne     LE95D
        dey
        bpl     LE94F
        bmi     LE96C
LE95D:  ldy     #$02
LE95F:  lda     ($E9),y
        and     #$DF
        cmp     LCD2B,y
        bne     LE974
        dey
        bpl     LE95F
        clc
LE96C:  php
        ldy     #$03
        jsr     LD1E3
        plp
        rts

LE974:  jmp     LDE23

LE977:  ldx     #$12
        jmp     LD67E

LE97C:  .byte   $4C
        .byte   $20
LE97E:  .byte   $DE
CMD_ERR:jsr     LE94D
        lda     #$00
        sta     $C01C
        sta     $C01B
        ror     a
        sta     $C018
        ldy     #$37
        ldx     #$FF
        sty     $C019
        stx     $C01A
LE998:  rts

CMD_ERRGOTO:
        jsr     LD2FA
        sta     $C01C
        sty     $C01B
        jsr     LD19C
        ldx     $CF
        ldy     $CE
        bne     LE9AC
        dex
LE9AC:  dey
        .byte   $4C
        .byte   $92
LE9AF:  .byte   $E9
CMD_ERROR:
        jsr     LD27F
        cpx     #$32
        bcc     LE97C
        dex
        .byte   $4C
        .byte   $7E
LE9BA:  .byte   $D6
CMD_RESUME:
        beq     LE9C3
        lda     #$90
        jsr     LD22E
        iny
LE9C3:  php
        lda     $C021
        ldy     $C022
        sta     $E9
        sty     $EA
        lda     NOLIGN
        ldy     NOLIGN+1
        sta     $A8
        sty     $A9
        plp
        beq     LE9DE
        jmp     LD1DC

LE9DE:  dec     $EA
        ldy     #$FF
        lda     ($E9),y
        cmp     #$3A
        beq     LE9EA
        ldy     #$FB
LE9EA:  .byte   $4C
        .byte   $E3
LE9EC:  .byte   $D1
CMD_EXT:ldy     #$03
LE9EF:  .byte   $2C
CMD_VISUHIRES:
        ldy     #$51
LE9F2:  .byte   $2C
CMD_STATUS:
        ldy     #$54
LE9F5:  .byte   $2C
CMD_PROT:
        ldy     #$57
LE9F8:  .byte   $2C
CMD_UNPROT:
        ldy     #$5A
LE9FB:  .byte   $2C
CMD_SYSTEM:
        ldy     #$5D
LE9FE:  .byte   $2C
CMD_CHKSUM:
        ldy     #$79
        ldx     #$60
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
        nop
LEA30:  inx
        stx     $F2
        ldx     #$3F
        rts

LEA36:  stx     $30
        .byte   $4C
        .byte   $3E
LEA3A:  .byte   $D7
CMD_SWAP:
        jsr     LD238
        sta     $B8
        .byte   $84
LEA41:  lda     $28A5,y
        pha
        lda     $29
        pha
        jsr     LD22C
        jsr     LD238
        sta     $91
        sty     $92
        pla
        cmp     $29
        bne     LEA77
        pla
        cmp     $28
        bne     LEA77
        ldy     #$01
        bit     $28
        bmi     LEA68
        bit     $29
        bmi     LEA69
        iny
        iny
LEA68:  iny
LEA69:  lda     ($91),y
        tax
        lda     ($B8),y
        sta     ($91),y
        txa
        sta     ($B8),y
        dey
        bpl     LEA69
        rts

LEA77:  ldx     #$0B
        jmp     LD67E

LEA7C:  .byte   $4C
        .byte   $20
LEA7E:  .byte   $DE
CMD_USER:
        jsr     LD27F
        txa
        cmp     #$04
        bcs     LEA7C
        asl     a
        adc     $D4
        sta     $F6
        tax
        lda     $C068,x
        sta     $F7
        lda     #$00
        ldx     #$03
LEA96:  sta     $F2,x
        dex
        bpl     LEA96
LEA9B:  jsr     LD39E
        cmp     #$2C
        bne     LEAE8
        jsr     LD398
        ldy     #$04
LEAA7:  cmp     MISC2,y
        beq     LEAB1
        dey
        bpl     LEAA7
        bmi     LEAE8
LEAB1:  jsr     LD398
        cpy     #$04
        bne     LEADA
        jsr     LD2FA
        ldx     $F6
        sta     $C067,x
        tya
        sta     $C066,x
        jsr     LD39E
        beq     LEAD3
        jsr     LD22C
        lda     #$4F
        jsr     LD22E
        ldx     #$80
LEAD3:  txa
        ldx     $F6
        sta     $C068,x
        rts

LEADA:  tya
        pha
        jsr     LD27F
        pla
        tay
        stx     $F2,y
        jsr     LD39E
        bne     LEA9B
LEAE8:  ldy     $F4
        lda     $F5
        pha
        ldx     $F6
        lda     $C066,x
        sta     EXEVEC+1
        lda     $C067,x
        sta     EXEVEC+2
        lda     $F2
        ldx     $F3
        bit     $F7
        bpl     LEB0A
        plp
        jsr     LEB22
        jmp     LEB0E

LEB0A:  plp
        jsr     L0471
LEB0E:  pha
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

LEB22:  .byte   $6C
        .byte   $F0
LEB24:  .byte   $04
CMD_NUM:ldy     #$03
LEB27:  lda     $C03E,y
        sta     $C042,y
        dey
        bpl     LEB27
        jsr     LD39E
        beq     LEB90
        cmp     #$80
        bne     LEB72
        jsr     LD398
        ldx     $9A
        lda     $9B
LEB40:  stx     $CE
        sta     $CF
        ldy     #$00
        lda     ($CE),y
        tax
        iny
        lda     ($CE),y
        beq     LEB5E
        pha
        iny
        lda     ($CE),y
        sta     $C042
        iny
        lda     ($CE),y
        sta     $C043
        pla
        bne     LEB40
LEB5E:  clc
        lda     $C042
        adc     $C044
        sta     $C042
        lda     $C043
        adc     $C045
        sta     $C043
        rts

LEB72:  cmp     #$2C
        beq     LEB84
        jsr     LD2FA
        sta     $C043
        sty     $C042
        jsr     LD39E
        beq     LEB90
LEB84:  jsr     LD22C
        jsr     LD2FA
        sta     $C045
        sty     $C044
LEB90:  rts

CMD_ACCENT:
        jsr     LE94D
        jsr     LDFDE
        lda     $C03D
        and     #$80
        bcc     LEBA0
        ora     #$40
LEBA0:  sta     $C03D
LEBA3:  bit     $C03D
        bvs     LEBAD
        ldx     #$05
        jmp     LD332

LEBAD:  lda     #$06
        sta     $F2
        ldx     #$00
LEBB3:  lda     #$08
        sta     $F3
        sta     $F5
        lda     ACCENTED_FONT,x
        inx
        asl     a
        asl     a
        rol     $F5
        asl     a
        rol     $F5
        sta     $F4
        lda     $F5
        adc     #$94
        sta     $F5
        ldy     #$00
LEBCE:  lda     ACCENTED_FONT,x
        sta     ($F4),y
        inx
        iny
        dec     $F3
        bne     LEBCE
        dec     $F2
        bne     LEBB3
LEBDD:  rts

CMD_AZERTY:
        lda     #$C0
LEBE0:  .byte   $2C
CMD_QWERTY:
        lda     #$00
        sta     $C03D
        jsr     LDFDE
        .byte   $4C
        .byte   $A3
LEBEB:  .byte   $EB
CMD_LCUR:
        lda     $0269
        ldy     $0268
        .byte   $4C
        .byte   $FB
LEBF4:  .byte   $EB
CMD_HCUR:
        lda     $0219
        ldy     $021A
        pha
        tya
        jsr     LD7E7
        pla
        .byte   $4C
        .byte   $E4
LEC03:  .byte   $D7
CMD_LBRACKET:
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
        lda     #$0F
        sta     $026A
        lda     #$0C
        jsr     XAFCAR
        .byte   $4C
        .byte   $A3
LEC2D:  .byte   $EB
CMD_INSTR:
        jsr     LD224
        jsr     LD274
        sta     $F2
        tay
LEC37:  dey
        lda     ($91),y
        sta     BUF1,y
        tya
        bne     LEC37
        jsr     LD22C
        jsr     LD224
        jsr     LD274
        sta     $F3
        stx     $B8
        sty     $B9
        jsr     LD22C
        jsr     LD27F
        bne     LEC8E
        dex
        stx     $F6
        cpx     $F2
        bcs     LEC91
        lda     $F2
        beq     LEC7E
LEC62:  ldx     $F3
        beq     LEC7E
        lda     $F6
        sta     $F7
        lda     #$C1
        sta     $F8
        ldy     #$00
LEC70:  lda     ($F7),y
        cmp     ($B8),y
        bne     LEC84
        iny
        dex
        bne     LEC70
        ldy     $F6
        iny
        .byte   $2C
LEC7E:  ldy     #$00
        tya
        jmp     LD7DB

LEC84:  inc     $F6
        lda     $F6
        cmp     $F2
        beq     LEC7E
        bne     LEC62
LEC8E:  jmp     LDE23

LEC91:  .byte   $4C
        .byte   $20
LEC93:  .byte   $DE
CMD_LINPUT:
        tax
        lda     $026A
        pha
        cpx     #$C6
        bne     LECBB
        jsr     LD398
        jsr     XCUROFF
        jsr     LD292
        ldy     $20
        sta     $12
        sty     $13
        stx     $0268
        ldx     $02F8
        stx     $0269
        jsr     LEA36
        .byte   $20
LECB9:  .byte   $2C
        .byte   $D2
LECBB:  jsr     LD224
        bit     $28
        bpl     LECD7
        jsr     LD277
        beq     LECCC
        ldy     #$00
        lda     ($91),y
        .byte   $2C
LECCC:  lda     #$2E
        sta     $C075
        jsr     LD22C
        jsr     LD224
LECD7:  jsr     LD219
        jsr     LD282
        txa
        beq     LED2B
        stx     $F2
        lda     #$3B
        jsr     LD22E
        sty     $F3
        jsr     LED2E
        jsr     LD21B
        jsr     LD39E
        beq     LED19
LECF4:  jsr     LD22C
        jsr     LD3A1
        ldx     #$04
        stx     $F4
LECFE:  asl     $F4
        cmp     LCDBA,x
        beq     LED0A
        dex
        bpl     LECFE
        bmi     LED28
LED0A:  lda     $F4
        eor     $F3
        cmp     $F3
        bcc     LED28
        sta     $F3
        jsr     LD398
        bne     LECF4
LED19:  jsr     LED36
        jsr     LEE8E
        pla
        sta     $026A
        lda     $F4
        jmp     LD7D8

LED28:  jmp     LDE23

LED2B:  jmp     LDE20

LED2E:  jsr     LD238
        sta     $B8
        sty     $B9
        rts

LED36:  lda     $F3
        and     #$08
        bne     LED52
LED3C:  jsr     XCUROFF
        ldx     $F2
        lda     $C075
LED44:  jsr     XAFCAR
        dex
        bne     LED44
LED4A:  jsr     XCUROFF
        ldx     $F2
        jsr     LEE69
LED52:  jsr     XCURON
        ldx     #$00
        ldy     #$26
        lda     $026A
        and     #$20
        beq     LED62
        ldy     #$28
LED62:  sty     $F5
LED64:  jsr     LD843
        bpl     LED64
        cmp     #$14
        beq     LED90
        cmp     #$7F
        bne     LED7F
        txa
        beq     LED64
        jsr     LEE73
        lda     $C075
        jsr     XAFCAR
        lda     #$08
LED7F:  cmp     #$0E
        bne     LED88
        jsr     LEE69
        beq     LED3C
LED88:  cmp     #$04
        beq     LED90
        cmp     #$1A
        bne     LED95
LED90:  jsr     XAFCAR
LED93:  bne     LED64
LED95:  cmp     #$20
        bcc     LEDAD
        jsr     XAFCAR
        inx
        cpx     $F2
        bne     LED64
        bit     $F3
        bvc     LED4A
        dex
        jsr     LEE73
        ldy     #$06
        bne     LEE04
LEDAD:  ldy     #$00
        cmp     #$0D
        beq     LEDFC
        iny
        cmp     #$1B
        beq     LEDFC
        iny
        cmp     #$08
        bne     LEDC6
        txa
        beq     LEDFC
        dex
        jsr     LEE73
        bne     LED64
LEDC6:  iny
        cmp     #$09
        bne     LEDD9
        inx
        cpx     $F2
        beq     LEDD5
        jsr     LEE76
        bne     LED93
LEDD5:  dex
        jmp     LEDFC

LEDD9:  iny
        cmp     #$0A
        bne     LEDED
        clc
        txa
LEDE0:  adc     $F5
        bcs     LEDFC
        cmp     $F2
        bcs     LEDFC
        tax
        lda     #$0A
        bne     LED90
LEDED:  iny
        cmp     #$0B
        bne     LED93
        txa
        sbc     $F5
        bcc     LEDFC
        tax
        lda     #$0B
        bne     LED90
LEDFC:  cpy     #$02
        bcc     LEE04
        lda     $F3
        bmi     LED93
LEE04:  sty     $F4
        jsr     XCUROFF
LEE09:  inx
        cpx     $F2
        bcs     LEE13
        jsr     LEE76
        bne     LEE09
LEE13:  lda     $F2
        jsr     LD264
        ldy     $F2
LEE1A:  sty     $F5
        ldy     $0269
        lda     ($12),y
        .byte   $C9
LEE22:  jsr     L02B0
        ora     #$80
        ldy     $F5
        dey
        php
        sta     ($D1),y
        jsr     LEE73
        plp
        bne     LEE1A
        ldx     $F2
LEE35:  jsr     LEE76
        dex
        bne     LEE35
        asl     $F3
        asl     $F3
        ldy     $F2
LEE41:  dey
        lda     ($D1),y
        cmp     $C075
        bne     LEE61
        lda     #$20
        bit     $F3
        bpl     LEE51
        sta     ($D1),y
LEE51:  bvc     LEE59
        jsr     XAFCAR
        jsr     LEE73
LEE59:  jsr     LEE73
        tya
        bne     LEE41
        .byte   $24
LEE60:  iny
LEE61:  jsr     LEE76
        cpy     $F2
        bne     LEE60
        rts

LEE69:  txa
        beq     LEE72
        jsr     LEE73
        dex
        bne     LEE69
LEE72:  rts

LEE73:  lda     #$08
        .byte   $2C
LEE76:  lda     #$09
        .byte   $24
LEE79:  pla
        pha
        jsr     XAFCAR
        lda     $026A
        and     #$20
        bne     LEE8C
        lda     $0269
        and     #$FE
        beq     LEE79
LEE8C:  pla
        rts

LEE8E:  ldy     #$02
LEE90:  lda     $D0,y
        sta     ($B8),y
        dey
        bpl     LEE90
LEE98:  rts

CMD_USING:
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
        ldx     #$09
LEEBB:  sta     $CD,x
        dex
        bne     LEEBB
        lda     STACK
        cmp     #$2D
        beq     LEEC9
        lda     #$2B
LEEC9:  sta     $C4
        stx     $F4
        stx     $F5
        lda     #$20
        sta     $F6
        ldy     #$01
        sty     $F2
        dey
        .byte   $2C
LEED9:  ldx     #$09
LEEDB:  iny
        lda     STACK,y
        beq     LEF06
        cmp     #$2E
        beq     LEED9
        cmp     #$45
        beq     LEEF4
        sta     $C5,x
        cpx     #$09
        bcs     LEEF1
        sty     $F2
LEEF1:  inx
        bne     LEEDB
LEEF4:  lda     STACK+1,y
        sta     $D7
        lda     STACK+2,y
        tax
        lda     STACK+3,y
        beq     LEF04
        sta     $D9
LEF04:  stx     $D8
LEF06:  ldx     $F2
        ldy     #$08
LEF0A:  lda     $C4,x
        dex
        bpl     LEF11
        lda     #$20
LEF11:  sta     $C5,y
        dey
        bpl     LEF0A
        .byte   $2C
LEF18:  sty     $F5
LEF1A:  ldy     $F4
        cpy     $22
        bne     LEF48
        lda     #$00
        sta     $D7
        jsr     LD39E
        beq     LEF41
        lda     $F5
        jsr     LD264
        tay
LEF2F:  dey
        lda     BUF1,y
        sta     ($D1),y
        tya
        bne     LEF2F
        jsr     LD22C
        jsr     LD238
        jmp     LE8D6

LEF41:  lda     #$00
        ldy     #$C1
        jmp     XAFSTR

LEF48:  jsr     LF02B
        cmp     #$5E
        bne     LEF68
; $ef4f
display_exp_scientific_notation:
        ldx     #$FD
LEF51:  lda     LFFDA,x
        .byte   $2C
LEF55:  lda     #$20
        .byte   $2C
LEF58:  lda     $C4
; $ef5a
display_char_in final_string:
        sta     BUF1,y
        iny
        bne     LEF63
        jmp     LE977

LEF63:  inx
        bne     LEF51
        beq     LEF18
LEF68:  cmp     #$2B
        beq     LEF58
        cmp     #$2D
        bne     LEF78
        lda     STACK
        lsr     a
        bcs     LEF58
        bcc     LEF55
LEF78:  cmp     #$23
        bne     LEF83
        jsr     LEFA7
        ldx     #$09
        bne     LEF93
LEF83:  cmp     #$25
        bne     LEFB9
        jsr     LEFA7
        cmp     $F2
        bcc     LEFB3
        lda     #$09
        sbc     $F3
        tax
LEF93:  dec     $F3
        bpl     LEF9A
        jmp     LEF18

LEF9A:  lda     $C5,x
        and     #$7F
        sta     BUF1,y
        iny
        beq     LEFB6
        inx
        bne     LEF93
LEFA7:  jsr     LF02B
        sbc     #$30
        sta     $F3
        cmp     #$0A
        bcs     LEFB3
        rts

LEFB3:  jmp     LDE20

LEFB6:  jmp     LE977

LEFB9:  cmp     #$21
        bne     LEFFC
        jsr     LEFA7
        sec
        lda     #$09
        sbc     $F3
LEFC5:  sta     $F3
        tax
        lda     $C5,x
        cmp     $F6
        beq     LF028
        lda     #$30
        inx
LEFD1:  inx
        cpx     #$12
        beq     LEFDA
        sta     $C5,x
        bne     LEFD1
LEFDA:  ldx     $F3
        inx
        lda     $C5,x
        cmp     #$35
LEFE1:  lda     #$30
LEFE3:  sta     $C5,x
        bcc     LF028
        dex
        bmi     LF028
        lda     $C5,x
        cmp     $F6
        bne     LEFF4
        inc     $F2
        lda     #$30
LEFF4:  cmp     #$39
        beq     LEFE1
        adc     #$01
        bcc     LEFE3
LEFFC:  cmp     #$40
        bne     LF007
        jsr     LEFA7
        adc     #$08
        bcc     LEFC5
LF007:  cmp     #$26
        beq     LF00E
        jmp     display_char_in final_string

LF00E:  jsr     LF02B
        cmp     #$30
        bne     LF017
        ora     #$80
LF017:  tax
        ldy     #$00
LF01A:  lda     $C5,y
        cmp     $F6
        bne     LF026
        stx     $C5,y
        iny
        bne     LF01A
LF026:  stx     $F6
LF028:  jmp     LEF1A

LF02B:  ldy     $F4
        lda     ($91),y
        inc     $F4
        ldy     $F5
        ldx     #$FF
LF035:  rts

CMD_LUSING:
        jsr     LE7C5
        jsr     CMD_USING
        jmp     LE7D6

LF03F:  ldx     #$05
LF041:  lda     LCD1A,x
        sta     $BFDF,x
        lda     LCD1F,x
        sta     $BFE9,x
        dex
        bne     LF041
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
        jsr     LD2C2
        lda     $021F
        bne     LF078
        jmp     LD16F

LF078:  rts

CMD_LINE:
        jsr     LF03F
        jsr     LD216
LF07F:  ldx     #$E5
        ldy     #$BF
        jsr     LD2C2
        ldx     #$00
LF088:  stx     $F2
        lda     #$E0
        ldy     #$BF
        jsr     LD2BA
        ldx     $F2
        beq     LF09E
        jsr     LD2F2
        jsr     LD2DA
        jmp     LF0A1

LF09E:  jsr     LD2EA
LF0A1:  lda     #$E5
        ldy     #$BF
        jsr     LD2AA
        jsr     LD28A
        tax
        beq     LF0B2
        iny
        bne     LF0B2
        inx
LF0B2:  txa
        ldx     $F2
        sta     $02E2,x
        tya
        sta     $02E1,x
        inx
        inx
        cpx     #$02
        beq     LF088
        lsr     $C072
        bcc     LF0D3
        jsr     LD22C
        jsr     LD2FA
        sty     $02E5
        sta     $02E6
LF0D3:  jsr     LD312
        lsr     $02E0
        bcc     LF078
        .byte   $4C
        .byte   $7C
LF0DD:  .byte   $E9
CMD_BOX:jsr     LF03F
        jsr     LD27F
        stx     $F3
        jsr     LD22C
        jsr     LD27F
        stx     $F4
        lda     #$04
        sta     $F5
        lda     #$00
        sta     $F6
LF0F6:  ldx     $F6
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
        bne     LF0F6
LF120:  rts

CMD_VUSER:
        ldy     #$1B
LF123:  .byte   $2C
CMD_DKEY:
        ldy     #$18
LF126:  .byte   $2C
CMD_DSYS:
        ldy     #$15
LF129:  .byte   $2C
CMD_DNUM:
        ldy     #$12
LF12C:  .byte   $2C
CMD_INIST:
        ldy     #$0F
LF12F:  .byte   $2C
CMD_TRACK:
        ldy     #$0C
        ldx     #$56
        .byte   $D0
LF135:  plp
CMD_MOVE:
        ldx     #$42
LF138:  .byte   $2C
CMD_DTRACK:
        ldx     #$56
LF13B:  .byte   $2C
CMD_MERGE:
        ldx     #$4C
        ldy     #$09
        .byte   $D0
LF141:  .byte   $1C
CMD_DELETE:
        ldx     #$42
LF144:  .byte   $2C
CMD_DNAME:
        ldx     #$56
LF147:  .byte   $2C
CMD_CHANGE:
        ldx     #$4C
        ldy     #$06
        .byte   $D0
LF14D:  .byte   $10
CMD_RENUM:
        ldx     #$42
LF150:  .byte   $2C
CMD_BACKUP:
        ldx     #$47
LF153:  .byte   $2C
CMD_SEEK:
        ldx     #$4C
LF156:  .byte   $2C
CMD_COPY:
        ldx     #$51
LF159:  .byte   $2C
CMD_SYS:ldx     #$56
        ldy     #$03
LF15E:  lda     #$C4
        pha
        tya
        pha
        cpx     EXTNB
        beq     LF1B9
LF168:  .byte   $2C
CMD_INIT:
        ldx     #$5B
        txa
        pha
LF16D:  ldx     #$0C
        jsr     LD36C
        lda     DRVSYS
        sta     DRIVE
        jsr     LD648
        cli
        php
        lda     #$0B
        jsr     XAFCAR
        plp
        bcc     LF18F
        pla
        cmp     #$5B
        beq     LF18C
        pla
        pla
LF18C:  jmp     LD1DC

LF18F:  jsr     XPMAP
        lda     $C207
        sta     $C04B
        lda     $C20A
        bne     LF16D
        ldx     #$FF
        pla
        sta     EXTNB
        sec
LF1A4:  tay
        inx
        sbc     $C207
        beq     LF1AD
        bcs     LF1A4
LF1AD:  stx     PISTE
        ldx     #$04
        lda     #$C4
        jsr     XDLOAD
        sec
        .byte   $24
LF1B9:  clc
        ror     $C016
        ldx     #$03
LF1BF:  lda     SEDKERN_START,x
        sta     EXTER,x
        dex
        bpl     LF1BF
        lda     EXTNB
        cmp     #$5B
        beq     LF1D2
        jmp     LD39E

LF1D2:  ldx     #$63
        lda     #$30
        ldy     #$00
        sty     PISTE
        iny
        jsr     XDLOAD
        jsr     LD39E
        jmp     LC404

XDLOAD: stx     $F5
        sta     $C004
        lda     #$00
        sta     RWBUF
        sei
LF1F0:  sty     SECTEUR
        jsr     XPRSEC
        inc     $C004
        ldy     SECTEUR
        cpy     $C04B
        bcc     LF206
        inc     PISTE
        ldy     #$00
LF206:  iny
        dec     $F5
        bne     LF1F0
        cli
        rts

LF20D:  .byte   $4C
        .byte   $E0
LF20F:  .byte   $E0
CMD_WINDOW:
        beq     LF239
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
        beq     LF20D
        lda     #$01
        sta     EXTNB
LF239:  ldy     EXTNB
        dey
        bne     LF20D
        lda     $026A
        pha
        php
        jsr     LDFDE
        lda     #$B8
        ldy     #$BB
        sta     $F2
        sty     $F3
        lda     #$E8
        ldy     #$C3
        sta     $F4
        sty     $F5
        ldx     #$04
        ldy     #$18
LF25B:  lda     ($F4),y
        sta     ($F2),y
        iny
        bne     LF25B
        inc     $F3
        inc     $F5
        dex
        bne     LF25B
        jsr     LF327
        jsr     LF309
LF26F:  jsr     XCURON
        cli
LF273:  jsr     LD845
        bpl     LF273
        sei
        cmp     #$03
        beq     LF2E5
        cmp     #$7F
        bne     LF296
        lda     #$08
        jsr     LF2EC
        bmi     LF26F
        jsr     LF2CA
        bne     LF2A2
        lda     #$09
        jsr     XAFCAR
        lda     #$7F
        bne     LF29A
LF296:  cmp     #$20
        bcc     LF2A4
LF29A:  jsr     XAFCAR
        lda     #$08
        jsr     XAFCAR
LF2A2:  lda     #$09
LF2A4:  cmp     #$08
        bcc     LF29A
        cmp     #$0C
        beq     LF26F
        bcc     LF2C0
        cmp     #$0E
        beq     LF26F
        cmp     #$0D
        bne     LF29A
        lda     #$09
LF2B8:  jsr     LF2EC
        jsr     LF2CA
        beq     LF2B8
LF2C0:  jsr     LF2EC
        jsr     LF2CA
        bne     LF2C0
        beq     LF26F
LF2CA:  pha
        jsr     XCUROFF
        clc
        lda     $12
        adc     #$30
        sta     $F8
        lda     $13
        adc     #$08
        sta     $F9
        ldy     $0269
        lda     ($F8),y
        tay
        pla
        cpy     #$7F
        rts

LF2E5:  plp
        jsr     LF325
        jmp     LF320

LF2EC:  lsr     $F2
LF2EE:  jsr     XAFCAR
        ldy     $0268
        cpy     #$01
        beq     LF2FC
        cpy     #$1B
        bne     LF306
LF2FC:  bit     $F2
        bmi     LF308
        ror     $F2
        eor     #$01
        bne     LF2EE
LF306:  bit     $F2
LF308:  rts

LF309:  lda     #$1E
        jsr     XAFCAR
        jsr     LD206
LF311:  jsr     LF2CA
        beq     LF324
        lda     #$09
        jsr     LF2EC
        bpl     LF311
        pla
        pla
        plp
LF320:  pla
        sta     $026A
LF324:  rts

LF325:  clc
        .byte   $24
LF327:  sec
        ror     $C072
        jsr     LF309
        lda     #$57
        ldy     #$C9
        sta     $B4
        sty     $B5
        lda     #$00
        sta     $F6
        sta     $F7
LF33C:  ldy     #$01
        sty     $26
        dey
        sty     $29
        sty     $27
        dey
        sty     $28
        ldy     $F6
        ldx     $F7
        inc     $F6
        bne     LF352
        inc     $F7
LF352:  jsr     L04D1
        ldy     #$00
        lda     ($B6),y
        sta     $F2
        iny
        lda     ($B6),y
        sta     $91
        iny
        lda     ($B6),y
        sta     $92
        ldx     #$00
LF367:  bit     $C072
        bpl     LF380
        cpx     $F2
        txa
        inx
        beq     LF3CB
        tay
        lda     ($91),y
        bcc     LF393
        lda     #$7F
        ldy     $0269
        sta     ($12),y
        bcs     LF391
LF380:  ldy     $0269
        lda     ($12),y
        cmp     #$7F
        bne     LF38B
        lda     #$20
LF38B:  sta     BUF1,x
        inx
        beq     LF3CB
LF391:  lda     #$09
LF393:  jsr     XAFCAR
        jsr     LF2CA
        beq     LF367
        bit     $C072
        bmi     LF3BC
        stx     $F2
        txa
        jsr     LD264
        ldy     #$00
LF3A8:  lda     BUF1,y
        sta     ($D1),y
        iny
        cpy     $F2
        bne     LF3A8
        ldy     #$02
LF3B4:  lda     $D0,y
        sta     ($B6),y
        dey
        bpl     LF3B4
LF3BC:  lda     #$09
        jsr     LF2EC
        bmi     LF3CE
        jsr     LF2CA
        bne     LF3BC
        jmp     LF33C

LF3CB:  jmp     LE977

LF3CE:  rts

LF3CF:  lda     $0A
        asl     a
        adc     #$08
        bne     LF3E1
LF3D6:  ldy     #$04
LF3D8:  lda     ($9E),y
        pha
        iny
        lda     ($9E),y
        tay
        pla
        .byte   $2C
LF3E1:  ldy     #$00
LF3E3:  clc
        adc     $9E
        sta     $F2
        pha
        tya
        adc     $9F
        sta     $F3
        tax
        pla
        ldy     #$00
        rts

LF3F3:  ldy     #$00
        lda     $9F
        cmp     $A1
        beq     LF402
        lda     ($9E),y
        iny
        and     ($9E),y
        bmi     LF424
LF402:  ldx     $9E
        ldy     $9F
        lda     #$02
        sta     $F2
        lda     #$88
        jsr     LF456
        ldy     #$00
        sty     $C081
        tya
LF415:  sta     ($9E),y
        iny
        bne     LF415
        ldy     #$05
LF41C:  lda     LCD25,y
        sta     ($9E),y
        dey
        bpl     LF41C
LF424:  rts

LF425:  pha
        sty     $F3
        stx     $F9
        clc
        ldy     #$86
LF42D:  lda     ($9E),y
        cmp     $F9
        iny
        lda     ($9E),y
        sbc     $F3
        bcc     LF447
        dey
        clc
        pla
        pha
        adc     ($9E),y
        sta     ($9E),y
        iny
        lda     ($9E),y
        adc     $F2
        sta     ($9E),y
LF447:  dey
        dey
        dey
        bne     LF42D
        txa
        adc     $9E
        tax
        lda     $F3
        adc     $9F
        tay
        pla
LF456:  stx     $CE
        sty     $CF
        clc
        adc     $A0
        sta     $C7
        pha
        lda     $A0
        ldy     $A1
        sta     $C9
        lda     $A1
        sta     $CA
        adc     $F2
        sta     $C8
        tay
        pla
        jmp     LD15C

LF473:  pha
        jsr     LF3F3
        pla
        tax
        clc
        php
        bcc     LF487
LF47D:  clc
        .byte   $24
LF47F:  sec
        php
        jsr     LF3F3
        jsr     LD27F
LF487:  cpx     #$40
        bcs     LF4A5
        stx     $0A
        jsr     LF3CF
        iny
        plp
        lda     ($F2),y
        bne     LF4A0
        bcs     LF4A2
        ldx     #$0D
        .byte   $2C
LF49B:  ldx     #$0E
        jmp     LD67E

LF4A0:  bcs     LF49B
LF4A2:  jmp     LD39E

LF4A5:  jmp     LDE20

LF4A8:  lda     #$88
        ldy     #$00
        jsr     LF3E3
        sta     $06
        stx     $07
        lda     $0A
        asl     a
        adc     #$08
        tay
        jsr     LF3D8
        sta     L0000
        clc
        adc     #$17
        sta     $02
        sta     $04
        txa
        sta     $01
        adc     #$00
        sta     $03
        adc     #$01
        sta     $05
        iny
        lda     (L0000),y
        sta     $C083
        dey
        lda     (L0000),y
        sta     $0B
        rts

LF4DC:  clc
        adc     $02
        sta     $02
        bcc     LF4E5
        inc     $03
LF4E5:  rts

LF4E6:  lda     #$80
        .byte   $2C
LF4E9:  lda     #$00
        .byte   $2C
LF4EC:  lda     #$01
        .byte   $2C
LF4EF:  lda     #$40
        sta     $C082
        lda     #$06
        jsr     LF3E1
        lda     ($F2),y
        sta     $F4
        iny
        lda     ($F2),y
        sta     $F5
        jsr     LF3D6
LF505:  lda     $F4
        ora     $F5
        beq     LF55F
        lda     $F4
        bne     LF511
        dec     $F5
LF511:  dec     $F4
        ldy     #$06
        bit     $C082
        bpl     LF526
        sec
        lda     ($F2),y
        sbc     $0A
        bne     LF552
        tay
        sta     ($F2),y
        beq     LF552
LF526:  bvc     LF548
        ldy     #$00
        lda     ($F2),y
        bne     LF552
LF52E:  lda     $F2
        ldy     $F3
        sta     $F4
        sty     $F5
        rts

LF537:  ldy     #$09
        lda     $C082
        bne     LF52E
LF53E:  lda     ($F2),y
        sta     $C076,y
        dey
        bpl     LF53E
        bmi     LF52E
LF548:  dey
        bmi     LF537
        lda     ($F2),y
        cmp     $C076,y
        beq     LF548
LF552:  lda     #$0A
        clc
        adc     $F2
        sta     $F2
        bcc     LF505
        inc     $F3
        bcs     LF505
LF55F:  bit     $C082
        bvc     LF5AC
        ldy     #$04
        lda     ($9E),y
        pha
        tax
        iny
        lda     ($9E),y
        pha
        tay
        txa
        jsr     LF3E3
        jsr     LF52E
        pla
        tay
        pla
        tax
        lda     #$00
        sta     $F2
        lda     #$64
        jsr     LF425
        sec
LF584:  ldy     #$04
        lda     ($9E),y
        sbc     #$64
        sta     ($9E),y
        iny
        lda     ($9E),y
        sbc     #$00
        sta     ($9E),y
        ldy     #$06
        lda     #$09
        adc     ($9E),y
        sta     ($9E),y
        iny
        lda     ($9E),y
        adc     #$00
        sta     ($9E),y
        lda     #$00
        ldy     #$63
LF5A6:  sta     ($F4),y
        dey
        bpl     LF5A6
        rts

LF5AC:  bmi     LF5B4
        lsr     $C082
        bcc     LF5B5
        clc
LF5B4:  rts

LF5B5:  ldx     #$13
        jmp     LD67E

LF5BA:  jsr     LF640
        jsr     LF3F3
        lda     #$D3
        jsr     LD22E
        jsr     LED2E
        jsr     LF4E9
        jsr     LF67A
        lda     $C07C
        sta     $0A
        jsr     LF4A8
        lda     $C07D
        jsr     LF4DC
LF5DC:  ldx     $0B
        dex
        bne     LF5E9
        ldx     $C07F
        ldy     $C07E
        bne     LF5F7
LF5E9:  ldy     #$00
        lda     ($02),y
        iny
        tax
        lda     ($02),y
        tay
        lda     #$02
        jsr     LF4DC
LF5F7:  sty     $F5
        txa
        bmi     LF625
        bne     LF60A
        lda     $02
        ldy     $03
        jsr     LD2BA
        jmp     LF620

        nop
        nop
LF60A:  asl     a
        asl     a
        ldy     #$00
        lda     ($02),y
        tay
        sta     $F2
        lda     #$00
        bcs     LF61D
        ldy     #$01
        lda     ($02),y
        ldy     $F2
LF61D:  jsr     LD254
LF620:  lda     $29
        jmp     LD1FE

LF625:  lda     $F5
        jsr     LD264
        tay
        beq     LF635
LF62D:  dey
        lda     ($02),y
        sta     ($D1),y
        tya
        bne     LF62D
LF635:  jmp     LEE8E

        nop
        nop
        nop
        nop
        nop
        nop
        nop
        nop
LF640:  ldx     #$0A
        lda     #$00
LF644:  sta     $C075,x
        dex
        bne     LF644
        lda     $0A
        sta     $C07C
        jsr     LD39E
        jmp     LF658

LF655:  jsr     LD398
LF658:  beq     LF6CC
        cmp     #$80
        bcs     LF6CC
        cmp     #$28
        beq     LF66C
        cpx     #$05
        beq     LF655
        sta     $C076,x
        inx
        bne     LF655
LF66C:  jsr     LD398
        jsr     LD27F
        stx     $C07B
        lda     #$29
        jmp     LD22E

LF67A:  lda     $C07F
LF67D:  sta     $C07F
        asl     a
        jmp     LD21C

LF684:  lda     #$00
        sta     $F2
        sta     $C085
        sta     $08
        sta     $09
        lda     $C083
        ldx     #$08
        sta     $F3
LF696:  lsr     $F3
        bcc     LF6AF
        clc
        lda     $33
        adc     $C085
        sta     $C085
        lda     $34
        adc     $08
        sta     $08
        lda     $F2
        adc     $09
        sta     $09
LF6AF:  asl     $33
        rol     $34
        rol     $F2
        dex
        bne     LF696
        jsr     LF6CD
        jsr     LF4A8
        clc
        lda     $C085
        adc     $06
        sta     $06
        bcc     LF6CA
        inc     $07
LF6CA:  ldy     #$00
LF6CC:  rts

LF6CD:  jsr     LF4A8
        clc
        lda     $08
        ldx     $09
        adc     #$02
        bcc     LF6DA
        inx
LF6DA:  ldy     #$0A
        sec
        sbc     ($04),y
        pha
        iny
        txa
        sbc     ($04),y
        tay
        pla
        bcc     LF6EB
        jsr     LF75A
LF6EB:  ldx     #$FF
        clc
        lda     $08
        adc     #$05
        sta     $08
        bcc     LF6F8
        inc     $09
LF6F8:  sec
LF6F9:  lda     $08
        tay
        sbc     #$7F
        sta     $08
        lda     $09
        sbc     #$00
        sta     $09
        inx
        bcs     LF6F9
        iny
        tya
        asl     a
        sta     $C084
        sta     $F8
        txa
        pha
        jsr     LF4A8
        pla
        clc
        adc     $05
        sta     $05
        sta     $F7
        ldy     $C084
        jsr     LF736
        jmp     LF736

LF727:  jsr     LF4A8
        lda     $F7
        sta     $05
        ldy     $F8
        jsr     LF733
LF733:  ldx     #$A8
        .byte   $2C
LF736:  ldx     #$88
        lda     ($04),y
        sta     PISTE
        iny
        lda     ($04),y
        sta     SECTEUR
        lda     $06
        sta     RWBUF
        lda     $07
        sta     $C004
        inc     $07
        iny
        bne     LF756
        inc     $05
        ldy     #$02
LF756:  jmp     LDA75

LF759:  rts

LF75A:  sta     $C058
        sty     $C059
        ora     $C059
        beq     LF759
        jsr     XPMAP
        jsr     LF4A8
        ldy     #$02
        lda     (L0000),y
        beq     LF785
        clc
        adc     $05
        sta     $05
        dec     $05
        ldy     #$00
        lda     ($04),y
        tax
        iny
        lda     ($04),y
        iny
        inc     $05
        bne     LF78F
LF785:  ldy     #$13
        lda     (L0000),y
        tax
        iny
        lda     (L0000),y
        ldy     #$0C
LF78F:  stx     PISTE
        sta     SECTEUR
        jsr     LF85F
LF798:  iny
        lda     ($04),y
        beq     LF7A2
        iny
        bne     LF798
        beq     LF7D6
LF7A2:  dey
LF7A3:  lda     $C058
        ora     $C059
        beq     LF802
        jsr     LF85F
        lda     $C058
        bne     LF7B6
        dec     $C059
LF7B6:  dec     $C058
        sty     $C05F
        jsr     LF838
        sty     $F2
        ldy     $C05F
        sta     ($04),y
        iny
        lda     $F2
        sta     ($04),y
        iny
        bne     LF7A3
        lda     $C058
        ora     $C059
        beq     LF802
LF7D6:  jsr     LF84C
        sta     $F5
        sty     $F6
        ldy     #$00
        sta     ($04),y
        iny
        lda     $F6
        sta     ($04),y
        jsr     XSVSEC
        lda     $F5
        ldy     $F6
        sta     PISTE
        sty     SECTEUR
        jsr     LF86A
        lda     #$00
        tay
LF7F9:  sta     ($04),y
        iny
        bne     LF7F9
        ldy     #$02
        bne     LF7A3
LF802:  jsr     XSVSEC
        ldy     #$06
LF807:  lda     (L0000),y
        sta     $C022,y
        iny
        cpy     #$17
        bne     LF807
        jsr     XTVNM
        bne     LF819
        jmp     LE0DD

LF819:  jsr     LDAEE
        jsr     XSMAP
        jsr     XSCAT
        jsr     LF4A8
        ldy     #$13
        lda     (L0000),y
        sta     PISTE
        iny
        lda     (L0000),y
        sta     SECTEUR
        jsr     LF85F
        jmp     XSVSEC

LF838:  ldy     #$0A
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
LF84C:  ldy     #$15
        lda     (L0000),y
        clc
        adc     #$01
        sta     (L0000),y
        iny
        lda     (L0000),y
        adc     #$00
        sta     (L0000),y
        jmp     XLIBSE

LF85F:  lda     $04
        sta     RWBUF
        lda     $05
        sta     $C004
        rts

LF86A:  inc     $05
        clc
        ldy     #$02
        lda     (L0000),y
        adc     #$01
        sta     (L0000),y
        lda     $04
        ldy     $05
        jsr     LF885
        lda     #$01
        sta     $F2
        lda     #$00
        jmp     LF425

LF885:  sec
        sbc     $9E
LF888:  tax
        tya
        sbc     $9F
        tay
        rts

        jsr     LD24C
        lda     $D4
        ldx     $D3
        bpl     LF8A3
        eor     #$FF
        clc
        adc     #$01
        cpx     #$FF
        beq     LF8A7
LF8A0:  jmp     LDE20

LF8A3:  cpx     #$00
        bne     LF8A0
LF8A7:  jsr     LF473
        jsr     LF4A8
        bmi     LF8D2
        bne     LF8CF
        lda     $C083
        bit     $D3
        bmi     LF8C3
LF8B8:  ldy     #$04
        lda     ($04),y
        pha
        iny
        lda     ($04),y
        tay
        pla
        .byte   $2C
LF8C3:  ldy     #$00
        .byte   $24
LF8C6:  tay
        sta     $F2
        tya
        ldy     $F2
        jmp     LD254

LF8CF:  jmp     LE0E0

LF8D2:  jsr     LFD0E
        beq     LF8C6
        bit     $D3
        bmi     LF8C3
        lda     #$00
        .byte   $F0
LF8DE:  cpx     $20
        lsr     $F9,x
        bne     LF8EA
        jsr     LF96B
        jmp     XPRSEC

LF8EA:  bcs     LF8FD
        jsr     LF91F
        php
        sei
        jsr     LF684
LF8F4:  lda     ($06),y
        sta     ($02),y
        iny
        bne     LF8F4
        plp
LF8FC:  rts

LF8FD:  jsr     LED2E
        jsr     LFDD9
        txa
        jsr     LF67D
        lda     $06
        ldy     $07
        sta     $02
        sty     $03
        jsr     LF5DC
        jsr     LD39E
        beq     LF8FC
        jsr     LD22C
        jmp     LF8FD

LF91D:  clc
        .byte   $24
LF91F:  sec
        php
        jsr     LD2FA
        ldy     #$04
        lda     ($04),y
        cmp     $33
        iny
        lda     ($04),y
        sbc     $34
        bcs     LF939
        plp
        bcc     LF93B
        ldx     #$10
        jmp     LD67E

LF939:  plp
        rts

LF93B:  ldy     #$04
        lda     $33
        sta     ($04),y
        iny
        lda     $34
        sta     ($04),y
        jsr     LF85F
        ldy     #$13
        lda     (L0000),y
        pha
        iny
        lda     (L0000),y
        tay
        pla
        jmp     LDA9E

        jsr     LF47D
        jsr     LD22C
        jsr     LF4A8
        pha
        ldy     #$06
        lda     (L0000),y
        sta     DRIVE
        pla
        cmp     #$01
        rts

LF96B:  jsr     LD27F
        stx     PISTE
        jsr     LD22C
        jsr     LD27F
        stx     SECTEUR
        beq     LF982
        jsr     LD22C
        jsr     LE60D
LF982:  jsr     LF4A8
        lda     $02
        ldy     $03
        sta     RWBUF
        sty     $C004
LF98F:  rts

        jsr     LE60D
        .byte   $4C
        .byte   $4C
LF995:  .byte   $DA
        jsr     LE60D
        .byte   $4C
        txa
LF99B:  .byte   $DA
        jsr     LD27F
        txa
        pha
        and     #$7F
        cmp     $C206
        bcs     LF9C8
        jsr     LD22C
        jsr     LD27F
        txa
        dex
        bmi     LF9C8
        cpx     $C207
        bcs     LF9C8
        tay
        pla
        .byte   $4C
        .byte   $15
LF9BB:  cmp     $6C20,x
        .byte   $DC
        pha
        tya
        jsr     LD7ED
        pla
        jmp     LD7EA

LF9C8:  .byte   $4C
        .byte   $20
LF9CA:  dec     $5620,x
        sbc     $06D0,y
        jsr     LF96B
        jmp     XSVSEC

        bcs     LF9EF
LF9D8:  jsr     LF91D
        php
        sei
        jsr     LF684
LF9E0:  lda     ($02),y
        sta     ($06),y
        iny
        cpy     $C083
        bne     LF9E0
        jsr     LF727
        plp
        rts

LF9EF:  jsr     LD224
        jsr     LFD0E
        bne     LFA1B
        ldx     #$05
        ldy     #$00
        bit     $28
        bpl     LFA0C
        lda     $D3
        ldx     $D4
        sta     $91
        stx     $92
        lda     ($91),y
        tax
        ldy     #$80
LFA0C:  sty     $C07F
        jsr     LFA39
        lda     #$FF
        jsr     LFDCC
        sta     ($02),y
        bmi     LFA2B
LFA1B:  jsr     LFDD9
        pha
        txa
        jsr     LF67D
        jsr     LFD2A
        pla
        tax
        jsr     LFA39
LFA2B:  jsr     LD39E
        beq     LFA36
        jsr     LD22C
        jmp     LF9EF

LFA36:  jmp     LFD46

LFA39:  stx     $C07E
        lda     $06
        ldy     $07
        sta     $02
        sty     $03
        clc
        ldy     #$00
        jsr     LFC9E
        jsr     LF4A8
        .byte   $4C
        sec
LFA4F:  inc     $2048,x
        tya
        .byte   $D3
        jsr     LD22C
        pla
        cmp     #$44
        bne     LFA7C
        lda     DRVDEF
        sta     DRIVE
        jsr     LF47F
        beq     LFA6D
        jsr     LD22C
        jsr     LE60D
LFA6D:  lda     #$00
        ldy     #$01
        jsr     LFACB
LFA74:  ldy     #$06
        lda     DRIVE
        sta     (L0000),y
LFA7B:  rts

LFA7C:  cmp     #$52
        bne     LFA92
        lda     #$00
        ldy     #$08
        jsr     LFB08
        bne     LFA7B
        jsr     LD22C
        jmp     LF9D8

LFA8F:  jmp     LDE23

LFA92:  cmp     #$53
        bne     LFA8F
        lda     #$80
        ldy     #$10
        jsr     LFB08
LFA9D:  php
        ldy     #$03
        lda     #$0C
        sta     (L0000),y
        iny
        lda     #$00
        sta     (L0000),y
        iny
        sta     (L0000),y
        plp
        bne     LFAB8
        ldy     #$00
        lda     #$FF
        sta     ($02),y
        jmp     LFD46

LFAB8:  .byte   $4C
        .byte   $44
LFABA:  sbc     $C020,x
        .byte   $FA
        bmi     LFA9D
LFAC0:  jsr     LF47D
        jsr     LF4A8
        bmi     LFA7B
        jmp     LE0E0

LFACB:  pha
        tya
        pha
        ldy     #$05
        lda     ($9E),y
        bne     LFAD6
        ldy     #$03
LFAD6:  dey
        lda     ($9E),y
        tax
        pha
        iny
        lda     ($9E),y
        pha
        tay
        lda     #$01
        sta     $F2
        lda     #$21
        jsr     LF425
        jsr     LF3CF
        iny
        pla
        sta     ($F2),y
        dey
        pla
        sta     ($F2),y
        jsr     LF4A8
        pla
        sta     (L0000),y
        pla
        iny
        sta     (L0000),y
        sta     $C083
        rts

LFB02:  jmp     LE0E0

LFB05:  jmp     LDE20

LFB08:  sta     $0B
        sty     $F9
        jsr     LD44F
        jsr     LD79E
        jsr     LD22C
        jsr     LF47F
        jsr     LDB2D
        php
        bne     LFB40
        ldx     #$00
        bit     $0B
        bmi     LFB2E
        jsr     LD22C
        jsr     LD27F
        cpx     #$03
        bcc     LFB05
LFB2E:  lda     #$00
        sta     $C052
        sta     $C053
        tay
        txa
        ldx     $F9
        jsr     LDE00
        jsr     XTVNM
LFB40:  lda     $C30C,x
        ldy     $C30D,x
        jsr     LDA5D
        lda     $C103
        cmp     $F9
        bne     LFB02
        lda     $C106
        ldy     $0B
        jsr     LFACB
        ldy     #$07
        ldx     $C027
LFB5D:  lda     BUF3,x
        sta     (L0000),y
        inx
        iny
        cpy     #$17
        bne     LFB5D
        lda     #$FF
        ldy     #$02
        sta     (L0000),y
        dec     $05
LFB70:  jsr     LF86A
        jsr     LF85F
        jsr     XPRSEC
        ldy     #$00
        lda     ($04),y
        sta     PISTE
        iny
        lda     ($04),y
        sta     SECTEUR
        bne     LFB70
        jsr     LFA74
        plp
LFB8C:  rts

        beq     LFBA0
LFB8F:  jsr     LF47D
        jsr     LFBAF
        jsr     LD39E
        beq     LFBAE
        jsr     LD22C
        jmp     LFB8F

LFBA0:  jsr     LF3F3
        lda     #$63
        sta     $0A
LFBA7:  jsr     LFBAF
        dec     $0A
        bpl     LFBA7
LFBAE:  rts

LFBAF:  jsr     LF3CF
        tya
        iny
        sta     ($F2),y
        jmp     LF4E6

LFBB9:  jmp     LE0E0

LFBBC:  .byte   $4C
        .byte   $23
LFBBE:  dec     $7D20,x
        .byte   $F4
        jsr     LD22C
        jsr     LF4A8
        bmi     LFBB9
        lda     $C080
        cmp     $0A
        beq     LFBD6
        lda     #$00
        sta     $C081
LFBD6:  jsr     LF640
        lda     #$C3
        jsr     LD22E
        beq     LFBBC
        pha
        jsr     LD398
        pla
        ldy     #$00
        ldx     #$05
        cmp     #$C0
        beq     LFC07
        ldx     #$02
        iny
        cmp     #$25
        beq     LFC07
        dex
        ldy     #$40
        cmp     #$4F
        beq     LFC07
        cmp     #$24
        bne     LFBBC
        jsr     LD27F
        txa
        beq     LFC54
        ldy     #$80
LFC07:  sty     $C07F
        stx     $C07E
        lda     $C081
        ldy     $0A
        sta     $C07D
        sty     $C07C
        clc
        ldx     $0B
        bne     LFC22
        adc     #$02
        jsr     LFC57
LFC22:  adc     $C07E
        jsr     LFC57
        sta     $C081
        jsr     LF4EC
        bcs     LFC33
        jsr     LF4EF
LFC33:  ldy     #$09
LFC35:  lda     $C076,y
        sta     ($F4),y
        dey
        bpl     LFC35
        ldx     #$00
        jsr     LD39E
        bne     LFC48
        stx     $C081
        rts

LFC48:  jsr     LD22E
        bne     LFBD6
        lda     $0A
        sta     $C080
LFC52:  clc
        rts

LFC54:  jmp     LDE20

LFC57:  beq     LFC69
        bcs     LFC6E
        ldx     $C083
        beq     LFC52
        cmp     $C083
        beq     LFC52
        bcc     LFC52
        bcs     LFC6E
LFC69:  ldx     $C083
        beq     LFC52
LFC6E:  ldx     #$11
        .byte   $4C
        .byte   $7E
LFC72:  dec     $18,x
LFC74:  bit     $38
        php
        jsr     LF3F3
        jsr     LF640
        lda     #$D5
        jsr     LD22E
        jsr     LD224
        jsr     LF4E9
        jsr     LF67A
        jsr     LF4A8
        lda     $C07C
        sta     $0A
        ldy     $C07D
        ldx     $C07E
        lda     $0B
        bne     LFCA9
        plp
LFC9E:  php
        lda     $C07F
        sta     ($02),y
        iny
        txa
        sta     ($02),y
        iny
LFCA9:  tya
        jsr     LF4DC
        plp
        ldy     #$00
        lda     $C07F
        bmi     LFCD7
        beq     LFCD0
        jsr     LD24C
        ldy     #$00
        lda     $D4
        sta     ($02),y
        bit     $C07F
        bvc     LFCCA
        lda     $D3
        bne     LFC54
        rts

LFCCA:  iny
        lda     $D3
        sta     ($02),y
        rts

LFCD0:  ldx     $02
        ldy     $03
        jmp     LD2C2

LFCD7:  php
        jsr     LD274
        sta     $D0
        ldy     $C07E
        beq     LFCE9
        lda     #$20
LFCE4:  dey
        sta     ($02),y
        bne     LFCE4
LFCE9:  plp
        bcs     LFCFA
        nop
        nop
LFCEE:  cpy     $D0
        bcs     LFCF9
        lda     ($91),y
        sta     ($02),y
        iny
        bne     LFCEE
LFCF9:  rts

LFCFA:  ldy     $D0
        beq     LFD0D
        dey
        dec     $D0
        lda     ($91),y
        dec     $C07E
        ldy     $C07E
        sta     ($02),y
        bne     LFCFA
LFD0D:  rts

LFD0E:  jsr     LF4A8
        ldy     #$03
        lda     (L0000),y
        sta     $C086
        iny
        lda     (L0000),y
        sta     $C087
        iny
        lda     (L0000),y
        sta     $C088
        tay
        lda     ($02),y
        cmp     #$FF
LFD29:  rts

LFD2A:  jsr     LF4A8
        ldy     #$05
        lda     $C088
        sta     (L0000),y
        dey
        lda     $C087
        sta     (L0000),y
        dey
        lda     $C086
        cmp     (L0000),y
        sta     (L0000),y
        beq     LFD29
LFD44:  clc
        .byte   $24
LFD46:  sec
        php
        jsr     LF4A8
        lda     $02
        ldy     $03
        sta     RWBUF
        sty     $C004
        ldy     #$04
        lda     (L0000),y
        clc
        adc     $05
        sta     $05
        dey
        lda     (L0000),y
        tay
        lda     ($04),y
        pha
        iny
        lda     ($04),y
        tay
        pla
        plp
        bcc     LFD70
        jmp     LDA9E

LFD70:  jmp     LDA6D

LFD73:  jsr     LFDCC
        sta     ($02),y
        sec
        .byte   $24
LFD7A:  clc
        jsr     LFDCC
        iny
        bne     LFDC3
        bcc     LFDA4
        jsr     LFD46
        ldy     #$02
        lda     (L0000),y
        ldy     #$04
        cmp     (L0000),y
        bne     LFDA4
        dey
        lda     (L0000),y
        tay
        iny
        iny
        beq     LFD9D
        iny
        lda     ($04),y
        bne     LFDA4
LFD9D:  lda     #$03
        ldy     #$00
        jsr     LF75A
LFDA4:  jsr     LF4A8
        ldy     #$03
        lda     (L0000),y
        clc
        adc     #$02
        bne     LFDBA
        ldy     #$04
        lda     (L0000),y
        adc     #$00
        sta     (L0000),y
        lda     #$02
LFDBA:  ldy     #$03
        sta     (L0000),y
        jsr     LFD44
        ldy     #$00
LFDC3:  tya
        ldy     #$05
        sta     (L0000),y
        tay
        lda     ($02),y
        rts

LFDCC:  ldy     #$05
        pha
        lda     (L0000),y
        tay
        pla
        rts

LFDD4:  ldx     #$0F
        jmp     LD67E

LFDD9:  jsr     LFD0E
        beq     LFDD4
        ldy     #$00
        sta     ($06),y
        jsr     LFD7A
        ldy     #$01
        sta     ($06),y
        iny
        sty     $F5
        sta     $F6
        inc     $F6
LFDF0:  jsr     LFD7A
        ldy     $F5
        inc     $F5
        sta     ($06),y
        dec     $F6
        bne     LFDF0
        ldy     #$00
        lda     ($06),y
        tax
        iny
        lda     ($06),y
        rts

LFE06:  nop
        jsr     LFAC0
        lda     #$FF
        sta     $33
        sta     $34
        .byte   $30
LFE11:  ora     #$20
        cpy     #$FA
        jsr     LD22C
        jsr     LD2FA
        php
        sei
LFE1D:  lda     $33
        ora     $34
        beq     LFE36
        lda     $33
        bne     LFE29
        dec     $34
LFE29:  dec     $33
        jsr     LFD0E
        beq     LFE36
        jsr     LFDD9
        jmp     LFE1D

LFE36:  plp
        rts

LFE38:  ldy     #$00
        lda     ($06),y
        jsr     LFD73
        ldy     #$01
        lda     ($06),y
        iny
        sty     $F7
        sta     $F8
        inc     $F8
LFE4A:  jsr     LFD73
        ldy     $F7
        lda     ($06),y
        inc     $F7
        dec     $F8
        bne     LFE4A
        rts

        lsr     $F2
        lsr     $F4
        ldx     #$0C
LFE5E:  dex
        bmi     LFE83
        lda     $C091,x
        sta     $C029,x
        ldy     $C09E,x
        cmp     #$3F
        beq     LFE76
        cpy     #$3F
        bne     LFE5E
        ror     $F2
        bne     LFE5E
LFE76:  ror     $F4
        bit     $16
        bvs     LFE5E
        cpy     #$3F
        beq     LFE5E
LFE80:  jmp     LD5AC

LFE83:  bit     $F2
        bpl     LFE93
        ldx     #$0C
LFE89:  lda     $C09D,x
        cmp     #$3F
        bne     LFE80
        dex
        bne     LFE89
LFE93:  cli
LFE94:  rts

        .byte   $20
        .byte   $C5
LFE97:  .byte   $E7
        jsr     LFAC0
LFE9B:  jsr     LD302
        bpl     LFEAC
LFEA0:  jsr     LFF3D
        cmp     #$20
        beq     LFEAC
        cmp     #$03
        bne     LFEA0
        rts

LFEAC:  jsr     LFD0E
        beq     LFEC7
        jsr     LFDD9
        beq     LFE9B
        sta     $F2
        txa
        bpl     LFECA
LFEBB:  iny
        lda     ($06),y
        jsr     XAFCAR
        dec     $F2
        bne     LFEBB
        beq     LFE9B
LFEC7:  jmp     LE7D6

LFECA:  clc
        lda     $06
        ldy     $07
        adc     #$02
        bcc     LFED4
        iny
LFED4:  jsr     LD2BA
        jsr     LD2D2
        jsr     XAFSTR
        .byte   $4C
        .byte   $9B
LFEDF:  inc     $0720,x
        inc     a:$20,x
        .byte   $FF
LFEE6:  jsr     LFF3D
        ldy     $F2
        cmp     #$03
        beq     LFF37
        cmp     #$0D
        bne     LFEF8
        jsr     LFF1B
        lda     #$0A
LFEF8:  jsr     LFF1B
        sty     $F2
        jmp     LFEE6

LFF00:  jsr     LF4A8
        lda     #$80
        sta     ($06),y
        iny
        lda     #$D8
        sta     ($06),y
        lda     #$00
        iny
        sty     $F2
LFF11:  sta     ($06),y
        iny
        cpy     #$DA
        bne     LFF11
        ldy     #$02
LFF1A:  rts

LFF1B:  sta     ($06),y
        jsr     XAFCAR
        iny
        cpy     #$DA
        bne     LFF1A
LFF25:  jsr     LFE38
        lda     #$FF
        jsr     LFDCC
        sta     ($02),y
        jsr     LFD46
        ldy     #$02
        jmp     LFF00

LFF37:  jsr     LFF25
        jmp     LFD46

LFF3D:  jsr     LD845
        bpl     LFF3D
        rts

; System Vectors
SEDORIC_VECTORS:
        jmp     LED36

        jmp     LD398

        jmp     LD39E

        jmp     LD44F

        jmp     LD451

        jmp     LD364

        jmp     LF3F3

        jmp     LF4A8

        jmp     LFDD9

        jmp     LFE38

        jmp     LFD46

        jmp     XAFCAR

        jmp     XAFHEX

        jmp     XAFSTR

        jmp     XROM

        jmp     LE0EA

        jmp     LE0E5

        jmp     LDE28

        jmp     LDFE6

        jmp     LDE9C

        jmp     LE266

        jmp     XCREAY

        jmp     XDETSE

        jmp     XLIBSE

        jmp     XWDESC

        jmp     XTRVCA

        jmp     LDBA5

        jmp     LDB41

        jmp     XTVNM

        jmp     LDB2D

        jmp     LDB07

        jmp     LDAFE

        jmp     LDAEE

        jmp     LDACE

        jmp     XSVSEC

        jmp     LDA9E

        jmp     LDA91

        jmp     XSCAT

        jmp     XSMAP

        jmp     XPRSEC

        jmp     LDA6D

        jmp     LDA5D

        jmp     XPMAP

        jmp     XRWTS

COPYRIGHT_TEXT:
        .byte   "SEDORIC 1.0 par F.B"


LFFDA:  .byte   "ROCHE et D.SEBBAG(c) 1985 EUREK"



        .byte   "A"
NMI_VECTOR:
        .addr   LD121
RESET_VECTOR:
        .addr   L2310
IRQ_VECTOR:
        .word   $B97B
