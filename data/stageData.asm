;the first value somehow describes all properties of a stage
;40: normal horizontal scroll
;00: no movement
;some levels have different widths
;format: stage propetries value, stage data
StageDataTable::
    dbw $00, StageData1
    dbw $40, StageData1
    dbw $00, StageData9
    dbw $80, StageDataMario
    dbw $02, StageData2
    dbw $41, StageData2
    dbw $00, StageData10
    dbw $80, StageDataKoopa
    dbw $00, StageData3
    dbw $42, StageData3
    dbw $00, StageData11
    dbw $80, StageDataBlooper
    dbw $00, StageData4
    dbw $43, StageData4
    dbw $00, StageData12
    dbw $80, StageDataPiranhaPlant
    dbw $00, StageData5
    dbw $44, StageData5
    dbw $00, StageData13
    dbw $80, StageDataBulletBill
    dbw $00, StageData6
    dbw $45, StageData6
    dbw $00, StageData14
    dbw $80, StageDataGoomba
    dbw $00, StageData7
    dbw $46, StageData7
    dbw $00, StageData15
    dbw $80, StageDataCheepCheep
    dbw $00, StageData8
    dbw $47, StageData8
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
INCBIN "data/stages/stageData1.bin"
StageData2::
INCBIN "data/stages/stageData2.bin"
StageData3::
INCBIN "data/stages/stageData3.bin"
StageData4::
INCBIN "data/stages/stageData4.bin"
StageData5::
INCBIN "data/stages/stageData5.bin"
StageData6::
INCBIN "data/stages/stageData6.bin"
StageData7::
INCBIN "data/stages/stageData7.bin"
StageData8::
INCBIN "data/stages/stageData8.bin"
StageData9::
INCBIN "data/stages/stageData9.bin"
StageData10::
INCBIN "data/stages/stageData10.bin"
StageData11::
INCBIN "data/stages/stageData11.bin"
StageData12::
INCBIN "data/stages/stageData12.bin"
StageData13::
INCBIN "data/stages/stageData13.bin"
StageData14::
INCBIN "data/stages/stageData14.bin"
StageData15::
INCBIN "data/stages/stageData15.bin"
StageData16::
INCBIN "data/stages/stageData16.bin"
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
