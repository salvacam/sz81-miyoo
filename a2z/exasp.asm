#EXASP
 ORG :6600
HIRES=:23AF
GINITX=:25E9
CLEAR=:2D09
PLOT=:2443
LINE=:2495
INVERT=:2391
KEYRTN=:7FD9
STMEND=:400F
KEYINT=:0275
GOBACK=:291B
GSTRNG=:29ED
START  LD A,207
 OUT (3),A
 CALL HIRES
 CALL GINITX
 LD (IY+9),9
 LD SP,:65FF
 CALL CLEAR
 LD BC,:6464
 CALL PLOT
 LD BC,:0000
 LD DE,:BFFF
 CALL LINE
 LD BC,:BF00
 LD DE,:00FF
 CALL LINE
 CALL INVERT
 LD HL,KPROC
 LD (KEYRTN),HL
 JR $
KPROC LD BC,(STMEND)
 CALL KEYINT
 CP 44
 JP Z,RTS
 EX DE,HL
 LD BC,1
 CALL GSTRNG
 POP AF
 POP HL
 RET
RTS LD A,208
 OUT (3),A
 JP GOBACK
#
A#EXASP
H:6600
