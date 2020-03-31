SECTION "WRAM 0", WRAM0[$C000]

;actual tilemap for the blocks used for the tile graphics
wBlockTilemap::
ds $400
;used for keeping track of where blocks still exist at
wBlockCollisionTilemap::
ds $400
;c800
;oam data(sprite data for x/y position, and other attributes)
wOAMData::
ds $a0

ds $160

;stage blocks scroll values for each row
;ca00
wStageBlocksScrollValues::
ds 20
;scroll speeds for each block row
;ca14
wStageBlocksScrollSpeeds::
ds 20
;ca28

ds $16

;ca3e
wMarioXPos::
ds 1
;ca3f
wMarioYPos::
ds 1

ds 4

;ca44
wLives::
ds 1
;ca45
wCurrentStage::
ds 1
;ca46
wDisplayedStage::
ds 1
;ca47
wCA47::
ds 1
;ca48
wBonusTimer::
ds 1
;ca49
wDemoTimer::
ds 1
;this doesn't seem to be used
wCA4A::
ds 1
;set to 4 if returning to title screen
wReturningToTitle::
ds 1

SECTION "WRAM Bank 1", WRAMX

ds $fd8

;dfd8
wInDemoMode::
ds 1

