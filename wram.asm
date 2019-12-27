SECTION "WRAM 0", WRAM0[$C000]

ds $a44
;ca44
wLives::
ds 1
wCA45::
ds 1
;ca46
wCurrentStage::
ds 1
;ca47
wCA47::
ds 1
;data from ca00 to ca13 seems to be related to stage blocks scroll value

;c800: oam/position data
;c800-c80b: paddle oam data(3 separate parts)
