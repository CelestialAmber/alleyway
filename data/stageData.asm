;the first value somehow describes all properties of a stage
;80: bonus stage
;40: normal horizontal scroll
;00: no movement
;some levels have different widths
;format: stage properties value, stage data
StageDataTable::
    dbw $00, StageData1
    dbw $40, StageData1
    dbw $00, StageData2
    dbw $80, StageDataMario
    dbw $02, StageData3
    dbw $41, StageData3
    dbw $00, StageData4
    dbw $80, StageDataKoopa
    dbw $00, StageData5
    dbw $42, StageData5
    dbw $00, StageData6
    dbw $80, StageDataBlooper
    dbw $00, StageData7
    dbw $43, StageData7
    dbw $00, StageData8
    dbw $80, StageDataPiranhaPlant
    dbw $00, StageData9
    dbw $44, StageData9
    dbw $00, StageData10
    dbw $80, StageDataBulletBill
    dbw $00, StageData11
    dbw $45, StageData11
    dbw $00, StageData12
    dbw $80, StageDataGoomba
    dbw $00, StageData13
    dbw $46, StageData13
    dbw $00, StageData14
    dbw $80, StageDataCheepCheep
    dbw $00, StageData15
    dbw $47, StageData15
    dbw $00, StageData16
    dbw $80, StageDataBowser
    dbw $00, StageData1


;the main stages tile data are reused for clone levels(such as when a level has a later scrolling version)
;stage data format:
;most stage tilemaps have a width of 28 or 14
;tile indices format(index: block image tile index):
;0:nothing
;1:light grey full
;2:grey full block
;3:dark grey full block 
;4:unbreakable block

;offset 1c44
StageData1::
INCBIN "data/stages/stage1.bin"
StageData3::
INCBIN "data/stages/stage3.bin"
StageData5::
INCBIN "data/stages/stage5.bin"
StageData7::
INCBIN "data/stages/stage7.bin"
StageData9::
INCBIN "data/stages/stage9.bin"
StageData11::
INCBIN "data/stages/stage11.bin"
StageData13::
INCBIN "data/stages/stage13.bin"
StageData15::
INCBIN "data/stages/stage15.bin"
StageData2::
INCBIN "data/stages/stage2.bin"
StageData4::
INCBIN "data/stages/stage4.bin"
StageData6::
INCBIN "data/stages/stage6.bin"
StageData8::
INCBIN "data/stages/stage8.bin"
StageData10::
INCBIN "data/stages/stage10.bin"
StageData12::
INCBIN "data/stages/stage12.bin"
StageData14::
INCBIN "data/stages/stage14.bin"
StageData16::
INCBIN "data/stages/stage16.bin"
StageDataMario::
INCBIN "data/stages/stageBonusMario.bin"
StageDataKoopa::
INCBIN "data/stages/stageBonusKoopa.bin"
StageDataBlooper::
INCBIN "data/stages/stageBonusBlooper.bin"
StageDataPiranhaPlant::
INCBIN "data/stages/stageBonusPiranhaPlant.bin"
StageDataBulletBill::
INCBIN "data/stages/stageBonusBulletBill.bin"
StageDataGoomba::
INCBIN "data/stages/stageBonusGoomba.bin"
StageDataCheepCheep::
INCBIN "data/stages/stageBonusCheepCheep.bin"
StageDataBowser::
INCBIN "data/stages/stageBonusBowser.bin"
