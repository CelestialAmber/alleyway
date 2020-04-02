; Disassembly of "alleyway.gb"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $001", ROMX[$4000], BANK[$1]

INCLUDE "data/bank1StartData.asm"

TitleScreenTilemap::
INCBIN "data/title_screen_tilemap.bin"

;offset 42b3
EndingTilemap::
db $98,$43,$0A
db "NICE PLAY!"
db $98,$84,$07,$44,$45,$FF,$FF,$FF,$44
db $45,$98,$A3,$09,$44,$46,$20,$21,$22,$23,$24,$44,$45,$98,$C2,$0B
db $44,$45,$25,$26,$27,$28,$29,$2A,$2B,$44,$45,$98,$E2,$0B,$44,$45
db $2C,$2D,$2E,$2F,$30,$31,$32,$44,$45,$99,$02,$0B,$44,$45,$33,$A5
db $34,$35,$A5,$36,$37,$44,$45,$99,$22,$0B,$44,$45,$38,$39,$3A,$3B
db $3C,$3D,$3E,$44,$45,$99,$43,$09,$44,$45,$3F,$40,$41,$42,$43,$44
db $45,$99,$63,$09,$47,$48,$49,$4A,$4B,$4C,$4D,$4E,$4F,$99,$83,$09
db $50,$51,$52,$53,$54,$55,$56,$57,$58


db $00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$01,$00
db $00,$00,$FF

DoMarioIntroAnimation:
    call Call_000_118f
    call Call_001_63ec
    ldh a, [hPaddleXPos]
    add $50
    ld [wMarioXPos], a
    ldh a, [$ffbf]
    sub $10
    ld [wMarioYPos], a
    ld a, $03
    ld [$ca41], a
jr_001_43f5:
    call Call_001_44a4
    call Call_001_44be
    ld a, [wMarioXPos]
    dec a
    ld [wMarioXPos], a
    cp $44
    jr nz, jr_001_43f5
    ld a, $03
    ld [$ca40], a
Jump_001_440b:
    call Call_001_44be
    call Call_001_63ce
    call Call_001_450d
    ld a, $04
    ld [$ca40], a
    xor a
    ld [$ca42], a
    ld [$ca43], a
jr_001_4420:
    call Call_001_44be
    call Call_001_44cf
    ld a, [$ca42]
    cp $18
    jr c, jr_001_4420
jr_001_442d:
    call Call_001_44be
    ld a, [wMarioYPos]
    inc a
    inc a
    inc a
    inc a
    ld [wMarioYPos], a
    cp $88
    jr c, jr_001_442d
    call Func0378
    ld a, $10
    call Call_000_0257
    call Call_001_4521
    call Call_000_118f
    ret

PlayMarioGameOverAnimation:
    call Call_000_10fb
    call Call_000_118f
    call Call_001_63d2
    call Call_001_450d
    ld a, $88
    ld [wMarioYPos], a
    ldh a, [hPaddleXPos]
    add $04
    ld [wMarioXPos], a
    ld b, $00
    ld c, $05
    cp $4c
    jr nc, jr_001_4471
    ld b, $01
    ld c, $06
jr_001_4471:
    ld a, b
    ld [$ca43], a
    ld a, c
    ld [$ca40], a
    xor a
    ld [$ca42], a
jr_001_447d:
    call Call_001_44be
    call Call_001_44cf
    ld a, [$ca42]
    cp $18
    jr c, jr_001_447d
jr_001_448a:
    call Call_001_44be
    ld a, [wMarioYPos]
    inc a
    inc a
    inc a
    inc a
    ld [wMarioYPos], a
    cp $a0
    jr c, jr_001_448a
    call Func0378
    ld a, $40
    call Call_000_0257
    ret


Call_001_44a4:
    ld a, [$ca41]
    dec a
    ld [$ca41], a
    ret nz
    ld a, [$ca40]
    inc a
    cp $03
    jr c, jr_001_44b5
    xor a
jr_001_44b5:
    ld [$ca40], a
    ld a, $05
    ld [$ca41], a
    ret


Call_001_44be:
    ld a, [wMarioXPos]
    ld b, a
    ld a, [wMarioYPos]
    ld c, a
    ld a, [$ca40]
    call Call_001_4a66
    jp Call_000_0221


Call_001_44cf:
    ld a, [$ca42]
    ld c, a
    inc a
    ld [$ca42], a
    ld b, $00
    ld hl, $44f5
    add hl, bc
    ld a, [hl]
    ld b, a
    ld a, [wMarioYPos]
    add b
    ld [wMarioYPos], a
    ld a, [$ca43]
    sla a
    dec a
    ld b, a
    ld a, [wMarioXPos]
    add b
    ld [wMarioXPos], a
    ret

;0x44f5
db $FD,$FD,$FD,$FE,$FE,$FE,$FF,$FF,$FF,$00,$FF,$00,$00,$01,$00,$01,$01,$01,$02,$02,$02,$03,$03,$03

Call_001_450d:
    call Call_000_118f
    xor a
jr_001_4511:
    push af
    call Call_001_4533
    ld a, $08
    call Call_000_0257
    pop af
    inc a
    cp $03
    jr c, jr_001_4511
    ret


Call_001_4521:
    ld a, $02
jr_001_4523:
    push af
    call Call_001_4533
    ld a, $0c
    call Call_000_0257
    pop af
    dec a
    cp $ff
    jr nz, jr_001_4523
    ret


Call_001_4533:
    ld b, $00
    ld c, a
    ld hl, $4551
    add hl, bc
    ld b, [hl]
    ld e, $03
    call Call_000_0454
    ld hl, $4554
    add hl, bc
    ld a, [hl+]
    ld [$c802], a
    ld a, [hl+]
    ld [$c806], a
    ld a, [hl]
    ld [$c80a], a
    ret

db $00,$01,$02,$00,$04,$00,$00,$03,$00,$02,$03,$02


Func455d::
    call Call_001_63e0
    ldh a, [hBallXPos]
    sub $08
    ld [wMarioXPos], a
    ld a, $90
    ld [wMarioYPos], a
    xor a
    ld [$ca41], a
jr_001_4570:
    push bc
    ld a, [wMarioXPos]
    ld b, a
    ld a, [wMarioYPos]
    ld c, a
    ld a, [$ca41]
    ld d, $00
    ld e, a
    ld hl, $4599
    add hl, de
    ld a, [hl]
    call Call_001_4a66
    call Call_000_0221
    pop bc
    ld a, [$ca41]
    inc a
    ld [$ca41], a
    cp $24
    jr c, jr_001_4570
    jp Func0378


;4599
db $07,$07,$07,$07,$07,$07,$07,$07,$08,$08,$08,$08,$08,$08,$08,$08
db $08,$08,$08,$08,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09,$09
db $09,$09,$09,$09


Func45bd:
    xor a
    ld [$ca41], a
jr_001_45c1:
    push bc
    ld b, $38
    ld c, $48
    ld a, [$ca41]
    ld d, $00
    ld e, a
    ld hl, $45e6
    add hl, de
    ld a, [hl]
    call Call_001_4a66
    call Call_000_0221
    pop bc
    ld a, [$ca41]
    inc a
    ld [$ca41], a
    cp $1d
    jr c, jr_001_45c1
    jp Func0378

;45e6
db $0A,$0A,$0A,$0A,$0A,$0A,$0A,$0A,$0B,$0B,$0B,$0B,$0B,$0B,$0C,$0C
db $0C,$0C,$0C,$0C,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0B,$0A


Func_4603::
    call Call_000_024f
    call Call_000_0233
    call Call_000_0358
    call Call_000_035d
    call Call_000_036c
    call Func7ff3
    ld a, $7f
    ldh [rWX], a
    ld a, $00
    ldh [rWY], a
    ldh a, [hLCDC]
    or $60
    ldh [hLCDC], a
    xor a
    ldh a, [$ffac]
    ld a, $08
    ldh [rLYC], a
    ld a, $44
    ldh [rSTAT], a
    ldh a, [$ff9d]
    or $02
    or $08
    ldh [$ff9d], a
    ld a, $e4
    call Call_000_08ca
    ld de, UnknownData_4a3c
    call CopyTilemap
    ldh a, [hGameStateIndex]
    cp $03
    jr z, jr_001_4660
    ld a, [wDisplayedStage]
    cp $00
    jr z, jr_001_4660
    ld a, [wCurrentStage]
    cp $00
    jr nz, jr_001_4660
    ld de, EndingTilemap
    call CopyTilemap
    ld a, $00
    call Call_000_08ca
jr_001_4660:
    call Call_001_4a0f
    call Call_000_022d
    jp Call_000_0244

DisplayStageText::
    ld a, $70
    ld [$c880], a
    ld [$c884], a
    ld [$c888], a
    ld [$c88c], a
    ld [$c890], a
    ld [$c894], a
    ld [$c898], a
    ld [$c89c], a
    ld a, $30
    ld [$c881], a
    ld a, $38
    ld [$c885], a
    ld a, $40
    ld [$c889], a
    ld a, $48
    ld [$c88d], a
    ld a, $50
    ld [$c891], a
    ld a, $58
    ld [$c895], a
    ld a, $60
    ld [$c899], a
    ld a, $68
    ld [$c89d], a
    ld a, $00
    ld [$c883], a
    ld [$c887], a
    ld [$c88b], a
    ld [$c88f], a
    ld [$c893], a
    ld [$c897], a
    ld [$c89b], a
    ld [$c89f], a
    ld a, "S"
    ld [$c882], a
    ld a, "T"
    ld [$c886], a
    ld a, "A"
    ld [$c88a], a
    ld a, "G"
    ld [$c88e], a
    ld a, "E"
    ld [$c892], a
    ld a, $3e ;" "
    ld [$c896], a
    ld a, [wDisplayedStage]
    call Call_000_047c
    push af
    ld a, b
    add $80
    ld [$c89a], a
    pop af
    add $80
    ld [$c89e], a
    ret

PrintBonusText::
    ld a, $70
    ld [$c880], a
    ld [$c884], a
    ld [$c888], a
    ld [$c88c], a
    ld [$c890], a
    ld a, $38
    ld [$c881], a
    ld a, $40
    ld [$c885], a
    ld a, $48
    ld [$c889], a
    ld a, $50
    ld [$c88d], a
    ld a, $58
    ld [$c891], a
    ld a, $00
    ld [$c893], a
    ld [$c897], a
    ld [$c89b], a
    ld [$c89f], a
    ld [$c893], a
    ld a, "B"
    ld [$c882], a
    ld a, "O"
    ld [$c886], a
    ld a, "N"
    ld [$c88a], a
    ld a, "U"
    ld [$c88e], a
    ld a, "S"
    ld [$c892], a
    ret

PrintPauseText::
    ld a, $70
    ld [$c880], a
    ld [$c884], a
    ld [$c888], a
    ld [$c88c], a
    ld [$c890], a
    ld a, $38
    ld [$c881], a
    ld a, $40
    ld [$c885], a
    ld a, $48
    ld [$c889], a
    ld a, $50
    ld [$c88d], a
    ld a, $58
    ld [$c891], a
    ld a, $00
    ld [$c893], a
    ld [$c897], a
    ld [$c89b], a
    ld [$c89f], a
    ld [$c893], a
    ld a, "P"
    ld [$c882], a
    ld a, "A"
    ld [$c886], a
    ld a, "U"
    ld [$c88a], a
    ld a, "S"
    ld [$c88e], a
    ld a, "E"
    ld [$c892], a
    ret

Func_47a1:
    call Call_000_023d
    ld hl, $c901
    ld a, $9d
    ld [hl+], a
    ld a, $62
    ld [hl+], a
    ld a, $02
    ld [hl+], a
    ld a, [wDisplayedStage]
    call Call_000_047c
    push af
    ld a, b
    add $80
    ld [hl+], a
    pop af
    add $80
    ld [hl+], a
    xor a
    ld [hl+], a
    inc a
    ldh [$ffa3], a
    jp Call_000_0221

Func_47c7:
    call Call_000_023d
    ld hl, $c901
    ld a, $9e
    ld [hl+], a
    ld a, $04
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, [wLives]
    add $80
    ld [hl+], a
    xor a
    ld [hl+], a
    inc a
    ldh [$ffa3], a
    jp Call_000_0221

Func_47e4:
    call Call_000_023d
    ld hl, $c901
    ld a, $9d
    ld [hl+], a
    ld a, $a1
    ld [hl+], a
    ld a, $04
    ld [hl+], a
    ld a, $9d
    ld [hl+], a
    ld a, $92
    ld [hl+], a
    ld a, $96
    ld [hl+], a
    ld a, $8e
    ld [hl+], a
jr_001_47ff:
    xor a
    ld [hl+], a
    inc a
    ldh [$ffa3], a
    jp Call_000_0221

Func_4807:
    call Call_000_023d
    ld hl, $c901
    ld a, $9d
    ld [hl+], a
    ld a, $a1
    ld [hl+], a
    ld a, $04
    ld [hl+], a
    ld a, $ff
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    ld [hl+], a
    jr jr_001_47ff
Func_481e:
    ;update the score on screen?
    ld hl, $c814
    ldh a, [hScoreLowByte]
    ld b, a
    ldh a, [hScoreHighByte]
    call Func_048f
    ld a, $40
    ld [hl+], a
    ld a, $88
    ld [hl+], a
    ld b, $ff
    ldh a, [$ff9a]
    cp $00
    jr z, jr_001_4845
    ld b, $bf
    cp $01
    jr z, jr_001_4845
    ld b, $bc
    cp $02
    jr z, jr_001_4845
    ld b, $c9
jr_001_4845:
    ld a, b
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $38
    ld [hl+], a
    ld a, $88
    ld [hl+], a
    ldh a, [$ff99]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $38
    ld [hl+], a
    ld a, $90
    ld [hl+], a
    ldh a, [$ff98]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $38
    ld [hl+], a
    ld a, $98
    ld [hl+], a
    ldh a, [$ff97]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $38
    ld [hl+], a
    ld a, $a0
    ld [hl+], a
    ldh a, [$ff96]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ldh a, [hHighScoreLowByte]
    ld b, a
    ldh a, [hHighScoreHighByte]
    call Func_048f
    ld a, $28
    ld [hl+], a
    ld a, $88
    ld [hl+], a
    ld b, $ff
    ldh a, [$ff9a]
    cp $00
    jr z, jr_001_48a6
    ld b, $bf
    cp $01
    jr z, jr_001_48a6
    ld b, $bc
    cp $02
    jr z, jr_001_48a6
    ld b, $c9
jr_001_48a6:
    ld a, b
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $20
    ld [hl+], a
    ld a, $88
    ld [hl+], a
    ldh a, [$ff99]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $20
    ld [hl+], a
    ld a, $90
    ld [hl+], a
    ldh a, [$ff98]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $20
    ld [hl+], a
    ld a, $98
    ld [hl+], a
    ldh a, [$ff97]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $20
    ld [hl+], a
    ld a, $a0
    ld [hl+], a
    ldh a, [$ff96]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ret

Func_48e4:
    ldh a, [hHighScoreLowByte]
    ld b, a
    ldh a, [hHighScoreHighByte]
    call Func_048f
    ld hl, $c828
    ld a, $70
    ld [hl+], a
    ld a, $70
    ld [hl+], a
    ld b, $ff
    ldh a, [$ff9a]
    cp $00
    jr z, jr_001_490b

    ld b, $bf
    cp $01
    jr z, jr_001_490b

    ld b, $bc
    cp $02
    jr z, jr_001_490b

    ld b, $c9

jr_001_490b:
    ld a, b
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $68
    ld [hl+], a
    ld a, $70
    ld [hl+], a
    ldh a, [$ff99]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $68
    ld [hl+], a
    ld a, $78
    ld [hl+], a
    ldh a, [$ff98]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $68
    ld [hl+], a
    ld a, $80
    ld [hl+], a
    ldh a, [$ff97]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $68
    ld [hl+], a
    ld a, $88
    ld [hl+], a
    ldh a, [$ff96]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ret

Func_4949:
    ld hl, $c888
    ld a, b
    ld b, c
    call Func_048f
    ld a, $78
    ld [hl+], a
    ld a, $30
    ld [hl+], a
    ldh a, [$ff99]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $78
    ld [hl+], a
    ld a, $38
    ld [hl+], a
    ldh a, [$ff98]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $78
    ld [hl+], a
    ld a, $40
    ld [hl+], a
    ldh a, [$ff97]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $78
    ld [hl+], a
    ld a, $48
    ld [hl+], a
    ldh a, [$ff96]
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ret

PrintGameOverText::
    ld a, $50
    ld [$c800], a
    ld [$c804], a
    ld [$c808], a
    ld [$c80c], a
    ld [$c810], a
    ld [$c814], a
    ld [$c818], a
    ld [$c81c], a
    ld a, $38
    ld [$c801], a
    ld a, $40
    ld [$c805], a
    ld a, $48
    ld [$c809], a
    ld a, $50
    ld [$c80d], a
    ld a, $60
    ld [$c811], a
    ld a, $68
    ld [$c815], a
    ld a, $70
    ld [$c819], a
    ld a, $78
    ld [$c81d], a
    ld a, $00
    ld [$c803], a
    ld [$c807], a
    ld [$c80b], a
    ld [$c80f], a
    ld [$c813], a
    ld [$c817], a
    ld [$c81b], a
    ld [$c81f], a
    ;set each respective byte of each sprite slot to the text "GAME OVER"
    ld a, "G"
    ld [$c802], a
    ld a, "A"
    ld [$c806], a
    ld a, "M"
    ld [$c80a], a
    ld a, "E"
    ld [$c80e], a
    ld a, "O"
    ld [$c812], a
    ld a, "V"
    ld [$c816], a
    ld a, "E"
    ld [$c81a], a
    ld a, "R"
    ld [$c81e], a
    ret

Call_001_4a0f:
    ld hl, $c83c
    ld e, $18
    ld d, $11
jr_001_4a16:
    ld a, e
    ld [hl+], a
    ld a, $08
    ld [hl+], a
jr_001_4a1b:
    ld a, $b4
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, e
    add $08
    ld e, a
    dec d
    jr nz, jr_001_4a16
    ret

;is this function used for waiting a few cycles?
Func4a29:
    ret ;wait 4 cycles

;unknown data at 4a2a
db $21,$10,$C8,$3E,$98,$22,$3E,$10,$22,$F0,$BE,$C6,$80,$22,$3E,$00
db $22,$C9
UnknownData_4a3c::
db $9C,$00,$01,$BE,$9C,$20,$D8,$B4,$98,$00,$01,$BD,$98,$01
db $54,$B5,$9C,$21,$03,$9D,$98,$99,$9C,$81,$04,$B8,$B9,$BA,$BB,$9D
db $41,$04,$C0,$C1,$C2,$C3,$9E,$02,$02,$B1,$B2,$00

Call_001_4a66:
    sla a
    ld e, a
    ld d, $00
    ld hl, UnknownData_4a8b
    add hl, de
    ld d, [hl]
    inc hl
    ld e, [hl]
    ld hl, $c888
    ld a, $04
jr_001_4a77:
    push af
    ld a, [de]
    add c
    ld [hl+], a
    inc de
    ld a, [de]
    add b
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    ld a, [de]
    ld [hl+], a
    inc de
    pop af
    dec a
    jr nz, jr_001_4a77
    ret
;data offset 4a8b
UnknownData_4a8b::
db $4A,$A5,$4A,$B5,$4A,$C5,$4A,$D5,$4A,$E5,$4A,$F5,$4B,$05,$4B,$15
db $4B,$25,$4B,$35,$4B,$45,$4B,$55,$4B,$65,$00,$00,$06,$80,$00,$08
db $07,$80,$08,$00,$08,$80,$08,$08,$09,$80,$00,$00,$0A,$80,$00,$08
db $0B,$80,$08,$00,$0C,$80,$08,$08,$0D,$80,$00,$00,$0E,$80,$00,$08
db $0F,$80,$08,$00,$10,$80,$08,$08,$11,$80,$00,$00,$12,$80,$00,$08
db $13,$80,$08,$00,$14,$80,$08,$08,$15,$80,$00,$00,$16,$80,$00,$08
db $17,$80,$08,$00,$18,$80,$08,$08,$19,$80,$00,$00,$1A,$80,$00,$08
db $17,$80,$08,$00,$18,$80,$08,$08,$19,$80,$00,$00,$17,$A0,$00,$08
db $1A,$A0,$08,$00,$19,$A0,$08,$08,$18,$A0,$00,$00,$FF,$00,$00,$08
db $FF,$00,$08,$00,$1B,$00,$08,$08,$1B,$20,$00,$00,$1C,$00,$00,$08
db $1C,$20,$08,$00,$1D,$00,$08,$08,$1D,$20,$00,$00,$1E,$00,$00,$08
db $1E,$20,$08,$00,$1F,$00,$08,$08,$1F,$20,$00,$00,$FF,$00,$00,$08
db $FF,$00,$08,$00,$FF,$00,$08,$08,$FF,$00,$00,$00,$21,$00,$00,$08
db $22,$00,$08,$00,$23,$00,$08,$08,$24,$00,$00,$00,$21,$00,$00,$08
db $22,$00,$08,$00,$25,$00,$08,$08,$26,$00

;start of paddle graphics/others
;the first 6 graphics files get loaded together starting at the paddle graphics offset
;4b75
PaddleGraphics::
    INCBIN "gfx/paddle.2bpp"

BallGraphics::
    INCBIN "gfx/ball.2bpp"

MarioGraphics::
    INCBIN "gfx/mario.2bpp"

SplashGraphics::
    INCBIN "gfx/splash_graphics.2bpp"

PaddleLeftGraphics::
    INCBIN "gfx/paddle_left.2bpp"

BadEndingMarioTiles::
    INCBIN "gfx/ending_mario_bad_end_tiles.2bpp"

ds $590
;offset 5375
FontGraphics::
    INCBIN "gfx/font.2bpp"

GradientBlocks::
    INCBIN "gfx/unknown1.2bpp"

BlocksGraphics::
    INCBIN "gfx/blocks.2bpp"

LifeCounterImage::
    INCBIN "gfx/life_counter.2bpp"

UnbreakableBlockImage::
    INCBIN "gfx/unbreakable_block.2bpp"

BorderTilesSides::
    INCBIN "gfx/border_tiles_sides.2bpp"

FontGraphics2::
    INCBIN "gfx/font_other2.2bpp"

ScoreText::
    INCBIN "gfx/score_text.2bpp"

MushroomImage::
    INCBIN "gfx/mushroom.2bpp"

BorderTilesCorners::
    INCBIN "gfx/border_tiles_corners.2bpp"

FireflowerImage::
    INCBIN "gfx/fire_flower.2bpp"

SpecialStageText::
    INCBIN "gfx/special_stage_text.2bpp"

StarImage::
    INCBIN "gfx/star.2bpp"
    
;5815
ds $360

TitleGraphics::
    INCBIN "gfx/title_graphics.2bpp"

TitleNintendoLogo::
    INCBIN "gfx/title_nintendo_logo.2bpp"

FontOther::
    INCBIN "gfx/font_other1.2bpp"

EndingMario::
    INCBIN "gfx/ending_mario.2bpp"

EndingWreathLeaves::
    INCBIN "gfx/ending_wreath_leaves.2bpp"

EndingNintendoLogo::
    INCBIN "gfx/ending_nintendo_logo.2bpp"

ds $270

Func_6375::
    ld a, $80
    ldh [rNR52], a ;turn all sound on
    ld a, $77
    ldh [rNR50], a
    ld a, $ff
    ldh [rNR51], a
    ret

DisableDemoMode:
    xor a
    ld [wInDemoMode], a
    ret

EnableDemoMode:
    ld a, $01
    ld [wInDemoMode], a
    ret

Func638d:
    ldh a, [$ffb1]
    dec a
    ld b, a
    ld e, $06
    call Call_000_0454
    ld hl, UnknownData_1b87
    add hl, bc
    ld b, $00
    ld c, $05
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_001_63b6
    cp $01
    jr z, jr_001_63b2
    cp $02
    jr z, jr_001_63be
    jr jr_001_63c2
Func63ae:
    ld a, $01
    jr jr_001_63dc
jr_001_63b2:
    ld a, $02
    jr jr_001_63dc
jr_001_63b6:
    ld a, $03
    jr jr_001_63dc
jr_001_63ba:
    ld a, $04
    jr jr_001_63dc
jr_001_63be:
    ld a, $05
    jr jr_001_63dc
jr_001_63c2:
    ld a, $06
    jr jr_001_63dc
Func63c6:
    ld a, $07
    jr jr_001_63dc
Func63ca:
    ld a, $08
    jr jr_001_63dc
Call_001_63ce:
    ld a, $09
    jr jr_001_63dc
Call_001_63d2:
    ld a, $0a
    jr jr_001_63dc
Func63d6:
    ld a, $0b
    jr jr_001_63dc
Func63da:
    ld a, $0c
jr_001_63dc:
    ld [$dfe0], a
    ret


Call_001_63e0:
    ld a, $01
    jr jr_001_63e4
jr_001_63e4:
    ld [$dfe1], a
    ret

SetDFE8:
    ld a, $01
    jr setvalueDFE8
Call_001_63ec:
    ld a, $02
    jr setvalueDFE8
Func63f0:
    ld a, $03
    jr setvalueDFE8
Func63f4:
    ld a, $04
    jr setvalueDFE8
Func63f8:
    ld a, $05
    jr setvalueDFE8
Func63fc:
    ld a, $06
    jr setvalueDFE8
Func6400:
    ld a, $07
    jr setvalueDFE8
Func6404:
    ld a, $08
    jr setvalueDFE8
Func6408:
    ld a, $09
    jr setvalueDFE8
Func640c:
    ld a, $0a
    jr setvalueDFE8
Func6410:
    ld a, $0b
    jr setvalueDFE8
Func6414:
    ld a, $0c
setvalueDFE8:
    ld [$dfe8], a
    ret

REPT 998
db $FF
ENDR

Jump_001_6800:
    call Call_001_69e7
    call Call_001_69fb
    call Call_001_7050
    call Call_001_70ae
    call Call_001_74ab
    xor a
    ld [$dfe0], a
    ld [$dfe1], a
    ld [$dfe8], a
    ret


    ldh a, [$ff81]
    bit 0, a
    jp nz, Jump_001_6847
    bit 1, a
    jp nz, Jump_001_684d
    bit 3, a
    jp nz, Jump_001_6853
    bit 2, a
    jp nz, Jump_001_6859
    bit 4, a
    jp nz, Jump_001_685f
    bit 5, a
    jp nz, Jump_001_6865
    bit 6, a
    jp nz, Jump_001_686b
    bit 7, a
    jp nz, Jump_001_6871
    jp Jump_001_6877


Jump_001_6847:
    ld a, $01
    ld [$dfe0], a
    ret


Jump_001_684d:
    ld a, $02
    ld [$dfe0], a
    ret


Jump_001_6853:
    ld a, $03
    ld [$dfe0], a
    ret


Jump_001_6859:
    ld a, $04
    ld [$dfe0], a
    ret


Jump_001_685f:
    ld a, $05
    ld [$dfe0], a
    ret


Jump_001_6865:
    ld a, $06
    ld [$dfe0], a
    ret


Jump_001_686b:
    ld a, $07
    ld [$dfe0], a
    ret


Jump_001_6871:
    ld a, $08
    ld [$dfe0], a
    ret


Jump_001_6877:
    ret


    ldh a, [$ff81]
    bit 0, a
    jp nz, Jump_001_68a5
    bit 1, a
    jp nz, Jump_001_68ae
    bit 3, a
    jp nz, Jump_001_68b7
    bit 2, a
    jp nz, Jump_001_68c0
    bit 4, a
    jp nz, Jump_001_68c9
    bit 5, a
    jp nz, Jump_001_68d2
    bit 6, a
    jp nz, Jump_001_68db
    bit 7, a
    jp nz, Jump_001_68e4
    jp Jump_001_68ed


Jump_001_68a5:
    ld a, $01
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68ae:
    ld a, $02
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68b7:
    ld a, $03
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68c0:
    ld a, $04
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68c9:
    ld a, $05
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68d2:
    ld a, $06
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68db:
    ld a, $07
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68e4:
    ld a, $08
    ld [$dfe0], a
    ld [$dfe8], a
    ret


Jump_001_68ed:
    ret


    ldh a, [$ff81]
    bit 0, a
    jp nz, Jump_001_691b
    bit 1, a
    jp nz, Jump_001_6921
    bit 3, a
    jp nz, Jump_001_6927
    bit 2, a
    jp nz, Jump_001_692d
    bit 4, a
    jp nz, Jump_001_6933
    bit 5, a
    jp nz, Jump_001_6939
    bit 6, a
    jp nz, Jump_001_693f
    bit 7, a
    jp nz, Jump_001_6945
    jp Jump_001_6877


Jump_001_691b:
    ld a, $01
    ld [$dfe1], a
    ret


Jump_001_6921:
    ld a, $02
    ld [$dfe1], a
    ret


Jump_001_6927:
    ld a, $03
    ld [$dfe1], a
    ret


Jump_001_692d:
    ld a, $04
    ld [$dfe1], a
    ret


Jump_001_6933:
    ld a, $05
    ld [$dfe1], a
    ret


Jump_001_6939:
    ld a, $06
    ld [$dfe1], a
    ret


Jump_001_693f:
    ld a, $07
    ld [$dfe1], a
    ret


Jump_001_6945:
    ld a, $08
    ld [$dfe1], a
    ret


    ret


    ldh a, [$ff81]
    bit 0, a
    jp nz, Jump_001_6979
    bit 1, a
    jp nz, Jump_001_697f
    bit 3, a
    jp nz, Jump_001_6985
    bit 2, a
    jp nz, Jump_001_698b
    bit 4, a
    jp nz, Jump_001_6991
    bit 5, a
    jp nz, Jump_001_6997
    bit 6, a
    jp nz, Jump_001_699d
    bit 7, a
    jp nz, Jump_001_69a3
    jp Jump_001_69a9


Jump_001_6979:
    ld a, $01
    ld [$dfe8], a
    ret


Jump_001_697f:
    ld a, $02
    ld [$dfe8], a
    ret


Jump_001_6985:
    ld a, $03
    ld [$dfe8], a
    ret


Jump_001_698b:
    ld a, $04
    ld [$dfe8], a
    ret


Jump_001_6991:
    ld a, $05
    ld [$dfe8], a
    ret


Jump_001_6997:
    ld a, $06
    ld [$dfe8], a
    ret


Jump_001_699d:
    ld a, $07
    ld [$dfe8], a
    ret


Jump_001_69a3:
    ld a, $08
    ld [$dfe8], a
    ret


Jump_001_69a9:
    ret

Func_69aa::
    push af
    push bc
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    ld b, a
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    cpl
    and $0f
    swap a
    or b
    ld c, a
    ldh a, [hOAMDMAFunction]
    xor c
    and c
    ldh [$ff81], a
    ld a, c
    ldh [hOAMDMAFunction], a
    ld a, $30
    ldh [rP1], a
    pop bc
    pop af
    ret


Call_001_69e7:
    ld a, [wInDemoMode]
    cp $01
    jp z, Jump_001_69f0
    ret


Jump_001_69f0:
    xor a
    ld [$dfe0], a
    ld [$dfe1], a
    ld [$dfe8], a
    ret


Call_001_69fb:
    ld a, [$dfe2]
    cp $01
    jp z, Jump_001_6bad
    ld a, [$dfe0]
    cp $04
    jp z, Jump_001_6ac6
    cp $02
    jp z, Jump_001_6a90
    cp $03
    jp z, Jump_001_6aab
    cp $01
    jp z, Jump_001_6a7d
    cp $05
    jp z, Jump_001_6ae1
    cp $06
    jp z, Jump_001_6afc
    cp $07
    jp z, Jump_001_6b17
    cp $08
    jp z, Jump_001_6b2a
    cp $09
    jp z, Jump_001_6b3d
    cp $0a
    jp z, Jump_001_6b57
    cp $0b
    jp z, Jump_001_6b76
    cp $0c
    jp z, Jump_001_6b8b
    ld a, [$dfe2]
    cp $02
    jp z, Jump_001_6c17
    cp $03
    jp z, Jump_001_6c5d
    cp $04
    jp z, Jump_001_6ca3
    cp $05
    jp z, Jump_001_6ce9
    cp $06
    jp z, Jump_001_6d2f
    cp $07
    jp z, Jump_001_6d75
    cp $08
    jp z, Jump_001_6dad
    cp $09
    jp z, Jump_001_6df3
    cp $0a
    jp z, Jump_001_6e66
    cp $0b
    jp z, Jump_001_6ed7
    cp $0c
    jp z, Jump_001_6f18
    ret


Jump_001_6a7d:
    ld a, $01
    ld [$dfe2], a
    ld a, $07
    ld [$dfe9], a
    ld hl, $6fde
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6a90:
    ld a, [$dfd7]
    cp $01
    jp z, Jump_001_6aaa
    ld a, $02
    ld [$dfe2], a
    ld a, $05
    ld [$dfe9], a
    ld hl, $6fbb
    ld c, $10
    call Call_001_6f9d
Jump_001_6aaa:
    ret


Jump_001_6aab:
    ld a, [$dfd7]
    cp $01
    jp z, Jump_001_6ac5
    ld a, $03
    ld [$dfe2], a
    ld a, $05
    ld [$dfe9], a
    ld hl, $6fca
    ld c, $10
    call Call_001_6f9d
Jump_001_6ac5:
    ret


Jump_001_6ac6:
    ld a, [$dfd7]
    cp $01
    jp z, Jump_001_6ae0
    ld a, $04
    ld [$dfe2], a
    ld a, $04
    ld [$dfe9], a
    ld hl, UnknownData_6fac
    ld c, $10
    call Call_001_6f9d
Jump_001_6ae0:
    ret


Jump_001_6ae1:
    ld a, [$dfd7]
    cp $01
    jp z, Jump_001_6afb
    ld a, $05
    ld [$dfe2], a
    ld a, $05
    ld [$dfe9], a
    ld hl, $6ffc
    ld c, $10
    call Call_001_6f9d
Jump_001_6afb:
    ret


Jump_001_6afc:
    ld a, [$dfd7]
    cp $01
    jp z, Jump_001_6b16
    ld a, $06
    ld [$dfe2], a
    ld a, $05
    ld [$dfe9], a
    ld hl, $700b
    ld c, $10
    call Call_001_6f9d
Jump_001_6b16:
    ret


Jump_001_6b17:
    ld a, $07
    ld [$dfe2], a
    ld a, $04
    ld [$dfe9], a
    ld hl, $701a
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6b2a:
    ld a, $08
    ld [$dfe2], a
    ld a, $05
    ld [$dfe9], a
    ld hl, $7029
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6b3d:
    ld a, $09
    ld [$dfe2], a
    ld a, $63
    ld [$dffb], a
    ld a, $0a
    ld [$dffd], a
    ld a, $87
    ld [$dffc], a
    ld a, $ff
    ld [$dfe6], a
    ret


Jump_001_6b57:
    ld a, $0a
    ld [$dfe2], a
    ld a, $0b
    ld [$dffb], a
    ld a, $ac
    ld [$dffd], a
    ld a, $86
    ld [$dffc], a
    ld a, $87
    ld [$dffe], a
    ld a, $ff
    ld [$dfe6], a
    ret


Jump_001_6b76:
    ld a, $0b
    ld [$dfe2], a
    ld a, $a5
    ld [$dffd], a
    ld a, $87
    ld [$dffe], a
    ld a, $01
    ld [$dfd7], a
    ret


Jump_001_6b8b:
    ld a, [$dfd7]
    cp $01
    jp z, Jump_001_6bac
    ld a, $0c
    ld [$dfe2], a
    ld a, $ff
    ld [$dffb], a
    ld a, $0a
    ld [$dffd], a
    ld a, $85
    ld [$dffc], a
    ld a, $ff
    ld [$dfe6], a
Jump_001_6bac:
    ret


Jump_001_6bad:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $07
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $06
    jp z, Jump_001_6be6
    cp $05
    jp z, Jump_001_6bef
    cp $04
    jp z, Jump_001_6bf8
    cp $03
    jp z, Jump_001_6c01
    cp $02
    jp z, Jump_001_6c0a
    cp $01
    xor a
    ld [$dfe2], a
    jp Jump_001_6f8f


Jump_001_6be6:
    ld hl, $6fe3
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6bef:
    ld hl, $6fe8
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6bf8:
    ld hl, $6fed
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6c01:
    ld hl, $6ff2
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6c0a:
    ld hl, $6ff7
    ld c, $10
    call Call_001_6f9d
    xor a
    ld [$dfd7], a
    ret


Jump_001_6c17:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $05
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $04
    jp z, Jump_001_6c42
    cp $03
    jp z, Jump_001_6c4b
    cp $02
    jp z, Jump_001_6c54
    cp $01
    jp Jump_001_6f8f


Jump_001_6c42:
    ld hl, $6fbb
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6c4b:
    ld hl, $6fc0
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6c54:
    ld hl, $6fc5
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6c5d:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $03
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $04
    jp z, Jump_001_6c88
    cp $03
    jp z, Jump_001_6c91
    cp $02
    jp z, Jump_001_6c9a
    cp $01
    jp Jump_001_6f8f


Jump_001_6c88:
    ld hl, $6fcf
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6c91:
    ld hl, $6fd4
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6c9a:
    ld hl, $6fd9
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6ca3:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $05
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $04
    jp z, Jump_001_6cce
    cp $03
    jp z, Jump_001_6cd7
    cp $02
    jp z, Jump_001_6ce0
    cp $01
    jp Jump_001_6f8f


Jump_001_6cce:
    ld hl, UnknownData_6fac
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6cd7:
    ld hl, $6fb1
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6ce0:
    ld hl, $6fb6
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6ce9:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $05
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $04
    jp z, Jump_001_6d14
    cp $03
    jp z, Jump_001_6d1d
    cp $02
    jp z, Jump_001_6d26
    cp $01
    jp Jump_001_6f8f


Jump_001_6d14:
    ld hl, $6ffc
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6d1d:
    ld hl, $7001
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6d26:
    ld hl, $7006
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6d2f:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $05
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $04
    jp z, Jump_001_6d5a
    cp $03
    jp z, Jump_001_6d63
    cp $02
    jp z, Jump_001_6d6c
    cp $01
    jp Jump_001_6f8f


Jump_001_6d5a:
    ld hl, $700b
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6d63:
    ld hl, $7010
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6d6c:
    ld hl, $7015
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6d75:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $05
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $03
    jp z, Jump_001_6d9b
    cp $02
    jp z, Jump_001_6da4
    cp $01
    jp Jump_001_6f8f


Jump_001_6d9b:
    ld hl, $701f
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6da4:
    ld hl, $7024
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6dad:
    ld a, [$dfe6]
    inc a
    ld [$dfe6], a
    cp $02
    jp nz, Jump_001_6f9c
    xor a
    ld [$dfe6], a
    ld a, [$dfe9]
    dec a
    ld [$dfe9], a
    cp $04
    jp z, Jump_001_6dd8
    cp $03
    jp z, Jump_001_6de1
    cp $02
    jp z, Jump_001_6dea
    cp $01
    jp Jump_001_6f8f


Jump_001_6dd8:
    ld hl, $702e
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6de1:
    ld hl, $7033
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6dea:
    ld hl, $7038
    ld c, $10
    call Call_001_6f9d
    ret


Jump_001_6df3:
    ld a, $05
    ld [$dfd0], a
    ld a, $04
    ld [$dfd1], a
    ld a, $00
    ldh [rNR10], a
    ld a, $bf
    ldh [rNR11], a
    ld a, $40
    ldh [rNR12], a
    ld a, [$dfe6]
    cp $00
    jp z, Jump_001_6e3a
Jump_001_6e11:
    ld a, [$dffb]
    inc a
    cp $63
    jp z, Jump_001_6e34
    ld [$dffb], a
    ld a, [$dfd0]
    dec a
    ld [$dfd0], a
    cp $00
    jp nz, Jump_001_6e11
    ld a, [$dffb]
    ldh [rNR13], a
    ld a, [$dffc]
    ldh [rNR14], a
    ret


Jump_001_6e34:
    ld a, $00
    ld [$dfe6], a
    ret


Jump_001_6e3a:
    ld a, [$dffd]
    dec a
    cp $10
    jp z, Jump_001_6e5d
    ld [$dffd], a
    ld a, [$dfd1]
    dec a
    ld [$dfd1], a
    cp $00
    jp nz, Jump_001_6e3a
    ld a, [$dffd]
    ldh [rNR13], a
    ld a, [$dffc]
    ldh [rNR14], a
    ret


Jump_001_6e5d:
    xor a
    ld [$dfe2], a
    ldh [rNR12], a
    jp Jump_001_6f8f


Jump_001_6e66:
    ld a, $09
    ld [$dfd0], a
    ld a, $04
    ld [$dfd1], a
    ld a, $00
    ldh [rNR10], a
    ld a, $bf
    ldh [rNR11], a
    ld a, $90
    ldh [rNR12], a
    ld a, [$dfe6]
    cp $00
    jp z, Jump_001_6ead
Jump_001_6e84:
    ld a, [$dffb]
    inc a
    cp $89
    jp z, Jump_001_6ea7
    ld [$dffb], a
    ld a, [$dfd0]
    dec a
    ld [$dfd0], a
    cp $00
    jp nz, Jump_001_6e84
    ld a, [$dffb]
    ldh [rNR13], a
    ld a, [$dffc]
    ldh [rNR14], a
    ret


Jump_001_6ea7:
    ld a, $00
    ld [$dfe6], a
    ret


Jump_001_6ead:
    ld a, [$dffd]
    dec a
    cp $1e
    jp z, Jump_001_6ed0
    ld [$dffd], a
    ld a, [$dfd1]
    dec a
    ld [$dfd1], a
    cp $00
    jp nz, Jump_001_6ead
    ld a, [$dffd]
    ldh [rNR13], a
    ld a, [$dffe]
    ldh [rNR14], a
    ret


Jump_001_6ed0:
    xor a
    ld [$dfe2], a
    ldh [rNR12], a
    ret


Jump_001_6ed7:
    ld a, $08
    ld [$dfd1], a
    ld a, $00
    ldh [rNR10], a
    ld a, $bf
    ldh [rNR11], a
    ld a, $90
    ldh [rNR12], a
Jump_001_6ee8:
    ld a, [$dffd]
    dec a
    cp $06
    jp z, Jump_001_6f0b
    ld [$dffd], a
    ld a, [$dfd1]
    dec a
    ld [$dfd1], a
    cp $00
    jp nz, Jump_001_6ee8
    ld a, [$dffd]
    ldh [rNR13], a
    ld a, [$dffe]
    ldh [rNR14], a
    ret


Jump_001_6f0b:
    xor a
    ld [$dfe2], a
    ldh [rNR12], a
    ld [$dfd7], a
    jp Jump_001_6f8f
    ret


Jump_001_6f18:
    ld a, $28
    ld [$dfd0], a
    ld a, $28
    ld [$dfd1], a
    ld a, $00
    ldh [rNR10], a
    ld a, $bf
    ldh [rNR11], a
    ld a, $40
    ldh [rNR12], a
    ld a, [$dfe6]
    cp $00
    jp z, Jump_001_6f5f

Jump_001_6f36:
    ld a, [$dffb]
    dec a
    cp $10
    jp z, Jump_001_6f59

    ld [$dffb], a
    ld a, [$dfd0]
    dec a
    ld [$dfd0], a
    cp $00
    jp nz, Jump_001_6f36

    ld a, [$dffb]
    ldh [rNR13], a
    ld a, [$dffc]
    ldh [rNR14], a
    ret


Jump_001_6f59:
    ld a, $00
    ld [$dfe6], a
    ret


Jump_001_6f5f:
    ld a, [$dffd]
    inc a
    cp $63
    jp z, Jump_001_6f82

    ld [$dffd], a
    ld a, [$dfd1]
    dec a
    ld [$dfd1], a
    cp $00
    jp nz, Jump_001_6f5f

    ld a, [$dffd]
    ldh [rNR13], a
    ld a, [$dffc]
    ldh [rNR14], a
    ret


Jump_001_6f82:
    xor a
    ld [$dfe2], a
    ldh [rNR12], a
    jp Jump_001_6f8f

Func_6f8b::
    call Call_001_752c
    ret


Jump_001_6f8f:
    xor a
    ld [$dfe2], a
    ldh [rNR12], a
    ld [$dfe6], a
    ld [$dfe9], a
    ret


Jump_001_6f9c:
    ret


Call_001_6f9d:
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl]
    ld [c], a
    ret

UnknownData_6fac::
db $00,$81,$72,$4B,$C7,$00,$81,$15,$4B,$C7,$00,$81,$17,$4B,$C7,$00
db $81,$72,$7B,$C7,$00,$81,$15,$7B,$C7,$00,$81,$17,$7B,$C7,$00,$81
db $C2,$AC,$C7,$00,$81,$C2,$BE,$C7,$00,$81,$95,$BE,$C7,$00,$81,$48
db $BE,$C7,$00,$71,$F2,$59,$87,$00,$7F,$F2,$83,$87,$00,$BF,$F2,$9D
db $87,$00,$BF,$F2,$83,$87,$00,$BF,$F2,$90,$87,$00,$BF,$F2,$AC,$87
db $00,$81,$72,$97,$C7,$00,$81,$15,$97,$C7,$00,$81,$17,$97,$C7,$00
db $81,$72,$A7,$C7,$00,$81,$15,$A7,$C7,$00,$81,$17,$A7,$C7,$1A,$81
db $F0,$9D,$C7,$19,$83,$72,$9E,$C7,$12,$43,$3A,$9F,$C7,$00,$81,$72
db $7F,$C7,$00,$81,$15,$7F,$C7,$00,$81,$72,$7F,$C7,$00,$81,$17,$7F
db $C7,$1A,$81,$F0,$E9,$C7,$19,$83,$72,$E9,$C7,$12,$43,$3A,$E9,$C7
db $00,$F7,$57,$80

Call_001_7050:
    ld a, [$dfe1]
    cp $01
    jp z, Jump_001_705c

    call Call_001_707f
    ret


Jump_001_705c:
    ld hl, $704c
    ld c, $20
    ld a, $49
    ld [$dff9], a
    ld a, $0f
    ld [$dffa], a
    xor a
    ld [$dfd2], a
    call Call_001_7073
    ret


Call_001_7073:
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [hl+]
    ld [c], a
    ret


Call_001_707f:
    ld a, [$dff9]
    cp $00
    jp z, Jump_001_70a9

    dec a
    ld [$dff9], a
    cp $00
    jp z, Jump_001_70a5

    ld a, [$dffa]
    rlc a
    ld [$dffa], a
    jp nc, Jump_001_70a0

    ld a, $0f
    ldh [rNR51], a
    ret


Jump_001_70a0:
    ld a, $f0
    ldh [rNR51], a
    ret


Jump_001_70a5:
    ld a, $ff
    ldh [rNR51], a

Jump_001_70a9:
    xor a
    ld [$dff9], a
    ret


Call_001_70ae:
Jump_001_70ae:
    ld a, [$dfe8]
    cp $01
    jp z, Jump_001_70fe

    cp $02
    jp z, Jump_001_713a

    cp $03
    jp z, Jump_001_716f

    cp $04
    jp z, Jump_001_71ad

    cp $05
    jp z, Jump_001_71de

    cp $06
    jp z, Jump_001_7213

    cp $07
    jp z, Jump_001_7251

    cp $08
    jp z, Jump_001_728f

    cp $09
    jp z, Jump_001_72c0

    cp $0a
    jp z, Jump_001_72f5

    cp $0b
    jp z, Jump_001_732a

    cp $0c
    jp z, Jump_001_735b

    ld a, [$dfe4]
    cp $00
    jp nz, Call_001_738c

    ld a, [$dfe5]
    cp $00
    jp nz, Jump_001_73f0

    ret


Jump_001_70fe:
    ld a, $01
    ld [$dfe4], a
    ld [$dfe5], a
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld [$dfd2], a
    ld [$dfd6], a
    ld [$dfd5], a
    ld a, $60
    ld [$dfd3], a
    ld [$dfd4], a
    ld hl, SoundData_75e3
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_7652
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_713a:
    ld a, $ff
    ldh [rNR51], a
    xor a
    ld [$dfd2], a
    ld a, $02
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_76c3
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_76d9
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_716f:
    ld a, $03
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld [$dfd2], a
    ld [$dfd6], a
    ld [$dfd5], a
    ld a, $60
    ld [$dfd3], a
    ld [$dfd4], a
    ld hl, SoundData_76f0
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_7712
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_71ad:
    xor a
    ld [$dfd2], a
    ld a, $04
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_7733
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_7738
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_71de:
    ld a, $ff
    ldh [rNR51], a
    xor a
    ld [$dfd2], a
    ld a, $05
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_773b
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_7750
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_7213:
    ld a, $06
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld [$dfd2], a
    ld [$dfd6], a
    ld [$dfd5], a
    ld a, $28
    ld [$dfd3], a
    ld [$dfd4], a
    ld hl, SoundData_7765
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_779b
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_7251:
    ld a, $07
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld [$dfd2], a
    ld [$dfd6], a
    ld [$dfd5], a
    ld a, $20
    ld [$dfd3], a
    ld [$dfd4], a
    ld hl, SoundData_77d7
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_780d
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_728f:
    xor a
    ld [$dfd2], a
    ld a, $06
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_7849
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_785c
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_72c0:
    xor a
    ld [$dfd2], a
    ld a, $ff
    ldh [rNR51], a
    ld a, $06
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_7875
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_7887
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_72f5:
    xor a
    ld [$dfd2], a
    ld a, $ff
    ldh [rNR51], a
    ld a, $06
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_789c
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_78d6
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_732a:
    xor a
    ld [$dfd2], a
    ld a, $06
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_790f
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_7919
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Jump_001_735b:
    xor a
    ld [$dfd2], a
    ld a, $06
    ld [$dfe4], a
    ld [$dfe5], a
    ld a, $01
    ld [$dfeb], a
    ld [$dfed], a
    ld [$dff8], a
    ld hl, SoundData_791f
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld hl, SoundData_7988
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    call Call_001_738c
    ret


Call_001_738c:
    ld a, [$dfeb]
    dec a
    ld [$dfeb], a
    cp $00
    jp nz, Jump_001_73f0

    ld a, [$dff0]
    ld h, a
    ld a, [$dff1]
    ld l, a

Jump_001_73a0:
    ld a, [hl+]
    bit 7, a
    jp nz, Jump_001_7478

    cp $00
    jp z, Jump_001_74f9

    cp $7f
    jp z, Jump_001_74a2

    cp $01
    jp nz, Jump_001_73ba

    call Call_001_751e
    jr jr_001_73db

Jump_001_73ba:
    ld [$dff5], a
    ld a, $bf
    ldh [rNR21], a
    ld a, $f2
    ldh [rNR22], a
    ld a, [$dff5]
    push hl
    ld hl, SoundData_7574
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ldh [rNR23], a
    ld hl, SoundData_7531
    add hl, de
    ld a, [hl]
    ldh [rNR24], a
    pop hl

jr_001_73db:
    xor a
    ld a, h
    ld [$dff0], a
    ld a, l
    ld [$dff1], a
    ld a, [$dfeb]
    and a
    jr nz, jr_001_73f0

    ld a, [$dfec]
    ld [$dfeb], a

Jump_001_73f0:
jr_001_73f0:
    ld a, [$dfed]
    dec a
    ld [$dfed], a
    cp $00
    jp nz, Jump_001_745e

    ld a, [$dff2]
    ld h, a
    ld a, [$dff3]
    ld l, a

Jump_001_7404:
    ld a, [hl+]
    bit 7, a
    jp nz, Jump_001_748d

    cp $00
    jp z, Jump_001_7503

    cp $7f
    jp z, Jump_001_74a2

    cp $01
    jp nz, Jump_001_741e

    call Call_001_7522
    jr jr_001_744a

Jump_001_741e:
    ld [$dff6], a
    push hl
    ld a, $00
    ldh [rNR30], a
    ld a, $80
    ldh [rNR30], a
    ld a, $ff
    ldh [rNR31], a
    call Call_001_745f
    ld a, $20
    ldh [rNR32], a
    ld a, [$dff6]
    ld hl, SoundData_7574
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ldh [rNR33], a
    ld hl, SoundData_7531
    add hl, de
    ld a, [hl]
    ldh [rNR34], a
    pop hl

jr_001_744a:
    ld a, h
    ld [$dff2], a
    ld a, l
    ld [$dff3], a
    ld a, [$dfed]
    and a
    jr nz, jr_001_745e

    ld a, [$dfee]
    ld [$dfed], a

Jump_001_745e:
jr_001_745e:
    ret


Call_001_745f:
    ld hl, SoundData_7a6f
    ld c, $30

Jump_001_7464:
    ld a, [hl+]
    ld [c], a
    inc c
    ld a, [$dff7]
    inc a
    ld [$dff7], a
    cp $10
    jp nz, Jump_001_7464

    xor a
    ld [$dff7], a
    ret


Jump_001_7478:
    push hl
    and $7f
    ld hl, SoundData_75b7
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$dfeb], a
    ld [$dfec], a
    pop hl
    jp Jump_001_73a0


Jump_001_748d:
    push hl
    and $7f
    ld hl, SoundData_75b7
    ld d, $00
    ld e, a
    add hl, de
    ld a, [hl]
    ld [$dfed], a
    ld [$dfee], a
    pop hl
    jp Jump_001_7404


Jump_001_74a2:
    ld a, [$dfe4]
    ld [$dfe8], a
    jp Jump_001_70ae


Call_001_74ab:
    ld a, [$dfd2]
    cp $01
    jp nz, Jump_001_74f4

    ld a, [$dfd5]
    cp $01
    jp nz, Jump_001_74d7

    ld a, [$dfd3]
    dec a
    ld [$dfd3], a
    cp $00
    jp z, Jump_001_74cc

    ld a, $75
    ldh [rNR51], a
    ret


Jump_001_74cc:
    xor a
    ld [$dfd5], a
    ld a, [$dfd4]
    ld [$dfd3], a
    ret


Jump_001_74d7:
    ld a, [$dfd3]
    dec a
    ld [$dfd3], a
    cp $00
    jp z, Jump_001_74e8

    ld a, $57
    ldh [rNR51], a
    ret


Jump_001_74e8:
    ld a, $01
    ld [$dfd5], a
    ld a, [$dfd4]
    ld [$dfd3], a
    ret


Jump_001_74f4:
    xor a
    ld [$dfd2], a
    ret


Jump_001_74f9:
    xor a
    ld [$dfe4], a
    ld [$dfd2], a
    ldh [rNR12], a
    ret


Jump_001_7503:
    xor a
    ld [$dfe5], a
    ld [$dfd2], a
    ldh [rNR32], a
    ret


Call_001_750d:
    xor a
    ld [$dfe3], a
    ld [$dfe4], a
    ld [$dfe5], a
    ldh [rNR12], a
    ldh [rNR22], a
    ldh [rNR32], a
    ret


Call_001_751e:
    xor a
    ldh [rNR22], a
    ret


Call_001_7522:
    xor a
    ldh [rNR30], a
    ret


    ld a, $01
    ld [$dff4], a
    ret


Call_001_752c:
    xor a
    ld [$dff4], a
    ret



INCLUDE "audio/sound_data_bank1_0.asm"



REPT $571
    db $FF
ENDR

Func7ff0:
    jp Jump_001_6800

Func7ff3:
    call Call_001_750d
    ret


    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38
