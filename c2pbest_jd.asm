
; fixed version 'BEST_c2p' by Cosmos Amiga in 2019


; mc68030		; c'est pas du 68000 !


	output ram:c2pbest_jd


	SECTION	c2p_test_new6000000,CODE

ProgStart
	MOVEM.L	D0/A0,-(SP)
	MOVE.L	#lbL00029C,(lbL000434)
	MOVEA.L	(4),A6
	LEA	(doslibrary.MSG,PC),A1
	MOVEQ	#0,D0
	JSR	(-$228,A6)
	MOVE.L	D0,(lbL00042C)
	BEQ.W	lbC00011E
	LEA	(ciaaresource.MSG,PC),A1
	JSR	(-$1F2,A6)
	MOVE.L	D0,(lbL000430)
	BEQ.W	lbC000102
	JSR	(-$78,A6)
	MOVEA.L	(lbL000430),A6
	LEA	(lbL000438),A1
	MOVEQ	#0,D0
	JSR	(-6,A6)
	TST.L	D0
	BNE.W	lbC000126
	MOVEQ	#1,D0
	JSR	(-$12,A6)
	MOVEA.L	(4),A6
	JSR	(-$7E,A6)
	MOVEM.L	(SP)+,D0/A0
	JSR	(lbC000450)
	MOVE.L	D0,-(SP)
	MOVEA.L	(lbL000430),A6
	LEA	(lbL000438),A1
	MOVEQ	#0,D0
	JSR	(-12,A6)
	MOVEA.L	(lbL00042C),A6
	MOVE.L	#NameCountMidt.MSG,D1
	MOVEQ	#0,D2
	JSR	(-$3BA,A6)
	LEA	(lbL00029C),A5
lbC000098	MOVEA.L	(A5)+,A0
	MOVE.L	A0,D0
	BEQ.B	lbC0000DC
	MOVE.W	(4,A0),D0
	BLE.B	lbC0000EE
	MOVE.L	(A0),D1
	DIVU.W	D0,D1
	SWAP	D1
	CLR.W	D1
	SWAP	D1
	DIVU.W	#$2C5,D1
	MOVE.W	D1,D0
	CLR.W	D1
	SWAP	D1
	LSL.L	#8,D1
	DIVU.W	#$717,D1
	MOVE.W	D1,-(SP)
	MOVE.W	D0,-(SP)
	MOVE.W	(4,A0),-(SP)
	PEA	(6,A0)
	MOVE.L	#s5d2d02d.MSG,D1
	MOVE.L	SP,D2
	JSR	(-$3BA,A6)
	LEA	(10,SP),SP
	BRA.B	lbC000098

lbC0000DC	MOVEA.L	(lbL00042C),A1
	MOVEA.L	(4),A6
	JSR	(-$19E,A6)
	MOVE.L	(SP)+,D0
	RTS

lbC0000EE	MOVE.L	#stooslow.MSG,D1
	PEA	(6,A0)
	MOVE.L	SP,D2
	JSR	(-$3BA,A6)
	ADDQ.L	#4,SP
	BRA.B	lbC000098

lbC000102	MOVE.L	#Canatopenciaa.MSG,D1
lbC000108	MOVEQ	#0,D2
	MOVEA.L	(lbL00042C),A6
	JSR	(-$3BA,A6)
	MOVEA.L	A6,A1
	MOVEA.L	(4),A6
	JSR	(-$19E,A6)
lbC00011E	MOVEM.L	(SP)+,D0/A0
	MOVEQ	#$14,D0
	RTS

lbC000126	MOVEA.L	(4),A6
	JSR	(-$7E,A6)
	MOVE.L	#Canatallocate.MSG,D1
	BRA.B	lbC000108

	dc.l	0
	dc.l	0
	dc.w	0

lbC000140	MOVEM.L	A0/A1,-(SP)
	MOVEA.L	($10,SP),A0
	TST.W	(4,A0)
	BNE.B	lbC00015E
	BMI.B	lbC0001C0
	MOVEA.L	(lbL000434),A1
	MOVE.L	A0,(A1)+
	MOVE.L	A1,(lbL000434)
lbC00015E	ADDQ.W	#1,(4,A0)
	LEA	($BFE001),A1
	MOVE.B	#$FF,($400,A1)
	MOVE.B	#$FF,($500,A1)
	MOVE.B	#$19,($E00,A1)
	MOVEM.L	(SP)+,A0/A1
	PEA	(lbC000190,PC)
	MOVE.L	(8,SP),-(SP)
	RTS

	dc.l	0
	dc.l	0

lbC000190	MOVEM.L	D0/A0,-(SP)
	LEA	($BFE001),A0
	MOVEQ	#0,D0
	CLR.B	($E00,A0)
	MOVE.B	($500,A0),D0
	LSL.W	#8,D0
	MOVE.B	($400,A0),D0
	MOVEA.L	($10,SP),A0
	NOT.W	D0
	BNE.B	lbC0001B8
	MOVE.W	#$FFFF,(4,A0)
lbC0001B8	ADD.L	D0,(A0)
	MOVEM.L	(SP)+,D0/A0
	RTS

lbC0001C0	MOVEM.L	(SP)+,A0/A1
	RTS

doslibrary.MSG	dc.b	'dos.library',0
ciaaresource.MSG	dc.b	'ciaa.resource',0
Canatallocate.MSG	dc.b	'Can\at allocate timer 0 of ciaa.resource!',$A,0
Canatopenciaa.MSG	dc.b	'Can\at open ciaa.resource!',$A,0
NameCountMidt.MSG	dc.b	'Name        Count  Mid. time (ms)',$A
	dc.b	'--------------------------------------',$A,0
s5d2d02d.MSG	dc.b	'%10s: %5d  %2d.%02d',$A,0
stooslow.MSG	dc.b	'%10s:  <too slow>',$A,0
	dc.b	0
	dc.b	0
	dc.b	0

	SECTION	c2p_test_new600029C,BSS
lbL00029C	ds.l	$64
lbL00042C	ds.l	1
lbL000430	ds.l	1
lbL000434	ds.l	1

	SECTION	c2p_test_new6000438,DATA
lbL000438	dc.l	0
	dc.l	0
	dc.l	$2000000
	dc.l	0
	dc.l	0
	dc.l	$4E71


	SECTION	c2p_test_new6000450,CODE
lbC000450	MOVEA.L	(4),A6
	MOVEQ	#$24,D0
	LEA	(graphicslibra.MSG,PC),A1
	JSR	(-$228,A6)
	MOVE.L	D0,(lbL2152F4)
	BEQ.W	lbC00062A
	MOVEQ	#$25,D0
	LEA	(intuitionlibr.MSG,PC),A1
	JSR	(-$228,A6)
	MOVE.L	D0,(lbL2152F8)
	BEQ.W	lbC000620
	LEA	(lbL215240),A0
	MOVEQ	#8,D0
	MOVE.L	#$140,D1
	MOVE.L	#$100,D2
	MOVEA.L	(lbL2152F4),A6
	JSR	(-$186,A6)
	LEA	(lbL215240),A1
	ADDQ.W	#8,A1
	MOVEQ	#7,D7
	LEA	(lbL215300),A0
	MOVE.L	#$2800,D0
lbC0004B0	MOVE.L	A0,(A1)+
	ADDA.L	D0,A0
	DBRA	D7,lbC0004B0
	MOVEA.L	(lbL2152F8),A6
	LEA	(lbL000F00,PC),A1
	SUBA.L	A0,A0
	JSR	(-$264,A6)
	MOVE.L	D0,(lbL2152FC)
	BEQ.W	lbC000612
	LEA	(lbL001240),A0
	MOVE.L	#$FF00FF,D0
	MOVE.L	#$4FFF,D7
lbC0004E4	MOVE.L	D0,(A0)+
	DBRA	D7,lbC0004E4
	BSR.W	lbC000D20
	BSR.W	lbC000630
	MOVEA.L	(4),A6
	JSR	(-$84,A6)
	LEA	(lbL001240),A0
	LEA	(lbL215300),A1
	MOVEQ	#$41,D7
lbC000508

	MOVEM.L	D7/A0/A1,-(SP)
	BSR.B	lbC00058E
	dc.w	0
	dc.w	0
	dc.w	0
	dc.b	'BEST_c2p',0,0
lbC00058E	PEA	(BEST_c2p,PC)
	JSR	(lbC000140)
	ADDQ.L	#8,SP
	MOVEM.L	(SP)+,D7/A0/A1

	MOVEM.L	D7/A0/A1,-(SP)
	BSR.B	lbC00058E1
	dc.w	0
	dc.w	0
	dc.w	0
	dc.b	'NONE_c2p',0,0
lbC00058E1	PEA	(NONE_c2p,PC)
	JSR	(lbC000140)
	ADDQ.L	#8,SP
	MOVEM.L	(SP)+,D7/A0/A1

	MOVEM.L	D7/A0/A1,-(SP)
	BSR.B	lbC0005E6
	dc.w	0
	dc.w	0
	dc.w	0
	dc.b	'MOVEMOVE',0,0
lbC0005E6	PEA	(MOVEMOVE,PC)
	JSR	(lbC000140)
	ADDQ.L	#8,SP
	MOVEM.L	(SP)+,D7/A0/A1

	DBRA	D7,lbC000508
	MOVEA.L	(4),A6
	JSR	(-$8A,A6)
	MOVEA.L	(lbL2152F8),A6
	MOVEA.L	(lbL2152FC),A0
	JSR	(-$42,A6)
lbC000612	MOVEA.L	(4),A6
	MOVEA.L	(lbL2152F8),A1
	JSR	(-$19E,A6)
lbC000620	MOVEA.L	(lbL2152F4),A1
	JSR	(-$19E,A6)
lbC00062A	RTS

	dc.l	0

lbC000630	LEA	(lbL015240),A0
	BSR.W	lbC0011E0
	RTS

	dc.l	0


kalms_cpu5_blit0	LEA	(lbL001240),A0
	MOVEA.L	A0,A2
	ADDA.L	#$14000,A2
	LEA	(lbL215300),A1
	SUBA.L	#$24,SP
	MOVE.L	A1,(SP)
	ADDA.L	#$2800,A1
	MOVE.L	A1,(4,SP)
	ADDA.L	#$2800,A1
	MOVE.L	A1,(8,SP)
	ADDA.L	#$2800,A1
	MOVE.L	A1,(12,SP)
	ADDA.L	#$2800,A1
	MOVE.L	A1,($10,SP)
	ADDA.L	#$2800,A1
	MOVE.L	A1,($14,SP)
	ADDA.L	#$2800,A1
	MOVE.L	A1,($18,SP)
	ADDA.L	#$2800,A1
	MOVE.L	A1,($1C,SP)
	LEA	(lbL215300),A1
	MOVE.L	A0,($20,SP)
	MOVE.L	#$33333333,D5
	MOVE.L	#$55555555,D6
	MOVEA.L	#$FF00FF,A6
	MOVE.L	(A0)+,D0
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVE.L	(A0)+,D3
	MOVE.L	#$F0F0F0F,D4
	AND.L	D4,D0
	AND.L	D4,D2
	LSL.L	#4,D0
	OR.L	D2,D0
	AND.L	D4,D1
	AND.L	D4,D3
	LSL.L	#4,D1
	OR.L	D3,D1
	MOVEA.L	D1,A3
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVE.L	(A0)+,D3
	MOVE.L	(A0)+,D7
	AND.L	D4,D1
	AND.L	D4,D2
	LSL.L	#4,D2
	OR.L	D1,D2
	AND.L	D4,D3
	AND.L	D4,D7
	LSL.L	#4,D3
	OR.L	D7,D3
	MOVE.L	A3,D1
	SWAP	D2
	MOVE.W	D0,D7
	MOVE.W	D2,D0
	MOVE.W	D7,D2
	SWAP	D2
	SWAP	D3
	MOVE.W	D1,D7
	MOVE.W	D3,D1
	MOVE.W	D7,D3
	SWAP	D3
	BRA.B	lbC000792

lbC00072E	MOVE.L	(A0)+,D0
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVEA.L	(8,SP),A1
	MOVE.L	(A0)+,D3
	MOVE.L	D7,(-4,A1)
	MOVE.L	#$F0F0F0F,D4
	AND.L	D4,D0
	AND.L	D4,D2
	LSL.L	#4,D0
	OR.L	D2,D0
	AND.L	D4,D1
	AND.L	D4,D3
	LSL.L	#4,D1
	OR.L	D3,D1
	MOVEA.L	D1,A3
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVE.L	(A0)+,D3
	MOVEA.L	(4,SP),A1
	MOVE.L	(A0)+,D7
	MOVE.L	A4,(-4,A1)
	AND.L	D4,D1
	AND.L	D4,D2
	LSL.L	#4,D2
	OR.L	D1,D2
	AND.L	D4,D3
	AND.L	D4,D7
	LSL.L	#4,D3
	OR.L	D7,D3
	MOVE.L	A3,D1
	SWAP	D2
	MOVE.W	D0,D7
	MOVE.W	D2,D0
	MOVE.W	D7,D2
	SWAP	D2
	SWAP	D3
	MOVE.W	D1,D7
	MOVE.W	D3,D1
	MOVE.W	D7,D3
	MOVEA.L	(SP),A1
	SWAP	D3
	MOVE.L	A5,(-4,A1)
lbC000792	MOVE.L	A6,D4
	MOVE.L	D2,D7
	LSR.L	#2,D7
	EOR.L	D0,D7
	AND.L	D5,D7
	EOR.L	D7,D0
	LSL.L	#2,D7
	EOR.L	D7,D2
	MOVE.L	D3,D7
	LSR.L	#2,D7
	EOR.L	D1,D7
	AND.L	D5,D7
	EOR.L	D7,D1
	LSL.L	#2,D7
	EOR.L	D7,D3
	MOVE.L	D1,D7
	LSR.L	#8,D7
	EOR.L	D0,D7
	AND.L	D4,D7
	EOR.L	D7,D0
	LSL.L	#8,D7
	EOR.L	D7,D1
	MOVE.L	D1,D7
	LSR.L	#1,D7
	EOR.L	D0,D7
	MOVEA.L	(12,SP),A1
	AND.L	D6,D7
	EOR.L	D7,D0
	MOVE.L	D0,(A1)
	ADDQ.L	#4,(SP)
	ADDQ.L	#4,(4,SP)
	ADDQ.L	#4,(8,SP)
	ADDQ.L	#4,(12,SP)
	ADD.L	D7,D7
	EOR.L	D1,D7
	MOVE.L	D3,D1
	LSR.L	#8,D1
	EOR.L	D2,D1
	AND.L	D4,D1
	EOR.L	D1,D2
	LSL.L	#8,D1
	EOR.L	D1,D3
	MOVE.L	D3,D1
	LSR.L	#1,D1
	EOR.L	D2,D1
	AND.L	D6,D1
	EOR.L	D1,D2
	ADD.L	D1,D1
	EOR.L	D1,D3
	MOVEA.L	D2,A4
	MOVEA.L	D3,A5
	CMPA.L	A0,A2
	BNE.W	lbC00072E
	MOVEA.L	($20,SP),A0
	MOVE.L	(A0)+,D0
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVEA.L	(8,SP),A1
	MOVE.L	(A0)+,D3
	MOVE.L	D7,(-4,A1)
	MOVE.L	#$F0F0F0F0,D4
	AND.L	D4,D0
	AND.L	D4,D2
	LSR.L	#4,D2
	OR.L	D2,D0
	AND.L	D4,D1
	AND.L	D4,D3
	LSR.L	#4,D3
	OR.L	D3,D1
	MOVEA.L	D1,A3
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVE.L	(A0)+,D3
	MOVEA.L	(4,SP),A1
	MOVE.L	(A0)+,D7
	MOVE.L	A4,(-4,A1)
	AND.L	D4,D1
	AND.L	D4,D2
	LSR.L	#4,D1
	OR.L	D1,D2
	AND.L	D4,D3
	AND.L	D4,D7
	LSR.L	#4,D7
	OR.L	D7,D3
	MOVE.L	A3,D1
	SWAP	D2
	MOVE.W	D0,D7
	MOVE.W	D2,D0
	MOVE.W	D7,D2
	SWAP	D2
	SWAP	D3
	MOVE.W	D1,D7
	MOVE.W	D3,D1
	MOVEA.L	(SP),A1
	MOVE.W	D7,D3
	SWAP	D3
	MOVE.L	A5,(-4,A1)
	BRA.B	lbC0008D6

lbC000870	MOVE.L	(A0)+,D0
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVEA.L	($18,SP),A1
	MOVE.L	(A0)+,D3
	MOVE.L	D7,(-4,A1)
	MOVE.L	#$F0F0F0F0,D4
	AND.L	D4,D0
	AND.L	D4,D2
	LSR.L	#4,D2
	OR.L	D2,D0
	AND.L	D4,D1
	AND.L	D4,D3
	LSR.L	#4,D3
	OR.L	D3,D1
	MOVEA.L	D1,A3
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D1
	MOVE.L	(A0)+,D3
	MOVEA.L	($14,SP),A1
	MOVE.L	(A0)+,D7
	MOVE.L	A4,(-4,A1)
	AND.L	D4,D1
	AND.L	D4,D2
	LSR.L	#4,D1
	OR.L	D1,D2
	AND.L	D4,D3
	AND.L	D4,D7
	LSR.L	#4,D7
	OR.L	D7,D3
	MOVE.L	A3,D1
	SWAP	D2
	MOVE.W	D0,D7
	MOVE.W	D2,D0
	MOVE.W	D7,D2
	SWAP	D2
	SWAP	D3
	MOVE.W	D1,D7
	MOVE.W	D3,D1
	MOVEA.L	($10,SP),A1
	MOVE.W	D7,D3
	SWAP	D3
	MOVE.L	A5,(-4,A1)
lbC0008D6	MOVE.L	A6,D4
	MOVE.L	D2,D7
	LSR.L	#2,D7
	EOR.L	D0,D7
	AND.L	D5,D7
	EOR.L	D7,D0
	LSL.L	#2,D7
	EOR.L	D7,D2
	MOVE.L	D3,D7
	LSR.L	#2,D7
	EOR.L	D1,D7
	AND.L	D5,D7
	EOR.L	D7,D1
	LSL.L	#2,D7
	EOR.L	D7,D3
	MOVE.L	D1,D7
	LSR.L	#8,D7
	EOR.L	D0,D7
	AND.L	D4,D7
	EOR.L	D7,D0
	LSL.L	#8,D7
	EOR.L	D7,D1
	MOVE.L	D1,D7
	LSR.L	#1,D7
	EOR.L	D0,D7
	MOVEA.L	($1C,SP),A1
	AND.L	D6,D7
	EOR.L	D7,D0
	MOVE.L	D0,(A1)
	ADDQ.L	#4,($10,SP)
	ADDQ.L	#4,($14,SP)
	ADDQ.L	#4,($18,SP)
	ADDQ.L	#4,($1C,SP)
	ADD.L	D7,D7
	EOR.L	D1,D7
	MOVE.L	D3,D1
	LSR.L	#8,D1
	EOR.L	D2,D1
	AND.L	D4,D1
	EOR.L	D1,D2
	LSL.L	#8,D1
	EOR.L	D1,D3
	MOVE.L	D3,D1
	LSR.L	#1,D1
	EOR.L	D2,D1
	AND.L	D6,D1
	EOR.L	D1,D2
	ADD.L	D1,D1
	EOR.L	D1,D3
	MOVEA.L	D2,A4
	MOVEA.L	D3,A5
	CMPA.L	A0,A2
	BNE.W	lbC000870
	MOVEA.L	($18,SP),A1
	MOVE.L	D7,(-4,A1)
	MOVEA.L	($14,SP),A1
	MOVE.L	A4,(-4,A1)
	MOVEA.L	($10,SP),A1
	MOVE.L	A5,(-4,A1)
	ADDA.L	#$24,SP
	RTS

	dc.l	0

	cnop	0,16
;	ds.b	8

Modulo = $2800
Length = $A00		; number of longwords per BitPlan to write

; static/dependent BitPlanes version for one chip ram area

BEST_c2p
	lea	lbL001240,A0		; source (chunky)
	lea	lbL215300,A1		; destination (planar)

	move.l	#Modulo,A2		; Modulo
	lea	(A1,A2.L*4),A1		; A1+Modulo*4

	lea	-4(A1,A2.L*2),A3	; A1+Modulo*6-4
	add.l	#Length*4,A3		; loop test value

	move.l	A3,-(SP)

	sub.l	A6,A6
	lea	(A6,A2.L*8),A6		; Modulo*8
	sub.l	A2,A6			; Modulo*7
	sub.l	A2,A6			; Modulo*6

	MOVE.L	(A0)+,D0
	move.l	#$0F0F0F0F,D4		; temp
	MOVE.L	(A0)+,D1
	move.l	#$CCCCCCCC,D5		; static
	MOVE.L	(A0)+,D2
	move.l	#$AAAAAAAA,D6		; static
	MOVE.L	(A0)+,D3
	move.l	#$FF00FF00,D7		; static
	AND.L	D4,D1
	LSL.L	#4,D0
	OR.L	D1,D0
	AND.L	D4,D2
	AND.L	D4,D3
	LSL.L	#4,D2
	OR.L	D3,D2

	move.l	D4,D1
	and.l	(A0)+,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	lsl.l	#4,D1
	or.l	D3,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	LSL.L	#4,D3
	and.l	(A0)+,D4

	move.l	D1,A4
	OR.L	D4,D3
	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	A4,D1

	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	EOR.L	D4,D1
	LSR.L	#2,D4

	sub.l	A2,A1			; A1+Modulo*3

	EOR.L	D4,D0

	move.l	D3,D4
	move.w	D2,D3
	swap	D3
	move.w	D3,D2
	move.w	D4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3
	LSR.L	#2,D4
	EOR.L	D4,D2
	MOVE.L	D0,D4
	LSL.L	#8,D4
	EOR.L	D2,D4
	AND.L	D7,D4
	EOR.L	D4,D2
	LSR.L	#8,D4
	EOR.L	D4,D0
	MOVE.L	D0,D4
	ADD.L	D4,D4
	EOR.L	D2,D4
	AND.L	D6,D4
	EOR.L	D4,D2
	LSR.L	#1,D4
	EOR.L	D4,D0

	move.l	D0,(A1)			; 1.00 (poor place) chipram write -> bit plane 4
	MOVE.L	D1,D4
	sub.l	A2,A1			; A1+Modulo*2

	LSL.L	#8,D4
	EOR.L	D3,D4
	AND.L	D7,D4
	EOR.L	D4,D3
	LSR.L	#8,D4
	EOR.L	D4,D1

	lea	-$20(A0),A0

	MOVE.L	D1,D4
	ADD.L	D4,D4
	EOR.L	D3,D4
	AND.L	D6,D4
	EOR.L	D4,D3
	lsr.l	#1,D4
	eor.l	D1,D4

	move.l	D2,(A1)			; 0.64 (average place) chipram write -> bit plane 3
	move.l	#$F0F0F0F0,D1
	move.l	(A0)+,D0
	move.l	(A0)+,A4
	and.l	D1,D0
	move.l	(A0)+,D2
	exg	D4,A4
	move.l	(A0)+,A5
	sub.l	A2,A1			; A1+Modulo*1
	and.l	D1,D4
	exg	D3,A5
	and.l	D1,D2
	lsr.l	#4,D4
	and.l	D1,D3
	or.l	D4,D0
	lsr.l	#4,D3
	move.l	D1,D4
	or.l	D3,D2
	move.l	D4,D3

	and.l	(A0)+,D1
	and.l	(A0)+,D3
	lsr.l	#4,D3
	or.l	D3,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	and.l	(A0)+,D4
	move.l	A4,(A1)			; 0.01 (perfect place) chipram write -> bit plane 2
	sub.l	A2,A1			; A1+Modulo*0 (place OK)
	lsr.l	#4,D4
	or.l	D4,D3

	move.l	A5,(A1)			; 0.01 (perfect place) chipram write -> bit plane 1
	move.l	D1,A4
	add.l	A6,A1			; A1+Modulo*6

	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	A4,D1

	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	move.l	D3,A4
	EOR.L	D4,D1
	move.w	D2,D3
	LSR.L	#2,D4
	swap	D3
	EOR.L	D4,D0

	move.w	D3,D2
	move.w	A4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3

	subq.l	#4,A6			; correction for bit plane 7 handling
	bra.w	GoBC2P

LoopBC2P
	move.l	(A0)+,D0
	sub.l	A2,A1			; A1+Modulo*5
	move.l	(A0)+,D1
	AND.L	D4,D0
	move.l	(A0)+,D2
	move.l	(A0)+,D3

	AND.L	D4,D2
	LSL.L	#4,D0
	LSL.L	#4,D2
	AND.L	D4,D1
	AND.L	D4,D3
	OR.L	D1,D0
	OR.L	D3,D2

	move.l	D4,D1
	and.l	(A0)+,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	lsl.l	#4,D1
	move.l	(A0)+,D4
	or.l	D3,D1
	move.l	#$0F0F0F0F,D3	
	and.l	D3,D4
	move.l	A4,(A1)			; 0.04 (perfect place) chipram write -> bit plane 6
	sub.l	A2,A1			; A1+Modulo*4 (right place)
	and.l	(A0)+,D3
	move.l	A5,(A1)+		; 0.26 (perfect place) chipram write -> bit plane 5
	sub.l	A2,A1			; A1+Modulo*3
	lsl.l	#4,D4
	or.l	D4,D3
	move.l	D1,D4
	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	D4,D1

	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	EOR.L	D4,D1
	LSR.L	#2,D4
	EOR.L	D4,D0

	move.l	D3,D4
	move.w	D2,D3
	swap	D3
	move.w	D3,D2
	move.w	D4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3
	LSR.L	#2,D4
	EOR.L	D4,D2
	MOVE.L	D0,D4
	LSL.L	#8,D4
	EOR.L	D2,D4
	AND.L	D7,D4
	EOR.L	D4,D2
	LSR.L	#8,D4
	EOR.L	D4,D0
	MOVE.L	D0,D4
	ADD.L	D4,D4
	EOR.L	D2,D4
	AND.L	D6,D4
	EOR.L	D4,D2
	LSR.L	#1,D4
	EOR.L	D4,D0

	move.l	D0,(A1)			; 1.00 (poor place) chipram write -> bit plane 4
	MOVE.L	D1,D4
	sub.l	A2,A1			; A1+Modulo*2

	LSL.L	#8,D4
	EOR.L	D3,D4
	AND.L	D7,D4
	EOR.L	D4,D3
	LSR.L	#8,D4
	EOR.L	D4,D1

	lea	-$20(A0),A0

	MOVE.L	D1,D4
	ADD.L	D4,D4
	EOR.L	D3,D4
	AND.L	D6,D4
	EOR.L	D4,D3
	lsr.l	#1,D4
	eor.l	D1,D4

	move.l	D2,(A1)			; 0.64 (average place) chipram write -> bit plane 3
	move.l	(A0)+,D0
	move.l	#$F0F0F0F0,D1
	move.l	(A0)+,A4
	and.l	D1,D0
	move.l	(A0)+,D2
	exg	D4,A4
	move.l	(A0)+,A5
	sub.l	A2,A1			; A1+Modulo*1
	and.l	D1,D4
	exg	D3,A5
	and.l	D1,D2
	lsr.l	#4,D4
	and.l	D1,D3
	or.l	D4,D0
	lsr.l	#4,D3
	move.l	D1,D4
	or.l	D3,D2
	move.l	D4,D3

	and.l	(A0)+,D1
	and.l	(A0)+,D3
	lsr.l	#4,D3
	or.l	D3,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	and.l	(A0)+,D4
	move.l	A4,(A1)			; 0.01 (perfect place) chipram write -> bit plane 2
	sub.l	A2,A1			; A1+Modulo*0 (place OK)
	lsr.l	#4,D4
	or.l	D4,D3

	move.l	A5,(A1)			; 0.01 (perfect place) chipram write -> bit plane 1
	move.l	D1,A4
	add.l	A6,A1			; A1+Modulo*6 (-4)

	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	A4,D1

	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	EOR.L	D4,D1
	LSR.L	#2,D4
	EOR.L	D4,D0

	move.l	D3,A4
	move.w	D2,D3
	swap	D3
	move.w	D3,D2
	move.w	A4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3
	move.l	A3,(A1)+		; 0.76 (average place) chipram write -> bit plane 7
GoBC2P
	LSR.L	#2,D4
	add.l	A2,A1			; A1+Modulo*7

	EOR.L	D4,D2
	MOVE.L	D0,D4
	LSL.L	#8,D4
	EOR.L	D2,D4
	AND.L	D7,D4
	EOR.L	D4,D2
	LSR.L	#8,D4
	EOR.L	D4,D0
	MOVE.L	D0,D4
	ADD.L	D4,D4
	EOR.L	D2,D4
	AND.L	D6,D4
	EOR.L	D4,D2
	LSR.L	#1,D4
	EOR.L	D4,D0

	move.l	D2,A3
	move.l	D0,(A1)			; 1.00 (poor place) chipram write -> bit plane 8
	MOVE.L	D1,D4
	sub.l	A2,A1			; A1+Modulo*6

	LSL.L	#8,D4
	EOR.L	D3,D4
	AND.L	D7,D4
	EOR.L	D4,D3
	LSR.L	#8,D4
	EOR.L	D4,D1
	MOVE.L	D1,D4
	ADD.L	D4,D4
	EOR.L	D3,D4
	AND.L	D6,D4
	EOR.L	D4,D3
	LSR.L	#1,D4
	EOR.L	D1,D4
	move.l	D4,A4			; fix Cosmos Amiga in 2019
	MOVE.L	#$0F0F0F0F,D4		; fix Cosmos Amiga in 2019
	move.l	D3,A5
	cmp.l	(SP),A1
	bne.w	LoopBC2P
	move.l	A3,(A1)			; chipram write -> bit plane 7
	sub.l	A2,A1			; A1+Modulo*5 
	addq.l	#4,SP			; restore stack
	move.l	A4,(A1)			; chipram write -> bit plane 6
	sub.l	A2,A1			; A1+Modulo*4
	move.l	A5,(A1)			; chipram write -> bit plane 5
	RTS


NONE_c2p
	lea	lbL001240,A0		; source (chunky)
	lea	lbL215300,A1		; destination (planar)

	move.l	#Modulo,A2		; Modulo
	lea	(A1,A2.L*4),A1		; A1+Modulo*4

	lea	-4(A1,A2.L*2),A3	; A1+Modulo*6-4
	add.l	#Length*4,A3		; loop test value

	move.l	A3,-(SP)

	sub.l	A6,A6
	lea	(A6,A2.L*8),A6		; Modulo*8
	sub.l	A2,A6			; Modulo*7
	sub.l	A2,A6			; Modulo*6

	move.l	#$FF00FF00,D7		; static
	move.l	#$AAAAAAAA,D6		; static
	move.l	#$CCCCCCCC,D5		; static

	move.l	#$0F0F0F0F,D4		; temp

	MOVE.L	(A0)+,D0
	MOVE.L	(A0)+,D1
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D3
	AND.L	D4,D0
	AND.L	D4,D1
	LSL.L	#4,D0
	OR.L	D1,D0
	AND.L	D4,D2
	AND.L	D4,D3
	LSL.L	#4,D2
	OR.L	D3,D2

	move.l	D4,D1
	move.l	D4,D3
	and.l	(A0)+,D1
	and.l	(A0)+,D3
	lsl.l	#4,D1
	or.l	D3,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	and.l	(A0)+,D4

	LSL.L	#4,D3
	OR.L	D4,D3

	move.l	D1,A4
	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	A4,D1

	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	EOR.L	D4,D1
	LSR.L	#2,D4
	EOR.L	D4,D0

	sub.l	A2,A1			; A1+Modulo*3

	move.l	D3,D4
	move.w	D2,D3
	swap	D3
	move.w	D3,D2
	move.w	D4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3
	LSR.L	#2,D4
	EOR.L	D4,D2
	MOVE.L	D0,D4
	LSL.L	#8,D4
	EOR.L	D2,D4
	AND.L	D7,D4
	EOR.L	D4,D2
	LSR.L	#8,D4
	EOR.L	D4,D0
	MOVE.L	D0,D4
	ADD.L	D4,D4
	EOR.L	D2,D4
	AND.L	D6,D4
	EOR.L	D4,D2
	LSR.L	#1,D4
	EOR.L	D4,D0

	sub.l	A2,A1			; A1+Modulo*2

	MOVE.L	D1,D4
	LSL.L	#8,D4
	EOR.L	D3,D4
	AND.L	D7,D4
	EOR.L	D4,D3
	LSR.L	#8,D4
	EOR.L	D4,D1

	lea	-$20(A0),A0

	MOVE.L	D1,D4
	ADD.L	D4,D4
	EOR.L	D3,D4
	AND.L	D6,D4
	EOR.L	D4,D3
	lsr.l	#1,D4
	eor.l	D1,D4
	move.l	#$F0F0F0F0,D1

	move.l	(A0)+,D0
	move.l	(A0)+,A4
	move.l	(A0)+,D2
	move.l	(A0)+,A5
	and.l	D1,D0
	exg	D4,A4
	sub.l	A2,A1			; A1+Modulo*1
	and.l	D1,D4
	exg	D3,A5
	and.l	D1,D2
	lsr.l	#4,D4
	and.l	D1,D3
	or.l	D4,D0
	lsr.l	#4,D3
	move.l	D1,D4
	or.l	D3,D2
	move.l	D4,D3

	and.l	(A0)+,D1
	and.l	(A0)+,D3
	lsr.l	#4,D3
	or.l	D3,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	and.l	(A0)+,D4
	sub.l	A2,A1			; A1+Modulo*0 (place OK)
	lsr.l	#4,D4
	or.l	D4,D3

	add.l	A6,A1			; A1+Modulo*6

	move.l	D1,A4
	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	A4,D1

	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	EOR.L	D4,D1
	LSR.L	#2,D4
	EOR.L	D4,D0

	move.l	D3,A4
	move.w	D2,D3
	swap	D3
	move.w	D3,D2
	move.w	A4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3

	subq.l	#4,A6			; correction for bit plane 7
	bra.w	Gonc2p

Loopnc2p
	move.l	(A0)+,D0
	move.l	(A0)+,D1
	move.l	(A0)+,D2
	move.l	(A0)+,D3
	sub.l	A2,A1			; A1+Modulo*5

	AND.L	D4,D0
	AND.L	D4,D2
	LSL.L	#4,D0
	LSL.L	#4,D2
	AND.L	D4,D1
	AND.L	D4,D3
	OR.L	D1,D0
	OR.L	D3,D2

	move.l	D4,D1
	and.l	(A0)+,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	lsl.l	#4,D1
	move.l	(A0)+,D4
	or.l	D3,D1
	move.l	#$0F0F0F0F,D3	
	and.l	D3,D4
	sub.l	A2,A1			; A1+Modulo*4 (right place)
	and.l	(A0)+,D3
	lsl.l	#4,D4
	or.l	D4,D3
	move.l	D1,D4
	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	D4,D1
	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	EOR.L	D4,D1
	LSR.L	#2,D4
	EOR.L	D4,D0

	addq.l	#4,A1

	sub.l	A2,A1			; A1+Modulo*3

	move.l	D3,D4
	move.w	D2,D3
	swap	D3
	move.w	D3,D2
	move.w	D4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3
	LSR.L	#2,D4
	EOR.L	D4,D2
	MOVE.L	D0,D4
	LSL.L	#8,D4
	EOR.L	D2,D4
	AND.L	D7,D4
	EOR.L	D4,D2
	LSR.L	#8,D4
	EOR.L	D4,D0
	MOVE.L	D0,D4
	ADD.L	D4,D4
	EOR.L	D2,D4
	AND.L	D6,D4
	EOR.L	D4,D2
	LSR.L	#1,D4
	EOR.L	D4,D0

	sub.l	A2,A1			; A1+Modulo*2

	MOVE.L	D1,D4
	LSL.L	#8,D4
	EOR.L	D3,D4
	AND.L	D7,D4
	EOR.L	D4,D3
	LSR.L	#8,D4
	EOR.L	D4,D1

	lea	-$20(A0),A0

	MOVE.L	D1,D4
	ADD.L	D4,D4
	EOR.L	D3,D4
	AND.L	D6,D4
	EOR.L	D4,D3
	lsr.l	#1,D4
	eor.l	D1,D4
	move.l	#$F0F0F0F0,D1

	move.l	(A0)+,D0
	move.l	(A0)+,A4
	move.l	(A0)+,D2
	move.l	(A0)+,A5
	and.l	D1,D0
	exg	D4,A4
	sub.l	A2,A1			; A1+Modulo*1
	and.l	D1,D4
	exg	D3,A5
	and.l	D1,D2
	lsr.l	#4,D4
	and.l	D1,D3
	or.l	D4,D0
	lsr.l	#4,D3
	move.l	D1,D4
	or.l	D3,D2
	move.l	D4,D3

	and.l	(A0)+,D1
	and.l	(A0)+,D3
	lsr.l	#4,D3
	or.l	D3,D1
	move.l	D4,D3
	and.l	(A0)+,D3
	and.l	(A0)+,D4
	sub.l	A2,A1			; A1+Modulo*0 (place OK)
	lsr.l	#4,D4
	or.l	D4,D3

	add.l	A6,A1			; A1+Modulo*6 (-4)

	move.l	D1,A4
	move.w	D0,D1
	swap	D1
	move.w	D1,D0
	move.w	A4,D1

	MOVE.L	D0,D4
	LSL.L	#2,D4
	EOR.L	D1,D4
	AND.L	D5,D4
	EOR.L	D4,D1
	LSR.L	#2,D4
	EOR.L	D4,D0

	move.l	D3,A4
	move.w	D2,D3
	swap	D3
	move.w	D3,D2
	move.w	A4,D3

	MOVE.L	D2,D4
	LSL.L	#2,D4
	EOR.L	D3,D4
	AND.L	D5,D4
	EOR.L	D4,D3

	addq.l	#4,A1
Gonc2p
	add.l	A2,A1			; A1+Modulo*7

	LSR.L	#2,D4
	EOR.L	D4,D2
	MOVE.L	D0,D4
	LSL.L	#8,D4
	EOR.L	D2,D4
	AND.L	D7,D4
	EOR.L	D4,D2
	LSR.L	#8,D4
	EOR.L	D4,D0
	MOVE.L	D0,D4
	ADD.L	D4,D4
	EOR.L	D2,D4
	AND.L	D6,D4
	EOR.L	D4,D2
	LSR.L	#1,D4
	EOR.L	D4,D0

	move.l	D2,A3
	sub.l	A2,A1			; A1+Modulo*6

	MOVE.L	D1,D4
	LSL.L	#8,D4
	EOR.L	D3,D4
	AND.L	D7,D4
	EOR.L	D4,D3
	LSR.L	#8,D4
	EOR.L	D4,D1
	MOVE.L	D1,D4
	ADD.L	D4,D4
	EOR.L	D3,D4
	AND.L	D6,D4
	EOR.L	D4,D3
	LSR.L	#1,D4
	EOR.L	D1,D4
	move.l	D4,A4
	move.l	D3,A5
	MOVE.L	#$0F0F0F0F,D4
	cmp.l	(SP),A1
	bne.w	Loopnc2p
	sub.l	A2,A1			; A1+Modulo*5 
	addq.l	#4,SP			; restore stack
	sub.l	A2,A1			; A1+Modulo*4
	RTS

	cnop	0,4
	dc.l	0
	dc.l	0
	dc.l	0
	dc.w	0

lbC000D20	LEA	(lbL215290),A1
	MOVEA.L	(lbL2152FC),A0
	LEA	($54,A0),A0
	MOVEQ	#$63,D7
lbC000D32	MOVE.B	(A0)+,(A1)+
	DBRA	D7,lbC000D32
	LEA	(lbL215290),A1
	CLR.L	(A1)
	MOVE.L	#lbL215268,(4,A1)
	LEA	(lbL215268),A1
	MOVE.W	#1,(2,A1)
	MOVE.B	#8,(5,A1)
	MOVE.W	#$28,(A1)
	ADDQ.W	#8,A1
	LEA	(lbL229300),A0
	MOVEQ	#7,D7
	MOVEQ	#$28,D0
lbC000D6A	MOVE.L	A0,(A1)+
	ADDA.L	D0,A0
	DBRA	D7,lbC000D6A
	RTS


MOVEMOVE	MOVE.L	#$9FF,D7
lbC000DB6	MOVE.L	(A0)+,D0
	MOVE.L	(A0)+,D1
	MOVE.L	(A0)+,D2
	MOVE.L	(A0)+,D3
	MOVE.L	(A0)+,D4
	MOVE.L	(A0)+,D5
	MOVE.L	(A0)+,D6
	MOVEA.L	(A0)+,A2
	MOVE.L	D0,(A1)+
	MOVE.L	D1,(A1)+
	MOVE.L	D2,(A1)+
	MOVE.L	D3,(A1)+
	MOVE.L	D4,(A1)+
	MOVE.L	D5,(A1)+
	MOVE.L	D6,(A1)+
	MOVE.L	A2,(A1)+
	DBRA	D7,lbC000DB6
	RTS

	cnop	0,4

	dc.l	0
	dc.l	0
	dc.l	0
	dc.w	0
lbL000F00	dc.l	$80000023
	dc.l	$140
	dc.l	$80000024
	dc.l	$100
	dc.l	$80000025
	dc.l	8
	dc.l	$8000002D
	dc.l	15
	dc.l	$80000038
	dc.l	1
	dc.l	$80000032
	dc.l	$21000
	dc.l	$8000002E
	dc.l	lbL215240
	dc.l	$80000036
	dc.l	0
	dc.l	0
graphicslibra.MSG	dc.b	'graphics.library',0
intuitionlibr.MSG	dc.b	'intuition.library',0,0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0



lbC0011E0	MOVEQ	#0,D0
	MOVEA.L	A0,A1
lbC0011E4	MOVE.W	#$100,D3
	MOVEQ	#7,D4
	MOVEQ	#1,D5
	MOVEQ	#0,D6
	MOVEQ	#7,D7
lbC0011F0	MOVE.W	D0,D1
	AND.W	D3,D1
	ROR.W	D4,D1
	MOVE.B	D0,D2
	AND.B	D5,D2
	ROR.B	D6,D2
	ADD.B	D2,D1
	MOVE.B	D1,(A0)+
	ROL.W	#1,D3
	ADDQ.W	#1,D4
	ROL.B	#1,D5
	ADDQ.W	#1,D6
	DBRA	D7,lbC0011F0
	ADDQ.L	#1,D0
	CMPI.L	#$10000,D0
	BNE.B	lbC0011E4
	MOVEQ	#2,D0
lbC001218	MOVEQ	#0,D1
lbC00121A	MOVE.L	(A1)+,D2
	ROL.L	#2,D2
	MOVE.L	D2,(A0)+
	ADDQ.L	#1,D1
	CMPI.L	#$20000,D1
	BNE.B	lbC00121A
	DBRA	D0,lbC001218
	RTS


	SECTION	c2p_test_new6001230,BSS
	ds.l	3
	ds.b	3
	ds.b	1
lbL001240	ds.l	$3B0
	ds.w	$7FFF
	ds.w	$18A1
lbL015240	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$3FFF
	ds.l	$20
lbL215240	ds.l	10
lbL215268	ds.l	10
lbL215290	ds.l	$19
lbL2152F4	ds.l	1
lbL2152F8	ds.l	1
lbL2152FC	ds.l	1

	SECTION	c2p_test_new6215300,BSS_C
lbL215300	ds.l	$3FFF
	ds.l	$1001
lbL229300	ds.l	$50

	end
