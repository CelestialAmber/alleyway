hOAMDMAFunction equ $FF80
;same as hJoyInput but the bits are flipped
hJoyInput1 equ $FF8C
;used for temporarily storing the pressed button
hPressedButtonTemp equ $FF8D
;bit 0:a,1:b,2:select,3:start,4:right,5:left,6:up,7:down
hJoyInput equ $FF8E
hLCDC equ $FF9C
hTimer0 equ $FFA1
hTimer1 equ $FFA2
hGameStateIndex equ $FFA4
hCurrentStageIsBonus equ $FFAA
hBallYPos equ $FFB4
hBallXPos equ $FFB6
hBallYPos1 equ $FFBC
hBallXPos1 equ $FFBD
;paddle x position
hPaddleXPos equ $FFC0
hHitBlock equ $FFC7
hBlocksLeft equ $FFC9
hScoreLowByte equ $FFCA
hScoreHighByte equ $FFCB
hHighScoreLowByte equ $FFCC
hHighScoreHighByte equ $FFCD