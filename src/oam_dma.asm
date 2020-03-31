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
