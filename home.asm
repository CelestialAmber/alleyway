SECTION "Home", ROM0[$0]
;only rst_00 is used/referenced
RST_00::
    jp Start

REPT 61
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
    jp _LCDCInterrupt
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

TimerOverflowInterrupt::
    jp _TimerOverflowInterrupt
    rst $38
    rst $38
    rst $38
    rst $38
    rst $38

SerialTransferCompleteInterrupt::
    jp _SerialTransferCompleteInterrupt
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