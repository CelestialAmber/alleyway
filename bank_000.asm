; Disassembly of "alleyway.gb"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

SECTION "ROM Bank $000 Main", ROM0[$150]

Start:
.waitForVBlank
    ldh a, [rLY]
    cp $91 ;is the current scanline less than 91 (2nd vblank line)?
    jr c, .waitForVBlank
    ld a, $00
    ldh [rLCDC], a ;zero the lcdc register
    ld sp, $cfff ;set the stack pointer to cfff
    call Call_000_0233
    ld hl, $9fff
    ld c, $1f
    xor a
    ld b, $00
;zero out vram
.loopVram
    ld [hl-], a
    dec b
    jr nz, .loopVram
    dec c
    jr nz, .loopVram
    ld hl, $dfff
    ld c, $3f
    xor a
    ld b, $00
;zero out ram
.loopRam
    ld [hl-], a
    dec b
    jr nz, .loopRam
    dec c
    jr nz, .loopRam
    ld hl, $fffe
    ld b, $7f
    ;zero out
.loopHRam
    ld [hl-], a
    dec b
    jr nz, .loopHRam
    ld hl, $feff
    ld b, $ff
.loop2:
    ld [hl-], a
    dec b
    jr nz, .loop2
    call Call_000_0381
    call Call_000_0358
    call Call_000_035d
    ld c, $80
    ld b, $0c
    ld hl, $03b5
.loop3
    ld a, [hl+]
    ld [c], a
    inc c
    dec b
    jr nz, .loop3
    ld a, $01
    ldh [rIF], a
    ldh [$9d], a
    ld a, $40
    ldh [rSTAT], a
    xor a
    ldh [rSCY], a
    ldh [rSCX], a
    ld a, $00
    ldh [rLCDC], a
    ld a, $e4
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    ld a, $ff
    ldh [$8c], a
    ld a, $00
    ldh [rLYC], a
    ld a, $00
    ldh [rTAC], a
    ld a, $00
    ldh [rTMA], a
    ld a, $20
    ldh [$9b], a
    xor a
    ldh [rIF], a
    xor a
    ldh [$9e], a
    ldh [$9f], a
    ldh [$a4], a
    ldh [$aa], a
    ldh [$ab], a
    ld a, $83
    ldh [$9c], a
    ldh [rLCDC], a
    call Call_000_022d
    jp Jump_000_0511


MainLoop:
    push af
    push bc
    push de
    push hl
    call PollInput
    ld a, $02
    ldh [$90], a
    ld a, $81
    ldh [rSC], a
    call $ff80 ;call the oam dma function
    call Call_000_02a1
    ldh a, [$9c]
    ldh [rLCDC], a
    ldh a, [$9e]
    ldh [rSCX], a
    ldh a, [$9f]
    ldh [rSCY], a
    call Func7ff0
    ldh a, [$a2]
    inc a
    ldh [$a2], a
    ld a, $01
    ldh [$a0], a
    pop hl
    pop de
    pop bc
    pop af
    reti


Call_000_0221:
jr_000_0221:
    ld a, $00
    ldh [$a0], a
.loop:
    db $76
    ldh a, [$a0]
    cp $00
    jr z, .loop
    ret


Call_000_022d:
    ldh a, [$9d]
    ldh [rIE], a
    ei
    ret


Call_000_0233:
    ldh a, [rIE]
    ldh [$9d], a
    ld a, $00
    ldh [rIE], a
    di
    ret


Call_000_023d:
    ldh a, [$a3]
    cp $00
    ret z

    jr jr_000_0221

Call_000_0244:
    ldh a, [$9c]
    and $7f
    or $80
    ldh [$9c], a
    ldh [rLCDC], a
    ret


Call_000_024f:
    ldh a, [$9c]
    and $7f
    ldh [$9c], a
    jr jr_000_0221

Call_000_0257:
Jump_000_0257:
jr_000_0257:
    push af
    call Call_000_0221
    pop af
    dec a
    jr nz, jr_000_0257

    ret


Jump_000_0260:
    push af
    push bc
    push de
    push hl
    call Call_000_0b67
    ldh a, [rIF]
    and $fd
    ldh [rIF], a
    pop hl
    pop de
    pop bc
    pop af
    reti


Jump_000_0272:
    push af
    push bc
    ldh a, [$90]
    dec a
    ldh [$90], a
    jr nz, jr_000_028c

    ldh a, [$92]
    ld b, a
    ldh a, [rSB]
    ldh [$92], a
    ld c, a
    xor b
    xor $ff
    or c
    ldh [$93], a
    pop bc
    pop af
    reti


jr_000_028c:
    ldh a, [rSB]
    ldh [$91], a
    ld a, $81
    ldh [rSC], a
    pop bc
    pop af
    reti


Call_000_0297:
    ld a, $01
    ldh [rSB], a
    ld hl, $ffff
    set 3, [hl]
    ret


Call_000_02a1:
    ldh a, [$a3]
    cp $00
    jr z, jr_000_02b6

    ld de, $c901
    call Call_000_02c1
    xor a
    ld [$c900], a
    ld [$c901], a
    ldh [$a3], a

jr_000_02b6:
    ret


jr_000_02b7:
    inc de
    ld h, a
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    inc de
    call Call_000_02c7

Call_000_02c1:
    ld a, [de]
    cp $00
    jr nz, jr_000_02b7

    ret


Call_000_02c7:
    push af
    and $3f
    ld b, a
    pop af
    rlca
    rlca
    and $03
    jr z, jr_000_02da

    dec a
    jr z, jr_000_02e1

    dec a
    jr z, jr_000_02e8

    jr jr_000_02f5

jr_000_02da:
    ld a, [de]
    ld [hl+], a
    inc de
    dec b
    jr nz, jr_000_02da

    ret


jr_000_02e1:
    ld a, [de]
    inc de

jr_000_02e3:
    ld [hl+], a
    dec b
    jr nz, jr_000_02e3

    ret


jr_000_02e8:
    ld a, [de]
    ld [hl], a
    inc de
    ld a, b
    ld bc, $0020
    add hl, bc
    ld b, a
    dec b
    jr nz, jr_000_02e8

    ret


jr_000_02f5:
    ld a, [de]
    ld [hl], a
    ld a, b
    ld bc, $0020
    add hl, bc
    ld b, a
    dec b
    jr nz, jr_000_02f5

    inc de
    ret


    pop de
    ld a, [de]
    ld l, a
    inc de
    ld a, [de]
    ld h, a
    inc de
    push de
    push af
    push bc

jr_000_030c:
    ld a, [hl+]
    cp $ff
    jr z, jr_000_0355

    ld d, a
    ld a, [hl+]
    ld e, a
    push de
    ld a, [hl+]
    push af
    and $1f
    ld c, a
    ld a, [hl+]
    ldh [$95], a
    pop af
    and $80
    jr z, jr_000_033b

jr_000_0322:
    ldh a, [$95]
    ld b, a

jr_000_0325:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_0325

    pop de
    push hl
    ld hl, $0020
    add hl, de
    push hl
    pop de
    pop hl
    push de
    dec c
    jr nz, jr_000_0322

    pop de
    jr jr_000_030c

jr_000_033b:
    ldh a, [$95]
    ld b, a

jr_000_033e:
    ld a, [hl]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_033e

    pop de
    push hl
    ld hl, $0020
    add hl, de
    push hl
    pop de
    pop hl
    push de
    dec c
    jr nz, jr_000_033b

    pop de
    inc hl
    jr jr_000_030c

jr_000_0355:
    pop bc
    pop af
    ret


Call_000_0358:
    ld hl, $9800
    jr jr_000_0360

Call_000_035d:
    ld hl, $9c00

jr_000_0360:
    ld bc, $0400

jr_000_0363:
    ld a, $ff
    ld [hl+], a
    dec bc
    ld a, b
    or c
    jr nz, jr_000_0363

    ret


Call_000_036c:
    ld b, $a0
    ld a, $00
    ld hl, $c800

jr_000_0373:
    ld [hl+], a
    dec b
    jr nz, jr_000_0373

    ret

Func0378:
    ld b, $18
    ld a, $00
    ld hl, $c888
    jr jr_000_0373

Call_000_0381:
    ld hl, $5b75
    ld de, $9000
    ld bc, $0800

jr_000_038a:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_038a

    ld hl, $5375
    ld de, $8800
    ld bc, $0800

jr_000_039b:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_039b

    ld hl, $4b75
    ld de, $8000
    ld bc, $0800

jr_000_03ac:
    ld a, [hl+]
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_03ac

    ret

;code used at ff80 (oam dma code)
OAMDmaCode::
    di
    ld a, $c8
    ldh [rDMA], a
    ld a, $28
.loop
    dec a
    jr nz, .loop
    ei
    ret


PollInput:
    ld a, $20
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    and $0f
    swap a
    ld b, a
    ld a, $10
    ldh [rP1], a
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    ldh a, [rP1]
    and $0f
    or b
    ldh [$8c], a
    ld a, $30
    ldh [rP1], a
    ld b, $08
    ldh a, [hJoyInput]
    ld c, a
    ldh a, [$8c]

jr_000_0406:
    rrc c
    jr c, jr_000_0416

    rrca
    jr nc, jr_000_0421

Jump_000_040d:
jr_000_040d:
    dec b
    jr nz, jr_000_0406

    ldh [$8d], a
    ld a, c
    ldh [hJoyInput], a
    ret


jr_000_0416:
    rrca
    jr c, jr_000_041d

    set 7, a
    jr jr_000_040d

jr_000_041d:
    res 7, c
    jr jr_000_040d

jr_000_0421:
    set 7, c
    jp Jump_000_040d


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
    ret


    ldh a, [rIE]
    and $fe

jr_000_044a:
    ldh [rIE], a
    ret


    ldh a, [rIE]
    or $01
    jr jr_000_044a

Jump_000_0453:
    reti


Call_000_0454:
    push af
    push hl
    ld hl, $0000
    ld c, $00
    srl b
    rr c
    ld a, $08

jr_000_0461:
    sla e
    jr nc, jr_000_0466

    add hl, bc

jr_000_0466:
    srl b
    rr c
    dec a
    jr nz, jr_000_0461

    ld c, l
    ld b, h
    pop hl
    pop af
    ret


    sub b
    ld b, a
    and $80
    ld a, b
    ret z

    xor $ff
    inc a
    ret


Call_000_047c:
    ld b, $ff
    ld c, $ff
jr_000_0480:
    inc c
    sub $64
    jr nc, jr_000_0480
    add $64
jr_000_0487:
    inc b
    sub $0a
    jr nc, jr_000_0487
    add $0a
    ret

Func048f:
    ldh [$97], a
    ld a, b
    ldh [$96], a
    ld b, $ff

jr_000_0496:
    inc b
    ldh a, [$96]
    sub $10
    ldh [$96], a
    ldh a, [$97]
    sbc $27
    ldh [$97], a
    jr nc, jr_000_0496

    ldh a, [$96]
    add $10
    ldh [$96], a
    ldh a, [$97]
    adc $27
    ldh [$97], a
    ld a, b
    ldh [$9a], a
    ld b, $ff

jr_000_04b6:
    inc b
    ldh a, [$96]
    sub $e8
    ldh [$96], a
    ldh a, [$97]
    sbc $03
    ldh [$97], a
    jr nc, jr_000_04b6

    ldh a, [$96]
    add $e8
    ldh [$96], a
    ldh a, [$97]
    adc $03
    ldh [$97], a
    ld a, b
    ldh [$99], a
    ld b, $ff

jr_000_04d6:
    inc b
    ldh a, [$96]
    sub $64
    ldh [$96], a
    ldh a, [$97]
    sbc $00
    ldh [$97], a
    jr nc, jr_000_04d6

    ldh a, [$96]
    add $64
    ldh [$96], a
    ld a, b
    ldh [$98], a
    ld b, $ff

jr_000_04f0:
    inc b
    ldh a, [$96]
    sub $0a
    ldh [$96], a
    jr nc, jr_000_04f0

    ldh a, [$96]
    add $0a
    ldh [$96], a
    ldh [$96], a
    ld a, b
    ldh [$97], a
    ret


Call_000_0505:
    ld b, $05
    ldh a, [$a1]

jr_000_0509:
    add $0d
    dec b
    jr nz, jr_000_0509

    ldh [$a1], a
    ret


Jump_000_0511:
    nop
    call Func6375
    call Call_000_0297
    xor a
    ldh [$a4], a
    ldh [$aa], a
    ldh [$ab], a

Jump_000_051f:
    call Call_000_052b
    call Call_000_0505
    call Call_000_0221
    jp Jump_000_051f


Call_000_052b:
    ldh a, [$8c]
    and $08
    jr nz, jr_000_053c

    ldh a, [$8d]
    and $04
    jr nz, jr_000_053c

    ld a, $01
    ldh [$a4], a
    ret


jr_000_053c:
    ldh a, [$a4]
    sla a
    ld c, a
    ld b, $00
    ld hl, $054c
    add hl, bc
    ld a, [hl+]
    ld b, a
    ld h, [hl]
    ld l, b
    jp hl


    ld l, h
    dec b
    ld a, b
    dec b
    add d
    dec b
    inc de
    ld b, $a2
    ld b, $73
    rlca
    and h
    rlca
    db $d3
    rlca
    dec b
    ld [$0839], sp
    rst $30
    add hl, de
    pop de
    ld [$0907], sp
    inc l
    ld [bc], a
    inc l
    ld [bc], a
    inc l
    ld [bc], a

    ld a, $c8
    ldh [$cc], a
    xor a
    ldh [$cd], a
    ld a, $01
    ldh [$a4], a
    ret


    ld a, $04
    ld [$ca4b], a
    ld a, $02
    ldh [$a4], a
    ret


    call Call_000_024f
    call Call_000_0233
    ldh a, [$9d]
    and $fd
    ldh [$9d], a
    call Call_000_0358
    call Call_000_036c
    ld de, $41cd
    call Call_000_02c1
    call Func48e4
    ld a, $e4
    ldh [rBGP], a
    ldh a, [$9c]
    and $df
    ldh [$9c], a
    call Call_000_022d
    call Call_000_0244
    ld a, [$ca4b]
    inc a
    cp $05
    jr nz, jr_000_05b6

    xor a

jr_000_05b6:
    ld [$ca4b], a
    cp $00
    push af
    push af
    call z, Func6382
    pop af
    call z, $63e8
    pop af
    call nz, Func6387
    ld a, $03
    ld [$ca49], a

jr_000_05cd:
    call Call_000_0221
    ldh a, [$ffa2]
    cp $00
    jr nz, jr_000_05df

    ld a, [$ca49]
    dec a
    ld [$ca49], a
    jr z, jr_000_060e

jr_000_05df:
    ldh a, [$ff8d]
    and $08
    jr z, jr_000_05eb

    ldh a, [$ff93]
    and $80
    jr nz, jr_000_05cd

jr_000_05eb:
    xor a
    ld [wCA45], a
    ld [wCurrentStage], a
    ld [wCA47], a
    ldh [$ffa5], a
    ldh [$ffca], a
    ldh [$ffcb], a
    ld a, $04
    ld [wLives], a
    call Call_000_0c8f
    call Func6382
    call Func4603
    ld a, $04
    ldh [$a4], a
    ret


jr_000_060e:
    ld a, $03
    ldh [$a4], a
    ret


    call Func6387
    call Func4603

jr_000_0619:
    call Call_000_0505
    and $1f
    ld [wCA45], a
    ld b, a
    ld e, $03
    call Call_000_0454
    ld hl, StageDataPointerTable
    add hl, bc
    ld a, [hl]
    bit 7, a
    jr nz, jr_000_0619

    ld a, $ff
    ld [wCurrentStage], a
    inc a
    ldh [$ca], a
    ldh [$cb], a
    ld [wLives], a
    call Call_000_06a2
    ld a, $0a
    ld [$ca49], a
    call Call_000_10fb
    call Call_000_0784
    ldh a, [$b6]
    sub $0b
    ldh [$c0], a
    call Call_000_118f
    ld a, $10
    call Call_000_0257

jr_000_0659:
    call Call_000_0b21
    call Call_000_0ca6
    call Call_000_118f
    ldh a, [$c2]
    ld b, a
    ld a, $80
    sub b
    ld b, a
    ldh a, [$b6]
    sub $0b
    ldh [$c0], a
    call Call_000_10ec
    call Call_000_0505
    call Call_000_0221
    ldh a, [$8d]
    and $08
    jr z, jr_000_069d

    ldh a, [$93]
    and $80
    jr z, jr_000_069d

    ldh a, [$a2]
    cp $00
    jr nz, jr_000_0659

    ld a, [$ca49]
    dec a
    ld [$ca49], a
    jr nz, jr_000_0659

    ld a, $20
    call Call_000_0257
    ld a, $02
    ldh [$a4], a
    ret


jr_000_069d:
    ld a, $01
    ldh [$a4], a
    ret


Call_000_06a2:
    call Func4807
    call Call_000_1ac6
    xor a
    ldh [$aa], a
    ldh [$ab], a
    ldh [$c1], a
    ld a, $18
    ldh [$c2], a
    ld a, [wCA45]
    ld b, a
    ld e, $03
    call Call_000_0454
    ld hl, StageDataPointerTable
    add hl, bc
    ld a, [hl]
    bit 7, a
    push af
    push af
    call nz, Call_000_0738
    pop af
    ;go to next stage
    call z, IncrementCurrentStage
    pop af
    bit 6, a
    call nz, Call_000_074c
    ld a, $28
    ldh [$c0], a
    ld a, $90
    ldh [$bf], a
    ld a, [wCA45]
    call Call_000_092a
    call Call_000_09d0
    call Call_000_0b9d
    xor a
    ldh a, [$ac]
    call Call_001_4a0f
    call Func481e
    call Func47c7
    call Func4a29
    ld a, [wCurrentStage]
    cp $01
    call z, Call_001_43dc
    ldh a, [$aa]
    cp $00

Jump_000_0701:
    push af
    call z, Func4669
    pop af
    call nz, Func46f7
    call Func481e
    call Func4a29
    call Func47c7
    call Func47a1
    ld a, $10
    call Call_000_0257
    call Call_000_0997
    call Call_000_036c
    call Func481e
    call Func4a29
    call Call_001_4a0f
    ldh a, [$aa]
    cp $00
    call nz, Call_000_19cc
    xor a
    ldh [$c5], a
    ld a, $05
    ldh [$a4], a
    ret


Call_000_0738:
    ld a, $01
    ldh [$aa], a
    ld a, [wCA47]
    inc a
    ld [wCA47], a
    ret


IncrementCurrentStage:
    ld a, [wCurrentStage]
    inc a
    ld [wCurrentStage], a
    ret


Call_000_074c:
    and $3f
    sla a
    ld c, a
    ld b, $00
    ld hl, $4075
    add hl, bc
    ld a, [hl+]
    ld h, [hl]
    ld l, a
    ld bc, $ca14
    ld de, $ca28
    ld a, $14

jr_000_0762:
    push af
    ld a, [hl+]
    ld [bc], a
    and $7f
    ld [de], a
    inc bc
    inc de
    pop af
    dec a
    jr nz, jr_000_0762

    ld a, $01
    ldh [$ab], a
    ret


    call Call_000_0b21
    call Call_000_109d
    ldh a, [$8d]
    and $01
    jr z, jr_000_0784

    ldh a, [$93]
    and $80
    ret nz

Call_000_0784:
jr_000_0784:
    xor a
    ldh [$c3], a
    ldh [$c6], a
    call Call_000_1177
    call Call_000_101b
    call Func4a29
    call Func47c7
    call Func63c6
    ldh a, [$aa]
    cp $00
    call nz, Func63fc
    ld a, $06
    ldh [$a4], a
    ret


    ldh a, [$aa]
    cp $00
    call nz, Call_000_198c
    call Call_000_0b21
    call Call_000_0ca6
    call Call_000_109d
    ldh a, [$8d]
    and $08
    jr z, jr_000_07c3

    ldh a, [$93]
    and $80
    ret nz

    ld a, $ff
    ldh [$93], a

jr_000_07c3:
    ldh a, [$aa]
    cp $00
    ret nz

    call Func474c
    call Func63f4
    ld a, $0c
    ldh [$a4], a
    ret


    call Func7ff3
    call Func455d
    ld a, $40
    call Call_000_0257
    ldh a, [$aa]
    cp $00
    jr nz, jr_000_0805

    ld a, $0b
    ldh [$a4], a
;decrease lives
    ld a, [wLives]
    cp $00 ;does the player have no lives left?
    ret z ;yes
    dec a ;decrease lives by 1
    ld [wLives], a
    call Func47c7
    xor a
    ldh [$c1], a
    ld a, $18
    ldh [$c2], a
    ld a, $02
    ldh [$c5], a
    ld a, $05
    ldh [$a4], a
    ret


jr_000_0805:
    ldh a, [$aa]
    cp $00
    push af
    call z, Call_000_0823
    pop af
    call nz, Call_000_19f7
    call Call_000_082b
    ld b, $04
    ld a, [wCA45]
    cp $00
    jr nz, jr_000_081f

    ld b, $09

jr_000_081f:
    ld a, b
    ldh [$a4], a
    ret


Call_000_0823:
    call Func63f8
    ld a, $90
    jp Jump_000_0257


Call_000_082b:
    ld a, [wCA45]
    inc a
    cp $20
    jr c, jr_000_0835

    ld a, $00

jr_000_0835:
    ld [wCA45], a
    ret


    call Call_000_08ac
    ldh a, [$9d]
    and $fd
    ldh [$9d], a
    call Func4603
    ldh a, [$9d]
    and $fd
    ldh [$9d], a
    ldh [rIE], a
    call Call_001_4a0f
    call Func481e
    call Func47c7
    call Func4a29
    call Func47a1
    call Func6414
    call Call_000_08a7
    ld a, $00
    call Call_000_0257
    ld a, $00
    call Call_000_0257
    ld a, $a0
    call Call_000_0257
    ld a, $01
    call Call_000_0257
    call Func45bd
    ld a, $00
    call Call_000_0257
    ld a, $01
    call Call_000_0257
    call Call_000_1af5
    ld a, $c0
    call Call_000_0257
    call Call_000_1b1b
    call Call_000_08ac
    ldh a, [$9d]
    or $02
    ldh [$9d], a
    ldh [rIE], a
    call Call_000_0983
    call Call_000_09bb
    call Call_000_08a7
    ld a, $04
    ldh [$a4], a
    ret


Call_000_08a7:
    ld hl, $08c2
    jr jr_000_08af

Call_000_08ac:
    ld hl, $08c6

jr_000_08af:
    ld b, $04

jr_000_08b1:
    ld a, [hl+]
    call Call_000_08ca
    push bc
    push hl
    ld a, $10
    call Call_000_0257
    pop hl
    pop bc
    dec b
    jr nz, jr_000_08b1

    ret


    nop
    ld b, b
    sub b
    db $e4
    db $e4
    sub b
    ld b, b
    nop

Call_000_08ca:
    ldh [rBGP], a
    ldh [rOBP0], a
    ldh [rOBP1], a
    ret


    call Func444d
    ld a, $40
    call Call_000_0257
    call Call_000_024f
    call Call_000_0233
    call Call_000_0358
    call Call_000_036c
    ldh a, [$9c]
    and $df
    ldh [$9c], a
    ldh a, [$9d]
    and $fd
    ldh [$9d], a
    call Func63f0
    call Func498a
    call Call_000_022d
    call Call_000_0244
    ld a, $c0
    call Call_000_0257
    ld a, $01
    ldh [$a4], a
    ret


    ldh a, [$8d]
    and $08
    jr z, jr_000_0916

    ldh a, [$93]
    and $80
    ret nz

    ld a, $ff
    ldh [$93], a

jr_000_0916:
    call Call_000_036c
    call Func481e
    call Func4a29
    call Call_001_4a0f
    call Func63f4
    ld a, $06
    ldh [$a4], a
    ret


Call_000_092a:
    ld b, a
    ld e, $03
    call Call_000_0454
    ld hl, StageDataPointerTable
    add hl, bc
    inc hl
    ld e, [hl]
    inc hl
    ld d, [hl]
    push de
    call Call_000_0983
    call Call_000_09bb
    pop de
    ld hl, $c000
    ld b, $00

jr_000_0945:
    ld c, $0e

jr_000_0947:
    push bc
    push de
    push hl
    ld a, [de]
    ld [hl], a
    cp $00
    jr z, jr_000_096a

    push hl
    dec a
    ld b, a
    ld e, $06
    call Call_000_0454
    ld hl, UnknownData1b87
    add hl, bc
    ld b, $00
    ld c, $03
    add hl, bc
    ld a, [hl]
    and $0f
    pop hl
    ld bc, $0400
    add hl, bc
    ld [hl], a

jr_000_096a:
    pop hl
    pop de
    pop bc
    inc hl
    inc de
    dec c
    jr nz, jr_000_0947

    inc b
    ld a, [de]
    cp $ff
    jr nz, jr_000_0945

    ld a, b
    ldh [$a8], a
    sub $14
    jr nc, jr_000_0980

    xor a

jr_000_0980:
    ldh [$a9], a
    ret


Call_000_0983:
    ld hl, $c000
    ld de, $c400
    ld bc, $0348

jr_000_098c:
    ld a, $00
    ld [hl+], a
    ld [de], a
    inc de
    dec bc
    ld a, b
    or c
    jr nz, jr_000_098c

    ret


Call_000_0997:
    ldh a, [$a8]
    dec a
    dec a
    ldh [$ad], a
    ld a, $0a

jr_000_099f:
    push af
    call Call_000_0a96
    call Call_000_0221
    ldh a, [$ad]
    dec a
    dec a
    ldh [$ad], a
    pop af
    dec a
    jr nz, jr_000_099f

    ldh a, [$a9]
    cp $00
    ret z

    dec a
    ldh [$ad], a
    jp Jump_000_0a96


Call_000_09bb:
    ld a, $3a
    ldh [$ad], a

jr_000_09bf:
    call Call_000_0a96
    call Call_000_0221
    ldh a, [$ad]
    cp $00
    ret z

    dec a
    dec a
    ldh [$ad], a
    jr jr_000_09bf

Call_000_09d0:
    ld hl, $c000
    ld de, $0000
    ld bc, $0348

jr_000_09d9:
    push bc
    push hl
    ld a, [hl]
    cp $00
    jr z, jr_000_09ea

    ld bc, $0400
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_000_09ea

    inc de

jr_000_09ea:
    pop hl
    inc hl
    pop bc
    dec bc
    ld a, b
    or c
    jr nz, jr_000_09d9

    ld a, d
    ldh [$c8], a
    ld a, e
    ldh [$c9], a
    ret


Call_000_09f9:
    call Call_000_023d
    ldh a, [$ad]
    srl a
    ld b, a
    ld e, $20
    call Call_000_0454
    ldh a, [$ae]
    ld l, a
    ld h, $00
    add hl, bc
    ld a, h
    ldh [$b2], a
    ld a, l
    ldh [$b3], a
    ldh a, [$ad]
    srl a
    ld b, a
    ld e, $1c
    call Call_000_0454
    ldh a, [$ae]
    ld l, a
    ld h, $00
    add hl, bc
    ld a, $ff
    ldh [$b1], a
    xor a
    push af
    ld bc, $c000
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_000_0a37

    ldh [$b1], a
    pop af
    or $01
    push af

jr_000_0a37:
    ld b, $00
    ld c, $0e
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_000_0a47

    ldh [$b1], a
    pop af
    or $02
    push af

jr_000_0a47:
    pop af
    cp $00
    jp z, Jump_000_0a64

    dec a
    push af
    ldh a, [$b1]
    dec a
    ld b, a
    ld e, $06
    call Call_000_0454
    ld hl, UnknownData1b87
    add hl, bc
    pop af
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ldh [$b1], a

Jump_000_0a64:
    ldh a, [$b2]
    ld b, a
    ldh a, [$b3]
    ld c, a
    ld hl, $9821
    add hl, bc
    ld b, h
    ld c, l
    push bc
    ld b, $00
    ld c, $0e
    add hl, bc
    ld b, h
    ld c, l
    ld hl, $c901
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ldh a, [$b1]
    ld [hl+], a
    pop bc
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ldh a, [$b1]
    ld [hl+], a
    xor a
    ld [hl+], a
    inc a
    ldh [$a3], a
    ret


Call_000_0a96:
Jump_000_0a96:
    call Call_000_023d
    ldh a, [$ad]
    srl a
    ld b, a
    ld e, $20
    call Call_000_0454
    ld hl, $9821
    add hl, bc
    ld b, h
    ld c, l
    ld hl, $c901
    ld a, b
    ld [hl+], a
    ld a, c
    ld [hl+], a
    ld a, $1c
    ld [hl], a
    ldh a, [$ad]
    srl a
    ld b, a
    ld e, $1c
    call Call_000_0454
    ld hl, $c000
    add hl, bc
    ld de, $c904
    ld a, $0e

jr_000_0ac6:
    push af
    push hl
    push de
    ld a, $ff
    ldh [$b1], a
    xor a
    push af
    ld a, [hl]
    cp $00
    jr z, jr_000_0ada

    ldh [$b1], a
    pop af
    or $01
    push af

jr_000_0ada:
    ld b, $00
    ld c, $0e
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_000_0aea

    ldh [$b1], a
    pop af
    or $02
    push af

jr_000_0aea:
    pop af
    cp $00
    jp z, Jump_000_0b07

    dec a
    push af
    ldh a, [$b1]
    dec a
    ld b, a
    ld e, $06
    call Call_000_0454
    ld hl, UnknownData1b87
    add hl, bc
    pop af
    ld b, $00
    ld c, a
    add hl, bc
    ld a, [hl]
    ldh [$b1], a

Jump_000_0b07:
    pop de
    ldh a, [$b1]
    ld [de], a
    ld b, d
    ld c, e
    ld hl, $000e
    add hl, bc
    ld [hl+], a
    ld b, h
    ld c, l
    inc de
    pop hl
    inc hl
    pop af
    dec a
    jr nz, jr_000_0ac6

    xor a
    ld [bc], a
    inc a
    ldh [$a3], a
    ret


Call_000_0b21:
    ldh a, [$ab]
    cp $00
    ret z

    ld hl, $ca00
    ld de, $ca14
    ld bc, $ca28
    ld a, $00

jr_000_0b31:
    push af
    ld a, [bc]
    dec a
    jr nz, jr_000_0b48

    ld a, [de]
    cp $00
    jr z, jr_000_0b48

    and $80
    push af
    call z, Call_000_0b53
    pop af
    call nz, Call_000_0b5d
    ld a, [de]
    and $7f

jr_000_0b48:
    ld [bc], a
    inc hl
    inc de
    inc bc
    pop af
    inc a
    cp $14
    jr c, jr_000_0b31

    ret


Call_000_0b53:
    ld a, [hl]
    inc a
    cp $70
    jr c, jr_000_0b5b

    ld a, $00

jr_000_0b5b:
    ld [hl], a
    ret


Call_000_0b5d:
    ld a, [hl]
    dec a
    cp $ff
    jr nz, jr_000_0b65

    ld a, $6f

jr_000_0b65:
    ld [hl], a
    ret


Call_000_0b67:
    ldh a, [$ac]
    ld c, a
    inc a
    cp $15
    jr nc, jr_000_0b8c

    ldh [$ac], a
    sla a
    sla a
    ld b, $07
    add b
    ldh [rLYC], a
    ld b, $00
    ld hl, $ca00
    add hl, bc
    ld a, [hl]
    ldh [rSCX], a
    xor a
    cp c
    ret nz

    ld a, [$ca3c]
    ldh [rSCY], a
    ret


jr_000_0b8c:
    xor a
    ldh [$ac], a
    ld b, $07
    add b
    ldh [rLYC], a
    ld a, [$ca3d]
    ldh [rSCY], a
    xor a
    ldh [rSCX], a
    ret


Call_000_0b9d:
    ld a, $00
    ldh [$9e], a
    ld hl, $ca00
    ld b, $14

jr_000_0ba6:
    ld [hl+], a
    dec b
    jr nz, jr_000_0ba6

    xor a
    ldh [$9f], a

Call_000_0bad:
    ldh a, [$a9]
    sla a
    sla a
    add $00
    ld [$ca3c], a
    ld b, $70
    ldh a, [$a9]
    cp $15
    jr c, jr_000_0bc2

    ld b, $b0

jr_000_0bc2:
    ld a, b
    ld [$ca3d], a
    ret


Call_000_0bc7:
    ldh a, [$a9]
    cp $00
    ret z

    dec a
    ldh [$a9], a
    call Func6410
    call Call_000_0bad
    call Call_000_0bf2
    ldh a, [$a9]
    cp $00
    ret z

    dec a
    ret z

    ld b, a
    and $01
    ret z

    ld a, b
    ldh [$ad], a
    call Call_000_0a96
    ldh a, [$ad]
    add $16
    ldh [$ad], a
    jp Jump_000_0a96


Call_000_0bf2:
    ldh a, [$a9]
    add $14
    ld b, a
    ld e, $0e
    call Call_000_0454
    ld hl, $c000
    add hl, bc
    ld a, $0e

jr_000_0c02:
    push af
    push hl
    ld a, [hl]
    cp $00
    jr z, jr_000_0c2b

    ld d, h
    ld e, l
    ld bc, $0400
    add hl, bc
    ld a, [hl]
    cp $00
    ld a, $00
    ld [de], a
    jr z, jr_000_0c2b

    ldh a, [$c8]
    ld b, a
    ldh a, [$c9]
    ld c, a
    dec bc
    ld a, b
    ldh [$c8], a
    ld a, c
    ldh [$c9], a
    or b
    jr nz, jr_000_0c2b

    ld a, $08
    ldh [$a4], a

jr_000_0c2b:
    pop hl
    inc hl
    pop af
    dec a
    jr nz, jr_000_0c02

    ret


Call_000_0c32:
    dec a
    ld b, a
    ld e, $06
    call Call_000_0454
    ld hl, UnknownData1b87
    add hl, bc
    ld b, $00
    ld c, $03
    add hl, bc
    ld a, [hl]
    swap a
    and $0f
    ld b, a
    ldh a, [$ca]
    add b
    ldh [$ca], a
    ldh a, [$cb]
    adc $00
    ldh [$cb], a
    ret nc

    xor a
    dec a
    ldh [$cb], a
    ldh [$ca], a
    ret


Call_000_0c5b:
    ld bc, $ffcc
    ld hl, $ffca
    ld a, [c]
    sub [hl]
    push af
    inc c
    inc hl
    pop af
    ld a, [c]
    sbc [hl]
    ret nc

    ld a, [hl]
    ld [c], a
    dec c
    dec hl
    ld a, [hl]
    ld [c], a
    ret


Call_000_0c71:
    ld hl, $ffca
    ldh a, [$a6]
    sub [hl]
    push af
    inc hl
    pop af
    ldh a, [$a7]
    sbc [hl]
    ret nc

    ld a, [wLives]
    cp $09
    jr nc, jr_000_0c8c

    inc a
    ld [wLives], a
    call Func63ae

jr_000_0c8c:
    call Func47c7

Call_000_0c8f:
    ldh a, [$a5]
    sla a
    ld c, a
    ld b, $00
    ld hl, UnknownData1b5d
    add hl, bc
    ld a, [hl+]
    ldh [$a7], a
    ld a, [hl]
    ldh [$a6], a
    ldh a, [$a5]
    inc a
    ldh [$a5], a
    ret


Call_000_0ca6:
    call Call_000_0f7c
    call Call_000_0cb0
    call Call_000_108d
    ret


Call_000_0cb0:
    nop
    ldh a, [$b8]
    and $80
    jr nz, jr_000_0ce1

    ldh a, [$b4]
    sub $8d
    jr c, jr_000_0ce1

    cp $08
    jr nc, jr_000_0ce1

    ld c, a
    ldh a, [$c2]
    add $05
    ld d, a
    ldh a, [$c0]
    sub $03
    ld b, a
    ldh a, [$b6]
    sub b
    cp d
    jr nc, jr_000_0ce1

    srl a
    ld b, a
    ld a, c
    cp $07
    ld a, b
    push af
    call c, Call_000_1113
    pop af
    call nc, Call_000_0ead

jr_000_0ce1:
    ldh a, [$b4]
    cp $18
    jp c, Jump_000_0cf2

    cp $a0
    jp c, Jump_000_0d15

    ld a, $07
    ldh [$a4], a
    ret


Jump_000_0cf2:
    call Func63da
    ldh a, [$aa]
    cp $00
    jr nz, jr_000_0d12

    ldh a, [$c1]
    cp $00
    jr nz, jr_000_0d12

    ld a, $01
    ldh [$c1], a
    ld a, $10
    ldh [$c2], a
    ldh a, [$c0]
    add $04
    ldh [$c0], a
    call Func63d6

jr_000_0d12:
    call Call_000_0e8d

Jump_000_0d15:
    ldh a, [$b6]
    cp $10
    jp c, Jump_000_0d21

    cp $7c
    jp c, Jump_000_0d27

Jump_000_0d21:
    call Call_000_0ead
    call Func63da

Jump_000_0d27:
    ldh a, [$b4]
    sub $88
    ret nc

    xor a
    ldh [$c7], a
    call Call_000_0d37
    ldh a, [$c7]
    cp $00
    ret z

Call_000_0d37:
    ldh a, [$ba]
    and $80
    push af
    call z, Call_000_0d96
    pop af
    call nz, Call_000_0db9
    ldh a, [$b8]
    and $80
    push af
    call z, Call_000_0d50
    pop af
    call nz, Call_000_0d73
    ret


Call_000_0d50:
    ldh a, [$b4]
    add $03
    ldh [$af], a
    ldh a, [$bd]
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    jp nz, Jump_000_0e8d

    ldh a, [$b4]
    ldh [$af], a
    ldh a, [$bd]
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    ret z

    jp Jump_000_0ecd


Call_000_0d73:
    ldh a, [$b4]
    ldh [$af], a
    ldh a, [$bd]
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    jp nz, Jump_000_0e8d

    ldh a, [$b4]
    add $03
    ldh [$af], a
    ldh a, [$bd]
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    ret z

    jp Jump_000_0ecd


Call_000_0d96:
    ldh a, [$bc]
    ldh [$af], a
    ldh a, [$b6]
    add $03
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    jp nz, Jump_000_0ead

    ldh a, [$bc]
    ldh [$af], a
    ldh a, [$b6]
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    ret z

    jp Jump_000_0edb


Call_000_0db9:
    ldh a, [$bc]
    ldh [$af], a
    ldh a, [$b6]
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    jp nz, Jump_000_0ead

    ldh a, [$bc]
    ldh [$af], a
    ldh a, [$b6]
    add $03
    ldh [$b0], a
    call Call_000_0ddc
    cp $00
    ret z

    jp Jump_000_0edb


Call_000_0ddc:
    ld a, [$ca3c]
    sub $00
    ld b, a
    ldh a, [$af]
    sub $18
    add b
    jr c, jr_000_0df3

    srl a
    srl a
    ldh [$ad], a
    cp $3c
    jr c, jr_000_0df6

Jump_000_0df3:
jr_000_0df3:
    ld a, $00
    ret


jr_000_0df6:
    ld b, a
    ldh a, [$a9]
    ld c, a
    ld a, b
    sub c
    ld c, a
    ld b, $00
    ld hl, $ca00
    add hl, bc
    ld a, [hl]
    sub $00
    ld b, a
    ldh a, [$b0]
    sub $10
    add b
    cp $70
    jr c, jr_000_0e12

    sub $70

jr_000_0e12:
    srl a
    srl a
    srl a
    ldh [$ae], a
    ldh a, [$ad]
    ld b, a
    ld e, $0e
    call Call_000_0454
    ldh a, [$ae]
    ld l, a
    ld h, $00
    add hl, bc
    ld bc, $c000
    add hl, bc
    ld a, [hl]
    cp $00
    ret z

    ldh [$b1], a
    push hl
    call Call_000_0f2f
    pop hl
    ld d, h
    ld e, l
    ld bc, $0400
    add hl, bc
    ld a, [hl]
    cp $00
    jr z, jr_000_0e85

    ld b, a
    ldh a, [$aa]
    cp $00
    jr nz, jr_000_0e4c

    dec b
    ld [hl], b
    ret nz

jr_000_0e4c:
    xor a
    ld [de], a
    ldh a, [$b1]
    call Call_000_0c32
    call Call_000_0c5b
    call Call_000_0c71
    call Func481e
    call Func638d
    call Call_000_09f9
    ldh a, [$c8]
    ld b, a
    ldh a, [$c9]
    ld c, a
    dec bc
    ld a, b
    ldh [$c8], a
    ld a, c
    ldh [$c9], a
    or b
    jr nz, jr_000_0e76

    ld a, $08
    ldh [$a4], a

jr_000_0e76:
    ldh a, [$aa]
    cp $00
    jp nz, Jump_000_0df3

jr_000_0e7d:
    ldh a, [$c7]
    inc a
    ldh [$c7], a
    ld a, $01
    ret


jr_000_0e85:
    call Call_000_0f4f
    call Func638d
    jr jr_000_0e7d

Call_000_0e8d:
Jump_000_0e8d:
    ldh a, [$b8]
    and $80
    push af
    call z, Call_000_0ee8
    pop af
    call nz, Call_000_0ef7
    ldh a, [$b8]
    ld b, a
    ldh a, [$b9]
    ld c, a
    call Call_000_0fb3
    ld a, b
    ldh [$b8], a
    ld a, c
    ldh [$b9], a
    ldh a, [$b4]
    ldh [$bc], a
    ret


Call_000_0ead:
Jump_000_0ead:
    ldh a, [$ba]
    and $80
    push af
    call z, Call_000_0f08
    pop af
    call nz, Call_000_0f20
    ldh a, [$ba]
    ld b, a
    ldh a, [$bb]
    ld c, a
    call Call_000_0fb3
    ld a, b
    ldh [$ba], a
    ld a, c
    ldh [$bb], a
    ldh a, [$b6]
    ldh [$bd], a
    ret


Jump_000_0ecd:
    ret


    ldh a, [$b8]
    and $80
    push af
    call nz, Call_000_0ee8
    pop af
    call z, Call_000_0ef7
    ret


Jump_000_0edb:
    ldh a, [$ba]
    and $80
    push af
    call nz, Call_000_0f08
    pop af
    call z, Call_000_0f20
    ret


Call_000_0ee8:
    ldh a, [$b4]
    and $03
    ret z

    ld b, a
    ldh a, [$b4]
    and $fc
    sub b
    inc a
    ldh [$b4], a
    ret


Call_000_0ef7:
    ldh a, [$b4]
    and $03
    ret z

    ld b, a
    ldh a, [$b4]
    and $fc
    add $08
    sub b
    dec a
    ldh [$b4], a
    ret


Call_000_0f08:
    ld b, $04
    ldh a, [$b6]
    and $04
    jr nz, jr_000_0f12

    ld b, $fc

jr_000_0f12:
    ldh a, [$b6]
    and $f8
    add b
    cp $10
    jr nc, jr_000_0f1d

    ld a, $10

jr_000_0f1d:
    ldh [$b6], a
    ret


Call_000_0f20:
    ldh a, [$b6]
    and $f8
    add $08
    cp $7c
    jr c, jr_000_0f2c

    ld a, $7c

jr_000_0f2c:
    ldh [$b6], a
    ret


Call_000_0f2f:
    ldh a, [$b1]
    dec a
    ld b, a
    ld e, $06
    call Call_000_0454
    ld hl, UnknownData1b87
    add hl, bc
    ld b, $00
    ld c, $04
    add hl, bc
    ld a, [hl]
    cp $00
    ret z

    ld b, a
    ldh a, [$be]
    cp b
    ret nc

    ld a, b
    ldh [$be], a
    jr jr_000_0fbd

Call_000_0f4f:
    ldh a, [$c6]
    inc a
    cp $0a
    jr c, jr_000_0f5a

    call Call_000_0fbd
    xor a

jr_000_0f5a:
    ldh [$c6], a
    ret


    ldh a, [$c3]
    inc a
    cp $08
    jr c, jr_000_0f6b

    call Call_000_0f6e
    call Call_000_0fbd
    xor a

jr_000_0f6b:
    ldh [$c3], a
    ret


Call_000_0f6e:
    ldh a, [$be]
    inc a
    cp $1a
    jr c, jr_000_0f77

    ld a, $03

jr_000_0f77:
    ldh [$be], a
    jp Func4a29


Call_000_0f7c:
    ldh a, [$b4]
    ldh [$bc], a
    ld h, a
    ldh a, [$b5]
    ld l, a
    ldh a, [$b8]
    ld b, a
    ldh a, [$b9]
    ld c, a
    add hl, bc
    ld a, c
    ldh [$b9], a
    ld a, b
    ldh [$b8], a
    ld a, l
    ldh [$b5], a
    ld a, h
    ldh [$b4], a
    ldh a, [$b6]
    ldh [$bd], a
    ld h, a
    ldh a, [$b7]
    ld l, a
    ldh a, [$ba]
    ld b, a
    ldh a, [$bb]
    ld c, a
    add hl, bc
    ld a, c
    ldh [$bb], a
    ld a, b
    ldh [$ba], a
    ld a, l
    ldh [$b7], a
    ld a, h
    ldh [$b6], a
    ret


Call_000_0fb3:
    ld a, b
    xor $ff
    ld b, a
    ld a, c
    xor $ff
    ld c, a
    inc bc
    ret


Call_000_0fbd:
jr_000_0fbd:
    ld b, $00
    ldh a, [$be]
    dec a
    sla a
    ld c, a
    ld hl, UnknownData11ee
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    push bc
    call Call_000_0505
    and $07
    ld b, $00
    ld c, a
    ld hl, $100b
    add hl, bc
    ld a, [hl]
    pop bc
    sla a
    sla a
    ld h, $00
    ld l, a
    add hl, bc
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ldh a, [$b8]
    and $80
    jr z, jr_000_0ff1

    call Call_000_0fb3

jr_000_0ff1:
    ld a, b
    ldh [$b8], a
    ld a, c
    ldh [$b9], a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ldh a, [$ba]
    and $80
    jr z, jr_000_1004

    call Call_000_0fb3

jr_000_1004:
    ld a, b
    ldh [$ba], a
    ld a, c
    ldh [$bb], a
    ret


    ld b, $08
    ld a, [bc]
    ld b, $08
    ld a, [bc]
    ld [$0a0a], sp
    inc c
    ld c, $0a

Call_000_1017:
    inc c
    ld c, $0a
    inc c

Call_000_101b:
    xor a
    ldh [$b5], a
    ldh [$b7], a
    ld a, $03
    ldh [$be], a
    ldh a, [$aa]
    cp $00
    jr nz, jr_000_1036

    ldh a, [$c8]
    cp $00
    jr nz, jr_000_103a

    ldh a, [$c9]
    cp $28
    jr nc, jr_000_103a

jr_000_1036:
    ld a, $07
    ldh [$be], a

jr_000_103a:
    ld a, $18
    ld b, a
    ldh a, [$c2]
    srl a
    ld c, a
    ldh a, [$c0]
    add c
    cp $48
    jr c, jr_000_104c

    ld a, $e8
    ld b, a

jr_000_104c:
    ldh a, [$c0]
    add b
    add c
    ldh [$b6], a
    ldh [$bd], a
    ld a, $8c
    sub $18
    ldh [$b4], a
    ldh [$bc], a
    ld a, b
    push af
    ld b, $00
    ld c, $00
    ld hl, UnknownData11ee
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    ld a, $09
    sla a
    sla a
    ld h, $00
    ld l, a
    add hl, bc
    ld a, [hl+]
    ldh [$b8], a
    ld a, [hl+]
    ldh [$b9], a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    pop af
    cp $80
    jr nc, jr_000_1086

    call Call_000_0fb3

jr_000_1086:
    ld a, b
    ldh [$ba], a
    ld a, c
    ldh [$bb], a
    ret


Call_000_108d:
    ld hl, $c80c
    ldh a, [$b4]
    ld [hl+], a
    ldh a, [$b6]
    ld [hl+], a
    ld a, $05
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ret


Call_000_109d:
    call Call_000_10a4
    call Call_000_118f
    ret


Call_000_10a4:
    ldh a, [$91]
    cp $f1
    jr c, jr_000_10df

    ld b, $05
    ldh a, [$8c]
    rrca
    jr nc, jr_000_10b8

    ld b, $01
    rrca
    jr nc, jr_000_10b8

    ld b, $03

jr_000_10b8:
    ldh a, [$8c]
    xor $ff
    and $30
    ret z

    and $20
    jr z, jr_000_10ce

    ldh a, [$c0]
    sub b
    cp $0f
    jr nc, jr_000_10dc

    ld a, $0f
    jr jr_000_10dc

jr_000_10ce:
    ldh a, [$c2]
    ld c, a
    ld a, $7f
    sub c
    ld c, a
    ldh a, [$c0]
    add b
    cp c
    jr c, jr_000_10dc

    ld a, c

jr_000_10dc:
    ldh [$c0], a
    ret


jr_000_10df:
    ldh a, [$c2]
    ld b, a
    ld a, $7f
    sub b
    ld b, a
    ldh a, [$91]
    sub $30
    jr c, jr_000_10f0

Call_000_10ec:
jr_000_10ec:
    cp $0f
    jr nc, jr_000_10f4

jr_000_10f0:
    ld a, $0f
    jr jr_000_10f8

jr_000_10f4:
    cp b
    jr c, jr_000_10f8

    ld a, b

jr_000_10f8:
    ldh [$c0], a
    ret


Call_000_10fb:
    xor a
    ldh [$c1], a
    ld a, $18
    ldh [$c2], a
    ldh a, [$c0]
    sub $04
    ldh [$c0], a
    ldh a, [$c2]
    ld b, a
    ld a, $80
    sub b
    ld b, a
    ldh a, [$c0]
    jr jr_000_10ec

Call_000_1113:
    push af
    ld b, $00
    ldh a, [$be]
    dec a
    sla a
    ld c, a
    ld hl, UnknownData11ee
    add hl, bc
    ld a, [hl+]
    ld c, a
    ld a, [hl]
    ld b, a
    pop af
    push af
    ld d, $00
    ld e, a
    ld hl, UnknownData1b41
    ldh a, [$c1]
    cp $00
    jr z, jr_000_1135

    ld hl, UnknownData1b51

jr_000_1135:
    add hl, de
    ld a, [hl]
    sla a
    sla a
    ld h, $00
    ld l, a
    add hl, bc
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    call Call_000_0fb3
    ld a, b
    ldh [$b8], a
    ld a, c
    ldh [$b9], a
    ld a, [hl+]
    ld b, a
    ld a, [hl+]
    ld c, a
    ld d, $08
    ldh a, [$c1]
    cp $00
    jr z, jr_000_115a

    ld d, $06

jr_000_115a:
    pop af
    cp d
    jr nc, jr_000_1161

    call Call_000_0fb3

jr_000_1161:
    ld a, b
    ldh [$ba], a
    ld a, c
    ldh [$bb], a
    call Call_000_116d
    jp jr_001_63ba


Call_000_116d:
    ldh a, [$c4]
    dec a
    ldh [$c4], a
    jr nz, jr_000_118c

    call Call_000_0bc7

Call_000_1177:
    ldh a, [$c5]
    cp $0a
    jr c, jr_000_1181

    ld a, $01
    jr jr_000_118c

jr_000_1181:
    ld c, a
    ld b, $00
    inc a
    ldh [$c5], a
    ld hl, UnknownData1b7d
    add hl, bc
    ld a, [hl]

jr_000_118c:
    ldh [$c4], a
    ret


Call_000_118f:
    ld hl, $c800
    ldh a, [$c1]
    cp $00
    jr nz, jr_000_11c3

    ldh a, [$bf]
    ld [hl+], a
    ldh a, [$c0]
    add $01
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ldh a, [$bf]
    ld [hl+], a
    ldh a, [$c0]
    add $09
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ldh a, [$bf]
    ld [hl+], a
    ldh a, [$c0]
    add $11
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $20
    ld [hl+], a
    ret


jr_000_11c3:
    ldh a, [$bf]
    ld [hl+], a
    ldh a, [$c0]
    add $01
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ldh a, [$bf]
    ld [hl+], a
    ldh a, [$c0]
    add $09
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $20
    ld [hl+], a
    ldh a, [$bf]
    ld [hl+], a
    ldh a, [$c0]
    add $05
    ld [hl+], a
    ld a, $01
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ret
;11ee
;unknown data
UnknownData11ee::
db $20, $12, $6c, $12, $b8, $12, $04, $13, $50, $13, $9c, $13, $e8, $13, $34, $14
db $80, $14, $cc, $14, $18, $15, $64, $15, $b0, $15, $fc, $15, $48, $16, $94, $16
db $e0, $16, $2c, $17, $78, $17, $c4, $17, $10, $18, $5c, $18, $a8, $18, $f4, $18
db $40, $19, $00, $00, $01, $00, $00, $16, $00, $ff, $00, $2c, $00, $fc, $00, $42
db $00, $f7, $00, $58, $00, $f1, $00, $6c, $00, $e8, $00, $80, $00, $de, $00, $93
db $00, $d2, $00, $a5, $00, $c4, $00, $b5, $00, $b5, $00, $c4, $00, $a5, $00, $d2
db $00, $93, $00, $de, $00, $80, $00, $e8, $00, $6c, $00, $f1, $00, $58, $00, $f7
db $00, $42, $00, $fc, $00, $2c, $00, $ff, $00, $16, $01, $00, $00, $00, $00, $00
db $01, $20, $00, $19, $01, $1f, $00, $32, $01, $1c, $00, $4b, $01, $16, $00, $63
db $01, $0f, $00, $7a, $01, $05, $00, $90, $00, $f9, $00, $a5, $00, $ec, $00, $b9
db $00, $dd, $00, $cc, $00, $cc, $00, $dd, $00, $b9, $00, $ec, $00, $a5, $00, $f9
db $00, $90, $01, $05, $00, $7a, $01, $0f, $00, $63, $01, $16, $00, $4b, $01, $1c
db $00, $32, $01, $1f, $00, $19, $01, $20, $00, $00, $00, $00, $01, $40, $00, $1c
db $01, $3f, $00, $38, $01, $3b, $00, $53, $01, $35, $00, $6d, $01, $2d, $00, $87
db $01, $22, $00, $a0, $01, $15, $00, $b8, $01, $06, $00, $ce, $00, $f5, $00, $e2
db $00, $e2, $00, $f5, $00, $ce, $01, $06, $00, $b8, $01, $15, $00, $a0, $01, $22
db $00, $87, $01, $2d, $00, $6d, $01, $35, $00, $53, $01, $3b, $00, $38, $01, $3f
db $00, $1c, $01, $40, $00, $00, $00, $00, $01, $60, $00, $1f, $01, $5f, $00, $3d
db $01, $5b, $00, $5b, $01, $54, $00, $78, $01, $4b, $00, $95, $01, $3f, $00, $b0
db $01, $31, $00, $ca, $01, $20, $00, $e2, $01, $0e, $00, $f9, $00, $f9, $01, $0e
db $00, $e2, $01, $20, $00, $ca, $01, $31, $00, $b0, $01, $3f, $00, $95, $01, $4b
db $00, $78, $01, $54, $00, $5b, $01, $5b, $00, $3d, $01, $5f, $00, $1f, $01, $60
db $00, $00, $00, $00, $01, $80, $00, $21, $01, $7f, $00, $43, $01, $7a, $00, $63
db $01, $73, $00, $83, $01, $69, $00, $a2, $01, $5c, $00, $c0, $01, $4d, $00, $dc
db $01, $3b, $00, $f7, $01, $26, $01, $10, $01, $10, $01, $26, $00, $f7, $01, $3b
db $00, $dc, $01, $4d, $00, $c0, $01, $5c, $00, $a2, $01, $69, $00, $83, $01, $73
db $00, $63, $01, $7a, $00, $43, $01, $7f, $00, $21, $01, $80, $00, $00, $00, $00
db $01, $a0, $00, $24, $01, $9e, $00, $48, $01, $9a, $00, $6c, $01, $92, $00, $8e
db $01, $87, $00, $b0, $01, $79, $00, $d0, $01, $68, $00, $ef, $01, $55, $01, $0b
db $01, $3f, $01, $26, $01, $26, $01, $3f, $01, $0b, $01, $55, $00, $ef, $01, $68
db $00, $d0, $01, $79, $00, $b0, $01, $87, $00, $8e, $01, $92, $00, $6c, $01, $9a
db $00, $48, $01, $9e, $00, $24, $01, $a0, $00, $00, $00, $00, $01, $c0, $00, $27
db $01, $be, $00, $4e, $01, $b9, $00, $74, $01, $b1, $00, $99, $01, $a5, $00, $bd
db $01, $96, $00, $e0, $01, $84, $01, $01, $01, $6f, $01, $20, $01, $57, $01, $3d
db $01, $3d, $01, $57, $01, $20, $01, $6f, $01, $01, $01, $84, $00, $e0, $01, $96
db $00, $bd, $01, $a5, $00, $99, $01, $b1, $00, $74, $01, $b9, $00, $4e, $01, $be
db $00, $27, $01, $c0, $00, $00, $00, $00, $01, $e0, $00, $2a, $01, $de, $00, $53
db $01, $d9, $00, $7c, $01, $d0, $00, $a4, $01, $c3, $00, $cb, $01, $b3, $00, $f0
db $01, $a0, $01, $13, $01, $89, $01, $35, $01, $70, $01, $53, $01, $53, $01, $70
db $01, $35, $01, $89, $01, $13, $01, $a0, $00, $f0, $01, $b3, $00, $cb, $01, $c3
db $00, $a4, $01, $d0, $00, $7c, $01, $d9, $00, $53, $01, $de, $00, $2a, $01, $e0
db $00, $00, $00, $00, $02, $00, $00, $2d, $01, $fe, $00, $59, $01, $f8, $00, $85
db $01, $ef, $00, $af, $01, $e1, $00, $d8, $01, $d0, $01, $00, $01, $bb, $01, $26
db $01, $a3, $01, $49, $01, $88, $01, $6a, $01, $6a, $01, $88, $01, $49, $01, $a3
db $01, $26, $01, $bb, $01, $00, $01, $d0, $00, $d8, $01, $e1, $00, $af, $01, $ef
db $00, $85, $01, $f8, $00, $59, $01, $fe, $00, $2d, $02, $00, $00, $00, $00, $00
db $02, $20, $00, $2f, $02, $1e, $00, $5e, $02, $18, $00, $8d, $02, $0d, $00, $ba
db $01, $ff, $00, $e6, $01, $ed, $01, $10, $01, $d7, $01, $38, $01, $be, $01, $5e
db $01, $a1, $01, $81, $01, $81, $01, $a1, $01, $5e, $01, $be, $01, $38, $01, $d7
db $01, $10, $01, $ed, $00, $e6, $01, $ff, $00, $ba, $02, $0d, $00, $8d, $02, $18
db $00, $5e, $02, $1e, $00, $2f, $02, $20, $00, $00, $00, $00, $02, $40, $00, $32
db $02, $3e, $00, $64, $02, $37, $00, $95, $02, $2c, $00, $c5, $02, $1d, $00, $f3
db $02, $0a, $01, $20, $01, $f3, $01, $4a, $01, $d8, $01, $72, $01, $b9, $01, $97
db $01, $97, $01, $b9, $01, $72, $01, $d8, $01, $4a, $01, $f3, $01, $20, $02, $0a
db $00, $f3, $02, $1d, $00, $c5, $02, $2c, $00, $95, $02, $37, $00, $64, $02, $3e
db $00, $32, $02, $40, $00, $00, $00, $00, $02, $60, $00, $35, $02, $5e, $00, $6a
db $02, $57, $00, $9d, $02, $4b, $00, $d0, $02, $3b, $01, $01, $02, $27, $01, $30
db $02, $0f, $01, $5d, $01, $f2, $01, $87, $01, $d2, $01, $ae, $01, $ae, $01, $d2
db $01, $87, $01, $f2, $01, $5d, $02, $0f, $01, $30, $02, $27, $01, $01, $02, $3b
db $00, $d0, $02, $4b, $00, $9d, $02, $57, $00, $6a, $02, $5e, $00, $35, $02, $60
db $00, $00, $00, $00, $02, $80, $00, $38, $02, $7e, $00, $6f, $02, $76, $00, $a6
db $02, $6a, $00, $db, $02, $59, $01, $0e, $02, $44, $01, $40, $02, $2a, $01, $6f
db $02, $0c, $01, $9b, $01, $ea, $01, $c5, $01, $c5, $01, $ea, $01, $9b, $02, $0c
db $01, $6f, $02, $2a, $01, $40, $02, $44, $01, $0e, $02, $59, $00, $db, $02, $6a
db $00, $a6, $02, $76, $00, $6f, $02, $7e, $00, $38, $02, $80, $00, $00, $00, $00
db $02, $a0, $00, $3b, $02, $9d, $00, $75, $02, $96, $00, $ae, $02, $89, $00, $e6
db $02, $77, $01, $1c, $02, $61, $01, $50, $02, $46, $01, $81, $02, $26, $01, $b0
db $02, $03, $01, $db, $01, $db, $02, $03, $01, $b0, $02, $26, $01, $81, $02, $46
db $01, $50, $02, $61, $01, $1c, $02, $77, $00, $e6, $02, $89, $00, $ae, $02, $96
db $00, $75, $02, $9d, $00, $3b, $02, $a0, $00, $00, $00, $00, $02, $c0, $00, $3d
db $02, $bd, $00, $7a, $02, $b5, $00, $b6, $02, $a8, $00, $f1, $02, $96, $01, $2a
db $02, $7e, $01, $60, $02, $62, $01, $94, $02, $41, $01, $c5, $02, $1b, $01, $f2
db $01, $f2, $02, $1b, $01, $c5, $02, $41, $01, $94, $02, $62, $01, $60, $02, $7e
db $01, $2a, $02, $96, $00, $f1, $02, $a8, $00, $b6, $02, $b5, $00, $7a, $02, $bd
db $00, $3d, $02, $c0, $00, $00, $00, $00, $02, $e0, $00, $40, $02, $dd, $00, $80
db $02, $d5, $00, $be, $02, $c7, $00, $fc, $02, $b4, $01, $37, $02, $9b, $01, $70
db $02, $7d, $01, $a6, $02, $5b, $01, $d9, $02, $34, $02, $08, $02, $08, $02, $34
db $01, $d9, $02, $5b, $01, $a6, $02, $7d, $01, $70, $02, $9b, $01, $37, $02, $b4
db $00, $fc, $02, $c7, $00, $be, $02, $d5, $00, $80, $02, $dd, $00, $40, $02, $e0
db $00, $00, $00, $00, $03, $00, $00, $43, $02, $fd, $00, $85, $02, $f4, $00, $c7
db $02, $e6, $01, $07, $02, $d2, $01, $45, $02, $b8, $01, $80, $02, $99, $01, $b9
db $02, $75, $01, $ee, $02, $4c, $02, $1f, $02, $1f, $02, $4c, $01, $ee, $02, $75
db $01, $b9, $02, $99, $01, $80, $02, $b8, $01, $45, $02, $d2, $01, $07, $02, $e6
db $00, $c7, $02, $f4, $00, $85, $02, $fd, $00, $43, $03, $00, $00, $00, $00, $00
db $03, $20, $00, $46, $03, $1d, $00, $8b, $03, $14, $00, $cf, $03, $05, $01, $12
db $02, $f0, $01, $52, $02, $d5, $01, $90, $02, $b5, $01, $cb, $02, $8f, $02, $02
db $02, $65, $02, $36, $02, $36, $02, $65, $02, $02, $02, $8f, $01, $cb, $02, $b5
db $01, $90, $02, $d5, $01, $52, $02, $f0, $01, $12, $03, $05, $00, $cf, $03, $14
db $00, $8b, $03, $1d, $00, $46, $03, $20, $00, $00, $00, $00, $03, $40, $00, $49
db $03, $3d, $00, $90, $03, $33, $00, $d7, $03, $24, $01, $1d, $03, $0e, $01, $60
db $02, $f2, $01, $a0, $02, $d1, $01, $dd, $02, $aa, $02, $17, $02, $7d, $02, $4c
db $02, $4c, $02, $7d, $02, $17, $02, $aa, $01, $dd, $02, $d1, $01, $a0, $02, $f2
db $01, $60, $03, $0e, $01, $1d, $03, $24, $00, $d7, $03, $33, $00, $90, $03, $3d
db $00, $49, $03, $40, $00, $00, $00, $00, $03, $60, $00, $4b, $03, $5d, $00, $96
db $03, $53, $00, $e0, $03, $43, $01, $28, $03, $2c, $01, $6d, $03, $0f, $01, $b0
db $02, $ec, $01, $f0, $02, $c4, $02, $2b, $02, $96, $02, $63, $02, $63, $02, $96
db $02, $2b, $02, $c4, $01, $f0, $02, $ec, $01, $b0, $03, $0f, $01, $6d, $03, $2c
db $01, $28, $03, $43, $00, $e0, $03, $53, $00, $96, $03, $5d, $00, $4b, $03, $60
db $00, $00, $00, $00, $03, $80, $00, $4e, $03, $7d, $00, $9c, $03, $72, $00, $e8
db $03, $61, $01, $32, $03, $4a, $01, $7b, $03, $2c, $01, $c0, $03, $08, $02, $02
db $02, $de, $02, $40, $02, $ae, $02, $7a, $02, $7a, $02, $ae, $02, $40, $02, $de
db $02, $02, $03, $08, $01, $c0, $03, $2c, $01, $7b, $03, $4a, $01, $32, $03, $61
db $00, $e8, $03, $72, $00, $9c, $03, $7d, $00, $4e, $03, $80, $00, $00, $00, $00
db $03, $a0, $00, $51, $03, $9c, $00, $a1, $03, $92, $00, $f0, $03, $80, $01, $3d
db $03, $68, $01, $88, $03, $49, $01, $d0, $03, $24, $02, $14, $02, $f8, $02, $55
db $02, $c7, $02, $90, $02, $90, $02, $c7, $02, $55, $02, $f8, $02, $14, $03, $24
db $01, $d0, $03, $49, $01, $88, $03, $68, $01, $3d, $03, $80, $00, $f0, $03, $92
db $00, $a1, $03, $9c, $00, $51, $03, $a0, $00, $00, $00, $00, $03, $c0, $00, $54
db $03, $bc, $00, $a7, $03, $b1, $00, $f8, $03, $9f, $01, $48, $03, $86, $01, $96
db $03, $66, $01, $e0, $03, $3f, $02, $27, $03, $12, $02, $69, $02, $df, $02, $a7
db $02, $a7, $02, $df, $02, $69, $03, $12, $02, $27, $03, $3f, $01, $e0, $03, $66
db $01, $96, $03, $86, $01, $48, $03, $9f, $00, $f8, $03, $b1, $00, $a7, $03, $bc
db $00, $54, $03, $c0, $00, $00, $00, $00, $03, $e0, $00, $56, $03, $dc, $00, $ac
db $03, $d1, $01, $01, $03, $be, $01, $53, $03, $a4, $01, $a3, $03, $83, $01, $f0
db $03, $5b, $02, $39, $03, $2d, $02, $7e, $02, $f8, $02, $bd, $02, $bd, $02, $f8
db $02, $7e, $03, $2d, $02, $39, $03, $5b, $01, $f0, $03, $83, $01, $a3, $03, $a4
db $01, $53, $03, $be, $01, $01, $03, $d1, $00, $ac, $03, $dc, $00, $56, $03, $e0
db $00, $00, $00, $00, $04, $00, $00, $59, $03, $fc, $00, $b2, $03, $f0, $01, $09
db $03, $dd, $01, $5e, $03, $c2, $01, $b1, $03, $a0, $02, $00, $03, $77, $02, $4b
db $03, $47, $02, $92, $03, $10, $02, $d4, $02, $d4, $03, $10, $02, $92, $03, $47
db $02, $4b, $03, $77, $02, $00, $03, $a0, $01, $b1, $03, $c2, $01, $5e, $03, $dd
db $01, $09, $03, $f0, $00, $b2, $03, $fc, $00, $59, $04, $00, $00, $00

Call_000_198c:
    ldh a, [$a2]
    and $1f
    ret nz

    ld a, [$ca48]
    dec a
    ld [$ca48], a
    push af
    call z, Call_000_19c7
    pop af
    cp $14
    call z, Func6400

Call_000_19a2:
    ld hl, $c880
    ld a, [$ca48]
    call Call_000_047c
    ld c, a
    ld a, $80
    ld [hl+], a
    ld a, $90
    ld [hl+], a
    ld a, b
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ld a, $80
    ld [hl+], a
    ld a, $98
    ld [hl+], a
    ld a, c
    add $80
    ld [hl+], a
    ld a, $00
    ld [hl+], a
    ret


Call_000_19c7:
    ld a, $07
    ldh [$a4], a
    ret


Call_000_19cc:
    call Call_000_19e2
    ld a, [hl]
    ld [$ca48], a
    call Func47e4
    call Call_000_19a2
    call Func6404
    ld a, $20
    call Call_000_0257
    ret


Call_000_19e2:
    ld a, [wCA47]
    dec a
    cp $03
    jr c, jr_000_19ec

    ld a, $03

jr_000_19ec:
    ld b, a
    ld e, $03
    call Call_000_0454
    ld hl, UnknownData1b71
    add hl, bc
    ret


Call_000_19f7:
    call Func7ff3
    ldh a, [$c8]
    ld b, a
    ldh a, [$c9]
    or b
    jr z, jr_000_1a0a

    call Func6408
    ld a, $80
    jp Jump_000_0257


jr_000_1a0a:
    call Func640c
    ld a, $ff
    call Call_000_0257
    ld a, $40
    call Call_000_0257
    jp Jump_000_1a1a


Jump_000_1a1a:
    call Call_000_1a97
    call Call_000_19e2
    inc hl
    ld b, [hl]
    inc hl
    ld c, [hl]
    push bc
    call Func4949
    ld a, $80
    call Call_000_0257
    pop bc

jr_000_1a2e:
    ld a, b
    cp $00
    jr nz, jr_000_1a3b

    ld a, c
    cp $00
    ret z

    cp $0a
    jr c, jr_000_1a6c

jr_000_1a3b:
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    dec bc
    push bc
    call Func4949
    ldh a, [$cb]
    ld h, a
    ldh a, [$ca]
    ld l, a
    ld b, $00
    ld c, $0a
    add hl, bc
    ld a, h
    ldh [$cb], a
    ld a, l
    ldh [$ca], a
    call Call_000_0c5b
    call Call_000_0c71
    call Func481e
    call Func63ca
    call Call_000_0221
    pop bc
    jr jr_000_1a2e

jr_000_1a6c:
    dec bc
    push bc
    call Func4949
    ldh a, [$cb]
    ld h, a
    ldh a, [$ca]
    ld l, a
    ld b, $00
    ld c, $01
    add hl, bc
    ld a, h
    ldh [$cb], a
    ld a, l
    ldh [$ca], a
    call Call_000_0c5b
    call Call_000_0c71
    call Func481e
    call Func63ca
    call Call_000_0221
    pop bc
    ld a, b
    or c
    jr nz, jr_000_1a6c

    ret


Call_000_1a97:
    call Call_000_023d
    ld hl, $1aaf
    ld de, $c901
    ld b, $17

jr_000_1aa2:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_1aa2

    ld a, $01
    ldh [$a3], a
    jp Call_000_0221


    sbc e
    ld b, d
    inc c
    call nz, $c6c5
    rst $00
    adc d
    ret z

db $FF
;1ab9
db "BONUS"
db $9B,$69,$04
;1ac1
db "PTS"
db $B7,$00

Call_000_1ac6:
    call Call_000_023d
    ld hl, UnknownData1ade
    ld de, $c901
    ld b, $17
.loop
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, .loop
    ld a, $01
    ldh [$a3], a
    jp Call_000_0221

;1ade
UnknownData1ade::
db $9B,$42,$0C,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$9B
db $69,$04,$FF,$FF,$FF,$FF,$00

Call_000_1af5:
    call Call_000_023d
    ld hl, UnknownData1b0d
    ld de, $c901
    ld b, $0e

jr_000_1b00:
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, jr_000_1b00
    ld a, $01
    ldh [$ffa3], a
    jp Call_000_0221

UnknownData1b0d
db $99,$C3,$0A,$9D,$9B,$A2,$FF,$8A,$90,$8A,$92,$97,$1F,$00

Call_000_1b1b:
    call Call_000_023d
    ld hl, UnknownData1b33
    ld de, $c901
    ld b, $0e
.loop
    ld a, [hl+]
    ld [de], a
    inc de
    dec b
    jr nz, .loop
    ld a, $01
    ldh [$ffa3], a
    jp Call_000_0221
;1b33
INCLUDE "data/data1b33.asm"
;1be1
INCLUDE "data/stageData.asm"
;ds $1bc
