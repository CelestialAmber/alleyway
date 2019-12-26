SECTION "Home", ROM0[$0]
;only rst_00 is used/referenced
RST_00::
    jp Start
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

REPT 56
    db $FF
ENDR
SECTION "Header Functions", ROM0[$40]
VBlankInterrupt::
    jp MainLoop
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

LCDCInterrupt::
    jp Jump_000_0260
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

TimerOverflowInterrupt::
    jp Jump_000_0453
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

SerialTransferCompleteInterrupt::
    jp Jump_000_0272
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

JoypadTransitionInterrupt::
    reti

REPT 159
    db $FF
ENDR

SECTION "Entry", ROM0[$100]

Entry::
    nop
    jp Start