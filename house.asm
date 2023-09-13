.ORIG	x3000
AND R0, R0, #0
AND R1, R1, #0
AND R2, R2, #0
AND R3, R3, #0
AND R4, R4, #0
ADD R5, R5, #0;reseting regs
ADD R6, R6, #0
TRAP 0x36; printing regs
TRAP 0x31; getting player coords
ADD R0, R0, #3; setting up in front of player
ADD R2, R2  , #3;to avoid it being in the same spot as player when built
LD R5, COUNTER; setting up counter to stop building direction
LD R3, BLOCK;TOWER

NEXT LD R4, COUNTER; setting up counter to stop tower building
LOOP ADD R1,R1,#1; tower up
TRAP 0x34; place
TRAP 0x36; reg chk
ADD R4, R4, #-1; counter down tower
BRp LOOP; if not zero, more tower to build

ADD R0, R0, #1;left increment ;MOVE Direction
ADD R1, R1, #-10;reset tower height
ADD R5, R5, #-1; counter down direction
BRp NEXT;if not zero, more to build in that direction

ADD R2, R2, #1
LD R5, COUNTER
NEXT2 LD R4, COUNTER; setting up counter to stop tower building
LOOP2 ADD R1,R1,#1; tower up
TRAP 0x34; place
TRAP 0x36; reg chk
ADD R4, R4, #-1; counter down tower
BRp LOOP2; if not zero, more tower to build

ADD R2, R2, #1;left increment ;MOVE Direction
ADD R1, R1, #-10;reset tower height
ADD R5, R5, #-1; counter down direction
BRp NEXT2;if not zero, more to build in that direction


ADD R0, R0, #-1
LD R5, COUNTER
NEXT3 LD R4, COUNTER; setting up counter to stop tower building
LOOP3 ADD R1,R1,#1; tower up
TRAP 0x34; place
TRAP 0x36; reg chk
ADD R4, R4, #-1; counter down tower
BRp LOOP3; if not zero, more tower to build

ADD R0, R0, #-1;left increment ;MOVE Direction
ADD R1, R1, #-10;reset tower height
ADD R5, R5, #-1; counter down direction
BRp NEXT3;if not zero, more to build in that direction

ADD R2, R2, #-1
LD R5, COUNTER
NEXT4 LD R4, COUNTER; setting up counter to stop tower building
LOOP4 ADD R1,R1,#1; tower up
TRAP 0x34; place
TRAP 0x36; reg chk
ADD R4, R4, #-1; counter down tower
BRp LOOP4; if not zero, more tower to build

ADD R2, R2, #-1;left increment ;MOVE Direction
ADD R1, R1, #-10;reset tower height
ADD R5, R5, #-1; counter down direction
BRp NEXT4;if not zero, more to build in that direction

    HALT
    COUNTER .FILL #10
    BLOCK .FILL #1
.END