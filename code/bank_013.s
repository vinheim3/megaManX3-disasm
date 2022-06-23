.include "includes.s"
        
.bank $013 slot 3
.org $0

.org $4000

UpdateEnemyCapsule:
	ldx StageEnemyEntity.state                                                 ; $c000 : $a6, $01
	jmp (@states.w, X)                                                  ; $c002 : $7c, $05, $c0

@states:
	.dw CapsuleState0_Init
	.dw CapsuleState1_Main
	.dw CapsuleState2_Delete


CapsuleState0_Init:
;
	lda #$00.b                                                  ; $c00b : $a9, $00
	sta $7fcfff.l                                                  ; $c00d : $8f, $ff, $cf, $7f

; Jump if not the stage with the gold armour
	lda wStageIdx.w                                                           ; $c011 : $ad, $ae, $1f
	cmp #STAGE_DOPPLER_PT_1.b                                                 ; $c014 : $c9, $0a
	bne @notDoppler                                                           ; $c016 : $d0, $19

; All sub tanks and upgrades must be gotten
	lda wSubTanksAndUpgradesGottenBitfield.w                                  ; $c018 : $ad, $d1, $1f
	and $1fd4.w                                                               ; $c01b : $2d, $d4, $1f
	cmp #$ff.b                                                                ; $c01e : $c9, $ff
	bne @deleteSelf                                                           ; $c020 : $d0, $4b

; All ride armours, and none of the chips, must be gotten
	lda wChipsAndRideArmoursGottenBitfield.w                                  ; $c022 : $ad, $d7, $1f
	cmp #$0f.b                                                                ; $c025 : $c9, $0f
	bne @deleteSelf                                                           ; $c027 : $d0, $44

; Player must have max health
	lda wCurrHealth.w                                                         ; $c029 : $ad, $ff, $09
	cmp wMaxHealth.w                                                          ; $c02c : $cd, $d2, $1f
	bne @deleteSelf                                                           ; $c02f : $d0, $3c

@notDoppler:
; associate stage with a bit for the upgrade
	ldx wStageIdx.w                                                  ; $c031 : $ae, $ae, $1f
	ldy Data_6_ccfa.w, X                                                  ; $c034 : $bc, $fa, $cc

; jump if the highest bits (chips), as upgrades are in a byte's low bits
	lda BitTable.w, Y                                                  ; $c037 : $b9, $fd, $bb
	bit #$f0.b                                                  ; $c03a : $89, $f0
	bne @checkChips                                                  ; $c03c : $d0, $07

; proceed if upgrade not gotten
	and wSubTanksAndUpgradesGottenBitfield.w                                                  ; $c03e : $2d, $d1, $1f
	beq @br_c071                                                  ; $c041 : $f0, $2e

	bra @deleteSelf                                                  ; $c043 : $80, $28

@checkChips:
; proceed if chip not gotten
	and wChipsAndRideArmoursGottenBitfield.w                                                  ; $c045 : $2d, $d7, $1f
	bne @deleteSelf                                                  ; $c048 : $d0, $23

; move chips to the low nybble
	lda BitTable.w, Y                                                  ; $c04a : $b9, $fd, $bb
	lsr                                                  ; $c04d : $4a
	lsr                                                  ; $c04e : $4a
	lsr                                                  ; $c04f : $4a
	lsr                                                  ; $c050 : $4a

; jump if the associated upgrade not yet gotten
	and wSubTanksAndUpgradesGottenBitfield.w                                                  ; $c051 : $2d, $d1, $1f
	beq @br_c065                                                  ; $c054 : $f0, $0f

; jump if no chips gotten yet
	lda wChipsAndRideArmoursGottenBitfield.w                                                  ; $c056 : $ad, $d7, $1f
	and #$f0.b                                                  ; $c059 : $29, $f0
	beq @br_c071                                                  ; $c05b : $f0, $14

;
	lda #$02.b                                                  ; $c05d : $a9, $02
	sta $7fcfff.l                                                  ; $c05f : $8f, $ff, $cf, $7f
	bra @br_c071                                                  ; $c063 : $80, $0c

@br_c065:
	lda #$01.b                                                  ; $c065 : $a9, $01
	sta $7fcfff.l                                                  ; $c067 : $8f, $ff, $cf, $7f
	bra @br_c071                                                  ; $c06b : $80, $04

@deleteSelf:
	jmp todo_DisablesEntity_d928.l                                                  ; $c06d : $5c, $28, $d9, $02

@br_c071:
	jsr Func_2_e15c.l                                                  ; $c071 : $22, $5c, $e1, $02
	lda #$a0.b                                                  ; $c075 : $a9, $a0
	sta $18                                                  ; $c077 : $85, $18
	stz $26                                                  ; $c079 : $64, $26
	lda #$3f.b                                                  ; $c07b : $a9, $3f
	sta $11                                                  ; $c07d : $85, $11
	lda #$02.b                                                  ; $c07f : $a9, $02
	sta $12                                                  ; $c081 : $85, $12
	sta $30                                                  ; $c083 : $85, $30
	lda #$01.b                                                  ; $c085 : $a9, $01
	sta $27                                                  ; $c087 : $85, $27
	stz $0f                                                  ; $c089 : $64, $0f
	lda #$88.b                                                  ; $c08b : $a9, $88
	sta $10                                                  ; $c08d : $85, $10
	lda #$02.b                                                  ; $c08f : $a9, $02
	sta StageEnemyEntity.substate                                                  ; $c091 : $85, $02
	rep #$20.b                                                  ; $c093 : $c2, $20

; stage * 4, to get X's then Y's
	lda wStageIdx.w                                                  ; $c095 : $ad, $ae, $1f
	and #$00ff.w                                                  ; $c098 : $29, $ff, $00
	asl                                                  ; $c09b : $0a
	asl                                                  ; $c09c : $0a
	tax                                                  ; $c09d : $aa
	lda Data_6_ccbe.w, X                                                  ; $c09e : $bd, $be, $cc
	sta StageEnemyEntity.x                                                  ; $c0a1 : $85, $05
	lda Data_6_ccbe.w+2, X                                                  ; $c0a3 : $bd, $c0, $cc
	sta StageEnemyEntity.y                                                  ; $c0a6 : $85, $08
	lda #$cc96.w                                                  ; $c0a8 : $a9, $96, $cc
	sta $20                                                  ; $c0ab : $85, $20
	sep #ACCU_8                                                  ; $c0ad : $e2, $20
	rep #ACCU_8                                                  ; $c0af : $c2, $20
	rtl                                                  ; $c0b1 : $6b


CapsuleState1_Main:
; Disable entity if out of view
	jsr SetCarryIfEntityWayOutOfView.l                                                  ; $c0b2 : $22, $8a, $d5, $02
	bcc @entityInView                                                  ; $c0b6 : $90, $04

	jmp Func_2_d917.l                                                  ; $c0b8 : $5c, $17, $d9, $02

@entityInView:
;
	lda #$80.b                                                  ; $c0bc : $a9, $80
	tsb $2c                                                  ; $c0be : $04, $2c
	rep #ACCU_8|F_CARRY                                                  ; $c0c0 : $c2, $21

;
	lda $09da.w                                                  ; $c0c2 : $ad, $da, $09
	and #$00ff.w                                                  ; $c0c5 : $29, $ff, $00
	cmp #$001e.w                                                  ; $c0c8 : $c9, $1e, $00
	beq @cont_c0e3                                                  ; $c0cb : $f0, $16

	lda $0f                                                  ; $c0cd : $a5, $0f
	and #$000f.w                                                  ; $c0cf : $29, $0f, $00
	clc                                                  ; $c0d2 : $18
	adc #$cc96.w                                                  ; $c0d3 : $69, $96, $cc
	sta $20                                                  ; $c0d6 : $85, $20
	jsr Func_4_bfae.l                                                  ; $c0d8 : $22, $ae, $bf, $04
	jsr Call_13_c588.w                                                  ; $c0dc : $20, $88, $c5
	jsr Func_4_ca30.l                                                  ; $c0df : $22, $30, $ca, $04

@cont_c0e3:
	lda $0f                                                  ; $c0e3 : $a5, $0f
	and #$000f.w                                                  ; $c0e5 : $29, $0f, $00
	clc                                                  ; $c0e8 : $18
	adc #$cc9a.w                                                  ; $c0e9 : $69, $9a, $cc
	sta $20                                                  ; $c0ec : $85, $20
	jsr Func_4_bfae.l                                                  ; $c0ee : $22, $ae, $bf, $04
	jsr Call_13_c588.w                                                  ; $c0f2 : $20, $88, $c5
	jsr Func_4_ca30.l                                                  ; $c0f5 : $22, $30, $ca, $04
	sep #ACCU_8                                                 ; $c0f9 : $e2, $20
	ldx StageEnemyEntity.substate                                                  ; $c0fb : $a6, $02
	jsr (@substates.w, X)                                                  ; $c0fd : $fc, $04, $c1
	jmp Func_2_d611.l                                                  ; $c100 : $5c, $11, $d6, $02

@substates:
	.dw CapsuleMainSubstate0
	.dw CapsuleMainSubstate1
	.dw CapsuleMainSubstate2
	.dw CapsuleMainSubstate3
	.dw CapsuleMainSubstate4


CapsuleMainSubstate0:
	ldx StageEnemyEntity.subsubstate                                                  ; $c10e : $a6, $03
	bne @cont_c12e                                                 ; $c110 : $d0, $1c

	inc StageEnemyEntity.subsubstate                                                  ; $c112 : $e6, $03
	rep #ACCU_8                                                  ; $c114 : $c2, $20
	lda #$0200.w                                                  ; $c116 : $a9, $00, $02
	sta $1c                                                  ; $c119 : $85, $1c
	lda #$2c00.w                                                  ; $c11b : $a9, $00, $2c
	sta $29                                                  ; $c11e : $85, $29
	sep #ACCU_8                                                  ; $c120 : $e2, $20
	lda #$40.b                                                  ; $c122 : $a9, $40
	jsr Func_4_d577.l                                                  ; $c124 : $22, $77, $d5, $04
	lda #$00.b                                                  ; $c128 : $a9, $00
	jsr Func_4_b967.l                                                  ; $c12a : $22, $67, $b9, $04

@cont_c12e:
	jsr Func_4_be4f.l                                                  ; $c12e : $22, $4f, $be, $04
	cmp #$33.b                                                  ; $c132 : $c9, $33
	bcs @cont_c13c                                                  ; $c134 : $b0, $06

	lda #$02.b                                                  ; $c136 : $a9, $02
	sta $02                                                  ; $c138 : $85, $02
	stz StageEnemyEntity.subsubstate                                                  ; $c13a : $64, $03

@cont_c13c:
	jsr Func_2_d812.l                                                  ; $c13c : $22, $12, $d8, $02
	jsr Func_4_b94a.l                                                  ; $c140 : $22, $4a, $b9, $04
	rts                                                  ; $c144 : $60


CapsuleMainSubstate1:
	ldx StageEnemyEntity.subsubstate                                                  ; $c145 : $a6, $03
	bne @cont_c151                                                  ; $c147 : $d0, $08

	inc StageEnemyEntity.subsubstate                                                  ; $c149 : $e6, $03
	lda #$00.b                                                  ; $c14b : $a9, $00
	jsr Func_4_b967.l                                                  ; $c14d : $22, $67, $b9, $04

@cont_c151:
	lda $0a8e.w                                                  ; $c151 : $ad, $8e, $0a
	bne @cont_c1b4                                                  ; $c154 : $d0, $5e

	lda #$b6.b                                                  ; $c156 : $a9, $b6
	sta $20                                                  ; $c158 : $85, $20
	lda #$cc.b                                                  ; $c15a : $a9, $cc
	sta $21                                                  ; $c15c : $85, $21
	jsr Func_4_cb31.l                                                  ; $c15e : $22, $31, $cb, $04
	beq @cont_c1b4                                                  ; $c162 : $f0, $50

	lda #$f1.b                                                  ; $c164 : $a9, $f1
	jsr Func_0_856d.l                                                  ; $c166 : $22, $6d, $85, $00
	inc $1f4f.w                                                  ; $c16a : $ee, $4f, $1f
	lda #$04.b                                                  ; $c16d : $a9, $04
	sta $02                                                  ; $c16f : $85, $02
	stz StageEnemyEntity.subsubstate                                                  ; $c171 : $64, $03
.ifdef HACK
; Prevent player freezing so they can go in the capsule
	nop
	nop
	nop
	nop
.else
	jsr todo_CausePlayerToFreeze.l                                                  ; $c173 : $22, $ca, $d1, $04
.endif
	rep #ACCU_8                                                  ; $c177 : $c2, $20
	lda $1e6e.w                                                  ; $c179 : $ad, $6e, $1e
	sta $7ff000.l                                                  ; $c17c : $8f, $00, $f0, $7f
	lda $1e70.w                                                  ; $c180 : $ad, $70, $1e
	sta $7ff002.l                                                  ; $c183 : $8f, $02, $f0, $7f
	lda $1e78.w                                                  ; $c187 : $ad, $78, $1e
	sta $7ff004.l                                                  ; $c18a : $8f, $04, $f0, $7f
	lda $1e7e.w                                                  ; $c18e : $ad, $7e, $1e
	sta $7ff006.l                                                  ; $c191 : $8f, $06, $f0, $7f

;
	lda wStageIdx.w                                                  ; $c195 : $ad, $ae, $1f
	and #$00ff.w                                                  ; $c198 : $29, $ff, $00
	asl                                                  ; $c19b : $0a
	asl                                                  ; $c19c : $0a
	tax                                                  ; $c19d : $aa

.ifdef HACK
; Prevent camera snapping in on capsule (as it requires text to snap back)
	bra @cont_c1b4
	nop
.else
;
	lda todo_StageCameraDataForCapsules.w, X                                                  ; $c19e : $bd, $9f, $cd
.endif
	beq @cont_c1b2                                                  ; $c1a1 : $f0, $0f

	sta $1e6e.w                                                  ; $c1a3 : $8d, $6e, $1e
	sta $1e70.w                                                  ; $c1a6 : $8d, $70, $1e

;
	lda todo_StageCameraDataForCapsules.w+2, X                                                  ; $c1a9 : $bd, $a1, $cd
	sta $1e78.w                                                  ; $c1ac : $8d, $78, $1e
	sta $1e7e.w                                                  ; $c1af : $8d, $7e, $1e

@cont_c1b2:
	sep #ACCU_8                                                  ; $c1b2 : $e2, $20

@cont_c1b4:
	jsr Func_4_b94a.l                                                  ; $c1b4 : $22, $4a, $b9, $04
	rts                                                  ; $c1b8 : $60


CapsuleMainSubstate2:
	ldx StageEnemyEntity.subsubstate                                                  ; $c1b9 : $a6, $03
	jmp (@subsubstates.w, X)                                                  ; $c1bb : $7c, $be, $c1

@subsubstates:
	.dw CapsuleMainSubstate2SubSubstate0
	.dw CapsuleMainSubstate2SubSubstate1
	.dw CapsuleMainSubstate2SubSubstate2


CapsuleMainSubstate2SubSubstate0:
; go to next substate if stage 0, 2, 9, b, c, d, e
	rep #ACCU_8                                                  ; $c1c4 : $c2, $20
	lda wStageIdx.w                                                  ; $c1c6 : $ad, $ae. $1f
	and #$00ff.w                                                  ; $c1c9 : $29, $ff, $00
	asl                                                  ; $c1cc : $0a
	asl                                                  ; $c1cd : $0a
	tax                                                  ; $c1ce : $aa
	lda todo_StageCameraDataForCapsules.w, X                                                  ; $c1cf : $bd, $9f, $cd
	beq @toNextSubSubstate                                                  ; $c1d2 : $f0, $13

; go to next subsubstate once scrolling is done
	lda wNewStageScrollX.w                                                  ; $c1d4 : $ad, $5d, $1e
	cmp wPrevStageScrollX.w                                                  ; $c1d7 : $cd, $7a, $1e
	bne @done                                                  ; $c1da : $d0, $08

	lda wNewStageScrollY.w                                                  ; $c1dc : $ad, $60, $1e
	cmp wPrevStageScrollY.w                                                  ; $c1df : $cd, $7c, $1e
	beq @toNextSubSubstate                                                  ; $c1e2 : $f0, $03

@done:
	sep #ACCU_8                                                  ; $c1e4 : $e2, $20
	rts                                                  ; $c1e6 : $60

@toNextSubSubstate:
	sep #ACCU_8                                                  ; $c1e7 : $e2, $20
	lda #$02.b                                                  ; $c1e9 : $a9, $02
	sta StageEnemyEntity.subsubstate                                                  ; $c1eb : $85, $03
	rts                                                  ; $c1ed : $60


CapsuleMainSubstate2SubSubstate1:
; to next subsubstate
	lda #$04.b                                                  ; $c1ee : $a9, $04
	sta StageEnemyEntity.subsubstate                                                  ; $c1f0 : $85, $03

;
	lda #$5c.b                                                  ; $c1f2 : $a9, $5c
	jsr Func_1_8000.l                                                  ; $c1f4 : $22, $00, $80, $01
	lda #$01.b                                                  ; $c1f8 : $a9, $01
	jsr Func_4_b967.l                                                  ; $c1fa : $22, $67, $b9, $04

CapsuleMainSubstate2SubSubstate2:
	lda $0f                                                  ; $c1fe : $a5, $0f
	bpl @br_c20f                                                  ; $c200 : $10, $0d

	lda #$06.b                                                  ; $c202 : $a9, $06
	sta $02                                                  ; $c204 : $85, $02
	stz StageEnemyEntity.subsubstate                                                 ; $c206 : $64, $03
	jsr Func_4_d4bf.l                                                  ; $c208 : $22, $bf, $d4, $04
.ifdef HACK
; Prevent guy (and therefore text) from spawning
	rts
	nop
	nop
.else
	jmp Jump_13_c591.w                                                  ; $c20c : $4c, $91, $c5
.endif
@br_c20f:
	jsr Func_4_b94a.l                                                  ; $c20f : $22, $4a, $b9, $04
	rts                                                  ; $c213 : $60


CapsuleMainSubstate3:
	ldx StageEnemyEntity.subsubstate                                                  ; $c214 : $a6, $03
	bne @br_c237                                                  ; $c216 : $d0, $1f

	lda $7fcfff.l                                                  ; $c218 : $af, $ff, $cf, $7f
	beq @br_c22f                                                  ; $c21c : $f0, $11

; substate 4, subsubstate 5
	lda #$08.b                                                  ; $c21e : $a9, $08
	sta StageEnemyEntity.substate                                                  ; $c220 : $85, $02
	lda #$10.b                                                  ; $c222 : $a9, $10
	sta StageEnemyEntity.subsubstate                                                  ; $c224 : $85, $03

;
	lda #$02.b                                                  ; $c226 : $a9, $02
	jsr Func_4_b967.l                                                  ; $c228 : $22, $67, $b9, $04
	jmp CapsuleMainSubstate4.w                                                  ; $c22c : $4c, $61, $c2

@br_c22f:
	inc StageEnemyEntity.subsubstate                                                  ; $c22f : $e6, $03
	lda #$02.b                                                  ; $c231 : $a9, $02
	jsr Func_4_b967.l                                                  ; $c233 : $22, $67, $b9, $04

@br_c237:
	lda $7fcfff.l                                                  ; $c237 : $af, $ff, $cf, $7f
	bne @cont_c25c                                                  ; $c23b : $d0, $1f

	lda $0a8e.w                                                  ; $c23d : $ad, $8e, $0a
	bne @cont_c25c                                                  ; $c240 : $d0, $1a

	lda #$ba.b                                                  ; $c242 : $a9, $ba
	sta $20                                                  ; $c244 : $85, $20
	lda #$cc.b                                                  ; $c246 : $a9, $cc
	sta $21                                                  ; $c248 : $85, $21
	jsr Func_4_cb31.l                                                  ; $c24a : $22, $31, $cb, $04
	beq @cont_c25c                                                  ; $c24e : $f0, $0c

; substate 4, subsubstate 0
	lda #$08.b                                                  ; $c250 : $a9, $08
	sta StageEnemyEntity.substate                                                  ; $c252 : $85, $02
	stz StageEnemyEntity.subsubstate                                                  ; $c254 : $64, $03
	sta $0a08.w                                                  ; $c256 : $8d, $08, $0a
	inc $1f4f.w                                                  ; $c259 : $ee, $4f, $1f

@cont_c25c:
	jsr Func_4_b94a.l                                                  ; $c25c : $22, $4a, $b9, $04
	rts                                                  ; $c260 : $60


CapsuleMainSubstate4:
	ldx StageEnemyEntity.subsubstate                                                  ; $c261 : $a6, $03
	jmp ($c266.w, X)                                                  ; $c263 : $7c, $66, $c2


	sei                                                  ; $c266 : $78
	rep #$04.b                                                  ; $c267 : $c2, $04
	cmp $30, S                                                  ; $c269 : $c3, $30
	cmp $52, S                                                  ; $c26b : $c3, $52
	cmp $a2, S                                                  ; $c26d : $c3, $a2
	cmp $be, S                                                  ; $c26f : $c3, $be
	cmp $cf, S                                                  ; $c271 : $c3, $cf
	cmp $fb, S                                                  ; $c273 : $c3, $fb
	cmp $5c, S                                                  ; $c275 : $c3, $5c
	cpy $a9                                                  ; $c277 : $c4, $a9
	cop $85.b                                                  ; $c279 : $02, $85
	ora $c2, S                                                  ; $c27b : $03, $c2
	jsr $05a5.w                                                  ; $c27d : $20, $a5, $05
	sta wPlayerEntity.x.w                                                  ; $c280 : $8d, $dd, $09
	stz wJoy1CurrButtonsHeld.w                                                  ; $c283 : $9c, $a8, $00
	stz $00aa.w                                                  ; $c286 : $9c, $aa, $00
	stz $00ac.w                                                  ; $c289 : $9c, $ac, $00
	stz wDashAndSelCurrBtnsHeld.w                                                  ; $c28c : $9c, $0e, $0a
	stz wDashAndSelPrevBtnsHeld.w                                                  ; $c28f : $9c, $10, $0a
	sep #ACCU_8                                                  ; $c292 : $e2, $20
	lda #$14.b                                                  ; $c294 : $a9, $14
	sta $34                                                  ; $c296 : $85, $34
	inc $1f63.w                                                  ; $c298 : $ee, $63, $1f
	inc $1f45.w                                                  ; $c29b : $ee, $45, $1f
	stz $0a0b.w                                                  ; $c29e : $9c, $0b, $0a
	stz $0a30.w                                                  ; $c2a1 : $9c, $30, $0a
	stz $0a31.w                                                  ; $c2a4 : $9c, $31, $0a
	stz $0a32.w                                                  ; $c2a7 : $9c, $32, $0a
	stz $0a33.w                                                  ; $c2aa : $9c, $33, $0a
	stz $0a66.w                                                  ; $c2ad : $9c, $66, $0a
	stz $0a67.w                                                  ; $c2b0 : $9c, $67, $0a
	stz $1f32.w                                                  ; $c2b3 : $9c, $32, $1f
	stz $1f64.w                                                  ; $c2b6 : $9c, $64, $1f
	stz $1f35.w                                                  ; $c2b9 : $9c, $35, $1f
	lda #$04.b                                                  ; $c2bc : $a9, $04
	trb $0a7d.w                                                  ; $c2be : $1c, $7d, $0a
	lda #$04.b                                                  ; $c2c1 : $a9, $04
	sta $1f23.w                                                  ; $c2c3 : $8d, $23, $1f
	lda #$03.b                                                  ; $c2c6 : $a9, $03
	sta $0a3f.w                                                  ; $c2c8 : $8d, $3f, $0a
	ldx #$a030.w                                                  ; $c2cb : $a2, $30, $a0
	rti                                                  ; $c2ce : $40


	jsr Func_1_804a.l                                                  ; $c2cf : $22, $4a, $80, $01
	rep #IDX_8                                                  ; $c2d3 : $c2, $10
	ldy #$0100.w                                                  ; $c2d5 : $a0, $00, $01
	jsr Func_1_805b.l                                                  ; $c2d8 : $22, $5b, $80, $01
	sep #IDX_8                                                  ; $c2dc : $e2, $10
	jsr Func_4_d4bf.l                                                  ; $c2de : $22, $bf, $d4, $04
	jsr $048e81.l                                                  ; $c2e2 : $22, $81, $8e, $04
	lda #$1b.b                                                  ; $c2e6 : $a9, $1b
	jsr Func_1_8000.l                                                  ; $c2e8 : $22, $00, $80, $01
	jsr todo_CausePlayerToFreeze.l                                                  ; $c2ec : $22, $ca, $d1, $04
	stz $0a46.w                                                  ; $c2f0 : $9c, $46, $0a
	lda wDynamicSpriteTileDatasIdx.w                                                  ; $c2f3 : $ad, $18, $1f
	sta $7fcffe.l                                                  ; $c2f6 : $8f, $fe, $cf, $7f
	lda #$12.b                                                  ; $c2fa : $a9, $12
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $c2fc : $8d, $18, $1f
	jsr todo_HookAddThreadToDynamicallyLoadSpriteTileData.l                                                  ; $c2ff : $22, $dc, $b1, $00
	rts                                                  ; $c303 : $60


	dec $34                                                  ; $c304 : $c6, $34
	bne br_13_c32f                                                  ; $c306 : $d0, $27

	lda #$04.b                                                  ; $c308 : $a9, $04
	sta $03                                                  ; $c30a : $85, $03
	lda $7fcffe.l                                                  ; $c30c : $af, $fe, $cf, $7f
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $c310 : $8d, $18, $1f
	lda #$ff.b                                                  ; $c313 : $a9, $ff
	sta $34                                                  ; $c315 : $85, $34
	lda #$08.b                                                  ; $c317 : $a9, $08
	sta $39                                                  ; $c319 : $85, $39
	sta $38                                                  ; $c31b : $85, $38
	lda #$03.b                                                  ; $c31d : $a9, $03
	sta $3b                                                  ; $c31f : $85, $3b
	stz $3a                                                  ; $c321 : $64, $3a
	lda #$08.b                                                  ; $c323 : $a9, $08
	sta $37                                                  ; $c325 : $85, $37
	lda #$08.b                                                  ; $c327 : $a9, $08
	sta $36                                                  ; $c329 : $85, $36
	lda #$01.b                                                  ; $c32b : $a9, $01
	sta $35                                                  ; $c32d : $85, $35

br_13_c32f:
	rts                                                  ; $c32f : $60


	lda #$00.b                                                  ; $c330 : $a9, $00
	jsr Call_13_c46f.w                                                  ; $c332 : $20, $6f, $c4
	dec $34                                                  ; $c335 : $c6, $34
	bne br_13_c342                                                  ; $c337 : $d0, $09

	lda #$06.b                                                  ; $c339 : $a9, $06
	sta $03                                                  ; $c33b : $85, $03
	lda #$80.b                                                  ; $c33d : $a9, $80
	sta $34                                                  ; $c33f : $85, $34
	rts                                                  ; $c341 : $60


br_13_c342:
	lda $34                                                  ; $c342 : $a5, $34
	cmp #$14.b                                                  ; $c344 : $c9, $14
	bne br_13_c34d                                                  ; $c346 : $d0, $05

	lda #$00.b                                                  ; $c348 : $a9, $00
	jsr Call_13_c4f3.w                                                  ; $c34a : $20, $f3, $c4

br_13_c34d:
	ldx #$00.b                                                  ; $c34d : $a2, $00
	jmp Jump_13_c520.w                                                  ; $c34f : $4c, $20, $c5


	lda #$01.b                                                  ; $c352 : $a9, $01
	jsr Call_13_c46f.w                                                  ; $c354 : $20, $6f, $c4
	rep #ACCU_8|IDX_8                                                  ; $c357 : $c2, $30
	lda $7fcffc.l                                                  ; $c359 : $af, $fc, $cf, $7f
	tax                                                  ; $c35d : $aa
	sep #ACCU_8                                                  ; $c35e : $e2, $20
	lda $0000.w, X                                                  ; $c360 : $bd, $00, $00
	beq br_13_c36c                                                  ; $c363 : $f0, $07

	lda $0001.w, X                                                  ; $c365 : $bd, $01, $00
	cmp #$02.b                                                  ; $c368 : $c9, $02
	beq br_13_c39b                                                  ; $c36a : $f0, $2f

br_13_c36c:
	lda #$08.b                                                  ; $c36c : $a9, $08
	sta $03                                                  ; $c36e : $85, $03
	lda #$1e.b                                                  ; $c370 : $a9, $1e
	sta $34                                                  ; $c372 : $85, $34
	rep #ACCU_8|IDX_8                                                  ; $c374 : $c2, $30
	lda wStageIdx.w                                                  ; $c376 : $ad, $ae, $1f
	and #$00ff.w                                                  ; $c379 : $29, $ff, $00
	tax                                                  ; $c37c : $aa
	lda Data_6_ccfa.w, X                                                  ; $c37d : $bd, $fa, $cc
	and #$00ff.w                                                  ; $c380 : $29, $ff, $00
	cmp #$0004.w                                                  ; $c383 : $c9, $04, $00
	bmi br_13_c38d                                                  ; $c386 : $30, $05

	ldy #$00d6.w                                                  ; $c388 : $a0, $d6, $00
	bra br_13_c390                                                  ; $c38b : $80, $03

br_13_c38d:
	ldy #$0162.w                                                  ; $c38d : $a0, $62, $01

br_13_c390:
	jsr Func_1_805b.l                                                  ; $c390 : $22, $5b, $80, $01
	jsr $04b6d0.l                                                  ; $c394 : $22, $d0, $b6, $04
	sep #ACCU_8|IDX_8                                                  ; $c398 : $e2, $30
	rts                                                  ; $c39a : $60


br_13_c39b:
	sep #ACCU_8|IDX_8                                                  ; $c39b : $e2, $30
	ldx #$01.b                                                  ; $c39d : $a2, $01
	jmp Jump_13_c520.w                                                  ; $c39f : $4c, $20, $c5


	dec $34                                                  ; $c3a2 : $c6, $34
	bne br_13_c3bd                                                  ; $c3a4 : $d0, $17

	lda #$0a.b                                                  ; $c3a6 : $a9, $0a
	sta $03                                                  ; $c3a8 : $85, $03
	lda #$1e.b                                                  ; $c3aa : $a9, $1e
	sta $34                                                  ; $c3ac : $85, $34
	ldx wStageIdx.w                                                  ; $c3ae : $ae, $ae, $1f
	lda Data_6_ccfa.w, X                                                  ; $c3b1 : $bd, $fa, $cc
	cmp #$08.b                                                  ; $c3b4 : $c9, $08
	beq br_13_c3bd                                                  ; $c3b6 : $f0, $05

	lda #$01.b                                                  ; $c3b8 : $a9, $01
	jsr Call_13_c4f3.w                                                  ; $c3ba : $20, $f3, $c4

br_13_c3bd:
	rts                                                  ; $c3bd : $60


	dec $34                                                  ; $c3be : $c6, $34
	bne br_13_c3ce                                                  ; $c3c0 : $d0, $0c

	lda #$0c.b                                                  ; $c3c2 : $a9, $0c
	sta $03                                                  ; $c3c4 : $85, $03
	lda #$3c.b                                                  ; $c3c6 : $a9, $3c
	sta $34                                                  ; $c3c8 : $85, $34
	jsr $04d217.l                                                  ; $c3ca : $22, $17, $d2, $04

br_13_c3ce:
	rts                                                  ; $c3ce : $60


	dec $34                                                  ; $c3cf : $c6, $34
	bne br_13_c3fa                                                  ; $c3d1 : $d0, $27

	stz $0a08.w                                                  ; $c3d3 : $9c, $08, $0a
	lda #$0e.b                                                  ; $c3d6 : $a9, $0e
	sta $03                                                  ; $c3d8 : $85, $03
	stz $3c                                                  ; $c3da : $64, $3c
	lda #$01.b                                                  ; $c3dc : $a9, $01
	sta $3d                                                  ; $c3de : $85, $3d
	ldx #$05.b                                                  ; $c3e0 : $a2, $05

br_13_c3e2:
	lda wShotBtnMapped.l, X                                                  ; $c3e2 : $bf, $c0, $ff, $7e
	sta $7ff008.l, X                                                  ; $c3e6 : $9f, $08, $f0, $7f
	dex                                                  ; $c3ea : $ca
	bpl br_13_c3e2                                                  ; $c3eb : $10, $f5

	ldx #$05.b                                                  ; $c3ed : $a2, $05

br_13_c3ef:
	lda $06e0e3.l, X                                                  ; $c3ef : $bf, $e3, $e0, $06
	sta wShotBtnMapped.l, X                                                  ; $c3f3 : $9f, $c0, $ff, $7e
	dex                                                  ; $c3f7 : $ca
	bpl br_13_c3ef                                                  ; $c3f8 : $10, $f5

br_13_c3fa:
	rts                                                  ; $c3fa : $60


	dec $3d                                                  ; $c3fb : $c6, $3d
	bne br_13_c443                                                  ; $c3fd : $d0, $44

	ldx wStageIdx.w                                                  ; $c3ff : $ae, $ae, $1f
	lda $cd09.w, X                                                  ; $c402 : $bd, $09, $cd
	clc                                                  ; $c405 : $18
	adc $3c                                                  ; $c406 : $65, $3c
	tax                                                  ; $c408 : $aa
	lda $cd09.w, X                                                  ; $c409 : $bd, $09, $cd
	cmp #$ff.b                                                  ; $c40c : $c9, $ff
	bne br_13_c431                                                  ; $c40e : $d0, $21

	lda #$10.b                                                  ; $c410 : $a9, $10
	sta $03                                                  ; $c412 : $85, $03
	dec $1f63.w                                                  ; $c414 : $ce, $63, $1f
	dec $1f45.w                                                  ; $c417 : $ce, $45, $1f
	stz $0a08.w                                                  ; $c41a : $9c, $08, $0a
	dec $1f4f.w                                                  ; $c41d : $ce, $4f, $1f
	jsr Call_13_c5bd.w                                                  ; $c420 : $20, $bd, $c5
	ldx #$05.b                                                  ; $c423 : $a2, $05

br_13_c425:
	lda $7ff008.l, X                                                  ; $c425 : $bf, $08, $f0, $7f
	sta wShotBtnMapped.l, X                                                  ; $c429 : $9f, $c0, $ff, $7e
	dex                                                  ; $c42d : $ca
	bpl br_13_c425                                                  ; $c42e : $10, $f5

	rts                                                  ; $c430 : $60


br_13_c431:
	sta $3d                                                  ; $c431 : $85, $3d
	lda $cd0a.w, X                                                  ; $c433 : $bd, $0a, $cd
	sta $3e                                                  ; $c436 : $85, $3e
	lda $cd0b.w, X                                                  ; $c438 : $bd, $0b, $cd
	sta $3f                                                  ; $c43b : $85, $3f
	inc $3c                                                  ; $c43d : $e6, $3c
	inc $3c                                                  ; $c43f : $e6, $3c
	inc $3c                                                  ; $c441 : $e6, $3c

br_13_c443:
	rep #ACCU_8                                                  ; $c443 : $c2, $20
	lda wJoy1CurrButtonsHeld.w                                                  ; $c445 : $ad, $a8, $00
	sta $00aa.w                                                  ; $c448 : $8d, $aa, $00
	lda $3e                                                  ; $c44b : $a5, $3e
	sta wJoy1CurrButtonsHeld.w                                                  ; $c44d : $8d, $a8, $00
	eor $00aa.w                                                  ; $c450 : $4d, $aa, $00
	and wJoy1CurrButtonsHeld.w                                                  ; $c453 : $2d, $a8, $00
	sta $00ac.w                                                  ; $c456 : $8d, $ac, $00
	sep #ACCU_8                                                  ; $c459 : $e2, $20
	rts                                                  ; $c45b : $60


	jsr SetCarryIfEntityWayOutOfView.l                                                  ; $c45c : $22, $8a, $d5, $02
	bcc br_13_c466                                                  ; $c460 : $90, $04

	lda #$04.b                                                  ; $c462 : $a9, $04
	sta $01                                                  ; $c464 : $85, $01

br_13_c466:
	jsr Func_4_b94a.l                                                  ; $c466 : $22, $4a, $b9, $04
	rts                                                  ; $c46a : $60


CapsuleState2_Delete:
	jmp todo_DisablesEntity_d928.l                                                  ; $c46b : $5c, $28, $d9, $02


Call_13_c46f:
	sta $0000.w                                                  ; $c46f : $8d, $00, $00
	dec $36                                                  ; $c472 : $c6, $36
	bne br_13_c4d8                                                  ; $c474 : $d0, $62

	lda #$09.b                                                  ; $c476 : $a9, $09
	sec                                                  ; $c478 : $38
	sbc $35                                                  ; $c479 : $e5, $35
	sta $36                                                  ; $c47b : $85, $36
	dec $37                                                  ; $c47d : $c6, $37
	bne br_13_c48e                                                  ; $c47f : $d0, $0d

	lda $0000.w                                                  ; $c481 : $ad, $00, $00
	bne br_13_c48b                                                  ; $c484 : $d0, $05

	jsr Call_13_c4d9.w                                                  ; $c486 : $20, $d9, $c4
	bra br_13_c48e                                                  ; $c489 : $80, $03

br_13_c48b:
	jsr Call_13_c4e6.w                                                  ; $c48b : $20, $e6, $c4

br_13_c48e:
	rep #IDX_8                                                  ; $c48e : $c2, $10
	ldy #$0003.w                                                  ; $c490 : $a0, $03, $00

br_13_c493:
	jsr $02d859.l                                                  ; $c493 : $22, $59, $d8, $02
	bne br_13_c4d6                                                  ; $c497 : $d0, $3d

	inc $0000.w, X                                                  ; $c499 : $fe, $00, $00
	lda #$39.b                                                  ; $c49c : $a9, $39
	sta $000a.w, X                                                  ; $c49e : $9d, $0a, $00
	lda $11                                                  ; $c4a1 : $a5, $11
	sta $0011.w, X                                                  ; $c4a3 : $9d, $11, $00
	lda $18                                                  ; $c4a6 : $a5, $18
	sta $0018.w, X                                                  ; $c4a8 : $9d, $18, $00
	lda $35                                                  ; $c4ab : $a5, $35
	sta $000b.w, X                                                  ; $c4ad : $9d, $0b, $00
	rep #ACCU_8|F_CARRY                                                  ; $c4b0 : $c2, $21
	lda $08                                                  ; $c4b2 : $a5, $08
	adc #$ffe8.w                                                  ; $c4b4 : $69, $e8, $ff
	sta $0008.w, X                                                  ; $c4b7 : $9d, $08, $00
	jsr Func_4_be35.l                                                  ; $c4ba : $22, $35, $be, $04
	and #$001f.w                                                  ; $c4be : $29, $1f, $00
	sta $0000.w                                                  ; $c4c1 : $8d, $00, $00
	lda $05                                                  ; $c4c4 : $a5, $05
	clc                                                  ; $c4c6 : $18
	adc #$fff0.w                                                  ; $c4c7 : $69, $f0, $ff
	clc                                                  ; $c4ca : $18
	adc $0000.w                                                  ; $c4cb : $6d, $00, $00
	sta $0005.w, X                                                  ; $c4ce : $9d, $05, $00
	sep #ACCU_8                                                  ; $c4d1 : $e2, $20
	dey                                                  ; $c4d3 : $88
	bpl br_13_c493                                                  ; $c4d4 : $10, $bd

br_13_c4d6:
	sep #IDX_8                                                  ; $c4d6 : $e2, $10

br_13_c4d8:
	rts                                                  ; $c4d8 : $60


Call_13_c4d9:
	lda $35                                                  ; $c4d9 : $a5, $35
	cmp #$07.b                                                  ; $c4db : $c9, $07
	beq br_13_c4e1                                                  ; $c4dd : $f0, $02

	inc $35                                                  ; $c4df : $e6, $35

br_13_c4e1:
	lda #$03.b                                                  ; $c4e1 : $a9, $03
	sta $37                                                  ; $c4e3 : $85, $37
	rts                                                  ; $c4e5 : $60


Call_13_c4e6:
	lda $35                                                  ; $c4e6 : $a5, $35
	cmp #$01.b                                                  ; $c4e8 : $c9, $01
	beq br_13_c4ee                                                  ; $c4ea : $f0, $02

	dec $35                                                  ; $c4ec : $c6, $35

br_13_c4ee:
	lda #$01.b                                                  ; $c4ee : $a9, $01
	sta $37                                                  ; $c4f0 : $85, $37
	rts                                                  ; $c4f2 : $60


Call_13_c4f3:
	sta $0000.w                                                  ; $c4f3 : $8d, $00, $00
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $c4f6 : $22, $a7, $d8, $02
	bne @done                                                  ; $c4fa : $d0, $21

	inc $0000.w, X                                                  ; $c4fc : $fe, $00, $00
	lda #$4e.b                                                  ; $c4ff : $a9, $4e
	sta $000a.w, X                                                  ; $c501 : $9d, $0a, $00
	lda $0000.w                                                  ; $c504 : $ad, $00, $00
	sta $0003.w, X                                                  ; $c507 : $9d, $03, $00
	lda wStageIdx.w                                                  ; $c50a : $ad, $ae, $1f
	and #$ff.b                                                  ; $c50d : $29, $ff
	tay                                                  ; $c50f : $a8
	lda Data_6_ccfa.w, Y                                                  ; $c510 : $b9, $fa, $cc
	sta $000b.w, X                                                  ; $c513 : $9d, $0b, $00
	rep #ACCU_8                                                  ; $c516 : $c2, $20
	txa                                                  ; $c518 : $8a
	sta $7fcffc.l                                                  ; $c519 : $8f, $fc, $cf, $7f

@done:
	sep #ACCU_8|IDX_8                                                  ; $c51d : $e2, $30
	rts                                                  ; $c51f : $60


Jump_13_c520:
	dec $38                                                  ; $c520 : $c6, $38
	bne br_13_c575                                                  ; $c522 : $d0, $51

	lda $39                                                  ; $c524 : $a5, $39
	sta $38                                                  ; $c526 : $85, $38
	dec $3b                                                  ; $c528 : $c6, $3b
	bne br_13_c53b                                                  ; $c52a : $d0, $0f

	lda #$03.b                                                  ; $c52c : $a9, $03
	sta $3b                                                  ; $c52e : $85, $3b
	txa                                                  ; $c530 : $8a
	beq br_13_c538                                                  ; $c531 : $f0, $05

	jsr Call_13_c57f.w                                                  ; $c533 : $20, $7f, $c5
	bra br_13_c53b                                                  ; $c536 : $80, $03

br_13_c538:
	jsr Call_13_c576.w                                                  ; $c538 : $20, $76, $c5

br_13_c53b:
	lda $3a                                                  ; $c53b : $a5, $3a
	ina                                                  ; $c53d : $1a
	and #$03.b                                                  ; $c53e : $29, $03
	sta $3a                                                  ; $c540 : $85, $3a
	sta $0000.w                                                  ; $c542 : $8d, $00, $00
	stz $0001.w                                                  ; $c545 : $9c, $01, $00
	ldx wStageIdx.w                                                  ; $c548 : $ae, $ae, $1f
	lda Data_6_ccfa.w, X                                                  ; $c54b : $bd, $fa, $cc
	rep #ACCU_8|IDX_8|F_CARRY                                                  ; $c54e : $c2, $31
	and #$00ff.w                                                  ; $c550 : $29, $ff, $00
	cmp #$0004.w                                                  ; $c553 : $c9, $04, $00
	bmi br_13_c55d                                                  ; $c556 : $30, $05

	lda #$00d6.w                                                  ; $c558 : $a9, $d6, $00
	bra br_13_c560                                                  ; $c55b : $80, $03

br_13_c55d:
	lda #$0162.w                                                  ; $c55d : $a9, $62, $01

br_13_c560:
	sta $0002.w                                                  ; $c560 : $8d, $02, $00
	lda $0000.w                                                  ; $c563 : $ad, $00, $00
	and #$00ff.w                                                  ; $c566 : $29, $ff, $00
	asl                                                  ; $c569 : $0a
	clc                                                  ; $c56a : $18
	adc $0002.w                                                  ; $c56b : $6d, $02, $00
	tay                                                  ; $c56e : $a8
	jsr Func_1_805b.l                                                  ; $c56f : $22, $5b, $80, $01
	sep #ACCU_8|IDX_8                                                  ; $c573 : $e2, $30

br_13_c575:
	rts                                                  ; $c575 : $60


Call_13_c576:
	lda $39                                                  ; $c576 : $a5, $39
	cmp #$01.b                                                  ; $c578 : $c9, $01
	beq br_13_c57e                                                  ; $c57a : $f0, $02

	dec $39                                                  ; $c57c : $c6, $39

br_13_c57e:
	rts                                                  ; $c57e : $60


Call_13_c57f:
	lda $39                                                  ; $c57f : $a5, $39
	cmp #$08.b                                                  ; $c581 : $c9, $08
	beq br_13_c587                                                  ; $c583 : $f0, $02

	inc $39                                                  ; $c585 : $e6, $39

br_13_c587:
	rts                                                  ; $c587 : $60


Call_13_c588:
	lda $20                                                  ; $c588 : $a5, $20
	clc                                                  ; $c58a : $18
	adc #$10.b                                                  ; $c58b : $69, $10
	.db $00                                                  ; $c58d : $00
	sta $20                                                  ; $c58e : $85, $20
	rts                                                  ; $c590 : $60


Jump_13_c591:
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $c591 : $22, $a7, $d8, $02
	bne br_13_c5ba                                                  ; $c595 : $d0, $23

	inc StageEnemyEntity.enabled.w, X                                                  ; $c597 : $fe, $00, $00
	lda #$5c.b                                                  ; $c59a : $a9, $5c
	sta StageEnemyEntity.type.w, X                                                  ; $c59c : $9d, $0a, $00
	lda $11                                                  ; $c59f : $a5, $11
	sta $0011.w, X                                                  ; $c5a1 : $9d, $11, $00
	lda $7fcfff.l                                                  ; $c5a4 : $af, $ff, $cf, $7f
	sta $000b.w, X                                                  ; $c5a8 : $9d, $0b, $00
	rep #ACCU_8|F_CARRY                                                  ; $c5ab : $c2, $21
	lda $08                                                  ; $c5ad : $a5, $08
	adc #$000a.w                                                  ; $c5af : $69, $0a, $00
	sta $0008.w, X                                                  ; $c5b2 : $9d, $08, $00
	lda $05                                                  ; $c5b5 : $a5, $05
	sta $0005.w, X                                                  ; $c5b7 : $9d, $05, $00

br_13_c5ba:
	sep #ACCU_8|IDX_8                                                  ; $c5ba : $e2, $30
	rts                                                  ; $c5bc : $60


Call_13_c5bd:
	ldx wStageIdx.w                                                  ; $c5bd : $ae, $ae, $1f
	lda Data_6_ccfa.w, X                                                  ; $c5c0 : $bd, $fa, $cc
	asl                                                  ; $c5c3 : $0a
	tax                                                  ; $c5c4 : $aa
	jmp ($c5c8.w, X)                                                  ; $c5c5 : $7c, $c8, $c5


	stp                                                  ; $c5c8 : $db
	cmp $da                                                  ; $c5c9 : $c5, $da
	cmp $e9                                                  ; $c5cb : $c5, $e9
	cmp $da                                                  ; $c5cd : $c5, $da
	cmp $da                                                  ; $c5cf : $c5, $da
	cmp $da                                                  ; $c5d1 : $c5, $da
	cmp $f3                                                  ; $c5d3 : $c5, $f3
	cmp $da                                                  ; $c5d5 : $c5, $da
	cmp $da                                                  ; $c5d7 : $c5, $da
	cmp $60                                                  ; $c5d9 : $c5, $60
	inc $1f45.w                                                  ; $c5db : $ee, $45, $1f
	inc $1f4f.w                                                  ; $c5de : $ee, $4f, $1f
	inc $0a55.w                                                  ; $c5e1 : $ee, $55, $0a
	jsr $04a805.l                                                  ; $c5e4 : $22, $05, $a8, $04
	rts                                                  ; $c5e8 : $60


	lda #$80.b                                                  ; $c5e9 : $a9, $80
	tsb $1fff.w                                                  ; $c5eb : $0c, $ff, $1f
	jsr $0487f6.l                                                  ; $c5ee : $22, $f6, $87, $04
	rts                                                  ; $c5f2 : $60


	lda #$20.b                                                  ; $c5f3 : $a9, $20
	tsb $1fff.w                                                  ; $c5f5 : $0c, $ff, $1f
	jsr $0487f6.l                                                  ; $c5f8 : $22, $f6, $87, $04
	rts                                                  ; $c5fc : $60


	ldx $01                                                  ; $c5fd : $a6, $01
	jsr ($c603.w, X)                                                  ; $c5ff : $fc, $03, $c6
	rtl                                                  ; $c602 : $6b


	ora $c7c5c6.l                                                  ; $c603 : $0f, $c6, $c5, $c7
	lda $8bcc.w, Y                                                  ; $c607 : $b9, $cc, $8b
	cmp [$98]                                                  ; $c60a : $c7, $98
	cmp [$9e]                                                  ; $c60c : $c7, $9e
	cmp [$a6]                                                  ; $c60e : $c7, $a6
	cop $fc.b                                                  ; $c610 : $02, $fc
	ora $c6, X                                                  ; $c612 : $15, $c6
	rts                                                  ; $c614 : $60


	and $c6, S                                                  ; $c615 : $23, $c6
	tcd                                                  ; $c617 : $5b
	dec $ac                                                  ; $c618 : $c6, $ac
	dec $e6                                                  ; $c61a : $c6, $e6
	dec $15                                                  ; $c61c : $c6, $15
	cmp [$3c]                                                  ; $c61e : $c7, $3c
	cmp [$63]                                                  ; $c620 : $c7, $63
	cmp [$a0]                                                  ; $c622 : $c7, $a0
	ora ($a9, X)                                                  ; $c624 : $01, $a9
	inc $22, X                                                  ; $c626 : $f6, $22
	adc $0085.w                                                  ; $c628 : $6d, $85, $00
	jsr Func_2_e15c.l                                                  ; $c62b : $22, $5c, $e1, $02
	lda #$02.b                                                  ; $c62f : $a9, $02
	sta $02                                                  ; $c631 : $85, $02
	stz $01                                                  ; $c633 : $64, $01
	stz $03                                                  ; $c635 : $64, $03
	stz $37                                                  ; $c637 : $64, $37
	jsr todo_CausePlayerToFreeze.l                                                  ; $c639 : $22, $ca, $d1, $04
	lda #$00.b                                                  ; $c63d : $a9, $00
	sta $7fcd90.l                                                  ; $c63f : $8f, $90, $cd, $7f
	jsr Call_13_d1ed.w                                                  ; $c643 : $20, $ed, $d1
	ldy #$01.b                                                  ; $c646 : $a0, $01
	jsr Call_13_cd2d.w                                                  ; $c648 : $20, $2d, $cd
	ldy #$02.b                                                  ; $c64b : $a0, $02
	jsr Call_13_cd2d.w                                                  ; $c64d : $20, $2d, $cd
	ldy #$03.b                                                  ; $c650 : $a0, $03
	jsr Call_13_cd2d.w                                                  ; $c652 : $20, $2d, $cd
	ldy #$04.b                                                  ; $c655 : $a0, $04
	jsr Call_13_cd2d.w                                                  ; $c657 : $20, $2d, $cd
	rts                                                  ; $c65a : $60


	lda #$06.b                                                  ; $c65b : $a9, $06
	sta $26                                                  ; $c65d : $85, $26
	stz $27                                                  ; $c65f : $64, $27
	stz $18                                                  ; $c661 : $64, $18
	lda #$0c.b                                                  ; $c663 : $a9, $0c
	sta $12                                                  ; $c665 : $85, $12
	stz $2f                                                  ; $c667 : $64, $2f
	lda #$09.b                                                  ; $c669 : $a9, $09
	sta $11                                                  ; $c66b : $85, $11
	sta $38                                                  ; $c66d : $85, $38
	lda $28                                                  ; $c66f : $a5, $28
	sta $1f57.w                                                  ; $c671 : $8d, $57, $1f
	rep #ACCU_8|F_CARRY                                                  ; $c674 : $c2, $21
	lda #$00d0.w                                                  ; $c676 : $a9, $d0, $00
	adc wNewStageScrollX.w                                                  ; $c679 : $6d, $5d, $1e
	sta $05                                                  ; $c67c : $85, $05
	lda #$0040.w                                                  ; $c67e : $a9, $40, $00
	clc                                                  ; $c681 : $18
	adc wNewStageScrollY.w                                                  ; $c682 : $6d, $60, $1e
	sta $08                                                  ; $c685 : $85, $08
	lda #$ce57.w                                                  ; $c687 : $a9, $57, $ce
	sta $20                                                  ; $c68a : $85, $20
	lda #$fd00.w                                                  ; $c68c : $a9, $00, $fd
	sta $1c                                                  ; $c68f : $85, $1c
	stz $1a                                                  ; $c691 : $64, $1a
	tdc                                                  ; $c693 : $7b
	sta $1f1f.w                                                  ; $c694 : $8d, $1f, $1f
	sta $7fcd98.l                                                  ; $c697 : $8f, $98, $cd, $7f
	sep #ACCU_8                                                  ; $c69b : $e2, $20
	lda #$04.b                                                  ; $c69d : $a9, $04
	sta $02                                                  ; $c69f : $85, $02
	lda #$01.b                                                  ; $c6a1 : $a9, $01
	sta $7fcd91.l                                                  ; $c6a3 : $8f, $91, $cd, $7f
	lda #$1e.b                                                  ; $c6a7 : $a9, $1e
	sta $39                                                  ; $c6a9 : $85, $39
	rts                                                  ; $c6ab : $60


	dec $39                                                  ; $c6ac : $c6, $39
	bne br_13_c6e5                                                  ; $c6ae : $d0, $35

	lda #$02.b                                                  ; $c6b0 : $a9, $02
	sta $39                                                  ; $c6b2 : $85, $39
	lda $27                                                  ; $c6b4 : $a5, $27
	and #$7f.b                                                  ; $c6b6 : $29, $7f
	cmp #$20.b                                                  ; $c6b8 : $c9, $20
	beq br_13_c6c8                                                  ; $c6ba : $f0, $0c

	ina                                                  ; $c6bc : $1a
	ora #$80.b                                                  ; $c6bd : $09, $80
	sta $27                                                  ; $c6bf : $85, $27
	lda #$15.b                                                  ; $c6c1 : $a9, $15
	jsr $01802b.l                                                  ; $c6c3 : $22, $2b, $80, $01
	rts                                                  ; $c6c7 : $60


br_13_c6c8:
	lda #$02.b                                                  ; $c6c8 : $a9, $02
	sta $01                                                  ; $c6ca : $85, $01
	stz $02                                                  ; $c6cc : $64, $02
	stz $03                                                  ; $c6ce : $64, $03
	ldy #$0c.b                                                  ; $c6d0 : $a0, $0c
	jsr Call_13_cf6b.w                                                  ; $c6d2 : $20, $6b, $cf
	jsr $04d1ef.l                                                  ; $c6d5 : $22, $ef, $d1, $04
	lda #$1a.b                                                  ; $c6d9 : $a9, $1a
	jsr Func_0_84bc.l                                                  ; $c6db : $22, $bc, $84, $00
	lda #$00.b                                                  ; $c6df : $a9, $00
	sta $7fcd91.l                                                  ; $c6e1 : $8f, $91, $cd, $7f

br_13_c6e5:
	rts                                                  ; $c6e5 : $60


	jsr Func_2_e15c.l                                                  ; $c6e6 : $22, $5c, $e1, $02
	lda #$0d.b                                                  ; $c6ea : $a9, $0d
	jsr Func_4_b967.l                                                  ; $c6ec : $22, $67, $b9, $04
	stz $2f                                                  ; $c6f0 : $64, $2f
	jsr Call_13_ce4e.w                                                  ; $c6f2 : $20, $4e, $ce
	lda $11                                                  ; $c6f5 : $a5, $11
	sta $38                                                  ; $c6f7 : $85, $38
	rep #ACCU_8                                                  ; $c6f9 : $c2, $20
	lda #$ce61.w                                                  ; $c6fb : $a9, $61, $ce
	sta $20                                                  ; $c6fe : $85, $20
	sep #ACCU_8                                                  ; $c700 : $e2, $20
	lda #$02.b                                                  ; $c702 : $a9, $02
	sta $02                                                  ; $c704 : $85, $02
	lda #$08.b                                                  ; $c706 : $a9, $08
	sta $12                                                  ; $c708 : $85, $12
	lda #$00.b                                                  ; $c70a : $a9, $00
	sta $7fcd96.l                                                  ; $c70c : $8f, $96, $cd, $7f
	sta $7fcd97.l                                                  ; $c710 : $8f, $97, $cd, $7f
	rts                                                  ; $c714 : $60


	jsr Func_2_e15c.l                                                  ; $c715 : $22, $5c, $e1, $02
	lda #$15.b                                                  ; $c719 : $a9, $15
	jsr Func_4_b967.l                                                  ; $c71b : $22, $67, $b9, $04
	lda #$01.b                                                  ; $c71f : $a9, $01
	sta $30                                                  ; $c721 : $85, $30
	jsr Call_13_ce4e.w                                                  ; $c723 : $20, $4e, $ce
	lda #$0d.b                                                  ; $c726 : $a9, $0d
	sta $28                                                  ; $c728 : $85, $28
	lda #$06.b                                                  ; $c72a : $a9, $06
	sta $12                                                  ; $c72c : $85, $12
	rep #ACCU_8                                                  ; $c72e : $c2, $20
	lda #$ce6b.w                                                  ; $c730 : $a9, $6b, $ce
	sta $20                                                  ; $c733 : $85, $20
	sep #ACCU_8                                                  ; $c735 : $e2, $20
	lda #$04.b                                                  ; $c737 : $a9, $04
	sta $02                                                  ; $c739 : $85, $02
	rts                                                  ; $c73b : $60


	jsr Func_2_e15c.l                                                  ; $c73c : $22, $5c, $e1, $02
	lda #$01.b                                                  ; $c740 : $a9, $01
	jsr Func_4_b967.l                                                  ; $c742 : $22, $67, $b9, $04
	lda #$01.b                                                  ; $c746 : $a9, $01
	sta $30                                                  ; $c748 : $85, $30
	jsr Call_13_ce4e.w                                                  ; $c74a : $20, $4e, $ce
	lda #$20.b                                                  ; $c74d : $a9, $20
	sta $26                                                  ; $c74f : $85, $26
	lda #$06.b                                                  ; $c751 : $a9, $06
	sta $12                                                  ; $c753 : $85, $12
	rep #ACCU_8                                                  ; $c755 : $c2, $20
	lda #$ce75.w                                                  ; $c757 : $a9, $75, $ce
	sta $20                                                  ; $c75a : $85, $20
	sep #ACCU_8                                                  ; $c75c : $e2, $20
	lda #$06.b                                                  ; $c75e : $a9, $06
	sta $02                                                  ; $c760 : $85, $02
	rts                                                  ; $c762 : $60


	jsr Func_2_e15c.l                                                  ; $c763 : $22, $5c, $e1, $02
	lda #$00.b                                                  ; $c767 : $a9, $00
	jsr Func_4_b967.l                                                  ; $c769 : $22, $67, $b9, $04
	lda #$01.b                                                  ; $c76d : $a9, $01
	sta $30                                                  ; $c76f : $85, $30
	jsr Call_13_ce4e.w                                                  ; $c771 : $20, $4e, $ce
	lda #$02.b                                                  ; $c774 : $a9, $02
	sta $12                                                  ; $c776 : $85, $12
	rep #ACCU_8                                                  ; $c778 : $c2, $20
	lda #$ce7f.w                                                  ; $c77a : $a9, $7f, $ce
	sta $20                                                  ; $c77d : $85, $20
	lda #$0080.w                                                  ; $c77f : $a9, $80, $00
	sta $1a                                                  ; $c782 : $85, $1a
	sep #ACCU_8                                                  ; $c784 : $e2, $20
	lda #$08.b                                                  ; $c786 : $a9, $08
	sta $02                                                  ; $c788 : $85, $02
	rts                                                  ; $c78a : $60


	lda $33                                                  ; $c78b : $a5, $33
	bmi br_13_c793                                                  ; $c78d : $30, $04

	dec $30                                                  ; $c78f : $c6, $30
	bne br_13_c7c5                                                  ; $c791 : $d0, $32

br_13_c793:
	jsr Func_2_db3f.l                                                  ; $c793 : $22, $3f, $db, $02
	rts                                                  ; $c797 : $60


	lda #$02.b                                                  ; $c798 : $a9, $02
	sta $02                                                  ; $c79a : $85, $02
	bra br_13_c7c5                                                  ; $c79c : $80, $27

	jsr Func_2_ddfe.l                                                  ; $c79e : $22, $fe, $dd, $02
	lda $0b                                                  ; $c7a2 : $a5, $0b
	beq br_13_c7bb                                                  ; $c7a4 : $f0, $15

	lda $27                                                  ; $c7a6 : $a5, $27
	beq br_13_c7ae                                                  ; $c7a8 : $f0, $04

	bmi br_13_c7ae                                                  ; $c7aa : $30, $02

	bra br_13_c7c5                                                  ; $c7ac : $80, $17

br_13_c7ae:
	lda #$02.b                                                  ; $c7ae : $a9, $02
	sta $01                                                  ; $c7b0 : $85, $01
	lda #$20.b                                                  ; $c7b2 : $a9, $20
	sta $39                                                  ; $c7b4 : $85, $39
	lda #$0a.b                                                  ; $c7b6 : $a9, $0a
	sta $03                                                  ; $c7b8 : $85, $03
	rts                                                  ; $c7ba : $60


br_13_c7bb:
	lda $01                                                  ; $c7bb : $a5, $01
	cmp #$04.b                                                  ; $c7bd : $c9, $04
	bne br_13_c7c5                                                  ; $c7bf : $d0, $04

	stz $27                                                  ; $c7c1 : $64, $27
	bra br_13_c81a                                                  ; $c7c3 : $80, $55

br_13_c7c5:
	ldx $02                                                  ; $c7c5 : $a6, $02
	jsr ($c7cb.w, X)                                                  ; $c7c7 : $fc, $cb, $c7
	rts                                                  ; $c7ca : $60


	cmp $c7, X                                                  ; $c7cb : $d5, $c7
	tdc                                                  ; $c7cd : $7b
	cmp #$bf.b                                                  ; $c7ce : $c9, $bf
	dex                                                  ; $c7d0 : $ca
	.db $00                                                  ; $c7d1 : $00
	cpy $cc4f.w                                                  ; $c7d2 : $cc, $4f, $cc
	jsr $04d8d5.l                                                  ; $c7d5 : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $c7d9 : $22, $64, $df, $02
	jsr Call_13_d299.w                                                  ; $c7dd : $20, $99, $d2
	ldx $03                                                  ; $c7e0 : $a6, $03
	jsr ($c863.w, X)                                                  ; $c7e2 : $fc, $63, $c8
	jsr Func_2_d636.l                                                  ; $c7e5 : $22, $36, $d6, $02
	jsr Func_4_cb31.l                                                  ; $c7e9 : $22, $31, $cb, $04
	jsr Func_4_cb74.l                                                  ; $c7ed : $22, $74, $cb, $04
	bmi br_13_c81a                                                  ; $c7f1 : $30, $27

	bne br_13_c84b                                                  ; $c7f3 : $d0, $56

	lda $28                                                  ; $c7f5 : $a5, $28
	pha                                                  ; $c7f7 : $48
	lda #$0d.b                                                  ; $c7f8 : $a9, $0d
	sta $28                                                  ; $c7fa : $85, $28
	rep #ACCU_8                                                  ; $c7fc : $c2, $20
	lda #$ce93.w                                                  ; $c7fe : $a9, $93, $ce
	sta $20                                                  ; $c801 : $85, $20
	sep #ACCU_8                                                  ; $c803 : $e2, $20
	jsr Func_4_cb31.l                                                  ; $c805 : $22, $31, $cb, $04
	jsr Func_4_cb74.l                                                  ; $c809 : $22, $74, $cb, $04
	rep #ACCU_8                                                  ; $c80d : $c2, $20
	lda #$ce57.w                                                  ; $c80f : $a9, $57, $ce
	sta $20                                                  ; $c812 : $85, $20
	sep #ACCU_8                                                  ; $c814 : $e2, $20
	pla                                                  ; $c816 : $68
	sta $28                                                  ; $c817 : $85, $28
	rts                                                  ; $c819 : $60


br_13_c81a:
	lda #$7f.b                                                  ; $c81a : $a9, $7f
	sta $1f45.w                                                  ; $c81c : $8d, $45, $1f
	sta $1f4f.w                                                  ; $c81f : $8d, $4f, $1f
	lda #$04.b                                                  ; $c822 : $a9, $04
	sta $01                                                  ; $c824 : $85, $01
	stz $02                                                  ; $c826 : $64, $02
	stz $03                                                  ; $c828 : $64, $03
	stz $3b                                                  ; $c82a : $64, $3b
	stz $34                                                  ; $c82c : $64, $34
	lda #$04.b                                                  ; $c82e : $a9, $04
	trb $1fa9.w                                                  ; $c830 : $1c, $a9, $1f
	trb $1faa.w                                                  ; $c833 : $1c, $aa, $1f
	lda #$04.b                                                  ; $c836 : $a9, $04
	trb wMainScreenDesignation.w                                                  ; $c838 : $1c, $c1, $00
	trb wSubScreenDesignation.w                                                  ; $c83b : $1c, $c2, $00
	ldy #$01.b                                                  ; $c83e : $a0, $01
	lda #$f6.b                                                  ; $c840 : $a9, $f6
	jsr Func_0_856d.l                                                  ; $c842 : $22, $6d, $85, $00
	jsr todo_CausePlayerToFreeze.l                                                  ; $c846 : $22, $ca, $d1, $04
	rts                                                  ; $c84a : $60


br_13_c84b:
	lda #$21.b                                                  ; $c84b : $a9, $21
	jsr Func_1_8000.l                                                  ; $c84d : $22, $00, $80, $01
	lda #$3c.b                                                  ; $c851 : $a9, $3c
	sta $37                                                  ; $c853 : $85, $37
	lda #$01.b                                                  ; $c855 : $a9, $01
	sta $28                                                  ; $c857 : $85, $28
	lda #$02.b                                                  ; $c859 : $a9, $02
	trb wMainScreenDesignation.w                                                  ; $c85b : $1c, $c1, $00
	lda #$0e.b                                                  ; $c85e : $a9, $0e
	trb $11                                                  ; $c860 : $14, $11
	rts                                                  ; $c862 : $60


	adc $c8a7c8.l                                                  ; $c863 : $6f, $c8, $a7, $c8
	jml [$2ac8.w]                                                  ; $c867 : $dc, $c8, $2a


	cmp #$37.b                                                  ; $c86a : $c9, $37
	cmp #$67.b                                                  ; $c86c : $c9, $67
	cmp #$20.b                                                  ; $c86e : $c9, $20
	cpy $ce                                                  ; $c870 : $c4, $ce
	beq br_13_c87d                                                  ; $c872 : $f0, $09

	lda #$02.b                                                  ; $c874 : $a9, $02
	sta $03                                                  ; $c876 : $85, $03
	lda #$30.b                                                  ; $c878 : $a9, $30
	sta $39                                                  ; $c87a : $85, $39
	rts                                                  ; $c87c : $60


br_13_c87d:
	lda $7fcd90.l                                                  ; $c87d : $af, $90, $cd, $7f
	bne br_13_c897                                                  ; $c881 : $d0, $14

	lda $7fcd97.l                                                  ; $c883 : $af, $97, $cd, $7f
	bne br_13_c898                                                  ; $c887 : $d0, $0f

	dec $39                                                  ; $c889 : $c6, $39
	bne br_13_c897                                                  ; $c88b : $d0, $0a

	lda #$02.b                                                  ; $c88d : $a9, $02
	sta $7fcd90.l                                                  ; $c88f : $8f, $90, $cd, $7f
	lda #$3c.b                                                  ; $c893 : $a9, $3c
	sta $39                                                  ; $c895 : $85, $39

br_13_c897:
	rts                                                  ; $c897 : $60


br_13_c898:
	dec $39                                                  ; $c898 : $c6, $39
	bne br_13_c8a6                                                  ; $c89a : $d0, $0a

	lda #$01.b                                                  ; $c89c : $a9, $01
	sta $7fcd90.l                                                  ; $c89e : $8f, $90, $cd, $7f
	lda #$3c.b                                                  ; $c8a2 : $a9, $3c
	sta $39                                                  ; $c8a4 : $85, $39

br_13_c8a6:
	rts                                                  ; $c8a6 : $60


	dec $39                                                  ; $c8a7 : $c6, $39
	bne br_13_c8c7                                                  ; $c8a9 : $d0, $1c

	rep #ACCU_8                                                  ; $c8ab : $c2, $20
	lda #$0200.w                                                  ; $c8ad : $a9, $00, $02
	sta $1ea4.w                                                  ; $c8b0 : $8d, $a4, $1e
	lda #$0040.w                                                  ; $c8b3 : $a9, $40, $00
	clc                                                  ; $c8b6 : $18
	adc wNewStageScrollY.w                                                  ; $c8b7 : $6d, $60, $1e
	sta $08                                                  ; $c8ba : $85, $08
	sep #ACCU_8                                                  ; $c8bc : $e2, $20
	lda #$04.b                                                  ; $c8be : $a9, $04
	sta $03                                                  ; $c8c0 : $85, $03
	lda #$14.b                                                  ; $c8c2 : $a9, $14
	sta $39                                                  ; $c8c4 : $85, $39
	rts                                                  ; $c8c6 : $60


br_13_c8c7:
	rep #ACCU_8                                                  ; $c8c7 : $c2, $20
	lda $1ea4.w                                                  ; $c8c9 : $ad, $a4, $1e
	eor #$0002.w                                                  ; $c8cc : $49, $02, $00
	sta $1ea4.w                                                  ; $c8cf : $8d, $a4, $1e
	lda $08                                                  ; $c8d2 : $a5, $08
	eor #$0002.w                                                  ; $c8d4 : $49, $02, $00
	sta $08                                                  ; $c8d7 : $85, $08
	sep #ACCU_8                                                  ; $c8d9 : $e2, $20
	rts                                                  ; $c8db : $60


	jsr Call_13_cf8c.w                                                  ; $c8dc : $20, $8c, $cf
	jsr Call_13_d13b.w                                                  ; $c8df : $20, $3b, $d1
	dec $39                                                  ; $c8e2 : $c6, $39
	bne br_13_c91e                                                  ; $c8e4 : $d0, $38

	lda #$49.b                                                  ; $c8e6 : $a9, $49
	jsr $01802b.l                                                  ; $c8e8 : $22, $2b, $80, $01
	lda #$3c.b                                                  ; $c8ec : $a9, $3c
	jsr $04d599.l                                                  ; $c8ee : $22, $99, $d5, $04
	rep #ACCU_8                                                  ; $c8f2 : $c2, $20
	lda #$01b0.w                                                  ; $c8f4 : $a9, $b0, $01
	sta $1ea4.w                                                  ; $c8f7 : $8d, $a4, $1e
	lda #$0040.w                                                  ; $c8fa : $a9, $40, $00
	clc                                                  ; $c8fd : $18
	adc wNewStageScrollY.w                                                  ; $c8fe : $6d, $60, $1e
	clc                                                  ; $c901 : $18
	adc #$0050.w                                                  ; $c902 : $69, $50, $00
	sta $08                                                  ; $c905 : $85, $08
	sep #ACCU_8                                                  ; $c907 : $e2, $20
	lda $7fcd97.l                                                  ; $c909 : $af, $97, $cd, $7f
	bne br_13_c915                                                  ; $c90d : $d0, $06

	lda $7fcd96.l                                                  ; $c90f : $af, $96, $cd, $7f
	bne br_13_c922                                                  ; $c913 : $d0, $0d

br_13_c915:
	lda #$06.b                                                  ; $c915 : $a9, $06
	sta $03                                                  ; $c917 : $85, $03
	lda #$78.b                                                  ; $c919 : $a9, $78
	sta $39                                                  ; $c91b : $85, $39
	rts                                                  ; $c91d : $60


br_13_c91e:
	jsr Call_13_cf4d.w                                                  ; $c91e : $20, $4d, $cf
	rts                                                  ; $c921 : $60


br_13_c922:
	jsr Call_13_ce11.w                                                  ; $c922 : $20, $11, $ce
	lda #$0a.b                                                  ; $c925 : $a9, $0a
	sta $03                                                  ; $c927 : $85, $03
	rts                                                  ; $c929 : $60


	dec $39                                                  ; $c92a : $c6, $39
	bne br_13_c936                                                  ; $c92c : $d0, $08

	lda #$50.b                                                  ; $c92e : $a9, $50
	sta $39                                                  ; $c930 : $85, $39
	lda #$08.b                                                  ; $c932 : $a9, $08
	sta $03                                                  ; $c934 : $85, $03

br_13_c936:
	rts                                                  ; $c936 : $60


	dec $39                                                  ; $c937 : $c6, $39
	bne br_13_c963                                                  ; $c939 : $d0, $28

	rep #ACCU_8                                                  ; $c93b : $c2, $20
	lda #$0200.w                                                  ; $c93d : $a9, $00, $02
	sta $1ea4.w                                                  ; $c940 : $8d, $a4, $1e
	lda #$0040.w                                                  ; $c943 : $a9, $40, $00
	clc                                                  ; $c946 : $18
	adc wNewStageScrollY.w                                                  ; $c947 : $6d, $60, $1e
	sta $08                                                  ; $c94a : $85, $08
	sep #ACCU_8                                                  ; $c94c : $e2, $20
	lda #$3c.b                                                  ; $c94e : $a9, $3c
	sta $39                                                  ; $c950 : $85, $39
	lda $7fcd90.l                                                  ; $c952 : $af, $90, $cd, $7f
	cmp #$03.b                                                  ; $c956 : $c9, $03
	beq br_13_c960                                                  ; $c958 : $f0, $06

	lda #$01.b                                                  ; $c95a : $a9, $01
	sta $7fcd90.l                                                  ; $c95c : $8f, $90, $cd, $7f

br_13_c960:
	stz $03                                                  ; $c960 : $64, $03
	rts                                                  ; $c962 : $60


br_13_c963:
	jsr Call_13_cf4d.w                                                  ; $c963 : $20, $4d, $cf
	rts                                                  ; $c966 : $60


	lda $7fcd97.l                                                  ; $c967 : $af, $97, $cd, $7f
	beq br_13_c97a                                                  ; $c96b : $f0, $0d

	lda #$32.b                                                  ; $c96d : $a9, $32
	sta $39                                                  ; $c96f : $85, $39
	ldy #$0d.b                                                  ; $c971 : $a0, $0d
	jsr Call_13_cf6b.w                                                  ; $c973 : $20, $6b, $cf
	lda #$06.b                                                  ; $c976 : $a9, $06
	sta $03                                                  ; $c978 : $85, $03

br_13_c97a:
	rts                                                  ; $c97a : $60


	lda $38                                                  ; $c97b : $a5, $38
	tsb $11                                                  ; $c97d : $04, $11
	jsr Call_13_d165.w                                                  ; $c97f : $20, $65, $d1
	rep #IDX_8                                                  ; $c982 : $c2, $10
	ldx $3e                                                  ; $c984 : $a6, $3e
	lda $0000.w, X                                                  ; $c986 : $bd, $00, $00
	beq br_13_c9aa                                                  ; $c989 : $f0, $1f

	lda $0001.w, X                                                  ; $c98b : $bd, $01, $00
	cmp #$04.b                                                  ; $c98e : $c9, $04
	beq br_13_c9aa                                                  ; $c990 : $f0, $18

	sep #IDX_8                                                  ; $c992 : $e2, $10
	ldx $03                                                  ; $c994 : $a6, $03
	jsr ($c9b9.w, X)                                                  ; $c996 : $fc, $b9, $c9
	jsr Func_2_d636.l                                                  ; $c999 : $22, $36, $d6, $02
	jsr Func_4_cb74.l                                                  ; $c99d : $22, $74, $cb, $04
	bmi br_13_c9b0                                                  ; $c9a1 : $30, $0d

	beq br_13_c9a9                                                  ; $c9a3 : $f0, $04

	lda #$0e.b                                                  ; $c9a5 : $a9, $0e
	trb $11                                                  ; $c9a7 : $14, $11

br_13_c9a9:
	rts                                                  ; $c9a9 : $60


br_13_c9aa:
	sep #IDX_8                                                  ; $c9aa : $e2, $10
	jsr Call_13_ceb7.w                                                  ; $c9ac : $20, $b7, $ce
	rts                                                  ; $c9af : $60


br_13_c9b0:
	lda #$20.b                                                  ; $c9b0 : $a9, $20
	sta $39                                                  ; $c9b2 : $85, $39
	lda #$0a.b                                                  ; $c9b4 : $a9, $0a
	sta $03                                                  ; $c9b6 : $85, $03
	rts                                                  ; $c9b8 : $60


	cmp $c9                                                  ; $c9b9 : $c5, $c9
	.db $00                                                  ; $c9bb : $00
	dex                                                  ; $c9bc : $ca
	and $ca                                                  ; $c9bd : $25, $ca
	and $ca, X                                                  ; $c9bf : $35, $ca
	jmp ($89ca.w, X)                                                  ; $c9c1 : $7c, $ca, $89


	dex                                                  ; $c9c4 : $ca
	lda $7fcd90.l                                                  ; $c9c5 : $af, $90, $cd, $7f
	cmp #$02.b                                                  ; $c9c9 : $c9, $02
	bne br_13_c9ff                                                  ; $c9cb : $d0, $32

	lda #$02.b                                                  ; $c9cd : $a9, $02
	sta $3b                                                  ; $c9cf : $85, $3b
	lda #$02.b                                                  ; $c9d1 : $a9, $02
	sta $3a                                                  ; $c9d3 : $85, $3a
	ldy #$00.b                                                  ; $c9d5 : $a0, $00
	jsr Call_13_d197.w                                                  ; $c9d7 : $20, $97, $d1
	ldy #$01.b                                                  ; $c9da : $a0, $01
	jsr Call_13_d197.w                                                  ; $c9dc : $20, $97, $d1
	ldy #$02.b                                                  ; $c9df : $a0, $02
	jsr Call_13_d197.w                                                  ; $c9e1 : $20, $97, $d1
	lda #$04.b                                                  ; $c9e4 : $a9, $04
	sta $39                                                  ; $c9e6 : $85, $39
	rep #ACCU_8                                                  ; $c9e8 : $c2, $20
	lda #$0200.w                                                  ; $c9ea : $a9, $00, $02
	sta $1a                                                  ; $c9ed : $85, $1a
	lda #$0200.w                                                  ; $c9ef : $a9, $00, $02
	sta $1c                                                  ; $c9f2 : $85, $1c
	sep #ACCU_8                                                  ; $c9f4 : $e2, $20
	lda #$02.b                                                  ; $c9f6 : $a9, $02
	sta $03                                                  ; $c9f8 : $85, $03
	ldy #$0e.b                                                  ; $c9fa : $a0, $0e
	jsr Call_13_d002.w                                                  ; $c9fc : $20, $02, $d0

br_13_c9ff:
	rts                                                  ; $c9ff : $60


	jsr $02d78e.l                                                  ; $ca00 : $22, $8e, $d7, $02
	dec $39                                                  ; $ca04 : $c6, $39
	bne br_13_ca24                                                  ; $ca06 : $d0, $1c

	lda #$04.b                                                  ; $ca08 : $a9, $04
	sta $39                                                  ; $ca0a : $85, $39
	rep #ACCU_8                                                  ; $ca0c : $c2, $20
	lda $1a                                                  ; $ca0e : $a5, $1a
	eor #$ffff.w                                                  ; $ca10 : $49, $ff, $ff
	ina                                                  ; $ca13 : $1a
	sta $1a                                                  ; $ca14 : $85, $1a
	lda $1c                                                  ; $ca16 : $a5, $1c
	eor #$ffff.w                                                  ; $ca18 : $49, $ff, $ff
	ina                                                  ; $ca1b : $1a
	sta $1c                                                  ; $ca1c : $85, $1c
	sep #ACCU_8                                                  ; $ca1e : $e2, $20
	lda #$04.b                                                  ; $ca20 : $a9, $04
	sta $03                                                  ; $ca22 : $85, $03

br_13_ca24:
	rts                                                  ; $ca24 : $60


	jsr $02d78e.l                                                  ; $ca25 : $22, $8e, $d7, $02
	dec $39                                                  ; $ca29 : $c6, $39
	bne br_13_ca34                                                  ; $ca2b : $d0, $07

	jsr Call_13_cdd0.w                                                  ; $ca2d : $20, $d0, $cd
	lda #$06.b                                                  ; $ca30 : $a9, $06
	sta $03                                                  ; $ca32 : $85, $03

br_13_ca34:
	rts                                                  ; $ca34 : $60


	lda $7fcd90.l                                                  ; $ca35 : $af, $90, $cd, $7f
	cmp #$05.b                                                  ; $ca39 : $c9, $05
	beq br_13_ca60                                                  ; $ca3b : $f0, $23

	dec $3a                                                  ; $ca3d : $c6, $3a
	bne br_13_ca49                                                  ; $ca3f : $d0, $08

	dec $3b                                                  ; $ca41 : $c6, $3b
	beq br_13_ca6e                                                  ; $ca43 : $f0, $29

	lda #$02.b                                                  ; $ca45 : $a9, $02
	sta $3a                                                  ; $ca47 : $85, $3a

br_13_ca49:
	lda #$04.b                                                  ; $ca49 : $a9, $04
	sta $39                                                  ; $ca4b : $85, $39
	rep #ACCU_8                                                  ; $ca4d : $c2, $20
	lda #$0200.w                                                  ; $ca4f : $a9, $00, $02
	sta $1a                                                  ; $ca52 : $85, $1a
	lda #$0200.w                                                  ; $ca54 : $a9, $00, $02
	sta $1c                                                  ; $ca57 : $85, $1c
	sep #ACCU_8                                                  ; $ca59 : $e2, $20
	lda #$02.b                                                  ; $ca5b : $a9, $02
	sta $03                                                  ; $ca5d : $85, $03
	rts                                                  ; $ca5f : $60


br_13_ca60:
	ldy #$13.b                                                  ; $ca60 : $a0, $13
	jsr Call_13_d002.w                                                  ; $ca62 : $20, $02, $d0
	lda #$00.b                                                  ; $ca65 : $a9, $00
	sta $7fcd90.l                                                  ; $ca67 : $8f, $90, $cd, $7f
	stz $03                                                  ; $ca6b : $64, $03
	rts                                                  ; $ca6d : $60


br_13_ca6e:
	ldy #$13.b                                                  ; $ca6e : $a0, $13
	jsr Call_13_d002.w                                                  ; $ca70 : $20, $02, $d0
	lda #$3c.b                                                  ; $ca73 : $a9, $3c
	sta $39                                                  ; $ca75 : $85, $39
	lda #$08.b                                                  ; $ca77 : $a9, $08
	sta $03                                                  ; $ca79 : $85, $03
	rts                                                  ; $ca7b : $60


	dec $39                                                  ; $ca7c : $c6, $39
	bne br_13_ca88                                                  ; $ca7e : $d0, $08

	lda #$01.b                                                  ; $ca80 : $a9, $01
	sta $7fcd90.l                                                  ; $ca82 : $8f, $90, $cd, $7f
	stz $03                                                  ; $ca86 : $64, $03

br_13_ca88:
	rts                                                  ; $ca88 : $60


	dec $39                                                  ; $ca89 : $c6, $39
	bne br_13_ca9f                                                  ; $ca8b : $d0, $12

	lda #$03.b                                                  ; $ca8d : $a9, $03
	sta $7fcd90.l                                                  ; $ca8f : $8f, $90, $cd, $7f
	ldy #$0e.b                                                  ; $ca93 : $a0, $0e
	jsr Call_13_d002.w                                                  ; $ca95 : $20, $02, $d0
	jsr Call_13_d17e.w                                                  ; $ca98 : $20, $7e, $d1
	jsr Call_13_ceb7.w                                                  ; $ca9b : $20, $b7, $ce
	rts                                                  ; $ca9e : $60


br_13_ca9f:
	rep #ACCU_8                                                  ; $ca9f : $c2, $20
	lda #$000f.w                                                  ; $caa1 : $a9, $0f, $00
	sta $0000.w                                                  ; $caa4 : $8d, $00, $00
	sta $0002.w                                                  ; $caa7 : $8d, $02, $00
	lda #$0008.w                                                  ; $caaa : $a9, $08, $00
	sta $0004.w                                                  ; $caad : $8d, $04, $00
	sta $0006.w                                                  ; $cab0 : $8d, $06, $00
	sep #ACCU_8                                                  ; $cab3 : $e2, $20
	lda #$07.b                                                  ; $cab5 : $a9, $07
	sta $0008.w                                                  ; $cab7 : $8d, $08, $00
	jsr $04d6fb.l                                                  ; $caba : $22, $fb, $d6, $04
	rts                                                  ; $cabe : $60


	rep #IDX_8                                                  ; $cabf : $c2, $10
	ldx $3e                                                  ; $cac1 : $a6, $3e
	lda $0000.w, X                                                  ; $cac3 : $bd, $00, $00
	beq br_13_cae6                                                  ; $cac6 : $f0, $1e

	lda $0001.w, X                                                  ; $cac8 : $bd, $01, $00
	cmp #$04.b                                                  ; $cacb : $c9, $04
	beq br_13_cae6                                                  ; $cacd : $f0, $17

	sep #IDX_8                                                  ; $cacf : $e2, $10
	ldx $03                                                  ; $cad1 : $a6, $03
	jsr ($caec.w, X)                                                  ; $cad3 : $fc, $ec, $ca
	jsr Call_13_d165.w                                                  ; $cad6 : $20, $65, $d1
	jsr Func_4_cb74.l                                                  ; $cad9 : $22, $74, $cb, $04
	lda $03                                                  ; $cadd : $a5, $03
	beq br_13_cae5                                                  ; $cadf : $f0, $04

	jsr Func_2_d636.l                                                  ; $cae1 : $22, $36, $d6, $02

br_13_cae5:
	rts                                                  ; $cae5 : $60


br_13_cae6:
	sep #IDX_8                                                  ; $cae6 : $e2, $10
	jsr Call_13_ceb7.w                                                  ; $cae8 : $20, $b7, $ce
	rts                                                  ; $caeb : $60


	inc $ca, X                                                  ; $caec : $f6, $ca
	ora $cb71cb.l, X                                                  ; $caee : $1f, $cb, $71, $cb
	sta ($cb, S), Y                                                  ; $caf2 : $93, $cb
	lda [$cb], Y                                                  ; $caf4 : $b7, $cb
	lda $7fcd90.l                                                  ; $caf6 : $af, $90, $cd, $7f
	cmp #$06.b                                                  ; $cafa : $c9, $06
	beq br_13_cb18                                                  ; $cafc : $f0, $1a

	cmp #$01.b                                                  ; $cafe : $c9, $01
	bne br_13_cb17                                                  ; $cb00 : $d0, $15

	ldy #$01.b                                                  ; $cb02 : $a0, $01
	jsr Call_13_cfe6.w                                                  ; $cb04 : $20, $e6, $cf
	lda #$02.b                                                  ; $cb07 : $a9, $02
	sta $03                                                  ; $cb09 : $85, $03
	stz $30                                                  ; $cb0b : $64, $30
	lda #$01.b                                                  ; $cb0d : $a9, $01
	sta $3b                                                  ; $cb0f : $85, $3b
	lda #$02.b                                                  ; $cb11 : $a9, $02
	jsr Func_4_b967.l                                                  ; $cb13 : $22, $67, $b9, $04

br_13_cb17:
	rts                                                  ; $cb17 : $60


br_13_cb18:
	lda #$00.b                                                  ; $cb18 : $a9, $00
	sta $7fcd90.l                                                  ; $cb1a : $8f, $90, $cd, $7f
	rts                                                  ; $cb1e : $60


	lda $7fcd90.l                                                  ; $cb1f : $af, $90, $cd, $7f
	cmp #$06.b                                                  ; $cb23 : $c9, $06
	beq br_13_cb63                                                  ; $cb25 : $f0, $3c

	lda $0f                                                  ; $cb27 : $a5, $0f
	bpl br_13_cb5e                                                  ; $cb29 : $10, $33

	lda #$03.b                                                  ; $cb2b : $a9, $03
	jsr Func_4_b967.l                                                  ; $cb2d : $22, $67, $b9, $04
	jsr $04d308.l                                                  ; $cb31 : $22, $08, $d3, $04
	cmp #$11.b                                                  ; $cb35 : $c9, $11
	bpl br_13_cb3b                                                  ; $cb37 : $10, $02

	lda #$11.b                                                  ; $cb39 : $a9, $11

br_13_cb3b:
	jsr Call_13_d02e.w                                                  ; $cb3b : $20, $2e, $d0
	ldy #$03.b                                                  ; $cb3e : $a0, $03
	jsr Call_13_d094.w                                                  ; $cb40 : $20, $94, $d0
	ldy #$00.b                                                  ; $cb43 : $a0, $00
	jsr Call_13_d094.w                                                  ; $cb45 : $20, $94, $d0
	ldy #$01.b                                                  ; $cb48 : $a0, $01
	jsr Call_13_d094.w                                                  ; $cb4a : $20, $94, $d0
	ldy #$02.b                                                  ; $cb4d : $a0, $02
	jsr Call_13_d094.w                                                  ; $cb4f : $20, $94, $d0
	lda #$30.b                                                  ; $cb52 : $a9, $30
	jsr $01802b.l                                                  ; $cb54 : $22, $2b, $80, $01
	lda #$04.b                                                  ; $cb58 : $a9, $04
	sta $03                                                  ; $cb5a : $85, $03
	stz $35                                                  ; $cb5c : $64, $35

br_13_cb5e:
	jsr Func_4_b94a.l                                                  ; $cb5e : $22, $4a, $b9, $04
	rts                                                  ; $cb62 : $60


br_13_cb63:
	stz $03                                                  ; $cb63 : $64, $03
	ldy #$00.b                                                  ; $cb65 : $a0, $00
	jsr Call_13_cfe6.w                                                  ; $cb67 : $20, $e6, $cf
	lda #$00.b                                                  ; $cb6a : $a9, $00
	sta $7fcd90.l                                                  ; $cb6c : $8f, $90, $cd, $7f
	rts                                                  ; $cb70 : $60


	jsr $02d78e.l                                                  ; $cb71 : $22, $8e, $d7, $02
	jsr $04c0f7.l                                                  ; $cb75 : $22, $f7, $c0, $04
	lda $2b                                                  ; $cb79 : $a5, $2b
	bne br_13_cb8b                                                  ; $cb7b : $d0, $0e

	jsr Func_4_cb31.l                                                  ; $cb7d : $22, $31, $cb, $04
	beq br_13_cb92                                                  ; $cb81 : $f0, $0f

	lda #$01.b                                                  ; $cb83 : $a9, $01
	sta $35                                                  ; $cb85 : $85, $35
	jsr $04d034.l                                                  ; $cb87 : $22, $34, $d0, $04

br_13_cb8b:
	jsr Call_13_d01b.w                                                  ; $cb8b : $20, $1b, $d0
	lda #$06.b                                                  ; $cb8e : $a9, $06
	sta $03                                                  ; $cb90 : $85, $03

br_13_cb92:
	rts                                                  ; $cb92 : $60


	jsr $02d78e.l                                                  ; $cb93 : $22, $8e, $d7, $02
	lda $35                                                  ; $cb97 : $a5, $35
	beq br_13_cba3                                                  ; $cb99 : $f0, $08

	jsr Call_13_d042.w                                                  ; $cb9b : $20, $42, $d0
	bne br_13_cba3                                                  ; $cb9e : $d0, $03

	jsr Call_13_d05d.w                                                  ; $cba0 : $20, $5d, $d0

br_13_cba3:
	jsr Call_13_d06c.w                                                  ; $cba3 : $20, $6c, $d0
	bne br_13_cbb6                                                  ; $cba6 : $d0, $0e

	lda #$16.b                                                  ; $cba8 : $a9, $16
	jsr Func_4_b967.l                                                  ; $cbaa : $22, $67, $b9, $04
	lda #$3c.b                                                  ; $cbae : $a9, $3c
	sta $39                                                  ; $cbb0 : $85, $39
	lda #$08.b                                                  ; $cbb2 : $a9, $08
	sta $03                                                  ; $cbb4 : $85, $03

br_13_cbb6:
	rts                                                  ; $cbb6 : $60


	lda $7fcd90.l                                                  ; $cbb7 : $af, $90, $cd, $7f
	cmp #$06.b                                                  ; $cbbb : $c9, $06
	beq br_13_cbf2                                                  ; $cbbd : $f0, $33

	lda $0f                                                  ; $cbbf : $a5, $0f
	bpl br_13_cbc9                                                  ; $cbc1 : $10, $06

	lda #$15.b                                                  ; $cbc3 : $a9, $15
	jsr Func_4_b967.l                                                  ; $cbc5 : $22, $67, $b9, $04

br_13_cbc9:
	dec $39                                                  ; $cbc9 : $c6, $39
	bne br_13_cbe2                                                  ; $cbcb : $d0, $15

	dec $3b                                                  ; $cbcd : $c6, $3b
	bne br_13_cbe7                                                  ; $cbcf : $d0, $16

	lda #$00.b                                                  ; $cbd1 : $a9, $00
	sta $7fcd90.l                                                  ; $cbd3 : $8f, $90, $cd, $7f
	stz $03                                                  ; $cbd7 : $64, $03
	lda #$01.b                                                  ; $cbd9 : $a9, $01
	sta $30                                                  ; $cbdb : $85, $30
	ldy #$00.b                                                  ; $cbdd : $a0, $00
	jsr Call_13_cfe6.w                                                  ; $cbdf : $20, $e6, $cf

br_13_cbe2:
	jsr Func_4_b94a.l                                                  ; $cbe2 : $22, $4a, $b9, $04
	rts                                                  ; $cbe6 : $60


br_13_cbe7:
	lda #$02.b                                                  ; $cbe7 : $a9, $02
	jsr Func_4_b967.l                                                  ; $cbe9 : $22, $67, $b9, $04
	lda #$02.b                                                  ; $cbed : $a9, $02
	sta $03                                                  ; $cbef : $85, $03
	rts                                                  ; $cbf1 : $60


br_13_cbf2:
	stz $03                                                  ; $cbf2 : $64, $03
	ldy #$00.b                                                  ; $cbf4 : $a0, $00
	jsr Call_13_cfe6.w                                                  ; $cbf6 : $20, $e6, $cf
	lda #$00.b                                                  ; $cbf9 : $a9, $00
	sta $7fcd90.l                                                  ; $cbfb : $8f, $90, $cd, $7f
	rts                                                  ; $cbff : $60


	rep #IDX_8                                                  ; $cc00 : $c2, $10
	ldx $3e                                                  ; $cc02 : $a6, $3e
	lda $0000.w, X                                                  ; $cc04 : $bd, $00, $00
	beq br_13_cc10                                                  ; $cc07 : $f0, $07

	lda $0001.w, X                                                  ; $cc09 : $bd, $01, $00
	cmp #$04.b                                                  ; $cc0c : $c9, $04
	bne br_13_cc16                                                  ; $cc0e : $d0, $06

br_13_cc10:
	sep #IDX_8                                                  ; $cc10 : $e2, $10
	jsr Call_13_ceb7.w                                                  ; $cc12 : $20, $b7, $ce
	rts                                                  ; $cc15 : $60


br_13_cc16:
	sep #IDX_8                                                  ; $cc16 : $e2, $10
	ldx $03                                                  ; $cc18 : $a6, $03
	jsr ($cc22.w, X)                                                  ; $cc1a : $fc, $22, $cc
	jsr Func_2_d636.l                                                  ; $cc1d : $22, $36, $d6, $02
	rts                                                  ; $cc21 : $60


	plp                                                  ; $cc22 : $28
	cpy $cc3b.w                                                  ; $cc23 : $cc, $3b, $cc
	lsr $22cc.w                                                  ; $cc26 : $4e, $cc, $22
	and ($cb), Y                                                  ; $cc29 : $31, $cb
	tsb $22                                                  ; $cc2b : $04, $22
	lsr                                                  ; $cc2d : $4a
	lda $af04.w, Y                                                  ; $cc2e : $b9, $04, $af
	sta [$cd], Y                                                  ; $cc31 : $97, $cd
	adc $a904f0.l, X                                                  ; $cc33 : $7f, $f0, $04, $a9
	tsb $85                                                  ; $cc37 : $04, $85
	ora $60, S                                                  ; $cc39 : $03, $60
	lda $0f                                                  ; $cc3b : $a5, $0f
	beq br_13_cc4d                                                  ; $cc3d : $f0, $0e

	lda #$05.b                                                  ; $cc3f : $a9, $05
	sta $26                                                  ; $cc41 : $85, $26
	lda #$01.b                                                  ; $cc43 : $a9, $01
	jsr Func_4_b967.l                                                  ; $cc45 : $22, $67, $b9, $04
	lda #$04.b                                                  ; $cc49 : $a9, $04
	sta $03                                                  ; $cc4b : $85, $03

br_13_cc4d:
	rts                                                  ; $cc4d : $60


	rts                                                  ; $cc4e : $60


	rep #IDX_8                                                  ; $cc4f : $c2, $10
	ldx $3e                                                  ; $cc51 : $a6, $3e
	lda $0000.w, X                                                  ; $cc53 : $bd, $00, $00
	beq br_13_cc5f                                                  ; $cc56 : $f0, $07

	lda $0001.w, X                                                  ; $cc58 : $bd, $01, $00
	cmp #$04.b                                                  ; $cc5b : $c9, $04
	bne br_13_cc65                                                  ; $cc5d : $d0, $06

br_13_cc5f:
	sep #IDX_8                                                  ; $cc5f : $e2, $10
	jsr Call_13_ceb7.w                                                  ; $cc61 : $20, $b7, $ce
	rts                                                  ; $cc64 : $60


br_13_cc65:
	sep #IDX_8                                                  ; $cc65 : $e2, $10
	ldx $03                                                  ; $cc67 : $a6, $03
	jsr ($cc71.w, X)                                                  ; $cc69 : $fc, $71, $cc
	jsr Func_2_d636.l                                                  ; $cc6c : $22, $36, $d6, $02
	rts                                                  ; $cc70 : $60


	adc [$cc], Y                                                  ; $cc71 : $77, $cc
	stx $b8cc.w                                                  ; $cc73 : $8e, $cc, $b8
	cpy $7020.w                                                  ; $cc76 : $cc, $20, $70
	dec $39c6.w                                                  ; $cc79 : $ce, $c6, $39
	bne br_13_cc89                                                  ; $cc7c : $d0, $0b

	lda #$02.b                                                  ; $cc7e : $a9, $02
	sta $03                                                  ; $cc80 : $85, $03
	lda #$1e.b                                                  ; $cc82 : $a9, $1e
	sta $39                                                  ; $cc84 : $85, $39
	stz $3a                                                  ; $cc86 : $64, $3a
	rts                                                  ; $cc88 : $60


br_13_cc89:
	jsr $02d78e.l                                                  ; $cc89 : $22, $8e, $d7, $02
	rts                                                  ; $cc8d : $60


	dec $39                                                  ; $cc8e : $c6, $39
	bne br_13_ccac                                                  ; $cc90 : $d0, $1a

	lda $3a                                                  ; $cc92 : $a5, $3a
	bne br_13_cca5                                                  ; $cc94 : $d0, $0f

	jsr Call_13_cfad.w                                                  ; $cc96 : $20, $ad, $cf
	bne br_13_cca5                                                  ; $cc99 : $d0, $0a

	jsr Call_13_cd51.w                                                  ; $cc9b : $20, $51, $cd
	lda #$1e.b                                                  ; $cc9e : $a9, $1e
	sta $39                                                  ; $cca0 : $85, $39
	inc $3a                                                  ; $cca2 : $e6, $3a
	rts                                                  ; $cca4 : $60


br_13_cca5:
	lda #$78.b                                                  ; $cca5 : $a9, $78
	sta $39                                                  ; $cca7 : $85, $39
	stz $03                                                  ; $cca9 : $64, $03
	rts                                                  ; $ccab : $60


br_13_ccac:
	rep #ACCU_8                                                  ; $ccac : $c2, $20
	lda $05                                                  ; $ccae : $a5, $05
	eor #$0001.w                                                  ; $ccb0 : $49, $01, $00
	sta $05                                                  ; $ccb3 : $85, $05
	sep #ACCU_8                                                  ; $ccb5 : $e2, $20
	rts                                                  ; $ccb7 : $60


	rts                                                  ; $ccb8 : $60


	ldx $3b                                                  ; $ccb9 : $a6, $3b
	jsr ($ccbf.w, X)                                                  ; $ccbb : $fc, $bf, $cc
	rts                                                  ; $ccbe : $60


	cmp $cc                                                  ; $ccbf : $c5, $cc
	sed                                                  ; $ccc1 : $f8
	cpy $cd1c.w                                                  ; $ccc2 : $cc, $1c, $cd
	ldy #$0d.b                                                  ; $ccc5 : $a0, $0d
	jsr Call_13_cf6b.w                                                  ; $ccc7 : $20, $6b, $cf
	stz $00cb.w                                                  ; $ccca : $9c, $cb, $00
	stz $00cc.w                                                  ; $cccd : $9c, $cc, $00
	stz $00cd.w                                                  ; $ccd0 : $9c, $cd, $00
	stz $1f1f.w                                                  ; $ccd3 : $9c, $1f, $1f
	stz $1f20.w                                                  ; $ccd6 : $9c, $20, $1f
	lda #$02.b                                                  ; $ccd9 : $a9, $02
	sta $3b                                                  ; $ccdb : $85, $3b
	lda #$1e.b                                                  ; $ccdd : $a9, $1e
	sta $39                                                  ; $ccdf : $85, $39
	stz $0b                                                  ; $cce1 : $64, $0b

br_13_cce3:
	lda wMainScreenDesignation.w                                                  ; $cce3 : $ad, $c1, $00
	eor #$02.b                                                  ; $cce6 : $49, $02
	sta wMainScreenDesignation.w                                                  ; $cce8 : $8d, $c1, $00
	lda wSubScreenDesignation.w                                                  ; $cceb : $ad, $c2, $00
	eor #$02.b                                                  ; $ccee : $49, $02
	sta wSubScreenDesignation.w                                                  ; $ccf0 : $8d, $c2, $00
	jsr Func_2_d636.l                                                  ; $ccf3 : $22, $36, $d6, $02
	rts                                                  ; $ccf7 : $60


	lda $39                                                  ; $ccf8 : $a5, $39
	beq br_13_cd00                                                  ; $ccfa : $f0, $04

	dec $39                                                  ; $ccfc : $c6, $39
	bra br_13_cce3                                                  ; $ccfe : $80, $e3

br_13_cd00:
	jsr $3fe1c9.l                                                  ; $cd00 : $22, $c9, $e1, $3f
	lda $34                                                  ; $cd04 : $a5, $34
	bpl br_13_cd0d                                                  ; $cd06 : $10, $05

	lda #$04.b                                                  ; $cd08 : $a9, $04
	sta $3b                                                  ; $cd0a : $85, $3b
	rts                                                  ; $cd0c : $60


br_13_cd0d:
	lda $34                                                  ; $cd0d : $a5, $34
	cmp #$01.b                                                  ; $cd0f : $c9, $01
	bne br_13_cce3                                                  ; $cd11 : $d0, $d0

	lda #$02.b                                                  ; $cd13 : $a9, $02
	trb wMainScreenDesignation.w                                                  ; $cd15 : $1c, $c1, $00
	trb wSubScreenDesignation.w                                                  ; $cd18 : $1c, $c2, $00
	rts                                                  ; $cd1b : $60


	lda $0b                                                  ; $cd1c : $a5, $0b
	bne br_13_cd28                                                  ; $cd1e : $d0, $08

	lda #$01.b                                                  ; $cd20 : $a9, $01
	sta $1faf.w                                                  ; $cd22 : $8d, $af, $1f
	inc $1f36.w                                                  ; $cd25 : $ee, $36, $1f

br_13_cd28:
	jsr todo_DisablesEntity_d928.l                                                  ; $cd28 : $22, $28, $d9, $02
	rts                                                  ; $cd2c : $60


Call_13_cd2d:
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $cd2d : $22, $a7, $d8, $02
	bne br_13_cd50                                                  ; $cd31 : $d0, $1d

	rep #IDX_8                                                  ; $cd33 : $c2, $10
	inc $0000.w, X                                                  ; $cd35 : $fe, $00, $00
	lda #$5a.b                                                  ; $cd38 : $a9, $5a
	sta $000a.w, X                                                  ; $cd3a : $9d, $0a, $00
	tya                                                  ; $cd3d : $98
	sta $000b.w, X                                                  ; $cd3e : $9d, $0b, $00
	clc                                                  ; $cd41 : $18
	adc #$02.b                                                  ; $cd42 : $69, $02
	asl                                                  ; $cd44 : $0a
	sta $0002.w, X                                                  ; $cd45 : $9d, $02, $00
	rep #ACCU_8                                                  ; $cd48 : $c2, $20
	tdc                                                  ; $cd4a : $7b
	sta $003e.w, X                                                  ; $cd4b : $9d, $3e, $00
	sep #ACCU_8|IDX_8                                                  ; $cd4e : $e2, $30

br_13_cd50:
	rts                                                  ; $cd50 : $60


Call_13_cd51:
	lda $7fcd96.l                                                  ; $cd51 : $af, $96, $cd, $7f
	beq br_13_cd5d                                                  ; $cd55 : $f0, $06

	lda $7fcd97.l                                                  ; $cd57 : $af, $97, $cd, $7f
	beq br_13_cdcf                                                  ; $cd5b : $f0, $72

br_13_cd5d:
	jsr $02d8de.l                                                  ; $cd5d : $22, $de, $d8, $02
	bne br_13_cdcf                                                  ; $cd61 : $d0, $6c

	rep #IDX_8                                                  ; $cd63 : $c2, $10
	inc $0000.w, X                                                  ; $cd65 : $fe, $00, $00
	lda #$1b.b                                                  ; $cd68 : $a9, $1b
	sta $000a.w, X                                                  ; $cd6a : $9d, $0a, $00
	lda $18                                                  ; $cd6d : $a5, $18
	sta $0018.w, X                                                  ; $cd6f : $9d, $18, $00
	lda $16                                                  ; $cd72 : $a5, $16
	sta $0016.w, X                                                  ; $cd74 : $9d, $16, $00
	lda $11                                                  ; $cd77 : $a5, $11
	ora $38                                                  ; $cd79 : $05, $38
	and #$ef.b                                                  ; $cd7b : $29, $ef
	sta $0011.w, X                                                  ; $cd7d : $9d, $11, $00
	lda #$02.b                                                  ; $cd80 : $a9, $02
	sta $000b.w, X                                                  ; $cd82 : $9d, $0b, $00
	rep #ACCU_8                                                  ; $cd85 : $c2, $20
	lda $05                                                  ; $cd87 : $a5, $05
	sta $0005.w, X                                                  ; $cd89 : $9d, $05, $00
	lda $08                                                  ; $cd8c : $a5, $08
	sta $0008.w, X                                                  ; $cd8e : $9d, $08, $00
	tdc                                                  ; $cd91 : $7b
	sta $003e.w, X                                                  ; $cd92 : $9d, $3e, $00
	phx                                                  ; $cd95 : $da
	sep #ACCU_8|IDX_8                                                  ; $cd96 : $e2, $30
	lda $7fcd91.l                                                  ; $cd98 : $af, $91, $cd, $7f
	ora #$01.b                                                  ; $cd9c : $09, $01
	sta $7fcd91.l                                                  ; $cd9e : $8f, $91, $cd, $7f
	rep #IDX_8                                                  ; $cda2 : $c2, $10
	plx                                                  ; $cda4 : $fa
	lda #$01.b                                                  ; $cda5 : $a9, $01
	sta $0035.w, X                                                  ; $cda7 : $9d, $35, $00
	rep #ACCU_8                                                  ; $cdaa : $c2, $20
	txa                                                  ; $cdac : $8a
	sta $7fcd92.l                                                  ; $cdad : $8f, $92, $cd, $7f
	sep #ACCU_8|IDX_8                                                  ; $cdb1 : $e2, $30
	rts                                                  ; $cdb3 : $60


	lda $7fcd91.l                                                  ; $cdb4 : $af, $91, $cd, $7f
	ora #$02.b                                                  ; $cdb8 : $09, $02
	sta $7fcd91.l                                                  ; $cdba : $8f, $91, $cd, $7f
	rep #IDX_8                                                  ; $cdbe : $c2, $10
	plx                                                  ; $cdc0 : $fa
	lda #$02.b                                                  ; $cdc1 : $a9, $02
	sta $0035.w, X                                                  ; $cdc3 : $9d, $35, $00
	rep #ACCU_8                                                  ; $cdc6 : $c2, $20
	txa                                                  ; $cdc8 : $8a
	sta $7fcd94.l                                                  ; $cdc9 : $8f, $94, $cd, $7f
	sep #ACCU_8|IDX_8                                                  ; $cdcd : $e2, $30

br_13_cdcf:
	rts                                                  ; $cdcf : $60


Call_13_cdd0:
	jsr $02d8de.l                                                  ; $cdd0 : $22, $de, $d8, $02
	bne br_13_ce10                                                  ; $cdd4 : $d0, $3a

	rep #IDX_8                                                  ; $cdd6 : $c2, $10
	inc $0000.w, X                                                  ; $cdd8 : $fe, $00, $00
	lda #$1b.b                                                  ; $cddb : $a9, $1b
	sta $000a.w, X                                                  ; $cddd : $9d, $0a, $00
	lda $18                                                  ; $cde0 : $a5, $18
	sta $0018.w, X                                                  ; $cde2 : $9d, $18, $00
	lda $16                                                  ; $cde5 : $a5, $16
	sta $0016.w, X                                                  ; $cde7 : $9d, $16, $00
	lda $38                                                  ; $cdea : $a5, $38
	ina                                                  ; $cdec : $1a
	ina                                                  ; $cded : $1a
	sta $0011.w, X                                                  ; $cdee : $9d, $11, $00
	stz $000b.w, X                                                  ; $cdf1 : $9e, $0b, $00
	rep #ACCU_8                                                  ; $cdf4 : $c2, $20
	lda $05                                                  ; $cdf6 : $a5, $05
	sec                                                  ; $cdf8 : $38
	sbc #$0008.w                                                  ; $cdf9 : $e9, $08, $00
	sta $0005.w, X                                                  ; $cdfc : $9d, $05, $00
	lda $08                                                  ; $cdff : $a5, $08
	sta $0008.w, X                                                  ; $ce01 : $9d, $08, $00
	tdc                                                  ; $ce04 : $7b
	sta $003e.w, X                                                  ; $ce05 : $9d, $3e, $00
	sep #ACCU_8|IDX_8                                                  ; $ce08 : $e2, $30
	lda #$42.b                                                  ; $ce0a : $a9, $42
	jsr $01802b.l                                                  ; $ce0c : $22, $2b, $80, $01

br_13_ce10:
	rts                                                  ; $ce10 : $60


Call_13_ce11:
	jsr $02d8de.l                                                  ; $ce11 : $22, $de, $d8, $02
	bne br_13_ce4d                                                  ; $ce15 : $d0, $36

	rep #IDX_8                                                  ; $ce17 : $c2, $10
	inc $0000.w, X                                                  ; $ce19 : $fe, $00, $00
	lda #$1b.b                                                  ; $ce1c : $a9, $1b
	sta $000a.w, X                                                  ; $ce1e : $9d, $0a, $00
	lda $18                                                  ; $ce21 : $a5, $18
	sta $0018.w, X                                                  ; $ce23 : $9d, $18, $00
	lda $16                                                  ; $ce26 : $a5, $16
	sta $0016.w, X                                                  ; $ce28 : $9d, $16, $00
	lda $38                                                  ; $ce2b : $a5, $38
	ina                                                  ; $ce2d : $1a
	ina                                                  ; $ce2e : $1a
	ora #$30.b                                                  ; $ce2f : $09, $30
	sta $0011.w, X                                                  ; $ce31 : $9d, $11, $00
	lda #$04.b                                                  ; $ce34 : $a9, $04
	sta $000b.w, X                                                  ; $ce36 : $9d, $0b, $00
	rep #ACCU_8                                                  ; $ce39 : $c2, $20
	lda #$16b5.w                                                  ; $ce3b : $a9, $b5, $16
	sta $0005.w, X                                                  ; $ce3e : $9d, $05, $00
	lda #$0694.w                                                  ; $ce41 : $a9, $94, $06
	sta $0008.w, X                                                  ; $ce44 : $9d, $08, $00
	tdc                                                  ; $ce47 : $7b
	sta $003e.w, X                                                  ; $ce48 : $9d, $3e, $00
	sep #ACCU_8|IDX_8                                                  ; $ce4b : $e2, $30

br_13_ce4d:
	rts                                                  ; $ce4d : $60


Call_13_ce4e:
	lda #$39.b                                                  ; $ce4e : $a9, $39
	sta $11                                                  ; $ce50 : $85, $11
	sta $38                                                  ; $ce52 : $85, $38
	lda $0b                                                  ; $ce54 : $a5, $0b
	asl                                                  ; $ce56 : $0a
	asl                                                  ; $ce57 : $0a
	tay                                                  ; $ce58 : $a8
	rep #ACCU_8                                                  ; $ce59 : $c2, $20
	lda wNewStageScrollX.w                                                  ; $ce5b : $ad, $5d, $1e
	clc                                                  ; $ce5e : $18
	adc $ce9d.w, Y                                                  ; $ce5f : $79, $9d, $ce
	sta $05                                                  ; $ce62 : $85, $05
	lda wNewStageScrollY.w                                                  ; $ce64 : $ad, $60, $1e
	clc                                                  ; $ce67 : $18
	adc $ce9f.w, Y                                                  ; $ce68 : $79, $9f, $ce
	sta $08                                                  ; $ce6b : $85, $08
	sep #ACCU_8                                                  ; $ce6d : $e2, $20
	rts                                                  ; $ce6f : $60


	rep #ACCU_8                                                  ; $ce70 : $c2, $20
	lda $05                                                  ; $ce72 : $a5, $05
	and #$00ff.w                                                  ; $ce74 : $29, $ff, $00
	cmp #$0028.w                                                  ; $ce77 : $c9, $28, $00
	bmi br_13_ce83                                                  ; $ce7a : $30, $07

	cmp #$0080.w                                                  ; $ce7c : $c9, $80, $00
	bpl br_13_ce90                                                  ; $ce7f : $10, $0f

	bra br_13_ceb4                                                  ; $ce81 : $80, $31

br_13_ce83:
	lda $05                                                  ; $ce83 : $a5, $05
	and #$ff00.w                                                  ; $ce85 : $29, $00, $ff
	clc                                                  ; $ce88 : $18
	adc #$0028.w                                                  ; $ce89 : $69, $28, $00
	sta $05                                                  ; $ce8c : $85, $05
	bra br_13_ce9b                                                  ; $ce8e : $80, $0b

br_13_ce90:
	lda $05                                                  ; $ce90 : $a5, $05
	and #$ff00.w                                                  ; $ce92 : $29, $00, $ff
	clc                                                  ; $ce95 : $18
	adc #$0080.w                                                  ; $ce96 : $69, $80, $00
	sta $05                                                  ; $ce99 : $85, $05

br_13_ce9b:
	lda $1a                                                  ; $ce9b : $a5, $1a
	eor #$ffff.w                                                  ; $ce9d : $49, $ff, $ff
	ina                                                  ; $cea0 : $1a
	sta $1a                                                  ; $cea1 : $85, $1a
	sep #ACCU_8                                                  ; $cea3 : $e2, $20
	jsr Call_13_cfad.w                                                  ; $cea5 : $20, $ad, $cf
	bne br_13_ceb4                                                  ; $cea8 : $d0, $0a

	lda #$02.b                                                  ; $ceaa : $a9, $02
	sta $03                                                  ; $ceac : $85, $03
	lda #$1e.b                                                  ; $ceae : $a9, $1e
	sta $39                                                  ; $ceb0 : $85, $39
	stz $3a                                                  ; $ceb2 : $64, $3a

br_13_ceb4:
	sep #ACCU_8                                                  ; $ceb4 : $e2, $20
	rts                                                  ; $ceb6 : $60


Call_13_ceb7:
	lda #$04.b                                                  ; $ceb7 : $a9, $04
	sta $01                                                  ; $ceb9 : $85, $01
	stz $02                                                  ; $cebb : $64, $02
	stz $03                                                  ; $cebd : $64, $03
	lda #$04.b                                                  ; $cebf : $a9, $04
	sta $3b                                                  ; $cec1 : $85, $3b
	rts                                                  ; $cec3 : $60


	lda $7fcd97.l                                                  ; $cec4 : $af, $97, $cd, $7f
	bne br_13_cf48                                                  ; $cec8 : $d0, $7e

	lda $7fcd90.l                                                  ; $ceca : $af, $90, $cd, $7f
	beq br_13_cee4                                                  ; $cece : $f0, $14

	cmp #$05.b                                                  ; $ced0 : $c9, $05
	beq br_13_cf48                                                  ; $ced2 : $f0, $74

	cmp #$06.b                                                  ; $ced4 : $c9, $06
	beq br_13_cf48                                                  ; $ced6 : $f0, $70

	cmp #$03.b                                                  ; $ced8 : $c9, $03
	bne br_13_cee4                                                  ; $ceda : $d0, $08

	lda #$01.b                                                  ; $cedc : $a9, $01
	sta $7fcd96.l                                                  ; $cede : $8f, $96, $cd, $7f
	bra br_13_cf3a                                                  ; $cee2 : $80, $56

br_13_cee4:
	lda $7fcd96.l                                                  ; $cee4 : $af, $96, $cd, $7f
	bne br_13_cf31                                                  ; $cee8 : $d0, $47

	rep #ACCU_8                                                  ; $ceea : $c2, $20
	lda wPlayerEntity.x.w                                                  ; $ceec : $ad, $dd, $09
	cmp #$16d0.w                                                  ; $ceef : $c9, $d0, $16
	bpl br_13_cf07                                                  ; $cef2 : $10, $13

	rep #IDX_8                                                  ; $cef4 : $c2, $10
	lda $7fcd92.l                                                  ; $cef6 : $af, $92, $cd, $7f
	tax                                                  ; $cefa : $aa
	lda $0005.w, X                                                  ; $cefb : $bd, $05, $00
	sep #IDX_8                                                  ; $cefe : $e2, $10
	cmp #$16c0.w                                                  ; $cf00 : $c9, $c0, $16
	bpl br_13_cf11                                                  ; $cf03 : $10, $0c

	bra br_13_cf48                                                  ; $cf05 : $80, $41

br_13_cf07:
	lda $09e0.w                                                  ; $cf07 : $ad, $e0, $09
	cmp #$0680.w                                                  ; $cf0a : $c9, $80, $06
	bpl br_13_cf11                                                  ; $cf0d : $10, $02

	bra br_13_cf48                                                  ; $cf0f : $80, $37

br_13_cf11:
	sep #ACCU_8                                                  ; $cf11 : $e2, $20
	lda $7fcd90.l                                                  ; $cf13 : $af, $90, $cd, $7f
	cmp #$01.b                                                  ; $cf17 : $c9, $01
	beq br_13_cf3a                                                  ; $cf19 : $f0, $1f

	cmp #$06.b                                                  ; $cf1b : $c9, $06
	beq br_13_cf48                                                  ; $cf1d : $f0, $29

	lda $7fcd97.l                                                  ; $cf1f : $af, $97, $cd, $7f
	bne br_13_cf31                                                  ; $cf23 : $d0, $0c

	lda $7fcd90.l                                                  ; $cf25 : $af, $90, $cd, $7f
	cmp #$02.b                                                  ; $cf29 : $c9, $02
	beq br_13_cf42                                                  ; $cf2b : $f0, $15

	cmp #$05.b                                                  ; $cf2d : $c9, $05
	beq br_13_cf48                                                  ; $cf2f : $f0, $17

br_13_cf31:
	lda #$04.b                                                  ; $cf31 : $a9, $04
	sta $7fcd90.l                                                  ; $cf33 : $8f, $90, $cd, $7f
	lda #$01.b                                                  ; $cf37 : $a9, $01
	rts                                                  ; $cf39 : $60


br_13_cf3a:
	lda #$06.b                                                  ; $cf3a : $a9, $06
	sta $7fcd90.l                                                  ; $cf3c : $8f, $90, $cd, $7f
	bra br_13_cf48                                                  ; $cf40 : $80, $06

br_13_cf42:
	lda #$05.b                                                  ; $cf42 : $a9, $05
	sta $7fcd90.l                                                  ; $cf44 : $8f, $90, $cd, $7f

br_13_cf48:
	sep #ACCU_8                                                  ; $cf48 : $e2, $20
	lda #$00.b                                                  ; $cf4a : $a9, $00
	rts                                                  ; $cf4c : $60


Call_13_cf4d:
	lda $03                                                  ; $cf4d : $a5, $03
	lsr                                                  ; $cf4f : $4a
	lsr                                                  ; $cf50 : $4a
	and #$02.b                                                  ; $cf51 : $29, $02
	tay                                                  ; $cf53 : $a8
	rep #ACCU_8                                                  ; $cf54 : $c2, $20
	lda $1ea4.w                                                  ; $cf56 : $ad, $a4, $1e
	sec                                                  ; $cf59 : $38
	sbc $ceb1.w, Y                                                  ; $cf5a : $f9, $b1, $ce
	sta $1ea4.w                                                  ; $cf5d : $8d, $a4, $1e
	lda $08                                                  ; $cf60 : $a5, $08
	clc                                                  ; $cf62 : $18
	adc $ceb1.w, Y                                                  ; $cf63 : $79, $b1, $ce
	sta $08                                                  ; $cf66 : $85, $08
	sep #ACCU_8                                                  ; $cf68 : $e2, $20
	rts                                                  ; $cf6a : $60


Call_13_cf6b:
	rep #ACCU_8|F_CARRY                                                  ; $cf6b : $c2, $21
	lda wNewStageScrollX.w                                                  ; $cf6d : $ad, $5d, $1e
	clc                                                  ; $cf70 : $18
	adc #$0018.w                                                  ; $cf71 : $69, $18, $00
	sta $002c.w                                                  ; $cf74 : $8d, $2c, $00
	lda wNewStageScrollY.w                                                  ; $cf77 : $ad, $60, $1e
	clc                                                  ; $cf7a : $18
	adc #$00c8.w                                                  ; $cf7b : $69, $c8, $00
	sta $002e.w                                                  ; $cf7e : $8d, $2e, $00
	and #$00ff.w                                                  ; $cf81 : $29, $ff, $00
	sep #ACCU_8                                                  ; $cf84 : $e2, $20
	tya                                                  ; $cf86 : $98
	jsr $02c411.l                                                  ; $cf87 : $22, $11, $c4, $02
	rts                                                  ; $cf8b : $60


Call_13_cf8c:
	lda $26                                                  ; $cf8c : $a5, $26
	pha                                                  ; $cf8e : $48
	lda #$20.b                                                  ; $cf8f : $a9, $20
	sta $26                                                  ; $cf91 : $85, $26
	rep #ACCU_8                                                  ; $cf93 : $c2, $20
	lda #$ce89.w                                                  ; $cf95 : $a9, $89, $ce
	sta $20                                                  ; $cf98 : $85, $20
	sep #ACCU_8                                                  ; $cf9a : $e2, $20
	jsr Func_4_cb31.l                                                  ; $cf9c : $22, $31, $cb, $04
	pla                                                  ; $cfa0 : $68
	sta $26                                                  ; $cfa1 : $85, $26
	rep #ACCU_8                                                  ; $cfa3 : $c2, $20
	lda #$ce57.w                                                  ; $cfa5 : $a9, $57, $ce
	sta $20                                                  ; $cfa8 : $85, $20
	sep #ACCU_8                                                  ; $cfaa : $e2, $20
	rts                                                  ; $cfac : $60


Call_13_cfad:
	lda $7fcd91.l                                                  ; $cfad : $af, $91, $cd, $7f
	beq br_13_cfdc                                                  ; $cfb1 : $f0, $29

	bit #$01.b                                                  ; $cfb3 : $89, $01
	bne br_13_cfe1                                                  ; $cfb5 : $d0, $2a

	bit #$01.b                                                  ; $cfb7 : $89, $01
	rep #ACCU_8|IDX_8                                                  ; $cfb9 : $c2, $30
	bne br_13_cfc4                                                  ; $cfbb : $d0, $07

	lda $7fcd92.l                                                  ; $cfbd : $af, $92, $cd, $7f
	tax                                                  ; $cfc1 : $aa
	bra br_13_cfc9                                                  ; $cfc2 : $80, $05

br_13_cfc4:
	lda $7fcd94.l                                                  ; $cfc4 : $af, $94, $cd, $7f
	tax                                                  ; $cfc8 : $aa

br_13_cfc9:
	lda $0005.w, X                                                  ; $cfc9 : $bd, $05, $00
	sep #IDX_8                                                  ; $cfcc : $e2, $10
	sec                                                  ; $cfce : $38
	sbc $05                                                  ; $cfcf : $e5, $05
	bpl br_13_cfd7                                                  ; $cfd1 : $10, $04

	eor #$ffff.w                                                  ; $cfd3 : $49, $ff, $ff
	ina                                                  ; $cfd6 : $1a

br_13_cfd7:
	cmp #$0024.w                                                  ; $cfd7 : $c9, $24, $00
	bmi br_13_cfe1                                                  ; $cfda : $30, $05

br_13_cfdc:
	sep #ACCU_8                                                  ; $cfdc : $e2, $20
	lda #$00.b                                                  ; $cfde : $a9, $00
	rts                                                  ; $cfe0 : $60


br_13_cfe1:
	sep #ACCU_8                                                  ; $cfe1 : $e2, $20
	lda #$01.b                                                  ; $cfe3 : $a9, $01
	rts                                                  ; $cfe5 : $60


Call_13_cfe6:
	rep #ACCU_8                                                  ; $cfe6 : $c2, $20
	lda #$0fd8.w                                                  ; $cfe8 : $a9, $d8, $0f
	sta $002c.w                                                  ; $cfeb : $8d, $2c, $00
	lda #$0518.w                                                  ; $cfee : $a9, $18, $05
	sta $002e.w                                                  ; $cff1 : $8d, $2e, $00
	and #$00ff.w                                                  ; $cff4 : $29, $ff, $00
	sep #ACCU_8                                                  ; $cff7 : $e2, $20
	tya                                                  ; $cff9 : $98
	clc                                                  ; $cffa : $18
	adc #$0f.b                                                  ; $cffb : $69, $0f
	jsr $02c411.l                                                  ; $cffd : $22, $11, $c4, $02
	rts                                                  ; $d001 : $60


Call_13_d002:
	rep #ACCU_8                                                  ; $d002 : $c2, $20
	lda #$0f90.w                                                  ; $d004 : $a9, $90, $0f
	sta $002c.w                                                  ; $d007 : $8d, $2c, $00
	lda #$0538.w                                                  ; $d00a : $a9, $38, $05
	sta $002e.w                                                  ; $d00d : $8d, $2e, $00
	and #$00ff.w                                                  ; $d010 : $29, $ff, $00
	sep #ACCU_8                                                  ; $d013 : $e2, $20
	tya                                                  ; $d015 : $98
	jsr $02c411.l                                                  ; $d016 : $22, $11, $c4, $02
	rts                                                  ; $d01a : $60


Call_13_d01b:
	rep #ACCU_8                                                  ; $d01b : $c2, $20
	lda $1c                                                  ; $d01d : $a5, $1c
	eor #$ffff.w                                                  ; $d01f : $49, $ff, $ff
	sta $1c                                                  ; $d022 : $85, $1c
	lda $1a                                                  ; $d024 : $a5, $1a
	eor #$ffff.w                                                  ; $d026 : $49, $ff, $ff
	sta $1a                                                  ; $d029 : $85, $1a
	sep #ACCU_8                                                  ; $d02b : $e2, $20
	rts                                                  ; $d02d : $60


Call_13_d02e:
	asl                                                  ; $d02e : $0a
	asl                                                  ; $d02f : $0a
	tax                                                  ; $d030 : $aa
	rep #ACCU_8                                                  ; $d031 : $c2, $20
	lda $e18e.w, X                                                  ; $d033 : $bd, $8e, $e1
	asl                                                  ; $d036 : $0a
	sta $1a                                                  ; $d037 : $85, $1a
	lda $e190.w, X                                                  ; $d039 : $bd, $90, $e1
	asl                                                  ; $d03c : $0a
	sta $1c                                                  ; $d03d : $85, $1c
	sep #ACCU_8                                                  ; $d03f : $e2, $20
	rts                                                  ; $d041 : $60


Call_13_d042:
	rep #ACCU_8                                                  ; $d042 : $c2, $20
	lda wPlayerEntity.x.w                                                  ; $d044 : $ad, $dd, $09
	and #$00ff.w                                                  ; $d047 : $29, $ff, $00
	cmp #$00c8.w                                                  ; $d04a : $c9, $c8, $00
	sep #ACCU_8                                                  ; $d04d : $e2, $20
	bmi br_13_d05a                                                  ; $d04f : $30, $09

	jsr $04d0c0.l                                                  ; $d051 : $22, $c0, $d0, $04
	stz $35                                                  ; $d055 : $64, $35
	lda #$01.b                                                  ; $d057 : $a9, $01
	rts                                                  ; $d059 : $60


br_13_d05a:
	lda #$00.b                                                  ; $d05a : $a9, $00
	rts                                                  ; $d05c : $60


Call_13_d05d:
	rep #ACCU_8                                                  ; $d05d : $c2, $20
	lda $05                                                  ; $d05f : $a5, $05
	sta wPlayerEntity.x.w                                                  ; $d061 : $8d, $dd, $09
	lda $08                                                  ; $d064 : $a5, $08
	sta $09e0.w                                                  ; $d066 : $8d, $e0, $09
	sep #ACCU_8                                                  ; $d069 : $e2, $20
	rts                                                  ; $d06b : $60


Call_13_d06c:
	rep #ACCU_8                                                  ; $d06c : $c2, $20
	lda $05                                                  ; $d06e : $a5, $05
	and #$00ff.w                                                  ; $d070 : $29, $ff, $00
	cmp #$00d8.w                                                  ; $d073 : $c9, $d8, $00
	bmi br_13_d08f                                                  ; $d076 : $30, $17

	lda wNewStageScrollX.w                                                  ; $d078 : $ad, $5d, $1e
	clc                                                  ; $d07b : $18
	adc #$00d8.w                                                  ; $d07c : $69, $d8, $00
	sta $05                                                  ; $d07f : $85, $05
	lda wNewStageScrollY.w                                                  ; $d081 : $ad, $60, $1e
	clc                                                  ; $d084 : $18
	adc #$002b.w                                                  ; $d085 : $69, $2b, $00
	sta $08                                                  ; $d088 : $85, $08
	sep #ACCU_8                                                  ; $d08a : $e2, $20
	lda #$00.b                                                  ; $d08c : $a9, $00
	rts                                                  ; $d08e : $60


br_13_d08f:
	sep #ACCU_8                                                  ; $d08f : $e2, $20
	lda #$01.b                                                  ; $d091 : $a9, $01
	rts                                                  ; $d093 : $60


Call_13_d094:
	rep #IDX_8                                                  ; $d094 : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $d096 : $22, $a7, $d8, $02
	bne br_13_d0cb                                                  ; $d09a : $d0, $2f

	inc $0000.w, X                                                  ; $d09c : $fe, $00, $00
	lda #$67.b                                                  ; $d09f : $a9, $67
	sta $000a.w, X                                                  ; $d0a1 : $9d, $0a, $00
	lda $18                                                  ; $d0a4 : $a5, $18
	sta $0018.w, X                                                  ; $d0a6 : $9d, $18, $00
	lda $16                                                  ; $d0a9 : $a5, $16
	sta $0016.w, X                                                  ; $d0ab : $9d, $16, $00
	lda $11                                                  ; $d0ae : $a5, $11
	sta $0011.w, X                                                  ; $d0b0 : $9d, $11, $00
	stz $0002.w, X                                                  ; $d0b3 : $9e, $02, $00
	jsr Call_13_d0ce.w                                                  ; $d0b6 : $20, $ce, $d0
	rep #ACCU_8                                                  ; $d0b9 : $c2, $20
	lda $05                                                  ; $d0bb : $a5, $05
	sta $0005.w, X                                                  ; $d0bd : $9d, $05, $00
	lda $08                                                  ; $d0c0 : $a5, $08
	sta $0008.w, X                                                  ; $d0c2 : $9d, $08, $00
	tdc                                                  ; $d0c5 : $7b
	sta $003e.w, X                                                  ; $d0c6 : $9d, $3e, $00
	sep #ACCU_8                                                  ; $d0c9 : $e2, $20

br_13_d0cb:
	sep #IDX_8                                                  ; $d0cb : $e2, $10
	rts                                                  ; $d0cd : $60


Call_13_d0ce:
	rep #ACCU_8|IDX_8                                                  ; $d0ce : $c2, $30
	tya                                                  ; $d0d0 : $98
	and #$00ff.w                                                  ; $d0d1 : $29, $ff, $00
	beq br_13_d0e9                                                  ; $d0d4 : $f0, $13

	cmp #$0001.w                                                  ; $d0d6 : $c9, $01, $00
	beq br_13_d103                                                  ; $d0d9 : $f0, $28

	cmp #$0002.w                                                  ; $d0db : $c9, $02, $00
	beq br_13_d116                                                  ; $d0de : $f0, $36

	stz $001a.w, X                                                  ; $d0e0 : $9e, $1a, $00
	stz $001c.w, X                                                  ; $d0e3 : $9e, $1c, $00
	sep #ACCU_8                                                  ; $d0e6 : $e2, $20
	rts                                                  ; $d0e8 : $60


br_13_d0e9:
	lda $1a                                                  ; $d0e9 : $a5, $1a
	sec                                                  ; $d0eb : $38
	ror                                                  ; $d0ec : $6a
	sec                                                  ; $d0ed : $38
	ror                                                  ; $d0ee : $6a
	sta $001a.w, X                                                  ; $d0ef : $9d, $1a, $00
	lda $1c                                                  ; $d0f2 : $a5, $1c
	clc                                                  ; $d0f4 : $18
	bpl br_13_d0f8                                                  ; $d0f5 : $10, $01

	sec                                                  ; $d0f7 : $38

br_13_d0f8:
	ror                                                  ; $d0f8 : $6a
	clc                                                  ; $d0f9 : $18
	bpl br_13_d0fd                                                  ; $d0fa : $10, $01

	sec                                                  ; $d0fc : $38

br_13_d0fd:
	ror                                                  ; $d0fd : $6a
	sta $001c.w, X                                                  ; $d0fe : $9d, $1c, $00
	bra br_13_d138                                                  ; $d101 : $80, $35

br_13_d103:
	lda $1a                                                  ; $d103 : $a5, $1a
	sec                                                  ; $d105 : $38
	ror                                                  ; $d106 : $6a
	sta $001a.w, X                                                  ; $d107 : $9d, $1a, $00
	lda $1c                                                  ; $d10a : $a5, $1c
	clc                                                  ; $d10c : $18
	bpl br_13_d110                                                  ; $d10d : $10, $01

	sec                                                  ; $d10f : $38

br_13_d110:
	ror                                                  ; $d110 : $6a
	sta $001c.w, X                                                  ; $d111 : $9d, $1c, $00
	bra br_13_d138                                                  ; $d114 : $80, $22

br_13_d116:
	lda $1a                                                  ; $d116 : $a5, $1a
	sec                                                  ; $d118 : $38
	ror                                                  ; $d119 : $6a
	sta $34                                                  ; $d11a : $85, $34
	sec                                                  ; $d11c : $38
	ror                                                  ; $d11d : $6a
	clc                                                  ; $d11e : $18
	adc $34                                                  ; $d11f : $65, $34
	sta $001a.w, X                                                  ; $d121 : $9d, $1a, $00
	lda $1c                                                  ; $d124 : $a5, $1c
	clc                                                  ; $d126 : $18
	bpl br_13_d12a                                                  ; $d127 : $10, $01

	sec                                                  ; $d129 : $38

br_13_d12a:
	ror                                                  ; $d12a : $6a
	sta $34                                                  ; $d12b : $85, $34
	clc                                                  ; $d12d : $18
	bpl br_13_d131                                                  ; $d12e : $10, $01

	sec                                                  ; $d130 : $38

br_13_d131:
	ror                                                  ; $d131 : $6a
	clc                                                  ; $d132 : $18
	adc $34                                                  ; $d133 : $65, $34
	sta $001c.w, X                                                  ; $d135 : $9d, $1c, $00

br_13_d138:
	sep #ACCU_8                                                  ; $d138 : $e2, $20
	rts                                                  ; $d13a : $60


Call_13_d13b:
	lda $7fcd91.l                                                  ; $d13b : $af, $91, $cd, $7f
	beq br_13_d162                                                  ; $d13f : $f0, $21

	rep #ACCU_8                                                  ; $d141 : $c2, $20
	lda $08                                                  ; $d143 : $a5, $08
	and #$00ff.w                                                  ; $d145 : $29, $ff, $00
	cmp #$0070.w                                                  ; $d148 : $c9, $70, $00
	bmi br_13_d162                                                  ; $d14b : $30, $15

	rep #ACCU_8|IDX_8                                                  ; $d14d : $c2, $30
	lda $7fcd92.l                                                  ; $d14f : $af, $92, $cd, $7f
	tax                                                  ; $d153 : $aa
	lda $0005.w, X                                                  ; $d154 : $bd, $05, $00
	and #$00ff.w                                                  ; $d157 : $29, $ff, $00
	cmp #$00c8.w                                                  ; $d15a : $c9, $c8, $00
	bmi br_13_d162                                                  ; $d15d : $30, $03

	inc $0037.w, X                                                  ; $d15f : $fe, $37, $00

br_13_d162:
	sep #ACCU_8|IDX_8                                                  ; $d162 : $e2, $30
	rts                                                  ; $d164 : $60


Call_13_d165:
	rep #ACCU_8|IDX_8                                                  ; $d165 : $c2, $30
	ldx $3e                                                  ; $d167 : $a6, $3e
	lda $0008.w, X                                                  ; $d169 : $bd, $08, $00
	sec                                                  ; $d16c : $38
	sbc $0024.w, X                                                  ; $d16d : $fd, $24, $00
	sta $0000.w                                                  ; $d170 : $8d, $00, $00
	lda $08                                                  ; $d173 : $a5, $08
	clc                                                  ; $d175 : $18
	adc $0000.w                                                  ; $d176 : $6d, $00, $00
	sta $08                                                  ; $d179 : $85, $08
	sep #ACCU_8|IDX_8                                                  ; $d17b : $e2, $30
	rts                                                  ; $d17d : $60


Call_13_d17e:
	lda #$0d.b                                                  ; $d17e : $a9, $0d
	jsr $02d9c0.l                                                  ; $d180 : $22, $c0, $d9, $02
	lda #$0c.b                                                  ; $d184 : $a9, $0c
	jsr $02d9c0.l                                                  ; $d186 : $22, $c0, $d9, $02
	lda #$0c.b                                                  ; $d18a : $a9, $0c
	jsr $02d9c0.l                                                  ; $d18c : $22, $c0, $d9, $02
	lda #$0c.b                                                  ; $d190 : $a9, $0c
	jsr $02d9c0.l                                                  ; $d192 : $22, $c0, $d9, $02
	rts                                                  ; $d196 : $60


Call_13_d197:
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $d197 : $22, $a7, $d8, $02
	bne br_13_d1cc                                                  ; $d19b : $d0, $2f

	rep #IDX_8                                                  ; $d19d : $c2, $10
	inc $0000.w, X                                                  ; $d19f : $fe, $00, $00
	lda #$68.b                                                  ; $d1a2 : $a9, $68
	sta $000a.w, X                                                  ; $d1a4 : $9d, $0a, $00
	lda $18                                                  ; $d1a7 : $a5, $18
	sta $0018.w, X                                                  ; $d1a9 : $9d, $18, $00
	lda $16                                                  ; $d1ac : $a5, $16
	sta $0016.w, X                                                  ; $d1ae : $9d, $16, $00
	lda $11                                                  ; $d1b1 : $a5, $11
	sta $0011.w, X                                                  ; $d1b3 : $9d, $11, $00
	lda #$04.b                                                  ; $d1b6 : $a9, $04
	sta $0002.w, X                                                  ; $d1b8 : $9d, $02, $00
	tya                                                  ; $d1bb : $98
	sta $000b.w, X                                                  ; $d1bc : $9d, $0b, $00
	phx                                                  ; $d1bf : $da
	jsr Call_13_d1cd.w                                                  ; $d1c0 : $20, $cd, $d1
	plx                                                  ; $d1c3 : $fa
	rep #ACCU_8                                                  ; $d1c4 : $c2, $20
	tdc                                                  ; $d1c6 : $7b
	sta $003e.w, X                                                  ; $d1c7 : $9d, $3e, $00
	sep #ACCU_8|IDX_8                                                  ; $d1ca : $e2, $30

br_13_d1cc:
	rts                                                  ; $d1cc : $60


Call_13_d1cd:
	php                                                  ; $d1cd : $08
	rep #ACCU_8|IDX_8                                                  ; $d1ce : $c2, $30
	tya                                                  ; $d1d0 : $98
	and #$00ff.w                                                  ; $d1d1 : $29, $ff, $00
	asl                                                  ; $d1d4 : $0a
	asl                                                  ; $d1d5 : $0a
	tay                                                  ; $d1d6 : $a8
	lda $05                                                  ; $d1d7 : $a5, $05
	clc                                                  ; $d1d9 : $18
	adc $ceb5.w, Y                                                  ; $d1da : $79, $b5, $ce
	sta $0005.w, X                                                  ; $d1dd : $9d, $05, $00
	lda $08                                                  ; $d1e0 : $a5, $08
	clc                                                  ; $d1e2 : $18
	adc $ceb7.w, Y                                                  ; $d1e3 : $79, $b7, $ce
	sta $0008.w, X                                                  ; $d1e6 : $9d, $08, $00
	sep #ACCU_8                                                  ; $d1e9 : $e2, $20
	plp                                                  ; $d1eb : $28
	rts                                                  ; $d1ec : $60


Call_13_d1ed:
	lda #$01.b                                                  ; $d1ed : $a9, $01
	sta $1f19.w                                                  ; $d1ef : $8d, $19, $1f
	jsr $00b5a5.l                                                  ; $d1f2 : $22, $a5, $b5, $00
	phd                                                  ; $d1f6 : $0b
	pea $0000.w                                                  ; $d1f7 : $f4, $00, $00
	pld                                                  ; $d1fa : $2b
	lda #$70.b                                                  ; $d1fb : $a9, $70
	sta $00f2.w                                                  ; $d1fd : $8d, $f2, $00
	jsr $00b4ff.l                                                  ; $d200 : $22, $ff, $b4, $00
	pld                                                  ; $d204 : $2b
	lda #$e0.b                                                  ; $d205 : $a9, $e0
	sta $00cb.w                                                  ; $d207 : $8d, $cb, $00
	lda #$ff.b                                                  ; $d20a : $a9, $ff
	sta $2126.w                                                  ; $d20c : $8d, $26, $21
	stz $2127.w                                                  ; $d20f : $9c, $27, $21
	rep #IDX_8                                                  ; $d212 : $c2, $10
	ldx #$0000.w                                                  ; $d214 : $a2, $00, $00
	ldy #$0054.w                                                  ; $d217 : $a0, $54, $00
	jsr Func_1_804a.l                                                  ; $d21a : $22, $4a, $80, $01
	sep #IDX_8                                                  ; $d21e : $e2, $10
	lda #$80.b                                                  ; $d220 : $a9, $80
	tsb $1f3f.w                                                  ; $d222 : $0c, $3f, $1f
	lda #$02.b                                                  ; $d225 : $a9, $02
	sta $00c6.w                                                  ; $d227 : $8d, $c6, $00
	sta wColourAdditionSelect.w                                                  ; $d22a : $8d, $c9, $00
	lda #$7f.b                                                  ; $d22d : $a9, $7f
	sta wColourMathDesignation.w                                                  ; $d22f : $8d, $ca, $00
	lda #$04.b                                                  ; $d232 : $a9, $04
	sta $1fa9.w                                                  ; $d234 : $8d, $a9, $1f
	sta $212e.w                                                  ; $d237 : $8d, $2e, $21
	sta $1faa.w                                                  ; $d23a : $8d, $aa, $1f
	sta $212f.w                                                  ; $d23d : $8d, $2f, $21
	lda #$03.b                                                  ; $d240 : $a9, $03
	sta $00c4.w                                                  ; $d242 : $8d, $c4, $00
	lda #$13.b                                                  ; $d245 : $a9, $13
	sta wMainScreenDesignation.w                                                  ; $d247 : $8d, $c1, $00
	sta wSubScreenDesignation.w                                                  ; $d24a : $8d, $c2, $00
	rep #ACCU_8|IDX_8                                                  ; $d24d : $c2, $30
	lda #$0070.w                                                  ; $d24f : $a9, $70, $00
	sta $1f60.w                                                  ; $d252 : $8d, $60, $1f
	stz $00bf.w                                                  ; $d255 : $9c, $bf, $00
	stz $00bd.w                                                  ; $d258 : $9c, $bd, $00
	phb                                                  ; $d25b : $8b
	ldx #$cec1.w                                                  ; $d25c : $a2, $c1, $ce
	ldy #$08ed.w                                                  ; $d25f : $a0, $ed, $08
	lda #$000d.w                                                  ; $d262 : $a9, $0d, $00
	mvn $06, $00                                                  ; $d265 : $54, $00, $06
	ldx #$cecf.w                                                  ; $d268 : $a2, $cf, $ce
	ldy #$d000.w                                                  ; $d26b : $a0, $00, $d0

br_13_d26e:
	lda #$0019.w                                                  ; $d26e : $a9, $19, $00
	mvn $06, $7f                                                  ; $d271 : $54, $7f, $06
	plb                                                  ; $d274 : $ab
	ldx #$0028.w                                                  ; $d275 : $a2, $28, $00

br_13_d278:
	lda #$ffff.w                                                  ; $d278 : $a9, $ff, $ff
	sta $7fd040.l, X                                                  ; $d27b : $9f, $40, $d0, $7f
	sta $7fd080.l, X                                                  ; $d27f : $9f, $80, $d0, $7f
	ina                                                  ; $d283 : $1a
	sta $7fd0c0.l, X                                                  ; $d284 : $9f, $c0, $d0, $7f
	sta $7fd100.l, X                                                  ; $d288 : $9f, $00, $d1, $7f
	dex                                                  ; $d28c : $ca
	dex                                                  ; $d28d : $ca
	bpl br_13_d278                                                  ; $d28e : $10, $e8

	sep #ACCU_8|IDX_8                                                  ; $d290 : $e2, $30
	stz $08ed.w                                                  ; $d292 : $9c, $ed, $08
	stz $08f4.w                                                  ; $d295 : $9c, $f4, $08
	rts                                                  ; $d298 : $60


Call_13_d299:
	lda $37                                                  ; $d299 : $a5, $37
	beq br_13_d2a6                                                  ; $d29b : $f0, $09

	lda wMainScreenDesignation.w                                                  ; $d29d : $ad, $c1, $00
	eor #$02.b                                                  ; $d2a0 : $49, $02
	sta wMainScreenDesignation.w                                                  ; $d2a2 : $8d, $c1, $00
	rts                                                  ; $d2a5 : $60


br_13_d2a6:
	lda #$02.b                                                  ; $d2a6 : $a9, $02
	tsb wMainScreenDesignation.w                                                  ; $d2a8 : $0c, $c1, $00
	rts                                                  ; $d2ab : $60


	ldx $01                                                  ; $d2ac : $a6, $01
	jsr ($d2b2.w, X)                                                  ; $d2ae : $fc, $b2, $d2
	rtl                                                  ; $d2b1 : $6b


	ldx $3ed2.w, Y                                                  ; $d2b2 : $be, $d2, $3e
	cmp ($81, S), Y                                                  ; $d2b5 : $d3, $81
	cmp ($1c, S), Y                                                  ; $d2b7 : $d3, $1c
	cmp ($33, S), Y                                                  ; $d2b9 : $d3, $33
	cmp ($39, S), Y                                                  ; $d2bb : $d3, $39
	cmp ($a9, S), Y                                                  ; $d2bd : $d3, $a9
	ora ($85, X)                                                  ; $d2bf : $01, $85
	and [$64]                                                  ; $d2c1 : $27, $64
	bmi br_13_d26e                                                  ; $d2c3 : $30, $a9

	tsb $85                                                  ; $d2c5 : $04, $85
	ora ($a6)                                                  ; $d2c7 : $12, $a6
	phd                                                  ; $d2c9 : $0b
	jsr ($d2df.w, X)                                                  ; $d2ca : $fc, $df, $d2
	lda #$02.b                                                  ; $d2cd : $a9, $02
	sta $01                                                  ; $d2cf : $85, $01
	rep #ACCU_8                                                  ; $d2d1 : $c2, $20
	stz $1a                                                  ; $d2d3 : $64, $1a
	stz $1c                                                  ; $d2d5 : $64, $1c
	lda #$d1b3.w                                                  ; $d2d7 : $a9, $b3, $d1
	sta $20                                                  ; $d2da : $85, $20
	sep #ACCU_8                                                  ; $d2dc : $e2, $20
	rts                                                  ; $d2de : $60


	sbc $d2                                                  ; $d2df : $e5, $d2
	inc $d2, X                                                  ; $d2e1 : $f6, $d2
	ora $a9d3.w                                                  ; $d2e3 : $0d, $d3, $a9
	tsb $85                                                  ; $d2e6 : $04, $85
	rol $a9                                                  ; $d2e8 : $26, $a9
	tsb $85                                                  ; $d2ea : $04, $85
	and $05a9.w, Y                                                  ; $d2ec : $39, $a9, $05
	jsr Func_4_b967.l                                                  ; $d2ef : $22, $67, $b9, $04
	stz $02                                                  ; $d2f3 : $64, $02
	rts                                                  ; $d2f5 : $60


	lda #$04.b                                                  ; $d2f6 : $a9, $04
	sta $26                                                  ; $d2f8 : $85, $26
	lda #$30.b                                                  ; $d2fa : $a9, $30
	sta $37                                                  ; $d2fc : $85, $37
	lda #$04.b                                                  ; $d2fe : $a9, $04
	sta $39                                                  ; $d300 : $85, $39
	lda #$05.b                                                  ; $d302 : $a9, $05
	jsr Func_4_b967.l                                                  ; $d304 : $22, $67, $b9, $04
	lda #$02.b                                                  ; $d308 : $a9, $02
	sta $02                                                  ; $d30a : $85, $02
	rts                                                  ; $d30c : $60


	lda #$04.b                                                  ; $d30d : $a9, $04
	sta $26                                                  ; $d30f : $85, $26
	lda #$05.b                                                  ; $d311 : $a9, $05
	jsr Func_4_b967.l                                                  ; $d313 : $22, $67, $b9, $04
	lda #$04.b                                                  ; $d317 : $a9, $04
	sta $02                                                  ; $d319 : $85, $02
	rts                                                  ; $d31b : $60


	lda $33                                                  ; $d31c : $a5, $33
	bmi br_13_d324                                                  ; $d31e : $30, $04

	dec $30                                                  ; $d320 : $c6, $30
	bne br_13_d33e                                                  ; $d322 : $d0, $1a

br_13_d324:
	jsr SetCarryIfEntityWayOutOfView.l                                                  ; $d324 : $22, $8a, $d5, $02
	bcs br_13_d32e                                                  ; $d328 : $b0, $04

	lda #$01.b                                                  ; $d32a : $a9, $01
	sta $0e                                                  ; $d32c : $85, $0e

br_13_d32e:
	jsr Func_2_db3f.l                                                  ; $d32e : $22, $3f, $db, $02
	rts                                                  ; $d332 : $60


	lda #$02.b                                                  ; $d333 : $a9, $02
	sta $01                                                  ; $d335 : $85, $01
	bra br_13_d33e                                                  ; $d337 : $80, $05

	jsr Func_2_ddf6.l                                                  ; $d339 : $22, $f6, $dd, $02
	rts                                                  ; $d33d : $60


br_13_d33e:
	lda $03                                                  ; $d33e : $a5, $03
	bne br_13_d352                                                  ; $d340 : $d0, $10

	rep #IDX_8                                                  ; $d342 : $c2, $10
	ldx $3e                                                  ; $d344 : $a6, $3e
	lda $0000.w, X                                                  ; $d346 : $bd, $00, $00
	beq br_13_d370                                                  ; $d349 : $f0, $25

	lda $0001.w, X                                                  ; $d34b : $bd, $01, $00
	cmp #$04.b                                                  ; $d34e : $c9, $04
	beq br_13_d370                                                  ; $d350 : $f0, $1e

br_13_d352:
	sep #IDX_8                                                  ; $d352 : $e2, $10
	lda $02                                                  ; $d354 : $a5, $02
	cmp #$06.b                                                  ; $d356 : $c9, $06
	beq br_13_d362                                                  ; $d358 : $f0, $08

	jsr Func_2_d636.l                                                  ; $d35a : $22, $36, $d6, $02
	lda $0e                                                  ; $d35e : $a5, $0e
	beq br_13_d370                                                  ; $d360 : $f0, $0e

br_13_d362:
	ldx $02                                                  ; $d362 : $a6, $02
	jsr ($d379.w, X)                                                  ; $d364 : $fc, $79, $d3
	jsr Func_4_cb31.l                                                  ; $d367 : $22, $31, $cb, $04
	jsr Func_4_b94a.l                                                  ; $d36b : $22, $4a, $b9, $04
	rts                                                  ; $d36f : $60


br_13_d370:
	sep #IDX_8                                                  ; $d370 : $e2, $10
	lda #$04.b                                                  ; $d372 : $a9, $04
	sta $01                                                  ; $d374 : $85, $01
	sta $02                                                  ; $d376 : $85, $02
	rts                                                  ; $d378 : $60


	txa                                                  ; $d379 : $8a
	cmp ($0b, S), Y                                                  ; $d37a : $d3, $0b
	pei ($8c)                                                  ; $d37c : $d4, $8c
	pei ($c5)                                                  ; $d37e : $d4, $c5
	pei ($a5)                                                  ; $d380 : $d4, $a5
	cop $d0.b                                                  ; $d382 : $02, $d0
	.db $00                                                  ; $d384 : $00
	jsr $02d933.l                                                  ; $d385 : $22, $33, $d9, $02
	rts                                                  ; $d389 : $60


	ldx $03                                                  ; $d38a : $a6, $03
	jsr ($d390.w, X)                                                  ; $d38c : $fc, $90, $d3
	rts                                                  ; $d38f : $60


	stx $d3, Y                                                  ; $d390 : $96, $d3
	tax                                                  ; $d392 : $aa
	cmp ($cb, S), Y                                                  ; $d393 : $d3, $cb
	cmp ($c2, S), Y                                                  ; $d395 : $d3, $c2
	.db $10, $a6                                                  ; $d397 : $10, $a6

	rol $35bd.w, X                                                  ; $d399 : $3e, $bd, $35
	.db $00                                                  ; $d39c : $00
	sep #IDX_8                                                  ; $d39d : $e2, $10
	lsr                                                  ; $d39f : $4a
	lsr                                                  ; $d3a0 : $4a
	cmp #$02.b                                                  ; $d3a1 : $c9, $02
	bne br_13_d3a9                                                  ; $d3a3 : $d0, $04

	lda #$02.b                                                  ; $d3a5 : $a9, $02
	sta $03                                                  ; $d3a7 : $85, $03

br_13_d3a9:
	rts                                                  ; $d3a9 : $60


	lda $11                                                  ; $d3aa : $a5, $11
	bit #$40.b                                                  ; $d3ac : $89, $40
	rep #ACCU_8                                                  ; $d3ae : $c2, $20
	beq br_13_d3b7                                                  ; $d3b0 : $f0, $05

	lda #$0300.w                                                  ; $d3b2 : $a9, $00, $03
	bra br_13_d3ba                                                  ; $d3b5 : $80, $03

br_13_d3b7:
	lda #$fd00.w                                                  ; $d3b7 : $a9, $00, $fd

br_13_d3ba:
	sta $1a                                                  ; $d3ba : $85, $1a
	stz $1c                                                  ; $d3bc : $64, $1c
	sep #ACCU_8                                                  ; $d3be : $e2, $20
	lda #$06.b                                                  ; $d3c0 : $a9, $06
	jsr Func_4_b967.l                                                  ; $d3c2 : $22, $67, $b9, $04
	lda #$04.b                                                  ; $d3c6 : $a9, $04
	sta $03                                                  ; $d3c8 : $85, $03
	rts                                                  ; $d3ca : $60


	jsr $02d78e.l                                                  ; $d3cb : $22, $8e, $d7, $02
	jsr $04c0f7.l                                                  ; $d3cf : $22, $f7, $c0, $04
	lda $2b                                                  ; $d3d3 : $a5, $2b
	and #$7f.b                                                  ; $d3d5 : $29, $7f
	beq br_13_d40a                                                  ; $d3d7 : $f0, $31

	bit #$0c.b                                                  ; $d3d9 : $89, $0c
	beq br_13_d3e9                                                  ; $d3db : $f0, $0c

	rep #ACCU_8                                                  ; $d3dd : $c2, $20
	lda $1c                                                  ; $d3df : $a5, $1c
	eor #$ffff.w                                                  ; $d3e1 : $49, $ff, $ff
	ina                                                  ; $d3e4 : $1a
	sta $1c                                                  ; $d3e5 : $85, $1c
	bra br_13_d3fe                                                  ; $d3e7 : $80, $15

br_13_d3e9:
	lda $39                                                  ; $d3e9 : $a5, $39
	cmp #$d004.w                                                  ; $d3eb : $c9, $04, $d0
	ora $20                                                  ; $d3ee : $05, $20
	sbc $0a80d4.l                                                  ; $d3f0 : $ef, $d4, $80, $0a
	rep #ACCU_8                                                  ; $d3f4 : $c2, $20
	lda $1a                                                  ; $d3f6 : $a5, $1a
	eor #$ffff.w                                                  ; $d3f8 : $49, $ff, $ff
	ina                                                  ; $d3fb : $1a
	sta $1a                                                  ; $d3fc : $85, $1a

br_13_d3fe:
	sep #ACCU_8                                                  ; $d3fe : $e2, $20
	dec $39                                                  ; $d400 : $c6, $39
	bne br_13_d40a                                                  ; $d402 : $d0, $06

	lda #$04.b                                                  ; $d404 : $a9, $04
	sta $01                                                  ; $d406 : $85, $01
	sta $02                                                  ; $d408 : $85, $02

br_13_d40a:
	rts                                                  ; $d40a : $60


	ldx $03                                                  ; $d40b : $a6, $03
	jsr ($d411.w, X)                                                  ; $d40d : $fc, $11, $d4
	rts                                                  ; $d410 : $60


	ora $d4, X                                                  ; $d411 : $15, $d4
	adc $10c2d4.l                                                  ; $d413 : $6f, $d4, $c2, $10
	ldx $3e                                                  ; $d417 : $a6, $3e
	lda $0035.w, X                                                  ; $d419 : $bd, $35, $00
	sep #IDX_8                                                  ; $d41c : $e2, $10
	lsr                                                  ; $d41e : $4a
	lsr                                                  ; $d41f : $4a
	cmp #$03.b                                                  ; $d420 : $c9, $03
	bne br_13_d454                                                  ; $d422 : $d0, $30

	lda $37                                                  ; $d424 : $a5, $37
	beq br_13_d42f                                                  ; $d426 : $f0, $07

	stz $02                                                  ; $d428 : $64, $02
	lda #$02.b                                                  ; $d42a : $a9, $02
	sta $03                                                  ; $d42c : $85, $03
	rts                                                  ; $d42e : $60


br_13_d42f:
	lda $11                                                  ; $d42f : $a5, $11
	bit #$40.b                                                  ; $d431 : $89, $40
	rep #ACCU_8                                                  ; $d433 : $c2, $20
	beq br_13_d43c                                                  ; $d435 : $f0, $05

	lda #$0500.w                                                  ; $d437 : $a9, $00, $05
	bra br_13_d43f                                                  ; $d43a : $80, $03

br_13_d43c:
	lda #$fb00.w                                                  ; $d43c : $a9, $00, $fb

br_13_d43f:
	sta $1a                                                  ; $d43f : $85, $1a
	stz $1c                                                  ; $d441 : $64, $1c
	sep #ACCU_8                                                  ; $d443 : $e2, $20
	lda #$08.b                                                  ; $d445 : $a9, $08
	jsr Func_4_b967.l                                                  ; $d447 : $22, $67, $b9, $04
	lda #$08.b                                                  ; $d44b : $a9, $08
	sta $26                                                  ; $d44d : $85, $26
	lda #$02.b                                                  ; $d44f : $a9, $02
	sta $03                                                  ; $d451 : $85, $03
	rts                                                  ; $d453 : $60


br_13_d454:
	lda $37                                                  ; $d454 : $a5, $37
	beq br_13_d464                                                  ; $d456 : $f0, $0c

	dec $37                                                  ; $d458 : $c6, $37
	bne br_13_d46e                                                  ; $d45a : $d0, $12

	lda #$07.b                                                  ; $d45c : $a9, $07
	jsr Func_4_b967.l                                                  ; $d45e : $22, $67, $b9, $04
	bra br_13_d46e                                                  ; $d462 : $80, $0a

br_13_d464:
	lda $0f                                                  ; $d464 : $a5, $0f
	bpl br_13_d46e                                                  ; $d466 : $10, $06

	lda #$08.b                                                  ; $d468 : $a9, $08
	jsr Func_4_b967.l                                                  ; $d46a : $22, $67, $b9, $04

br_13_d46e:
	rts                                                  ; $d46e : $60


	jsr $02d78e.l                                                  ; $d46f : $22, $8e, $d7, $02
	jsr $04c0f7.l                                                  ; $d473 : $22, $f7, $c0, $04
	lda $2b                                                  ; $d477 : $a5, $2b
	and #$7f.b                                                  ; $d479 : $29, $7f
	beq br_13_d48b                                                  ; $d47b : $f0, $0e

	jsr Call_13_d4ef.w                                                  ; $d47d : $20, $ef, $d4
	jsr Call_13_d52d.w                                                  ; $d480 : $20, $2d, $d5
	dec $39                                                  ; $d483 : $c6, $39
	stz $02                                                  ; $d485 : $64, $02
	lda #$04.b                                                  ; $d487 : $a9, $04
	sta $03                                                  ; $d489 : $85, $03

br_13_d48b:
	rts                                                  ; $d48b : $60


	ldx $03                                                  ; $d48c : $a6, $03
	jsr ($d492.w, X)                                                  ; $d48e : $fc, $92, $d4
	rts                                                  ; $d491 : $60


	stx $d4, Y                                                  ; $d492 : $96, $d4
	lda ($d4, S), Y                                                  ; $d494 : $b3, $d4
	rep #IDX_8                                                  ; $d496 : $c2, $10
	ldx $3e                                                  ; $d498 : $a6, $3e
	lda $0035.w, X                                                  ; $d49a : $bd, $35, $00
	lsr                                                  ; $d49d : $4a
	lsr                                                  ; $d49e : $4a
	cmp #$02.b                                                  ; $d49f : $c9, $02
	bne br_13_d4b0                                                  ; $d4a1 : $d0, $0d

	jsr Call_13_d547.w                                                  ; $d4a3 : $20, $47, $d5
	lda #$06.b                                                  ; $d4a6 : $a9, $06
	jsr Func_4_b967.l                                                  ; $d4a8 : $22, $67, $b9, $04
	lda #$02.b                                                  ; $d4ac : $a9, $02
	sta $03                                                  ; $d4ae : $85, $03

br_13_d4b0:
	sep #IDX_8                                                  ; $d4b0 : $e2, $10
	rts                                                  ; $d4b2 : $60


	jsr $02d78e.l                                                  ; $d4b3 : $22, $8e, $d7, $02
	jsr Call_13_d55c.w                                                  ; $d4b7 : $20, $5c, $d5
	beq br_13_d4c4                                                  ; $d4ba : $f0, $08

	lda #$06.b                                                  ; $d4bc : $a9, $06
	sta $02                                                  ; $d4be : $85, $02
	lda #$30.b                                                  ; $d4c0 : $a9, $30
	sta $37                                                  ; $d4c2 : $85, $37

br_13_d4c4:
	rts                                                  ; $d4c4 : $60


	lda $37                                                  ; $d4c5 : $a5, $37
	beq br_13_d4e8                                                  ; $d4c7 : $f0, $1f

	cmp #$20.b                                                  ; $d4c9 : $c9, $20
	bpl br_13_d4d7                                                  ; $d4cb : $10, $0a

	cmp #$10.b                                                  ; $d4cd : $c9, $10
	bpl br_13_d4dd                                                  ; $d4cf : $10, $0c

	and #$07.b                                                  ; $d4d1 : $29, $07
	bne br_13_d4e5                                                  ; $d4d3 : $d0, $10

	bra br_13_d4e1                                                  ; $d4d5 : $80, $0a

br_13_d4d7:
	and #$01.b                                                  ; $d4d7 : $29, $01
	bne br_13_d4e5                                                  ; $d4d9 : $d0, $0a

	bra br_13_d4e1                                                  ; $d4db : $80, $04

br_13_d4dd:
	and #$03.b                                                  ; $d4dd : $29, $03
	bne br_13_d4e5                                                  ; $d4df : $d0, $04

br_13_d4e1:
	jsr Func_2_d636.l                                                  ; $d4e1 : $22, $36, $d6, $02

br_13_d4e5:
	dec $37                                                  ; $d4e5 : $c6, $37
	rts                                                  ; $d4e7 : $60


br_13_d4e8:
	lda #$04.b                                                  ; $d4e8 : $a9, $04
	sta $01                                                  ; $d4ea : $85, $01
	sta $02                                                  ; $d4ec : $85, $02
	rts                                                  ; $d4ee : $60


Call_13_d4ef:
	rep #ACCU_8                                                  ; $d4ef : $c2, $20
	lda $1a                                                  ; $d4f1 : $a5, $1a
	sep #ACCU_8                                                  ; $d4f3 : $e2, $20
	bmi br_13_d4fe                                                  ; $d4f5 : $30, $07

	ldx $35                                                  ; $d4f7 : $a6, $35
	lda $d1c7.w, X                                                  ; $d4f9 : $bd, $c7, $d1
	bra br_13_d507                                                  ; $d4fc : $80, $09

br_13_d4fe:
	lda $35                                                  ; $d4fe : $a5, $35
	clc                                                  ; $d500 : $18
	adc #$02.b                                                  ; $d501 : $69, $02
	tax                                                  ; $d503 : $aa
	lda $d1c7.w, X                                                  ; $d504 : $bd, $c7, $d1

br_13_d507:
	sta $38                                                  ; $d507 : $85, $38
	asl                                                  ; $d509 : $0a
	asl                                                  ; $d50a : $0a
	tax                                                  ; $d50b : $aa
	rep #ACCU_8                                                  ; $d50c : $c2, $20
	lda $e18e.w, X                                                  ; $d50e : $bd, $8e, $e1
	clc                                                  ; $d511 : $18
	bpl br_13_d515                                                  ; $d512 : $10, $01

	sec                                                  ; $d514 : $38

br_13_d515:
	ror                                                  ; $d515 : $6a
	clc                                                  ; $d516 : $18
	adc $e18e.w, X                                                  ; $d517 : $7d, $8e, $e1
	sta $1a                                                  ; $d51a : $85, $1a
	lda $e190.w, X                                                  ; $d51c : $bd, $90, $e1
	clc                                                  ; $d51f : $18
	bpl br_13_d523                                                  ; $d520 : $10, $01

	sec                                                  ; $d522 : $38

br_13_d523:
	ror                                                  ; $d523 : $6a
	clc                                                  ; $d524 : $18
	adc $e190.w, X                                                  ; $d525 : $7d, $90, $e1
	sta $1c                                                  ; $d528 : $85, $1c
	sep #ACCU_8                                                  ; $d52a : $e2, $20
	rts                                                  ; $d52c : $60


Call_13_d52d:
	lda $38                                                  ; $d52d : $a5, $38
	asl                                                  ; $d52f : $0a
	asl                                                  ; $d530 : $0a
	tax                                                  ; $d531 : $aa
	rep #ACCU_8                                                  ; $d532 : $c2, $20
	lda $e18e.w, X                                                  ; $d534 : $bd, $8e, $e1
	clc                                                  ; $d537 : $18
	adc $1a                                                  ; $d538 : $65, $1a
	sta $1a                                                  ; $d53a : $85, $1a
	lda $e190.w, X                                                  ; $d53c : $bd, $90, $e1
	clc                                                  ; $d53f : $18
	adc $1c                                                  ; $d540 : $65, $1c
	sta $1c                                                  ; $d542 : $85, $1c
	sep #ACCU_8                                                  ; $d544 : $e2, $20
	rts                                                  ; $d546 : $60


Call_13_d547:
	lda $35                                                  ; $d547 : $a5, $35
	rep #ACCU_8                                                  ; $d549 : $c2, $20
	bne br_13_d552                                                  ; $d54b : $d0, $05

	lda #$fd00.w                                                  ; $d54d : $a9, $00, $fd
	bra br_13_d555                                                  ; $d550 : $80, $03

br_13_d552:
	lda #$0300.w                                                  ; $d552 : $a9, $00, $03

br_13_d555:
	sta $1c                                                  ; $d555 : $85, $1c
	stz $1a                                                  ; $d557 : $64, $1a
	sep #ACCU_8                                                  ; $d559 : $e2, $20
	rts                                                  ; $d55b : $60


Call_13_d55c:
	ldx #$09.b                                                  ; $d55c : $a2, $09
	lda $35                                                  ; $d55e : $a5, $35
	beq br_13_d564                                                  ; $d560 : $f0, $02

	ldx #$f7.b                                                  ; $d562 : $a2, $f7

br_13_d564:
	stx $2a                                                  ; $d564 : $86, $2a
	stz $29                                                  ; $d566 : $64, $29
	jsr Func_4_be4f.l                                                  ; $d568 : $22, $4f, $be, $04
	and #$7f.b                                                  ; $d56c : $29, $7f
	bne br_13_d587                                                  ; $d56e : $d0, $17

	ldx #$0b.b                                                  ; $d570 : $a2, $0b
	lda $11                                                  ; $d572 : $a5, $11
	bit #$40.b                                                  ; $d574 : $89, $40
	beq br_13_d57a                                                  ; $d576 : $f0, $02

	ldx #$f5.b                                                  ; $d578 : $a2, $f5

br_13_d57a:
	stx $29                                                  ; $d57a : $86, $29
	jsr Func_4_be4f.l                                                  ; $d57c : $22, $4f, $be, $04
	and #$7f.b                                                  ; $d580 : $29, $7f
	beq br_13_d587                                                  ; $d582 : $f0, $03

	lda #$00.b                                                  ; $d584 : $a9, $00
	rts                                                  ; $d586 : $60


br_13_d587:
	lda #$01.b                                                  ; $d587 : $a9, $01
	rts                                                  ; $d589 : $60


	lda $0b                                                  ; $d58a : $a5, $0b
	bne br_13_d59f                                                  ; $d58c : $d0, $11

	ldx $01                                                  ; $d58e : $a6, $01
	jmp ($d593.w, X)                                                  ; $d590 : $7c, $93, $d5


	ora [$d6]                                                  ; $d593 : $07, $d6
	.db $62, $d7, $22                                                  ; $d595 : $62, $d7, $22

	phx                                                  ; $d598 : $da
	sbc $d5                                                  ; $d599 : $e5, $d5
	sbc ($d5), Y                                                  ; $d59b : $f1, $d5
	sbc [$d5], Y                                                  ; $d59d : $f7, $d5

br_13_d59f:
	lda $02                                                  ; $d59f : $a5, $02
	bne br_13_d5d5                                                  ; $d5a1 : $d0, $32

	lda #$02.b                                                  ; $d5a3 : $a9, $02
	sta $28                                                  ; $d5a5 : $85, $28
	sta $30                                                  ; $d5a7 : $85, $30
	rep #ACCU_8|IDX_8                                                  ; $d5a9 : $c2, $30
	phb                                                  ; $d5ab : $8b
	ldx #$03a0.w                                                  ; $d5ac : $a2, $a0, $03
	ldy #$c9e0.w                                                  ; $d5af : $a0, $e0, $c9
	lda #$005f.w                                                  ; $d5b2 : $a9, $5f, $00
	mvn $00, $7f                                                  ; $d5b5 : $54, $7f, $00
	plb                                                  ; $d5b8 : $ab
	ldx #$005e.w                                                  ; $d5b9 : $a2, $5e, $00
	lda #$0000.w                                                  ; $d5bc : $a9, $00, $00

br_13_d5bf:
	sta $03a0.w, X                                                  ; $d5bf : $9d, $a0, $03
	dex                                                  ; $d5c2 : $ca
	dex                                                  ; $d5c3 : $ca
	bpl br_13_d5bf                                                  ; $d5c4 : $10, $f9

	sep #ACCU_8|IDX_8                                                  ; $d5c6 : $e2, $30
	lda #$01.b                                                  ; $d5c8 : $a9, $01
	sta $00a1.w                                                  ; $d5ca : $8d, $a1, $00
	sta $02                                                  ; $d5cd : $85, $02
	lda #$80.b                                                  ; $d5cf : $a9, $80
	tsb $1f5f.w                                                  ; $d5d1 : $0c, $5f, $1f
	rtl                                                  ; $d5d4 : $6b


br_13_d5d5:
	jsr SetCarryIfEntityWayOutOfView.l                                                  ; $d5d5 : $22, $8a, $d5, $02
	bcc br_13_d5e4                                                  ; $d5d9 : $90, $09

	lda #$80.b                                                  ; $d5db : $a9, $80
	trb $1f5f.w                                                  ; $d5dd : $1c, $5f, $1f
	jmp Func_2_d917.l                                                  ; $d5e0 : $5c, $17, $d9, $02


br_13_d5e4:
	rtl                                                  ; $d5e4 : $6b


	lda $33                                                  ; $d5e5 : $a5, $33
	bmi br_13_d5ed                                                  ; $d5e7 : $30, $04

	dec $30                                                  ; $d5e9 : $c6, $30
	bne br_13_d604                                                  ; $d5eb : $d0, $17

br_13_d5ed:
	jmp Func_2_db3f.l                                                  ; $d5ed : $5c, $3f, $db, $02


	lda #$02.b                                                  ; $d5f1 : $a9, $02
	sta $01                                                  ; $d5f3 : $85, $01
	bra br_13_d604                                                  ; $d5f5 : $80, $0d

	jsr Func_2_ddfe.l                                                  ; $d5f7 : $22, $fe, $dd, $02
	lda $01                                                  ; $d5fb : $a5, $01
	cmp #$04.b                                                  ; $d5fd : $c9, $04
	bne br_13_d604                                                  ; $d5ff : $d0, $03

	jmp Jump_13_d799.w                                                  ; $d601 : $4c, $99, $d7


br_13_d604:
	jmp Jump_13_d762.w                                                  ; $d604 : $4c, $62, $d7


	ldx $02                                                  ; $d607 : $a6, $02
	jmp ($d60c.w, X)                                                  ; $d609 : $7c, $0c, $d6


	ora ($d6)                                                  ; $d60c : $12, $d6
	rol $94d6.w                                                  ; $d60e : $2e, $d6, $94
	dec $22, X                                                  ; $d611 : $d6, $22
	jmp $a502e1.l                                                  ; $d613 : $5c, $e1, $02, $a5


	plp                                                  ; $d617 : $28
	sta $1f57.w                                                  ; $d618 : $8d, $57, $1f
	lda #$80.b                                                  ; $d61b : $a9, $80
	tsb $1f5f.w                                                  ; $d61d : $0c, $5f, $1f
	lda #$02.b                                                  ; $d620 : $a9, $02
	sta $02                                                  ; $d622 : $85, $02
	stz $01                                                  ; $d624 : $64, $01
	stz $03                                                  ; $d626 : $64, $03
	stz $37                                                  ; $d628 : $64, $37
	jmp todo_CausePlayerToFreeze.l                                                  ; $d62a : $5c, $ca, $d1, $04


	lda $0040.w                                                  ; $d62e : $ad, $40, $00
	beq br_13_d634                                                  ; $d631 : $f0, $01

	rtl                                                  ; $d633 : $6b


br_13_d634:
	stz $27                                                  ; $d634 : $64, $27
	stz $18                                                  ; $d636 : $64, $18
	lda #$06.b                                                  ; $d638 : $a9, $06
	sta $12                                                  ; $d63a : $85, $12
	lda #$29.b                                                  ; $d63c : $a9, $29
	sta $11                                                  ; $d63e : $85, $11
	sta $38                                                  ; $d640 : $85, $38
	rep #ACCU_8|F_CARRY                                                  ; $d642 : $c2, $21
	lda #$00d0.w                                                  ; $d644 : $a9, $d0, $00
	adc wNewStageScrollX.w                                                  ; $d647 : $6d, $5d, $1e
	sta $05                                                  ; $d64a : $85, $05
	lda #$00a8.w                                                  ; $d64c : $a9, $a8, $00
	clc                                                  ; $d64f : $18
	adc wNewStageScrollY.w                                                  ; $d650 : $6d, $60, $1e
	sta $08                                                  ; $d653 : $85, $08
	lda #$ea6f.w                                                  ; $d655 : $a9, $6f, $ea
	sta $20                                                  ; $d658 : $85, $20
	lda #$f3eb.w                                                  ; $d65a : $a9, $eb, $f3
	sta $31                                                  ; $d65d : $85, $31
	tdc                                                  ; $d65f : $7b
	sta $1f1f.w                                                  ; $d660 : $8d, $1f, $1f
	rep #IDX_8                                                  ; $d663 : $c2, $10
	phb                                                  ; $d665 : $8b
	ldx #$0480.w                                                  ; $d666 : $a2, $80, $04
	ldy #$cac0.w                                                  ; $d669 : $a0, $c0, $ca
	lda #$001f.w                                                  ; $d66c : $a9, $1f, $00
	mvn $00, $7f                                                  ; $d66f : $54, $7f, $00
	plb                                                  ; $d672 : $ab
	ldx #$001e.w                                                  ; $d673 : $a2, $1e, $00
	lda #$0000.w                                                  ; $d676 : $a9, $00, $00

br_13_d679:
	sta $0480.w, X                                                  ; $d679 : $9d, $80, $04
	dex                                                  ; $d67c : $ca
	dex                                                  ; $d67d : $ca
	bpl br_13_d679                                                  ; $d67e : $10, $f9

	sep #ACCU_8|IDX_8                                                  ; $d680 : $e2, $30
	lda #$01.b                                                  ; $d682 : $a9, $01
	sta $00a1.w                                                  ; $d684 : $8d, $a1, $00
	lda #$04.b                                                  ; $d687 : $a9, $04
	sta $02                                                  ; $d689 : $85, $02
	stz $1f57.w                                                  ; $d68b : $9c, $57, $1f
	lda #$00.b                                                  ; $d68e : $a9, $00
	jmp Func_4_b967.l                                                  ; $d690 : $5c, $67, $b9, $04


	ldx $03                                                  ; $d694 : $a6, $03
	jsr ($d6a5.w, X)                                                  ; $d696 : $fc, $a5, $d6
	jsr Func_2_d636.l                                                  ; $d699 : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $d69d : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $d6a1 : $5c, $a2, $bc, $04


	lda $d6cad6.l                                                  ; $d6a5 : $af, $d6, $ca, $d6
	sep #$d6.b                                                  ; $d6a9 : $e2, $d6
	php                                                  ; $d6ab : $08
	cmp [$2a], Y                                                  ; $d6ac : $d7, $2a
	cmp [$ad], Y                                                  ; $d6ae : $d7, $ad
	eor [$1f], Y                                                  ; $d6b0 : $57, $1f
	and #$03.b                                                  ; $d6b2 : $29, $03
	cmp #$03.b                                                  ; $d6b4 : $c9, $03
	beq br_13_d6bc                                                  ; $d6b6 : $f0, $04

	jsr Call_13_db96.w                                                  ; $d6b8 : $20, $96, $db
	rts                                                  ; $d6bb : $60


br_13_d6bc:
	lda #$02.b                                                  ; $d6bc : $a9, $02
	sta $03                                                  ; $d6be : $85, $03
	lda #$80.b                                                  ; $d6c0 : $a9, $80
	trb $1f5f.w                                                  ; $d6c2 : $1c, $5f, $1f
	lda #$1e.b                                                  ; $d6c5 : $a9, $1e
	sta $39                                                  ; $d6c7 : $85, $39
	rts                                                  ; $d6c9 : $60


	lda $39                                                  ; $d6ca : $a5, $39
	beq br_13_d6d1                                                  ; $d6cc : $f0, $03

	dec $39                                                  ; $d6ce : $c6, $39
	rts                                                  ; $d6d0 : $60


br_13_d6d1:
	lda #$04.b                                                  ; $d6d1 : $a9, $04
	sta $03                                                  ; $d6d3 : $85, $03
	lda #$1d.b                                                  ; $d6d5 : $a9, $1d
	sta $1f56.w                                                  ; $d6d7 : $8d, $56, $1f
	sta $0008.w                                                  ; $d6da : $8d, $08, $00
	jsr $02fcb1.l                                                  ; $d6dd : $22, $b1, $fc, $02
	rts                                                  ; $d6e1 : $60


	lda $1f3f.w                                                  ; $d6e2 : $ad, $3f, $1f
	bmi br_13_d6f4                                                  ; $d6e5 : $30, $0d

	lda #$06.b                                                  ; $d6e7 : $a9, $06
	sta $03                                                  ; $d6e9 : $85, $03
	stz $36                                                  ; $d6eb : $64, $36
	lda #$02.b                                                  ; $d6ed : $a9, $02
	jsr Func_4_b967.l                                                  ; $d6ef : $22, $67, $b9, $04
	rts                                                  ; $d6f3 : $60


br_13_d6f4:
	lda #$00.b                                                  ; $d6f4 : $a9, $00
	sta $0000.w                                                  ; $d6f6 : $8d, $00, $00
	lda #$01.b                                                  ; $d6f9 : $a9, $01
	sta $0001.w                                                  ; $d6fb : $8d, $01, $00
	lda #$01.b                                                  ; $d6fe : $a9, $01
	sta $0002.w                                                  ; $d700 : $8d, $02, $00
	jsr $02e24b.l                                                  ; $d703 : $22, $4b, $e2, $02
	rts                                                  ; $d707 : $60


	lda $36                                                  ; $d708 : $a5, $36
	bne br_13_d717                                                  ; $d70a : $d0, $0b

	lda $0f                                                  ; $d70c : $a5, $0f
	bit #$40.b                                                  ; $d70e : $89, $40
	beq br_13_d729                                                  ; $d710 : $f0, $17

	inc $36                                                  ; $d712 : $e6, $36
	jsr Call_13_dc61.w                                                  ; $d714 : $20, $61, $dc

br_13_d717:
	lda $0f                                                  ; $d717 : $a5, $0f
	bpl br_13_d729                                                  ; $d719 : $10, $0e

	lda #$08.b                                                  ; $d71b : $a9, $08
	sta $03                                                  ; $d71d : $85, $03
	lda #$02.b                                                  ; $d71f : $a9, $02
	sta $39                                                  ; $d721 : $85, $39
	lda #$04.b                                                  ; $d723 : $a9, $04
	jsr Func_4_b967.l                                                  ; $d725 : $22, $67, $b9, $04

br_13_d729:
	rts                                                  ; $d729 : $60


	dec $39                                                  ; $d72a : $c6, $39
	bne br_13_d761                                                  ; $d72c : $d0, $33

	lda #$02.b                                                  ; $d72e : $a9, $02
	sta $39                                                  ; $d730 : $85, $39
	lda $27                                                  ; $d732 : $a5, $27
	and #$7f.b                                                  ; $d734 : $29, $7f
	cmp #$20.b                                                  ; $d736 : $c9, $20
	beq br_13_d746                                                  ; $d738 : $f0, $0c

	ina                                                  ; $d73a : $1a
	ora #$80.b                                                  ; $d73b : $09, $80
	sta $27                                                  ; $d73d : $85, $27
	lda #$15.b                                                  ; $d73f : $a9, $15
	jsr $01802b.l                                                  ; $d741 : $22, $2b, $80, $01
	rts                                                  ; $d745 : $60


br_13_d746:
	lda #$02.b                                                  ; $d746 : $a9, $02
	sta $3c                                                  ; $d748 : $85, $3c
	sta $01                                                  ; $d74a : $85, $01
	stz $02                                                  ; $d74c : $64, $02
	stz $03                                                  ; $d74e : $64, $03
	lda #$1e.b                                                  ; $d750 : $a9, $1e
	sta $28                                                  ; $d752 : $85, $28
	sta $1f57.w                                                  ; $d754 : $8d, $57, $1f
	jsr $04d1ef.l                                                  ; $d757 : $22, $ef, $d1, $04
	lda #$22.b                                                  ; $d75b : $a9, $22
	jsr Func_0_84bc.l                                                  ; $d75d : $22, $bc, $84, $00

br_13_d761:
	rts                                                  ; $d761 : $60


Jump_13_d762:
	jsr $04d8d5.l                                                  ; $d762 : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $d766 : $22, $64, $df, $02
	ldx $02                                                  ; $d76a : $a6, $02
	jsr ($d7d0.w, X)                                                  ; $d76c : $fc, $d0, $d7
	jsr Func_2_d636.l                                                  ; $d76f : $22, $36, $d6, $02
	jsr Func_4_cb74.l                                                  ; $d773 : $22, $74, $cb, $04
	bmi br_13_d799                                                  ; $d777 : $30, $20

	bne br_13_d785                                                  ; $d779 : $d0, $0a

	lda $27                                                  ; $d77b : $a5, $27
	beq br_13_d799                                                  ; $d77d : $f0, $1a

	jsr Func_4_cb31.l                                                  ; $d77f : $22, $31, $cb, $04
	bra br_13_d7b9                                                  ; $d783 : $80, $34

br_13_d785:
	lda #$21.b                                                  ; $d785 : $a9, $21
	jsr Func_1_8000.l                                                  ; $d787 : $22, $00, $80, $01
	lda #$60.b                                                  ; $d78b : $a9, $60
	sta $37                                                  ; $d78d : $85, $37
	lda #$01.b                                                  ; $d78f : $a9, $01
	sta $28                                                  ; $d791 : $85, $28
	lda #$0e.b                                                  ; $d793 : $a9, $0e
	trb $11                                                  ; $d795 : $14, $11
	bra br_13_d7b9                                                  ; $d797 : $80, $20

Jump_13_d799:
br_13_d799:
	lda #$04.b                                                  ; $d799 : $a9, $04
	sta $01                                                  ; $d79b : $85, $01
	stz $02                                                  ; $d79d : $64, $02
	stz $03                                                  ; $d79f : $64, $03
	stz $3a                                                  ; $d7a1 : $64, $3a
	stz $1a                                                  ; $d7a3 : $64, $1a
	stz $1b                                                  ; $d7a5 : $64, $1b
	stz $1c                                                  ; $d7a7 : $64, $1c
	stz $1d                                                  ; $d7a9 : $64, $1d
	lda #$40.b                                                  ; $d7ab : $a9, $40
	sta $1e                                                  ; $d7ad : $85, $1e
	jsr todo_CausePlayerToFreeze.l                                                  ; $d7af : $22, $ca, $d1, $04
	lda #$1b.b                                                  ; $d7b3 : $a9, $1b
	jsr Func_4_b967.l                                                  ; $d7b5 : $22, $67, $b9, $04

br_13_d7b9:
	lda $01                                                  ; $d7b9 : $a5, $01
	sta $1f54.w                                                  ; $d7bb : $8d, $54, $1f
	lda $02                                                  ; $d7be : $a5, $02
	sta $1f55.w                                                  ; $d7c0 : $8d, $55, $1f
	lda $03                                                  ; $d7c3 : $a5, $03
	sta $1f56.w                                                  ; $d7c5 : $8d, $56, $1f
	jsr Func_4_b94a.l                                                  ; $d7c8 : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $d7cc : $5c, $a2, $bc, $04


	dec $d7, X                                                  ; $d7d0 : $d6, $d7
	bit #$d8.b                                                  ; $d7d2 : $89, $d8
	stp                                                  ; $d7d4 : $db
	cld                                                  ; $d7d5 : $d8
	ldx $03                                                  ; $d7d6 : $a6, $03
	jmp ($d7db.w, X)                                                  ; $d7d8 : $7c, $db, $d7


	sbc $d7                                                  ; $d7db : $e5, $d7
	sed                                                  ; $d7dd : $f8
	cmp [$19], Y                                                  ; $d7de : $d7, $19
	cld                                                  ; $d7e0 : $d8
	and $7ed8.w, X                                                  ; $d7e1 : $3d, $d8, $7e
	cld                                                  ; $d7e4 : $d8
	jsr $02e13f.l                                                  ; $d7e5 : $22, $3f, $e1, $02
	lda #$78.b                                                  ; $d7e9 : $a9, $78
	sta $39                                                  ; $d7eb : $85, $39
	lda #$02.b                                                  ; $d7ed : $a9, $02
	sta $03                                                  ; $d7ef : $85, $03
	lda #$04.b                                                  ; $d7f1 : $a9, $04
	jsr Func_4_b967.l                                                  ; $d7f3 : $22, $67, $b9, $04
	rts                                                  ; $d7f7 : $60


	lda $0a0d.w                                                  ; $d7f8 : $ad, $0d, $0a
	bne br_13_d808                                                  ; $d7fb : $d0, $0b

	dec $39                                                  ; $d7fd : $c6, $39
	bne br_13_d807                                                  ; $d7ff : $d0, $06

	lda $3c                                                  ; $d801 : $a5, $3c
	sta $02                                                  ; $d803 : $85, $02
	stz $03                                                  ; $d805 : $64, $03

br_13_d807:
	rts                                                  ; $d807 : $60


br_13_d808:
	lda #$04.b                                                  ; $d808 : $a9, $04
	sta $03                                                  ; $d80a : $85, $03
	lda $27                                                  ; $d80c : $a5, $27
	sta $3a                                                  ; $d80e : $85, $3a
	stz $36                                                  ; $d810 : $64, $36
	lda #$11.b                                                  ; $d812 : $a9, $11
	jsr Func_4_b967.l                                                  ; $d814 : $22, $67, $b9, $04
	rts                                                  ; $d818 : $60


	lda $36                                                  ; $d819 : $a5, $36
	bne br_13_d828                                                  ; $d81b : $d0, $0b

	lda $0f                                                  ; $d81d : $a5, $0f
	bit #$40.b                                                  ; $d81f : $89, $40
	beq br_13_d83c                                                  ; $d821 : $f0, $19

	inc $36                                                  ; $d823 : $e6, $36
	jmp Jump_13_dc4f.w                                                  ; $d825 : $4c, $4f, $dc


br_13_d828:
	lda $0f                                                  ; $d828 : $a5, $0f
	bpl br_13_d83c                                                  ; $d82a : $10, $10

	lda #$06.b                                                  ; $d82c : $a9, $06
	sta $03                                                  ; $d82e : $85, $03
	lda #$5a.b                                                  ; $d830 : $a9, $5a
	sta $39                                                  ; $d832 : $85, $39
	stz $36                                                  ; $d834 : $64, $36
	lda #$13.b                                                  ; $d836 : $a9, $13
	jsr Func_4_b967.l                                                  ; $d838 : $22, $67, $b9, $04

br_13_d83c:
	rts                                                  ; $d83c : $60


	lda $36                                                  ; $d83d : $a5, $36
	bne br_13_d85f                                                  ; $d83f : $d0, $1e

	dec $39                                                  ; $d841 : $c6, $39
	beq br_13_d873                                                  ; $d843 : $f0, $2e

	lda $27                                                  ; $d845 : $a5, $27
	and #$7f.b                                                  ; $d847 : $29, $7f
	sec                                                  ; $d849 : $38
	sbc $3a                                                  ; $d84a : $e5, $3a
	beq br_13_d87d                                                  ; $d84c : $f0, $2f

	eor #$ff.b                                                  ; $d84e : $49, $ff
	ina                                                  ; $d850 : $1a
	clc                                                  ; $d851 : $18
	adc $3a                                                  ; $d852 : $65, $3a
	cmp #$20.b                                                  ; $d854 : $c9, $20
	bmi br_13_d85a                                                  ; $d856 : $30, $02

	lda #$20.b                                                  ; $d858 : $a9, $20

br_13_d85a:
	sta $3a                                                  ; $d85a : $85, $3a
	inc $36                                                  ; $d85c : $e6, $36
	rts                                                  ; $d85e : $60


br_13_d85f:
	lda $09cc.w                                                  ; $d85f : $ad, $cc, $09
	and #$03.b                                                  ; $d862 : $29, $03
	bne br_13_d87d                                                  ; $d864 : $d0, $17

	inc $27                                                  ; $d866 : $e6, $27
	lda $27                                                  ; $d868 : $a5, $27
	and #$7f.b                                                  ; $d86a : $29, $7f
	cmp $3a                                                  ; $d86c : $c5, $3a
	bne br_13_d87d                                                  ; $d86e : $d0, $0d

	stz $36                                                  ; $d870 : $64, $36
	rts                                                  ; $d872 : $60


br_13_d873:
	lda #$08.b                                                  ; $d873 : $a9, $08
	sta $03                                                  ; $d875 : $85, $03
	lda #$14.b                                                  ; $d877 : $a9, $14
	jsr Func_4_b967.l                                                  ; $d879 : $22, $67, $b9, $04

br_13_d87d:
	rts                                                  ; $d87d : $60


	lda $0f                                                  ; $d87e : $a5, $0f
	bpl br_13_d87d                                                  ; $d880 : $10, $fb

	lda $3c                                                  ; $d882 : $a5, $3c
	sta $02                                                  ; $d884 : $85, $02
	stz $03                                                  ; $d886 : $64, $03
	rts                                                  ; $d888 : $60


	ldx $03                                                  ; $d889 : $a6, $03
	jmp ($d88e.w, X)                                                  ; $d88b : $7c, $8e, $d8


	sty $d8, X                                                  ; $d88e : $94, $d8
	lda #$d8.b                                                  ; $d890 : $a9, $d8
	cmp [$d8]                                                  ; $d892 : $c7, $d8
	lda #$02.b                                                  ; $d894 : $a9, $02
	sta $3a                                                  ; $d896 : $85, $3a

Jump_13_d898:
	jsr $02e13f.l                                                  ; $d898 : $22, $3f, $e1, $02
	lda #$02.b                                                  ; $d89c : $a9, $02
	sta $03                                                  ; $d89e : $85, $03
	stz $36                                                  ; $d8a0 : $64, $36
	lda #$0f.b                                                  ; $d8a2 : $a9, $0f
	jsr Func_4_b967.l                                                  ; $d8a4 : $22, $67, $b9, $04
	rts                                                  ; $d8a8 : $60


	lda $36                                                  ; $d8a9 : $a5, $36
	bne br_13_d8b8                                                  ; $d8ab : $d0, $0b

	lda $0f                                                  ; $d8ad : $a5, $0f
	bit #$40.b                                                  ; $d8af : $89, $40
	beq br_13_d8c6                                                  ; $d8b1 : $f0, $13

	inc $36                                                  ; $d8b3 : $e6, $36
	jmp Jump_13_dbe4.w                                                  ; $d8b5 : $4c, $e4, $db


br_13_d8b8:
	lda $0f                                                  ; $d8b8 : $a5, $0f
	bpl br_13_d8c6                                                  ; $d8ba : $10, $0a

	lda #$04.b                                                  ; $d8bc : $a9, $04
	sta $03                                                  ; $d8be : $85, $03
	lda #$14.b                                                  ; $d8c0 : $a9, $14
	jsr Func_4_b967.l                                                  ; $d8c2 : $22, $67, $b9, $04

br_13_d8c6:
	rts                                                  ; $d8c6 : $60


	lda $0f                                                  ; $d8c7 : $a5, $0f
	bpl br_13_d8c6                                                  ; $d8c9 : $10, $fb

	dec $3a                                                  ; $d8cb : $c6, $3a
	bmi br_13_d8d2                                                  ; $d8cd : $30, $03

	jmp Jump_13_d898.w                                                  ; $d8cf : $4c, $98, $d8


br_13_d8d2:
	lda #$04.b                                                  ; $d8d2 : $a9, $04
	sta $3c                                                  ; $d8d4 : $85, $3c
	stz $02                                                  ; $d8d6 : $64, $02
	stz $03                                                  ; $d8d8 : $64, $03
	rts                                                  ; $d8da : $60


	ldx $03                                                  ; $d8db : $a6, $03
	jmp ($d8e0.w, X)                                                  ; $d8dd : $7c, $e0, $d8


	pea $ffd8.w                                                  ; $d8e0 : $f4, $d8, $ff
	cld                                                  ; $d8e3 : $d8
	ora $d9, X                                                  ; $d8e4 : $15, $d9
	bit $d9                                                  ; $d8e6 : $24, $d9
	rti                                                  ; $d8e8 : $40


	cmp $d972.w, Y                                                  ; $d8e9 : $d9, $72, $d9
	sta [$d9], Y                                                  ; $d8ec : $97, $d9
	cmp $d9fad9.l, X                                                  ; $d8ee : $df, $d9, $fa, $d9
	ora $da, X                                                  ; $d8f2 : $15, $da
	lda #$02.b                                                  ; $d8f4 : $a9, $02
	sta $03                                                  ; $d8f6 : $85, $03
	lda #$11.b                                                  ; $d8f8 : $a9, $11
	jsr Func_4_b967.l                                                  ; $d8fa : $22, $67, $b9, $04
	rts                                                  ; $d8fe : $60


	lda $0f                                                  ; $d8ff : $a5, $0f
	bpl br_13_d914                                                  ; $d901 : $10, $11

	jsr Call_13_dbf4.w                                                  ; $d903 : $20, $f4, $db
	lda #$3c.b                                                  ; $d906 : $a9, $3c
	sta $39                                                  ; $d908 : $85, $39
	lda #$04.b                                                  ; $d90a : $a9, $04
	sta $03                                                  ; $d90c : $85, $03
	lda #$12.b                                                  ; $d90e : $a9, $12
	jsr Func_4_b967.l                                                  ; $d910 : $22, $67, $b9, $04

br_13_d914:
	rts                                                  ; $d914 : $60


	dec $39                                                  ; $d915 : $c6, $39
	bne br_13_d914                                                  ; $d917 : $d0, $fb

	lda #$06.b                                                  ; $d919 : $a9, $06
	sta $03                                                  ; $d91b : $85, $03
	lda #$19.b                                                  ; $d91d : $a9, $19
	jsr Func_4_b967.l                                                  ; $d91f : $22, $67, $b9, $04
	rts                                                  ; $d923 : $60


	lda $0f                                                  ; $d924 : $a5, $0f
	bpl br_13_d93f                                                  ; $d926 : $10, $17

	jsr Call_13_dc3d.w                                                  ; $d928 : $20, $3d, $dc
	lda #$08.b                                                  ; $d92b : $a9, $08
	sta $03                                                  ; $d92d : $85, $03
	lda #$01.b                                                  ; $d92f : $a9, $01
	sta $1d                                                  ; $d931 : $85, $1d
	stz $1c                                                  ; $d933 : $64, $1c
	lda #$01.b                                                  ; $d935 : $a9, $01
	sta $2f                                                  ; $d937 : $85, $2f
	lda #$06.b                                                  ; $d939 : $a9, $06
	jsr Func_4_b967.l                                                  ; $d93b : $22, $67, $b9, $04

br_13_d93f:
	rts                                                  ; $d93f : $60


	jsr Func_2_d812.l                                                  ; $d940 : $22, $12, $d8, $02
	jsr $04c0f7.l                                                  ; $d944 : $22, $f7, $c0, $04
	lda $2b                                                  ; $d948 : $a5, $2b
	bit #$08.b                                                  ; $d94a : $89, $08
	bne br_13_d967                                                  ; $d94c : $d0, $19

	ldy #$10.b                                                  ; $d94e : $a0, $10
	jsr $02dab8.l                                                  ; $d950 : $22, $b8, $da, $02
	bcc br_13_d967                                                  ; $d954 : $90, $11

	rep #ACCU_8|F_CARRY                                                  ; $d956 : $c2, $21
	lda $1c                                                  ; $d958 : $a5, $1c
	cmp #$0300.w                                                  ; $d95a : $c9, $00, $03
	beq br_13_d964                                                  ; $d95d : $f0, $05

	adc #$0040.w                                                  ; $d95f : $69, $40, $00
	sta $1c                                                  ; $d962 : $85, $1c

br_13_d964:
	sep #ACCU_8                                                  ; $d964 : $e2, $20
	rts                                                  ; $d966 : $60


br_13_d967:
	lda #$0a.b                                                  ; $d967 : $a9, $0a
	sta $03                                                  ; $d969 : $85, $03
	lda #$17.b                                                  ; $d96b : $a9, $17
	jsr Func_4_b967.l                                                  ; $d96d : $22, $67, $b9, $04
	rts                                                  ; $d971 : $60


	lda $0f                                                  ; $d972 : $a5, $0f
	bpl br_13_d996                                                  ; $d974 : $10, $20

	lda $11                                                  ; $d976 : $a5, $11
	bit #$40.b                                                  ; $d978 : $89, $40
	beq br_13_d984                                                  ; $d97a : $f0, $08

	lda #$40.b                                                  ; $d97c : $a9, $40
	sta $1a                                                  ; $d97e : $85, $1a
	stz $1b                                                  ; $d980 : $64, $1b
	bra br_13_d98c                                                  ; $d982 : $80, $08

br_13_d984:
	lda #$c0.b                                                  ; $d984 : $a9, $c0
	sta $1a                                                  ; $d986 : $85, $1a
	lda #$ff.b                                                  ; $d988 : $a9, $ff
	sta $1b                                                  ; $d98a : $85, $1b

br_13_d98c:
	lda #$0c.b                                                  ; $d98c : $a9, $0c
	sta $03                                                  ; $d98e : $85, $03
	lda #$18.b                                                  ; $d990 : $a9, $18
	jsr Func_4_b967.l                                                  ; $d992 : $22, $67, $b9, $04

br_13_d996:
	rts                                                  ; $d996 : $60


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $d997 : $22, $f3, $d7, $02
	jsr $04c0f7.l                                                  ; $d99b : $22, $f7, $c0, $04
	lda $2b                                                  ; $d99f : $a5, $2b
	bit #$03.b                                                  ; $d9a1 : $89, $03
	bne br_13_d9c8                                                  ; $d9a3 : $d0, $23

	rep #ACCU_8                                                  ; $d9a5 : $c2, $20
	lda $1a                                                  ; $d9a7 : $a5, $1a
	bpl br_13_d9af                                                  ; $d9a9 : $10, $04

	eor #$ffff.w                                                  ; $d9ab : $49, $ff, $ff
	ina                                                  ; $d9ae : $1a

br_13_d9af:
	cmp #$0300.w                                                  ; $d9af : $c9, $00, $03
	beq br_13_d9dc                                                  ; $d9b2 : $f0, $28

	lda $1a                                                  ; $d9b4 : $a5, $1a
	bmi br_13_d9c0                                                  ; $d9b6 : $30, $08

	clc                                                  ; $d9b8 : $18
	adc #$0040.w                                                  ; $d9b9 : $69, $40, $00
	sta $1a                                                  ; $d9bc : $85, $1a
	bra br_13_d9dc                                                  ; $d9be : $80, $1c

br_13_d9c0:
	clc                                                  ; $d9c0 : $18
	adc #$ffc0.w                                                  ; $d9c1 : $69, $c0, $ff
	sta $1a                                                  ; $d9c4 : $85, $1a
	bra br_13_d9dc                                                  ; $d9c6 : $80, $14

br_13_d9c8:
	sep #ACCU_8                                                  ; $d9c8 : $e2, $20
	lda #$3c.b                                                  ; $d9ca : $a9, $3c
	sta $39                                                  ; $d9cc : $85, $39
	lda #$0e.b                                                  ; $d9ce : $a9, $0e
	sta $03                                                  ; $d9d0 : $85, $03
	lda #$3c.b                                                  ; $d9d2 : $a9, $3c
	ldx #$02.b                                                  ; $d9d4 : $a2, $02
	ldy #$01.b                                                  ; $d9d6 : $a0, $01
	jsr Func_4_d577.l                                                  ; $d9d8 : $22, $77, $d5, $04

br_13_d9dc:
	sep #ACCU_8                                                  ; $d9dc : $e2, $20
	rts                                                  ; $d9de : $60


	dec $39                                                  ; $d9df : $c6, $39
	bpl br_13_d9f9                                                  ; $d9e1 : $10, $16

	lda #$10.b                                                  ; $d9e3 : $a9, $10
	sta $03                                                  ; $d9e5 : $85, $03
	rep #ACCU_8                                                  ; $d9e7 : $c2, $20
	stz $1a                                                  ; $d9e9 : $64, $1a
	stz $1c                                                  ; $d9eb : $64, $1c
	sep #ACCU_8                                                  ; $d9ed : $e2, $20
	lda #$40.b                                                  ; $d9ef : $a9, $40
	sta $1e                                                  ; $d9f1 : $85, $1e
	lda #$06.b                                                  ; $d9f3 : $a9, $06
	jsr Func_4_b967.l                                                  ; $d9f5 : $22, $67, $b9, $04

br_13_d9f9:
	rts                                                  ; $d9f9 : $60


	jsr $02d6f8.l                                                  ; $d9fa : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $d9fe : $22, $f7, $c0, $04
	lda $2b                                                  ; $da02 : $a5, $2b
	bit #$04.b                                                  ; $da04 : $89, $04
	beq br_13_da14                                                  ; $da06 : $f0, $0c

	lda #$12.b                                                  ; $da08 : $a9, $12
	sta $03                                                  ; $da0a : $85, $03
	stz $2f                                                  ; $da0c : $64, $2f
	lda #$07.b                                                  ; $da0e : $a9, $07
	jsr Func_4_b967.l                                                  ; $da10 : $22, $67, $b9, $04

br_13_da14:
	rts                                                  ; $da14 : $60


	lda $0f                                                  ; $da15 : $a5, $0f
	bpl br_13_da21                                                  ; $da17 : $10, $08

	lda #$02.b                                                  ; $da19 : $a9, $02
	sta $3c                                                  ; $da1b : $85, $3c
	stz $02                                                  ; $da1d : $64, $02
	stz $03                                                  ; $da1f : $64, $03

br_13_da21:
	rts                                                  ; $da21 : $60


	ldx $3a                                                  ; $da22 : $a6, $3a
	jmp ($da27.w, X)                                                  ; $da24 : $7c, $27, $da


	and $da, X                                                  ; $da27 : $35, $da
	ldx $da                                                  ; $da29 : $a6, $da
	cld                                                  ; $da2b : $d8
	phx                                                  ; $da2c : $da
	jsr $3ddb.w                                                  ; $da2d : $20, $db, $3d
	stp                                                  ; $da30 : $db
	eor ($db, S), Y                                                  ; $da31 : $53, $db
	stx $db                                                  ; $da33 : $86, $db
	lda $2f                                                  ; $da35 : $a5, $2f
	beq br_13_da4c                                                  ; $da37 : $f0, $13

	jsr $02d6f8.l                                                  ; $da39 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $da3d : $22, $f7, $c0, $04
	lda $2b                                                  ; $da41 : $a5, $2b
	bit #$04.b                                                  ; $da43 : $89, $04
	bne br_13_da4a                                                  ; $da45 : $d0, $03

	jmp Jump_13_db92.w                                                  ; $da47 : $4c, $92, $db


br_13_da4a:
	stz $2f                                                  ; $da4a : $64, $2f

br_13_da4c:
	lda #$3c.b                                                  ; $da4c : $a9, $3c
	sta $3b                                                  ; $da4e : $85, $3b
	lda #$80.b                                                  ; $da50 : $a9, $80
	tsb $1f5f.w                                                  ; $da52 : $0c, $5f, $1f
	lda $38                                                  ; $da55 : $a5, $38
	tsb $11                                                  ; $da57 : $04, $11
	stz $1f1f.w                                                  ; $da59 : $9c, $1f, $1f
	stz $1f20.w                                                  ; $da5c : $9c, $20, $1f
	lda #$40.b                                                  ; $da5f : $a9, $40
	trb $0a41.w                                                  ; $da61 : $1c, $41, $0a
	jsr $02e13f.l                                                  ; $da64 : $22, $3f, $e1, $02
	lda $11                                                  ; $da68 : $a5, $11
	and #$40.b                                                  ; $da6a : $29, $40
	eor #$40.b                                                  ; $da6c : $49, $40
	ora $0a41.w                                                  ; $da6e : $0d, $41, $0a
	sta $0a41.w                                                  ; $da71 : $8d, $41, $0a
	lda #$02.b                                                  ; $da74 : $a9, $02
	sta $3a                                                  ; $da76 : $85, $3a
	ldy #$01.b                                                  ; $da78 : $a0, $01
	lda #$f6.b                                                  ; $da7a : $a9, $f6
	jsr Func_0_856d.l                                                  ; $da7c : $22, $6d, $85, $00
	jsr $02dff7.l                                                  ; $da80 : $22, $f7, $df, $02
	rep #ACCU_8|IDX_8                                                  ; $da84 : $c2, $30
	ldx #$00de.w                                                  ; $da86 : $a2, $de, $00
	lda #$7fff.w                                                  ; $da89 : $a9, $ff, $7f

br_13_da8c:
	sta $7fc960.l, X                                                  ; $da8c : $9f, $60, $c9, $7f
	dex                                                  ; $da90 : $ca
	dex                                                  ; $da91 : $ca
	bpl br_13_da8c                                                  ; $da92 : $10, $f8

	ldx #$003e.w                                                  ; $da94 : $a2, $3e, $00

br_13_da97:
	sta $7fcac0.l, X                                                  ; $da97 : $9f, $c0, $ca, $7f
	dex                                                  ; $da9b : $ca
	dex                                                  ; $da9c : $ca
	bpl br_13_da97                                                  ; $da9d : $10, $f8

	sep #ACCU_8|IDX_8                                                  ; $da9f : $e2, $30
	stz $1f57.w                                                  ; $daa1 : $9c, $57, $1f
	bra br_13_dacc                                                  ; $daa4 : $80, $26

	jsr $08972a.l                                                  ; $daa6 : $22, $2a, $97, $08
	lda $3b                                                  ; $daaa : $a5, $3b
	beq br_13_dab2                                                  ; $daac : $f0, $04

	dec $3b                                                  ; $daae : $c6, $3b
	bra br_13_dacc                                                  ; $dab0 : $80, $1a

br_13_dab2:
	lda $1f57.w                                                  ; $dab2 : $ad, $57, $1f
	and #$03.b                                                  ; $dab5 : $29, $03
	cmp #$03.b                                                  ; $dab7 : $c9, $03
	bne br_13_dac8                                                  ; $dab9 : $d0, $0d

	lda #$04.b                                                  ; $dabb : $a9, $04
	sta $3a                                                  ; $dabd : $85, $3a
	lda #$11.b                                                  ; $dabf : $a9, $11
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $dac1 : $8d, $18, $1f
	jmp todo_HookAddThreadToDynamicallyLoadSpriteTileData.l                                                  ; $dac4 : $5c, $dc, $b1, $00


br_13_dac8:
	jsr $02e1fd.l                                                  ; $dac8 : $22, $fd, $e1, $02

br_13_dacc:
	jsr Func_2_d636.l                                                  ; $dacc : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $dad0 : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $dad4 : $5c, $a2, $bc, $04


	lda $0040.w                                                  ; $dad8 : $ad, $40, $00
	bne br_13_db1f                                                  ; $dadb : $d0, $42

	lda #$ba.b                                                  ; $dadd : $a9, $ba
	sta $16                                                  ; $dadf : $85, $16
	lda #$02.b                                                  ; $dae1 : $a9, $02
	jsr Func_4_b967.l                                                  ; $dae3 : $22, $67, $b9, $04
	rep #ACCU_8|IDX_8                                                  ; $dae7 : $c2, $30
	phb                                                  ; $dae9 : $8b
	ldx #$cb60.w                                                  ; $daea : $a2, $60, $cb
	ldy #$c960.w                                                  ; $daed : $a0, $60, $c9
	lda #$00df.w                                                  ; $daf0 : $a9, $df, $00
	mvn $7f, $7f                                                  ; $daf3 : $54, $7f, $7f
	ldx #$0480.w                                                  ; $daf6 : $a2, $80, $04
	ldy #$cac0.w                                                  ; $daf9 : $a0, $c0, $ca
	lda #$003f.w                                                  ; $dafc : $a9, $3f, $00
	mvn $00, $7f                                                  ; $daff : $54, $7f, $00
	plb                                                  ; $db02 : $ab
	sep #IDX_8                                                  ; $db03 : $e2, $10
	ldx #$3e.b                                                  ; $db05 : $a2, $3e
	lda #$7fff.w                                                  ; $db07 : $a9, $ff, $7f

br_13_db0a:
	sta $0480.w, X                                                  ; $db0a : $9d, $80, $04
	dex                                                  ; $db0d : $ca
	dex                                                  ; $db0e : $ca
	bpl br_13_db0a                                                  ; $db0f : $10, $f9

	sep #ACCU_8                                                  ; $db11 : $e2, $20
	lda #$01.b                                                  ; $db13 : $a9, $01
	sta $00a1.w                                                  ; $db15 : $8d, $a1, $00
	stz $1f57.w                                                  ; $db18 : $9c, $57, $1f
	lda #$06.b                                                  ; $db1b : $a9, $06
	sta $3a                                                  ; $db1d : $85, $3a

br_13_db1f:
	rtl                                                  ; $db1f : $6b


	lda $1f57.w                                                  ; $db20 : $ad, $57, $1f
	and #$03.b                                                  ; $db23 : $29, $03
	cmp #$03.b                                                  ; $db25 : $c9, $03
	bne br_13_db35                                                  ; $db27 : $d0, $0c

	lda #$1e.b                                                  ; $db29 : $a9, $1e
	sta $39                                                  ; $db2b : $85, $39
	lda #$08.b                                                  ; $db2d : $a9, $08
	sta $3a                                                  ; $db2f : $85, $3a
	jmp Func_2_d636.l                                                  ; $db31 : $5c, $36, $d6, $02


br_13_db35:
	jsr $02e1fd.l                                                  ; $db35 : $22, $fd, $e1, $02
	jmp Func_2_d636.l                                                  ; $db39 : $5c, $36, $d6, $02


	dec $39                                                  ; $db3d : $c6, $39
	bne br_13_db92                                                  ; $db3f : $d0, $51

	lda #$0a.b                                                  ; $db41 : $a9, $0a
	sta $3a                                                  ; $db43 : $85, $3a
	lda #$1e.b                                                  ; $db45 : $a9, $1e
	sta $0008.w                                                  ; $db47 : $8d, $08, $00
	sta $1f56.w                                                  ; $db4a : $8d, $56, $1f
	jsr $02fcb1.l                                                  ; $db4d : $22, $b1, $fc, $02
	bra br_13_db92                                                  ; $db51 : $80, $3f

	lda $1f3f.w                                                  ; $db53 : $ad, $3f, $1f
	bmi br_13_db62                                                  ; $db56 : $30, $0a

	lda #$1e.b                                                  ; $db58 : $a9, $1e
	sta $39                                                  ; $db5a : $85, $39
	lda #$0c.b                                                  ; $db5c : $a9, $0c
	sta $3a                                                  ; $db5e : $85, $3a
	bra br_13_db86                                                  ; $db60 : $80, $24

br_13_db62:
	lda #$02.b                                                  ; $db62 : $a9, $02
	sta $0000.w                                                  ; $db64 : $8d, $00, $00
	sta $0001.w                                                  ; $db67 : $8d, $01, $00
	lda #$01.b                                                  ; $db6a : $a9, $01
	sta $0002.w                                                  ; $db6c : $8d, $02, $00
	jsr $02e24b.l                                                  ; $db6f : $22, $4b, $e2, $02
	lda $1f50.w                                                  ; $db73 : $ad, $50, $1f
	cmp $0002.w                                                  ; $db76 : $cd, $02, $00
	bne br_13_db92                                                  ; $db79 : $d0, $17

	lda $1f56.w                                                  ; $db7b : $ad, $56, $1f
	bne br_13_db92                                                  ; $db7e : $d0, $12

	jsr Func_4_b94a.l                                                  ; $db80 : $22, $4a, $b9, $04
	bra br_13_db92                                                  ; $db84 : $80, $0c

br_13_db86:
	dec $39                                                  ; $db86 : $c6, $39
	bne br_13_db92                                                  ; $db88 : $d0, $08

	lda #$03.b                                                  ; $db8a : $a9, $03
	sta $1faf.w                                                  ; $db8c : $8d, $af, $1f
	inc $1f36.w                                                  ; $db8f : $ee, $36, $1f

Jump_13_db92:
br_13_db92:
	jmp Func_2_d636.l                                                  ; $db92 : $5c, $36, $d6, $02


Call_13_db96:
	lda wMainLoopCounter.w                                                  ; $db96 : $ad, $cb, $09
	and #$07.b                                                  ; $db99 : $29, $07
	bne br_13_dbb1                                                  ; $db9b : $d0, $14

	lda $1f57.w                                                  ; $db9d : $ad, $57, $1f
	bit #$01.b                                                  ; $dba0 : $89, $01
	bne br_13_dba7                                                  ; $dba2 : $d0, $03

	jsr Call_13_dbb2.w                                                  ; $dba4 : $20, $b2, $db

br_13_dba7:
	lda $1f57.w                                                  ; $dba7 : $ad, $57, $1f
	bit #$02.b                                                  ; $dbaa : $89, $02
	bne br_13_dbb1                                                  ; $dbac : $d0, $03

	jsr Call_13_dbcb.w                                                  ; $dbae : $20, $cb, $db

br_13_dbb1:
	rts                                                  ; $dbb1 : $60


Call_13_dbb2:
	rep #ACCU_8|IDX_8                                                  ; $dbb2 : $c2, $30
	lda #$0030.w                                                  ; $dbb4 : $a9, $30, $00
	sta $0008.w                                                  ; $dbb7 : $8d, $08, $00
	ldx #$00a0.w                                                  ; $dbba : $a2, $a0, $00
	jsr $02e016.l                                                  ; $dbbd : $22, $16, $e0, $02
	sep #ACCU_8|IDX_8                                                  ; $dbc1 : $e2, $30
	bcs br_13_dbca                                                  ; $dbc3 : $b0, $05

	lda #$01.b                                                  ; $dbc5 : $a9, $01
	tsb $1f57.w                                                  ; $dbc7 : $0c, $57, $1f

br_13_dbca:
	rts                                                  ; $dbca : $60


Call_13_dbcb:
	rep #ACCU_8|IDX_8                                                  ; $dbcb : $c2, $30
	lda #$0010.w                                                  ; $dbcd : $a9, $10, $00
	sta $0008.w                                                  ; $dbd0 : $8d, $08, $00
	ldx #$0180.w                                                  ; $dbd3 : $a2, $80, $01
	jsr $02e016.l                                                  ; $dbd6 : $22, $16, $e0, $02
	sep #ACCU_8|IDX_8                                                  ; $dbda : $e2, $30
	bcs br_13_dbe3                                                  ; $dbdc : $b0, $05

	lda #$02.b                                                  ; $dbde : $a9, $02
	tsb $1f57.w                                                  ; $dbe0 : $0c, $57, $1f

br_13_dbe3:
	rts                                                  ; $dbe3 : $60


Jump_13_dbe4:
	rep #IDX_8                                                  ; $dbe4 : $c2, $10
	jsr $02d8de.l                                                  ; $dbe6 : $22, $de, $d8, $02
	bne br_13_dc04                                                  ; $dbea : $d0, $18

	jsr Call_13_dc07.w                                                  ; $dbec : $20, $07, $dc
	stz $000b.w, X                                                  ; $dbef : $9e, $0b, $00
	bra br_13_dc04                                                  ; $dbf2 : $80, $10

Call_13_dbf4:
	rep #IDX_8                                                  ; $dbf4 : $c2, $10
	jsr $02d8de.l                                                  ; $dbf6 : $22, $de, $d8, $02
	bne br_13_dc04                                                  ; $dbfa : $d0, $08

	jsr Call_13_dc07.w                                                  ; $dbfc : $20, $07, $dc
	lda #$02.b                                                  ; $dbff : $a9, $02
	sta $000b.w, X                                                  ; $dc01 : $9d, $0b, $00

br_13_dc04:
	sep #ACCU_8|IDX_8                                                  ; $dc04 : $e2, $30
	rts                                                  ; $dc06 : $60


Call_13_dc07:
	rep #IDX_8                                                  ; $dc07 : $c2, $10
	inc $0000.w, X                                                  ; $dc09 : $fe, $00, $00
	lda #$1e.b                                                  ; $dc0c : $a9, $1e
	sta $000a.w, X                                                  ; $dc0e : $9d, $0a, $00
	lda #$02.b                                                  ; $dc11 : $a9, $02
	sta $0028.w, X                                                  ; $dc13 : $9d, $28, $00
	lda $16                                                  ; $dc16 : $a5, $16
	ina                                                  ; $dc18 : $1a
	sta $0016.w, X                                                  ; $dc19 : $9d, $16, $00
	lda $18                                                  ; $dc1c : $a5, $18
	sta $0018.w, X                                                  ; $dc1e : $9d, $18, $00
	lda $11                                                  ; $dc21 : $a5, $11
	ora $38                                                  ; $dc23 : $05, $38
	ina                                                  ; $dc25 : $1a
	ina                                                  ; $dc26 : $1a
	sta $0011.w, X                                                  ; $dc27 : $9d, $11, $00
	rep #ACCU_8                                                  ; $dc2a : $c2, $20
	lda $05                                                  ; $dc2c : $a5, $05
	sta $0005.w, X                                                  ; $dc2e : $9d, $05, $00
	lda $08                                                  ; $dc31 : $a5, $08
	sta $0008.w, X                                                  ; $dc33 : $9d, $08, $00
	tdc                                                  ; $dc36 : $7b
	sta $003c.w, X                                                  ; $dc37 : $9d, $3c, $00
	sep #ACCU_8                                                  ; $dc3a : $e2, $20
	rts                                                  ; $dc3c : $60


Call_13_dc3d:
	rep #IDX_8                                                  ; $dc3d : $c2, $10
	jsr $02d859.l                                                  ; $dc3f : $22, $59, $d8, $02
	bne br_13_dc6f                                                  ; $dc43 : $d0, $2a

	jsr Call_13_dc72.w                                                  ; $dc45 : $20, $72, $dc
	lda #$04.b                                                  ; $dc48 : $a9, $04
	sta $000b.w, X                                                  ; $dc4a : $9d, $0b, $00
	bra br_13_dc6f                                                  ; $dc4d : $80, $20

Jump_13_dc4f:
	rep #IDX_8                                                  ; $dc4f : $c2, $10
	jsr $02d859.l                                                  ; $dc51 : $22, $59, $d8, $02
	bne br_13_dc6f                                                  ; $dc55 : $d0, $18

	jsr Call_13_dc72.w                                                  ; $dc57 : $20, $72, $dc
	lda #$02.b                                                  ; $dc5a : $a9, $02
	sta $000b.w, X                                                  ; $dc5c : $9d, $0b, $00
	bra br_13_dc6f                                                  ; $dc5f : $80, $0e

Call_13_dc61:
	rep #IDX_8                                                  ; $dc61 : $c2, $10
	jsr $02d859.l                                                  ; $dc63 : $22, $59, $d8, $02
	bne br_13_dc6f                                                  ; $dc67 : $d0, $06

	jsr Call_13_dc72.w                                                  ; $dc69 : $20, $72, $dc
	stz $000b.w, X                                                  ; $dc6c : $9e, $0b, $00

br_13_dc6f:
	sep #ACCU_8|IDX_8                                                  ; $dc6f : $e2, $30
	rts                                                  ; $dc71 : $60


Call_13_dc72:
	rep #IDX_8                                                  ; $dc72 : $c2, $10
	inc $0000.w, X                                                  ; $dc74 : $fe, $00, $00
	lda #$06.b                                                  ; $dc77 : $a9, $06
	sta $000a.w, X                                                  ; $dc79 : $9d, $0a, $00
	lda $16                                                  ; $dc7c : $a5, $16
	sta $0016.w, X                                                  ; $dc7e : $9d, $16, $00
	lda $18                                                  ; $dc81 : $a5, $18
	sta $0018.w, X                                                  ; $dc83 : $9d, $18, $00
	lda $11                                                  ; $dc86 : $a5, $11
	ora $38                                                  ; $dc88 : $05, $38
	sta $0011.w, X                                                  ; $dc8a : $9d, $11, $00
	rep #ACCU_8                                                  ; $dc8d : $c2, $20
	lda $05                                                  ; $dc8f : $a5, $05
	sta $0005.w, X                                                  ; $dc91 : $9d, $05, $00
	lda $08                                                  ; $dc94 : $a5, $08
	sta $0008.w, X                                                  ; $dc96 : $9d, $08, $00
	tdc                                                  ; $dc99 : $7b
	sta $001e.w, X                                                  ; $dc9a : $9d, $1e, $00
	sep #ACCU_8                                                  ; $dc9d : $e2, $20
	rts                                                  ; $dc9f : $60


	sep #ACCU_8|IDX_8                                                  ; $dca0 : $e2, $30
	ldx $01                                                  ; $dca2 : $a6, $01
	jmp ($dca7.w, X)                                                  ; $dca4 : $7c, $a7, $dc


	cmp $dc, X                                                  ; $dca7 : $d5, $dc
	rti                                                  ; $dca9 : $40


	dec $e38d.w, X                                                  ; $dcaa : $de, $8d, $e3
	lda ($dc, S), Y                                                  ; $dcad : $b3, $dc
	lda $dcc5dc.l, X                                                  ; $dcaf : $bf, $dc, $c5, $dc
	lda $33                                                  ; $dcb3 : $a5, $33
	bmi br_13_dcbb                                                  ; $dcb5 : $30, $04

	dec $30                                                  ; $dcb7 : $c6, $30
	bne br_13_dcd2                                                  ; $dcb9 : $d0, $17

br_13_dcbb:
	jmp Func_2_db3f.l                                                  ; $dcbb : $5c, $3f, $db, $02


	lda #$02.b                                                  ; $dcbf : $a9, $02
	sta $01                                                  ; $dcc1 : $85, $01
	bra br_13_dcd2                                                  ; $dcc3 : $80, $0d

	jsr Func_2_ddfe.l                                                  ; $dcc5 : $22, $fe, $dd, $02
	lda $01                                                  ; $dcc9 : $a5, $01
	cmp #$04.b                                                  ; $dccb : $c9, $04
	bne br_13_dcd2                                                  ; $dccd : $d0, $03

	jmp Jump_13_de95.w                                                  ; $dccf : $4c, $95, $de


br_13_dcd2:
	jmp Jump_13_de40.w                                                  ; $dcd2 : $4c, $40, $de


	ldx $02                                                  ; $dcd5 : $a6, $02
	jmp ($dcda.w, X)                                                  ; $dcd7 : $7c, $da, $dc


	cpx #$dc.b                                                  ; $dcda : $e0, $dc
	and ($dd), Y                                                  ; $dcdc : $31, $dd
	sta ($dd, S), Y                                                  ; $dcde : $93, $dd
	jsr $04d8cf.l                                                  ; $dce0 : $22, $cf, $d8, $04
	beq br_13_dcee                                                  ; $dce4 : $f0, $08

	bit $1fc4.w                                                  ; $dce6 : $2c, $c4, $1f
	bvc br_13_dcfe                                                  ; $dce9 : $50, $13

	jmp Jump_13_e3a2.w                                                  ; $dceb : $4c, $a2, $e3


br_13_dcee:
	lda $1fe0.w                                                  ; $dcee : $ad, $e0, $1f
	cmp #$0b.b                                                  ; $dcf1 : $c9, $0b
	beq br_13_dcf9                                                  ; $dcf3 : $f0, $04

	jmp todo_DisablesEntity_d928.l                                                  ; $dcf5 : $5c, $28, $d9, $02


br_13_dcf9:
	lda $09da.w                                                  ; $dcf9 : $ad, $da, $09
	bne br_13_dd30                                                  ; $dcfc : $d0, $32

br_13_dcfe:
	jsr todo_CausePlayerToFreeze.l                                                  ; $dcfe : $22, $ca, $d1, $04
	stz $1f54.w                                                  ; $dd02 : $9c, $54, $1f
	stz $1f55.w                                                  ; $dd05 : $9c, $55, $1f
	stz $1f56.w                                                  ; $dd08 : $9c, $56, $1f
	lda #$02.b                                                  ; $dd0b : $a9, $02
	sta $02                                                  ; $dd0d : $85, $02
	lda #$59.b                                                  ; $dd0f : $a9, $59
	jsr $00850f.l                                                  ; $dd11 : $22, $0f, $85, $00
	lda $001f39.l                                                  ; $dd15 : $af, $39, $1f, $00
	beq br_13_dd21                                                  ; $dd19 : $f0, $06

	lda #$27.b                                                  ; $dd1b : $a9, $27
	jsr Func_0_84bc.l                                                  ; $dd1d : $22, $bc, $84, $00

br_13_dd21:
	jsr $04d8cf.l                                                  ; $dd21 : $22, $cf, $d8, $04
	bne br_13_dd30                                                  ; $dd25 : $d0, $09

	lda #$0b.b                                                  ; $dd27 : $a9, $0b
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $dd29 : $8d, $18, $1f
	jsr todo_HookAddThreadToDynamicallyLoadSpriteTileData.l                                                  ; $dd2c : $22, $dc, $b1, $00

br_13_dd30:
	rtl                                                  ; $dd30 : $6b


	lda $0040.w                                                  ; $dd31 : $ad, $40, $00
	bne br_13_dd30                                                  ; $dd34 : $d0, $fa

	lda $0a03.w                                                  ; $dd36 : $ad, $03, $0a
	bit #$04.b                                                  ; $dd39 : $89, $04
	beq br_13_dd30                                                  ; $dd3b : $f0, $f3

	jsr Func_2_e15c.l                                                  ; $dd3d : $22, $5c, $e1, $02
	lda $28                                                  ; $dd41 : $a5, $28
	sta $1f57.w                                                  ; $dd43 : $8d, $57, $1f
	stz $27                                                  ; $dd46 : $64, $27
	stz $3b                                                  ; $dd48 : $64, $3b
	stz $37                                                  ; $dd4a : $64, $37
	stz $36                                                  ; $dd4c : $64, $36
	lda #$03.b                                                  ; $dd4e : $a9, $03
	sta $26                                                  ; $dd50 : $85, $26
	lda #$04.b                                                  ; $dd52 : $a9, $04
	sta $12                                                  ; $dd54 : $85, $12
	lda #$29.b                                                  ; $dd56 : $a9, $29
	sta $11                                                  ; $dd58 : $85, $11
	sta $38                                                  ; $dd5a : $85, $38
	jsr $02e13f.l                                                  ; $dd5c : $22, $3f, $e1, $02
	rep #ACCU_8|F_CARRY                                                  ; $dd60 : $c2, $21
	lda #$00d0.w                                                  ; $dd62 : $a9, $d0, $00
	adc wNewStageScrollX.w                                                  ; $dd65 : $6d, $5d, $1e
	sta $05                                                  ; $dd68 : $85, $05
	lda #$ffe0.w                                                  ; $dd6a : $a9, $e0, $ff
	clc                                                  ; $dd6d : $18
	adc wNewStageScrollY.w                                                  ; $dd6e : $6d, $60, $1e
	sta $08                                                  ; $dd71 : $85, $08
	lda #$fd00.w                                                  ; $dd73 : $a9, $00, $fd
	sta $1c                                                  ; $dd76 : $85, $1c
	stz $1a                                                  ; $dd78 : $64, $1a
	lda #$f23c.w                                                  ; $dd7a : $a9, $3c, $f2
	sta $31                                                  ; $dd7d : $85, $31
	lda #$eca1.w                                                  ; $dd7f : $a9, $a1, $ec
	sta $20                                                  ; $dd82 : $85, $20
	tdc                                                  ; $dd84 : $7b
	sta $1f1f.w                                                  ; $dd85 : $8d, $1f, $1f
	sep #ACCU_8                                                  ; $dd88 : $e2, $20
	lda #$04.b                                                  ; $dd8a : $a9, $04
	sta $02                                                  ; $dd8c : $85, $02
	stz $03                                                  ; $dd8e : $64, $03
	stz $01                                                  ; $dd90 : $64, $01
	rtl                                                  ; $dd92 : $6b


	ldx $03                                                  ; $dd93 : $a6, $03
	jsr ($dda4.w, X)                                                  ; $dd95 : $fc, $a4, $dd
	jsr Func_2_d636.l                                                  ; $dd98 : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $dd9c : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $dda0 : $5c, $a2, $bc, $04


	ldx $b9dd.w                                                  ; $dda4 : $ae, $dd, $b9
	cmp $dde8.w, X                                                  ; $dda7 : $dd, $e8, $dd
	sbc [$dd], Y                                                  ; $ddaa : $f7, $dd
	tsb $de                                                  ; $ddac : $04, $de
	lda #$0b.b                                                  ; $ddae : $a9, $0b
	jsr Func_4_b967.l                                                  ; $ddb0 : $22, $67, $b9, $04
	lda #$02.b                                                  ; $ddb4 : $a9, $02
	sta $03                                                  ; $ddb6 : $85, $03
	rts                                                  ; $ddb8 : $60


	jsr $02d78e.l                                                  ; $ddb9 : $22, $8e, $d7, $02
	rep #ACCU_8|F_CARRY                                                  ; $ddbd : $c2, $21
	lda wNewStageScrollY.w                                                  ; $ddbf : $ad, $60, $1e
	adc #$0098.w                                                  ; $ddc2 : $69, $98, $00
	cmp $08                                                  ; $ddc5 : $c5, $08
	sep #ACCU_8                                                  ; $ddc7 : $e2, $20
	bpl br_13_dde7                                                  ; $ddc9 : $10, $1c

	jsr $04c0f7.l                                                  ; $ddcb : $22, $f7, $c0, $04
	lda $2b                                                  ; $ddcf : $a5, $2b
	bit #$04.b                                                  ; $ddd1 : $89, $04
	beq br_13_dde7                                                  ; $ddd3 : $f0, $12

	lda #$04.b                                                  ; $ddd5 : $a9, $04
	sta $03                                                  ; $ddd7 : $85, $03
	lda #$0a.b                                                  ; $ddd9 : $a9, $0a
	sta $39                                                  ; $dddb : $85, $39
	lda #$04.b                                                  ; $dddd : $a9, $04
	sta $3a                                                  ; $dddf : $85, $3a
	lda #$0c.b                                                  ; $dde1 : $a9, $0c
	jsr Func_4_b967.l                                                  ; $dde3 : $22, $67, $b9, $04

br_13_dde7:
	rts                                                  ; $dde7 : $60


	lda $0f                                                  ; $dde8 : $a5, $0f
	bpl br_13_ddf6                                                  ; $ddea : $10, $0a

	lda #$02.b                                                  ; $ddec : $a9, $02
	jsr Func_4_b967.l                                                  ; $ddee : $22, $67, $b9, $04
	lda #$06.b                                                  ; $ddf2 : $a9, $06
	sta $03                                                  ; $ddf4 : $85, $03

br_13_ddf6:
	rts                                                  ; $ddf6 : $60


	lda $0f                                                  ; $ddf7 : $a5, $0f
	bpl br_13_de03                                                  ; $ddf9 : $10, $08

	lda #$08.b                                                  ; $ddfb : $a9, $08
	sta $03                                                  ; $ddfd : $85, $03
	lda #$02.b                                                  ; $ddff : $a9, $02
	sta $39                                                  ; $de01 : $85, $39

br_13_de03:
	rts                                                  ; $de03 : $60


	dec $39                                                  ; $de04 : $c6, $39
	bne br_13_de3f                                                  ; $de06 : $d0, $37

	lda #$02.b                                                  ; $de08 : $a9, $02
	sta $39                                                  ; $de0a : $85, $39
	lda $27                                                  ; $de0c : $a5, $27
	and #$7f.b                                                  ; $de0e : $29, $7f
	cmp #$20.b                                                  ; $de10 : $c9, $20
	beq br_13_de20                                                  ; $de12 : $f0, $0c

	ina                                                  ; $de14 : $1a
	ora #$80.b                                                  ; $de15 : $09, $80
	sta $27                                                  ; $de17 : $85, $27
	lda #$15.b                                                  ; $de19 : $a9, $15
	jsr $01802b.l                                                  ; $de1b : $22, $2b, $80, $01
	rts                                                  ; $de1f : $60


br_13_de20:
	lda #$02.b                                                  ; $de20 : $a9, $02
	sta $01                                                  ; $de22 : $85, $01
	sta $1f54.w                                                  ; $de24 : $8d, $54, $1f
	stz $02                                                  ; $de27 : $64, $02
	stz $03                                                  ; $de29 : $64, $03
	stz $3b                                                  ; $de2b : $64, $3b
	stz $3d                                                  ; $de2d : $64, $3d
	jsr $04d1ef.l                                                  ; $de2f : $22, $ef, $d1, $04
	lda $001f39.l                                                  ; $de33 : $af, $39, $1f, $00
	beq br_13_de3f                                                  ; $de37 : $f0, $06

	lda #$1a.b                                                  ; $de39 : $a9, $1a
	jsr Func_0_84bc.l                                                  ; $de3b : $22, $bc, $84, $00

br_13_de3f:
	rts                                                  ; $de3f : $60


Jump_13_de40:
	jsr $04d8d5.l                                                  ; $de40 : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $de44 : $22, $64, $df, $02
	ldx $02                                                  ; $de48 : $a6, $02
	jsr ($dec0.w, X)                                                  ; $de4a : $fc, $c0, $de
	jsr Func_4_cb74.l                                                  ; $de4d : $22, $74, $cb, $04
	bmi br_13_de95                                                  ; $de51 : $30, $42

	bne br_13_de66                                                  ; $de53 : $d0, $11

	lda $27                                                  ; $de55 : $a5, $27
	beq br_13_de95                                                  ; $de57 : $f0, $3c

	lda $09da.w                                                  ; $de59 : $ad, $da, $09
	cmp #$74.b                                                  ; $de5c : $c9, $74
	beq br_13_dea5                                                  ; $de5e : $f0, $45

	jsr Func_4_cb31.l                                                  ; $de60 : $22, $31, $cb, $04
	bra br_13_dea5                                                  ; $de64 : $80, $3f

br_13_de66:
	lda $1f2f.w                                                  ; $de66 : $ad, $2f, $1f
	cmp #$0a.b                                                  ; $de69 : $c9, $0a
	beq br_13_de71                                                  ; $de6b : $f0, $04

	cmp #$13.b                                                  ; $de6d : $c9, $13
	bne br_13_de81                                                  ; $de6f : $d0, $10

br_13_de71:
	lda #$1e.b                                                  ; $de71 : $a9, $1e
	sta $39                                                  ; $de73 : $85, $39
	lda #$0e.b                                                  ; $de75 : $a9, $0e
	sta $02                                                  ; $de77 : $85, $02
	stz $03                                                  ; $de79 : $64, $03
	lda #$12.b                                                  ; $de7b : $a9, $12
	jsr Func_4_b967.l                                                  ; $de7d : $22, $67, $b9, $04

br_13_de81:
	lda #$21.b                                                  ; $de81 : $a9, $21
	jsr Func_1_8000.l                                                  ; $de83 : $22, $00, $80, $01
	lda #$3c.b                                                  ; $de87 : $a9, $3c
	sta $37                                                  ; $de89 : $85, $37
	lda #$01.b                                                  ; $de8b : $a9, $01
	sta $28                                                  ; $de8d : $85, $28
	lda #$0e.b                                                  ; $de8f : $a9, $0e
	trb $11                                                  ; $de91 : $14, $11
	bra br_13_dea5                                                  ; $de93 : $80, $10

Jump_13_de95:
br_13_de95:
	lda #$04.b                                                  ; $de95 : $a9, $04
	sta $01                                                  ; $de97 : $85, $01
	stz $02                                                  ; $de99 : $64, $02
	stz $03                                                  ; $de9b : $64, $03
	stz $3a                                                  ; $de9d : $64, $3a
	lda #$12.b                                                  ; $de9f : $a9, $12
	jsr Func_4_b967.l                                                  ; $dea1 : $22, $67, $b9, $04

br_13_dea5:
	lda $01                                                  ; $dea5 : $a5, $01
	sta $1f54.w                                                  ; $dea7 : $8d, $54, $1f
	lda $02                                                  ; $deaa : $a5, $02
	sta $1f55.w                                                  ; $deac : $8d, $55, $1f
	lda $03                                                  ; $deaf : $a5, $03
	sta $1f56.w                                                  ; $deb1 : $8d, $56, $1f
	jsr Func_2_d636.l                                                  ; $deb4 : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $deb8 : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $debc : $5c, $a2, $bc, $04


	.db $d0, $de                                                  ; $dec0 : $d0, $de

	phk                                                  ; $dec2 : $4b
	cmp $c2df8f.l, X                                                  ; $dec3 : $df, $8f, $df, $c2
	cmp $4bdfea.l, X                                                  ; $dec7 : $df, $ea, $df, $4b
	cpx #$bb.b                                                  ; $decb : $e0, $bb
	cpx #$2a.b                                                  ; $decd : $e0, $2a
	sbc $a6, S                                                  ; $decf : $e3, $a6
	ora $7c, S                                                  ; $ded1 : $03, $7c
	cmp $de, X                                                  ; $ded3 : $d5, $de
	stp                                                  ; $ded5 : $db
	dec $deea.w, X                                                  ; $ded6 : $de, $ea, $de
	eor $df                                                  ; $ded9 : $45, $df
	lda #$02.b                                                  ; $dedb : $a9, $02
	sta $03                                                  ; $dedd : $85, $03
	lda #$3c.b                                                  ; $dedf : $a9, $3c
	sta $39                                                  ; $dee1 : $85, $39
	lda #$00.b                                                  ; $dee3 : $a9, $00
	jsr Func_4_b967.l                                                  ; $dee5 : $22, $67, $b9, $04
	rts                                                  ; $dee9 : $60


	jsr $02e13f.l                                                  ; $deea : $22, $3f, $e1, $02
	dec $39                                                  ; $deee : $c6, $39
	beq br_13_df12                                                  ; $def0 : $f0, $20

	lda $0a0b.w                                                  ; $def2 : $ad, $0b, $0a
	bne br_13_df11                                                  ; $def5 : $d0, $1a

	lda $0a55.w                                                  ; $def7 : $ad, $55, $0a
	beq br_13_df11                                                  ; $defa : $f0, $15

	lda #$3c.b                                                  ; $defc : $a9, $3c
	sta $39                                                  ; $defe : $85, $39
	lda #$0d.b                                                  ; $df00 : $a9, $0d
	sta $28                                                  ; $df02 : $85, $28
	sta $1f57.w                                                  ; $df04 : $8d, $57, $1f
	lda #$04.b                                                  ; $df07 : $a9, $04
	sta $03                                                  ; $df09 : $85, $03
	lda #$11.b                                                  ; $df0b : $a9, $11
	jsr Func_4_b967.l                                                  ; $df0d : $22, $67, $b9, $04

br_13_df11:
	rts                                                  ; $df11 : $60


br_13_df12:
	lda $09da.w                                                  ; $df12 : $ad, $da, $09
	cmp #$74.b                                                  ; $df15 : $c9, $74
	bne br_13_df1e                                                  ; $df17 : $d0, $05

	stz $02                                                  ; $df19 : $64, $02
	stz $03                                                  ; $df1b : $64, $03
	rts                                                  ; $df1d : $60


br_13_df1e:
	stz $3d                                                  ; $df1e : $64, $3d
	jsr Func_4_be35.l                                                  ; $df20 : $22, $35, $be, $04
	and #$03.b                                                  ; $df24 : $29, $03
	tax                                                  ; $df26 : $aa
	lda $27                                                  ; $df27 : $a5, $27
	and #$7f.b                                                  ; $df29 : $29, $7f
	cmp #$0a.b                                                  ; $df2b : $c9, $0a
	bpl br_13_df34                                                  ; $df2d : $10, $05

	lda $eccf.w, X                                                  ; $df2f : $bd, $cf, $ec
	bra br_13_df37                                                  ; $df32 : $80, $03

br_13_df34:
	lda $ecd3.w, X                                                  ; $df34 : $bd, $d3, $ec

br_13_df37:
	sta $02                                                  ; $df37 : $85, $02
	stz $03                                                  ; $df39 : $64, $03
	stz $3b                                                  ; $df3b : $64, $3b
	lda #$19.b                                                  ; $df3d : $a9, $19
	sta $28                                                  ; $df3f : $85, $28
	sta $1f57.w                                                  ; $df41 : $8d, $57, $1f
	rts                                                  ; $df44 : $60


	dec $39                                                  ; $df45 : $c6, $39
	bne br_13_df11                                                  ; $df47 : $d0, $c8

	bra br_13_df12                                                  ; $df49 : $80, $c7

	ldx $03                                                  ; $df4b : $a6, $03
	jmp ($df50.w, X)                                                  ; $df4d : $7c, $50, $df


	lsr $df, X                                                  ; $df50 : $56, $df
	adc ($df, X)                                                  ; $df52 : $61, $df
	rtl                                                  ; $df54 : $6b


	cmp $643b64.l, X                                                  ; $df55 : $df, $64, $3b, $64
	dea                                                  ; $df59 : $3a
	lda #$02.b                                                  ; $df5a : $a9, $02
	sta $03                                                  ; $df5c : $85, $03
	jmp Jump_13_e284.w                                                  ; $df5e : $4c, $84, $e2


	jsr Call_13_e284.w                                                  ; $df61 : $20, $84, $e2
	bcc br_13_df6a                                                  ; $df64 : $90, $04

	lda #$04.b                                                  ; $df66 : $a9, $04
	sta $03                                                  ; $df68 : $85, $03

br_13_df6a:
	rts                                                  ; $df6a : $60


	lda $0f                                                  ; $df6b : $a5, $0f
	bpl br_13_df6a                                                  ; $df6d : $10, $fb

	inc $3b                                                  ; $df6f : $e6, $3b
	lda $3b                                                  ; $df71 : $a5, $3b
	cmp #$04.b                                                  ; $df73 : $c9, $04
	bpl br_13_df80                                                  ; $df75 : $10, $09

	stz $3a                                                  ; $df77 : $64, $3a
	lda #$02.b                                                  ; $df79 : $a9, $02
	sta $03                                                  ; $df7b : $85, $03
	jmp Jump_13_e284.w                                                  ; $df7d : $4c, $84, $e2


br_13_df80:
	stz $02                                                  ; $df80 : $64, $02
	stz $03                                                  ; $df82 : $64, $03
	stz $3b                                                  ; $df84 : $64, $3b
	stz $3a                                                  ; $df86 : $64, $3a
	lda #$00.b                                                  ; $df88 : $a9, $00
	jsr Func_4_b967.l                                                  ; $df8a : $22, $67, $b9, $04
	rts                                                  ; $df8e : $60


	ldx $03                                                  ; $df8f : $a6, $03
	jmp ($df94.w, X)                                                  ; $df91 : $7c, $94, $df


	txs                                                  ; $df94 : $9a
	cmp $afdfa5.l, X                                                  ; $df95 : $df, $a5, $df, $af
	cmp $643b64.l, X                                                  ; $df99 : $df, $64, $3b, $64
	dea                                                  ; $df9d : $3a
	lda #$02.b                                                  ; $df9e : $a9, $02
	sta $03                                                  ; $dfa0 : $85, $03
	jmp Jump_13_e284.w                                                  ; $dfa2 : $4c, $84, $e2


	jsr Call_13_e284.w                                                  ; $dfa5 : $20, $84, $e2
	bcc br_13_dfae                                                  ; $dfa8 : $90, $04

	lda #$04.b                                                  ; $dfaa : $a9, $04
	sta $03                                                  ; $dfac : $85, $03

br_13_dfae:
	rts                                                  ; $dfae : $60


	lda $0f                                                  ; $dfaf : $a5, $0f
	bpl br_13_dfae                                                  ; $dfb1 : $10, $fb

	lda #$06.b                                                  ; $dfb3 : $a9, $06
	sta $02                                                  ; $dfb5 : $85, $02
	stz $03                                                  ; $dfb7 : $64, $03
	lda #$01.b                                                  ; $dfb9 : $a9, $01
	sta $3d                                                  ; $dfbb : $85, $3d
	lda #$1e.b                                                  ; $dfbd : $a9, $1e
	sta $39                                                  ; $dfbf : $85, $39
	rts                                                  ; $dfc1 : $60


	dec $39                                                  ; $dfc2 : $c6, $39
	bne br_13_dfe9                                                  ; $dfc4 : $d0, $23

	stz $03                                                  ; $dfc6 : $64, $03
	jsr Func_4_be35.l                                                  ; $dfc8 : $22, $35, $be, $04
	and #$03.b                                                  ; $dfcc : $29, $03
	tax                                                  ; $dfce : $aa
	lda $ecd7.w, X                                                  ; $dfcf : $bd, $d7, $ec
	sta $02                                                  ; $dfd2 : $85, $02
	cmp #$02.b                                                  ; $dfd4 : $c9, $02
	bne br_13_dfe5                                                  ; $dfd6 : $d0, $0d

	lda #$01.b                                                  ; $dfd8 : $a9, $01
	sta $3b                                                  ; $dfda : $85, $3b
	stz $3a                                                  ; $dfdc : $64, $3a
	lda #$02.b                                                  ; $dfde : $a9, $02
	sta $03                                                  ; $dfe0 : $85, $03
	jmp Jump_13_e284.w                                                  ; $dfe2 : $4c, $84, $e2


br_13_dfe5:
	lda #$01.b                                                  ; $dfe5 : $a9, $01
	sta $3b                                                  ; $dfe7 : $85, $3b

br_13_dfe9:
	rts                                                  ; $dfe9 : $60


	ldx $03                                                  ; $dfea : $a6, $03
	jmp ($dfef.w, X)                                                  ; $dfec : $7c, $ef, $df


	sbc $df, X                                                  ; $dfef : $f5, $df
	clc                                                  ; $dff1 : $18
	cpx #$3c.b                                                  ; $dff2 : $e0, $3c
	cpx #$c2.b                                                  ; $dff4 : $e0, $c2
	jsr $ddad.w                                                  ; $dff6 : $20, $ad, $dd
	ora #$38.b                                                  ; $dff9 : $09, $38
	sbc $05                                                  ; $dffb : $e5, $05
	asl                                                  ; $dffd : $0a
	asl                                                  ; $dffe : $0a
	asl                                                  ; $dfff : $0a
	sta $1a                                                  ; $e000 : $85, $1a
	lda #$00.b                                                  ; $e002 : $a9, $00
	inc $1c85.w, X                                                  ; $e004 : $fe, $85, $1c
	sep #ACCU_8                                                  ; $e007 : $e2, $20
	lda #$40.b                                                  ; $e009 : $a9, $40
	sta $1e                                                  ; $e00b : $85, $1e
	lda #$02.b                                                  ; $e00d : $a9, $02
	sta $03                                                  ; $e00f : $85, $03
	lda #$0b.b                                                  ; $e011 : $a9, $0b
	jsr Func_4_b967.l                                                  ; $e013 : $22, $67, $b9, $04
	rts                                                  ; $e017 : $60


	jsr $02d6f8.l                                                  ; $e018 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $e01c : $22, $f7, $c0, $04
	lda $2b                                                  ; $e020 : $a5, $2b
	bit #$04.b                                                  ; $e022 : $89, $04
	beq br_13_e03b                                                  ; $e024 : $f0, $15

	lda #$73.b                                                  ; $e026 : $a9, $73
	jsr $01802b.l                                                  ; $e028 : $22, $2b, $80, $01
	stz $3b                                                  ; $e02c : $64, $3b
	jsr Call_13_e401.w                                                  ; $e02e : $20, $01, $e4
	lda #$04.b                                                  ; $e031 : $a9, $04
	sta $03                                                  ; $e033 : $85, $03
	lda #$0f.b                                                  ; $e035 : $a9, $0f
	jsr Func_4_b967.l                                                  ; $e037 : $22, $67, $b9, $04

br_13_e03b:
	rts                                                  ; $e03b : $60


	lda $0f                                                  ; $e03c : $a5, $0f
	bpl br_13_e04a                                                  ; $e03e : $10, $0a

	stz $02                                                  ; $e040 : $64, $02
	stz $03                                                  ; $e042 : $64, $03
	lda #$00.b                                                  ; $e044 : $a9, $00
	jsr Func_4_b967.l                                                  ; $e046 : $22, $67, $b9, $04

br_13_e04a:
	rts                                                  ; $e04a : $60


	ldx $03                                                  ; $e04b : $a6, $03
	jmp ($e050.w, X)                                                  ; $e04d : $7c, $50, $e0


	lsr $e0, X                                                  ; $e050 : $56, $e0
	.db $70, $e0                                                  ; $e052 : $70, $e0

	.db $90, $e0                                                  ; $e054 : $90, $e0

	jsr $04d308.l                                                  ; $e056 : $22, $08, $d3, $04
	sta $39                                                  ; $e05a : $85, $39
	lda #$04.b                                                  ; $e05c : $a9, $04
	sta $3a                                                  ; $e05e : $85, $3a
	lda #$02.b                                                  ; $e060 : $a9, $02
	sta $03                                                  ; $e062 : $85, $03
	lda $3d                                                  ; $e064 : $a5, $3d
	and #$01.b                                                  ; $e066 : $29, $01
	clc                                                  ; $e068 : $18
	adc #$0d.b                                                  ; $e069 : $69, $0d
	jsr Func_4_b967.l                                                  ; $e06b : $22, $67, $b9, $04
	rts                                                  ; $e06f : $60


	lda $0f                                                  ; $e070 : $a5, $0f
	bit #$40.b                                                  ; $e072 : $89, $40
	beq br_13_e08f                                                  ; $e074 : $f0, $19

	ldx $3a                                                  ; $e076 : $a6, $3a
	lda $ecdb.w, X                                                  ; $e078 : $bd, $db, $ec
	clc                                                  ; $e07b : $18
	adc $39                                                  ; $e07c : $65, $39
	and #$1f.b                                                  ; $e07e : $29, $1f
	sta $3c                                                  ; $e080 : $85, $3c
	jsr Call_13_e419.w                                                  ; $e082 : $20, $19, $e4
	lda #$72.b                                                  ; $e085 : $a9, $72
	jsr $01802b.l                                                  ; $e087 : $22, $2b, $80, $01
	lda #$04.b                                                  ; $e08b : $a9, $04
	sta $03                                                  ; $e08d : $85, $03

br_13_e08f:
	rts                                                  ; $e08f : $60


	lda $0f                                                  ; $e090 : $a5, $0f
	bpl br_13_e08f                                                  ; $e092 : $10, $fb

	dec $3a                                                  ; $e094 : $c6, $3a
	bmi br_13_e09d                                                  ; $e096 : $30, $05

	lda #$02.b                                                  ; $e098 : $a9, $02
	sta $03                                                  ; $e09a : $85, $03
	rts                                                  ; $e09c : $60


br_13_e09d:
	lda $3d                                                  ; $e09d : $a5, $3d
	beq br_13_e0b2                                                  ; $e09f : $f0, $11

	lda #$06.b                                                  ; $e0a1 : $a9, $06
	sta $02                                                  ; $e0a3 : $85, $02
	stz $03                                                  ; $e0a5 : $64, $03
	lda #$1e.b                                                  ; $e0a7 : $a9, $1e
	sta $39                                                  ; $e0a9 : $85, $39
	lda #$08.b                                                  ; $e0ab : $a9, $08
	jsr Func_4_b967.l                                                  ; $e0ad : $22, $67, $b9, $04
	rts                                                  ; $e0b1 : $60


br_13_e0b2:
	stz $02                                                  ; $e0b2 : $64, $02
	stz $03                                                  ; $e0b4 : $64, $03
	lda #$3c.b                                                  ; $e0b6 : $a9, $3c
	sta $39                                                  ; $e0b8 : $85, $39
	rts                                                  ; $e0ba : $60


	ldx $03                                                  ; $e0bb : $a6, $03
	jmp ($e0c0.w, X)                                                  ; $e0bd : $7c, $c0, $e0


	phx                                                  ; $e0c0 : $da
	cpx #$f6.b                                                  ; $e0c1 : $e0, $f6
	cpx #$3b.b                                                  ; $e0c3 : $e0, $3b
	sbc ($4a, X)                                                  ; $e0c5 : $e1, $4a
	sbc ($9f, X)                                                  ; $e0c7 : $e1, $9f
	sbc ($aa, X)                                                  ; $e0c9 : $e1, $aa
	sbc ($b9, X)                                                  ; $e0cb : $e1, $b9
	sbc ($d6, X)                                                  ; $e0cd : $e1, $d6
	sbc ($11, X)                                                  ; $e0cf : $e1, $11
	sep #ACCU_8                                                  ; $e0d1 : $e2, $20
	sep #$2d.b                                                  ; $e0d3 : $e2, $2d
	sep #$4b.b                                                  ; $e0d5 : $e2, $4b
	sep #$5e.b                                                  ; $e0d7 : $e2, $5e
	sep #ACCU_8|F_ZERO                                                  ; $e0d9 : $e2, $22
	and $a902e1.l, X                                                  ; $e0db : $3f, $e1, $02, $a9
	asl                                                  ; $e0df : $0a
	sta $39                                                  ; $e0e0 : $85, $39
	stz $36                                                  ; $e0e2 : $64, $36
	lda #$02.b                                                  ; $e0e4 : $a9, $02
	sta $03                                                  ; $e0e6 : $85, $03
	lda #$01.b                                                  ; $e0e8 : $a9, $01
	sta $28                                                  ; $e0ea : $85, $28
	sta $1f57.w                                                  ; $e0ec : $8d, $57, $1f
	lda #$13.b                                                  ; $e0ef : $a9, $13
	jsr Func_4_b967.l                                                  ; $e0f1 : $22, $67, $b9, $04
	rts                                                  ; $e0f5 : $60


	dec $39                                                  ; $e0f6 : $c6, $39
	bne br_13_e109                                                  ; $e0f8 : $d0, $0f

	inc $36                                                  ; $e0fa : $e6, $36
	lda $36                                                  ; $e0fc : $a5, $36
	cmp #$04.b                                                  ; $e0fe : $c9, $04
	beq br_13_e10d                                                  ; $e100 : $f0, $0b

	lda #$0a.b                                                  ; $e102 : $a9, $0a
	sta $39                                                  ; $e104 : $85, $39
	jsr Call_13_e3bf.w                                                  ; $e106 : $20, $bf, $e3

br_13_e109:
	jmp Jump_13_e3e8.w                                                  ; $e109 : $4c, $e8, $e3


	rts                                                  ; $e10c : $60


br_13_e10d:
	lda $11                                                  ; $e10d : $a5, $11
	and #$f1.b                                                  ; $e10f : $29, $f1
	ora #$08.b                                                  ; $e111 : $09, $08
	sta $11                                                  ; $e113 : $85, $11
	jsr $02e13f.l                                                  ; $e115 : $22, $3f, $e1, $02
	lda $11                                                  ; $e119 : $a5, $11
	bit #$40.b                                                  ; $e11b : $89, $40
	beq br_13_e123                                                  ; $e11d : $f0, $04

	lda #$04.b                                                  ; $e11f : $a9, $04
	bra br_13_e125                                                  ; $e121 : $80, $02

br_13_e123:
	lda #$fc.b                                                  ; $e123 : $a9, $fc

br_13_e125:
	sta $1b                                                  ; $e125 : $85, $1b
	stz $1a                                                  ; $e127 : $64, $1a
	lda wPlayerEntity.x.w                                                  ; $e129 : $ad, $dd, $09
	sta $7fcdb0.l                                                  ; $e12c : $8f, $b0, $cd, $7f
	lda #$04.b                                                  ; $e130 : $a9, $04
	sta $03                                                  ; $e132 : $85, $03
	lda #$03.b                                                  ; $e134 : $a9, $03
	jsr Func_4_b967.l                                                  ; $e136 : $22, $67, $b9, $04
	rts                                                  ; $e13a : $60


	lda $0f                                                  ; $e13b : $a5, $0f
	bpl br_13_e149                                                  ; $e13d : $10, $0a

	lda #$06.b                                                  ; $e13f : $a9, $06
	sta $03                                                  ; $e141 : $85, $03
	lda #$04.b                                                  ; $e143 : $a9, $04
	jsr Func_4_b967.l                                                  ; $e145 : $22, $67, $b9, $04

br_13_e149:
	rts                                                  ; $e149 : $60


	ldy #$30.b                                                  ; $e14a : $a0, $30
	jsr $02da99.l                                                  ; $e14c : $22, $99, $da, $02
	bcs br_13_e15a                                                  ; $e150 : $b0, $08

	ldy #$18.b                                                  ; $e152 : $a0, $18
	jsr $02dab8.l                                                  ; $e154 : $22, $b8, $da, $02
	bcc br_13_e189                                                  ; $e158 : $90, $2f

br_13_e15a:
	jsr AddEntityXSpeedOntoSubX.l                                                  ; $e15a : $22, $f3, $d7, $02
	jsr $04c0f7.l                                                  ; $e15e : $22, $f7, $c0, $04
	lda $2b                                                  ; $e162 : $a5, $2b
	bit #$03.b                                                  ; $e164 : $89, $03
	bne br_13_e17e                                                  ; $e166 : $d0, $16

	lda $1b                                                  ; $e168 : $a5, $1b
	bmi br_13_e176                                                  ; $e16a : $30, $0a

	lda $05                                                  ; $e16c : $a5, $05
	cmp $7fcdb0.l                                                  ; $e16e : $cf, $b0, $cd, $7f
	bcs br_13_e17e                                                  ; $e172 : $b0, $0a

	bra br_13_e188                                                  ; $e174 : $80, $12

br_13_e176:
	lda $05                                                  ; $e176 : $a5, $05
	cmp $7fcdb0.l                                                  ; $e178 : $cf, $b0, $cd, $7f
	bcs br_13_e188                                                  ; $e17c : $b0, $0a

br_13_e17e:
	lda #$0c.b                                                  ; $e17e : $a9, $0c
	sta $03                                                  ; $e180 : $85, $03
	lda #$03.b                                                  ; $e182 : $a9, $03
	jsr Func_4_b967.l                                                  ; $e184 : $22, $67, $b9, $04

br_13_e188:
	rts                                                  ; $e188 : $60


br_13_e189:
	lda #$08.b                                                  ; $e189 : $a9, $08
	sta $03                                                  ; $e18b : $85, $03
	lda #$73.b                                                  ; $e18d : $a9, $73
	jsr $01802b.l                                                  ; $e18f : $22, $2b, $80, $01
	stz $3b                                                  ; $e193 : $64, $3b
	jsr Call_13_e401.w                                                  ; $e195 : $20, $01, $e4
	lda #$0f.b                                                  ; $e198 : $a9, $0f
	jsr Func_4_b967.l                                                  ; $e19a : $22, $67, $b9, $04
	rts                                                  ; $e19e : $60


	lda $0f                                                  ; $e19f : $a5, $0f
	bit #$40.b                                                  ; $e1a1 : $89, $40
	beq br_13_e1a9                                                  ; $e1a3 : $f0, $04

	lda #$0a.b                                                  ; $e1a5 : $a9, $0a
	sta $03                                                  ; $e1a7 : $85, $03

br_13_e1a9:
	rts                                                  ; $e1a9 : $60


	lda $0f                                                  ; $e1aa : $a5, $0f
	bpl br_13_e1b8                                                  ; $e1ac : $10, $0a

	lda #$0c.b                                                  ; $e1ae : $a9, $0c
	sta $03                                                  ; $e1b0 : $85, $03
	lda #$03.b                                                  ; $e1b2 : $a9, $03
	jsr Func_4_b967.l                                                  ; $e1b4 : $22, $67, $b9, $04

br_13_e1b8:
	rts                                                  ; $e1b8 : $60


	lda $0f                                                  ; $e1b9 : $a5, $0f
	bpl br_13_e1b8                                                  ; $e1bb : $10, $fb

	lda #$0e.b                                                  ; $e1bd : $a9, $0e
	sta $03                                                  ; $e1bf : $85, $03
	lda #$08.b                                                  ; $e1c1 : $a9, $08
	sta $1d                                                  ; $e1c3 : $85, $1d
	stz $1c                                                  ; $e1c5 : $64, $1c
	stz $1a                                                  ; $e1c7 : $64, $1a
	stz $1b                                                  ; $e1c9 : $64, $1b
	lda #$40.b                                                  ; $e1cb : $a9, $40
	sta $1e                                                  ; $e1cd : $85, $1e
	lda #$05.b                                                  ; $e1cf : $a9, $05
	jsr Func_4_b967.l                                                  ; $e1d1 : $22, $67, $b9, $04
	rts                                                  ; $e1d5 : $60


	jsr $02d6f8.l                                                  ; $e1d6 : $22, $f8, $d6, $02
	ldy #$30.b                                                  ; $e1da : $a0, $30
	jsr $02da99.l                                                  ; $e1dc : $22, $99, $da, $02
	bcs br_13_e1ea                                                  ; $e1e0 : $b0, $08

	ldy #$18.b                                                  ; $e1e2 : $a0, $18
	jsr $02dab8.l                                                  ; $e1e4 : $22, $b8, $da, $02
	bcc br_13_e1f9                                                  ; $e1e8 : $90, $0f

br_13_e1ea:
	lda $1d                                                  ; $e1ea : $a5, $1d
	bpl br_13_e1f8                                                  ; $e1ec : $10, $0a

	lda #$14.b                                                  ; $e1ee : $a9, $14
	sta $03                                                  ; $e1f0 : $85, $03
	lda #$0b.b                                                  ; $e1f2 : $a9, $0b
	jsr Func_4_b967.l                                                  ; $e1f4 : $22, $67, $b9, $04

br_13_e1f8:
	rts                                                  ; $e1f8 : $60


br_13_e1f9:
	lda #$10.b                                                  ; $e1f9 : $a9, $10
	sta $03                                                  ; $e1fb : $85, $03
	lda #$73.b                                                  ; $e1fd : $a9, $73
	jsr $01802b.l                                                  ; $e1ff : $22, $2b, $80, $01
	lda #$01.b                                                  ; $e203 : $a9, $01
	sta $3b                                                  ; $e205 : $85, $3b
	jsr Call_13_e401.w                                                  ; $e207 : $20, $01, $e4
	lda #$10.b                                                  ; $e20a : $a9, $10
	jsr Func_4_b967.l                                                  ; $e20c : $22, $67, $b9, $04
	rts                                                  ; $e210 : $60


	jsr $02d6f8.l                                                  ; $e211 : $22, $f8, $d6, $02
	lda $0f                                                  ; $e215 : $a5, $0f
	bit #$40.b                                                  ; $e217 : $89, $40
	beq br_13_e21f                                                  ; $e219 : $f0, $04

	lda #$12.b                                                  ; $e21b : $a9, $12
	sta $03                                                  ; $e21d : $85, $03

br_13_e21f:
	rts                                                  ; $e21f : $60


	jsr $02d6f8.l                                                  ; $e220 : $22, $f8, $d6, $02
	lda $0f                                                  ; $e224 : $a5, $0f
	bpl br_13_e22c                                                  ; $e226 : $10, $04

	lda #$14.b                                                  ; $e228 : $a9, $14
	sta $03                                                  ; $e22a : $85, $03

br_13_e22c:
	rts                                                  ; $e22c : $60


	jsr $02d6f8.l                                                  ; $e22d : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $e231 : $22, $f7, $c0, $04
	lda $2b                                                  ; $e235 : $a5, $2b
	bit #$04.b                                                  ; $e237 : $89, $04
	beq br_13_e22c                                                  ; $e239 : $f0, $f1

	lda #$16.b                                                  ; $e23b : $a9, $16
	sta $03                                                  ; $e23d : $85, $03
	lda #$70.b                                                  ; $e23f : $a9, $70
	jsr $01802b.l                                                  ; $e241 : $22, $2b, $80, $01
	lda #$0c.b                                                  ; $e245 : $a9, $0c
	jsr Func_4_b967.l                                                  ; $e247 : $22, $67, $b9, $04
	lda $0f                                                  ; $e24b : $a5, $0f
	bpl br_13_e25d                                                  ; $e24d : $10, $0e

	lda #$18.b                                                  ; $e24f : $a9, $18
	sta $03                                                  ; $e251 : $85, $03
	lda #$0a.b                                                  ; $e253 : $a9, $0a
	sta $39                                                  ; $e255 : $85, $39
	lda #$00.b                                                  ; $e257 : $a9, $00
	jsr Func_4_b967.l                                                  ; $e259 : $22, $67, $b9, $04

br_13_e25d:
	rts                                                  ; $e25d : $60


	dec $39                                                  ; $e25e : $c6, $39
	bne br_13_e283                                                  ; $e260 : $d0, $21

	dec $36                                                  ; $e262 : $c6, $36
	beq br_13_e26f                                                  ; $e264 : $f0, $09

	lda #$0a.b                                                  ; $e266 : $a9, $0a
	sta $39                                                  ; $e268 : $85, $39
	jsr Call_13_e3bf.w                                                  ; $e26a : $20, $bf, $e3
	bra br_13_e283                                                  ; $e26d : $80, $14

br_13_e26f:
	jsr Call_13_e3bf.w                                                  ; $e26f : $20, $bf, $e3
	lda #$00.b                                                  ; $e272 : $a9, $00
	jsr Func_4_b967.l                                                  ; $e274 : $22, $67, $b9, $04
	stz $02                                                  ; $e278 : $64, $02
	stz $03                                                  ; $e27a : $64, $03
	lda #$19.b                                                  ; $e27c : $a9, $19
	sta $28                                                  ; $e27e : $85, $28
	sta $1f57.w                                                  ; $e280 : $8d, $57, $1f

br_13_e283:
	rts                                                  ; $e283 : $60


Call_13_e284:
Jump_13_e284:
	ldx $3a                                                  ; $e284 : $a6, $3a
	jmp ($e289.w, X)                                                  ; $e286 : $7c, $89, $e2


	sta ($e2), Y                                                  ; $e289 : $91, $e2
	cpy $e2                                                  ; $e28b : $c4, $e2
	stp                                                  ; $e28d : $db
	sep #$18.b                                                  ; $e28e : $e2, $18
	sbc $a5, S                                                  ; $e290 : $e3, $a5
	tsc                                                  ; $e292 : $3b
	asl                                                  ; $e293 : $0a
	asl                                                  ; $e294 : $0a
	tax                                                  ; $e295 : $aa
	rep #ACCU_8                                                  ; $e296 : $c2, $20
	lda $ecab.w, X                                                  ; $e298 : $bd, $ab, $ec
	sta $1a                                                  ; $e29b : $85, $1a
	lda $ecad.w, X                                                  ; $e29d : $bd, $ad, $ec
	sta $1c                                                  ; $e2a0 : $85, $1c
	lda $11                                                  ; $e2a2 : $a5, $11
	bit #$0040.w                                                  ; $e2a4 : $89, $40, $00
	beq br_13_e2b1                                                  ; $e2a7 : $f0, $08

	lda $1a                                                  ; $e2a9 : $a5, $1a
	eor #$ffff.w                                                  ; $e2ab : $49, $ff, $ff
	ina                                                  ; $e2ae : $1a
	sta $1a                                                  ; $e2af : $85, $1a

br_13_e2b1:
	sep #ACCU_8                                                  ; $e2b1 : $e2, $20
	ldx $3b                                                  ; $e2b3 : $a6, $3b
	lda $ecbb.w, X                                                  ; $e2b5 : $bd, $bb, $ec
	beq br_13_e2be                                                  ; $e2b8 : $f0, $04

	jsr Func_4_b967.l                                                  ; $e2ba : $22, $67, $b9, $04

br_13_e2be:
	lda #$02.b                                                  ; $e2be : $a9, $02
	sta $3a                                                  ; $e2c0 : $85, $3a
	clc                                                  ; $e2c2 : $18
	rts                                                  ; $e2c3 : $60


	lda $0f                                                  ; $e2c4 : $a5, $0f
	bpl br_13_e2d9                                                  ; $e2c6 : $10, $11

	lda #$04.b                                                  ; $e2c8 : $a9, $04
	sta $3a                                                  ; $e2ca : $85, $3a
	lda #$01.b                                                  ; $e2cc : $a9, $01
	sta $2f                                                  ; $e2ce : $85, $2f
	ldx $3b                                                  ; $e2d0 : $a6, $3b
	lda $ecbf.w, X                                                  ; $e2d2 : $bd, $bf, $ec
	jsr Func_4_b967.l                                                  ; $e2d5 : $22, $67, $b9, $04

br_13_e2d9:
	clc                                                  ; $e2d9 : $18
	rts                                                  ; $e2da : $60


	jsr $02d78e.l                                                  ; $e2db : $22, $8e, $d7, $02
	jsr $04c0f7.l                                                  ; $e2df : $22, $f7, $c0, $04
	lda $3b                                                  ; $e2e3 : $a5, $3b
	lsr                                                  ; $e2e5 : $4a
	bcc br_13_e2f0                                                  ; $e2e6 : $90, $08

	lda $2b                                                  ; $e2e8 : $a5, $2b
	bit #$0c.b                                                  ; $e2ea : $89, $0c
	beq br_13_e2d9                                                  ; $e2ec : $f0, $eb

	bra br_13_e2ff                                                  ; $e2ee : $80, $0f

br_13_e2f0:
	lda $2b                                                  ; $e2f0 : $a5, $2b
	bit #$03.b                                                  ; $e2f2 : $89, $03
	beq br_13_e2d9                                                  ; $e2f4 : $f0, $e3

	jsr Call_13_e2ff.w                                                  ; $e2f6 : $20, $ff, $e2
	lda #$06.b                                                  ; $e2f9 : $a9, $06
	sta $3a                                                  ; $e2fb : $85, $3a
	bra br_13_e2d9                                                  ; $e2fd : $80, $da

Call_13_e2ff:
br_13_e2ff:
	stz $2f                                                  ; $e2ff : $64, $2f
	ldx $3b                                                  ; $e301 : $a6, $3b
	cpx #$03.b                                                  ; $e303 : $e0, $03
	bne br_13_e30d                                                  ; $e305 : $d0, $06

	lda #$70.b                                                  ; $e307 : $a9, $70
	jsr $01802b.l                                                  ; $e309 : $22, $2b, $80, $01

br_13_e30d:
	lda $ecc3.w, X                                                  ; $e30d : $bd, $c3, $ec
	jsr Func_4_b967.l                                                  ; $e310 : $22, $67, $b9, $04
	sec                                                  ; $e314 : $38
	rts                                                  ; $e315 : $60


br_13_e316:
	clc                                                  ; $e316 : $18
	rts                                                  ; $e317 : $60


	lda $0f                                                  ; $e318 : $a5, $0f
	bpl br_13_e316                                                  ; $e31a : $10, $fa

	lda $11                                                  ; $e31c : $a5, $11
	eor #$40.b                                                  ; $e31e : $49, $40
	sta $11                                                  ; $e320 : $85, $11
	lda #$08.b                                                  ; $e322 : $a9, $08
	jsr Func_4_b967.l                                                  ; $e324 : $22, $67, $b9, $04
	sec                                                  ; $e328 : $38
	rts                                                  ; $e329 : $60


	lda $03                                                  ; $e32a : $a5, $03
	bne br_13_e35b                                                  ; $e32c : $d0, $2d

	lda #$f0.b                                                  ; $e32e : $a9, $f0
	sta $37                                                  ; $e330 : $85, $37
	lda $36                                                  ; $e332 : $a5, $36
	beq br_13_e33a                                                  ; $e334 : $f0, $04

	lda #$0a.b                                                  ; $e336 : $a9, $0a
	sta $39                                                  ; $e338 : $85, $39

br_13_e33a:
	lda $11                                                  ; $e33a : $a5, $11
	bit #$40.b                                                  ; $e33c : $89, $40
	beq br_13_e344                                                  ; $e33e : $f0, $04

	lda #$ff.b                                                  ; $e340 : $a9, $ff
	bra br_13_e346                                                  ; $e342 : $80, $02

br_13_e344:
	lda #$01.b                                                  ; $e344 : $a9, $01

br_13_e346:
	sta $1b                                                  ; $e346 : $85, $1b
	stz $1a                                                  ; $e348 : $64, $1a
	stz $1c                                                  ; $e34a : $64, $1c
	lda #$02.b                                                  ; $e34c : $a9, $02
	sta $1d                                                  ; $e34e : $85, $1d
	lda #$40.b                                                  ; $e350 : $a9, $40
	sta $1e                                                  ; $e352 : $85, $1e
	stz $1f                                                  ; $e354 : $64, $1f
	lda #$04.b                                                  ; $e356 : $a9, $04
	sta $03                                                  ; $e358 : $85, $03
	rts                                                  ; $e35a : $60


br_13_e35b:
	lda $36                                                  ; $e35b : $a5, $36
	beq br_13_e369                                                  ; $e35d : $f0, $0a

	dec $39                                                  ; $e35f : $c6, $39
	bne br_13_e36c                                                  ; $e361 : $d0, $09

	lda #$0a.b                                                  ; $e363 : $a9, $0a
	sta $39                                                  ; $e365 : $85, $39
	dec $36                                                  ; $e367 : $c6, $36

br_13_e369:
	jsr Call_13_e3bf.w                                                  ; $e369 : $20, $bf, $e3

br_13_e36c:
	jsr $02d6f8.l                                                  ; $e36c : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $e370 : $22, $f7, $c0, $04
	lda $2b                                                  ; $e374 : $a5, $2b
	bit #$03.b                                                  ; $e376 : $89, $03
	beq br_13_e37e                                                  ; $e378 : $f0, $04

	stz $1a                                                  ; $e37a : $64, $1a
	stz $1b                                                  ; $e37c : $64, $1b

br_13_e37e:
	bit #$04.b                                                  ; $e37e : $89, $04
	beq br_13_e38c                                                  ; $e380 : $f0, $0a

	lda #$5a.b                                                  ; $e382 : $a9, $5a
	sta $37                                                  ; $e384 : $85, $37
	lda #$04.b                                                  ; $e386 : $a9, $04
	sta $02                                                  ; $e388 : $85, $02
	stz $03                                                  ; $e38a : $64, $03

br_13_e38c:
	rts                                                  ; $e38c : $60


	ldx $3a                                                  ; $e38d : $a6, $3a
	jmp ($e392.w, X)                                                  ; $e38f : $7c, $92, $e3


	tya                                                  ; $e392 : $98
	sbc $9e, S                                                  ; $e393 : $e3, $9e
	sbc $a2, S                                                  ; $e395 : $e3, $a2
	sbc $64, S                                                  ; $e397 : $e3, $64
	phd                                                  ; $e399 : $0b
	jmp $02e0ba.l                                                  ; $e39a : $5c, $ba, $e0, $02


	jmp $02e0e6.l                                                  ; $e39e : $5c, $e6, $e0, $02


Jump_13_e3a2:
	jsr $04d8cf.l                                                  ; $e3a2 : $22, $cf, $d8, $04
	beq br_13_e3b2                                                  ; $e3a6 : $f0, $0a

	lda #$ff.b                                                  ; $e3a8 : $a9, $ff
	sta $1fc4.w                                                  ; $e3aa : $8d, $c4, $1f
	inc $1f36.w                                                  ; $e3ad : $ee, $36, $1f
	bra br_13_e3bb                                                  ; $e3b0 : $80, $09

br_13_e3b2:
	jsr $04d8e1.l                                                  ; $e3b2 : $22, $e1, $d8, $04
	lda #$08.b                                                  ; $e3b6 : $a9, $08
	tsb $1fda.w                                                  ; $e3b8 : $0c, $da, $1f

br_13_e3bb:
	jmp todo_DisablesEntity_d928.l                                                  ; $e3bb : $5c, $28, $d9, $02


Call_13_e3bf:
	rep #ACCU_8|IDX_8                                                  ; $e3bf : $c2, $30
	lda $36                                                  ; $e3c1 : $a5, $36
	and #$0003.w                                                  ; $e3c3 : $29, $03, $00
	asl                                                  ; $e3c6 : $0a
	tay                                                  ; $e3c7 : $a8
	ldx #$00c0.w                                                  ; $e3c8 : $a2, $c0, $00
	lda $ec91.w, Y                                                  ; $e3cb : $b9, $91, $ec
	tay                                                  ; $e3ce : $a8
	jsr Func_1_804a.l                                                  ; $e3cf : $22, $4a, $80, $01
	lda $36                                                  ; $e3d3 : $a5, $36
	and #$0003.w                                                  ; $e3d5 : $29, $03, $00
	asl                                                  ; $e3d8 : $0a
	tay                                                  ; $e3d9 : $a8
	ldx #$00e0.w                                                  ; $e3da : $a2, $e0, $00
	lda $ec99.w, Y                                                  ; $e3dd : $b9, $99, $ec
	tay                                                  ; $e3e0 : $a8
	jsr Func_1_804a.l                                                  ; $e3e1 : $22, $4a, $80, $01
	sep #ACCU_8|IDX_8                                                  ; $e3e5 : $e2, $30
	rts                                                  ; $e3e7 : $60


Jump_13_e3e8:
	lda wMainLoopCounter.w                                                  ; $e3e8 : $ad, $cb, $09
	and #$02.b                                                  ; $e3eb : $29, $02
	beq br_13_e3f8                                                  ; $e3ed : $f0, $09

	lda $11                                                  ; $e3ef : $a5, $11
	and #$f1.b                                                  ; $e3f1 : $29, $f1
	ora #$0c.b                                                  ; $e3f3 : $09, $0c
	sta $11                                                  ; $e3f5 : $85, $11
	rts                                                  ; $e3f7 : $60


br_13_e3f8:
	lda $11                                                  ; $e3f8 : $a5, $11
	and #$f1.b                                                  ; $e3fa : $29, $f1
	ora #$08.b                                                  ; $e3fc : $09, $08
	sta $11                                                  ; $e3fe : $85, $11
	rts                                                  ; $e400 : $60


Call_13_e401:
	rep #IDX_8                                                  ; $e401 : $c2, $10
	jsr $02d8de.l                                                  ; $e403 : $22, $de, $d8, $02
	bne br_13_e416                                                  ; $e407 : $d0, $0d

	jsr Call_13_e461.w                                                  ; $e409 : $20, $61, $e4
	lda $3b                                                  ; $e40c : $a5, $3b
	sta $000b.w, X                                                  ; $e40e : $9d, $0b, $00
	lda #$02.b                                                  ; $e411 : $a9, $02
	sta $003c.w, X                                                  ; $e413 : $9d, $3c, $00

br_13_e416:
	sep #IDX_8                                                  ; $e416 : $e2, $10
	rts                                                  ; $e418 : $60


Call_13_e419:
	rep #IDX_8                                                  ; $e419 : $c2, $10
	jsr $02d8de.l                                                  ; $e41b : $22, $de, $d8, $02
	bne br_13_e45e                                                  ; $e41f : $d0, $3d

	jsr Call_13_e461.w                                                  ; $e421 : $20, $61, $e4
	lda $3c                                                  ; $e424 : $a5, $3c
	asl                                                  ; $e426 : $0a
	ora $3d                                                  ; $e427 : $05, $3d
	sta $000b.w, X                                                  ; $e429 : $9d, $0b, $00
	stz $003c.w, X                                                  ; $e42c : $9e, $3c, $00
	ldy #$0000.w                                                  ; $e42f : $a0, $00, $00
	lda $3d                                                  ; $e432 : $a5, $3d
	lsr                                                  ; $e434 : $4a
	rep #ACCU_8                                                  ; $e435 : $c2, $20
	bcc br_13_e43c                                                  ; $e437 : $90, $03

	ldy #$0004.w                                                  ; $e439 : $a0, $04, $00

br_13_e43c:
	lda $ecc9.w, Y                                                  ; $e43c : $b9, $c9, $ec
	clc                                                  ; $e43f : $18
	adc $08                                                  ; $e440 : $65, $08
	sta $0008.w, X                                                  ; $e442 : $9d, $08, $00
	lda $11                                                  ; $e445 : $a5, $11
	bit #$0040.w                                                  ; $e447 : $89, $40, $00
	beq br_13_e455                                                  ; $e44a : $f0, $09

	lda $ecc7.w, Y                                                  ; $e44c : $b9, $c7, $ec
	eor #$ffff.w                                                  ; $e44f : $49, $ff, $ff
	ina                                                  ; $e452 : $1a
	bra br_13_e458                                                  ; $e453 : $80, $03

br_13_e455:
	lda $ecc7.w, Y                                                  ; $e455 : $b9, $c7, $ec

br_13_e458:
	clc                                                  ; $e458 : $18
	adc $05                                                  ; $e459 : $65, $05
	sta $0005.w, X                                                  ; $e45b : $9d, $05, $00

br_13_e45e:
	sep #ACCU_8|IDX_8                                                  ; $e45e : $e2, $30
	rts                                                  ; $e460 : $60


Call_13_e461:
	rep #IDX_8                                                  ; $e461 : $c2, $10
	inc $0000.w, X                                                  ; $e463 : $fe, $00, $00
	lda #$25.b                                                  ; $e466 : $a9, $25
	sta $000a.w, X                                                  ; $e468 : $9d, $0a, $00
	lda $18                                                  ; $e46b : $a5, $18
	sta $0018.w, X                                                  ; $e46d : $9d, $18, $00
	lda $16                                                  ; $e470 : $a5, $16
	ina                                                  ; $e472 : $1a
	sta $0016.w, X                                                  ; $e473 : $9d, $16, $00
	lda $11                                                  ; $e476 : $a5, $11
	ora $38                                                  ; $e478 : $05, $38
	clc                                                  ; $e47a : $18
	adc #$02.b                                                  ; $e47b : $69, $02
	sta $0011.w, X                                                  ; $e47d : $9d, $11, $00
	rep #ACCU_8                                                  ; $e480 : $c2, $20
	lda $05                                                  ; $e482 : $a5, $05
	sta $0005.w, X                                                  ; $e484 : $9d, $05, $00
	lda $08                                                  ; $e487 : $a5, $08
	sta $0008.w, X                                                  ; $e489 : $9d, $08, $00
	tdc                                                  ; $e48c : $7b
	sta $0038.w, X                                                  ; $e48d : $9d, $38, $00
	sep #ACCU_8                                                  ; $e490 : $e2, $20
	rts                                                  ; $e492 : $60


	ldx $01                                                  ; $e493 : $a6, $01
	jmp ($e498.w, X)                                                  ; $e495 : $7c, $98, $e4


	dec $e4                                                  ; $e498 : $c6, $e4
	eor ($e6, X)                                                  ; $e49a : $41, $e6
	sta ($e9), Y                                                  ; $e49c : $91, $e9
	ldy $e4                                                  ; $e49e : $a4, $e4
	.db $b0, $e4                                                  ; $e4a0 : $b0, $e4

	ldx $e4, Y                                                  ; $e4a2 : $b6, $e4
	lda $33                                                  ; $e4a4 : $a5, $33
	bmi br_13_e4ac                                                  ; $e4a6 : $30, $04

	dec $30                                                  ; $e4a8 : $c6, $30
	bne br_13_e4c3                                                  ; $e4aa : $d0, $17

br_13_e4ac:
	jmp Func_2_db3f.l                                                  ; $e4ac : $5c, $3f, $db, $02


	lda #$02.b                                                  ; $e4b0 : $a9, $02
	sta $01                                                  ; $e4b2 : $85, $01
	bra br_13_e4c3                                                  ; $e4b4 : $80, $0d

	jsr Func_2_ddfe.l                                                  ; $e4b6 : $22, $fe, $dd, $02
	lda $01                                                  ; $e4ba : $a5, $01
	cmp #$04.b                                                  ; $e4bc : $c9, $04
	bne br_13_e4c3                                                  ; $e4be : $d0, $03

	jmp Jump_13_e699.w                                                  ; $e4c0 : $4c, $99, $e6


br_13_e4c3:
	jmp Jump_13_e641.w                                                  ; $e4c3 : $4c, $41, $e6


	ldx $02                                                  ; $e4c6 : $a6, $02
	jmp ($e4cb.w, X)                                                  ; $e4c8 : $7c, $cb, $e4


	cmp ($e4), Y                                                  ; $e4cb : $d1, $e4
	jsr $e595e5.l                                                  ; $e4cd : $22, $e5, $95, $e5
	jsr $04d8cf.l                                                  ; $e4d1 : $22, $cf, $d8, $04
	beq br_13_e4df                                                  ; $e4d5 : $f0, $08

	bit wtodo_SubweaponsStatus.w                                                  ; $e4d7 : $2c, $bc, $1f
	bvc br_13_e4ef                                                  ; $e4da : $50, $13

	jmp Jump_13_e9bf.w                                                  ; $e4dc : $4c, $bf, $e9


br_13_e4df:
	lda $1fe0.w                                                  ; $e4df : $ad, $e0, $1f
	cmp #$07.b                                                  ; $e4e2 : $c9, $07
	beq br_13_e4ea                                                  ; $e4e4 : $f0, $04

	jmp todo_DisablesEntity_d928.l                                                  ; $e4e6 : $5c, $28, $d9, $02


br_13_e4ea:
	lda $09da.w                                                  ; $e4ea : $ad, $da, $09
	bne br_13_e521                                                  ; $e4ed : $d0, $32

br_13_e4ef:
	jsr todo_CausePlayerToFreeze.l                                                  ; $e4ef : $22, $ca, $d1, $04
	stz $1f54.w                                                  ; $e4f3 : $9c, $54, $1f
	stz $1f55.w                                                  ; $e4f6 : $9c, $55, $1f
	stz $1f56.w                                                  ; $e4f9 : $9c, $56, $1f
	lda #$02.b                                                  ; $e4fc : $a9, $02
	sta $02                                                  ; $e4fe : $85, $02
	lda #$5e.b                                                  ; $e500 : $a9, $5e
	jsr $00850f.l                                                  ; $e502 : $22, $0f, $85, $00
	lda $001f39.l                                                  ; $e506 : $af, $39, $1f, $00
	beq br_13_e512                                                  ; $e50a : $f0, $06

	lda #$27.b                                                  ; $e50c : $a9, $27
	jsr Func_0_84bc.l                                                  ; $e50e : $22, $bc, $84, $00

br_13_e512:
	jsr $04d8cf.l                                                  ; $e512 : $22, $cf, $d8, $04
	bne br_13_e521                                                  ; $e516 : $d0, $09

	lda #$07.b                                                  ; $e518 : $a9, $07
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $e51a : $8d, $18, $1f
	jsr todo_HookAddThreadToDynamicallyLoadSpriteTileData.l                                                  ; $e51d : $22, $dc, $b1, $00

br_13_e521:
	rtl                                                  ; $e521 : $6b


	lda $0040.w                                                  ; $e522 : $ad, $40, $00
	bne br_13_e521                                                  ; $e525 : $d0, $fa

	lda $0a03.w                                                  ; $e527 : $ad, $03, $0a
	bit #$04.b                                                  ; $e52a : $89, $04
	beq br_13_e521                                                  ; $e52c : $f0, $f3

	jsr Func_2_e15c.l                                                  ; $e52e : $22, $5c, $e1, $02
	lda $28                                                  ; $e532 : $a5, $28
	sta $1f57.w                                                  ; $e534 : $8d, $57, $1f
	stz $27                                                  ; $e537 : $64, $27
	stz $3b                                                  ; $e539 : $64, $3b
	stz $3c                                                  ; $e53b : $64, $3c
	stz $37                                                  ; $e53d : $64, $37
	lda #$02.b                                                  ; $e53f : $a9, $02
	sta $26                                                  ; $e541 : $85, $26
	lda #$06.b                                                  ; $e543 : $a9, $06
	sta $12                                                  ; $e545 : $85, $12
	lda #$29.b                                                  ; $e547 : $a9, $29
	sta $11                                                  ; $e549 : $85, $11
	sta $38                                                  ; $e54b : $85, $38
	jsr $02e13f.l                                                  ; $e54d : $22, $3f, $e1, $02
	rep #ACCU_8|F_CARRY                                                  ; $e551 : $c2, $21
	lda #$00c8.w                                                  ; $e553 : $a9, $c8, $00
	adc wNewStageScrollX.w                                                  ; $e556 : $6d, $5d, $1e
	sta $05                                                  ; $e559 : $85, $05
	lda #$ffe0.w                                                  ; $e55b : $a9, $e0, $ff
	clc                                                  ; $e55e : $18
	adc wNewStageScrollY.w                                                  ; $e55f : $6d, $60, $1e
	sta $08                                                  ; $e562 : $85, $08
	lda #$fd00.w                                                  ; $e564 : $a9, $00, $fd
	sta $1c                                                  ; $e567 : $85, $1c
	stz $1a                                                  ; $e569 : $64, $1a
	lda #$f34e.w                                                  ; $e56b : $a9, $4e, $f3
	sta $31                                                  ; $e56e : $85, $31
	lda #$ece0.w                                                  ; $e570 : $a9, $e0, $ec
	sta $20                                                  ; $e573 : $85, $20
	tdc                                                  ; $e575 : $7b
	sta $1f1f.w                                                  ; $e576 : $8d, $1f, $1f
	ldx #$bd00.w                                                  ; $e579 : $a2, $00, $bd
	bra br_13_e582                                                  ; $e57c : $80, $04

	sta $7fcdc0.l, X                                                  ; $e57e : $9f, $c0, $cd, $7f

br_13_e582:
	inx                                                  ; $e582 : $e8
	inx                                                  ; $e583 : $e8
	cpx #$d020.w                                                  ; $e584 : $e0, $20, $d0
	sbc ($e2, S), Y                                                  ; $e587 : $f3, $e2
	jsr $04a9.w                                                  ; $e589 : $20, $a9, $04
	sta $02                                                  ; $e58c : $85, $02
	sta $1f55.w                                                  ; $e58e : $8d, $55, $1f
	stz $03                                                  ; $e591 : $64, $03
	stz $01                                                  ; $e593 : $64, $01
	ldx $03                                                  ; $e595 : $a6, $03
	jsr ($e5a6.w, X)                                                  ; $e597 : $fc, $a6, $e5
	jsr Func_2_d636.l                                                  ; $e59a : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $e59e : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $e5a2 : $5c, $a2, $bc, $04


	.db $b0, $e5                                                  ; $e5a6 : $b0, $e5

	tyx                                                  ; $e5a8 : $bb
	sbc $e6                                                  ; $e5a9 : $e5, $e6
	sbc $f8                                                  ; $e5ab : $e5, $f8
	sbc $05                                                  ; $e5ad : $e5, $05
	inc $a9                                                  ; $e5af : $e6, $a9
	tsb $22                                                  ; $e5b1 : $04, $22
	adc [$b9]                                                  ; $e5b3 : $67, $b9
	tsb $a9                                                  ; $e5b5 : $04, $a9
	cop $85.b                                                  ; $e5b7 : $02, $85
	ora $60, S                                                  ; $e5b9 : $03, $60
	jsr $02d78e.l                                                  ; $e5bb : $22, $8e, $d7, $02
	rep #ACCU_8|F_CARRY                                                  ; $e5bf : $c2, $21
	lda wNewStageScrollY.w                                                  ; $e5c1 : $ad, $60, $1e
	adc #$0098.w                                                  ; $e5c4 : $69, $98, $00
	cmp $08                                                  ; $e5c7 : $c5, $08
	sep #ACCU_8                                                  ; $e5c9 : $e2, $20
	bpl br_13_e5e5                                                  ; $e5cb : $10, $18

	jsr $04c0f7.l                                                  ; $e5cd : $22, $f7, $c0, $04
	lda $2b                                                  ; $e5d1 : $a5, $2b
	bit #$04.b                                                  ; $e5d3 : $89, $04
	beq br_13_e5e5                                                  ; $e5d5 : $f0, $0e

	lda #$04.b                                                  ; $e5d7 : $a9, $04
	sta $03                                                  ; $e5d9 : $85, $03
	lda #$14.b                                                  ; $e5db : $a9, $14
	sta $39                                                  ; $e5dd : $85, $39
	lda #$12.b                                                  ; $e5df : $a9, $12
	jsr Func_4_b967.l                                                  ; $e5e1 : $22, $67, $b9, $04

br_13_e5e5:
	rts                                                  ; $e5e5 : $60


	lda $39                                                  ; $e5e6 : $a5, $39
	beq br_13_e5ed                                                  ; $e5e8 : $f0, $03

	dec $39                                                  ; $e5ea : $c6, $39
	rts                                                  ; $e5ec : $60


br_13_e5ed:
	lda #$16.b                                                  ; $e5ed : $a9, $16
	jsr Func_4_b967.l                                                  ; $e5ef : $22, $67, $b9, $04
	lda #$06.b                                                  ; $e5f3 : $a9, $06
	sta $03                                                  ; $e5f5 : $85, $03
	rts                                                  ; $e5f7 : $60


	lda $0f                                                  ; $e5f8 : $a5, $0f
	bpl br_13_e604                                                  ; $e5fa : $10, $08

	lda #$08.b                                                  ; $e5fc : $a9, $08
	sta $03                                                  ; $e5fe : $85, $03
	lda #$02.b                                                  ; $e600 : $a9, $02
	sta $39                                                  ; $e602 : $85, $39

br_13_e604:
	rts                                                  ; $e604 : $60


	dec $39                                                  ; $e605 : $c6, $39
	bne br_13_e640                                                  ; $e607 : $d0, $37

	lda #$02.b                                                  ; $e609 : $a9, $02
	sta $39                                                  ; $e60b : $85, $39
	lda $27                                                  ; $e60d : $a5, $27
	and #$7f.b                                                  ; $e60f : $29, $7f
	cmp #$20.b                                                  ; $e611 : $c9, $20
	beq br_13_e621                                                  ; $e613 : $f0, $0c

	ina                                                  ; $e615 : $1a
	ora #$80.b                                                  ; $e616 : $09, $80
	sta $27                                                  ; $e618 : $85, $27
	lda #$15.b                                                  ; $e61a : $a9, $15
	jsr $01802b.l                                                  ; $e61c : $22, $2b, $80, $01
	rts                                                  ; $e620 : $60


br_13_e621:
	lda #$02.b                                                  ; $e621 : $a9, $02
	sta $01                                                  ; $e623 : $85, $01
	stz $02                                                  ; $e625 : $64, $02
	stz $03                                                  ; $e627 : $64, $03
	jsr Call_13_e91a.w                                                  ; $e629 : $20, $1a, $e9
	lda #$1e.b                                                  ; $e62c : $a9, $1e
	sta $39                                                  ; $e62e : $85, $39
	jsr $04d1ef.l                                                  ; $e630 : $22, $ef, $d1, $04
	lda $001f39.l                                                  ; $e634 : $af, $39, $1f, $00
	beq br_13_e640                                                  ; $e638 : $f0, $06

	lda #$1a.b                                                  ; $e63a : $a9, $1a
	jsr Func_0_84bc.l                                                  ; $e63c : $22, $bc, $84, $00

br_13_e640:
	rts                                                  ; $e640 : $60


Jump_13_e641:
	jsr $04d8d5.l                                                  ; $e641 : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $e645 : $22, $64, $df, $02
	ldx $02                                                  ; $e649 : $a6, $02
	jsr ($e6c8.w, X)                                                  ; $e64b : $fc, $c8, $e6
	jsr Func_4_cb74.l                                                  ; $e64e : $22, $74, $cb, $04
	bmi br_13_e699                                                  ; $e652 : $30, $45

	bne br_13_e660                                                  ; $e654 : $d0, $0a

	lda $27                                                  ; $e656 : $a5, $27
	beq br_13_e699                                                  ; $e658 : $f0, $3f

	jsr Func_4_cb31.l                                                  ; $e65a : $22, $31, $cb, $04
	bra br_13_e6ad                                                  ; $e65e : $80, $4d

br_13_e660:
	lda $02                                                  ; $e660 : $a5, $02
	cmp #$0a.b                                                  ; $e662 : $c9, $0a
	beq br_13_e6ad                                                  ; $e664 : $f0, $47

	lda $1f2f.w                                                  ; $e666 : $ad, $2f, $1f
	cmp #$0d.b                                                  ; $e669 : $c9, $0d
	beq br_13_e675                                                  ; $e66b : $f0, $08

	cmp #$21.b                                                  ; $e66d : $c9, $21
	beq br_13_e675                                                  ; $e66f : $f0, $04

	cmp #$16.b                                                  ; $e671 : $c9, $16
	bne br_13_e685                                                  ; $e673 : $d0, $10

br_13_e675:
	lda #$3c.b                                                  ; $e675 : $a9, $3c
	sta $39                                                  ; $e677 : $85, $39
	lda #$0a.b                                                  ; $e679 : $a9, $0a
	sta $02                                                  ; $e67b : $85, $02
	stz $03                                                  ; $e67d : $64, $03
	lda #$02.b                                                  ; $e67f : $a9, $02
	jsr Func_4_b967.l                                                  ; $e681 : $22, $67, $b9, $04

br_13_e685:
	lda #$3c.b                                                  ; $e685 : $a9, $3c
	sta $37                                                  ; $e687 : $85, $37
	lda #$0e.b                                                  ; $e689 : $a9, $0e
	trb $11                                                  ; $e68b : $14, $11
	lda #$21.b                                                  ; $e68d : $a9, $21
	jsr Func_1_8000.l                                                  ; $e68f : $22, $00, $80, $01
	lda #$01.b                                                  ; $e693 : $a9, $01
	sta $28                                                  ; $e695 : $85, $28
	bra br_13_e6ad                                                  ; $e697 : $80, $14

Jump_13_e699:
br_13_e699:
	lda #$04.b                                                  ; $e699 : $a9, $04
	sta $01                                                  ; $e69b : $85, $01
	stz $02                                                  ; $e69d : $64, $02
	stz $03                                                  ; $e69f : $64, $03
	stz $3a                                                  ; $e6a1 : $64, $3a
	lda $38                                                  ; $e6a3 : $a5, $38
	tsb $11                                                  ; $e6a5 : $04, $11
	lda #$02.b                                                  ; $e6a7 : $a9, $02
	jsr Func_4_b967.l                                                  ; $e6a9 : $22, $67, $b9, $04

br_13_e6ad:
	lda $01                                                  ; $e6ad : $a5, $01
	sta $1f54.w                                                  ; $e6af : $8d, $54, $1f
	lda $02                                                  ; $e6b2 : $a5, $02
	sta $1f55.w                                                  ; $e6b4 : $8d, $55, $1f
	lda $03                                                  ; $e6b7 : $a5, $03
	sta $1f56.w                                                  ; $e6b9 : $8d, $56, $1f
	jsr Func_2_d636.l                                                  ; $e6bc : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $e6c0 : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $e6c4 : $5c, $a2, $bc, $04


	pei ($e6)                                                  ; $e6c8 : $d4, $e6
	bit #$e7.b                                                  ; $e6ca : $89, $e7
	ldy #$fae8.w                                                  ; $e6cc : $a0, $e8, $fa
	inx                                                  ; $e6cf : $e8
	plp                                                  ; $e6d0 : $28
	sbc #$5a.b                                                  ; $e6d1 : $e9, $5a
	sbc #$a6.b                                                  ; $e6d3 : $e9, $a6
	ora $7c, S                                                  ; $e6d5 : $03, $7c
	cmp $e1e6.w, Y                                                  ; $e6d7 : $d9, $e6, $e1
	inc $07                                                  ; $e6da : $e6, $07
	sbc [$14]                                                  ; $e6dc : $e7, $14
	sbc [$52]                                                  ; $e6de : $e7, $52
	sbc [$22]                                                  ; $e6e0 : $e7, $22
	and $c202e1.l, X                                                  ; $e6e2 : $3f, $e1, $02, $c2
	jsr wJoy1CurrButtonsHeld.w+1                                                  ; $e6e6 : $20, $a9, $00
	ora [$85]                                                  ; $e6e9 : $07, $85
	trb $ddad.w                                                  ; $e6eb : $1c, $ad, $dd
	ora #$38.b                                                  ; $e6ee : $09, $38
	sbc $05                                                  ; $e6f0 : $e5, $05
	asl                                                  ; $e6f2 : $0a
	asl                                                  ; $e6f3 : $0a
	sta $1a                                                  ; $e6f4 : $85, $1a
	sep #ACCU_8                                                  ; $e6f6 : $e2, $20
	lda #$40.b                                                  ; $e6f8 : $a9, $40
	sta $1e                                                  ; $e6fa : $85, $1e
	lda #$02.b                                                  ; $e6fc : $a9, $02
	sta $03                                                  ; $e6fe : $85, $03
	lda #$03.b                                                  ; $e700 : $a9, $03
	jsr Func_4_b967.l                                                  ; $e702 : $22, $67, $b9, $04
	rts                                                  ; $e706 : $60


	lda $0f                                                  ; $e707 : $a5, $0f
	bpl br_13_e713                                                  ; $e709 : $10, $08

	lda #$01.b                                                  ; $e70b : $a9, $01
	sta $2f                                                  ; $e70d : $85, $2f
	lda #$04.b                                                  ; $e70f : $a9, $04
	sta $03                                                  ; $e711 : $85, $03

br_13_e713:
	rts                                                  ; $e713 : $60


	jsr $02d6f8.l                                                  ; $e714 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $e718 : $22, $f7, $c0, $04
	lda $2b                                                  ; $e71c : $a5, $2b
	bit #$04.b                                                  ; $e71e : $89, $04
	bne br_13_e72c                                                  ; $e720 : $d0, $0a

	bit #$03.b                                                  ; $e722 : $89, $03
	beq br_13_e73f                                                  ; $e724 : $f0, $19

	stz $1b                                                  ; $e726 : $64, $1b
	stz $1a                                                  ; $e728 : $64, $1a
	bra br_13_e73f                                                  ; $e72a : $80, $13

br_13_e72c:
	lda #$06.b                                                  ; $e72c : $a9, $06
	sta $03                                                  ; $e72e : $85, $03
	stz $2f                                                  ; $e730 : $64, $2f
	lda #$42.b                                                  ; $e732 : $a9, $42
	jsr $01802b.l                                                  ; $e734 : $22, $2b, $80, $01
	lda #$12.b                                                  ; $e738 : $a9, $12
	jsr Func_4_b967.l                                                  ; $e73a : $22, $67, $b9, $04
	rts                                                  ; $e73e : $60


br_13_e73f:
	lda $1d                                                  ; $e73f : $a5, $1d
	bpl br_13_e751                                                  ; $e741 : $10, $0e

	lda $2f                                                  ; $e743 : $a5, $2f
	bit #$02.b                                                  ; $e745 : $89, $02
	bne br_13_e751                                                  ; $e747 : $d0, $08

	inc $2f                                                  ; $e749 : $e6, $2f
	lda #$05.b                                                  ; $e74b : $a9, $05
	jsr Func_4_b967.l                                                  ; $e74d : $22, $67, $b9, $04

br_13_e751:
	rts                                                  ; $e751 : $60


	lda $0f                                                  ; $e752 : $a5, $0f
	bpl br_13_e788                                                  ; $e754 : $10, $32

	stz $03                                                  ; $e756 : $64, $03
	jsr $02e13f.l                                                  ; $e758 : $22, $3f, $e1, $02
	dec $3a                                                  ; $e75c : $c6, $3a
	bne br_13_e788                                                  ; $e75e : $d0, $28

	jsr Func_4_be35.l                                                  ; $e760 : $22, $35, $be, $04
	and #$07.b                                                  ; $e764 : $29, $07
	beq br_13_e783                                                  ; $e766 : $f0, $1b

	lda $27                                                  ; $e768 : $a5, $27
	cmp #$10.b                                                  ; $e76a : $c9, $10
	bpl br_13_e772                                                  ; $e76c : $10, $04

	lda #$08.b                                                  ; $e76e : $a9, $08
	bra br_13_e774                                                  ; $e770 : $80, $02

br_13_e772:
	lda #$04.b                                                  ; $e772 : $a9, $04

br_13_e774:
	sta $02                                                  ; $e774 : $85, $02
	stz $03                                                  ; $e776 : $64, $03
	lda #$0a.b                                                  ; $e778 : $a9, $0a
	sta $39                                                  ; $e77a : $85, $39
	lda #$00.b                                                  ; $e77c : $a9, $00
	jsr Func_4_b967.l                                                  ; $e77e : $22, $67, $b9, $04
	rts                                                  ; $e782 : $60


br_13_e783:
	and #$01.b                                                  ; $e783 : $29, $01
	ina                                                  ; $e785 : $1a
	sta $3a                                                  ; $e786 : $85, $3a

br_13_e788:
	rts                                                  ; $e788 : $60


	ldx $03                                                  ; $e789 : $a6, $03
	jmp ($e78e.w, X)                                                  ; $e78b : $7c, $8e, $e7


	stz $c5e7.w, X                                                  ; $e78e : $9e, $e7, $c5
	sbc [$f1]                                                  ; $e791 : $e7, $f1
	sbc [$07]                                                  ; $e793 : $e7, $07
	inx                                                  ; $e795 : $e8
	asl $e8, X                                                  ; $e796 : $16, $e8
	and $4fe8.w, Y                                                  ; $e798 : $39, $e8, $4f
	inx                                                  ; $e79b : $e8
	ror $e8, X                                                  ; $e79c : $76, $e8
	ldx #$c200.w                                                  ; $e79e : $a2, $00, $c2
	jsr $a0bd.w                                                  ; $e7a1 : $20, $bd, $a0
	tsb $9f                                                  ; $e7a4 : $04, $9f
	cpy #$7fca.w                                                  ; $e7a6 : $c0, $ca, $7f
	inx                                                  ; $e7a9 : $e8
	inx                                                  ; $e7aa : $e8
	cpx #$d020.w                                                  ; $e7ab : $e0, $20, $d0
	sbc ($e2, S), Y                                                  ; $e7ae : $f3, $e2
	jsr $04a9.w                                                  ; $e7b0 : $20, $a9, $04
	sta $39                                                  ; $e7b3 : $85, $39
	lda #$0d.b                                                  ; $e7b5 : $a9, $0d
	sta $28                                                  ; $e7b7 : $85, $28
	sta $1f57.w                                                  ; $e7b9 : $8d, $57, $1f
	lda #$04.b                                                  ; $e7bc : $a9, $04
	sta $26                                                  ; $e7be : $85, $26
	lda #$02.b                                                  ; $e7c0 : $a9, $02
	sta $03                                                  ; $e7c2 : $85, $03
	rts                                                  ; $e7c4 : $60


	dec $39                                                  ; $e7c5 : $c6, $39
	bne br_13_e7f0                                                  ; $e7c7 : $d0, $27

	lda #$04.b                                                  ; $e7c9 : $a9, $04
	sta $39                                                  ; $e7cb : $85, $39
	rep #ACCU_8|IDX_8                                                  ; $e7cd : $c2, $30
	lda #$0010.w                                                  ; $e7cf : $a9, $10, $00
	sta $0008.w                                                  ; $e7d2 : $8d, $08, $00
	ldx #$0180.w                                                  ; $e7d5 : $a2, $80, $01
	jsr $02e016.l                                                  ; $e7d8 : $22, $16, $e0, $02
	sep #ACCU_8|IDX_8                                                  ; $e7dc : $e2, $30
	bcs br_13_e7f0                                                  ; $e7de : $b0, $10

	lda #$04.b                                                  ; $e7e0 : $a9, $04
	sta $03                                                  ; $e7e2 : $85, $03
	lda #$70.b                                                  ; $e7e4 : $a9, $70
	jsr Func_1_8000.l                                                  ; $e7e6 : $22, $00, $80, $01
	lda #$13.b                                                  ; $e7ea : $a9, $13
	jsr Func_4_b967.l                                                  ; $e7ec : $22, $67, $b9, $04

br_13_e7f0:
	rts                                                  ; $e7f0 : $60


	lda $0f                                                  ; $e7f1 : $a5, $0f
	bpl br_13_e806                                                  ; $e7f3 : $10, $11

	lda #$06.b                                                  ; $e7f5 : $a9, $06
	sta $03                                                  ; $e7f7 : $85, $03
	lda $11                                                  ; $e7f9 : $a5, $11
	clc                                                  ; $e7fb : $18
	adc #$02.b                                                  ; $e7fc : $69, $02
	sta $11                                                  ; $e7fe : $85, $11
	lda #$15.b                                                  ; $e800 : $a9, $15
	jsr Func_4_b967.l                                                  ; $e802 : $22, $67, $b9, $04

br_13_e806:
	rts                                                  ; $e806 : $60


	lda $0f                                                  ; $e807 : $a5, $0f
	bpl br_13_e815                                                  ; $e809 : $10, $0a

	lda #$08.b                                                  ; $e80b : $a9, $08
	sta $03                                                  ; $e80d : $85, $03
	inc $09                                                  ; $e80f : $e6, $09
	lda #$78.b                                                  ; $e811 : $a9, $78
	sta $39                                                  ; $e813 : $85, $39

br_13_e815:
	rts                                                  ; $e815 : $60


	dec $39                                                  ; $e816 : $c6, $39
	bne br_13_e838                                                  ; $e818 : $d0, $1e

	jsr Func_4_be35.l                                                  ; $e81a : $22, $35, $be, $04
	and #$07.b                                                  ; $e81e : $29, $07
	tax                                                  ; $e820 : $aa
	lda $ecea.w, X                                                  ; $e821 : $bd, $ea, $ec
	sta $05                                                  ; $e824 : $85, $05
	lda #$0a.b                                                  ; $e826 : $a9, $0a
	sta $03                                                  ; $e828 : $85, $03
	lda #$71.b                                                  ; $e82a : $a9, $71
	jsr Func_1_8000.l                                                  ; $e82c : $22, $00, $80, $01
	dec $09                                                  ; $e830 : $c6, $09
	lda #$11.b                                                  ; $e832 : $a9, $11
	jsr Func_4_b967.l                                                  ; $e834 : $22, $67, $b9, $04

br_13_e838:
	rts                                                  ; $e838 : $60


	lda $0f                                                  ; $e839 : $a5, $0f
	bpl br_13_e84e                                                  ; $e83b : $10, $11

	lda #$0c.b                                                  ; $e83d : $a9, $0c
	sta $03                                                  ; $e83f : $85, $03
	lda $11                                                  ; $e841 : $a5, $11
	sec                                                  ; $e843 : $38
	sbc #$02.b                                                  ; $e844 : $e9, $02
	sta $11                                                  ; $e846 : $85, $11
	lda #$14.b                                                  ; $e848 : $a9, $14
	jsr Func_4_b967.l                                                  ; $e84a : $22, $67, $b9, $04

br_13_e84e:
	rts                                                  ; $e84e : $60


	lda $0f                                                  ; $e84f : $a5, $0f
	bpl br_13_e875                                                  ; $e851 : $10, $22

	ldx #$00.b                                                  ; $e853 : $a2, $00
	rep #ACCU_8                                                  ; $e855 : $c2, $20

br_13_e857:
	lda $7fcdc0.l, X                                                  ; $e857 : $bf, $c0, $cd, $7f
	sta $7fcac0.l, X                                                  ; $e85b : $9f, $c0, $ca, $7f
	inx                                                  ; $e85f : $e8
	inx                                                  ; $e860 : $e8
	cpx #$20.b                                                  ; $e861 : $e0, $20
	bne br_13_e857                                                  ; $e863 : $d0, $f2

	sep #ACCU_8                                                  ; $e865 : $e2, $20
	lda #$04.b                                                  ; $e867 : $a9, $04
	sta $39                                                  ; $e869 : $85, $39
	lda #$0e.b                                                  ; $e86b : $a9, $0e
	sta $03                                                  ; $e86d : $85, $03
	lda #$00.b                                                  ; $e86f : $a9, $00
	jsr Func_4_b967.l                                                  ; $e871 : $22, $67, $b9, $04

br_13_e875:
	rts                                                  ; $e875 : $60


	dec $39                                                  ; $e876 : $c6, $39
	bne br_13_e89f                                                  ; $e878 : $d0, $25

	lda #$04.b                                                  ; $e87a : $a9, $04
	sta $39                                                  ; $e87c : $85, $39
	rep #ACCU_8|IDX_8                                                  ; $e87e : $c2, $30
	lda #$0010.w                                                  ; $e880 : $a9, $10, $00
	sta $0008.w                                                  ; $e883 : $8d, $08, $00
	ldx #$0180.w                                                  ; $e886 : $a2, $80, $01
	jsr $02e016.l                                                  ; $e889 : $22, $16, $e0, $02
	sep #ACCU_8|IDX_8                                                  ; $e88d : $e2, $30
	bcs br_13_e89f                                                  ; $e88f : $b0, $0e

	lda #$15.b                                                  ; $e891 : $a9, $15
	sta $28                                                  ; $e893 : $85, $28
	sta $1f57.w                                                  ; $e895 : $8d, $57, $1f
	lda #$02.b                                                  ; $e898 : $a9, $02
	sta $26                                                  ; $e89a : $85, $26
	jmp Jump_13_e91a.w                                                  ; $e89c : $4c, $1a, $e9


br_13_e89f:
	rts                                                  ; $e89f : $60


	ldx $03                                                  ; $e8a0 : $a6, $03
	jmp ($e8a5.w, X)                                                  ; $e8a2 : $7c, $a5, $e8


	lda $c3e8.w                                                  ; $e8a5 : $ad, $e8, $c3
	inx                                                  ; $e8a8 : $e8
	cmp ($e8)                                                  ; $e8a9 : $d2, $e8
	sbc $e8                                                  ; $e8ab : $e5, $e8
	dec $39                                                  ; $e8ad : $c6, $39
	bne br_13_e8c2                                                  ; $e8af : $d0, $11

	lda #$02.b                                                  ; $e8b1 : $a9, $02
	sta $03                                                  ; $e8b3 : $85, $03
	lda #$1e.b                                                  ; $e8b5 : $a9, $1e
	sta $39                                                  ; $e8b7 : $85, $39
	jsr Call_13_ea04.w                                                  ; $e8b9 : $20, $04, $ea
	lda #$06.b                                                  ; $e8bc : $a9, $06
	jsr Func_4_b967.l                                                  ; $e8be : $22, $67, $b9, $04

br_13_e8c2:
	rts                                                  ; $e8c2 : $60


	dec $39                                                  ; $e8c3 : $c6, $39
	bne br_13_e8c2                                                  ; $e8c5 : $d0, $fb

	lda #$04.b                                                  ; $e8c7 : $a9, $04
	sta $03                                                  ; $e8c9 : $85, $03
	lda #$08.b                                                  ; $e8cb : $a9, $08
	jsr Func_4_b967.l                                                  ; $e8cd : $22, $67, $b9, $04
	rts                                                  ; $e8d1 : $60


	lda $0f                                                  ; $e8d2 : $a5, $0f
	bpl br_13_e8e4                                                  ; $e8d4 : $10, $0e

	lda #$1e.b                                                  ; $e8d6 : $a9, $1e
	sta $39                                                  ; $e8d8 : $85, $39
	lda #$07.b                                                  ; $e8da : $a9, $07
	jsr Func_4_b967.l                                                  ; $e8dc : $22, $67, $b9, $04
	lda #$06.b                                                  ; $e8e0 : $a9, $06
	sta $03                                                  ; $e8e2 : $85, $03

br_13_e8e4:
	rts                                                  ; $e8e4 : $60


	dec $39                                                  ; $e8e5 : $c6, $39
	bne br_13_e8f9                                                  ; $e8e7 : $d0, $10

	lda #$78.b                                                  ; $e8e9 : $a9, $78
	sta $39                                                  ; $e8eb : $85, $39
	lda #$06.b                                                  ; $e8ed : $a9, $06
	sta $02                                                  ; $e8ef : $85, $02
	stz $03                                                  ; $e8f1 : $64, $03
	lda #$01.b                                                  ; $e8f3 : $a9, $01
	jsr Func_4_b967.l                                                  ; $e8f5 : $22, $67, $b9, $04

br_13_e8f9:
	rts                                                  ; $e8f9 : $60


	dec $39                                                  ; $e8fa : $c6, $39
	bne br_13_e8f9                                                  ; $e8fc : $d0, $fb

	lda $27                                                  ; $e8fe : $a5, $27
	and #$1f.b                                                  ; $e900 : $29, $1f
	bit #$10.b                                                  ; $e902 : $89, $10
	bne br_13_e91a                                                  ; $e904 : $d0, $14

	jsr Func_4_be35.l                                                  ; $e906 : $22, $35, $be, $04
	lsr                                                  ; $e90a : $4a
	bcc br_13_e91a                                                  ; $e90b : $90, $0d

	lda #$02.b                                                  ; $e90d : $a9, $02
	sta $02                                                  ; $e90f : $85, $02
	stz $03                                                  ; $e911 : $64, $03
	lda #$00.b                                                  ; $e913 : $a9, $00
	jsr Func_4_b967.l                                                  ; $e915 : $22, $67, $b9, $04
	rts                                                  ; $e919 : $60


Call_13_e91a:
Jump_13_e91a:
br_13_e91a:
	jsr Func_4_be35.l                                                  ; $e91a : $22, $35, $be, $04
	and #$01.b                                                  ; $e91e : $29, $01
	ina                                                  ; $e920 : $1a
	sta $3a                                                  ; $e921 : $85, $3a
	stz $02                                                  ; $e923 : $64, $02
	stz $03                                                  ; $e925 : $64, $03
	rts                                                  ; $e927 : $60


	ldx $03                                                  ; $e928 : $a6, $03
	jmp ($e92d.w, X)                                                  ; $e92a : $7c, $2d, $e9


	and ($e9, S), Y                                                  ; $e92d : $33, $e9
	wdm                                                  ; $e92f : $42
	sbc #$e5.b                                                  ; $e930 : $e9, $e5
	inx                                                  ; $e932 : $e8
	dec $39                                                  ; $e933 : $c6, $39
	bne br_13_e941                                                  ; $e935 : $d0, $0a

	lda #$02.b                                                  ; $e937 : $a9, $02
	sta $03                                                  ; $e939 : $85, $03
	lda #$0d.b                                                  ; $e93b : $a9, $0d
	jsr Func_4_b967.l                                                  ; $e93d : $22, $67, $b9, $04

br_13_e941:
	rts                                                  ; $e941 : $60


	lda $0f                                                  ; $e942 : $a5, $0f
	bit #$40.b                                                  ; $e944 : $89, $40
	beq br_13_e959                                                  ; $e946 : $f0, $11

	jsr Call_13_e9dc.w                                                  ; $e948 : $20, $dc, $e9
	lda #$74.b                                                  ; $e94b : $a9, $74
	jsr $01802b.l                                                  ; $e94d : $22, $2b, $80, $01
	lda #$08.b                                                  ; $e951 : $a9, $08
	sta $39                                                  ; $e953 : $85, $39
	lda #$04.b                                                  ; $e955 : $a9, $04
	sta $03                                                  ; $e957 : $85, $03

br_13_e959:
	rts                                                  ; $e959 : $60


	lda $03                                                  ; $e95a : $a5, $03
	bne br_13_e973                                                  ; $e95c : $d0, $15

	lda #$32.b                                                  ; $e95e : $a9, $32
	sta $39                                                  ; $e960 : $85, $39
	lda $2f                                                  ; $e962 : $a5, $2f
	beq br_13_e96e                                                  ; $e964 : $f0, $08

	stz $1a                                                  ; $e966 : $64, $1a
	stz $1b                                                  ; $e968 : $64, $1b
	stz $1c                                                  ; $e96a : $64, $1c
	stz $1d                                                  ; $e96c : $64, $1d

br_13_e96e:
	lda #$02.b                                                  ; $e96e : $a9, $02
	sta $03                                                  ; $e970 : $85, $03
	rts                                                  ; $e972 : $60


br_13_e973:
	lda $2f                                                  ; $e973 : $a5, $2f
	beq br_13_e980                                                  ; $e975 : $f0, $09

	jsr $02d6f8.l                                                  ; $e977 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $e97b : $22, $f7, $c0, $04
	rts                                                  ; $e97f : $60


br_13_e980:
	dec $39                                                  ; $e980 : $c6, $39
	bne br_13_e990                                                  ; $e982 : $d0, $0c

	lda #$3c.b                                                  ; $e984 : $a9, $3c
	sta $37                                                  ; $e986 : $85, $37
	lda #$01.b                                                  ; $e988 : $a9, $01
	sta $3a                                                  ; $e98a : $85, $3a
	stz $02                                                  ; $e98c : $64, $02
	stz $03                                                  ; $e98e : $64, $03

br_13_e990:
	rts                                                  ; $e990 : $60


	ldx $3a                                                  ; $e991 : $a6, $3a
	jmp ($e996.w, X)                                                  ; $e993 : $7c, $96, $e9


	stz $bbe9.w                                                  ; $e996 : $9c, $e9, $bb
	sbc #$bf.b                                                  ; $e999 : $e9, $bf
	sbc #$a2.b                                                  ; $e99b : $e9, $a2
	ora $cdc0bf.l, X                                                  ; $e99d : $1f, $bf, $c0, $cd
	adc $04809d.l, X                                                  ; $e9a1 : $7f, $9d, $80, $04
	dex                                                  ; $e9a5 : $ca
	.db $10, $f6                                                  ; $e9a6 : $10, $f6

	lda #$01.b                                                  ; $e9a8 : $a9, $01
	sta $00a1.w                                                  ; $e9aa : $8d, $a1, $00
	lda $11                                                  ; $e9ad : $a5, $11
	and #$c0.b                                                  ; $e9af : $29, $c0
	ora #$29.b                                                  ; $e9b1 : $09, $29
	sta $11                                                  ; $e9b3 : $85, $11
	stz $0b                                                  ; $e9b5 : $64, $0b
	jmp $02e0ba.l                                                  ; $e9b7 : $5c, $ba, $e0, $02


	jmp $02e0e6.l                                                  ; $e9bb : $5c, $e6, $e0, $02


Jump_13_e9bf:
	jsr $04d8cf.l                                                  ; $e9bf : $22, $cf, $d8, $04
	beq br_13_e9cf                                                  ; $e9c3 : $f0, $0a

	lda #$ff.b                                                  ; $e9c5 : $a9, $ff
	sta wtodo_SubweaponsStatus.w                                                  ; $e9c7 : $8d, $bc, $1f
	inc $1f36.w                                                  ; $e9ca : $ee, $36, $1f
	bra br_13_e9d8                                                  ; $e9cd : $80, $09

br_13_e9cf:
	jsr $04d8e1.l                                                  ; $e9cf : $22, $e1, $d8, $04
	lda #$04.b                                                  ; $e9d3 : $a9, $04
	tsb $1fda.w                                                  ; $e9d5 : $0c, $da, $1f

br_13_e9d8:
	jmp todo_DisablesEntity_d928.l                                                  ; $e9d8 : $5c, $28, $d9, $02


Call_13_e9dc:
	rep #IDX_8                                                  ; $e9dc : $c2, $10
	jsr $02d8de.l                                                  ; $e9de : $22, $de, $d8, $02
	bne br_13_ea1e                                                  ; $e9e2 : $d0, $3a

	jsr Call_13_ea21.w                                                  ; $e9e4 : $20, $21, $ea
	lda #$04.b                                                  ; $e9e7 : $a9, $04
	sta $000b.w, X                                                  ; $e9e9 : $9d, $0b, $00
	stz $0036.w, X                                                  ; $e9ec : $9e, $36, $00
	jsr $02d8de.l                                                  ; $e9ef : $22, $de, $d8, $02
	bne br_13_ea1e                                                  ; $e9f3 : $d0, $29

	jsr Call_13_ea21.w                                                  ; $e9f5 : $20, $21, $ea
	lda #$04.b                                                  ; $e9f8 : $a9, $04
	sta $000b.w, X                                                  ; $e9fa : $9d, $0b, $00
	lda #$01.b                                                  ; $e9fd : $a9, $01
	sta $0036.w, X                                                  ; $e9ff : $9d, $36, $00
	bra br_13_ea1e                                                  ; $ea02 : $80, $1a

Call_13_ea04:
	rep #IDX_8                                                  ; $ea04 : $c2, $10
	jsr $02d8de.l                                                  ; $ea06 : $22, $de, $d8, $02
	bne br_13_ea1e                                                  ; $ea0a : $d0, $12

	jsr Call_13_ea21.w                                                  ; $ea0c : $20, $21, $ea
	stz $000b.w, X                                                  ; $ea0f : $9e, $0b, $00
	rep #ACCU_8                                                  ; $ea12 : $c2, $20
	lda $05                                                  ; $ea14 : $a5, $05
	sta $0005.w, X                                                  ; $ea16 : $9d, $05, $00
	lda $08                                                  ; $ea19 : $a5, $08
	sta $0008.w, X                                                  ; $ea1b : $9d, $08, $00

br_13_ea1e:
	sep #ACCU_8|IDX_8                                                  ; $ea1e : $e2, $30
	rts                                                  ; $ea20 : $60


Call_13_ea21:
	rep #IDX_8                                                  ; $ea21 : $c2, $10
	inc $0000.w, X                                                  ; $ea23 : $fe, $00, $00
	lda #$23.b                                                  ; $ea26 : $a9, $23
	sta $000a.w, X                                                  ; $ea28 : $9d, $0a, $00
	lda $11                                                  ; $ea2b : $a5, $11
	ora $38                                                  ; $ea2d : $05, $38
	clc                                                  ; $ea2f : $18
	adc #$02.b                                                  ; $ea30 : $69, $02
	sta $0011.w, X                                                  ; $ea32 : $9d, $11, $00
	lda $18                                                  ; $ea35 : $a5, $18
	sta $0018.w, X                                                  ; $ea37 : $9d, $18, $00
	lda $16                                                  ; $ea3a : $a5, $16
	ina                                                  ; $ea3c : $1a
	sta $0016.w, X                                                  ; $ea3d : $9d, $16, $00
	rep #ACCU_8                                                  ; $ea40 : $c2, $20
	lda $11                                                  ; $ea42 : $a5, $11
	bit #$0040.w                                                  ; $ea44 : $89, $40, $00
	beq br_13_ea4e                                                  ; $ea47 : $f0, $05

	lda #$0020.w                                                  ; $ea49 : $a9, $20, $00
	bra br_13_ea51                                                  ; $ea4c : $80, $03

br_13_ea4e:
	lda #$ffe0.w                                                  ; $ea4e : $a9, $e0, $ff

br_13_ea51:
	clc                                                  ; $ea51 : $18
	adc $05                                                  ; $ea52 : $65, $05
	sta $0005.w, X                                                  ; $ea54 : $9d, $05, $00
	lda $08                                                  ; $ea57 : $a5, $08
	sec                                                  ; $ea59 : $38
	sbc #$0026.w                                                  ; $ea5a : $e9, $26, $00
	sta $0008.w, X                                                  ; $ea5d : $9d, $08, $00
	tdc                                                  ; $ea60 : $7b
	sta $0038.w, X                                                  ; $ea61 : $9d, $38, $00
	sep #ACCU_8                                                  ; $ea64 : $e2, $20
	rts                                                  ; $ea66 : $60


	ldx $01                                                  ; $ea67 : $a6, $01
	jmp ($ea6c.w, X)                                                  ; $ea69 : $7c, $6c, $ea


	txs                                                  ; $ea6c : $9a
	nop                                                  ; $ea6d : $ea
	cpx $a1eb.w                                                  ; $ea6e : $ec, $eb, $a1
	beq br_13_eaeb                                                  ; $ea71 : $f0, $78

	nop                                                  ; $ea73 : $ea
	sty $ea                                                  ; $ea74 : $84, $ea
	txa                                                  ; $ea76 : $8a
	nop                                                  ; $ea77 : $ea
	lda $33                                                  ; $ea78 : $a5, $33
	bmi br_13_ea80                                                  ; $ea7a : $30, $04

	dec $30                                                  ; $ea7c : $c6, $30
	bne br_13_ea97                                                  ; $ea7e : $d0, $17

br_13_ea80:
	jmp Func_2_db3f.l                                                  ; $ea80 : $5c, $3f, $db, $02


	lda #$02.b                                                  ; $ea84 : $a9, $02
	sta $01                                                  ; $ea86 : $85, $01
	bra br_13_ea97                                                  ; $ea88 : $80, $0d

	jsr Func_2_ddfe.l                                                  ; $ea8a : $22, $fe, $dd, $02
	lda $01                                                  ; $ea8e : $a5, $01
	cmp #$04.b                                                  ; $ea90 : $c9, $04
	bne br_13_ea97                                                  ; $ea92 : $d0, $03

	jmp Jump_13_ec4c.w                                                  ; $ea94 : $4c, $4c, $ec


br_13_ea97:
	jmp Jump_13_ebec.w                                                  ; $ea97 : $4c, $ec, $eb


	ldx $02                                                  ; $ea9a : $a6, $02
	jmp ($ea9f.w, X)                                                  ; $ea9c : $7c, $9f, $ea


	lda $ea                                                  ; $ea9f : $a5, $ea
	xba                                                  ; $eaa1 : $eb
	nop                                                  ; $eaa2 : $ea
	eor $eb, S                                                  ; $eaa3 : $43, $eb
	jsr $04d8cf.l                                                  ; $eaa5 : $22, $cf, $d8, $04
	beq br_13_eab3                                                  ; $eaa9 : $f0, $08

	bit $1fc0.w                                                  ; $eaab : $2c, $c0, $1f
	bvc br_13_eab8                                                  ; $eaae : $50, $08

	jmp Jump_13_f0b6.w                                                  ; $eab0 : $4c, $b6, $f0


br_13_eab3:
	lda $09da.w                                                  ; $eab3 : $ad, $da, $09
	bne br_13_eaea                                                  ; $eab6 : $d0, $32

br_13_eab8:
	jsr todo_CausePlayerToFreeze.l                                                  ; $eab8 : $22, $ca, $d1, $04
	stz $1f54.w                                                  ; $eabc : $9c, $54, $1f
	stz $1f55.w                                                  ; $eabf : $9c, $55, $1f
	stz $1f56.w                                                  ; $eac2 : $9c, $56, $1f
	lda #$02.b                                                  ; $eac5 : $a9, $02
	sta $02                                                  ; $eac7 : $85, $02
	lda #$5c.b                                                  ; $eac9 : $a9, $5c
	jsr $00850f.l                                                  ; $eacb : $22, $0f, $85, $00
	lda $001f39.l                                                  ; $eacf : $af, $39, $1f, $00
	beq br_13_eadb                                                  ; $ead3 : $f0, $06

	lda #$27.b                                                  ; $ead5 : $a9, $27
	jsr Func_0_84bc.l                                                  ; $ead7 : $22, $bc, $84, $00

br_13_eadb:
	jsr $04d8cf.l                                                  ; $eadb : $22, $cf, $d8, $04
	bne br_13_eaea                                                  ; $eadf : $d0, $09

	lda #$08.b                                                  ; $eae1 : $a9, $08
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $eae3 : $8d, $18, $1f
	jsr todo_HookAddThreadToDynamicallyLoadSpriteTileData.l                                                  ; $eae6 : $22, $dc, $b1, $00

br_13_eaea:
	rtl                                                  ; $eaea : $6b


br_13_eaeb:
	lda $0040.w                                                  ; $eaeb : $ad, $40, $00
	bne br_13_eaea                                                  ; $eaee : $d0, $fa

	jsr Func_2_e15c.l                                                  ; $eaf0 : $22, $5c, $e1, $02
	lda $28                                                  ; $eaf4 : $a5, $28
	sta $1f57.w                                                  ; $eaf6 : $8d, $57, $1f
	stz $27                                                  ; $eaf9 : $64, $27
	stz $3b                                                  ; $eafb : $64, $3b
	stz $37                                                  ; $eafd : $64, $37
	lda #$02.b                                                  ; $eaff : $a9, $02
	sta $26                                                  ; $eb01 : $85, $26
	lda #$06.b                                                  ; $eb03 : $a9, $06
	sta $12                                                  ; $eb05 : $85, $12
	lda #$29.b                                                  ; $eb07 : $a9, $29
	sta $11                                                  ; $eb09 : $85, $11
	sta $38                                                  ; $eb0b : $85, $38
	jsr $02e13f.l                                                  ; $eb0d : $22, $3f, $e1, $02
	rep #ACCU_8|F_CARRY                                                  ; $eb11 : $c2, $21
	lda #$00d0.w                                                  ; $eb13 : $a9, $d0, $00
	adc wNewStageScrollX.w                                                  ; $eb16 : $6d, $5d, $1e
	sta $05                                                  ; $eb19 : $85, $05
	lda #$ffe0.w                                                  ; $eb1b : $a9, $e0, $ff
	clc                                                  ; $eb1e : $18
	adc wNewStageScrollY.w                                                  ; $eb1f : $6d, $60, $1e
	sta $08                                                  ; $eb22 : $85, $08
	lda #$fd00.w                                                  ; $eb24 : $a9, $00, $fd
	sta $1c                                                  ; $eb27 : $85, $1c
	stz $1a                                                  ; $eb29 : $64, $1a
	lda #$f5b0.w                                                  ; $eb2b : $a9, $b0, $f5
	sta $31                                                  ; $eb2e : $85, $31
	lda #$ecf2.w                                                  ; $eb30 : $a9, $f2, $ec
	sta $20                                                  ; $eb33 : $85, $20
	tdc                                                  ; $eb35 : $7b
	sta $1f1f.w                                                  ; $eb36 : $8d, $1f, $1f
	sep #ACCU_8                                                  ; $eb39 : $e2, $20
	lda #$04.b                                                  ; $eb3b : $a9, $04
	sta $02                                                  ; $eb3d : $85, $02
	stz $03                                                  ; $eb3f : $64, $03
	stz $01                                                  ; $eb41 : $64, $01
	ldx $03                                                  ; $eb43 : $a6, $03
	jsr ($eb54.w, X)                                                  ; $eb45 : $fc, $54, $eb
	jsr Func_2_d636.l                                                  ; $eb48 : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $eb4c : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $eb50 : $5c, $a2, $bc, $04


	lsr $69eb.w, X                                                  ; $eb54 : $5e, $eb, $69
	xba                                                  ; $eb57 : $eb
	sty $eb, X                                                  ; $eb58 : $94, $eb
	ldx $eb                                                  ; $eb5a : $a6, $eb
	lda ($eb, S), Y                                                  ; $eb5c : $b3, $eb
	lda #$04.b                                                  ; $eb5e : $a9, $04
	jsr Func_4_b967.l                                                  ; $eb60 : $22, $67, $b9, $04
	lda #$02.b                                                  ; $eb64 : $a9, $02
	sta $03                                                  ; $eb66 : $85, $03
	rts                                                  ; $eb68 : $60


	jsr $02d78e.l                                                  ; $eb69 : $22, $8e, $d7, $02
	rep #ACCU_8|F_CARRY                                                  ; $eb6d : $c2, $21
	lda wNewStageScrollY.w                                                  ; $eb6f : $ad, $60, $1e
	adc #$0098.w                                                  ; $eb72 : $69, $98, $00
	cmp $08                                                  ; $eb75 : $c5, $08
	sep #ACCU_8                                                  ; $eb77 : $e2, $20
	bpl br_13_eb93                                                  ; $eb79 : $10, $18

	jsr $04c0f7.l                                                  ; $eb7b : $22, $f7, $c0, $04
	lda $2b                                                  ; $eb7f : $a5, $2b
	bit #$04.b                                                  ; $eb81 : $89, $04
	beq br_13_eb93                                                  ; $eb83 : $f0, $0e

	lda #$04.b                                                  ; $eb85 : $a9, $04
	sta $03                                                  ; $eb87 : $85, $03
	lda #$14.b                                                  ; $eb89 : $a9, $14
	sta $39                                                  ; $eb8b : $85, $39
	lda #$07.b                                                  ; $eb8d : $a9, $07
	jsr Func_4_b967.l                                                  ; $eb8f : $22, $67, $b9, $04

br_13_eb93:
	rts                                                  ; $eb93 : $60


	lda $39                                                  ; $eb94 : $a5, $39
	beq br_13_eb9b                                                  ; $eb96 : $f0, $03

	dec $39                                                  ; $eb98 : $c6, $39
	rts                                                  ; $eb9a : $60


br_13_eb9b:
	lda #$02.b                                                  ; $eb9b : $a9, $02
	jsr Func_4_b967.l                                                  ; $eb9d : $22, $67, $b9, $04
	lda #$06.b                                                  ; $eba1 : $a9, $06
	sta $03                                                  ; $eba3 : $85, $03
	rts                                                  ; $eba5 : $60


	lda $0f                                                  ; $eba6 : $a5, $0f
	bpl br_13_ebb2                                                  ; $eba8 : $10, $08

	lda #$08.b                                                  ; $ebaa : $a9, $08
	sta $03                                                  ; $ebac : $85, $03
	lda #$02.b                                                  ; $ebae : $a9, $02
	sta $39                                                  ; $ebb0 : $85, $39

br_13_ebb2:
	rts                                                  ; $ebb2 : $60


	dec $39                                                  ; $ebb3 : $c6, $39
	bne br_13_ebeb                                                  ; $ebb5 : $d0, $34

	lda #$02.b                                                  ; $ebb7 : $a9, $02
	sta $39                                                  ; $ebb9 : $85, $39
	lda $27                                                  ; $ebbb : $a5, $27
	and #$7f.b                                                  ; $ebbd : $29, $7f
	cmp #$20.b                                                  ; $ebbf : $c9, $20
	beq br_13_ebcf                                                  ; $ebc1 : $f0, $0c

	ina                                                  ; $ebc3 : $1a
	ora #$80.b                                                  ; $ebc4 : $09, $80
	sta $27                                                  ; $ebc6 : $85, $27
	lda #$15.b                                                  ; $ebc8 : $a9, $15
	jsr $01802b.l                                                  ; $ebca : $22, $2b, $80, $01
	rts                                                  ; $ebce : $60


br_13_ebcf:
	lda #$02.b                                                  ; $ebcf : $a9, $02
	sta $01                                                  ; $ebd1 : $85, $01
	sta $02                                                  ; $ebd3 : $85, $02
	stz $03                                                  ; $ebd5 : $64, $03
	lda #$1e.b                                                  ; $ebd7 : $a9, $1e
	sta $39                                                  ; $ebd9 : $85, $39
	jsr $04d1ef.l                                                  ; $ebdb : $22, $ef, $d1, $04
	lda $001f39.l                                                  ; $ebdf : $af, $39, $1f, $00
	beq br_13_ebeb                                                  ; $ebe3 : $f0, $06

	lda #$1a.b                                                  ; $ebe5 : $a9, $1a
	jsr Func_0_84bc.l                                                  ; $ebe7 : $22, $bc, $84, $00

br_13_ebeb:
	rts                                                  ; $ebeb : $60


Jump_13_ebec:
	jsr $04d8d5.l                                                  ; $ebec : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $ebf0 : $22, $64, $df, $02
	ldx $02                                                  ; $ebf4 : $a6, $02
	jsr ($ec8e.w, X)                                                  ; $ebf6 : $fc, $8e, $ec
	jsr Func_4_cb74.l                                                  ; $ebf9 : $22, $74, $cb, $04
	bmi br_13_ec4c                                                  ; $ebfd : $30, $4d

	bvs br_13_ec14                                                  ; $ebff : $70, $13

	bne br_13_ec23                                                  ; $ec01 : $d0, $20

	lda $27                                                  ; $ec03 : $a5, $27
	beq br_13_ec4c                                                  ; $ec05 : $f0, $45

	lda $09da.w                                                  ; $ec07 : $ad, $da, $09
	cmp #$74.b                                                  ; $ec0a : $c9, $74
	beq br_13_ec64                                                  ; $ec0c : $f0, $56

	jsr Func_4_cb31.l                                                  ; $ec0e : $22, $31, $cb, $04
	bra br_13_ec64                                                  ; $ec12 : $80, $50

br_13_ec14:
	jsr Call_13_ec7f.w                                                  ; $ec14 : $20, $7f, $ec
	bcc br_13_ec64                                                  ; $ec17 : $90, $4b

	dec $27                                                  ; $ec19 : $c6, $27
	beq br_13_ec4c                                                  ; $ec1b : $f0, $2f

	dec $27                                                  ; $ec1d : $c6, $27
	beq br_13_ec4c                                                  ; $ec1f : $f0, $2b

	bra br_13_ec28                                                  ; $ec21 : $80, $05

br_13_ec23:
	jsr Call_13_ec7f.w                                                  ; $ec23 : $20, $7f, $ec
	bcc br_13_ec38                                                  ; $ec26 : $90, $10

br_13_ec28:
	lda #$3c.b                                                  ; $ec28 : $a9, $3c
	sta $39                                                  ; $ec2a : $85, $39
	lda #$0a.b                                                  ; $ec2c : $a9, $0a
	sta $02                                                  ; $ec2e : $85, $02
	stz $03                                                  ; $ec30 : $64, $03
	lda #$10.b                                                  ; $ec32 : $a9, $10
	jsr Func_4_b967.l                                                  ; $ec34 : $22, $67, $b9, $04

br_13_ec38:
	lda #$21.b                                                  ; $ec38 : $a9, $21
	jsr Func_1_8000.l                                                  ; $ec3a : $22, $00, $80, $01
	lda #$3c.b                                                  ; $ec3e : $a9, $3c
	sta $37                                                  ; $ec40 : $85, $37
	lda #$01.b                                                  ; $ec42 : $a9, $01
	sta $28                                                  ; $ec44 : $85, $28
	lda #$0e.b                                                  ; $ec46 : $a9, $0e
	trb $11                                                  ; $ec48 : $14, $11
	bra br_13_ec64                                                  ; $ec4a : $80, $18

Jump_13_ec4c:
br_13_ec4c:
	lda #$04.b                                                  ; $ec4c : $a9, $04
	sta $01                                                  ; $ec4e : $85, $01
	stz $02                                                  ; $ec50 : $64, $02
	stz $03                                                  ; $ec52 : $64, $03
	stz $3a                                                  ; $ec54 : $64, $3a
	lda $11                                                  ; $ec56 : $a5, $11
	and #$40.b                                                  ; $ec58 : $29, $40
	ora $38                                                  ; $ec5a : $05, $38
	sta $11                                                  ; $ec5c : $85, $11
	lda #$10.b                                                  ; $ec5e : $a9, $10
	jsr Func_4_b967.l                                                  ; $ec60 : $22, $67, $b9, $04

br_13_ec64:
	lda $01                                                  ; $ec64 : $a5, $01
	sta $1f54.w                                                  ; $ec66 : $8d, $54, $1f
	lda $02                                                  ; $ec69 : $a5, $02
	sta $1f55.w                                                  ; $ec6b : $8d, $55, $1f
	lda $03                                                  ; $ec6e : $a5, $03
	sta $1f56.w                                                  ; $ec70 : $8d, $56, $1f
	jsr Func_2_d636.l                                                  ; $ec73 : $22, $36, $d6, $02
	jsr Func_4_b94a.l                                                  ; $ec77 : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $ec7b : $5c, $a2, $bc, $04


Call_13_ec7f:
	lda $1f2f.w                                                  ; $ec7f : $ad, $2f, $1f
	cmp #$0e.b                                                  ; $ec82 : $c9, $0e
	beq br_13_ec8c                                                  ; $ec84 : $f0, $06

	cmp #$17.b                                                  ; $ec86 : $c9, $17
	beq br_13_ec8c                                                  ; $ec88 : $f0, $02

	clc                                                  ; $ec8a : $18
	rts                                                  ; $ec8b : $60


br_13_ec8c:
	sec                                                  ; $ec8c : $38
	rts                                                  ; $ec8d : $60


	txs                                                  ; $ec8e : $9a
	cpx $ecd0.w                                                  ; $ec8f : $ec, $d0, $ec
	.db $90, $ed                                                  ; $ec92 : $90, $ed

	cmp [$ed]                                                  ; $ec94 : $c7, $ed
	lda $f056ee.l, X                                                  ; $ec96 : $bf, $ee, $56, $f0
	ldx $03                                                  ; $ec9a : $a6, $03
	jmp ($ec9f.w, X)                                                  ; $ec9c : $7c, $9f, $ec


	lda $ec, S                                                  ; $ec9f : $a3, $ec
	ldy $a9ec.w                                                  ; $eca1 : $ac, $ec, $a9
	bit $3985.w, X                                                  ; $eca4 : $3c, $85, $39
	lda #$02.b                                                  ; $eca7 : $a9, $02
	sta $03                                                  ; $eca9 : $85, $03
	rts                                                  ; $ecab : $60


	dec $39                                                  ; $ecac : $c6, $39
	bpl br_13_ecca                                                  ; $ecae : $10, $1a

	lda $09da.w                                                  ; $ecb0 : $ad, $da, $09
	cmp #$74.b                                                  ; $ecb3 : $c9, $74
	bne br_13_ecbc                                                  ; $ecb5 : $d0, $05

	stz $02                                                  ; $ecb7 : $64, $02
	stz $03                                                  ; $ecb9 : $64, $03
	rts                                                  ; $ecbb : $60


br_13_ecbc:
	stz $03                                                  ; $ecbc : $64, $03
	stz $3c                                                  ; $ecbe : $64, $3c
	lda $27                                                  ; $ecc0 : $a5, $27
	cmp #$10.b                                                  ; $ecc2 : $c9, $10
	bpl br_13_eccb                                                  ; $ecc4 : $10, $05

	lda #$08.b                                                  ; $ecc6 : $a9, $08
	sta $02                                                  ; $ecc8 : $85, $02

br_13_ecca:
	rts                                                  ; $ecca : $60


br_13_eccb:
	lda #$02.b                                                  ; $eccb : $a9, $02
	sta $02                                                  ; $eccd : $85, $02
	rts                                                  ; $eccf : $60


	ldx $03                                                  ; $ecd0 : $a6, $03
	jmp ($ecd5.w, X)                                                  ; $ecd2 : $7c, $d5, $ec


	cmp $0eec.w, X                                                  ; $ecd5 : $dd, $ec, $0e
	sbc $ed21.w                                                  ; $ecd8 : $ed, $21, $ed
	adc ($ed), Y                                                  ; $ecdb : $71, $ed
	jsr $02e13f.l                                                  ; $ecdd : $22, $3f, $e1, $02
	rep #ACCU_8                                                  ; $ece1 : $c2, $20
	lda #$0600.w                                                  ; $ece3 : $a9, $00, $06
	sta $1c                                                  ; $ece6 : $85, $1c
	lda #$0200.w                                                  ; $ece8 : $a9, $00, $02
	sta $1a                                                  ; $eceb : $85, $1a
	sep #ACCU_8                                                  ; $eced : $e2, $20
	lda $11                                                  ; $ecef : $a5, $11
	bit #$40.b                                                  ; $ecf1 : $89, $40
	bne br_13_ecf9                                                  ; $ecf3 : $d0, $04

	lda #$fe.b                                                  ; $ecf5 : $a9, $fe
	sta $1b                                                  ; $ecf7 : $85, $1b

br_13_ecf9:
	lda #$40.b                                                  ; $ecf9 : $a9, $40
	sta $1e                                                  ; $ecfb : $85, $1e
	lda #$02.b                                                  ; $ecfd : $a9, $02
	sta $03                                                  ; $ecff : $85, $03
	sta $3d                                                  ; $ed01 : $85, $3d
	lda #$02.b                                                  ; $ed03 : $a9, $02
	sta $3a                                                  ; $ed05 : $85, $3a
	lda #$04.b                                                  ; $ed07 : $a9, $04
	jsr Func_4_b967.l                                                  ; $ed09 : $22, $67, $b9, $04
	rts                                                  ; $ed0d : $60


	lda $0f                                                  ; $ed0e : $a5, $0f
	bpl br_13_ed20                                                  ; $ed10 : $10, $0e

	jsr $02d6f8.l                                                  ; $ed12 : $22, $f8, $d6, $02
	lda #$04.b                                                  ; $ed16 : $a9, $04
	sta $03                                                  ; $ed18 : $85, $03
	lda #$04.b                                                  ; $ed1a : $a9, $04
	jsr Func_4_b967.l                                                  ; $ed1c : $22, $67, $b9, $04

br_13_ed20:
	rts                                                  ; $ed20 : $60


	lda #$01.b                                                  ; $ed21 : $a9, $01
	sta $2f                                                  ; $ed23 : $85, $2f
	lda $3d                                                  ; $ed25 : $a5, $3d
	bne br_13_ed35                                                  ; $ed27 : $d0, $0c

	lda $1d                                                  ; $ed29 : $a5, $1d
	bpl br_13_ed35                                                  ; $ed2b : $10, $08

	inc $3d                                                  ; $ed2d : $e6, $3d
	lda #$05.b                                                  ; $ed2f : $a9, $05
	jsr Func_4_b967.l                                                  ; $ed31 : $22, $67, $b9, $04

br_13_ed35:
	jsr $02d6f8.l                                                  ; $ed35 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $ed39 : $22, $f7, $c0, $04
	lda $2b                                                  ; $ed3d : $a5, $2b
	bit #$07.b                                                  ; $ed3f : $89, $07
	beq br_13_ed4b                                                  ; $ed41 : $f0, $08

	bit #$04.b                                                  ; $ed43 : $89, $04
	bne br_13_ed4c                                                  ; $ed45 : $d0, $05

	stz $1a                                                  ; $ed47 : $64, $1a
	stz $1b                                                  ; $ed49 : $64, $1b

br_13_ed4b:
	rts                                                  ; $ed4b : $60


br_13_ed4c:
	jsr Call_13_f0d3.w                                                  ; $ed4c : $20, $d3, $f0
	dec $3a                                                  ; $ed4f : $c6, $3a
	beq br_13_ed64                                                  ; $ed51 : $f0, $11

	lda #$03.b                                                  ; $ed53 : $a9, $03
	sta $1d                                                  ; $ed55 : $85, $1d
	stz $1c                                                  ; $ed57 : $64, $1c
	lda #$04.b                                                  ; $ed59 : $a9, $04
	sta $03                                                  ; $ed5b : $85, $03
	lda #$06.b                                                  ; $ed5d : $a9, $06
	jsr Func_4_b967.l                                                  ; $ed5f : $22, $67, $b9, $04
	rts                                                  ; $ed63 : $60


br_13_ed64:
	lda #$06.b                                                  ; $ed64 : $a9, $06
	sta $03                                                  ; $ed66 : $85, $03
	stz $2f                                                  ; $ed68 : $64, $2f
	lda #$07.b                                                  ; $ed6a : $a9, $07
	jsr Func_4_b967.l                                                  ; $ed6c : $22, $67, $b9, $04
	rts                                                  ; $ed70 : $60


	lda $0f                                                  ; $ed71 : $a5, $0f
	bpl br_13_ed8f                                                  ; $ed73 : $10, $1a

	stz $03                                                  ; $ed75 : $64, $03
	jsr $02e13f.l                                                  ; $ed77 : $22, $3f, $e1, $02
	lda #$00.b                                                  ; $ed7b : $a9, $00
	jsr Func_4_b967.l                                                  ; $ed7d : $22, $67, $b9, $04
	jsr Func_4_be35.l                                                  ; $ed81 : $22, $35, $be, $04
	and #$01.b                                                  ; $ed85 : $29, $01
	clc                                                  ; $ed87 : $18
	adc #$02.b                                                  ; $ed88 : $69, $02
	asl                                                  ; $ed8a : $0a
	sta $02                                                  ; $ed8b : $85, $02
	stz $03                                                  ; $ed8d : $64, $03

br_13_ed8f:
	rts                                                  ; $ed8f : $60


	ldx $03                                                  ; $ed90 : $a6, $03
	jmp ($ed95.w, X)                                                  ; $ed92 : $7c, $95, $ed


	txy                                                  ; $ed95 : $9b
	sbc $edaa.w                                                  ; $ed96 : $ed, $aa, $ed
	clv                                                  ; $ed99 : $b8
	sbc $3ca9.w                                                  ; $ed9a : $ed, $a9, $3c
	sta $39                                                  ; $ed9d : $85, $39
	lda #$02.b                                                  ; $ed9f : $a9, $02
	sta $03                                                  ; $eda1 : $85, $03
	lda #$08.b                                                  ; $eda3 : $a9, $08
	jsr Func_4_b967.l                                                  ; $eda5 : $22, $67, $b9, $04
	rts                                                  ; $eda9 : $60


	lda $0f                                                  ; $edaa : $a5, $0f
	bit #$40.b                                                  ; $edac : $89, $40
	beq br_13_edb7                                                  ; $edae : $f0, $07

	jsr Call_13_f170.w                                                  ; $edb0 : $20, $70, $f1
	lda #$04.b                                                  ; $edb3 : $a9, $04
	sta $03                                                  ; $edb5 : $85, $03

br_13_edb7:
	rts                                                  ; $edb7 : $60


	lda $0f                                                  ; $edb8 : $a5, $0f
	bpl br_13_edc6                                                  ; $edba : $10, $0a

	stz $03                                                  ; $edbc : $64, $03
	stz $02                                                  ; $edbe : $64, $02
	lda #$00.b                                                  ; $edc0 : $a9, $00
	jsr Func_4_b967.l                                                  ; $edc2 : $22, $67, $b9, $04

br_13_edc6:
	rts                                                  ; $edc6 : $60


	ldx $03                                                  ; $edc7 : $a6, $03
	jmp ($edcc.w, X)                                                  ; $edc9 : $7c, $cc, $ed


	phx                                                  ; $edcc : $da
	sbc $ee04.w                                                  ; $edcd : $ed, $04, $ee
	rol                                                  ; $edd0 : $2a
	inc $ee3b.w                                                  ; $edd1 : $ee, $3b, $ee
	adc ($ee, X)                                                  ; $edd4 : $61, $ee
	adc ($ee)                                                  ; $edd6 : $72, $ee
	.db $b0, $ee                                                  ; $edd8 : $b0, $ee

	jsr $02e13f.l                                                  ; $edda : $22, $3f, $e1, $02
	lda $11                                                  ; $edde : $a5, $11
	bit #$40.b                                                  ; $ede0 : $89, $40
	beq br_13_edea                                                  ; $ede2 : $f0, $06

	lda $05                                                  ; $ede4 : $a5, $05
	bpl br_13_edee                                                  ; $ede6 : $10, $06

	bra br_13_edfd                                                  ; $ede8 : $80, $13

br_13_edea:
	lda $05                                                  ; $edea : $a5, $05
	bpl br_13_edfd                                                  ; $edec : $10, $0f

br_13_edee:
	lda #$02.b                                                  ; $edee : $a9, $02
	sta $03                                                  ; $edf0 : $85, $03
	stz $3d                                                  ; $edf2 : $64, $3d
	stz $3c                                                  ; $edf4 : $64, $3c
	lda #$09.b                                                  ; $edf6 : $a9, $09
	jsr Func_4_b967.l                                                  ; $edf8 : $22, $67, $b9, $04
	rts                                                  ; $edfc : $60


br_13_edfd:
	lda #$02.b                                                  ; $edfd : $a9, $02
	sta $02                                                  ; $edff : $85, $02
	stz $03                                                  ; $ee01 : $64, $03
	rts                                                  ; $ee03 : $60


	lda $3d                                                  ; $ee04 : $a5, $3d
	bne br_13_ee19                                                  ; $ee06 : $d0, $11

	lda $0f                                                  ; $ee08 : $a5, $0f
	bit #$40.b                                                  ; $ee0a : $89, $40
	beq br_13_ee29                                                  ; $ee0c : $f0, $1b

	lda #$3c.b                                                  ; $ee0e : $a9, $3c
	jsr Func_1_8000.l                                                  ; $ee10 : $22, $00, $80, $01
	inc $3d                                                  ; $ee14 : $e6, $3d
	jsr Call_13_f181.w                                                  ; $ee16 : $20, $81, $f1

br_13_ee19:
	lda $0f                                                  ; $ee19 : $a5, $0f
	bpl br_13_ee29                                                  ; $ee1b : $10, $0c

	lda #$04.b                                                  ; $ee1d : $a9, $04
	sta $03                                                  ; $ee1f : $85, $03
	stz $3d                                                  ; $ee21 : $64, $3d
	lda #$00.b                                                  ; $ee23 : $a9, $00
	jsr Func_4_b967.l                                                  ; $ee25 : $22, $67, $b9, $04

br_13_ee29:
	rts                                                  ; $ee29 : $60


	lda $3c                                                  ; $ee2a : $a5, $3c
	and #$01.b                                                  ; $ee2c : $29, $01
	beq br_13_ee3a                                                  ; $ee2e : $f0, $0a

	lda #$06.b                                                  ; $ee30 : $a9, $06
	sta $03                                                  ; $ee32 : $85, $03
	lda #$08.b                                                  ; $ee34 : $a9, $08
	jsr Func_4_b967.l                                                  ; $ee36 : $22, $67, $b9, $04

br_13_ee3a:
	rts                                                  ; $ee3a : $60


	lda $3d                                                  ; $ee3b : $a5, $3d
	bne br_13_ee50                                                  ; $ee3d : $d0, $11

	lda $0f                                                  ; $ee3f : $a5, $0f
	bit #$40.b                                                  ; $ee41 : $89, $40
	beq br_13_ee60                                                  ; $ee43 : $f0, $1b

	lda #$3d.b                                                  ; $ee45 : $a9, $3d
	jsr Func_1_8000.l                                                  ; $ee47 : $22, $00, $80, $01
	inc $3d                                                  ; $ee4b : $e6, $3d
	jsr Call_13_f1a0.w                                                  ; $ee4d : $20, $a0, $f1

br_13_ee50:
	lda $0f                                                  ; $ee50 : $a5, $0f
	bpl br_13_ee60                                                  ; $ee52 : $10, $0c

	lda #$08.b                                                  ; $ee54 : $a9, $08
	sta $03                                                  ; $ee56 : $85, $03
	stz $3d                                                  ; $ee58 : $64, $3d
	lda #$00.b                                                  ; $ee5a : $a9, $00
	jsr Func_4_b967.l                                                  ; $ee5c : $22, $67, $b9, $04

br_13_ee60:
	rts                                                  ; $ee60 : $60


	lda $3c                                                  ; $ee61 : $a5, $3c
	bit #$02.b                                                  ; $ee63 : $89, $02
	beq br_13_ee71                                                  ; $ee65 : $f0, $0a

	lda #$0a.b                                                  ; $ee67 : $a9, $0a
	sta $03                                                  ; $ee69 : $85, $03
	lda #$0a.b                                                  ; $ee6b : $a9, $0a
	jsr Func_4_b967.l                                                  ; $ee6d : $22, $67, $b9, $04

br_13_ee71:
	rts                                                  ; $ee71 : $60


	lda $3c                                                  ; $ee72 : $a5, $3c
	bit #$04.b                                                  ; $ee74 : $89, $04
	beq br_13_ee8c                                                  ; $ee76 : $f0, $14

	lda #$0c.b                                                  ; $ee78 : $a9, $0c
	sta $03                                                  ; $ee7a : $85, $03

br_13_ee7c:
	lda #$3e.b                                                  ; $ee7c : $a9, $3e
	jsr Func_1_8000.l                                                  ; $ee7e : $22, $00, $80, $01
	jsr Call_13_f151.w                                                  ; $ee82 : $20, $51, $f1
	lda #$0c.b                                                  ; $ee85 : $a9, $0c
	jsr Func_4_b967.l                                                  ; $ee87 : $22, $67, $b9, $04
	rts                                                  ; $ee8b : $60


br_13_ee8c:
	lda $0a03.w                                                  ; $ee8c : $ad, $03, $0a
	bit #$03.b                                                  ; $ee8f : $89, $03
	bne br_13_eeaf                                                  ; $ee91 : $d0, $1c

	lda $11                                                  ; $ee93 : $a5, $11
	bit #$40.b                                                  ; $ee95 : $89, $40
	beq br_13_eea5                                                  ; $ee97 : $f0, $0c

	lda wPlayerEntity.x.w                                                  ; $ee99 : $ad, $dd, $09
	cmp $05                                                  ; $ee9c : $c5, $05
	bcc br_13_eeaf                                                  ; $ee9e : $90, $0f

	dec wPlayerEntity.x.w                                                  ; $eea0 : $ce, $dd, $09
	bra br_13_eeaf                                                  ; $eea3 : $80, $0a

br_13_eea5:
	lda wPlayerEntity.x.w                                                  ; $eea5 : $ad, $dd, $09
	cmp $05                                                  ; $eea8 : $c5, $05
	bcs br_13_eeaf                                                  ; $eeaa : $b0, $03

	inc wPlayerEntity.x.w                                                  ; $eeac : $ee, $dd, $09

br_13_eeaf:
	rts                                                  ; $eeaf : $60


	lda $0f                                                  ; $eeb0 : $a5, $0f
	bpl br_13_eebe                                                  ; $eeb2 : $10, $0a

	stz $02                                                  ; $eeb4 : $64, $02
	stz $03                                                  ; $eeb6 : $64, $03
	lda #$00.b                                                  ; $eeb8 : $a9, $00
	jsr Func_4_b967.l                                                  ; $eeba : $22, $67, $b9, $04

br_13_eebe:
	rts                                                  ; $eebe : $60


	ldx $03                                                  ; $eebf : $a6, $03
	jmp ($eec4.w, X)                                                  ; $eec1 : $7c, $c4, $ee


	dec $ee, X                                                  ; $eec4 : $d6, $ee
	.db $10, $ef                                                  ; $eec6 : $10, $ef

	and ($ef, X)                                                  ; $eec8 : $21, $ef
	phy                                                  ; $eeca : $5a
	sbc $94ef76.l                                                  ; $eecb : $ef, $76, $ef, $94
	sbc $01efd0.l                                                  ; $eecf : $ef, $d0, $ef, $01
	.db $f0, $27                                                  ; $eed3 : $f0, $27

	beq br_13_ee7c                                                  ; $eed5 : $f0, $a5

	ora $30                                                  ; $eed7 : $05, $30
	asl $a9                                                  ; $eed9 : $06, $a9
	rti                                                  ; $eedb : $40


	tsb $11                                                  ; $eedc : $04, $11
	bra br_13_eee4                                                  ; $eede : $80, $04

	lda #$40.b                                                  ; $eee0 : $a9, $40
	trb $11                                                  ; $eee2 : $14, $11

br_13_eee4:
	rep #ACCU_8|F_CARRY                                                  ; $eee4 : $c2, $21
	lda wNewStageScrollX.w                                                  ; $eee6 : $ad, $5d, $1e
	adc #$0080.w                                                  ; $eee9 : $69, $80, $00
	sec                                                  ; $eeec : $38
	sbc $05                                                  ; $eeed : $e5, $05
	sta $0000.w                                                  ; $eeef : $8d, $00, $00
	asl                                                  ; $eef2 : $0a
	asl                                                  ; $eef3 : $0a
	clc                                                  ; $eef4 : $18
	adc $0000.w                                                  ; $eef5 : $6d, $00, $00
	sta $1a                                                  ; $eef8 : $85, $1a
	lda #$0700.w                                                  ; $eefa : $a9, $00, $07
	sta $1c                                                  ; $eefd : $85, $1c
	sep #ACCU_8                                                  ; $eeff : $e2, $20
	lda #$40.b                                                  ; $ef01 : $a9, $40
	sta $1e                                                  ; $ef03 : $85, $1e
	lda #$02.b                                                  ; $ef05 : $a9, $02
	sta $03                                                  ; $ef07 : $85, $03
	lda #$03.b                                                  ; $ef09 : $a9, $03
	jsr Func_4_b967.l                                                  ; $ef0b : $22, $67, $b9, $04
	rts                                                  ; $ef0f : $60


	lda $0f                                                  ; $ef10 : $a5, $0f
	bmi br_13_ef15                                                  ; $ef12 : $30, $01

	rts                                                  ; $ef14 : $60


br_13_ef15:
	stz $3d                                                  ; $ef15 : $64, $3d
	lda #$04.b                                                  ; $ef17 : $a9, $04
	sta $03                                                  ; $ef19 : $85, $03
	lda #$04.b                                                  ; $ef1b : $a9, $04
	jsr Func_4_b967.l                                                  ; $ef1d : $22, $67, $b9, $04
	lda #$01.b                                                  ; $ef21 : $a9, $01
	sta $2f                                                  ; $ef23 : $85, $2f
	lda $3d                                                  ; $ef25 : $a5, $3d
	bne br_13_ef35                                                  ; $ef27 : $d0, $0c

	lda $1d                                                  ; $ef29 : $a5, $1d
	bpl br_13_ef35                                                  ; $ef2b : $10, $08

	inc $3d                                                  ; $ef2d : $e6, $3d
	lda #$05.b                                                  ; $ef2f : $a9, $05
	jsr Func_4_b967.l                                                  ; $ef31 : $22, $67, $b9, $04

br_13_ef35:
	jsr $02d6f8.l                                                  ; $ef35 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $ef39 : $22, $f7, $c0, $04
	lda $2b                                                  ; $ef3d : $a5, $2b
	bit #$04.b                                                  ; $ef3f : $89, $04
	beq br_13_ef59                                                  ; $ef41 : $f0, $16

	lda #$0a.b                                                  ; $ef43 : $a9, $0a
	ldx #$a001.w                                                  ; $ef45 : $a2, $01, $a0
	ora ($22, X)                                                  ; $ef48 : $01, $22
	ldx #$04d5.w                                                  ; $ef4a : $a2, $d5, $04
	lda #$06.b                                                  ; $ef4d : $a9, $06
	sta $03                                                  ; $ef4f : $85, $03
	stz $3d                                                  ; $ef51 : $64, $3d
	lda #$07.b                                                  ; $ef53 : $a9, $07
	jsr Func_4_b967.l                                                  ; $ef55 : $22, $67, $b9, $04

br_13_ef59:
	rts                                                  ; $ef59 : $60


	lda $0f                                                  ; $ef5a : $a5, $0f
	bpl br_13_ef75                                                  ; $ef5c : $10, $17

	lda #$08.b                                                  ; $ef5e : $a9, $08
	sta $03                                                  ; $ef60 : $85, $03
	jsr Call_13_f1f9.w                                                  ; $ef62 : $20, $f9, $f1
	lda #$14.b                                                  ; $ef65 : $a9, $14
	sta $39                                                  ; $ef67 : $85, $39
	lda #$74.b                                                  ; $ef69 : $a9, $74
	jsr $01802b.l                                                  ; $ef6b : $22, $2b, $80, $01
	lda #$0c.b                                                  ; $ef6f : $a9, $0c
	jsr Func_4_b967.l                                                  ; $ef71 : $22, $67, $b9, $04

br_13_ef75:
	rts                                                  ; $ef75 : $60


	dec $39                                                  ; $ef76 : $c6, $39
	bne br_13_ef93                                                  ; $ef78 : $d0, $19

	lda #$70.b                                                  ; $ef7a : $a9, $70
	jsr $01802b.l                                                  ; $ef7c : $22, $2b, $80, $01
	lda #$0a.b                                                  ; $ef80 : $a9, $0a
	sta $03                                                  ; $ef82 : $85, $03
	lda #$0d.b                                                  ; $ef84 : $a9, $0d
	sta $28                                                  ; $ef86 : $85, $28
	sta $1f57.w                                                  ; $ef88 : $8d, $57, $1f
	stz $3d                                                  ; $ef8b : $64, $3d
	lda #$0e.b                                                  ; $ef8d : $a9, $0e
	jsr Func_4_b967.l                                                  ; $ef8f : $22, $67, $b9, $04

br_13_ef93:
	rts                                                  ; $ef93 : $60


	jsr Call_13_f0fe.w                                                  ; $ef94 : $20, $fe, $f0
	lda $3d                                                  ; $ef97 : $a5, $3d
	bne br_13_efa9                                                  ; $ef99 : $d0, $0e

	lda $0f                                                  ; $ef9b : $a5, $0f
	bpl br_13_efa8                                                  ; $ef9d : $10, $09

	lda #$14.b                                                  ; $ef9f : $a9, $14
	sta $39                                                  ; $efa1 : $85, $39
	inc $3d                                                  ; $efa3 : $e6, $3d
	jsr Call_13_f117.w                                                  ; $efa5 : $20, $17, $f1

br_13_efa8:
	rts                                                  ; $efa8 : $60


br_13_efa9:
	dec $39                                                  ; $efa9 : $c6, $39
	bne br_13_efa8                                                  ; $efab : $d0, $fb

	lda #$71.b                                                  ; $efad : $a9, $71
	jsr $01802b.l                                                  ; $efaf : $22, $2b, $80, $01
	lda #$0c.b                                                  ; $efb3 : $a9, $0c
	sta $03                                                  ; $efb5 : $85, $03
	lda #$08.b                                                  ; $efb7 : $a9, $08
	sta $3a                                                  ; $efb9 : $85, $3a
	lda #$28.b                                                  ; $efbb : $a9, $28
	sta $39                                                  ; $efbd : $85, $39
	lda #$28.b                                                  ; $efbf : $a9, $28
	ldx #$a003.w                                                  ; $efc1 : $a2, $03, $a0
	ora ($22, X)                                                  ; $efc4 : $01, $22
	ldx #$04d5.w                                                  ; $efc6 : $a2, $d5, $04
	lda #$0f.b                                                  ; $efc9 : $a9, $0f
	jsr Func_4_b967.l                                                  ; $efcb : $22, $67, $b9, $04
	rts                                                  ; $efcf : $60


	jsr Call_13_f0fe.w                                                  ; $efd0 : $20, $fe, $f0
	lda $39                                                  ; $efd3 : $a5, $39
	bne br_13_eff0                                                  ; $efd5 : $d0, $19

	lda #$48.b                                                  ; $efd7 : $a9, $48
	jsr $01802b.l                                                  ; $efd9 : $22, $2b, $80, $01
	lda #$28.b                                                  ; $efdd : $a9, $28
	sta $39                                                  ; $efdf : $85, $39
	dec $3a                                                  ; $efe1 : $c6, $3a
	beq br_13_effc                                                  ; $efe3 : $f0, $17

	lda #$28.b                                                  ; $efe5 : $a9, $28
	ldx #$a003.w                                                  ; $efe7 : $a2, $03, $a0
	ora ($22, X)                                                  ; $efea : $01, $22
	ldx #$04d5.w                                                  ; $efec : $a2, $d5, $04
	rts                                                  ; $efef : $60


br_13_eff0:
	dec $39                                                  ; $eff0 : $c6, $39
	lda $39                                                  ; $eff2 : $a5, $39
	and #$0f.b                                                  ; $eff4 : $29, $0f
	bne br_13_effb                                                  ; $eff6 : $d0, $03

	jsr Call_13_f13f.w                                                  ; $eff8 : $20, $3f, $f1

br_13_effb:
	rts                                                  ; $effb : $60


br_13_effc:
	lda #$0e.b                                                  ; $effc : $a9, $0e
	sta $03                                                  ; $effe : $85, $03
	rts                                                  ; $f000 : $60


	jsr Call_13_f0fe.w                                                  ; $f001 : $20, $fe, $f0
	jsr $02e13f.l                                                  ; $f004 : $22, $3f, $e1, $02
	lda $11                                                  ; $f008 : $a5, $11
	bit #$40.b                                                  ; $f00a : $89, $40
	beq br_13_f012                                                  ; $f00c : $f0, $04

	lda #$03.b                                                  ; $f00e : $a9, $03
	bra br_13_f014                                                  ; $f010 : $80, $02

br_13_f012:
	lda #$fd.b                                                  ; $f012 : $a9, $fd

br_13_f014:
	sta $1b                                                  ; $f014 : $85, $1b
	stz $1a                                                  ; $f016 : $64, $1a
	lda #$10.b                                                  ; $f018 : $a9, $10
	sta $03                                                  ; $f01a : $85, $03
	lda #$06.b                                                  ; $f01c : $a9, $06
	sta $26                                                  ; $f01e : $85, $26
	lda #$11.b                                                  ; $f020 : $a9, $11
	jsr Func_4_b967.l                                                  ; $f022 : $22, $67, $b9, $04
	rts                                                  ; $f026 : $60


	jsr Call_13_f0fe.w                                                  ; $f027 : $20, $fe, $f0
	jsr AddEntityXSpeedOntoSubX.l                                                  ; $f02a : $22, $f3, $d7, $02
	jsr $04c0f7.l                                                  ; $f02e : $22, $f7, $c0, $04
	lda $2b                                                  ; $f032 : $a5, $2b
	bit #$03.b                                                  ; $f034 : $89, $03
	beq br_13_f055                                                  ; $f036 : $f0, $1d

	lda $11                                                  ; $f038 : $a5, $11
	and #$40.b                                                  ; $f03a : $29, $40
	ora $38                                                  ; $f03c : $05, $38
	sta $11                                                  ; $f03e : $85, $11
	lda #$02.b                                                  ; $f040 : $a9, $02
	sta $26                                                  ; $f042 : $85, $26
	lda #$16.b                                                  ; $f044 : $a9, $16
	sta $28                                                  ; $f046 : $85, $28
	sta $1f57.w                                                  ; $f048 : $8d, $57, $1f
	stz $02                                                  ; $f04b : $64, $02
	stz $03                                                  ; $f04d : $64, $03
	lda #$00.b                                                  ; $f04f : $a9, $00
	jsr Func_4_b967.l                                                  ; $f051 : $22, $67, $b9, $04

br_13_f055:
	rts                                                  ; $f055 : $60


	lda $03                                                  ; $f056 : $a5, $03
	bne br_13_f081                                                  ; $f058 : $d0, $27

	lda $28                                                  ; $f05a : $a5, $28
	cmp #$0d.b                                                  ; $f05c : $c9, $0d
	bne br_13_f068                                                  ; $f05e : $d0, $08

	lda $11                                                  ; $f060 : $a5, $11
	and #$40.b                                                  ; $f062 : $29, $40
	ora $38                                                  ; $f064 : $05, $38
	sta $11                                                  ; $f066 : $85, $11

br_13_f068:
	lda $2f                                                  ; $f068 : $a5, $2f
	beq br_13_f074                                                  ; $f06a : $f0, $08

	stz $1a                                                  ; $f06c : $64, $1a
	stz $1b                                                  ; $f06e : $64, $1b
	stz $1c                                                  ; $f070 : $64, $1c
	stz $1d                                                  ; $f072 : $64, $1d

br_13_f074:
	lda #$b4.b                                                  ; $f074 : $a9, $b4
	sta $37                                                  ; $f076 : $85, $37
	lda #$3c.b                                                  ; $f078 : $a9, $3c
	sta $39                                                  ; $f07a : $85, $39
	lda #$02.b                                                  ; $f07c : $a9, $02
	sta $03                                                  ; $f07e : $85, $03
	rts                                                  ; $f080 : $60


br_13_f081:
	lda $2f                                                  ; $f081 : $a5, $2f
	beq br_13_f08e                                                  ; $f083 : $f0, $09

	jsr $02d6f8.l                                                  ; $f085 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $f089 : $22, $f7, $c0, $04
	rts                                                  ; $f08d : $60


br_13_f08e:
	dec $39                                                  ; $f08e : $c6, $39
	bne br_13_f0a0                                                  ; $f090 : $d0, $0e

	lda #$3c.b                                                  ; $f092 : $a9, $3c
	sta $39                                                  ; $f094 : $85, $39
	stz $02                                                  ; $f096 : $64, $02
	stz $03                                                  ; $f098 : $64, $03
	lda #$00.b                                                  ; $f09a : $a9, $00
	jsr Func_4_b967.l                                                  ; $f09c : $22, $67, $b9, $04

br_13_f0a0:
	rts                                                  ; $f0a0 : $60


	ldx $3a                                                  ; $f0a1 : $a6, $3a
	jmp ($f0a6.w, X)                                                  ; $f0a3 : $7c, $a6, $f0


	ldy $b2f0.w                                                  ; $f0a6 : $ac, $f0, $b2
	.db $f0, $b6                                                  ; $f0a9 : $f0, $b6

	beq br_13_f111                                                  ; $f0ab : $f0, $64

	phd                                                  ; $f0ad : $0b
	jmp $02e0ba.l                                                  ; $f0ae : $5c, $ba, $e0, $02


	jmp $02e0e6.l                                                  ; $f0b2 : $5c, $e6, $e0, $02


Jump_13_f0b6:
	jsr $04d8cf.l                                                  ; $f0b6 : $22, $cf, $d8, $04
	beq br_13_f0c6                                                  ; $f0ba : $f0, $0a

	lda #$ff.b                                                  ; $f0bc : $a9, $ff
	sta $1fc0.w                                                  ; $f0be : $8d, $c0, $1f
	inc $1f36.w                                                  ; $f0c1 : $ee, $36, $1f
	bra br_13_f0cf                                                  ; $f0c4 : $80, $09

br_13_f0c6:
	jsr $04d8e1.l                                                  ; $f0c6 : $22, $e1, $d8, $04
	lda #$10.b                                                  ; $f0ca : $a9, $10
	tsb $1fda.w                                                  ; $f0cc : $0c, $da, $1f

br_13_f0cf:
	jmp todo_DisablesEntity_d928.l                                                  ; $f0cf : $5c, $28, $d9, $02


Call_13_f0d3:
	rep #ACCU_8                                                  ; $f0d3 : $c2, $20
	lda #$0018.w                                                  ; $f0d5 : $a9, $18, $00
	sta $0000.w                                                  ; $f0d8 : $8d, $00, $00
	sta $0002.w                                                  ; $f0db : $8d, $02, $00
	stz $0004.w                                                  ; $f0de : $9c, $04, $00
	lda #$00c0.w                                                  ; $f0e1 : $a9, $c0, $00
	sta $0006.w                                                  ; $f0e4 : $8d, $06, $00
	sep #ACCU_8                                                  ; $f0e7 : $e2, $20
	jsr $02df8a.l                                                  ; $f0e9 : $22, $8a, $df, $02
	lda $11                                                  ; $f0ed : $a5, $11
	eor #$40.b                                                  ; $f0ef : $49, $40
	sta $11                                                  ; $f0f1 : $85, $11
	jsr $02df8a.l                                                  ; $f0f3 : $22, $8a, $df, $02
	lda $11                                                  ; $f0f7 : $a5, $11
	eor #$40.b                                                  ; $f0f9 : $49, $40
	sta $11                                                  ; $f0fb : $85, $11
	rts                                                  ; $f0fd : $60


Call_13_f0fe:
	lda $09cc.w                                                  ; $f0fe : $ad, $cc, $09
	and #$02.b                                                  ; $f101 : $29, $02
	clc                                                  ; $f103 : $18
	adc #$04.b                                                  ; $f104 : $69, $04
	clc                                                  ; $f106 : $18
	adc #$29.b                                                  ; $f107 : $69, $29
	sta $0000.w                                                  ; $f109 : $8d, $00, $00
	lda $11                                                  ; $f10c : $a5, $11
	and #$40.b                                                  ; $f10e : $29, $40
	clc                                                  ; $f110 : $18

br_13_f111:
	adc $0000.w                                                  ; $f111 : $6d, $00, $00
	sta $11                                                  ; $f114 : $85, $11
	rts                                                  ; $f116 : $60


Call_13_f117:
	rep #IDX_8                                                  ; $f117 : $c2, $10
	jsr $02d8de.l                                                  ; $f119 : $22, $de, $d8, $02
	bne br_13_f17e                                                  ; $f11d : $d0, $5f

	jsr Call_13_f1bf.w                                                  ; $f11f : $20, $bf, $f1
	lda #$0a.b                                                  ; $f122 : $a9, $0a
	sta $000b.w, X                                                  ; $f124 : $9d, $0b, $00
	stz $003a.w, X                                                  ; $f127 : $9e, $3a, $00
	jsr $02d8de.l                                                  ; $f12a : $22, $de, $d8, $02
	bne br_13_f17e                                                  ; $f12e : $d0, $4e

	jsr Call_13_f1bf.w                                                  ; $f130 : $20, $bf, $f1
	lda #$0a.b                                                  ; $f133 : $a9, $0a
	sta $000b.w, X                                                  ; $f135 : $9d, $0b, $00
	lda #$01.b                                                  ; $f138 : $a9, $01
	sta $003a.w, X                                                  ; $f13a : $9d, $3a, $00
	bra br_13_f17e                                                  ; $f13d : $80, $3f

Call_13_f13f:
	rep #IDX_8                                                  ; $f13f : $c2, $10
	jsr $02d8de.l                                                  ; $f141 : $22, $de, $d8, $02
	bne br_13_f17e                                                  ; $f145 : $d0, $37

	jsr Call_13_f1bf.w                                                  ; $f147 : $20, $bf, $f1
	lda #$08.b                                                  ; $f14a : $a9, $08
	sta $000b.w, X                                                  ; $f14c : $9d, $0b, $00
	bra br_13_f17e                                                  ; $f14f : $80, $2d

Call_13_f151:
	rep #IDX_8                                                  ; $f151 : $c2, $10
	lda #$01.b                                                  ; $f153 : $a9, $01
	sta $39                                                  ; $f155 : $85, $39

br_13_f157:
	jsr $02d8de.l                                                  ; $f157 : $22, $de, $d8, $02
	bne br_13_f17e                                                  ; $f15b : $d0, $21

	jsr Call_13_f1bf.w                                                  ; $f15d : $20, $bf, $f1
	lda #$06.b                                                  ; $f160 : $a9, $06
	sta $000b.w, X                                                  ; $f162 : $9d, $0b, $00
	lda $39                                                  ; $f165 : $a5, $39
	sta $003a.w, X                                                  ; $f167 : $9d, $3a, $00
	dec $39                                                  ; $f16a : $c6, $39
	bpl br_13_f157                                                  ; $f16c : $10, $e9

	bra br_13_f17e                                                  ; $f16e : $80, $0e

Call_13_f170:
	rep #IDX_8                                                  ; $f170 : $c2, $10
	jsr $02d8de.l                                                  ; $f172 : $22, $de, $d8, $02
	bne br_13_f17e                                                  ; $f176 : $d0, $06

	jsr Call_13_f1bf.w                                                  ; $f178 : $20, $bf, $f1
	stz $000b.w, X                                                  ; $f17b : $9e, $0b, $00

br_13_f17e:
	sep #ACCU_8|IDX_8                                                  ; $f17e : $e2, $30
	rts                                                  ; $f180 : $60


Call_13_f181:
	rep #IDX_8                                                  ; $f181 : $c2, $10
	lda #$02.b                                                  ; $f183 : $a9, $02
	sta $39                                                  ; $f185 : $85, $39

br_13_f187:
	jsr $02d8de.l                                                  ; $f187 : $22, $de, $d8, $02
	bne br_13_f17e                                                  ; $f18b : $d0, $f1

	jsr Call_13_f1bf.w                                                  ; $f18d : $20, $bf, $f1
	lda #$02.b                                                  ; $f190 : $a9, $02
	sta $000b.w, X                                                  ; $f192 : $9d, $0b, $00
	lda $39                                                  ; $f195 : $a5, $39
	sta $003a.w, X                                                  ; $f197 : $9d, $3a, $00
	dec $39                                                  ; $f19a : $c6, $39
	bmi br_13_f17e                                                  ; $f19c : $30, $e0

	bra br_13_f187                                                  ; $f19e : $80, $e7

Call_13_f1a0:
	rep #IDX_8                                                  ; $f1a0 : $c2, $10
	lda #$02.b                                                  ; $f1a2 : $a9, $02
	sta $39                                                  ; $f1a4 : $85, $39

br_13_f1a6:
	jsr $02d8de.l                                                  ; $f1a6 : $22, $de, $d8, $02
	bne br_13_f17e                                                  ; $f1aa : $d0, $d2

	jsr Call_13_f1bf.w                                                  ; $f1ac : $20, $bf, $f1
	lda #$04.b                                                  ; $f1af : $a9, $04
	sta $000b.w, X                                                  ; $f1b1 : $9d, $0b, $00
	lda $39                                                  ; $f1b4 : $a5, $39
	sta $003a.w, X                                                  ; $f1b6 : $9d, $3a, $00
	dec $39                                                  ; $f1b9 : $c6, $39
	bmi br_13_f17e                                                  ; $f1bb : $30, $c1

	bra br_13_f1a6                                                  ; $f1bd : $80, $e7

Call_13_f1bf:
	rep #IDX_8                                                  ; $f1bf : $c2, $10
	inc $0000.w, X                                                  ; $f1c1 : $fe, $00, $00
	lda #$27.b                                                  ; $f1c4 : $a9, $27
	sta $000a.w, X                                                  ; $f1c6 : $9d, $0a, $00
	stz $0001.w, X                                                  ; $f1c9 : $9e, $01, $00
	lda #$16.b                                                  ; $f1cc : $a9, $16
	sta $0028.w, X                                                  ; $f1ce : $9d, $28, $00
	lda $18                                                  ; $f1d1 : $a5, $18
	sta $0018.w, X                                                  ; $f1d3 : $9d, $18, $00
	lda $16                                                  ; $f1d6 : $a5, $16
	ina                                                  ; $f1d8 : $1a
	sta $0016.w, X                                                  ; $f1d9 : $9d, $16, $00
	lda $11                                                  ; $f1dc : $a5, $11
	ora $38                                                  ; $f1de : $05, $38
	clc                                                  ; $f1e0 : $18
	adc #$02.b                                                  ; $f1e1 : $69, $02
	sta $0011.w, X                                                  ; $f1e3 : $9d, $11, $00
	rep #ACCU_8                                                  ; $f1e6 : $c2, $20
	lda $05                                                  ; $f1e8 : $a5, $05
	sta $0005.w, X                                                  ; $f1ea : $9d, $05, $00
	lda $08                                                  ; $f1ed : $a5, $08
	sta $0008.w, X                                                  ; $f1ef : $9d, $08, $00
	tdc                                                  ; $f1f2 : $7b
	sta $003e.w, X                                                  ; $f1f3 : $9d, $3e, $00
	sep #ACCU_8                                                  ; $f1f6 : $e2, $20
	rts                                                  ; $f1f8 : $60


Call_13_f1f9:
	rep #IDX_8                                                  ; $f1f9 : $c2, $10
	jsr $02d859.l                                                  ; $f1fb : $22, $59, $d8, $02
	bne br_13_f207                                                  ; $f1ff : $d0, $06

	jsr Call_13_f20a.w                                                  ; $f201 : $20, $0a, $f2
	stz $000b.w, X                                                  ; $f204 : $9e, $0b, $00

br_13_f207:
	sep #IDX_8                                                  ; $f207 : $e2, $10
	rts                                                  ; $f209 : $60


Call_13_f20a:
	rep #IDX_8                                                  ; $f20a : $c2, $10
	lda #$01.b                                                  ; $f20c : $a9, $01
	sta $0000.w, X                                                  ; $f20e : $9d, $00, $00
	lda #$0d.b                                                  ; $f211 : $a9, $0d
	sta $000a.w, X                                                  ; $f213 : $9d, $0a, $00
	lda $11                                                  ; $f216 : $a5, $11
	ora $38                                                  ; $f218 : $05, $38
	clc                                                  ; $f21a : $18
	adc #$02.b                                                  ; $f21b : $69, $02
	sta $0011.w, X                                                  ; $f21d : $9d, $11, $00
	lda $16                                                  ; $f220 : $a5, $16
	ina                                                  ; $f222 : $1a

br_13_f223:
	sta $0016.w, X                                                  ; $f223 : $9d, $16, $00
	rep #ACCU_8                                                  ; $f226 : $c2, $20
	lda $05                                                  ; $f228 : $a5, $05
	sta $0005.w, X                                                  ; $f22a : $9d, $05, $00
	lda $08                                                  ; $f22d : $a5, $08
	sta $0008.w, X                                                  ; $f22f : $9d, $08, $00
	tdc                                                  ; $f232 : $7b
	sta $001e.w, X                                                  ; $f233 : $9d, $1e, $00
	sep #ACCU_8                                                  ; $f236 : $e2, $20
	rts                                                  ; $f238 : $60


	sep #ACCU_8|IDX_8                                                  ; $f239 : $e2, $30
	ldx $01                                                  ; $f23b : $a6, $01
	jmp ($f240.w, X)                                                  ; $f23d : $7c, $40, $f2


	ror $eaf2.w                                                  ; $f240 : $6e, $f2, $ea
	sbc ($8a, S), Y                                                  ; $f243 : $f3, $8a
	sbc [$4c], Y                                                  ; $f245 : $f7, $4c
	sbc ($58)                                                  ; $f247 : $f2, $58
	sbc ($5e)                                                  ; $f249 : $f2, $5e
	sbc ($a5)                                                  ; $f24b : $f2, $a5
	and ($30, S), Y                                                  ; $f24d : $33, $30
	tsb $c6                                                  ; $f24f : $04, $c6
	bmi br_13_f223                                                  ; $f251 : $30, $d0

	ora [$5c], Y                                                  ; $f253 : $17, $5c
	and $a902db.l, X                                                  ; $f255 : $3f, $db, $02, $a9
	cop $85.b                                                  ; $f259 : $02, $85
	ora ($80, X)                                                  ; $f25b : $01, $80
	ora $fe22.w                                                  ; $f25d : $0d, $22, $fe
	cmp $a502.w, X                                                  ; $f260 : $dd, $02, $a5
	ora ($c9, X)                                                  ; $f263 : $01, $c9
	tsb $d0                                                  ; $f265 : $04, $d0
	ora $4c, S                                                  ; $f267 : $03, $4c
	eor [$f4], Y                                                  ; $f269 : $57, $f4
	jmp Jump_13_f3ea.w                                                  ; $f26b : $4c, $ea, $f3


	ldx $02                                                  ; $f26e : $a6, $02
	jmp ($f273.w, X)                                                  ; $f270 : $7c, $73, $f2


	adc $d5f2.w, Y                                                  ; $f273 : $79, $f2, $d5
	sbc ($46)                                                  ; $f276 : $f2, $46
	sbc ($22, S), Y                                                  ; $f278 : $f3, $22
	cmp $f004d8.l                                                  ; $f27a : $cf, $d8, $04, $f0
	php                                                  ; $f27e : $08
	bit $1fc6.w                                                  ; $f27f : $2c, $c6, $1f
	bvc br_13_f297                                                  ; $f282 : $50, $13

	jmp Jump_13_f7b4.w                                                  ; $f284 : $4c, $b4, $f7


	lda $1fe0.w                                                  ; $f287 : $ad, $e0, $1f
	cmp #$06.b                                                  ; $f28a : $c9, $06
	beq br_13_f292                                                  ; $f28c : $f0, $04

	jmp todo_DisablesEntity_d928.l                                                  ; $f28e : $5c, $28, $d9, $02


br_13_f292:
	lda $09da.w                                                  ; $f292 : $ad, $da, $09
	bne br_13_f2d4                                                  ; $f295 : $d0, $3d

br_13_f297:
	jsr todo_CausePlayerToFreeze.l                                                  ; $f297 : $22, $ca, $d1, $04
	stz $1f54.w                                                  ; $f29b : $9c, $54, $1f
	stz $1f55.w                                                  ; $f29e : $9c, $55, $1f
	stz $1f56.w                                                  ; $f2a1 : $9c, $56, $1f
	stz $37                                                  ; $f2a4 : $64, $37
	lda #$02.b                                                  ; $f2a6 : $a9, $02
	sta $02                                                  ; $f2a8 : $85, $02
	lda #$00.b                                                  ; $f2aa : $a9, $00
	sta $7fcd90.l                                                  ; $f2ac : $8f, $90, $cd, $7f
	lda #$5a.b                                                  ; $f2b0 : $a9, $5a
	jsr $00850f.l                                                  ; $f2b2 : $22, $0f, $85, $00
	lda $001f39.l                                                  ; $f2b6 : $af, $39, $1f, $00
	beq br_13_f2c2                                                  ; $f2ba : $f0, $06

	lda #$27.b                                                  ; $f2bc : $a9, $27
	jsr Func_0_84bc.l                                                  ; $f2be : $22, $bc, $84, $00

br_13_f2c2:
	jsr Call_13_fa13.w                                                  ; $f2c2 : $20, $13, $fa
	jsr $04d8cf.l                                                  ; $f2c5 : $22, $cf, $d8, $04
	bne br_13_f2d4                                                  ; $f2c9 : $d0, $09

	lda #$06.b                                                  ; $f2cb : $a9, $06
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $f2cd : $8d, $18, $1f
	jsr todo_HookAddThreadToDynamicallyLoadSpriteTileData.l                                                  ; $f2d0 : $22, $dc, $b1, $00

br_13_f2d4:
	rtl                                                  ; $f2d4 : $6b


	lda $0040.w                                                  ; $f2d5 : $ad, $40, $00
	bne br_13_f2d4                                                  ; $f2d8 : $d0, $fa

	lda $0a03.w                                                  ; $f2da : $ad, $03, $0a
	bit #$04.b                                                  ; $f2dd : $89, $04
	beq br_13_f2d4                                                  ; $f2df : $f0, $f3

	jsr Func_2_e15c.l                                                  ; $f2e1 : $22, $5c, $e1, $02
	lda $28                                                  ; $f2e5 : $a5, $28
	sta $1f57.w                                                  ; $f2e7 : $8d, $57, $1f
	stz $27                                                  ; $f2ea : $64, $27
	stz $3b                                                  ; $f2ec : $64, $3b
	lda #$29.b                                                  ; $f2ee : $a9, $29
	sta $11                                                  ; $f2f0 : $85, $11
	lda #$03.b                                                  ; $f2f2 : $a9, $03
	sta $26                                                  ; $f2f4 : $85, $26
	lda #$06.b                                                  ; $f2f6 : $a9, $06
	sta $12                                                  ; $f2f8 : $85, $12
	jsr $02e13f.l                                                  ; $f2fa : $22, $3f, $e1, $02
	lda $11                                                  ; $f2fe : $a5, $11
	sta $38                                                  ; $f300 : $85, $38
	rep #ACCU_8|F_CARRY                                                  ; $f302 : $c2, $21
	lda #$00d0.w                                                  ; $f304 : $a9, $d0, $00
	adc wNewStageScrollX.w                                                  ; $f307 : $6d, $5d, $1e
	sta $05                                                  ; $f30a : $85, $05
	lda #$ffe0.w                                                  ; $f30c : $a9, $e0, $ff
	clc                                                  ; $f30f : $18
	adc wNewStageScrollY.w                                                  ; $f310 : $6d, $60, $1e
	sta $08                                                  ; $f313 : $85, $08
	lda #$fd00.w                                                  ; $f315 : $a9, $00, $fd
	sta $1c                                                  ; $f318 : $85, $1c
	stz $1a                                                  ; $f31a : $64, $1a
	lda #$ed06.w                                                  ; $f31c : $a9, $06, $ed
	sta $20                                                  ; $f31f : $85, $20
	tdc                                                  ; $f321 : $7b
	sta $1f1f.w                                                  ; $f322 : $8d, $1f, $1f
	sep #ACCU_8                                                  ; $f325 : $e2, $20
	lda #$06.b                                                  ; $f327 : $a9, $06
	sta $12                                                  ; $f329 : $85, $12
	lda #$08.b                                                  ; $f32b : $a9, $08
	sta $39                                                  ; $f32d : $85, $39
	lda #$04.b                                                  ; $f32f : $a9, $04
	sta $02                                                  ; $f331 : $85, $02
	sta $1f54.w                                                  ; $f333 : $8d, $54, $1f
	stz $03                                                  ; $f336 : $64, $03
	stz $01                                                  ; $f338 : $64, $01
	stz $1f55.w                                                  ; $f33a : $9c, $55, $1f
	stz $1f56.w                                                  ; $f33d : $9c, $56, $1f
	lda #$04.b                                                  ; $f340 : $a9, $04
	jmp Func_4_b967.l                                                  ; $f342 : $5c, $67, $b9, $04


	ldx $03                                                  ; $f346 : $a6, $03
	jsr ($f353.w, X)                                                  ; $f348 : $fc, $53, $f3
	jsr Func_2_d636.l                                                  ; $f34b : $22, $36, $d6, $02
	jmp Func_4_b94a.l                                                  ; $f34f : $5c, $4a, $b9, $04


	eor $72f3.w, X                                                  ; $f353 : $5d, $f3, $72
	sbc ($97, S), Y                                                  ; $f356 : $f3, $97
	sbc ($a9, S), Y                                                  ; $f358 : $f3, $a9
	sbc ($b6, S), Y                                                  ; $f35a : $f3, $b6
	sbc ($c6, S), Y                                                  ; $f35c : $f3, $c6
	and $10d0.w, Y                                                  ; $f35e : $39, $d0, $10
	ldx #$1f.b                                                  ; $f361 : $a2, $1f

br_13_f363:
	lda $0480.w, X                                                  ; $f363 : $bd, $80, $04
	sta $7fcac0.l, X                                                  ; $f366 : $9f, $c0, $ca, $7f
	dex                                                  ; $f36a : $ca
	bpl br_13_f363                                                  ; $f36b : $10, $f6

	lda #$02.b                                                  ; $f36d : $a9, $02
	sta $03                                                  ; $f36f : $85, $03
	rts                                                  ; $f371 : $60


	jsr $02d78e.l                                                  ; $f372 : $22, $8e, $d7, $02
	rep #ACCU_8|F_CARRY                                                  ; $f376 : $c2, $21
	lda wNewStageScrollY.w                                                  ; $f378 : $ad, $60, $1e
	adc #$0098.w                                                  ; $f37b : $69, $98, $00
	cmp $08                                                  ; $f37e : $c5, $08
	sep #ACCU_8                                                  ; $f380 : $e2, $20
	bpl br_13_f396                                                  ; $f382 : $10, $12

	jsr $04c0f7.l                                                  ; $f384 : $22, $f7, $c0, $04
	lda $2b                                                  ; $f388 : $a5, $2b
	bit #$04.b                                                  ; $f38a : $89, $04
	beq br_13_f396                                                  ; $f38c : $f0, $08

	lda #$04.b                                                  ; $f38e : $a9, $04
	sta $03                                                  ; $f390 : $85, $03
	lda #$14.b                                                  ; $f392 : $a9, $14
	sta $39                                                  ; $f394 : $85, $39

br_13_f396:
	rts                                                  ; $f396 : $60


	lda $39                                                  ; $f397 : $a5, $39
	beq br_13_f39e                                                  ; $f399 : $f0, $03

	dec $39                                                  ; $f39b : $c6, $39
	rts                                                  ; $f39d : $60


br_13_f39e:
	lda #$0d.b                                                  ; $f39e : $a9, $0d
	jsr Func_4_b967.l                                                  ; $f3a0 : $22, $67, $b9, $04
	lda #$06.b                                                  ; $f3a4 : $a9, $06
	sta $03                                                  ; $f3a6 : $85, $03
	rts                                                  ; $f3a8 : $60


	lda $0f                                                  ; $f3a9 : $a5, $0f
	bpl br_13_f3b5                                                  ; $f3ab : $10, $08

	lda #$08.b                                                  ; $f3ad : $a9, $08
	sta $03                                                  ; $f3af : $85, $03
	lda #$02.b                                                  ; $f3b1 : $a9, $02
	sta $39                                                  ; $f3b3 : $85, $39

br_13_f3b5:
	rts                                                  ; $f3b5 : $60


	dec $39                                                  ; $f3b6 : $c6, $39
	bne br_13_f3e9                                                  ; $f3b8 : $d0, $2f

	lda #$02.b                                                  ; $f3ba : $a9, $02
	sta $39                                                  ; $f3bc : $85, $39
	lda $27                                                  ; $f3be : $a5, $27
	and #$7f.b                                                  ; $f3c0 : $29, $7f
	cmp #$20.b                                                  ; $f3c2 : $c9, $20
	beq br_13_f3d2                                                  ; $f3c4 : $f0, $0c

	ina                                                  ; $f3c6 : $1a
	ora #$80.b                                                  ; $f3c7 : $09, $80
	sta $27                                                  ; $f3c9 : $85, $27
	lda #$15.b                                                  ; $f3cb : $a9, $15
	jsr $01802b.l                                                  ; $f3cd : $22, $2b, $80, $01
	rts                                                  ; $f3d1 : $60


br_13_f3d2:
	lda #$02.b                                                  ; $f3d2 : $a9, $02
	sta $01                                                  ; $f3d4 : $85, $01
	jsr Call_13_f868.w                                                  ; $f3d6 : $20, $68, $f8
	jsr $04d1ef.l                                                  ; $f3d9 : $22, $ef, $d1, $04
	lda $001f39.l                                                  ; $f3dd : $af, $39, $1f, $00
	beq br_13_f3e9                                                  ; $f3e1 : $f0, $06

	lda #$1a.b                                                  ; $f3e3 : $a9, $1a
	jsr Func_0_84bc.l                                                  ; $f3e5 : $22, $bc, $84, $00

br_13_f3e9:
	rts                                                  ; $f3e9 : $60


Jump_13_f3ea:
	jsr $04d8d5.l                                                  ; $f3ea : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $f3ee : $22, $64, $df, $02
	ldx $02                                                  ; $f3f2 : $a6, $02
	jsr ($f495.w, X)                                                  ; $f3f4 : $fc, $95, $f4
	jsr Func_4_cb74.l                                                  ; $f3f7 : $22, $74, $cb, $04
	bmi br_13_f457                                                  ; $f3fb : $30, $5a

	bvs br_13_f40b                                                  ; $f3fd : $70, $0c

	bne br_13_f416                                                  ; $f3ff : $d0, $15

	lda $27                                                  ; $f401 : $a5, $27
	beq br_13_f457                                                  ; $f403 : $f0, $52

	jsr Func_4_cb31.l                                                  ; $f405 : $22, $31, $cb, $04
	bra br_13_f46b                                                  ; $f409 : $80, $60

br_13_f40b:
	jsr Call_13_f482.w                                                  ; $f40b : $20, $82, $f4
	bcc br_13_f46b                                                  ; $f40e : $90, $5b

	lda $27                                                  ; $f410 : $a5, $27
	beq br_13_f457                                                  ; $f412 : $f0, $43

	bra br_13_f437                                                  ; $f414 : $80, $21

br_13_f416:
	jsr Call_13_f482.w                                                  ; $f416 : $20, $82, $f4
	bcc br_13_f443                                                  ; $f419 : $90, $28

	lda #$1e.b                                                  ; $f41b : $a9, $1e
	sta $39                                                  ; $f41d : $85, $39
	lda $2f                                                  ; $f41f : $a5, $2f
	beq br_13_f42b                                                  ; $f421 : $f0, $08

	stz $1a                                                  ; $f423 : $64, $1a
	stz $1b                                                  ; $f425 : $64, $1b
	stz $1c                                                  ; $f427 : $64, $1c
	stz $1d                                                  ; $f429 : $64, $1d

br_13_f42b:
	lda #$0a.b                                                  ; $f42b : $a9, $0a
	sta $02                                                  ; $f42d : $85, $02
	lda #$0c.b                                                  ; $f42f : $a9, $0c
	jsr Func_4_b967.l                                                  ; $f431 : $22, $67, $b9, $04
	bra br_13_f443                                                  ; $f435 : $80, $0c

br_13_f437:
	lda #$0c.b                                                  ; $f437 : $a9, $0c
	sta $02                                                  ; $f439 : $85, $02
	lda #$0c.b                                                  ; $f43b : $a9, $0c
	jsr Func_4_b967.l                                                  ; $f43d : $22, $67, $b9, $04
	bra br_13_f46b                                                  ; $f441 : $80, $28

br_13_f443:
	lda #$21.b                                                  ; $f443 : $a9, $21
	jsr Func_1_8000.l                                                  ; $f445 : $22, $00, $80, $01
	lda #$3c.b                                                  ; $f449 : $a9, $3c
	sta $37                                                  ; $f44b : $85, $37
	lda #$01.b                                                  ; $f44d : $a9, $01
	sta $28                                                  ; $f44f : $85, $28
	lda #$0e.b                                                  ; $f451 : $a9, $0e
	trb $11                                                  ; $f453 : $14, $11
	bra br_13_f46b                                                  ; $f455 : $80, $14

br_13_f457:
	lda #$04.b                                                  ; $f457 : $a9, $04
	sta $01                                                  ; $f459 : $85, $01
	stz $02                                                  ; $f45b : $64, $02
	stz $03                                                  ; $f45d : $64, $03
	stz $3a                                                  ; $f45f : $64, $3a
	lda $38                                                  ; $f461 : $a5, $38
	tsb $11                                                  ; $f463 : $04, $11
	lda #$0c.b                                                  ; $f465 : $a9, $0c
	jsr Func_4_b967.l                                                  ; $f467 : $22, $67, $b9, $04

br_13_f46b:
	lda $01                                                  ; $f46b : $a5, $01
	sta $1f54.w                                                  ; $f46d : $8d, $54, $1f
	lda $02                                                  ; $f470 : $a5, $02
	sta $1f55.w                                                  ; $f472 : $8d, $55, $1f
	lda $03                                                  ; $f475 : $a5, $03
	sta $1f56.w                                                  ; $f477 : $8d, $56, $1f
	jsr Func_2_d636.l                                                  ; $f47a : $22, $36, $d6, $02
	jmp Func_4_b94a.l                                                  ; $f47e : $5c, $4a, $b9, $04


Call_13_f482:
	lda $1f2f.w                                                  ; $f482 : $ad, $2f, $1f
	cmp #$0b.b                                                  ; $f485 : $c9, $0b
	beq br_13_f493                                                  ; $f487 : $f0, $0a

	cmp #$14.b                                                  ; $f489 : $c9, $14
	beq br_13_f493                                                  ; $f48b : $f0, $06

	cmp #$1c.b                                                  ; $f48d : $c9, $1c
	beq br_13_f493                                                  ; $f48f : $f0, $02

	clc                                                  ; $f491 : $18
	rts                                                  ; $f492 : $60


br_13_f493:
	sec                                                  ; $f493 : $38
	rts                                                  ; $f494 : $60


	lda $f4, S                                                  ; $f495 : $a3, $f4
	wai                                                  ; $f497 : $cb
	sbc $92, X                                                  ; $f498 : $f5, $92
	inc $c4, X                                                  ; $f49a : $f6, $c4
	inc $0f, X                                                  ; $f49c : $f6, $0f
	sbc [$44], Y                                                  ; $f49e : $f7, $44
	sbc [$5d], Y                                                  ; $f4a0 : $f7, $5d
	sbc [$a6], Y                                                  ; $f4a2 : $f7, $a6
	ora $7c, S                                                  ; $f4a4 : $03, $7c
	tay                                                  ; $f4a6 : $a8
	pea $f4b2.w                                                  ; $f4a7 : $f4, $b2, $f4
	sbc $12f4.w, Y                                                  ; $f4aa : $f9, $f4, $12
	sbc $60, X                                                  ; $f4ad : $f5, $60
	sbc $c0, X                                                  ; $f4af : $f5, $c0
	sbc $ad, X                                                  ; $f4b1 : $f5, $ad
	phx                                                  ; $f4b3 : $da
	ora #$c9.b                                                  ; $f4b4 : $09, $c9
	stz $d0, X                                                  ; $f4b6 : $74, $d0
	ora $8508a9.l                                                  ; $f4b8 : $0f, $a9, $08, $85
	ora $a9, S                                                  ; $f4bc : $03, $a9
	asl $3985.w, X                                                  ; $f4be : $1e, $85, $39
	lda #$0d.b                                                  ; $f4c1 : $a9, $0d
	jsr Func_4_b967.l                                                  ; $f4c3 : $22, $67, $b9, $04
	rts                                                  ; $f4c7 : $60


	rep #ACCU_8                                                  ; $f4c8 : $c2, $20
	lda #$0100.w                                                  ; $f4ca : $a9, $00, $01
	sta $1a                                                  ; $f4cd : $85, $1a
	lda #$0400.w                                                  ; $f4cf : $a9, $00, $04
	sta $1c                                                  ; $f4d2 : $85, $1c
	sep #ACCU_8                                                  ; $f4d4 : $e2, $20
	lda #$02.b                                                  ; $f4d6 : $a9, $02
	sta $03                                                  ; $f4d8 : $85, $03
	lda $11                                                  ; $f4da : $a5, $11
	bit #$40.b                                                  ; $f4dc : $89, $40
	bne br_13_f4e4                                                  ; $f4de : $d0, $04

	lda #$ff.b                                                  ; $f4e0 : $a9, $ff
	sta $1b                                                  ; $f4e2 : $85, $1b

br_13_f4e4:
	lda $7fcd90.l                                                  ; $f4e4 : $af, $90, $cd, $7f
	beq br_13_f4ee                                                  ; $f4e8 : $f0, $04

	lda #$06.b                                                  ; $f4ea : $a9, $06
	sta $1d                                                  ; $f4ec : $85, $1d

br_13_f4ee:
	lda #$40.b                                                  ; $f4ee : $a9, $40
	sta $1e                                                  ; $f4f0 : $85, $1e
	lda #$02.b                                                  ; $f4f2 : $a9, $02
	jsr Func_4_b967.l                                                  ; $f4f4 : $22, $67, $b9, $04
	rts                                                  ; $f4f8 : $60


	lda $0f                                                  ; $f4f9 : $a5, $0f
	bpl br_13_f511                                                  ; $f4fb : $10, $14

	lda #$01.b                                                  ; $f4fd : $a9, $01
	sta $2f                                                  ; $f4ff : $85, $2f
	jsr $02d6f8.l                                                  ; $f501 : $22, $f8, $d6, $02
	lda #$04.b                                                  ; $f505 : $a9, $04
	sta $03                                                  ; $f507 : $85, $03
	stz $39                                                  ; $f509 : $64, $39
	lda #$03.b                                                  ; $f50b : $a9, $03
	jsr Func_4_b967.l                                                  ; $f50d : $22, $67, $b9, $04

br_13_f511:
	rts                                                  ; $f511 : $60


	jsr $02d6f8.l                                                  ; $f512 : $22, $f8, $d6, $02
	lda $39                                                  ; $f516 : $a5, $39
	bne br_13_f52a                                                  ; $f518 : $d0, $10

	lda $1d                                                  ; $f51a : $a5, $1d
	bpl br_13_f52a                                                  ; $f51c : $10, $0c

	inc $39                                                  ; $f51e : $e6, $39
	lda #$20.b                                                  ; $f520 : $a9, $20
	sta $1e                                                  ; $f522 : $85, $1e
	lda #$04.b                                                  ; $f524 : $a9, $04
	jsr Func_4_b967.l                                                  ; $f526 : $22, $67, $b9, $04

br_13_f52a:
	jsr $04c0f7.l                                                  ; $f52a : $22, $f7, $c0, $04
	lda $2b                                                  ; $f52e : $a5, $2b
	bit #$04.b                                                  ; $f530 : $89, $04
	bne br_13_f53c                                                  ; $f532 : $d0, $08

	bit #$03.b                                                  ; $f534 : $89, $03
	beq br_13_f55f                                                  ; $f536 : $f0, $27

	stz $1b                                                  ; $f538 : $64, $1b
	bra br_13_f55f                                                  ; $f53a : $80, $23

br_13_f53c:
	lda #$06.b                                                  ; $f53c : $a9, $06
	sta $03                                                  ; $f53e : $85, $03
	stz $2f                                                  ; $f540 : $64, $2f
	lda #$14.b                                                  ; $f542 : $a9, $14
	ldx #$02.b                                                  ; $f544 : $a2, $02
	ldy #$01.b                                                  ; $f546 : $a0, $01
	jsr $04d5a2.l                                                  ; $f548 : $22, $a2, $d5, $04
	lda #$0a.b                                                  ; $f54c : $a9, $0a
	sta $39                                                  ; $f54e : $85, $39
	lda #$48.b                                                  ; $f550 : $a9, $48
	jsr $01802b.l                                                  ; $f552 : $22, $2b, $80, $01
	lda #$05.b                                                  ; $f556 : $a9, $05
	jsr Func_4_b967.l                                                  ; $f558 : $22, $67, $b9, $04
	jmp Jump_13_f83a.w                                                  ; $f55c : $4c, $3a, $f8


br_13_f55f:
	rts                                                  ; $f55f : $60


	lda $0f                                                  ; $f560 : $a5, $0f
	bpl br_13_f5bf                                                  ; $f562 : $10, $5b

	dec $3a                                                  ; $f564 : $c6, $3a
	bne br_13_f5b5                                                  ; $f566 : $d0, $4d

	stz $03                                                  ; $f568 : $64, $03
	jsr $02e13f.l                                                  ; $f56a : $22, $3f, $e1, $02
	jsr Func_4_be35.l                                                  ; $f56e : $22, $35, $be, $04
	and #$03.b                                                  ; $f572 : $29, $03
	beq br_13_f5a2                                                  ; $f574 : $f0, $2c

	lda $7fcd90.l                                                  ; $f576 : $af, $90, $cd, $7f
	bne br_13_f5a2                                                  ; $f57a : $d0, $26

	lda $27                                                  ; $f57c : $a5, $27
	cmp #$10.b                                                  ; $f57e : $c9, $10
	bpl br_13_f594                                                  ; $f580 : $10, $12

	lda $05                                                  ; $f582 : $a5, $05
	cmp #$50.b                                                  ; $f584 : $c9, $50
	bcc br_13_f594                                                  ; $f586 : $90, $0c

	cmp #$b0.b                                                  ; $f588 : $c9, $b0
	bcs br_13_f594                                                  ; $f58a : $b0, $08

	lda #$08.b                                                  ; $f58c : $a9, $08
	sta $02                                                  ; $f58e : $85, $02
	stz $03                                                  ; $f590 : $64, $03
	bra br_13_f5bf                                                  ; $f592 : $80, $2b

br_13_f594:
	jsr Func_4_be35.l                                                  ; $f594 : $22, $35, $be, $04
	and #$01.b                                                  ; $f598 : $29, $01
	asl                                                  ; $f59a : $0a
	clc                                                  ; $f59b : $18
	adc #$04.b                                                  ; $f59c : $69, $04
	sta $02                                                  ; $f59e : $85, $02
	bra br_13_f5bf                                                  ; $f5a0 : $80, $1d

br_13_f5a2:
	lda #$02.b                                                  ; $f5a2 : $a9, $02
	sta $02                                                  ; $f5a4 : $85, $02
	lda #$0d.b                                                  ; $f5a6 : $a9, $0d
	sta $28                                                  ; $f5a8 : $85, $28
	sta $1f57.w                                                  ; $f5aa : $8d, $57, $1f
	lda #$08.b                                                  ; $f5ad : $a9, $08
	jsr Func_4_b967.l                                                  ; $f5af : $22, $67, $b9, $04
	bra br_13_f5bf                                                  ; $f5b3 : $80, $0a

br_13_f5b5:
	jsr $02e13f.l                                                  ; $f5b5 : $22, $3f, $e1, $02
	lda #$00.b                                                  ; $f5b9 : $a9, $00
	jsr Func_4_b967.l                                                  ; $f5bb : $22, $67, $b9, $04

br_13_f5bf:
	rts                                                  ; $f5bf : $60


	lda $0f                                                  ; $f5c0 : $a5, $0f
	bpl br_13_f5ca                                                  ; $f5c2 : $10, $06

	dec $39                                                  ; $f5c4 : $c6, $39
	bne br_13_f5ca                                                  ; $f5c6 : $d0, $02

	stz $03                                                  ; $f5c8 : $64, $03

br_13_f5ca:
	rts                                                  ; $f5ca : $60


	ldx $03                                                  ; $f5cb : $a6, $03
	jmp ($f5d0.w, X)                                                  ; $f5cd : $7c, $d0, $f5


	cld                                                  ; $f5d0 : $d8
	sbc $08, X                                                  ; $f5d1 : $f5, $08
	inc $68, X                                                  ; $f5d3 : $f6, $68
	inc $7a, X                                                  ; $f5d5 : $f6, $7a
	inc $20, X                                                  ; $f5d7 : $f6, $20
	phx                                                  ; $f5d9 : $da
	sbc [$a5], Y                                                  ; $f5da : $f7, $a5
	ora $a92810.l                                                  ; $f5dc : $0f, $10, $28, $a9
	cop $85.b                                                  ; $f5e0 : $02, $85
	ora $a9, S                                                  ; $f5e2 : $03, $a9
	asl $85                                                  ; $f5e4 : $06, $85
	rol $a9                                                  ; $f5e6 : $26, $a9
	ora #$22.b                                                  ; $f5e8 : $09, $22
	adc [$b9]                                                  ; $f5ea : $67, $b9
	tsb $c2                                                  ; $f5ec : $04, $c2
	jsr $10a9.w                                                  ; $f5ee : $20, $a9, $10
	sbc $2085.w                                                  ; $f5f1 : $ed, $85, $20
	lda #$00.b                                                  ; $f5f4 : $a9, $00
	tsb $85                                                  ; $f5f6 : $04, $85
	ina                                                  ; $f5f8 : $1a
	stz $1c                                                  ; $f5f9 : $64, $1c
	sep #ACCU_8                                                  ; $f5fb : $e2, $20
	lda $11                                                  ; $f5fd : $a5, $11
	bit #$40.b                                                  ; $f5ff : $89, $40
	bne br_13_f607                                                  ; $f601 : $d0, $04

	lda #$fc.b                                                  ; $f603 : $a9, $fc
	sta $1b                                                  ; $f605 : $85, $1b

br_13_f607:
	rts                                                  ; $f607 : $60


	jsr Call_13_f7da.w                                                  ; $f608 : $20, $da, $f7
	jsr $02d78e.l                                                  ; $f60b : $22, $8e, $d7, $02
	jsr Call_13_f812.w                                                  ; $f60f : $20, $12, $f8
	lda $09cc.w                                                  ; $f612 : $ad, $cc, $09
	and #$07.b                                                  ; $f615 : $29, $07
	bne br_13_f61f                                                  ; $f617 : $d0, $06

	lda #$73.b                                                  ; $f619 : $a9, $73
	jsr Func_1_8000.l                                                  ; $f61b : $22, $00, $80, $01

br_13_f61f:
	lda $7fcd90.l                                                  ; $f61f : $af, $90, $cd, $7f
	bne br_13_f62a                                                  ; $f623 : $d0, $05

	jsr Call_13_f979.w                                                  ; $f625 : $20, $79, $f9
	bra br_13_f62d                                                  ; $f628 : $80, $03

br_13_f62a:
	jsr Call_13_f9a0.w                                                  ; $f62a : $20, $a0, $f9

br_13_f62d:
	jsr $04c0f7.l                                                  ; $f62d : $22, $f7, $c0, $04
	lda $2b                                                  ; $f631 : $a5, $2b
	bit #$03.b                                                  ; $f633 : $89, $03
	bne br_13_f65d                                                  ; $f635 : $d0, $26

	rep #IDX_8                                                  ; $f637 : $c2, $10
	ldx #$ed1a.w                                                  ; $f639 : $a2, $1a, $ed
	stx $20                                                  ; $f63c : $86, $20
	ldx #$09d8.w                                                  ; $f63e : $a2, $d8, $09
	jsr Func_4_cc5c.l                                                  ; $f641 : $22, $5c, $cc, $04
	ldx #$ed10.w                                                  ; $f645 : $a2, $10, $ed
	stx $20                                                  ; $f648 : $86, $20
	sep #IDX_8                                                  ; $f64a : $e2, $10
	bcc br_13_f667                                                  ; $f64c : $90, $19

	jsr Call_13_f87c.w                                                  ; $f64e : $20, $7c, $f8
	lda #$04.b                                                  ; $f651 : $a9, $04
	sta $03                                                  ; $f653 : $85, $03
	lda #$0a.b                                                  ; $f655 : $a9, $0a
	jsr Func_4_b967.l                                                  ; $f657 : $22, $67, $b9, $04
	bra br_13_f667                                                  ; $f65b : $80, $0a

br_13_f65d:
	lda #$04.b                                                  ; $f65d : $a9, $04
	sta $03                                                  ; $f65f : $85, $03
	lda #$0a.b                                                  ; $f661 : $a9, $0a
	jsr Func_4_b967.l                                                  ; $f663 : $22, $67, $b9, $04

br_13_f667:
	rts                                                  ; $f667 : $60


	jsr Call_13_f7da.w                                                  ; $f668 : $20, $da, $f7
	lda $0f                                                  ; $f66b : $a5, $0f
	bpl br_13_f679                                                  ; $f66d : $10, $0a

	lda #$06.b                                                  ; $f66f : $a9, $06
	sta $03                                                  ; $f671 : $85, $03
	lda #$00.b                                                  ; $f673 : $a9, $00
	jsr Func_4_b967.l                                                  ; $f675 : $22, $67, $b9, $04

br_13_f679:
	rts                                                  ; $f679 : $60


	jsr Call_13_f800.w                                                  ; $f67a : $20, $00, $f8
	bcs br_13_f691                                                  ; $f67d : $b0, $12

	jsr Call_13_f868.w                                                  ; $f67f : $20, $68, $f8
	lda #$14.b                                                  ; $f682 : $a9, $14
	sta $28                                                  ; $f684 : $85, $28
	sta $1f57.w                                                  ; $f686 : $8d, $57, $1f
	lda #$06.b                                                  ; $f689 : $a9, $06
	sta $20                                                  ; $f68b : $85, $20
	lda #$ed.b                                                  ; $f68d : $a9, $ed
	sta $21                                                  ; $f68f : $85, $21

br_13_f691:
	rts                                                  ; $f691 : $60


	ldx $03                                                  ; $f692 : $a6, $03
	jmp ($f697.w, X)                                                  ; $f694 : $7c, $97, $f6


	sta $a8f6.w, X                                                  ; $f697 : $9d, $f6, $a8
	inc $b6, X                                                  ; $f69a : $f6, $b6
	inc $a9, X                                                  ; $f69c : $f6, $a9
	asl $22                                                  ; $f69e : $06, $22
	adc [$b9]                                                  ; $f6a0 : $67, $b9
	tsb $a9                                                  ; $f6a2 : $04, $a9
	cop $85.b                                                  ; $f6a4 : $02, $85
	ora $60, S                                                  ; $f6a6 : $03, $60
	lda $0f                                                  ; $f6a8 : $a5, $0f
	bit #$40.b                                                  ; $f6aa : $89, $40
	beq br_13_f6b5                                                  ; $f6ac : $f0, $07

	jsr Call_13_f8a9.w                                                  ; $f6ae : $20, $a9, $f8
	lda #$04.b                                                  ; $f6b1 : $a9, $04
	sta $03                                                  ; $f6b3 : $85, $03

br_13_f6b5:
	rts                                                  ; $f6b5 : $60


	lda $0f                                                  ; $f6b6 : $a5, $0f
	bpl br_13_f6c3                                                  ; $f6b8 : $10, $09

	lda #$00.b                                                  ; $f6ba : $a9, $00
	jsr Func_4_b967.l                                                  ; $f6bc : $22, $67, $b9, $04
	jmp Jump_13_f868.w                                                  ; $f6c0 : $4c, $68, $f8


br_13_f6c3:
	rts                                                  ; $f6c3 : $60


	ldx $03                                                  ; $f6c4 : $a6, $03
	jmp ($f6c9.w, X)                                                  ; $f6c6 : $7c, $c9, $f6


	cmp ($f6), Y                                                  ; $f6c9 : $d1, $f6
	jml [$ecf6.w]                                                  ; $f6cb : $dc, $f6, $ec


	inc $01, X                                                  ; $f6ce : $f6, $01
	sbc [$a9], Y                                                  ; $f6d0 : $f7, $a9
	ora [$22]                                                  ; $f6d2 : $07, $22
	adc [$b9]                                                  ; $f6d4 : $67, $b9
	tsb $a9                                                  ; $f6d6 : $04, $a9
	cop $85.b                                                  ; $f6d8 : $02, $85
	ora $60, S                                                  ; $f6da : $03, $60
	lda $0f                                                  ; $f6dc : $a5, $0f
	bit #$40.b                                                  ; $f6de : $89, $40
	beq br_13_f6eb                                                  ; $f6e0 : $f0, $09

	sta $39                                                  ; $f6e2 : $85, $39
	jsr Call_13_f8a9.w                                                  ; $f6e4 : $20, $a9, $f8
	lda #$04.b                                                  ; $f6e7 : $a9, $04
	sta $03                                                  ; $f6e9 : $85, $03

br_13_f6eb:
	rts                                                  ; $f6eb : $60


	lda $0f                                                  ; $f6ec : $a5, $0f
	bit #$40.b                                                  ; $f6ee : $89, $40
	beq br_13_f6fe                                                  ; $f6f0 : $f0, $0c

	lda $39                                                  ; $f6f2 : $a5, $39
	bne br_13_f6eb                                                  ; $f6f4 : $d0, $f5

	jsr Call_13_f8e4.w                                                  ; $f6f6 : $20, $e4, $f8
	lda #$06.b                                                  ; $f6f9 : $a9, $06
	sta $03                                                  ; $f6fb : $85, $03
	rts                                                  ; $f6fd : $60


br_13_f6fe:
	stz $39                                                  ; $f6fe : $64, $39
	rts                                                  ; $f700 : $60


	lda $0f                                                  ; $f701 : $a5, $0f
	bpl br_13_f70e                                                  ; $f703 : $10, $09

	lda #$00.b                                                  ; $f705 : $a9, $00
	jsr Func_4_b967.l                                                  ; $f707 : $22, $67, $b9, $04
	jmp Jump_13_f868.w                                                  ; $f70b : $4c, $68, $f8


br_13_f70e:
	rts                                                  ; $f70e : $60


	ldx $03                                                  ; $f70f : $a6, $03
	jmp (@funcs.w, X)                                                  ; $f711 : $7c, $14, $f7

@funcs:
	.dw $f71a
	.dw $f725
	.dw $f737


;
	lda #$02.b                                                  ; $f71a : $a9, $02
	sta $03                                                  ; $f71c : $85, $03
	lda #$0b.b                                                  ; $f71d : $a9, $0b
	jsr Func_4_b967.l                                                  ; $f720 : $22, $67, $b9, $04
	rts                                                  ; $f724 : $60


	lda $0f                                                  ; $f725 : $a5, $0f
	bit #$40.b                                                  ; $f727 : $89, $40
	beq br_13_f736                                                  ; $f729 : $f0, $0b

	jsr Call_13_f91e.w                                                  ; $f72b : $20, $1e, $f9
	lda #$04.b                                                  ; $f72e : $a9, $04
	sta $03                                                  ; $f730 : $85, $03
	sta $7fcd90.l                                                  ; $f732 : $8f, $90, $cd, $7f

br_13_f736:
	rts                                                  ; $f736 : $60


	lda $0f                                                  ; $f737 : $a5, $0f
	bpl br_13_f736                                                  ; $f739 : $10, $fb

	lda #$00.b                                                  ; $f73b : $a9, $00
	jsr Func_4_b967.l                                                  ; $f73d : $22, $67, $b9, $04
	jmp Jump_13_f868.w                                                  ; $f741 : $4c, $68, $f8


	lda $2f                                                  ; $f744 : $a5, $2f
	beq br_13_f751                                                  ; $f746 : $f0, $09

	jsr $02d6f8.l                                                  ; $f748 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $f74c : $22, $f7, $c0, $04
	rts                                                  ; $f750 : $60


br_13_f751:
	dec $39                                                  ; $f751 : $c6, $39
	bne br_13_f75c                                                  ; $f753 : $d0, $07

	lda #$5a.b                                                  ; $f755 : $a9, $5a
	sta $37                                                  ; $f757 : $85, $37
	jmp Jump_13_f868.w                                                  ; $f759 : $4c, $68, $f8


br_13_f75c:
	rts                                                  ; $f75c : $60


	rep #ACCU_8                                                  ; $f75d : $c2, $20
	ldx #$1e.b                                                  ; $f75f : $a2, $1e

br_13_f761:
	lda $7fcac0.l, X                                                  ; $f761 : $bf, $c0, $ca, $7f
	sta $0480.w, X                                                  ; $f765 : $9d, $80, $04
	dex                                                  ; $f768 : $ca
	dex                                                  ; $f769 : $ca
	bpl br_13_f761                                                  ; $f76a : $10, $f5

	sep #ACCU_8                                                  ; $f76c : $e2, $20
	lda #$01.b                                                  ; $f76e : $a9, $01
	sta $00a1.w                                                  ; $f770 : $8d, $a1, $00
	lda #$03.b                                                  ; $f773 : $a9, $03
	sta $26                                                  ; $f775 : $85, $26
	lda #$14.b                                                  ; $f777 : $a9, $14
	sta $28                                                  ; $f779 : $85, $28
	sta $1f57.w                                                  ; $f77b : $8d, $57, $1f
	lda #$06.b                                                  ; $f77e : $a9, $06
	sta $20                                                  ; $f780 : $85, $20
	lda #$ed.b                                                  ; $f782 : $a9, $ed
	sta $21                                                  ; $f784 : $85, $21
	jmp Jump_13_f868.w                                                  ; $f786 : $4c, $68, $f8


	rts                                                  ; $f789 : $60


br_13_f78a:
	ldx $3a                                                  ; $f78a : $a6, $3a
	jmp (@funcs.w, X)                                                  ; $f78c : $7c, $8f, $f7

@funcs:
	.dw $f795
	.dw $f7b0
	.dw Jump_13_f7b4


;
	ldx #$1f.b                                                  ; $f795 : $a2, $1f

br_13_f797:
	lda $7fcac0.l, X                                                  ; $f797 : $bf, $c0, $ca, $7f
	sta $0480.w, X                                                  ; $f79b : $9d, $80, $04
	dex                                                  ; $f79e : $ca
	bpl br_13_f797                                                  ; $f79f : $10, $f6

	lda #$01.b                                                  ; $f7a1 : $a9, $01
	sta $00a1.w                                                  ; $f7a3 : $8d, $a1, $00
	stz $0b                                                  ; $f7a6 : $64, $0b
	jsr $02e0ba.l                                                  ; $f7a8 : $22, $ba, $e0, $02
	lda #$46.b                                                  ; $f7ac : $a9, $46
	sta $39                                                  ; $f7ae : $85, $39
	jmp $02e0e6.l                                                  ; $f7b0 : $5c, $e6, $e0, $02


Jump_13_f7b4:
	lda #$80.b                                                  ; $f7b4 : $a9, $80
	trb $1f3f.w                                                  ; $f7b6 : $1c, $3f, $1f
	jsr $04d8cf.l                                                  ; $f7b9 : $22, $cf, $d8, $04
	beq br_13_f7c9                                                  ; $f7bd : $f0, $0a

	lda #$ff.b                                                  ; $f7bf : $a9, $ff
	sta $1fc6.w                                                  ; $f7c1 : $8d, $c6, $1f
	inc $1f36.w                                                  ; $f7c4 : $ee, $36, $1f
	bra br_13_f7d2                                                  ; $f7c7 : $80, $09

br_13_f7c9:
	jsr $04d8e1.l                                                  ; $f7c9 : $22, $e1, $d8, $04
	lda #$20.b                                                  ; $f7cd : $a9, $20
	tsb $1fda.w                                                  ; $f7cf : $0c, $da, $1f

br_13_f7d2:
	jmp todo_DisablesEntity_d928.l                                                  ; $f7d2 : $5c, $28, $d9, $02


	jsr Call_13_f7da.w                                                  ; $f7d6 : $20, $da, $f7
	rtl                                                  ; $f7d9 : $6b


Call_13_f7da:
	rep #ACCU_8                                                  ; $f7da : $c2, $20
	lda $049e.w                                                  ; $f7dc : $ad, $9e, $04
	sta $0000.w                                                  ; $f7df : $8d, $00, $00
	ldx #$1a.b                                                  ; $f7e2 : $a2, $1a

br_13_f7e4:
	lda $0482.w, X                                                  ; $f7e4 : $bd, $82, $04
	sta $0484.w, X                                                  ; $f7e7 : $9d, $84, $04
	dex                                                  ; $f7ea : $ca
	dex                                                  ; $f7eb : $ca
	bpl br_13_f7e4                                                  ; $f7ec : $10, $f6

	lda $0000.w                                                  ; $f7ee : $ad, $00, $00
	sta $0482.w                                                  ; $f7f1 : $8d, $82, $04
	sep #ACCU_8                                                  ; $f7f4 : $e2, $20
	lda #$01.b                                                  ; $f7f6 : $a9, $01
	sta $00a1.w                                                  ; $f7f8 : $8d, $a1, $00
	rts                                                  ; $f7fb : $60


	jsr Call_13_f800.w                                                  ; $f7fc : $20, $00, $f8
	rtl                                                  ; $f7ff : $6b


Call_13_f800:
	rep #ACCU_8|IDX_8                                                  ; $f800 : $c2, $30
	lda #$0010.w                                                  ; $f802 : $a9, $10, $00
	sta $0008.w                                                  ; $f805 : $8d, $08, $00
	ldx #$0180.w                                                  ; $f808 : $a2, $80, $01
	jsr $02e016.l                                                  ; $f80b : $22, $16, $e0, $02
	sep #ACCU_8|IDX_8                                                  ; $f80f : $e2, $30
	rts                                                  ; $f811 : $60


Call_13_f812:
	inc $35                                                  ; $f812 : $e6, $35
	lda $35                                                  ; $f814 : $a5, $35
	cmp #$04.b                                                  ; $f816 : $c9, $04
	bne br_13_f839                                                  ; $f818 : $d0, $1f

	stz $35                                                  ; $f81a : $64, $35
	rep #ACCU_8                                                  ; $f81c : $c2, $20
	lda #$001c.w                                                  ; $f81e : $a9, $1c, $00
	sta $0000.w                                                  ; $f821 : $8d, $00, $00
	lda #$0018.w                                                  ; $f824 : $a9, $18, $00
	sta $0002.w                                                  ; $f827 : $8d, $02, $00
	stz $0004.w                                                  ; $f82a : $9c, $04, $00
	lda #$00c0.w                                                  ; $f82d : $a9, $c0, $00
	sta $0006.w                                                  ; $f830 : $8d, $06, $00
	sep #ACCU_8                                                  ; $f833 : $e2, $20
	jsr $02df8a.l                                                  ; $f835 : $22, $8a, $df, $02

br_13_f839:
	rts                                                  ; $f839 : $60


Jump_13_f83a:
	rep #ACCU_8                                                  ; $f83a : $c2, $20
	lda #$0018.w                                                  ; $f83c : $a9, $18, $00
	sta $0000.w                                                  ; $f83f : $8d, $00, $00
	lda #$0018.w                                                  ; $f842 : $a9, $18, $00
	sta $0002.w                                                  ; $f845 : $8d, $02, $00
	stz $0004.w                                                  ; $f848 : $9c, $04, $00
	lda #$00c0.w                                                  ; $f84b : $a9, $c0, $00
	sta $0006.w                                                  ; $f84e : $8d, $06, $00
	sep #ACCU_8                                                  ; $f851 : $e2, $20
	jsr $02df8a.l                                                  ; $f853 : $22, $8a, $df, $02
	lda $11                                                  ; $f857 : $a5, $11
	eor #$40.b                                                  ; $f859 : $49, $40
	sta $11                                                  ; $f85b : $85, $11
	jsr $02df8a.l                                                  ; $f85d : $22, $8a, $df, $02
	lda $11                                                  ; $f861 : $a5, $11
	eor #$40.b                                                  ; $f863 : $49, $40
	sta $11                                                  ; $f865 : $85, $11
	rts                                                  ; $f867 : $60


Call_13_f868:
Jump_13_f868:
	jsr $02e13f.l                                                  ; $f868 : $22, $3f, $e1, $02
	jsr Func_4_be35.l                                                  ; $f86c : $22, $35, $be, $04
	and #$03.b                                                  ; $f870 : $29, $03
	bne br_13_f875                                                  ; $f872 : $d0, $01

	ina                                                  ; $f874 : $1a

br_13_f875:
	sta $3a                                                  ; $f875 : $85, $3a
	stz $02                                                  ; $f877 : $64, $02
	stz $03                                                  ; $f879 : $64, $03
	rts                                                  ; $f87b : $60


Call_13_f87c:
	rep #IDX_8                                                  ; $f87c : $c2, $10
	jsr $02d8de.l                                                  ; $f87e : $22, $de, $d8, $02
	bne br_13_f8a6                                                  ; $f882 : $d0, $22

	inc $0000.w, X                                                  ; $f884 : $fe, $00, $00
	lda #$22.b                                                  ; $f887 : $a9, $22
	sta $000a.w, X                                                  ; $f889 : $9d, $0a, $00
	lda #$02.b                                                  ; $f88c : $a9, $02
	sta $0028.w, X                                                  ; $f88e : $9d, $28, $00
	stz $000b.w, X                                                  ; $f891 : $9e, $0b, $00
	rep #ACCU_8                                                  ; $f894 : $c2, $20
	lda wPlayerEntity.x.w                                                  ; $f896 : $ad, $dd, $09
	sta $0005.w, X                                                  ; $f899 : $9d, $05, $00
	lda $09e0.w                                                  ; $f89c : $ad, $e0, $09
	sta $0008.w, X                                                  ; $f89f : $9d, $08, $00
	tdc                                                  ; $f8a2 : $7b
	sta $0038.w, X                                                  ; $f8a3 : $9d, $38, $00

br_13_f8a6:
	sep #ACCU_8|IDX_8                                                  ; $f8a6 : $e2, $30
	rts                                                  ; $f8a8 : $60


Call_13_f8a9:
	rep #IDX_8                                                  ; $f8a9 : $c2, $10
	jsr $02d8de.l                                                  ; $f8ab : $22, $de, $d8, $02
	bne br_13_f8e1                                                  ; $f8af : $d0, $30

	jsr Call_13_f949.w                                                  ; $f8b1 : $20, $49, $f9
	lda #$02.b                                                  ; $f8b4 : $a9, $02
	sta $000b.w, X                                                  ; $f8b6 : $9d, $0b, $00
	ldy #$0000.w                                                  ; $f8b9 : $a0, $00, $00
	lda $11                                                  ; $f8bc : $a5, $11
	bit #$40.b                                                  ; $f8be : $89, $40
	beq br_13_f8c5                                                  ; $f8c0 : $f0, $03

	ldy #$0002.w                                                  ; $f8c2 : $a0, $02, $00

br_13_f8c5:
	rep #ACCU_8|F_CARRY                                                  ; $f8c5 : $c2, $21
	stz $001c.w, X                                                  ; $f8c7 : $9e, $1c, $00
	lda $ed2a.w, Y                                                  ; $f8ca : $b9, $2a, $ed
	sta $001a.w, X                                                  ; $f8cd : $9d, $1a, $00
	lda $05                                                  ; $f8d0 : $a5, $05
	adc $ed22.w, Y                                                  ; $f8d2 : $79, $22, $ed
	sta $0005.w, X                                                  ; $f8d5 : $9d, $05, $00
	lda $08                                                  ; $f8d8 : $a5, $08
	sec                                                  ; $f8da : $38
	sbc #$000b.w                                                  ; $f8db : $e9, $0b, $00
	sta $0008.w, X                                                  ; $f8de : $9d, $08, $00

br_13_f8e1:
	sep #ACCU_8|IDX_8                                                  ; $f8e1 : $e2, $30
	rts                                                  ; $f8e3 : $60


Call_13_f8e4:
	rep #IDX_8                                                  ; $f8e4 : $c2, $10
	jsr $02d8de.l                                                  ; $f8e6 : $22, $de, $d8, $02
	bne br_13_f8e1                                                  ; $f8ea : $d0, $f5

	jsr Call_13_f949.w                                                  ; $f8ec : $20, $49, $f9
	lda #$02.b                                                  ; $f8ef : $a9, $02
	sta $000b.w, X                                                  ; $f8f1 : $9d, $0b, $00
	ldy #$0000.w                                                  ; $f8f4 : $a0, $00, $00
	lda $11                                                  ; $f8f7 : $a5, $11
	bit #$40.b                                                  ; $f8f9 : $89, $40
	beq br_13_f900                                                  ; $f8fb : $f0, $03

	ldy #$0002.w                                                  ; $f8fd : $a0, $02, $00

br_13_f900:
	rep #ACCU_8|F_CARRY                                                  ; $f900 : $c2, $21
	stz $001a.w, X                                                  ; $f902 : $9e, $1a, $00
	lda #$0300.w                                                  ; $f905 : $a9, $00, $03
	sta $001c.w, X                                                  ; $f908 : $9d, $1c, $00
	lda $05                                                  ; $f90b : $a5, $05
	adc $ed26.w, Y                                                  ; $f90d : $79, $26, $ed
	sta $0005.w, X                                                  ; $f910 : $9d, $05, $00
	lda $08                                                  ; $f913 : $a5, $08
	sec                                                  ; $f915 : $38
	sbc #$0013.w                                                  ; $f916 : $e9, $13, $00
	sta $0008.w, X                                                  ; $f919 : $9d, $08, $00
	bra br_13_f8e1                                                  ; $f91c : $80, $c3

Call_13_f91e:
	sep #ACCU_8                                                  ; $f91e : $e2, $20
	rep #IDX_8                                                  ; $f920 : $c2, $10
	jsr $02d8de.l                                                  ; $f922 : $22, $de, $d8, $02
	bne br_13_f946                                                  ; $f926 : $d0, $1e

	jsr Call_13_f949.w                                                  ; $f928 : $20, $49, $f9
	lda #$04.b                                                  ; $f92b : $a9, $04
	sta $000b.w, X                                                  ; $f92d : $9d, $0b, $00
	rep #ACCU_8                                                  ; $f930 : $c2, $20
	lda $05                                                  ; $f932 : $a5, $05
	sta $0005.w, X                                                  ; $f934 : $9d, $05, $00
	lda $08                                                  ; $f937 : $a5, $08
	sec                                                  ; $f939 : $38
	sbc #$0020.w                                                  ; $f93a : $e9, $20, $00
	sta $0008.w, X                                                  ; $f93d : $9d, $08, $00
	lda #$0200.w                                                  ; $f940 : $a9, $00, $02
	sta $001c.w, X                                                  ; $f943 : $9d, $1c, $00

br_13_f946:
	sep #ACCU_8|IDX_8                                                  ; $f946 : $e2, $30
	rts                                                  ; $f948 : $60


Call_13_f949:
	rep #IDX_8                                                  ; $f949 : $c2, $10
	inc $0000.w, X                                                  ; $f94b : $fe, $00, $00
	lda #$22.b                                                  ; $f94e : $a9, $22
	sta $000a.w, X                                                  ; $f950 : $9d, $0a, $00
	stz $0001.w, X                                                  ; $f953 : $9e, $01, $00
	lda $18                                                  ; $f956 : $a5, $18
	sta $0018.w, X                                                  ; $f958 : $9d, $18, $00
	lda #$02.b                                                  ; $f95b : $a9, $02
	sta $0028.w, X                                                  ; $f95d : $9d, $28, $00
	lda $16                                                  ; $f960 : $a5, $16
	ina                                                  ; $f962 : $1a
	sta $0016.w, X                                                  ; $f963 : $9d, $16, $00
	lda $11                                                  ; $f966 : $a5, $11
	ora $38                                                  ; $f968 : $05, $38
	clc                                                  ; $f96a : $18
	adc #$02.b                                                  ; $f96b : $69, $02
	sta $0011.w, X                                                  ; $f96d : $9d, $11, $00
	rep #ACCU_8                                                  ; $f970 : $c2, $20
	tdc                                                  ; $f972 : $7b
	sta $0038.w, X                                                  ; $f973 : $9d, $38, $00
	sep #ACCU_8                                                  ; $f976 : $e2, $20
	rts                                                  ; $f978 : $60


Call_13_f979:
	lda $09cc.w                                                  ; $f979 : $ad, $cc, $09
	and #$03.b                                                  ; $f97c : $29, $03
	bne br_13_f99d                                                  ; $f97e : $d0, $1d

	jsr Func_4_be35.l                                                  ; $f980 : $22, $35, $be, $04
	and #$03.b                                                  ; $f984 : $29, $03
	tay                                                  ; $f986 : $a8
	lda $ed2e.w, Y                                                  ; $f987 : $b9, $2e, $ed
	sta $0000.w                                                  ; $f98a : $8d, $00, $00
	rep #IDX_8                                                  ; $f98d : $c2, $10
	jsr $02d859.l                                                  ; $f98f : $22, $59, $d8, $02
	bne br_13_f99d                                                  ; $f993 : $d0, $08

	jsr Call_13_f9ca.w                                                  ; $f995 : $20, $ca, $f9
	lda #$2b.b                                                  ; $f998 : $a9, $2b
	sta $000a.w, X                                                  ; $f99a : $9d, $0a, $00

br_13_f99d:
	sep #ACCU_8|IDX_8                                                  ; $f99d : $e2, $30
	rts                                                  ; $f99f : $60


Call_13_f9a0:
	lda $09cc.w                                                  ; $f9a0 : $ad, $cc, $09
	and #$03.b                                                  ; $f9a3 : $29, $03
	bne br_13_f99d                                                  ; $f9a5 : $d0, $f6

	jsr Func_4_be35.l                                                  ; $f9a7 : $22, $35, $be, $04
	and #$03.b                                                  ; $f9ab : $29, $03
	tay                                                  ; $f9ad : $a8
	lda $ed2e.w, Y                                                  ; $f9ae : $b9, $2e, $ed
	sta $0000.w                                                  ; $f9b1 : $8d, $00, $00
	rep #IDX_8                                                  ; $f9b4 : $c2, $10
	jsr $02d859.l                                                  ; $f9b6 : $22, $59, $d8, $02
	bne br_13_f99d                                                  ; $f9ba : $d0, $e1

	jsr Call_13_f9ca.w                                                  ; $f9bc : $20, $ca, $f9
	lda #$23.b                                                  ; $f9bf : $a9, $23
	sta $000a.w, X                                                  ; $f9c1 : $9d, $0a, $00
	lda #$02.b                                                  ; $f9c4 : $a9, $02
	sta $000b.w, X                                                  ; $f9c6 : $9d, $0b, $00
	rts                                                  ; $f9c9 : $60


Call_13_f9ca:
	rep #IDX_8                                                  ; $f9ca : $c2, $10
	lda #$01.b                                                  ; $f9cc : $a9, $01
	sta $0000.w, X                                                  ; $f9ce : $9d, $00, $00
	lda $16                                                  ; $f9d1 : $a5, $16
	ina                                                  ; $f9d3 : $1a
	sta $0016.w, X                                                  ; $f9d4 : $9d, $16, $00
	lda #$02.b                                                  ; $f9d7 : $a9, $02
	sta $0012.w, X                                                  ; $f9d9 : $9d, $12, $00
	lda $0000.w                                                  ; $f9dc : $ad, $00, $00
	sta $000b.w, X                                                  ; $f9df : $9d, $0b, $00
	lda $18                                                  ; $f9e2 : $a5, $18
	sta $0018.w, X                                                  ; $f9e4 : $9d, $18, $00
	ldy #$ffe0.w                                                  ; $f9e7 : $a0, $e0, $ff
	lda $11                                                  ; $f9ea : $a5, $11
	ora $38                                                  ; $f9ec : $05, $38
	clc                                                  ; $f9ee : $18
	adc #$02.b                                                  ; $f9ef : $69, $02
	sta $0011.w, X                                                  ; $f9f1 : $9d, $11, $00
	bit #$40.b                                                  ; $f9f4 : $89, $40
	beq br_13_f9fb                                                  ; $f9f6 : $f0, $03

	ldy #$0020.w                                                  ; $f9f8 : $a0, $20, $00

br_13_f9fb:
	rep #ACCU_8                                                  ; $f9fb : $c2, $20
	stz $000c.w                                                  ; $f9fd : $9c, $0c, $00
	tya                                                  ; $fa00 : $98
	clc                                                  ; $fa01 : $18
	adc $05                                                  ; $fa02 : $65, $05
	sta $0005.w, X                                                  ; $fa04 : $9d, $05, $00
	lda $08                                                  ; $fa07 : $a5, $08
	clc                                                  ; $fa09 : $18
	adc #$0018.w                                                  ; $fa0a : $69, $18, $00
	sta $0008.w, X                                                  ; $fa0d : $9d, $08, $00
	sep #ACCU_8                                                  ; $fa10 : $e2, $20
	rts                                                  ; $fa12 : $60


Call_13_fa13:
	lda #$ff.b                                                  ; $fa13 : $a9, $ff
	sta $2126.w                                                  ; $fa15 : $8d, $26, $21
	stz $2127.w                                                  ; $fa18 : $9c, $27, $21
	lda #$80.b                                                  ; $fa1b : $a9, $80
	tsb $1f3f.w                                                  ; $fa1d : $0c, $3f, $1f
	lda #$22.b                                                  ; $fa20 : $a9, $22
	sta $00c5.w                                                  ; $fa22 : $8d, $c5, $00
	stz $00c6.w                                                  ; $fa25 : $9c, $c6, $00
	stz $00c8.w                                                  ; $fa28 : $9c, $c8, $00
	lda #$03.b                                                  ; $fa2b : $a9, $03
	sta $212e.w                                                  ; $fa2d : $8d, $2e, $21
	sta $1fa9.w                                                  ; $fa30 : $8d, $a9, $1f
	rep #ACCU_8|IDX_8                                                  ; $fa33 : $c2, $30
	phb                                                  ; $fa35 : $8b
	ldx #$ed32.w                                                  ; $fa36 : $a2, $32, $ed
	ldy #$08ed.w                                                  ; $fa39 : $a0, $ed, $08
	lda #$000d.w                                                  ; $fa3c : $a9, $0d, $00
	mvn $06, $00                                                  ; $fa3f : $54, $00, $06
	ldx #$ed40.w                                                  ; $fa42 : $a2, $40, $ed
	ldy #$e000.w                                                  ; $fa45 : $a0, $00, $e0
	lda #$0007.w                                                  ; $fa48 : $a9, $07, $00
	mvn $06, $7f                                                  ; $fa4b : $54, $7f, $06
	plb                                                  ; $fa4e : $ab
	ldx #$0072.w                                                  ; $fa4f : $a2, $72, $00

br_13_fa52:
	lda #$ffff.w                                                  ; $fa52 : $a9, $ff, $ff
	sta $7fe100.l, X                                                  ; $fa55 : $9f, $00, $e1, $7f
	ina                                                  ; $fa59 : $1a
	sta $7fe200.l, X                                                  ; $fa5a : $9f, $00, $e2, $7f
	dex                                                  ; $fa5e : $ca
	dex                                                  ; $fa5f : $ca
	bpl br_13_fa52                                                  ; $fa60 : $10, $f0

	stz $0300.w                                                  ; $fa62 : $9c, $00, $03
	sep #ACCU_8|IDX_8                                                  ; $fa65 : $e2, $30
	stz $08ed.w                                                  ; $fa67 : $9c, $ed, $08
	stz $08f4.w                                                  ; $fa6a : $9c, $f4, $08
	rts                                                  ; $fa6d : $60
