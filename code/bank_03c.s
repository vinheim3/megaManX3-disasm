.include "includes.s"
        
.bank $03c slot 3
.org $0


Call_3c_8000:
	cop $00.b                                                  ; $8000 : $02, $00

Jump_3c_8002:
	ora $1e00.w                                                  ; $8002 : $0d, $00, $1e
	.db $00                                                  ; $8005 : $00
	and $007f00.l, X                                                  ; $8006 : $3f, $00, $7f, $00
	adc $00bf00.l, X                                                  ; $800a : $7f, $00, $bf, $00
	eor $000200.l, X                                                  ; $800e : $5f, $00, $02, $00
	ora $0a1f00.l                                                  ; $8012 : $0f, $00, $1f, $0a
	and $3f7f0f.l, X                                                  ; $8016 : $3f, $0f, $7f, $3f
	adc $3fff1f.l, X                                                  ; $801a : $7f, $1f, $ff, $3f
	adc $00801f.l, X                                                  ; $801e : $7f, $1f, $80, $00
	rts                                                  ; $8022 : $60


	.db $00                                                  ; $8023 : $00
	beq br_3c_8026                                                  ; $8024 : $f0, $00

br_3c_8026:
	sed                                                  ; $8026 : $f8
	.db $00                                                  ; $8027 : $00
	jsr ($fc00.w, X)                                                  ; $8028 : $fc, $00, $fc
	.db $00                                                  ; $802b : $00
	plx                                                  ; $802c : $fa
	.db $00                                                  ; $802d : $00
	pea $8000.w                                                  ; $802e : $f4, $00, $80
	.db $00                                                  ; $8031 : $00
	cpx #$f000.w                                                  ; $8032 : $e0, $00, $f0
	ldy #$e0f8.w                                                  ; $8035 : $a0, $f8, $e0
	jsr ($fcf8.w, X)                                                  ; $8038 : $fc, $f8, $fc

br_3c_803b:
	beq br_3c_803b                                                  ; $803b : $f0, $fe

	sed                                                  ; $803d : $f8
	jsr ($00f0.w, X)                                                  ; $803e : $fc, $f0, $00
	.db $00                                                  ; $8041 : $00
	cop $00.b                                                  ; $8042 : $02, $00
	ora $001700.l                                                  ; $8044 : $0f, $00, $17, $00
	and $003f00.l                                                  ; $8048 : $2f, $00, $3f, $00
	adc $003f00.l, X                                                  ; $804c : $7f, $00, $3f, $00
	.db $00                                                  ; $8050 : $00
	.db $00                                                  ; $8051 : $00
	cop $00.b                                                  ; $8052 : $02, $00
	ora $031f02.l                                                  ; $8054 : $0f, $02, $1f, $03
	and $0f3f0f.l, X                                                  ; $8058 : $3f, $0f, $3f, $0f
	adc $1f3f3f.l, X                                                  ; $805c : $7f, $3f, $3f, $1f
	.db $00                                                  ; $8060 : $00
	.db $00                                                  ; $8061 : $00
	bra br_3c_8064                                                  ; $8062 : $80, $00

br_3c_8064:
	cpx #$d000.w                                                  ; $8064 : $e0, $00, $d0
	.db $00                                                  ; $8067 : $00
	inx                                                  ; $8068 : $e8
	.db $00                                                  ; $8069 : $00

br_3c_806a:
	sed                                                  ; $806a : $f8
	.db $00                                                  ; $806b : $00
	jsr ($f800.w, X)                                                  ; $806c : $fc, $00, $f8
	.db $00                                                  ; $806f : $00
	.db $00                                                  ; $8070 : $00

br_3c_8071:
	.db $00                                                  ; $8071 : $00
	bra br_3c_8074                                                  ; $8072 : $80, $00

br_3c_8074:
	cpx #$f080.w                                                  ; $8074 : $e0, $80, $f0
	bra br_3c_8071                                                  ; $8077 : $80, $f8

	cpx #$e0f8.w                                                  ; $8079 : $e0, $f8, $e0
	jsr ($f8f8.w, X)                                                  ; $807c : $fc, $f8, $f8
	beq br_3c_8081                                                  ; $807f : $f0, $00

br_3c_8081:
	.db $00                                                  ; $8081 : $00
	.db $00                                                  ; $8082 : $00
	.db $00                                                  ; $8083 : $00
	.db $00                                                  ; $8084 : $00
	.db $00                                                  ; $8085 : $00
	ora ($00, X)                                                  ; $8086 : $01, $00
	asl $00                                                  ; $8088 : $06, $00
	phd                                                  ; $808a : $0b
	.db $00                                                  ; $808b : $00
	ora [$00], Y                                                  ; $808c : $17, $00
	ora $000000.l, X                                                  ; $808e : $1f, $00, $00, $00
	.db $00                                                  ; $8092 : $00
	.db $00                                                  ; $8093 : $00
	.db $00                                                  ; $8094 : $00
	.db $00                                                  ; $8095 : $00
	ora ($00, X)                                                  ; $8096 : $01, $00
	ora [$00]                                                  ; $8098 : $07, $00
	ora $071f01.l                                                  ; $809a : $0f, $01, $1f, $07
	ora $000007.l, X                                                  ; $809e : $1f, $07, $00, $00
	.db $00                                                  ; $80a2 : $00
	.db $00                                                  ; $80a3 : $00
	.db $00                                                  ; $80a4 : $00
	.db $00                                                  ; $80a5 : $00
	.db $00                                                  ; $80a6 : $00
	.db $00                                                  ; $80a7 : $00
	cpy #$a000.w                                                  ; $80a8 : $c0, $00, $a0
	.db $00                                                  ; $80ab : $00
	bne br_3c_80ae                                                  ; $80ac : $d0, $00

br_3c_80ae:
	beq br_3c_80b0                                                  ; $80ae : $f0, $00

br_3c_80b0:
	.db $00                                                  ; $80b0 : $00
	.db $00                                                  ; $80b1 : $00
	.db $00                                                  ; $80b2 : $00
	.db $00                                                  ; $80b3 : $00
	.db $00                                                  ; $80b4 : $00
	.db $00                                                  ; $80b5 : $00
	.db $00                                                  ; $80b6 : $00
	.db $00                                                  ; $80b7 : $00
	cpy #$e000.w                                                  ; $80b8 : $c0, $00, $e0
	.db $00                                                  ; $80bb : $00
	.db $f0, $c0                                                  ; $80bc : $f0, $c0

	.db $f0, $c0                                                  ; $80be : $f0, $c0

	.db $00                                                  ; $80c0 : $00
	.db $00                                                  ; $80c1 : $00
	.db $00                                                  ; $80c2 : $00
	.db $00                                                  ; $80c3 : $00
	.db $00                                                  ; $80c4 : $00
	.db $00                                                  ; $80c5 : $00
	.db $00                                                  ; $80c6 : $00
	.db $00                                                  ; $80c7 : $00
	cop $02.b                                                  ; $80c8 : $02, $02
	ora #$0708.w                                                  ; $80ca : $09, $08, $07
	.db $00                                                  ; $80cd : $00
	ora $000000.l, X                                                  ; $80ce : $1f, $00, $00, $00
	.db $00                                                  ; $80d2 : $00
	.db $00                                                  ; $80d3 : $00
	.db $00                                                  ; $80d4 : $00
	.db $00                                                  ; $80d5 : $00
	.db $00                                                  ; $80d6 : $00
	.db $00                                                  ; $80d7 : $00
	ora $00, S                                                  ; $80d8 : $03, $00
	ora $070f01.l                                                  ; $80da : $0f, $01, $0f, $07
	ora $00000f.l, X                                                  ; $80de : $1f, $0f, $00, $00
	.db $00                                                  ; $80e2 : $00
	.db $00                                                  ; $80e3 : $00
	.db $00                                                  ; $80e4 : $00
	.db $00                                                  ; $80e5 : $00
	.db $00                                                  ; $80e6 : $00
	.db $00                                                  ; $80e7 : $00
	bra br_3c_806a                                                  ; $80e8 : $80, $80

	jsr $c020.w                                                  ; $80ea : $20, $20, $c0
	.db $00                                                  ; $80ed : $00
	bne br_3c_8100                                                  ; $80ee : $d0, $10

	.db $00                                                  ; $80f0 : $00
	.db $00                                                  ; $80f1 : $00
	.db $00                                                  ; $80f2 : $00
	.db $00                                                  ; $80f3 : $00
	.db $00                                                  ; $80f4 : $00
	.db $00                                                  ; $80f5 : $00
	.db $00                                                  ; $80f6 : $00
	.db $00                                                  ; $80f7 : $00
	bra br_3c_80fa                                                  ; $80f8 : $80, $00

br_3c_80fa:
	cpx #$e000.w                                                  ; $80fa : $e0, $00, $e0
	cpy #$c0f0.w                                                  ; $80fd : $c0, $f0, $c0

br_3c_8100:
	bit NMITIMEN.w, X                                                  ; $8100 : $3c, $00, $42
	.db $00                                                  ; $8103 : $00
	sta $bd00.w, Y                                                  ; $8104 : $99, $00, $bd
	.db $00                                                  ; $8107 : $00
	lda $9900.w, X                                                  ; $8108 : $bd, $00, $99
	.db $00                                                  ; $810b : $00
	wdm                                                  ; $810c : $42
	.db $00                                                  ; $810d : $00
	bit $3c00.w, X                                                  ; $810e : $3c, $00, $3c
	.db $00                                                  ; $8111 : $00
	ror $ff00.w, X                                                  ; $8112 : $7e, $00, $ff
	clc                                                  ; $8115 : $18
	sbc $3cff3c.l, X                                                  ; $8116 : $ff, $3c, $ff, $3c
	sbc $007e18.l, X                                                  ; $811a : $ff, $18, $7e, $00
	bit $0000.w, X                                                  ; $811e : $3c, $00, $00
	.db $00                                                  ; $8121 : $00
	bit $6600.w, X                                                  ; $8122 : $3c, $00, $66
	.db $00                                                  ; $8125 : $00
	phy                                                  ; $8126 : $5a
	.db $00                                                  ; $8127 : $00
	phy                                                  ; $8128 : $5a
	.db $00                                                  ; $8129 : $00
	ror $00                                                  ; $812a : $66, $00
	bit $0000.w, X                                                  ; $812c : $3c, $00, $00
	.db $00                                                  ; $812f : $00
	.db $00                                                  ; $8130 : $00
	.db $00                                                  ; $8131 : $00
	bit $7e00.w, X                                                  ; $8132 : $3c, $00, $7e
	.db $00                                                  ; $8135 : $00
	ror $7e18.w, X                                                  ; $8136 : $7e, $18, $7e
	clc                                                  ; $8139 : $18
	ror $3c00.w, X                                                  ; $813a : $7e, $00, $3c
	.db $00                                                  ; $813d : $00
	.db $00                                                  ; $813e : $00
	.db $00                                                  ; $813f : $00
	lda $007f00.l, X                                                  ; $8140 : $bf, $00, $7f, $00
	adc $003f00.l, X                                                  ; $8144 : $7f, $00, $3f, $00
	asl $0d00.w, X                                                  ; $8148 : $1e, $00, $0d
	.db $00                                                  ; $814b : $00
	cop $00.b                                                  ; $814c : $02, $00
	.db $00                                                  ; $814e : $00
	.db $00                                                  ; $814f : $00
	sbc $1f7f3f.l, X                                                  ; $8150 : $ff, $3f, $7f, $1f
	adc $0f3f3f.l, X                                                  ; $8154 : $7f, $3f, $3f, $0f
	ora $000f0a.l, X                                                  ; $8158 : $1f, $0a, $0f, $00
	cop $00.b                                                  ; $815c : $02, $00
	.db $00                                                  ; $815e : $00
	.db $00                                                  ; $815f : $00
	plx                                                  ; $8160 : $fa
	.db $00                                                  ; $8161 : $00
	jsr ($fc00.w, X)                                                  ; $8162 : $fc, $00, $fc
	.db $00                                                  ; $8165 : $00
	sed                                                  ; $8166 : $f8
	.db $00                                                  ; $8167 : $00
	beq br_3c_816a                                                  ; $8168 : $f0, $00

br_3c_816a:
	rts                                                  ; $816a : $60


	.db $00                                                  ; $816b : $00
	bra br_3c_816e                                                  ; $816c : $80, $00

br_3c_816e:
	.db $00                                                  ; $816e : $00
	.db $00                                                  ; $816f : $00
	inc $fcf8.w, X                                                  ; $8170 : $fe, $f8, $fc
	.db $f0, $fc                                                  ; $8173 : $f0, $fc

	sed                                                  ; $8175 : $f8
	sed                                                  ; $8176 : $f8
	cpx #$a0f0.w                                                  ; $8177 : $e0, $f0, $a0
	cpx #$8000.w                                                  ; $817a : $e0, $00, $80
	.db $00                                                  ; $817d : $00
	.db $00                                                  ; $817e : $00
	.db $00                                                  ; $817f : $00
	adc $003f00.l, X                                                  ; $8180 : $7f, $00, $3f, $00
	and $001700.l                                                  ; $8184 : $2f, $00, $17, $00
	ora $000200.l                                                  ; $8188 : $0f, $00, $02, $00
	.db $00                                                  ; $818c : $00
	.db $00                                                  ; $818d : $00
	.db $00                                                  ; $818e : $00
	.db $00                                                  ; $818f : $00
	adc $0f3f3f.l, X                                                  ; $8190 : $7f, $3f, $3f, $0f
	and $031f0f.l, X                                                  ; $8194 : $3f, $0f, $1f, $03
	ora $000202.l                                                  ; $8198 : $0f, $02, $02, $00
	.db $00                                                  ; $819c : $00
	.db $00                                                  ; $819d : $00
	.db $00                                                  ; $819e : $00
	.db $00                                                  ; $819f : $00
	jsr ($f800.w, X)                                                  ; $81a0 : $fc, $00, $f8
	.db $00                                                  ; $81a3 : $00
	inx                                                  ; $81a4 : $e8
	.db $00                                                  ; $81a5 : $00
	bne br_3c_81a8                                                  ; $81a6 : $d0, $00

br_3c_81a8:
	cpx #$8000.w                                                  ; $81a8 : $e0, $00, $80
	.db $00                                                  ; $81ab : $00
	.db $00                                                  ; $81ac : $00
	.db $00                                                  ; $81ad : $00
	.db $00                                                  ; $81ae : $00
	.db $00                                                  ; $81af : $00
	jsr ($f8f8.w, X)                                                  ; $81b0 : $fc, $f8, $f8
	cpx #$e0f8.w                                                  ; $81b3 : $e0, $f8, $e0

br_3c_81b6:
	.db $f0, $80                                                  ; $81b6 : $f0, $80

	cpx #$8080.w                                                  ; $81b8 : $e0, $80, $80
	.db $00                                                  ; $81bb : $00
	.db $00                                                  ; $81bc : $00
	.db $00                                                  ; $81bd : $00
	.db $00                                                  ; $81be : $00
	.db $00                                                  ; $81bf : $00
	and $001f00.l                                                  ; $81c0 : $2f, $00, $1f, $00
	ora [$00], Y                                                  ; $81c4 : $17, $00
	phd                                                  ; $81c6 : $0b
	.db $00                                                  ; $81c7 : $00
	asl $00                                                  ; $81c8 : $06, $00
	ora ($00, X)                                                  ; $81ca : $01, $00
	.db $00                                                  ; $81cc : $00
	.db $00                                                  ; $81cd : $00
	.db $00                                                  ; $81ce : $00
	.db $00                                                  ; $81cf : $00
	and $071f0f.l, X                                                  ; $81d0 : $3f, $0f, $1f, $07
	ora $010f07.l, X                                                  ; $81d4 : $1f, $07, $0f, $01
	ora [$00]                                                  ; $81d8 : $07, $00
	ora ($00, X)                                                  ; $81da : $01, $00
	.db $00                                                  ; $81dc : $00
	.db $00                                                  ; $81dd : $00
	.db $00                                                  ; $81de : $00
	.db $00                                                  ; $81df : $00
	inx                                                  ; $81e0 : $e8
	.db $00                                                  ; $81e1 : $00
	beq br_3c_81e4                                                  ; $81e2 : $f0, $00

br_3c_81e4:
	bne br_3c_81e6                                                  ; $81e4 : $d0, $00

br_3c_81e6:
	ldy #$c000.w                                                  ; $81e6 : $a0, $00, $c0
	.db $00                                                  ; $81e9 : $00
	.db $00                                                  ; $81ea : $00
	.db $00                                                  ; $81eb : $00
	.db $00                                                  ; $81ec : $00
	.db $00                                                  ; $81ed : $00
	.db $00                                                  ; $81ee : $00
	.db $00                                                  ; $81ef : $00
	sed                                                  ; $81f0 : $f8
	cpx #$c0f0.w                                                  ; $81f1 : $e0, $f0, $c0

br_3c_81f4:
	beq br_3c_81b6                                                  ; $81f4 : $f0, $c0

	cpx #$c000.w                                                  ; $81f6 : $e0, $00, $c0
	.db $00                                                  ; $81f9 : $00
	.db $00                                                  ; $81fa : $00
	.db $00                                                  ; $81fb : $00
	.db $00                                                  ; $81fc : $00
	.db $00                                                  ; $81fd : $00
	.db $00                                                  ; $81fe : $00
	.db $00                                                  ; $81ff : $00
	ora $001700.l                                                  ; $8200 : $0f, $00, $17, $00
	ora [$00]                                                  ; $8204 : $07, $00
	ora #$0208.w                                                  ; $8206 : $09, $08, $02
	.db $00                                                  ; $8209 : $00
	.db $00                                                  ; $820a : $00
	.db $00                                                  ; $820b : $00
	.db $00                                                  ; $820c : $00
	.db $00                                                  ; $820d : $00
	.db $00                                                  ; $820e : $00
	.db $00                                                  ; $820f : $00
	ora $071f0f.l, X                                                  ; $8210 : $1f, $0f, $1f, $07
	ora $010f07.l                                                  ; $8214 : $0f, $07, $0f, $01
	ora $00, S                                                  ; $8218 : $03, $00
	.db $00                                                  ; $821a : $00
	.db $00                                                  ; $821b : $00
	.db $00                                                  ; $821c : $00
	.db $00                                                  ; $821d : $00
	.db $00                                                  ; $821e : $00
	.db $00                                                  ; $821f : $00
	cpx #$d000.w                                                  ; $8220 : $e0, $00, $d0
	.db $10, $c0                                                  ; $8223 : $10, $c0

	.db $00                                                  ; $8225 : $00
	jsr $8020.w                                                  ; $8226 : $20, $20, $80
	.db $00                                                  ; $8229 : $00
	.db $00                                                  ; $822a : $00
	.db $00                                                  ; $822b : $00
	.db $00                                                  ; $822c : $00
	.db $00                                                  ; $822d : $00
	.db $00                                                  ; $822e : $00
	.db $00                                                  ; $822f : $00
	.db $f0, $e0                                                  ; $8230 : $f0, $e0

	beq br_3c_81f4                                                  ; $8232 : $f0, $c0

	cpx #$e0c0.w                                                  ; $8234 : $e0, $c0, $e0
	.db $00                                                  ; $8237 : $00
	bra br_3c_823a                                                  ; $8238 : $80, $00

br_3c_823a:
	.db $00                                                  ; $823a : $00
	.db $00                                                  ; $823b : $00
	.db $00                                                  ; $823c : $00
	.db $00                                                  ; $823d : $00
	.db $00                                                  ; $823e : $00
	.db $00                                                  ; $823f : $00
	sbc $ffffff.l, X                                                  ; $8240 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8244 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8248 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $824c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8250 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8254 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8258 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $825c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8260 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8264 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8268 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $826c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8270 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8274 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8278 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $827c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8280 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8284 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8288 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $828c : $ff, $ff, $ff, $ff

Call_3c_8290:
	sbc $ffffff.l, X                                                  ; $8290 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8294 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8298 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $829c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82a0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82a4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82a8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82ac : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82b0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82b4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82b8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82bc : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82c0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82c4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82c8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82cc : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82d0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82d4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82d8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82dc : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82e0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82e4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82e8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82ec : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82f0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82f4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82f8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $82fc : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8300 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8304 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8308 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $830c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8310 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8314 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8318 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $831c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8320 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8324 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8328 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $832c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8330 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8334 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8338 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $833c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8340 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8344 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8348 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $834c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8350 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8354 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8358 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $835c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8360 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8364 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8368 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $836c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8370 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8374 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8378 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $837c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8380 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8384 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8388 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $838c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8390 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8394 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $8398 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $839c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83a0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83a4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83a8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83ac : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83b0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83b4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83b8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83bc : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83c0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83c4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83c8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83cc : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83d0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83d4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83d8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83dc : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83e0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83e4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83e8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83ec : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83f0 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83f4 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83f8 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $83fc : $ff, $ff, $ff, $ff
	.db $00                                                  ; $8400 : $00
	.db $00                                                  ; $8401 : $00
	ora ($00, X)                                                  ; $8402 : $01, $00
	ora ($00, X)                                                  ; $8404 : $01, $00
	ora $060800.l                                                  ; $8406 : $0f, $00, $08, $06
	ora $02                                                  ; $840a : $05, $02
	rol $1b01.w, X                                                  ; $840c : $3e, $01, $1b
	tsb $0000.w                                                  ; $840f : $0c, $00, $00
	ora ($00, X)                                                  ; $8412 : $01, $00
	ora ($00, X)                                                  ; $8414 : $01, $00
	ora $000900.l                                                  ; $8416 : $0f, $00, $09, $00
	tsb $00                                                  ; $841a : $04, $00
	rol $1000.w, X                                                  ; $841c : $3e, $00, $10
	.db $00                                                  ; $841f : $00
	.db $00                                                  ; $8420 : $00
	.db $00                                                  ; $8421 : $00
	cpy $7e00.w                                                  ; $8422 : $cc, $00, $7e
	iny                                                  ; $8425 : $c8
	stp                                                  ; $8426 : $db
	bit $f5, X                                                  ; $8427 : $34, $f5
	asl $e679.w                                                  ; $8429 : $0e, $79, $e6
	sbc $00ff00.l, X                                                  ; $842c : $ff, $00, $ff, $00
	.db $00                                                  ; $8430 : $00
	.db $00                                                  ; $8431 : $00
	cpy $3200.w                                                  ; $8432 : $cc, $00, $32
	.db $00                                                  ; $8435 : $00
	bit #$c000.w                                                  ; $8436 : $89, $00, $c0
	.db $00                                                  ; $8439 : $00
	.db $00                                                  ; $843a : $00

br_3c_843b:
	.db $00                                                  ; $843b : $00
	.db $00                                                  ; $843c : $00
	.db $00                                                  ; $843d : $00
	.db $00                                                  ; $843e : $00
	.db $00                                                  ; $843f : $00
	rti                                                  ; $8440 : $40


	.db $00                                                  ; $8441 : $00
	ldy #$f040.w                                                  ; $8442 : $a0, $40, $f0
	jsr $20d8.w                                                  ; $8445 : $20, $d8, $20
	cpx $7c88.w                                                  ; $8448 : $ec, $88, $7c
	bcc br_3c_843b                                                  ; $844b : $90, $ee

	trb $fa                                                  ; $844d : $14, $fa
	tsb $40                                                  ; $844f : $04, $40
	.db $00                                                  ; $8451 : $00
	ldy #$9000.w                                                  ; $8452 : $a0, $00, $90
	.db $00                                                  ; $8455 : $00
	tya                                                  ; $8456 : $98
	.db $00                                                  ; $8457 : $00
	trb $00                                                  ; $8458 : $14, $00
	tsb $00                                                  ; $845a : $04, $00
	cop $00.b                                                  ; $845c : $02, $00
	cop $00.b                                                  ; $845e : $02, $00
	.db $00                                                  ; $8460 : $00
	.db $00                                                  ; $8461 : $00
	rol $20                                                  ; $8462 : $26, $20
	cop $03.b                                                  ; $8464 : $02, $03
	ora $878909.l, X                                                  ; $8466 : $1f, $09, $89, $87

br_3c_846a:
	and $306f06.l, X                                                  ; $846a : $3f, $06, $6f, $30
	tsc                                                  ; $846e : $3b
	tsb $00                                                  ; $846f : $04, $00
	.db $00                                                  ; $8471 : $00
	asl $00                                                  ; $8472 : $06, $00
	.db $00                                                  ; $8474 : $00
	.db $00                                                  ; $8475 : $00
	asl $00, X                                                  ; $8476 : $16, $00
	php                                                  ; $8478 : $08
	.db $00                                                  ; $8479 : $00
	sec                                                  ; $847a : $38
	.db $00                                                  ; $847b : $00
	rti                                                  ; $847c : $40


	.db $00                                                  ; $847d : $00
	sec                                                  ; $847e : $38
	.db $00                                                  ; $847f : $00
	.db $00                                                  ; $8480 : $00
	.db $00                                                  ; $8481 : $00
	pla                                                  ; $8482 : $68
	rti                                                  ; $8483 : $40


	pei ($28)                                                  ; $8484 : $d4, $28
	phy                                                  ; $8486 : $5a
	cpx wBG3HorizScroll+1                                                  ; $8487 : $e4, $be
	rti                                                  ; $8489 : $40


	sbc $02fd02.l, X                                                  ; $848a : $ff, $02, $fd, $02
	sbc $000000.l, X                                                  ; $848e : $ff, $00, $00, $00
	plp                                                  ; $8492 : $28
	.db $00                                                  ; $8493 : $00
	pei ($00)                                                  ; $8494 : $d4, $00
	asl                                                  ; $8496 : $0a
	.db $00                                                  ; $8497 : $00
	cop $00.b                                                  ; $8498 : $02, $00
	ora ($00, X)                                                  ; $849a : $01, $00
	ora ($00, X)                                                  ; $849c : $01, $00
	ora ($00, X)                                                  ; $849e : $01, $00
	.db $00                                                  ; $84a0 : $00
	.db $00                                                  ; $84a1 : $00
	.db $00                                                  ; $84a2 : $00
	.db $00                                                  ; $84a3 : $00
	.db $00                                                  ; $84a4 : $00
	bra br_3c_84bf                                                  ; $84a5 : $80, $18

	sed                                                  ; $84a7 : $f8
	ldy #$0260.w                                                  ; $84a8 : $a0, $60, $02
	rol $10                                                  ; $84ab : $26, $10
	php                                                  ; $84ad : $08
	.db $00                                                  ; $84ae : $00
	bpl br_3c_84b1                                                  ; $84af : $10, $00

br_3c_84b1:
	.db $00                                                  ; $84b1 : $00
	bra br_3c_84b4                                                  ; $84b2 : $80, $00

br_3c_84b4:
	sei                                                  ; $84b4 : $78
	.db $00                                                  ; $84b5 : $00
	ora [$00]                                                  ; $84b6 : $07, $00
	asl $c000.w, X                                                  ; $84b8 : $1e, $00, $c0
	.db $00                                                  ; $84bb : $00
	bit $00                                                  ; $84bc : $24, $00
	php                                                  ; $84be : $08

br_3c_84bf:
	.db $00                                                  ; $84bf : $00
	.db $00                                                  ; $84c0 : $00
	.db $00                                                  ; $84c1 : $00
	.db $00                                                  ; $84c2 : $00
	.db $00                                                  ; $84c3 : $00
	.db $00                                                  ; $84c4 : $00
	.db $00                                                  ; $84c5 : $00
	.db $00                                                  ; $84c6 : $00
	.db $00                                                  ; $84c7 : $00
	.db $00                                                  ; $84c8 : $00
	ora ($01, X)                                                  ; $84c9 : $01, $01
	cop $07.b                                                  ; $84cb : $02, $07
	tsb $03                                                  ; $84cd : $04, $03
	tsb $00                                                  ; $84cf : $04, $00
	.db $00                                                  ; $84d1 : $00
	.db $00                                                  ; $84d2 : $00
	.db $00                                                  ; $84d3 : $00
	.db $00                                                  ; $84d4 : $00
	.db $00                                                  ; $84d5 : $00
	ora ($00, X)                                                  ; $84d6 : $01, $00
	cop $00.b                                                  ; $84d8 : $02, $00
	tsb $00                                                  ; $84da : $04, $00
	php                                                  ; $84dc : $08
	.db $00                                                  ; $84dd : $00
	php                                                  ; $84de : $08
	.db $00                                                  ; $84df : $00
	.db $00                                                  ; $84e0 : $00
	.db $00                                                  ; $84e1 : $00
	.db $00                                                  ; $84e2 : $00
	.db $00                                                  ; $84e3 : $00
	pha                                                  ; $84e4 : $48
	pha                                                  ; $84e5 : $48
	bvc br_3c_846a                                                  ; $84e6 : $50, $82

	ldx $5a                                                  ; $84e8 : $a6, $5a
	inc $ff01.w, X                                                  ; $84ea : $fe, $01, $ff
	.db $00                                                  ; $84ed : $00
	sbc $000000.l, X                                                  ; $84ee : $ff, $00, $00, $00
	.db $00                                                  ; $84f2 : $00
	.db $00                                                  ; $84f3 : $00
	bcc br_3c_84f6                                                  ; $84f4 : $90, $00

br_3c_84f6:
	bit $0100.w                                                  ; $84f6 : $2c, $00, $01
	.db $00                                                  ; $84f9 : $00
	.db $00                                                  ; $84fa : $00
	.db $00                                                  ; $84fb : $00
	.db $00                                                  ; $84fc : $00
	.db $00                                                  ; $84fd : $00
	.db $00                                                  ; $84fe : $00
	.db $00                                                  ; $84ff : $00
	and $ef02.w, Y                                                  ; $8500 : $39, $02, $ef
	bmi br_3c_853c                                                  ; $8503 : $30, $37

	clc                                                  ; $8505 : $18
	ora $1d06.w, X                                                  ; $8506 : $1d, $06, $1d
	asl $37                                                  ; $8509 : $06, $37
	clc                                                  ; $850b : $18
	sbc $023930.l                                                  ; $850c : $ef, $30, $39, $02
	bit $c000.w, X                                                  ; $8510 : $3c, $00, $c0
	.db $00                                                  ; $8513 : $00
	jsr $1800.w                                                  ; $8514 : $20, $00, $18
	.db $00                                                  ; $8517 : $00
	clc                                                  ; $8518 : $18
	.db $00                                                  ; $8519 : $00
	jsr Call_3c_c000.w                                                  ; $851a : $20, $00, $c0
	.db $00                                                  ; $851d : $00
	bit $ff00.w, X                                                  ; $851e : $3c, $00, $ff
	.db $00                                                  ; $8521 : $00
	sbc $00ff00.l, X                                                  ; $8522 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $8526 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $852a : $ff, $00, $ff, $00
	sbc $000000.l, X                                                  ; $852e : $ff, $00, $00, $00
	.db $00                                                  ; $8532 : $00
	.db $00                                                  ; $8533 : $00
	.db $00                                                  ; $8534 : $00
	.db $00                                                  ; $8535 : $00
	.db $00                                                  ; $8536 : $00
	.db $00                                                  ; $8537 : $00
	.db $00                                                  ; $8538 : $00
	.db $00                                                  ; $8539 : $00
	.db $00                                                  ; $853a : $00
	.db $00                                                  ; $853b : $00

br_3c_853c:
	.db $00                                                  ; $853c : $00
	.db $00                                                  ; $853d : $00
	.db $00                                                  ; $853e : $00
	.db $00                                                  ; $853f : $00
	inc $fe00.w, X                                                  ; $8540 : $fe, $00, $fe
	cop $fc.b                                                  ; $8543 : $02, $fc
	cop $fc.b                                                  ; $8545 : $02, $fc
	cop $fc.b                                                  ; $8547 : $02, $fc
	cop $fc.b                                                  ; $8549 : $02, $fc
	cop $fe.b                                                  ; $854b : $02, $fe
	cop $fe.b                                                  ; $854d : $02, $fe
	.db $00                                                  ; $854f : $00
	cop $00.b                                                  ; $8550 : $02, $00
	ora ($00, X)                                                  ; $8552 : $01, $00
	ora ($00, X)                                                  ; $8554 : $01, $00
	ora ($00, X)                                                  ; $8556 : $01, $00
	ora ($00, X)                                                  ; $8558 : $01, $00
	ora ($00, X)                                                  ; $855a : $01, $00
	ora ($00, X)                                                  ; $855c : $01, $00
	cop $00.b                                                  ; $855e : $02, $00

Call_3c_8560:
	cop $03.b                                                  ; $8560 : $02, $03
	phd                                                  ; $8562 : $0b
	ora $302f.w                                                  ; $8563 : $0d, $2f, $30
	adc $407f40.l, X                                                  ; $8566 : $7f, $40, $7f, $40
	and $0d0b30.l                                                  ; $856a : $2f, $30, $0b, $0d
	cop $03.b                                                  ; $856e : $02, $03
	tsb $3000.w                                                  ; $8570 : $0c, $00, $30
	.db $00                                                  ; $8573 : $00
	rti                                                  ; $8574 : $40


	.db $00                                                  ; $8575 : $00
	bra br_3c_8578                                                  ; $8576 : $80, $00

br_3c_8578:
	bra br_3c_857a                                                  ; $8578 : $80, $00

br_3c_857a:
	rti                                                  ; $857a : $40


	.db $00                                                  ; $857b : $00
	bmi br_3c_857e                                                  ; $857c : $30, $00

br_3c_857e:
	tsb $2000.w                                                  ; $857e : $0c, $00, $20
	jsr $b858.w                                                  ; $8581 : $20, $58, $b8
	sed                                                  ; $8584 : $f8
	ora [$ff]                                                  ; $8585 : $07, $ff
	.db $00                                                  ; $8587 : $00
	sbc $07f800.l, X                                                  ; $8588 : $ff, $00, $f8, $07
	jmp $2020bc.l                                                  ; $858c : $5c, $bc, $20, $20


	cld                                                  ; $8590 : $d8
	.db $00                                                  ; $8591 : $00
	ora [$00]                                                  ; $8592 : $07, $00
	.db $00                                                  ; $8594 : $00
	.db $00                                                  ; $8595 : $00
	.db $00                                                  ; $8596 : $00
	.db $00                                                  ; $8597 : $00
	.db $00                                                  ; $8598 : $00
	.db $00                                                  ; $8599 : $00
	.db $00                                                  ; $859a : $00
	.db $00                                                  ; $859b : $00
	ora $00, S                                                  ; $859c : $03, $00
	jml [$0200.w]                                                  ; $859e : $dc, $00, $02


	tsb $10                                                  ; $85a1 : $04, $10
	ora $dc2c.w, Y                                                  ; $85a3 : $19, $2c, $dc
	jsr ($ff03.w, X)                                                  ; $85a6 : $fc, $03, $ff
	.db $00                                                  ; $85a9 : $00
	jsr ($00fc.w, X)                                                  ; $85aa : $fc, $fc, $00
	.db $00                                                  ; $85ad : $00
	.db $00                                                  ; $85ae : $00
	.db $00                                                  ; $85af : $00
	ora ($00, X)                                                  ; $85b0 : $01, $00
	cpx $00                                                  ; $85b2 : $e4, $00
	ora $00, S                                                  ; $85b4 : $03, $00
	.db $00                                                  ; $85b6 : $00
	.db $00                                                  ; $85b7 : $00
	.db $00                                                  ; $85b8 : $00
	.db $00                                                  ; $85b9 : $00
	ora $00, S                                                  ; $85ba : $03, $00
	jsr ($0000.w, X)                                                  ; $85bc : $fc, $00, $00
	.db $00                                                  ; $85bf : $00
	.db $00                                                  ; $85c0 : $00
	.db $00                                                  ; $85c1 : $00
	rts                                                  ; $85c2 : $60


	cpx #$07f8.w                                                  ; $85c3 : $e0, $f8, $07
	sbc $00ff01.l, X                                                  ; $85c6 : $ff, $01, $ff, $00
	sbc $fc0c7f.l, X                                                  ; $85ca : $ff, $7f, $0c, $fc
	.db $00                                                  ; $85ce : $00
	.db $00                                                  ; $85cf : $00
	cpx #$1f00.w                                                  ; $85d0 : $e0, $00, $1f
	.db $00                                                  ; $85d3 : $00
	.db $00                                                  ; $85d4 : $00
	.db $00                                                  ; $85d5 : $00
	.db $00                                                  ; $85d6 : $00
	.db $00                                                  ; $85d7 : $00
	.db $00                                                  ; $85d8 : $00
	.db $00                                                  ; $85d9 : $00
	.db $00                                                  ; $85da : $00
	.db $00                                                  ; $85db : $00
	.db $00                                                  ; $85dc : $00
	.db $00                                                  ; $85dd : $00
	beq br_3c_85e0                                                  ; $85de : $f0, $00

br_3c_85e0:
	.db $00                                                  ; $85e0 : $00
	.db $00                                                  ; $85e1 : $00
	.db $00                                                  ; $85e2 : $00
	.db $00                                                  ; $85e3 : $00
	.db $00                                                  ; $85e4 : $00
	cpy #$fefe.w                                                  ; $85e5 : $c0, $fe, $fe
	sbc $e0e000.l, X                                                  ; $85e8 : $ff, $00, $e0, $e0
	.db $00                                                  ; $85ec : $00
	.db $00                                                  ; $85ed : $00
	.db $00                                                  ; $85ee : $00
	.db $00                                                  ; $85ef : $00
	.db $00                                                  ; $85f0 : $00
	.db $00                                                  ; $85f1 : $00
	.db $00                                                  ; $85f2 : $00
	.db $00                                                  ; $85f3 : $00
	.db $00                                                  ; $85f4 : $00
	.db $00                                                  ; $85f5 : $00
	.db $00                                                  ; $85f6 : $00
	.db $00                                                  ; $85f7 : $00
	.db $00                                                  ; $85f8 : $00
	.db $00                                                  ; $85f9 : $00
	.db $00                                                  ; $85fa : $00
	.db $00                                                  ; $85fb : $00
	.db $00                                                  ; $85fc : $00
	.db $00                                                  ; $85fd : $00
	.db $00                                                  ; $85fe : $00
	.db $00                                                  ; $85ff : $00
	jsr $204118.l                                                  ; $8600 : $22, $18, $41, $20
	ora ($00, X)                                                  ; $8604 : $01, $00
	cpy #$b001.w                                                  ; $8606 : $c0, $01, $b0
	rti                                                  ; $8609 : $40


	rts                                                  ; $860a : $60


	cpx #$07f8.w                                                  ; $860b : $e0, $f8, $07
	sbc $000500.l, X                                                  ; $860e : $ff, $00, $05, $00
	cop $00.b                                                  ; $8612 : $02, $00
	.db $62                                                  ; $8614 : $62

	.db $00                                                  ; $8615 : $00
	cpx #$3000.w                                                  ; $8616 : $e0, $00, $30
	.db $00                                                  ; $8619 : $00
	ora $000000.l, X                                                  ; $861a : $1f, $00, $00, $00
	.db $00                                                  ; $861e : $00
	.db $00                                                  ; $861f : $00
	eor ($42, X)                                                  ; $8620 : $41, $42
	jsr $28203c.l                                                  ; $8622 : $22, $3c, $20, $28
	sty $0c, X                                                  ; $8626 : $94, $0c
	dec $82                                                  ; $8628 : $c6, $82
	jsr $90b000.l                                                  ; $862a : $22, $00, $b0, $90
	cmp $000000.l, X                                                  ; $862e : $df, $00, $00, $00
	.db $00                                                  ; $8632 : $00
	.db $00                                                  ; $8633 : $00
	.db $00                                                  ; $8634 : $00
	.db $00                                                  ; $8635 : $00
	bvc br_3c_8638                                                  ; $8636 : $50, $00

br_3c_8638:
	bit $00                                                  ; $8638 : $24, $00
	cmp ($00)                                                  ; $863a : $d2, $00
	eor $002000.l                                                  ; $863c : $4f, $00, $20, $00
	.db $00                                                  ; $8640 : $00
	.db $00                                                  ; $8641 : $00
	.db $00                                                  ; $8642 : $00
	.db $00                                                  ; $8643 : $00
	ora $00, S                                                  ; $8644 : $03, $00
	ora $013f00.l                                                  ; $8646 : $0f, $00, $3f, $01
	eor $40ff20.l, X                                                  ; $864a : $5f, $20, $ff, $40
	lda $000040.l, X                                                  ; $864e : $bf, $40, $00, $00
	.db $00                                                  ; $8652 : $00
	.db $00                                                  ; $8653 : $00
	ora $00, S                                                  ; $8654 : $03, $00
	tsb $3000.w                                                  ; $8656 : $0c, $00, $30
	.db $00                                                  ; $8659 : $00
	rti                                                  ; $865a : $40


	.db $00                                                  ; $865b : $00
	bra br_3c_865e                                                  ; $865c : $80, $00

br_3c_865e:
	bra br_3c_8660                                                  ; $865e : $80, $00

br_3c_8660:
	.db $00                                                  ; $8660 : $00
	.db $00                                                  ; $8661 : $00
	cpy #$ee00.w                                                  ; $8662 : $c0, $00, $ee
	and ($5b)                                                  ; $8665 : $32, $5b
	bit $00ff.w                                                  ; $8667 : $2c, $ff, $00
	jsr ($ff03.w, X)                                                  ; $866a : $fc, $03, $ff
	.db $00                                                  ; $866d : $00
	sbc $000000.l, X                                                  ; $866e : $ff, $00, $00, $00
	cpy #$4c00.w                                                  ; $8672 : $c0, $00, $4c
	.db $00                                                  ; $8675 : $00
	sta ($00, S), Y                                                  ; $8676 : $93, $00
	.db $00                                                  ; $8678 : $00
	.db $00                                                  ; $8679 : $00
	.db $00                                                  ; $867a : $00
	.db $00                                                  ; $867b : $00
	.db $00                                                  ; $867c : $00
	.db $00                                                  ; $867d : $00
	.db $00                                                  ; $867e : $00
	.db $00                                                  ; $867f : $00
	.db $00                                                  ; $8680 : $00
	.db $00                                                  ; $8681 : $00
	.db $00                                                  ; $8682 : $00
	.db $00                                                  ; $8683 : $00
	.db $00                                                  ; $8684 : $00
	.db $00                                                  ; $8685 : $00
	.db $00                                                  ; $8686 : $00
	.db $00                                                  ; $8687 : $00
	.db $00                                                  ; $8688 : $00
	.db $00                                                  ; $8689 : $00
	php                                                  ; $868a : $08
	php                                                  ; $868b : $08
	trb $3c18.w                                                  ; $868c : $1c, $18, $3c
	.db $00                                                  ; $868f : $00
	.db $00                                                  ; $8690 : $00
	.db $00                                                  ; $8691 : $00
	.db $00                                                  ; $8692 : $00
	.db $00                                                  ; $8693 : $00
	.db $00                                                  ; $8694 : $00
	.db $00                                                  ; $8695 : $00
	.db $00                                                  ; $8696 : $00
	.db $00                                                  ; $8697 : $00
	.db $00                                                  ; $8698 : $00
	.db $00                                                  ; $8699 : $00
	.db $00                                                  ; $869a : $00
	.db $00                                                  ; $869b : $00
	.db $00                                                  ; $869c : $00
	.db $00                                                  ; $869d : $00
	cop $00.b                                                  ; $869e : $02, $00
	.db $00                                                  ; $86a0 : $00
	.db $00                                                  ; $86a1 : $00
	.db $00                                                  ; $86a2 : $00
	.db $00                                                  ; $86a3 : $00
	ora ($00, X)                                                  ; $86a4 : $01, $00
	ora [$00]                                                  ; $86a6 : $07, $00
	asl $1900.w                                                  ; $86a8 : $0e, $00, $19
	ora ($34, X)                                                  ; $86ab : $01, $34
	ora [$3b]                                                  ; $86ad : $07, $3b
	tsb $0000.w                                                  ; $86af : $0c, $00, $00
	.db $00                                                  ; $86b2 : $00
	.db $00                                                  ; $86b3 : $00
	ora ($00, X)                                                  ; $86b4 : $01, $00
	ora [$00]                                                  ; $86b6 : $07, $00
	ora $001e00.l                                                  ; $86b8 : $0f, $00, $1e, $00
	sec                                                  ; $86bc : $38
	.db $00                                                  ; $86bd : $00
	bmi br_3c_86c0                                                  ; $86be : $30, $00

br_3c_86c0:
	.db $00                                                  ; $86c0 : $00
	.db $00                                                  ; $86c1 : $00
	.db $00                                                  ; $86c2 : $00
	.db $00                                                  ; $86c3 : $00
	sed                                                  ; $86c4 : $f8
	.db $00                                                  ; $86c5 : $00
	sbc $000000.l, X                                                  ; $86c6 : $ff, $00, $00, $00
	jsr ($f0fc.w, X)                                                  ; $86ca : $fc, $fc, $f0
	ora $0000ff.l                                                  ; $86cd : $0f, $ff, $00, $00
	.db $00                                                  ; $86d1 : $00
	.db $00                                                  ; $86d2 : $00
	.db $00                                                  ; $86d3 : $00
	sed                                                  ; $86d4 : $f8
	.db $00                                                  ; $86d5 : $00
	sbc $00ff00.l, X                                                  ; $86d6 : $ff, $00, $ff, $00
	ora $00, S                                                  ; $86da : $03, $00
	.db $00                                                  ; $86dc : $00
	.db $00                                                  ; $86dd : $00
	.db $00                                                  ; $86de : $00
	.db $00                                                  ; $86df : $00
	.db $00                                                  ; $86e0 : $00
	.db $00                                                  ; $86e1 : $00
	.db $00                                                  ; $86e2 : $00
	.db $00                                                  ; $86e3 : $00
	.db $00                                                  ; $86e4 : $00
	.db $00                                                  ; $86e5 : $00
	beq br_3c_86e8                                                  ; $86e6 : $f0, $00

br_3c_86e8:
	.db $00                                                  ; $86e8 : $00
	.db $00                                                  ; $86e9 : $00
	sbc $e06000.l, X                                                  ; $86ea : $ff, $00, $60, $e0
	sbc $000000.l, X                                                  ; $86ee : $ff, $00, $00, $00
	.db $00                                                  ; $86f2 : $00
	.db $00                                                  ; $86f3 : $00
	.db $00                                                  ; $86f4 : $00
	.db $00                                                  ; $86f5 : $00
	beq br_3c_86f8                                                  ; $86f6 : $f0, $00

br_3c_86f8:
	jsr ($ff00.w, X)                                                  ; $86f8 : $fc, $00, $ff
	.db $00                                                  ; $86fb : $00
	ora $000000.l, X                                                  ; $86fc : $1f, $00, $00, $00
	sbc $06f900.l, X                                                  ; $8700 : $ff, $00, $f9, $06
	adc $e2, S                                                  ; $8704 : $63, $e2
	jsr $10e0.w                                                  ; $8706 : $20, $e0, $10
	.db $00                                                  ; $8709 : $00

br_3c_870a:
	cli                                                  ; $870a : $58
	.db $00                                                  ; $870b : $00
	tsb $0401.w                                                  ; $870c : $0c, $01, $04
	asl $00                                                  ; $870f : $06, $00
	.db $00                                                  ; $8711 : $00
	.db $00                                                  ; $8712 : $00
	.db $00                                                  ; $8713 : $00
	trb $1100.w                                                  ; $8714 : $1c, $00, $11
	.db $00                                                  ; $8717 : $00
	beq br_3c_871a                                                  ; $8718 : $f0, $00

br_3c_871a:
	pha                                                  ; $871a : $48
	.db $00                                                  ; $871b : $00
	bpl br_3c_871e                                                  ; $871c : $10, $00

br_3c_871e:
	.db $00                                                  ; $871e : $00
	.db $00                                                  ; $871f : $00
	jsr ($8000.w, X)                                                  ; $8720 : $fc, $00, $80
	sbc $820201.l, X                                                  ; $8723 : $ff, $01, $02, $82
	tsb $00                                                  ; $8727 : $04, $00
	eor #$4028.w                                                  ; $8729 : $49, $28, $40
	jsr $0090.w                                                  ; $872c : $20, $90, $00
	jsr $0003.w                                                  ; $872f : $20, $03, $00
	.db $00                                                  ; $8732 : $00
	.db $00                                                  ; $8733 : $00
	jsr ($0100.w, X)                                                  ; $8734 : $fc, $00, $01
	.db $00                                                  ; $8737 : $00
	stx $00                                                  ; $8738 : $86, $00
	.db $00                                                  ; $873a : $00
	.db $00                                                  ; $873b : $00
	pha                                                  ; $873c : $48
	.db $00                                                  ; $873d : $00
	bpl br_3c_8740                                                  ; $873e : $10, $00

br_3c_8740:
	bra br_3c_8742                                                  ; $8740 : $80, $00

br_3c_8742:
	.db $00                                                  ; $8742 : $00
	cpy #$6000.w                                                  ; $8743 : $c0, $00, $60
	php                                                  ; $8746 : $08
	sec                                                  ; $8747 : $38
	tsb $04                                                  ; $8748 : $04, $04
	.db $00                                                  ; $874a : $00
	.db $00                                                  ; $874b : $00

br_3c_874c:
	.db $00                                                  ; $874c : $00
	.db $00                                                  ; $874d : $00
	asl $00fe.w, X                                                  ; $874e : $1e, $fe, $00
	.db $00                                                  ; $8751 : $00
	.db $00                                                  ; $8752 : $00
	.db $00                                                  ; $8753 : $00
	.db $00                                                  ; $8754 : $00
	.db $00                                                  ; $8755 : $00
	.db $00                                                  ; $8756 : $00
	.db $00                                                  ; $8757 : $00
	.db $00                                                  ; $8758 : $00
	.db $00                                                  ; $8759 : $00
	.db $00                                                  ; $875a : $00
	.db $00                                                  ; $875b : $00
	cpy #$0100.w                                                  ; $875c : $c0, $00, $01
	.db $00                                                  ; $875f : $00
	.db $00                                                  ; $8760 : $00
	.db $00                                                  ; $8761 : $00
	sec                                                  ; $8762 : $38
	sed                                                  ; $8763 : $f8
	.db $00                                                  ; $8764 : $00

br_3c_8765:
	.db $00                                                  ; $8765 : $00
	bpl br_3c_8778                                                  ; $8766 : $10, $10

	bra br_3c_870a                                                  ; $8768 : $80, $a0

	bra br_3c_874c                                                  ; $876a : $80, $e0

	rti                                                  ; $876c : $40


	rti                                                  ; $876d : $40


	.db $00                                                  ; $876e : $00
	.db $00                                                  ; $876f : $00
	beq br_3c_8772                                                  ; $8770 : $f0, $00

br_3c_8772:
	tsb $00                                                  ; $8772 : $04, $00
	bra br_3c_8776                                                  ; $8774 : $80, $00

br_3c_8776:
	.db $00                                                  ; $8776 : $00
	.db $00                                                  ; $8777 : $00

br_3c_8778:
	bpl br_3c_877a                                                  ; $8778 : $10, $00

br_3c_877a:
	.db $00                                                  ; $877a : $00
	.db $00                                                  ; $877b : $00
	.db $00                                                  ; $877c : $00
	.db $00                                                  ; $877d : $00
	.db $00                                                  ; $877e : $00
	.db $00                                                  ; $877f : $00
	.db $00                                                  ; $8780 : $00
	.db $00                                                  ; $8781 : $00
	bra br_3c_8784                                                  ; $8782 : $80, $00

br_3c_8784:
	adc $fe0e00.l, X                                                  ; $8784 : $7f, $00, $0e, $fe
	sbc ($0f), Y                                                  ; $8788 : $f1, $0f
	ora [$00]                                                  ; $878a : $07, $00
	sed                                                  ; $878c : $f8
	.db $00                                                  ; $878d : $00
	.db $00                                                  ; $878e : $00
	.db $00                                                  ; $878f : $00
	.db $00                                                  ; $8790 : $00
	.db $00                                                  ; $8791 : $00
	bra br_3c_8794                                                  ; $8792 : $80, $00

br_3c_8794:
	sbc $000100.l, X                                                  ; $8794 : $ff, $00, $01, $00
	.db $00                                                  ; $8798 : $00
	.db $00                                                  ; $8799 : $00
	sbc $00f800.l, X                                                  ; $879a : $ff, $00, $f8, $00
	.db $00                                                  ; $879e : $00
	.db $00                                                  ; $879f : $00
	.db $00                                                  ; $87a0 : $00
	.db $00                                                  ; $87a1 : $00
	.db $00                                                  ; $87a2 : $00
	.db $00                                                  ; $87a3 : $00
	cpy #$0700.w                                                  ; $87a4 : $c0, $00, $07
	.db $00                                                  ; $87a7 : $00
	.db $f0, $80                                                  ; $87a8 : $f0, $80

	jsr ($0000.w, X)                                                  ; $87aa : $fc, $00, $00
	.db $00                                                  ; $87ad : $00
	.db $00                                                  ; $87ae : $00
	.db $00                                                  ; $87af : $00
	.db $00                                                  ; $87b0 : $00
	.db $00                                                  ; $87b1 : $00
	.db $00                                                  ; $87b2 : $00
	.db $00                                                  ; $87b3 : $00
	cpy #$ff00.w                                                  ; $87b4 : $c0, $00, $ff
	.db $00                                                  ; $87b7 : $00
	bvs br_3c_87ba                                                  ; $87b8 : $70, $00

br_3c_87ba:
	jsr ($0000.w, X)                                                  ; $87ba : $fc, $00, $00
	.db $00                                                  ; $87bd : $00
	.db $00                                                  ; $87be : $00
	.db $00                                                  ; $87bf : $00
	.db $00                                                  ; $87c0 : $00
	ora ($01, X)                                                  ; $87c1 : $01, $01
	cop $84.b                                                  ; $87c3 : $02, $84
	asl $f8                                                  ; $87c5 : $06, $f8
	php                                                  ; $87c7 : $08
	and $03fdf0.l, X                                                  ; $87c8 : $3f, $f0, $fd, $03
	sbc $01fe00.l, X                                                  ; $87cc : $ff, $00, $fe, $01
	.db $00                                                  ; $87d0 : $00
	.db $00                                                  ; $87d1 : $00
	.db $00                                                  ; $87d2 : $00
	.db $00                                                  ; $87d3 : $00
	bra br_3c_87d6                                                  ; $87d4 : $80, $00

br_3c_87d6:
	beq br_3c_87d8                                                  ; $87d6 : $f0, $00

br_3c_87d8:
	ora $000000.l                                                  ; $87d8 : $0f, $00, $00, $00
	.db $00                                                  ; $87dc : $00
	.db $00                                                  ; $87dd : $00
	.db $00                                                  ; $87de : $00
	.db $00                                                  ; $87df : $00
	.db $00                                                  ; $87e0 : $00
	.db $00                                                  ; $87e1 : $00
	.db $00                                                  ; $87e2 : $00
	bra br_3c_8765                                                  ; $87e3 : $80, $80

	.db $00                                                  ; $87e5 : $00
	adc $60, S                                                  ; $87e6 : $63, $60
	clc                                                  ; $87e8 : $18
	clc                                                  ; $87e9 : $18
	inc $f300.w, X                                                  ; $87ea : $fe, $00, $f3
	ora $00807f.l                                                  ; $87ed : $0f, $7f, $80, $00
	.db $00                                                  ; $87f1 : $00
	.db $00                                                  ; $87f2 : $00
	.db $00                                                  ; $87f3 : $00
	.db $00                                                  ; $87f4 : $00
	.db $00                                                  ; $87f5 : $00
	ora $00, S                                                  ; $87f6 : $03, $00
	.db $00                                                  ; $87f8 : $00
	.db $00                                                  ; $87f9 : $00
	inc $0000.w, X                                                  ; $87fa : $fe, $00, $00
	.db $00                                                  ; $87fd : $00
	adc $000100.l, X                                                  ; $87fe : $7f, $00, $01, $00
	ora $00, S                                                  ; $8802 : $03, $00
	ora [$00]                                                  ; $8804 : $07, $00
	ora $040b04.l                                                  ; $8806 : $0f, $04, $0b, $04
	ora $081708.l, X                                                  ; $880a : $1f, $08, $17, $08
	ora [$08], Y                                                  ; $880e : $17, $08
	ora ($00, X)                                                  ; $8810 : $01, $00
	cop $00.b                                                  ; $8812 : $02, $00
	tsb $00                                                  ; $8814 : $04, $00
	php                                                  ; $8816 : $08
	.db $00                                                  ; $8817 : $00
	php                                                  ; $8818 : $08
	.db $00                                                  ; $8819 : $00
	bpl br_3c_881c                                                  ; $881a : $10, $00

br_3c_881c:
	bpl br_3c_881e                                                  ; $881c : $10, $00

br_3c_881e:
	bpl br_3c_8820                                                  ; $881e : $10, $00

br_3c_8820:
	asl                                                  ; $8820 : $0a
	ldx $ff, Y                                                  ; $8821 : $b6, $ff
	sty $7f, X                                                  ; $8823 : $94, $7f
	ora ($fb, X)                                                  ; $8825 : $01, $fb
	asl $ff                                                  ; $8827 : $06, $ff
	.db $00                                                  ; $8829 : $00
	sbc $00ff00.l, X                                                  ; $882a : $ff, $00, $ff, $00
	sbc $000800.l, X                                                  ; $882e : $ff, $00, $08, $00
	eor $00, S                                                  ; $8832 : $43, $00
	bra br_3c_8836                                                  ; $8834 : $80, $00

br_3c_8836:
	ora ($00, X)                                                  ; $8836 : $01, $00
	.db $00                                                  ; $8838 : $00
	.db $00                                                  ; $8839 : $00
	.db $00                                                  ; $883a : $00
	.db $00                                                  ; $883b : $00
	.db $00                                                  ; $883c : $00
	.db $00                                                  ; $883d : $00
	.db $00                                                  ; $883e : $00
	.db $00                                                  ; $883f : $00
	.db $00                                                  ; $8840 : $00
	.db $00                                                  ; $8841 : $00
	.db $00                                                  ; $8842 : $00
	.db $00                                                  ; $8843 : $00
	.db $00                                                  ; $8844 : $00
	.db $00                                                  ; $8845 : $00
	.db $00                                                  ; $8846 : $00
	.db $00                                                  ; $8847 : $00
	.db $00                                                  ; $8848 : $00
	.db $00                                                  ; $8849 : $00
	tsb $04                                                  ; $884a : $04, $04
	.db $00                                                  ; $884c : $00
	php                                                  ; $884d : $08
	ora $11, S                                                  ; $884e : $03, $11
	.db $00                                                  ; $8850 : $00
	.db $00                                                  ; $8851 : $00
	.db $00                                                  ; $8852 : $00
	.db $00                                                  ; $8853 : $00
	.db $00                                                  ; $8854 : $00
	.db $00                                                  ; $8855 : $00
	.db $00                                                  ; $8856 : $00
	.db $00                                                  ; $8857 : $00
	.db $00                                                  ; $8858 : $00
	.db $00                                                  ; $8859 : $00
	.db $00                                                  ; $885a : $00
	.db $00                                                  ; $885b : $00
	.db $00                                                  ; $885c : $00
	.db $00                                                  ; $885d : $00
	cop $00.b                                                  ; $885e : $02, $00
	.db $00                                                  ; $8860 : $00
	.db $00                                                  ; $8861 : $00
	cpy #$1880.w                                                  ; $8862 : $c0, $80, $18
	clc                                                  ; $8865 : $18
	bit $04                                                  ; $8866 : $24, $04
	.db $00                                                  ; $8868 : $00
	.db $00                                                  ; $8869 : $00
	inc $e0fc.w, X                                                  ; $886a : $fe, $fc, $e0
	.db $00                                                  ; $886d : $00
	bra br_3c_8870                                                  ; $886e : $80, $00

br_3c_8870:
	.db $00                                                  ; $8870 : $00
	.db $00                                                  ; $8871 : $00
	rti                                                  ; $8872 : $40


	.db $00                                                  ; $8873 : $00
	.db $00                                                  ; $8874 : $00
	.db $00                                                  ; $8875 : $00
	jsr $0000.w                                                  ; $8876 : $20, $00, $00
	.db $00                                                  ; $8879 : $00
	cop $00.b                                                  ; $887a : $02, $00
	cpx #$8000.w                                                  ; $887c : $e0, $00, $80
	.db $00                                                  ; $887f : $00
	sbc $01ff00.l, X                                                  ; $8880 : $ff, $00, $ff, $01
	cmp $f33d3e.l                                                  ; $8884 : $cf, $3e, $3d, $f3
	plx                                                  ; $8888 : $fa
	asl $84                                                  ; $8889 : $06, $84
	php                                                  ; $888b : $08
	php                                                  ; $888c : $08
	.db $00                                                  ; $888d : $00
	.db $00                                                  ; $888e : $00
	ora ($00, X)                                                  ; $888f : $01, $00
	.db $00                                                  ; $8891 : $00
	.db $00                                                  ; $8892 : $00
	.db $00                                                  ; $8893 : $00
	ora ($00, X)                                                  ; $8894 : $01, $00
	tsb $f800.w                                                  ; $8896 : $0c, $00, $f8
	.db $00                                                  ; $8899 : $00
	sty $00                                                  ; $889a : $84, $00
	php                                                  ; $889c : $08
	.db $00                                                  ; $889d : $00
	.db $00                                                  ; $889e : $00
	.db $00                                                  ; $889f : $00
	sbc ($0f, S), Y                                                  ; $88a0 : $f3, $0f
	sbc $00f0f0.l, X                                                  ; $88a2 : $ff, $f0, $f0, $00
	sta [$06]                                                  ; $88a6 : $87, $06
	cpy #$2008.w                                                  ; $88a8 : $c0, $08, $20
	bpl br_3c_88ad                                                  ; $88ab : $10, $00

br_3c_88ad:
	.db $00                                                  ; $88ad : $00
	.db $00                                                  ; $88ae : $00
	tsb $0000.w                                                  ; $88af : $0c, $00, $00
	ora $00f000.l                                                  ; $88b2 : $0f, $00, $f0, $00
	sta ($00, X)                                                  ; $88b6 : $81, $00
	cpy #$2000.w                                                  ; $88b8 : $c0, $00, $20
	.db $00                                                  ; $88bb : $00
	.db $00                                                  ; $88bc : $00
	.db $00                                                  ; $88bd : $00
	.db $00                                                  ; $88be : $00
	.db $00                                                  ; $88bf : $00
	.db $00                                                  ; $88c0 : $00
	.db $00                                                  ; $88c1 : $00
	.db $00                                                  ; $88c2 : $00
	.db $00                                                  ; $88c3 : $00
	.db $00                                                  ; $88c4 : $00
	.db $00                                                  ; $88c5 : $00
	.db $00                                                  ; $88c6 : $00
	.db $00                                                  ; $88c7 : $00
	.db $00                                                  ; $88c8 : $00
	.db $00                                                  ; $88c9 : $00
	.db $00                                                  ; $88ca : $00
	.db $00                                                  ; $88cb : $00
	.db $00                                                  ; $88cc : $00
	.db $00                                                  ; $88cd : $00
	.db $00                                                  ; $88ce : $00
	.db $00                                                  ; $88cf : $00
	.db $00                                                  ; $88d0 : $00
	.db $00                                                  ; $88d1 : $00
	.db $00                                                  ; $88d2 : $00
	.db $00                                                  ; $88d3 : $00
	.db $00                                                  ; $88d4 : $00
	.db $00                                                  ; $88d5 : $00
	.db $00                                                  ; $88d6 : $00
	.db $00                                                  ; $88d7 : $00
	.db $00                                                  ; $88d8 : $00
	.db $00                                                  ; $88d9 : $00
	.db $00                                                  ; $88da : $00
	.db $00                                                  ; $88db : $00
	.db $00                                                  ; $88dc : $00
	.db $00                                                  ; $88dd : $00
	.db $00                                                  ; $88de : $00
	.db $00                                                  ; $88df : $00
	.db $00                                                  ; $88e0 : $00
	.db $00                                                  ; $88e1 : $00
	.db $00                                                  ; $88e2 : $00
	.db $00                                                  ; $88e3 : $00
	.db $00                                                  ; $88e4 : $00
	.db $00                                                  ; $88e5 : $00
	.db $00                                                  ; $88e6 : $00
	.db $00                                                  ; $88e7 : $00
	.db $00                                                  ; $88e8 : $00
	.db $00                                                  ; $88e9 : $00
	tsb $07                                                  ; $88ea : $04, $07
	ora [$18], Y                                                  ; $88ec : $17, $18
	adc $000040.l, X                                                  ; $88ee : $7f, $40, $00, $00
	.db $00                                                  ; $88f2 : $00
	.db $00                                                  ; $88f3 : $00
	.db $00                                                  ; $88f4 : $00
	.db $00                                                  ; $88f5 : $00
	.db $00                                                  ; $88f6 : $00
	.db $00                                                  ; $88f7 : $00
	ora [$00]                                                  ; $88f8 : $07, $00
	clc                                                  ; $88fa : $18
	.db $00                                                  ; $88fb : $00
	rts                                                  ; $88fc : $60


	.db $00                                                  ; $88fd : $00
	bra br_3c_8900                                                  ; $88fe : $80, $00

br_3c_8900:
	.db $00                                                  ; $8900 : $00
	.db $00                                                  ; $8901 : $00
	tsb $07                                                  ; $8902 : $04, $07
	bpl br_3c_8925                                                  ; $8904 : $10, $1f

	and $3f, S                                                  ; $8906 : $23, $3f
	tsb $3f                                                  ; $8908 : $04, $3f
	eor $781778.l                                                  ; $890a : $4f, $78, $17, $78
	ora [$78], Y                                                  ; $890e : $17, $78
	ora [$00]                                                  ; $8910 : $07, $00
	clc                                                  ; $8912 : $18
	.db $00                                                  ; $8913 : $00
	jsr $4000.w                                                  ; $8914 : $20, $00, $40
	.db $00                                                  ; $8917 : $00
	rti                                                  ; $8918 : $40


	.db $00                                                  ; $8919 : $00
	bra br_3c_891c                                                  ; $891a : $80, $00

br_3c_891c:
	bra br_3c_891e                                                  ; $891c : $80, $00

br_3c_891e:
	bra br_3c_8920                                                  ; $891e : $80, $00

br_3c_8920:
	.db $00                                                  ; $8920 : $00
	.db $00                                                  ; $8921 : $00
	.db $00                                                  ; $8922 : $00
	.db $00                                                  ; $8923 : $00
	.db $00                                                  ; $8924 : $00

br_3c_8925:
	.db $00                                                  ; $8925 : $00
	.db $00                                                  ; $8926 : $00
	.db $00                                                  ; $8927 : $00
	.db $00                                                  ; $8928 : $00
	.db $00                                                  ; $8929 : $00
	ora $073700.l                                                  ; $892a : $0f, $00, $37, $07
	.db $50, $1f                                                  ; $892e : $50, $1f

	.db $00                                                  ; $8930 : $00
	.db $00                                                  ; $8931 : $00
	.db $00                                                  ; $8932 : $00
	.db $00                                                  ; $8933 : $00
	.db $00                                                  ; $8934 : $00
	.db $00                                                  ; $8935 : $00
	.db $00                                                  ; $8936 : $00
	.db $00                                                  ; $8937 : $00
	.db $00                                                  ; $8938 : $00
	.db $00                                                  ; $8939 : $00
	ora $003800.l                                                  ; $893a : $0f, $00, $38, $00
	rts                                                  ; $893e : $60


	.db $00                                                  ; $893f : $00
	.db $00                                                  ; $8940 : $00
	.db $00                                                  ; $8941 : $00
	.db $00                                                  ; $8942 : $00
	.db $00                                                  ; $8943 : $00
	.db $00                                                  ; $8944 : $00
	.db $00                                                  ; $8945 : $00
	.db $00                                                  ; $8946 : $00
	.db $00                                                  ; $8947 : $00
	.db $00                                                  ; $8948 : $00
	.db $00                                                  ; $8949 : $00
	.db $00                                                  ; $894a : $00
	.db $00                                                  ; $894b : $00
	.db $00                                                  ; $894c : $00
	.db $00                                                  ; $894d : $00
	ora ($00, X)                                                  ; $894e : $01, $00
	.db $00                                                  ; $8950 : $00
	.db $00                                                  ; $8951 : $00
	.db $00                                                  ; $8952 : $00
	.db $00                                                  ; $8953 : $00
	.db $00                                                  ; $8954 : $00
	.db $00                                                  ; $8955 : $00
	.db $00                                                  ; $8956 : $00
	.db $00                                                  ; $8957 : $00
	.db $00                                                  ; $8958 : $00
	.db $00                                                  ; $8959 : $00
	.db $00                                                  ; $895a : $00
	.db $00                                                  ; $895b : $00
	.db $00                                                  ; $895c : $00
	.db $00                                                  ; $895d : $00
	ora ($00, X)                                                  ; $895e : $01, $00
	.db $00                                                  ; $8960 : $00
	.db $00                                                  ; $8961 : $00
	.db $00                                                  ; $8962 : $00
	.db $00                                                  ; $8963 : $00
	.db $00                                                  ; $8964 : $00
	.db $00                                                  ; $8965 : $00
	.db $00                                                  ; $8966 : $00
	.db $00                                                  ; $8967 : $00
	ora $076700.l, X                                                  ; $8968 : $1f, $00, $67, $07
	tya                                                  ; $896c : $98
	clc                                                  ; $896d : $18
	rti                                                  ; $896e : $40


	rti                                                  ; $896f : $40


	.db $00                                                  ; $8970 : $00
	.db $00                                                  ; $8971 : $00
	.db $00                                                  ; $8972 : $00
	.db $00                                                  ; $8973 : $00
	.db $00                                                  ; $8974 : $00
	.db $00                                                  ; $8975 : $00
	.db $00                                                  ; $8976 : $00
	.db $00                                                  ; $8977 : $00
	ora $007800.l, X                                                  ; $8978 : $1f, $00, $78, $00
	cpx #$8000.w                                                  ; $897c : $e0, $00, $80
	.db $00                                                  ; $897f : $00
	.db $00                                                  ; $8980 : $00
	.db $00                                                  ; $8981 : $00
	.db $00                                                  ; $8982 : $00
	.db $00                                                  ; $8983 : $00
	.db $00                                                  ; $8984 : $00
	.db $00                                                  ; $8985 : $00
	.db $00                                                  ; $8986 : $00
	.db $00                                                  ; $8987 : $00
	.db $00                                                  ; $8988 : $00
	.db $00                                                  ; $8989 : $00
	.db $00                                                  ; $898a : $00
	.db $00                                                  ; $898b : $00
	.db $00                                                  ; $898c : $00
	.db $00                                                  ; $898d : $00
	.db $00                                                  ; $898e : $00
	.db $00                                                  ; $898f : $00
	.db $00                                                  ; $8990 : $00
	.db $00                                                  ; $8991 : $00
	.db $00                                                  ; $8992 : $00
	.db $00                                                  ; $8993 : $00
	.db $00                                                  ; $8994 : $00
	.db $00                                                  ; $8995 : $00
	.db $00                                                  ; $8996 : $00
	.db $00                                                  ; $8997 : $00
	.db $00                                                  ; $8998 : $00
	.db $00                                                  ; $8999 : $00
	.db $00                                                  ; $899a : $00
	.db $00                                                  ; $899b : $00
	.db $00                                                  ; $899c : $00
	.db $00                                                  ; $899d : $00
	.db $00                                                  ; $899e : $00
	.db $00                                                  ; $899f : $00
	.db $00                                                  ; $89a0 : $00
	.db $00                                                  ; $89a1 : $00
	.db $00                                                  ; $89a2 : $00
	.db $00                                                  ; $89a3 : $00
	.db $00                                                  ; $89a4 : $00
	.db $00                                                  ; $89a5 : $00
	.db $00                                                  ; $89a6 : $00
	.db $00                                                  ; $89a7 : $00
	ora $2000.w                                                  ; $89a8 : $0d, $00, $20
	.db $00                                                  ; $89ab : $00
	bra br_3c_89ae                                                  ; $89ac : $80, $00

br_3c_89ae:
	.db $00                                                  ; $89ae : $00
	.db $00                                                  ; $89af : $00
	.db $00                                                  ; $89b0 : $00
	.db $00                                                  ; $89b1 : $00
	.db $00                                                  ; $89b2 : $00
	.db $00                                                  ; $89b3 : $00
	.db $00                                                  ; $89b4 : $00
	.db $00                                                  ; $89b5 : $00
	.db $00                                                  ; $89b6 : $00
	.db $00                                                  ; $89b7 : $00
	ora $2000.w                                                  ; $89b8 : $0d, $00, $20
	.db $00                                                  ; $89bb : $00
	bra br_3c_89be                                                  ; $89bc : $80, $00

br_3c_89be:
	.db $00                                                  ; $89be : $00
	.db $00                                                  ; $89bf : $00
	.db $00                                                  ; $89c0 : $00
	.db $00                                                  ; $89c1 : $00
	ora ($01, X)                                                  ; $89c2 : $01, $01
	ora ($00, X)                                                  ; $89c4 : $01, $00
	ora $02, S                                                  ; $89c6 : $03, $02
	ora ($02, X)                                                  ; $89c8 : $01, $02
	ora [$04]                                                  ; $89ca : $07, $04
	ora $04, S                                                  ; $89cc : $03, $04
	ora $04, S                                                  ; $89ce : $03, $04
	ora ($00, X)                                                  ; $89d0 : $01, $00
	cop $00.b                                                  ; $89d2 : $02, $00
	cop $00.b                                                  ; $89d4 : $02, $00
	tsb $00                                                  ; $89d6 : $04, $00
	tsb $00                                                  ; $89d8 : $04, $00
	php                                                  ; $89da : $08
	.db $00                                                  ; $89db : $00
	php                                                  ; $89dc : $08
	.db $00                                                  ; $89dd : $00
	php                                                  ; $89de : $08
	.db $00                                                  ; $89df : $00
	sbc $00ff80.l, X                                                  ; $89e0 : $ff, $80, $ff, $00
	sbc $00ff00.l, X                                                  ; $89e4 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $89e8 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $89ec : $ff, $00, $ff, $00
	.db $00                                                  ; $89f0 : $00
	.db $00                                                  ; $89f1 : $00
	.db $00                                                  ; $89f2 : $00
	.db $00                                                  ; $89f3 : $00
	.db $00                                                  ; $89f4 : $00
	.db $00                                                  ; $89f5 : $00
	.db $00                                                  ; $89f6 : $00
	.db $00                                                  ; $89f7 : $00
	.db $00                                                  ; $89f8 : $00
	.db $00                                                  ; $89f9 : $00
	.db $00                                                  ; $89fa : $00
	.db $00                                                  ; $89fb : $00
	.db $00                                                  ; $89fc : $00
	.db $00                                                  ; $89fd : $00
	.db $00                                                  ; $89fe : $00
	.db $00                                                  ; $89ff : $00
	.db $00                                                  ; $8a00 : $00
	.db $00                                                  ; $8a01 : $00
	ora ($00, X)                                                  ; $8a02 : $01, $00
	cop $00.b                                                  ; $8a04 : $02, $00
	ora $01, S                                                  ; $8a06 : $03, $01
	tsb $01                                                  ; $8a08 : $04, $01
	asl $03                                                  ; $8a0a : $06, $03
	asl $03                                                  ; $8a0c : $06, $03
	asl $03                                                  ; $8a0e : $06, $03
	.db $00                                                  ; $8a10 : $00
	.db $00                                                  ; $8a11 : $00
	ora ($00, X)                                                  ; $8a12 : $01, $00
	ora $00, S                                                  ; $8a14 : $03, $00
	cop $00.b                                                  ; $8a16 : $02, $00
	asl $00                                                  ; $8a18 : $06, $00
	tsb $00                                                  ; $8a1a : $04, $00
	tsb $00                                                  ; $8a1c : $04, $00
	tsb $00                                                  ; $8a1e : $04, $00
	ldy #$003f.w                                                  ; $8a20 : $a0, $3f, $00
	jmp ($f080.w, X)                                                  ; $8a23 : $7c, $80, $f0


	.db $00                                                  ; $8a26 : $00
	cpx #$c000.w                                                  ; $8a27 : $e0, $00, $c0
	cop $c3.b                                                  ; $8a2a : $02, $c3
	tsb $87                                                  ; $8a2c : $04, $87
	.db $00                                                  ; $8a2e : $00
	sta [$c0]                                                  ; $8a2f : $87, $c0
	.db $00                                                  ; $8a31 : $00
	bra br_3c_8a34                                                  ; $8a32 : $80, $00

br_3c_8a34:
	.db $00                                                  ; $8a34 : $00
	.db $00                                                  ; $8a35 : $00
	.db $00                                                  ; $8a36 : $00
	.db $00                                                  ; $8a37 : $00
	ora $00, S                                                  ; $8a38 : $03, $00
	tsb $00                                                  ; $8a3a : $04, $00
	php                                                  ; $8a3c : $08
	.db $00                                                  ; $8a3d : $00
	php                                                  ; $8a3e : $08
	.db $00                                                  ; $8a3f : $00
	cop $00.b                                                  ; $8a40 : $02, $00
	ora $01                                                  ; $8a42 : $05, $01
	ora $01                                                  ; $8a44 : $05, $01
	asl                                                  ; $8a46 : $0a
	cop $0a.b                                                  ; $8a47 : $02, $0a
	cop $0c.b                                                  ; $8a49 : $02, $0c
	tsb $0c                                                  ; $8a4b : $04, $0c
	tsb $0c                                                  ; $8a4d : $04, $0c
	tsb $03                                                  ; $8a4f : $04, $03
	.db $00                                                  ; $8a51 : $00
	asl $00                                                  ; $8a52 : $06, $00
	asl $00                                                  ; $8a54 : $06, $00
	tsb $0c00.w                                                  ; $8a56 : $0c, $00, $0c
	.db $00                                                  ; $8a59 : $00
	php                                                  ; $8a5a : $08
	.db $00                                                  ; $8a5b : $00
	php                                                  ; $8a5c : $08
	.db $00                                                  ; $8a5d : $00
	php                                                  ; $8a5e : $08
	.db $00                                                  ; $8a5f : $00
	.db $80, $80                                                  ; $8a60 : $80, $80

	.db $00                                                  ; $8a62 : $00
	.db $00                                                  ; $8a63 : $00
	.db $00                                                  ; $8a64 : $00
	.db $00                                                  ; $8a65 : $00
	.db $00                                                  ; $8a66 : $00
	.db $00                                                  ; $8a67 : $00
	.db $00                                                  ; $8a68 : $00
	.db $00                                                  ; $8a69 : $00
	ora $00, S                                                  ; $8a6a : $03, $00
	ora $01                                                  ; $8a6c : $05, $01
	ora [$03]                                                  ; $8a6e : $07, $03
	.db $00                                                  ; $8a70 : $00
	.db $00                                                  ; $8a71 : $00
	.db $00                                                  ; $8a72 : $00
	.db $00                                                  ; $8a73 : $00
	.db $00                                                  ; $8a74 : $00
	.db $00                                                  ; $8a75 : $00
	.db $00                                                  ; $8a76 : $00
	.db $00                                                  ; $8a77 : $00
	.db $00                                                  ; $8a78 : $00
	.db $00                                                  ; $8a79 : $00
	ora $00, S                                                  ; $8a7a : $03, $00
	asl $00                                                  ; $8a7c : $06, $00
	tsb $00                                                  ; $8a7e : $04, $00
	cop $00.b                                                  ; $8a80 : $02, $00
	.db $00                                                  ; $8a82 : $00
	.db $00                                                  ; $8a83 : $00
	tsb $00                                                  ; $8a84 : $04, $00
	.db $00                                                  ; $8a86 : $00
	.db $00                                                  ; $8a87 : $00
	php                                                  ; $8a88 : $08
	.db $00                                                  ; $8a89 : $00
	php                                                  ; $8a8a : $08
	.db $00                                                  ; $8a8b : $00
	.db $00                                                  ; $8a8c : $00
	.db $00                                                  ; $8a8d : $00
	php                                                  ; $8a8e : $08
	.db $00                                                  ; $8a8f : $00
	cop $00.b                                                  ; $8a90 : $02, $00
	.db $00                                                  ; $8a92 : $00
	.db $00                                                  ; $8a93 : $00
	tsb $00                                                  ; $8a94 : $04, $00
	.db $00                                                  ; $8a96 : $00
	.db $00                                                  ; $8a97 : $00
	php                                                  ; $8a98 : $08
	.db $00                                                  ; $8a99 : $00
	php                                                  ; $8a9a : $08
	.db $00                                                  ; $8a9b : $00
	.db $00                                                  ; $8a9c : $00
	.db $00                                                  ; $8a9d : $00
	php                                                  ; $8a9e : $08
	.db $00                                                  ; $8a9f : $00
	.db $00                                                  ; $8aa0 : $00
	.db $00                                                  ; $8aa1 : $00
	.db $00                                                  ; $8aa2 : $00
	.db $00                                                  ; $8aa3 : $00
	.db $00                                                  ; $8aa4 : $00
	.db $00                                                  ; $8aa5 : $00
	.db $00                                                  ; $8aa6 : $00
	.db $00                                                  ; $8aa7 : $00
	.db $00                                                  ; $8aa8 : $00
	.db $00                                                  ; $8aa9 : $00
	.db $00                                                  ; $8aaa : $00
	.db $00                                                  ; $8aab : $00
	.db $00                                                  ; $8aac : $00
	.db $00                                                  ; $8aad : $00
	ora ($00, X)                                                  ; $8aae : $01, $00
	.db $00                                                  ; $8ab0 : $00
	.db $00                                                  ; $8ab1 : $00
	.db $00                                                  ; $8ab2 : $00
	.db $00                                                  ; $8ab3 : $00
	.db $00                                                  ; $8ab4 : $00
	.db $00                                                  ; $8ab5 : $00
	.db $00                                                  ; $8ab6 : $00
	.db $00                                                  ; $8ab7 : $00
	.db $00                                                  ; $8ab8 : $00
	.db $00                                                  ; $8ab9 : $00
	.db $00                                                  ; $8aba : $00
	.db $00                                                  ; $8abb : $00
	.db $00                                                  ; $8abc : $00
	.db $00                                                  ; $8abd : $00
	ora ($00, X)                                                  ; $8abe : $01, $00
	ora $03, S                                                  ; $8ac0 : $03, $03
	ora $170e.w                                                  ; $8ac2 : $0d, $0e, $17
	clc                                                  ; $8ac5 : $18
	and $605f30.l                                                  ; $8ac6 : $2f, $30, $5f, $60
	adc $c0bf40.l, X                                                  ; $8aca : $7f, $40, $bf, $c0
	lda $0300c0.l, X                                                  ; $8ace : $bf, $c0, $00, $03
	.db $00                                                  ; $8ad2 : $00
	asl $1800.w                                                  ; $8ad3 : $0e, $00, $18
	.db $00                                                  ; $8ad6 : $00
	bmi br_3c_8ad9                                                  ; $8ad7 : $30, $00

br_3c_8ad9:
	rts                                                  ; $8ad9 : $60


	.db $00                                                  ; $8ada : $00
	rti                                                  ; $8adb : $40


	.db $00                                                  ; $8adc : $00
	cpy #$c000.w                                                  ; $8add : $c0, $00, $c0
	sbc $00ffff.l, X                                                  ; $8ae0 : $ff, $ff, $ff, $00
	sbc $ff03.w, X                                                  ; $8ae4 : $fd, $03, $ff
	.db $00                                                  ; $8ae7 : $00
	inc $ff01.w, X                                                  ; $8ae8 : $fe, $01, $ff
	.db $00                                                  ; $8aeb : $00
	sbc $00ff00.l, X                                                  ; $8aec : $ff, $00, $ff, $00
	.db $00                                                  ; $8af0 : $00
	sbc $000000.l, X                                                  ; $8af1 : $ff, $00, $00, $00
	ora $00, S                                                  ; $8af5 : $03, $00
	.db $00                                                  ; $8af7 : $00
	.db $00                                                  ; $8af8 : $00
	ora ($00, X)                                                  ; $8af9 : $01, $00
	.db $00                                                  ; $8afb : $00
	.db $00                                                  ; $8afc : $00
	.db $00                                                  ; $8afd : $00
	.db $00                                                  ; $8afe : $00

br_3c_8aff:
	.db $00                                                  ; $8aff : $00
	.db $00                                                  ; $8b00 : $00
	.db $00                                                  ; $8b01 : $00
	cpx #$80e0.w                                                  ; $8b02 : $e0, $e0, $80
	bra br_3c_8aff                                                  ; $8b05 : $80, $f8

	sei                                                  ; $8b07 : $78
	cpx #$fce0.w                                                  ; $8b08 : $e0, $e0, $fc
	trb $70b0.w                                                  ; $8b0b : $1c, $b0, $70
	inc $0006.w, X                                                  ; $8b0e : $fe, $06, $00
	.db $00                                                  ; $8b11 : $00
	.db $00                                                  ; $8b12 : $00
	cpx #$8000.w                                                  ; $8b13 : $e0, $00, $80
	.db $00                                                  ; $8b16 : $00
	sei                                                  ; $8b17 : $78
	.db $00                                                  ; $8b18 : $00
	cpx #$1c00.w                                                  ; $8b19 : $e0, $00, $1c
	.db $00                                                  ; $8b1c : $00
	bvs br_3c_8b1f                                                  ; $8b1d : $70, $00

br_3c_8b1f:
	asl $00                                                  ; $8b1f : $06, $00
	.db $00                                                  ; $8b21 : $00
	.db $00                                                  ; $8b22 : $00
	.db $00                                                  ; $8b23 : $00
	bit $bd3c.w, X                                                  ; $8b24 : $3c, $3c, $bd
	cmp $3c, S                                                  ; $8b27 : $c3, $3c
	bit $0000.w, X                                                  ; $8b29 : $3c, $00, $00
	.db $00                                                  ; $8b2c : $00
	.db $00                                                  ; $8b2d : $00
	.db $00                                                  ; $8b2e : $00
	.db $00                                                  ; $8b2f : $00
	.db $00                                                  ; $8b30 : $00
	.db $00                                                  ; $8b31 : $00
	.db $00                                                  ; $8b32 : $00
	.db $00                                                  ; $8b33 : $00
	ror $c342.w, X                                                  ; $8b34 : $7e, $42, $c3
	.db $00                                                  ; $8b37 : $00
	ror $0042.w, X                                                  ; $8b38 : $7e, $42, $00
	.db $00                                                  ; $8b3b : $00
	.db $00                                                  ; $8b3c : $00
	.db $00                                                  ; $8b3d : $00
	.db $00                                                  ; $8b3e : $00
	.db $00                                                  ; $8b3f : $00
	.db $00                                                  ; $8b40 : $00
	.db $00                                                  ; $8b41 : $00
	.db $00                                                  ; $8b42 : $00
	.db $00                                                  ; $8b43 : $00
	clc                                                  ; $8b44 : $18
	clc                                                  ; $8b45 : $18
	phy                                                  ; $8b46 : $5a
	ror $18                                                  ; $8b47 : $66, $18
	clc                                                  ; $8b49 : $18
	.db $00                                                  ; $8b4a : $00
	.db $00                                                  ; $8b4b : $00

br_3c_8b4c:
	.db $00                                                  ; $8b4c : $00
	.db $00                                                  ; $8b4d : $00
	.db $00                                                  ; $8b4e : $00
	.db $00                                                  ; $8b4f : $00
	.db $00                                                  ; $8b50 : $00
	.db $00                                                  ; $8b51 : $00
	.db $00                                                  ; $8b52 : $00
	.db $00                                                  ; $8b53 : $00
	bit $6624.w, X                                                  ; $8b54 : $3c, $24, $66
	.db $00                                                  ; $8b57 : $00
	bit $0024.w, X                                                  ; $8b58 : $3c, $24, $00
	.db $00                                                  ; $8b5b : $00
	.db $00                                                  ; $8b5c : $00
	.db $00                                                  ; $8b5d : $00
	.db $00                                                  ; $8b5e : $00
	.db $00                                                  ; $8b5f : $00
	.db $00                                                  ; $8b60 : $00
	.db $00                                                  ; $8b61 : $00
	.db $00                                                  ; $8b62 : $00
	.db $00                                                  ; $8b63 : $00
	.db $00                                                  ; $8b64 : $00
	.db $00                                                  ; $8b65 : $00
	clc                                                  ; $8b66 : $18
	clc                                                  ; $8b67 : $18
	.db $00                                                  ; $8b68 : $00
	.db $00                                                  ; $8b69 : $00
	.db $00                                                  ; $8b6a : $00
	.db $00                                                  ; $8b6b : $00
	.db $00                                                  ; $8b6c : $00
	.db $00                                                  ; $8b6d : $00
	.db $00                                                  ; $8b6e : $00
	.db $00                                                  ; $8b6f : $00
	.db $00                                                  ; $8b70 : $00
	.db $00                                                  ; $8b71 : $00
	.db $00                                                  ; $8b72 : $00
	.db $00                                                  ; $8b73 : $00
	clc                                                  ; $8b74 : $18
	clc                                                  ; $8b75 : $18
	bit $1824.w, X                                                  ; $8b76 : $3c, $24, $18
	clc                                                  ; $8b79 : $18
	.db $00                                                  ; $8b7a : $00
	.db $00                                                  ; $8b7b : $00
	.db $00                                                  ; $8b7c : $00
	.db $00                                                  ; $8b7d : $00
	.db $00                                                  ; $8b7e : $00
	.db $00                                                  ; $8b7f : $00
	.db $00                                                  ; $8b80 : $00
	.db $00                                                  ; $8b81 : $00
	.db $00                                                  ; $8b82 : $00
	.db $00                                                  ; $8b83 : $00
	.db $00                                                  ; $8b84 : $00
	.db $00                                                  ; $8b85 : $00
	bit $00                                                  ; $8b86 : $24, $00
	.db $00                                                  ; $8b88 : $00
	.db $00                                                  ; $8b89 : $00
	.db $00                                                  ; $8b8a : $00
	.db $00                                                  ; $8b8b : $00
	.db $00                                                  ; $8b8c : $00
	.db $00                                                  ; $8b8d : $00
	.db $00                                                  ; $8b8e : $00
	.db $00                                                  ; $8b8f : $00
	.db $00                                                  ; $8b90 : $00
	.db $00                                                  ; $8b91 : $00
	.db $00                                                  ; $8b92 : $00
	.db $00                                                  ; $8b93 : $00
	.db $00                                                  ; $8b94 : $00
	.db $00                                                  ; $8b95 : $00
	clc                                                  ; $8b96 : $18
	bit $0000.w, X                                                  ; $8b97 : $3c, $00, $00
	.db $00                                                  ; $8b9a : $00
	.db $00                                                  ; $8b9b : $00
	.db $00                                                  ; $8b9c : $00
	.db $00                                                  ; $8b9d : $00
	.db $00                                                  ; $8b9e : $00
	.db $00                                                  ; $8b9f : $00
	.db $00                                                  ; $8ba0 : $00
	.db $00                                                  ; $8ba1 : $00
	.db $00                                                  ; $8ba2 : $00
	.db $00                                                  ; $8ba3 : $00
	tsb $04                                                  ; $8ba4 : $04, $04
	cop $02.b                                                  ; $8ba6 : $02, $02
	ora $03, S                                                  ; $8ba8 : $03, $03
	adc ($61, X)                                                  ; $8baa : $61, $61
	and $1f39.w, Y                                                  ; $8bac : $39, $39, $1f
	ora [$00], Y                                                  ; $8baf : $17, $00
	.db $00                                                  ; $8bb1 : $00
	.db $00                                                  ; $8bb2 : $00
	.db $00                                                  ; $8bb3 : $00
	.db $00                                                  ; $8bb4 : $00
	tsb $00                                                  ; $8bb5 : $04, $00
	cop $00.b                                                  ; $8bb7 : $02, $00
	ora $00, S                                                  ; $8bb9 : $03, $00
	adc ($00, X)                                                  ; $8bbb : $61, $00
	and $1700.w, Y                                                  ; $8bbd : $39, $00, $17

Call_3c_8bc0:
	.db $00                                                  ; $8bc0 : $00
	.db $00                                                  ; $8bc1 : $00
	.db $00                                                  ; $8bc2 : $00
	.db $00                                                  ; $8bc3 : $00
	.db $00                                                  ; $8bc4 : $00
	.db $00                                                  ; $8bc5 : $00
	.db $00                                                  ; $8bc6 : $00
	.db $00                                                  ; $8bc7 : $00
	.db $00                                                  ; $8bc8 : $00
	.db $00                                                  ; $8bc9 : $00
	bra br_3c_8b4c                                                  ; $8bca : $80, $80

	cpy #$e040.w                                                  ; $8bcc : $c0, $40, $e0
	jsr $0000.w                                                  ; $8bcf : $20, $00, $00
	.db $00                                                  ; $8bd2 : $00
	.db $00                                                  ; $8bd3 : $00
	.db $00                                                  ; $8bd4 : $00
	.db $00                                                  ; $8bd5 : $00
	.db $00                                                  ; $8bd6 : $00
	.db $00                                                  ; $8bd7 : $00
	.db $00                                                  ; $8bd8 : $00
	.db $00                                                  ; $8bd9 : $00
	.db $00                                                  ; $8bda : $00
	bra br_3c_8bdd                                                  ; $8bdb : $80, $00

br_3c_8bdd:
	rti                                                  ; $8bdd : $40


	.db $00                                                  ; $8bde : $00
	jsr $0100.w                                                  ; $8bdf : $20, $00, $01
	ora ($06, X)                                                  ; $8be2 : $01, $06
	asl $09                                                  ; $8be4 : $06, $09
	ora $001f10.l                                                  ; $8be6 : $0f, $10, $1f, $00
	ora $201f20.l, X                                                  ; $8bea : $1f, $20, $1f, $20
	ora $070020.l, X                                                  ; $8bee : $1f, $20, $00, $07
	.db $00                                                  ; $8bf2 : $00
	asl $1900.w                                                  ; $8bf3 : $0e, $00, $19
	.db $00                                                  ; $8bf6 : $00
	bmi br_3c_8bf9                                                  ; $8bf7 : $30, $00

br_3c_8bf9:
	jsr $6000.w                                                  ; $8bf9 : $20, $00, $60
	.db $00                                                  ; $8bfc : $00
	rts                                                  ; $8bfd : $60


	.db $00                                                  ; $8bfe : $00
	rts                                                  ; $8bff : $60


	.db $00                                                  ; $8c00 : $00
	bra br_3c_8c03                                                  ; $8c01 : $80, $00

br_3c_8c03:
	.db $00                                                  ; $8c03 : $00
	rti                                                  ; $8c04 : $40


	ldy #$4080.w                                                  ; $8c05 : $a0, $80, $40
	bne br_3c_8c3a                                                  ; $8c08 : $d0, $30

	ldy #$f060.w                                                  ; $8c0a : $a0, $60, $f0
	php                                                  ; $8c0d : $08
	.db $d0, $30                                                  ; $8c0e : $d0, $30

	.db $00                                                  ; $8c10 : $00
	cpy #$f800.w                                                  ; $8c11 : $c0, $00, $f8
	.db $00                                                  ; $8c14 : $00
	bcs br_3c_8c17                                                  ; $8c15 : $b0, $00

br_3c_8c17:
	rts                                                  ; $8c17 : $60


	.db $00                                                  ; $8c18 : $00
	bit $7000.w, X                                                  ; $8c19 : $3c, $00, $70
	.db $00                                                  ; $8c1c : $00
	asl $3800.w                                                  ; $8c1d : $0e, $00, $38
	.db $00                                                  ; $8c20 : $00
	.db $00                                                  ; $8c21 : $00
	.db $00                                                  ; $8c22 : $00
	.db $00                                                  ; $8c23 : $00
	.db $00                                                  ; $8c24 : $00
	.db $00                                                  ; $8c25 : $00
	.db $00                                                  ; $8c26 : $00
	.db $00                                                  ; $8c27 : $00
	.db $00                                                  ; $8c28 : $00
	.db $00                                                  ; $8c29 : $00
	.db $00                                                  ; $8c2a : $00
	.db $00                                                  ; $8c2b : $00
	.db $00                                                  ; $8c2c : $00
	.db $00                                                  ; $8c2d : $00
	.db $00                                                  ; $8c2e : $00
	cop $00.b                                                  ; $8c2f : $02, $00
	.db $00                                                  ; $8c31 : $00
	.db $00                                                  ; $8c32 : $00
	.db $00                                                  ; $8c33 : $00
	.db $00                                                  ; $8c34 : $00
	.db $00                                                  ; $8c35 : $00
	.db $00                                                  ; $8c36 : $00
	.db $00                                                  ; $8c37 : $00
	.db $00                                                  ; $8c38 : $00
	.db $00                                                  ; $8c39 : $00

br_3c_8c3a:
	.db $00                                                  ; $8c3a : $00
	.db $00                                                  ; $8c3b : $00
	.db $00                                                  ; $8c3c : $00
	php                                                  ; $8c3d : $08
	.db $00                                                  ; $8c3e : $00
	ora [$cf], Y                                                  ; $8c3f : $17, $cf
	cmp #$38ff.w                                                  ; $8c41 : $c9, $ff, $38
	sbc $00ff80.l, X                                                  ; $8c44 : $ff, $80, $ff, $00
	sbc $00ff00.l, X                                                  ; $8c48 : $ff, $00, $ff, $00
	sbc $80ff00.l, X                                                  ; $8c4c : $ff, $00, $ff, $80
	.db $00                                                  ; $8c50 : $00

br_3c_8c51:
	cmp #$3800.w                                                  ; $8c51 : $c9, $00, $38
	.db $00                                                  ; $8c54 : $00
	bra br_3c_8c57                                                  ; $8c55 : $80, $00

br_3c_8c57:
	.db $00                                                  ; $8c57 : $00
	.db $00                                                  ; $8c58 : $00
	.db $00                                                  ; $8c59 : $00
	.db $00                                                  ; $8c5a : $00

br_3c_8c5b:
	.db $00                                                  ; $8c5b : $00
	.db $00                                                  ; $8c5c : $00
	.db $00                                                  ; $8c5d : $00
	.db $00                                                  ; $8c5e : $00
	bra br_3c_8c51                                                  ; $8c5f : $80, $f0

	bpl br_3c_8c5b                                                  ; $8c61 : $10, $f8

	php                                                  ; $8c63 : $08
	jsr ($fe04.w, X)                                                  ; $8c64 : $fc, $04, $fe
	cop $fe.b                                                  ; $8c67 : $02, $fe
	cop $ff.b                                                  ; $8c69 : $02, $ff
	ora ($ff, X)                                                  ; $8c6b : $01, $ff
	ora ($ff, X)                                                  ; $8c6d : $01, $ff
	ora ($00, X)                                                  ; $8c6f : $01, $00
	bpl br_3c_8c73                                                  ; $8c71 : $10, $00

br_3c_8c73:
	php                                                  ; $8c73 : $08
	.db $00                                                  ; $8c74 : $00
	tsb $00                                                  ; $8c75 : $04, $00
	cop $00.b                                                  ; $8c77 : $02, $00
	cop $00.b                                                  ; $8c79 : $02, $00
	ora ($00, X)                                                  ; $8c7b : $01, $00
	ora ($00, X)                                                  ; $8c7d : $01, $00
	ora ($00, X)                                                  ; $8c7f : $01, $00
	.db $00                                                  ; $8c81 : $00
	.db $00                                                  ; $8c82 : $00
	.db $00                                                  ; $8c83 : $00
	.db $00                                                  ; $8c84 : $00
	.db $00                                                  ; $8c85 : $00
	.db $00                                                  ; $8c86 : $00
	.db $00                                                  ; $8c87 : $00
	.db $00                                                  ; $8c88 : $00
	.db $00                                                  ; $8c89 : $00
	.db $00                                                  ; $8c8a : $00
	.db $00                                                  ; $8c8b : $00
	.db $00                                                  ; $8c8c : $00
	.db $00                                                  ; $8c8d : $00
	asl $06                                                  ; $8c8e : $06, $06
	.db $00                                                  ; $8c90 : $00

Call_3c_8c91:
	.db $00                                                  ; $8c91 : $00
	.db $00                                                  ; $8c92 : $00
	.db $00                                                  ; $8c93 : $00
	.db $00                                                  ; $8c94 : $00
	.db $00                                                  ; $8c95 : $00
	.db $00                                                  ; $8c96 : $00
	.db $00                                                  ; $8c97 : $00
	.db $00                                                  ; $8c98 : $00
	.db $00                                                  ; $8c99 : $00
	.db $00                                                  ; $8c9a : $00
	.db $00                                                  ; $8c9b : $00
	.db $00                                                  ; $8c9c : $00
	.db $00                                                  ; $8c9d : $00
	.db $00                                                  ; $8c9e : $00
	asl $03                                                  ; $8c9f : $06, $03
	ora $01, S                                                  ; $8ca1 : $03, $01
	ora ($3f, X)                                                  ; $8ca3 : $01, $3f
	and $1f0c0f.l, X                                                  ; $8ca5 : $3f, $0f, $0c, $1f
	ora $1fe0ff.l, X                                                  ; $8ca9 : $1f, $ff, $e0, $1f
	clc                                                  ; $8cad : $18
	ora [$07]                                                  ; $8cae : $07, $07
	.db $00                                                  ; $8cb0 : $00
	ora $00, S                                                  ; $8cb1 : $03, $00
	ora ($00, X)                                                  ; $8cb3 : $01, $00
	and $000c00.l, X                                                  ; $8cb5 : $3f, $00, $0c, $00
	ora $00e000.l, X                                                  ; $8cb9 : $1f, $00, $e0, $00
	clc                                                  ; $8cbd : $18
	.db $00                                                  ; $8cbe : $00
	ora [$00]                                                  ; $8cbf : $07, $00
	.db $00                                                  ; $8cc1 : $00
	.db $00                                                  ; $8cc2 : $00
	.db $00                                                  ; $8cc3 : $00
	.db $00                                                  ; $8cc4 : $00
	.db $80, $80                                                  ; $8cc5 : $80, $80

	rti                                                  ; $8cc7 : $40


	.db $00                                                  ; $8cc8 : $00
	bra br_3c_8ccb                                                  ; $8cc9 : $80, $00

br_3c_8ccb:
	.db $00                                                  ; $8ccb : $00
	.db $00                                                  ; $8ccc : $00
	.db $00                                                  ; $8ccd : $00
	.db $00                                                  ; $8cce : $00
	.db $00                                                  ; $8ccf : $00
	.db $00                                                  ; $8cd0 : $00
	.db $00                                                  ; $8cd1 : $00
	.db $00                                                  ; $8cd2 : $00
	.db $00                                                  ; $8cd3 : $00
	.db $80, $80                                                  ; $8cd4 : $80, $80

	cpy #$80c0.w                                                  ; $8cd6 : $c0, $c0, $80
	bra br_3c_8cdb                                                  ; $8cd9 : $80, $00

br_3c_8cdb:
	.db $00                                                  ; $8cdb : $00
	.db $00                                                  ; $8cdc : $00
	.db $00                                                  ; $8cdd : $00
	.db $00                                                  ; $8cde : $00
	.db $00                                                  ; $8cdf : $00
	.db $00                                                  ; $8ce0 : $00
	.db $00                                                  ; $8ce1 : $00
	ora ($01, X)                                                  ; $8ce2 : $01, $01
	ora $06                                                  ; $8ce4 : $05, $06
	phd                                                  ; $8ce6 : $0b
	tsb $0308.w                                                  ; $8ce7 : $0c, $08, $03
	trb $3d01.w                                                  ; $8cea : $1c, $01, $3d
	ora ($34, X)                                                  ; $8ced : $01, $34
	asl $00                                                  ; $8cef : $06, $00
	.db $00                                                  ; $8cf1 : $00
	ora $02, S                                                  ; $8cf2 : $03, $02
	asl $1c08.w                                                  ; $8cf4 : $0e, $08, $1c
	.db $10, $37                                                  ; $8cf7 : $10, $37

	bit $7e63.w, X                                                  ; $8cf9 : $3c, $63, $7e
	eor $7e                                                  ; $8cfc : $45, $7e
	cmp ($ff, X)                                                  ; $8cfe : $c1, $ff
	.db $00                                                  ; $8d00 : $00
	.db $00                                                  ; $8d01 : $00
	ora $ff, S                                                  ; $8d02 : $03, $ff
	cpx $f81c.w                                                  ; $8d04 : $ec, $1c, $f8
	ora [$f1]                                                  ; $8d07 : $07, $f1
	ora $7e807f.l                                                  ; $8d09 : $0f, $7f, $80, $7e
	sta ($3c, X)                                                  ; $8d0d : $81, $3c

br_3c_8d0f:
	cmp $ff, S                                                  ; $8d0f : $c3, $ff
	sbc $1f00ff.l, X                                                  ; $8d11 : $ff, $ff, $00, $1f
	ora $07, S                                                  ; $8d15 : $03, $07
	.db $00                                                  ; $8d17 : $00
	ora $008000.l                                                  ; $8d18 : $0f, $00, $80, $00
	sta ($00, X)                                                  ; $8d1c : $81, $00
	cmp $00, S                                                  ; $8d1e : $c3, $00
	rti                                                  ; $8d20 : $40


	.db $00                                                  ; $8d21 : $00
	bmi br_3c_8d24                                                  ; $8d22 : $30, $00

br_3c_8d24:
	trb $b000.w                                                  ; $8d24 : $1c, $00, $b0
	bra br_3c_8d0f                                                  ; $8d27 : $80, $e6

	cpx #$7c8c.w                                                  ; $8d29 : $e0, $8c, $7c
	and ($f0, S), Y                                                  ; $8d2c : $33, $f0
	inc $80e0.w                                                  ; $8d2e : $ee, $e0, $80

br_3c_8d31:
	cpy #$f0c0.w                                                  ; $8d31 : $c0, $c0, $f0
	cpx #$c0fc.w                                                  ; $8d34 : $e0, $fc, $c0
	bvs br_3c_8d31                                                  ; $8d37 : $70, $f8

	asl $037f.w, X                                                  ; $8d39 : $1e, $7f, $03
	jsr ($f00f.w, X)                                                  ; $8d3c : $fc, $0f, $f0
	asl $0000.w, X                                                  ; $8d3f : $1e, $00, $00
	.db $00                                                  ; $8d42 : $00
	.db $00                                                  ; $8d43 : $00
	.db $00                                                  ; $8d44 : $00
	.db $00                                                  ; $8d45 : $00
	.db $00                                                  ; $8d46 : $00
	.db $00                                                  ; $8d47 : $00
	.db $00                                                  ; $8d48 : $00
	.db $00                                                  ; $8d49 : $00
	bra br_3c_8d4c                                                  ; $8d4a : $80, $00

br_3c_8d4c:
	cpx #$0000.w                                                  ; $8d4c : $e0, $00, $00
	.db $00                                                  ; $8d4f : $00
	.db $00                                                  ; $8d50 : $00
	.db $00                                                  ; $8d51 : $00
	.db $00                                                  ; $8d52 : $00
	.db $00                                                  ; $8d53 : $00
	.db $00                                                  ; $8d54 : $00
	.db $00                                                  ; $8d55 : $00
	.db $00                                                  ; $8d56 : $00
	.db $00                                                  ; $8d57 : $00
	.db $00                                                  ; $8d58 : $00
	.db $00                                                  ; $8d59 : $00
	.db $00                                                  ; $8d5a : $00
	bra br_3c_8d5d                                                  ; $8d5b : $80, $00

br_3c_8d5d:
	cpx #$0000.w                                                  ; $8d5d : $e0, $00, $00
	.db $00                                                  ; $8d60 : $00
	.db $00                                                  ; $8d61 : $00
	.db $00                                                  ; $8d62 : $00
	.db $00                                                  ; $8d63 : $00
	asl $2e1e.w, X                                                  ; $8d64 : $1e, $1e, $2e
	and ($1d), Y                                                  ; $8d67 : $31, $1d
	and $7e, S                                                  ; $8d69 : $23, $7e
	eor ($3f, X)                                                  ; $8d6b : $41, $3f
	rti                                                  ; $8d6d : $40


	rol $0041.w, X                                                  ; $8d6e : $3e, $41, $00
	.db $00                                                  ; $8d71 : $00
	asl $1f0e.w                                                  ; $8d72 : $0e, $0e, $1f
	ora ($31, X)                                                  ; $8d75 : $01, $31
	.db $00                                                  ; $8d77 : $00
	adc $40, S                                                  ; $8d78 : $63, $40
	eor ($00, X)                                                  ; $8d7a : $41, $00
	cpy #$c180.w                                                  ; $8d7c : $c0, $80, $c1
	.db $80, $68                                                  ; $8d7f : $80, $68

	ora $041f70.l                                                  ; $8d81 : $0f, $70, $1f, $04
	sbc [$92], Y                                                  ; $8d85 : $f7, $92
	phb                                                  ; $8d87 : $8b
	bit $17                                                  ; $8d88 : $24, $17
	tax                                                  ; $8d8a : $aa
	ldy $a1                                                  ; $8d8b : $a4, $a1
	adc $b295.w                                                  ; $8d8d : $6d, $95, $b2
	.db $80, $ff                                                  ; $8d90 : $80, $ff

	ldy #$f0ff.w                                                  ; $8d92 : $a0, $ff, $f0
	sbc $b07fd8.l, X                                                  ; $8d95 : $ff, $d8, $7f, $b0
	sbc $7c7fce.l, X                                                  ; $8d99 : $ff, $ce, $7f, $7c
	ora $bf7fc7.l, X                                                  ; $8d9d : $1f, $c7, $7f, $bf
	cpy #$c0bf.w                                                  ; $8da1 : $c0, $bf, $c0
	ora $e15e60.l, X                                                  ; $8da4 : $1f, $60, $5e, $e1
	eor $dee3.w, X                                                  ; $8da8 : $5d, $e3, $de
	sbc ($5f, X)                                                  ; $8dab : $e1, $5f
	cpx #$605f.w                                                  ; $8dad : $e0, $5f, $60
	cpy #$c000.w                                                  ; $8db0 : $c0, $00, $c0

br_3c_8db3:
	.db $00                                                  ; $8db3 : $00
	cpx #$6180.w                                                  ; $8db4 : $e0, $80, $61
	bra br_3c_8e1c                                                  ; $8db7 : $80, $63

	bra br_3c_8e1c                                                  ; $8db9 : $80, $61

	.db $80, $60                                                  ; $8dbb : $80, $60

	.db $80, $60                                                  ; $8dbd : $80, $60

	.db $80, $19                                                  ; $8dbf : $80, $19

	sed                                                  ; $8dc1 : $f8
	sbc $1f, S                                                  ; $8dc2 : $e3, $1f
	sta $6778.w, Y                                                  ; $8dc4 : $99, $78, $67
	cpx #$819f.w                                                  ; $8dc7 : $e0, $9f, $81
	ora $c3f8.w, Y                                                  ; $8dca : $19, $f8, $c3
	and $fe00ff.l, X                                                  ; $8dcd : $3f, $ff, $00, $fe
	ora [$1f]                                                  ; $8dd1 : $07, $1f
	.db $00                                                  ; $8dd3 : $00
	ror $f807.w, X                                                  ; $8dd4 : $7e, $07, $f8
	ora $fe7fe0.l, X                                                  ; $8dd7 : $1f, $e0, $7f, $fe
	ora [$3f]                                                  ; $8ddb : $07, $3f
	.db $00                                                  ; $8ddd : $00
	.db $00                                                  ; $8dde : $00
	.db $00                                                  ; $8ddf : $00
	bra br_3c_8de2                                                  ; $8de0 : $80, $00

br_3c_8de2:
	jsr $f800.w                                                  ; $8de2 : $20, $00, $f8
	.db $00                                                  ; $8de5 : $00
	.db $00                                                  ; $8de6 : $00
	cpy #$2850.w                                                  ; $8de7 : $c0, $50, $28
	cpy $02                                                  ; $8dea : $c4, $02
	and $b700.w, Y                                                  ; $8dec : $39, $00, $b7
	bvs br_3c_8df1                                                  ; $8def : $70, $00

br_3c_8df1:
	bra br_3c_8db3                                                  ; $8df1 : $80, $c0

	cpx #$f800.w                                                  ; $8df3 : $e0, $00, $f8
	cpy #$78c0.w                                                  ; $8df6 : $c0, $c0, $78
	sed                                                  ; $8df9 : $f8
	asl $fe                                                  ; $8dfa : $06, $fe
	cmp ($ff, X)                                                  ; $8dfc : $c1, $ff
	sei                                                  ; $8dfe : $78
	ora $000000.l                                                  ; $8dff : $0f, $00, $00, $00
	.db $00                                                  ; $8e03 : $00
	.db $00                                                  ; $8e04 : $00
	.db $00                                                  ; $8e05 : $00
	.db $00                                                  ; $8e06 : $00
	.db $00                                                  ; $8e07 : $00
	.db $00                                                  ; $8e08 : $00
	.db $00                                                  ; $8e09 : $00
	ora ($01, X)                                                  ; $8e0a : $01, $01
	cop $03.b                                                  ; $8e0c : $02, $03
	ora ($06, X)                                                  ; $8e0e : $01, $06
	.db $00                                                  ; $8e10 : $00
	.db $00                                                  ; $8e11 : $00
	.db $00                                                  ; $8e12 : $00
	.db $00                                                  ; $8e13 : $00
	.db $00                                                  ; $8e14 : $00
	.db $00                                                  ; $8e15 : $00
	.db $00                                                  ; $8e16 : $00
	.db $00                                                  ; $8e17 : $00
	.db $00                                                  ; $8e18 : $00
	.db $00                                                  ; $8e19 : $00
	ora $02, S                                                  ; $8e1a : $03, $02

br_3c_8e1c:
	ora [$04]                                                  ; $8e1c : $07, $04
	asl $0008.w                                                  ; $8e1e : $0e, $08, $00
	.db $00                                                  ; $8e21 : $00
	.db $00                                                  ; $8e22 : $00
	.db $00                                                  ; $8e23 : $00
	.db $00                                                  ; $8e24 : $00
	.db $00                                                  ; $8e25 : $00
	ora $00, S                                                  ; $8e26 : $03, $00
	jmp ($1860.w)                                                  ; $8e28 : $6c, $60, $18


	cpy #$8030.w                                                  ; $8e2b : $c0, $30, $80
	jml [$0040.w]                                                  ; $8e2e : $dc, $40, $00


	.db $00                                                  ; $8e31 : $00
	.db $00                                                  ; $8e32 : $00
	.db $00                                                  ; $8e33 : $00
	.db $00                                                  ; $8e34 : $00
	.db $00                                                  ; $8e35 : $00
	ora $00, S                                                  ; $8e36 : $03, $00
	pea $e898.w                                                  ; $8e38 : $f4, $98, $e8
	.db $30, $c0                                                  ; $8e3b : $30, $c0

	.db $70, $60                                                  ; $8e3d : $70, $60

	bit $0007.w, X                                                  ; $8e3f : $3c, $07, $00
	ora ($00, X)                                                  ; $8e42 : $01, $00
	asl $a000.w, X                                                  ; $8e44 : $1e, $00, $a0
	.db $00                                                  ; $8e47 : $00
	rti                                                  ; $8e48 : $40


	.db $00                                                  ; $8e49 : $00
	jsr $1000.w                                                  ; $8e4a : $20, $00, $10
	.db $00                                                  ; $8e4d : $00
	ora $04, S                                                  ; $8e4e : $03, $04
	ora [$00]                                                  ; $8e50 : $07, $00
	ora ($00, X)                                                  ; $8e52 : $01, $00
	asl $a000.w, X                                                  ; $8e54 : $1e, $00, $a0
	.db $00                                                  ; $8e57 : $00
	cpy #$6000.w                                                  ; $8e58 : $c0, $00, $60
	.db $00                                                  ; $8e5b : $00
	bmi br_3c_8e5e                                                  ; $8e5c : $30, $00

br_3c_8e5e:
	and [$07], Y                                                  ; $8e5e : $37, $07
	beq br_3c_8e62                                                  ; $8e60 : $f0, $00

br_3c_8e62:
	tsb $0500.w                                                  ; $8e62 : $0c, $00, $05
	.db $00                                                  ; $8e65 : $00
	cop $00.b                                                  ; $8e66 : $02, $00
	.db $00                                                  ; $8e68 : $00
	.db $00                                                  ; $8e69 : $00
	.db $00                                                  ; $8e6a : $00
	.db $00                                                  ; $8e6b : $00
	php                                                  ; $8e6c : $08
	.db $00                                                  ; $8e6d : $00
	rti                                                  ; $8e6e : $40


	.db $00                                                  ; $8e6f : $00
	beq br_3c_8e72                                                  ; $8e70 : $f0, $00

br_3c_8e72:
	tsb $0700.w                                                  ; $8e72 : $0c, $00, $07
	.db $00                                                  ; $8e75 : $00
	ora $00, S                                                  ; $8e76 : $03, $00
	.db $00                                                  ; $8e78 : $00
	.db $00                                                  ; $8e79 : $00
	.db $00                                                  ; $8e7a : $00
	.db $00                                                  ; $8e7b : $00
	sei                                                  ; $8e7c : $78
	.db $00                                                  ; $8e7d : $00
	cpy $00                                                  ; $8e7e : $c4, $00

Call_3c_8e80:
	.db $00                                                  ; $8e80 : $00
	.db $00                                                  ; $8e81 : $00
	.db $00                                                  ; $8e82 : $00
	.db $00                                                  ; $8e83 : $00
	.db $00                                                  ; $8e84 : $00
	.db $00                                                  ; $8e85 : $00
	bra br_3c_8e88                                                  ; $8e86 : $80, $00

br_3c_8e88:
	jsr $0800.w                                                  ; $8e88 : $20, $00, $08
	.db $00                                                  ; $8e8b : $00
	bmi br_3c_8e8e                                                  ; $8e8c : $30, $00

br_3c_8e8e:
	.db $00                                                  ; $8e8e : $00
	.db $00                                                  ; $8e8f : $00
	.db $00                                                  ; $8e90 : $00
	.db $00                                                  ; $8e91 : $00
	.db $00                                                  ; $8e92 : $00
	.db $00                                                  ; $8e93 : $00
	.db $00                                                  ; $8e94 : $00
	.db $00                                                  ; $8e95 : $00
	bra br_3c_8e98                                                  ; $8e96 : $80, $00

br_3c_8e98:
	cpx #$3800.w                                                  ; $8e98 : $e0, $00, $38
	.db $00                                                  ; $8e9b : $00
	bvs br_3c_8e9e                                                  ; $8e9c : $70, $00

br_3c_8e9e:
	cpy #$0000.w                                                  ; $8e9e : $c0, $00, $00
	.db $00                                                  ; $8ea1 : $00
	.db $00                                                  ; $8ea2 : $00
	.db $00                                                  ; $8ea3 : $00
	.db $00                                                  ; $8ea4 : $00
	.db $00                                                  ; $8ea5 : $00
	.db $00                                                  ; $8ea6 : $00
	cpy #$0080.w                                                  ; $8ea7 : $c0, $80, $00
	cpx #$4010.w                                                  ; $8eaa : $e0, $10, $40
	jsr $04c8.w                                                  ; $8ead : $20, $c8, $04
	.db $00                                                  ; $8eb0 : $00
	.db $00                                                  ; $8eb1 : $00
	.db $00                                                  ; $8eb2 : $00
	.db $00                                                  ; $8eb3 : $00
	.db $00                                                  ; $8eb4 : $00
	.db $00                                                  ; $8eb5 : $00
	cpy #$80c0.w                                                  ; $8eb6 : $c0, $c0, $80
	.db $80, $f0                                                  ; $8eb9 : $80, $f0

	beq br_3c_8f1d                                                  ; $8ebb : $f0, $60

	cpx #$fccc.w                                                  ; $8ebd : $e0, $cc, $fc
	ora [$08]                                                  ; $8ec0 : $07, $08
	ora $203f10.l                                                  ; $8ec2 : $0f, $10, $3f, $20
	ora $407f20.l, X                                                  ; $8ec6 : $1f, $20, $7f, $40
	and $403f40.l, X                                                  ; $8eca : $3f, $40, $3f, $40
	and $101840.l, X                                                  ; $8ece : $3f, $40, $18, $10
	bmi br_3c_8ef4                                                  ; $8ed2 : $30, $20

	jsr $6000.w                                                  ; $8ed4 : $20, $00, $60
	rti                                                  ; $8ed7 : $40


	rti                                                  ; $8ed8 : $40


	.db $00                                                  ; $8ed9 : $00
	cpy #$c080.w                                                  ; $8eda : $c0, $80, $c0
	.db $80, $c0                                                  ; $8edd : $80, $c0

	.db $80, $d6                                                  ; $8edf : $80, $d6

	and ($ad), Y                                                  ; $8ee1 : $31, $ad
	rts                                                  ; $8ee3 : $60


	xba                                                  ; $8ee4 : $eb
	clc                                                  ; $8ee5 : $18
	dec $30, X                                                  ; $8ee6 : $d6, $30
	xba                                                  ; $8ee8 : $eb
	clc                                                  ; $8ee9 : $18
	sbc $0c, X                                                  ; $8eea : $f5, $0c
	plx                                                  ; $8eec : $fa
	asl $f5                                                  ; $8eed : $06, $f5
	tsb $0f39.w                                                  ; $8eef : $0c, $39, $0f
	adc ($1f), Y                                                  ; $8ef2 : $71, $1f

br_3c_8ef4:
	trb $3807.w                                                  ; $8ef4 : $1c, $07, $38
	ora $0e071c.l                                                  ; $8ef7 : $0f, $1c, $07, $0e
	ora $07, S                                                  ; $8efb : $03, $07
	ora ($0e, X)                                                  ; $8efd : $01, $0e
	ora $2a, S                                                  ; $8eff : $03, $2a

br_3c_8f01:
	cop $09.b                                                  ; $8f01 : $02, $09
	dec $45                                                  ; $8f03 : $c6, $45
	jsr $6093.w                                                  ; $8f05 : $20, $93, $60
	lda [$90]                                                  ; $8f08 : $a7, $90
	cmp [$30]                                                  ; $8f0a : $c7, $30
	cmp $02, X                                                  ; $8f0c : $d5, $02
	lda [$10]                                                  ; $8f0e : $a7, $10
	and $d906.w, Y                                                  ; $8f10 : $39, $06, $d9
	dec $6f                                                  ; $8f13 : $c6, $6f

br_3c_8f15:
	beq br_3c_8f15                                                  ; $8f15 : $f0, $fe

	beq br_3c_8f55                                                  ; $8f17 : $f0, $3c

	.db $f0, $7c                                                  ; $8f19 : $f0, $7c

	beq br_3c_8f39                                                  ; $8f1b : $f0, $1c

br_3c_8f1d:
	sbc ($3c)                                                  ; $8f1d : $f2, $3c
	beq br_3c_8f01                                                  ; $8f1f : $f0, $e0

	bvs br_3c_8f73                                                  ; $8f21 : $70, $50

	iny                                                  ; $8f23 : $c8
	cpy #$9a35.w                                                  ; $8f24 : $c0, $35, $9a
	stz $eb, X                                                  ; $8f27 : $74, $eb
	clc                                                  ; $8f29 : $18
	pei ($33)                                                  ; $8f2a : $d4, $33
	sbc $0c, X                                                  ; $8f2c : $f5, $0c
	nop                                                  ; $8f2e : $ea
	ora $7093.w, Y                                                  ; $8f2f : $19, $93, $70
	clc                                                  ; $8f32 : $18
	sed                                                  ; $8f33 : $f8
	ora $3d                                                  ; $8f34 : $05, $3d
	asl $037f.w                                                  ; $8f36 : $0e, $7f, $03

br_3c_8f39:
	ora $013f07.l, X                                                  ; $8f39 : $1f, $07, $3f, $01
	ora $401f03.l                                                  ; $8f3d : $0f, $03, $1f, $40
	.db $00                                                  ; $8f41 : $00
	bit $42                                                  ; $8f42 : $24, $42
	lda $ca0c.w                                                  ; $8f44 : $ad, $0c, $ca
	sta $1ea2.w, Y                                                  ; $8f47 : $99, $a2, $1e
	sbc $5d44.w, X                                                  ; $8f4a : $fd, $44, $5d
	sta $2a, S                                                  ; $8f4d : $83, $2a
	ldx $60, Y                                                  ; $8f4f : $b6, $60
	.db $00                                                  ; $8f51 : $00
	ror $b162.w, X                                                  ; $8f52 : $7e, $62, $b1

br_3c_8f55:
	cmp $e09f63.l                                                  ; $8f55 : $cf, $63, $9f, $e0
	ora $dcc7b9.l, X                                                  ; $8f59 : $1f, $b9, $c7, $dc
	sbc $88, S                                                  ; $8f5d : $e3, $88
	sbc [$00], Y                                                  ; $8f5f : $f7, $00
	.db $00                                                  ; $8f61 : $00
	.db $00                                                  ; $8f62 : $00
	.db $00                                                  ; $8f63 : $00
	.db $00                                                  ; $8f64 : $00
	.db $00                                                  ; $8f65 : $00
	.db $00                                                  ; $8f66 : $00
	.db $00                                                  ; $8f67 : $00
	.db $00                                                  ; $8f68 : $00
	.db $00                                                  ; $8f69 : $00
	.db $00                                                  ; $8f6a : $00
	.db $00                                                  ; $8f6b : $00
	.db $00                                                  ; $8f6c : $00
	.db $00                                                  ; $8f6d : $00
	ora ($01, X)                                                  ; $8f6e : $01, $01

br_3c_8f70:
	.db $00                                                  ; $8f70 : $00
	.db $00                                                  ; $8f71 : $00
	.db $00                                                  ; $8f72 : $00

br_3c_8f73:
	.db $00                                                  ; $8f73 : $00
	.db $00                                                  ; $8f74 : $00
	.db $00                                                  ; $8f75 : $00
	.db $00                                                  ; $8f76 : $00
	.db $00                                                  ; $8f77 : $00
	.db $00                                                  ; $8f78 : $00
	.db $00                                                  ; $8f79 : $00
	.db $00                                                  ; $8f7a : $00
	.db $00                                                  ; $8f7b : $00
	ora ($01, X)                                                  ; $8f7c : $01, $01
	ora $02, S                                                  ; $8f7e : $03, $02
	.db $00                                                  ; $8f80 : $00
	.db $00                                                  ; $8f81 : $00
	.db $00                                                  ; $8f82 : $00
	.db $00                                                  ; $8f83 : $00
	tsb $07                                                  ; $8f84 : $04, $07
	asl $19, X                                                  ; $8f86 : $16, $19
	asl $3c22.w, X                                                  ; $8f88 : $1e, $22, $3c
	mvp $80, $7f                                                  ; $8f8b : $44, $7f, $80
	sbc $000000.l, X                                                  ; $8f8e : $ff, $00, $00, $00
	ora ($01, X)                                                  ; $8f92 : $01, $01
	ora $203908.l                                                  ; $8f94 : $0f, $08, $39, $20
	adc $41, S                                                  ; $8f98 : $63, $41
	cmp [$83]                                                  ; $8f9a : $c7, $83
	bra br_3c_8f9e                                                  ; $8f9c : $80, $00

br_3c_8f9e:
	.db $00                                                  ; $8f9e : $00
	.db $00                                                  ; $8f9f : $00
	.db $00                                                  ; $8fa0 : $00
	.db $00                                                  ; $8fa1 : $00
	asl $b800.w                                                  ; $8fa2 : $0e, $00, $b8
	.db $80, $60                                                  ; $8fa5 : $80, $60

	.db $00                                                  ; $8fa7 : $00
	cpy #$7b00.w                                                  ; $8fa8 : $c0, $00, $7b
	sei                                                  ; $8fab : $78
	tay                                                  ; $8fac : $a8
	rts                                                  ; $8fad : $60


	bvc br_3c_8f70                                                  ; $8fae : $50, $c0

	.db $00                                                  ; $8fb0 : $00
	.db $00                                                  ; $8fb1 : $00

br_3c_8fb2:
	beq br_3c_8fb2                                                  ; $8fb2 : $f0, $fe

	cpy #$8078.w                                                  ; $8fb4 : $c0, $78, $80

br_3c_8fb7:
	cpx #$ff3f.w                                                  ; $8fb7 : $e0, $3f, $ff
	jsr ($7f87.w, X)                                                  ; $8fba : $fc, $87, $7f
	bpl br_3c_8fb7                                                  ; $8fbd : $10, $f8

	jsr $0000.w                                                  ; $8fbf : $20, $00, $00
	.db $00                                                  ; $8fc2 : $00
	.db $00                                                  ; $8fc3 : $00
	.db $00                                                  ; $8fc4 : $00
	.db $00                                                  ; $8fc5 : $00
	.db $00                                                  ; $8fc6 : $00
	.db $00                                                  ; $8fc7 : $00
	cpy #$0000.w                                                  ; $8fc8 : $c0, $00, $00
	.db $00                                                  ; $8fcb : $00
	rti                                                  ; $8fcc : $40


	.db $00                                                  ; $8fcd : $00
	bmi br_3c_8fd0                                                  ; $8fce : $30, $00

br_3c_8fd0:
	.db $00                                                  ; $8fd0 : $00
	.db $00                                                  ; $8fd1 : $00
	.db $00                                                  ; $8fd2 : $00
	.db $00                                                  ; $8fd3 : $00
	.db $00                                                  ; $8fd4 : $00
	.db $00                                                  ; $8fd5 : $00
	.db $00                                                  ; $8fd6 : $00
	.db $00                                                  ; $8fd7 : $00
	.db $00                                                  ; $8fd8 : $00
	cpy #$0000.w                                                  ; $8fd9 : $c0, $00, $00
	cpy #$3000.w                                                  ; $8fdc : $c0, $00, $30
	.db $00                                                  ; $8fdf : $00
	.db $00                                                  ; $8fe0 : $00

br_3c_8fe1:
	.db $00                                                  ; $8fe1 : $00
	.db $00                                                  ; $8fe2 : $00
	.db $00                                                  ; $8fe3 : $00
	cpy #$2000.w                                                  ; $8fe4 : $c0, $00, $20
	.db $00                                                  ; $8fe7 : $00
	bpl br_3c_8fea                                                  ; $8fe8 : $10, $00

br_3c_8fea:
	.db $00                                                  ; $8fea : $00
	.db $00                                                  ; $8feb : $00
	tsb $8280.w                                                  ; $8fec : $0c, $80, $82
	rti                                                  ; $8fef : $40


	.db $00                                                  ; $8ff0 : $00
	.db $00                                                  ; $8ff1 : $00
	.db $00                                                  ; $8ff2 : $00
	.db $00                                                  ; $8ff3 : $00
	cpy #$2000.w                                                  ; $8ff4 : $c0, $00, $20

br_3c_8ff7:
	.db $00                                                  ; $8ff7 : $00
	bvs br_3c_8ffa                                                  ; $8ff8 : $70, $00

br_3c_8ffa:
	.db $00                                                  ; $8ffa : $00
	.db $00                                                  ; $8ffb : $00
	sty $c280.w                                                  ; $8ffc : $8c, $80, $c2
	cpy #$0002.w                                                  ; $8fff : $c0, $02, $00
	ora $00, S                                                  ; $9002 : $03, $00
	ora [$00]                                                  ; $9004 : $07, $00
	asl $01                                                  ; $9006 : $06, $01
	cop $04.b                                                  ; $9008 : $02, $04
	phd                                                  ; $900a : $0b
	ora ($1c, S), Y                                                  ; $900b : $13, $1c
	and $050f28.l                                                  ; $900d : $2f, $28, $0f, $05
	ora [$04]                                                  ; $9011 : $07, $04
	ora [$00]                                                  ; $9013 : $07, $00
	ora [$09]                                                  ; $9015 : $07, $09
	ora $180f0e.l                                                  ; $9017 : $0f, $0e, $0f, $18
	ora $203f30.l, X                                                  ; $901b : $1f, $30, $3f, $20
	and $fd817e.l, X                                                  ; $901f : $3f, $7e, $81, $fd
	sta $7f, S                                                  ; $9023 : $83, $7f
	.db $00                                                  ; $9025 : $00
	adc $403f80.l, X                                                  ; $9026 : $7f, $80, $3f, $40
	adc $c07fc0.l, X                                                  ; $902a : $7f, $c0, $7f, $c0
	adc $0081c0.l, X                                                  ; $902e : $7f, $c0, $81, $00
	sta $00, S                                                  ; $9032 : $83, $00
	.db $80, $80                                                  ; $9034 : $80, $80

	.db $80, $80                                                  ; $9036 : $80, $80

	rti                                                  ; $9038 : $40


	.db $80, $40                                                  ; $9039 : $80, $40

	bra br_3c_907d                                                  ; $903b : $80, $40

	.db $80, $40                                                  ; $903d : $80, $40

	bra br_3c_8fe1                                                  ; $903f : $80, $a0

	bra br_3c_9043                                                  ; $9041 : $80, $00

br_3c_9043:
	.db $00                                                  ; $9043 : $00
	sbc #$d718.w                                                  ; $9044 : $e9, $18, $d7
	bmi br_3c_8ff7                                                  ; $9047 : $30, $ae

	rts                                                  ; $9049 : $60


	eor $b3c1.w, X                                                  ; $904a : $5d, $c1, $b3
	.db $70, $dc                                                  ; $904d : $70, $dc

	bit $40f0.w, X                                                  ; $904f : $3c, $f0, $40
	sbc $071eff.l, X                                                  ; $9052 : $ff, $ff, $1e, $07
	sec                                                  ; $9056 : $38
	ora $e01f70.l                                                  ; $9057 : $0f, $70, $1f, $e0
	and $3f0f7c.l, X                                                  ; $905b : $3f, $7c, $0f, $3f
	ora $08, S                                                  ; $905f : $03, $08
	.db $00                                                  ; $9061 : $00
	adc $02, X                                                  ; $9062 : $75, $02
	sed                                                  ; $9064 : $f8
	and $f90a.w, Y                                                  ; $9065 : $39, $0a, $f9
	brl br_3c_9669                                                  ; $9068 : $82, $fe, $05

	jsr ($7fc1.w, X)                                                  ; $906b : $fc, $c1, $7f
	sbc ($0e)                                                  ; $906e : $f2, $0e
	clc                                                  ; $9070 : $18
	.db $00                                                  ; $9071 : $00
	sta $f907f2.l                                                  ; $9072 : $8f, $f2, $07, $f9
	ora $ff, S                                                  ; $9076 : $03, $ff
	.db $00                                                  ; $9078 : $00
	sbc $00ff01.l, X                                                  ; $9079 : $ff, $01, $ff, $00

br_3c_907d:
	sbc $42ff00.l, X                                                  ; $907d : $ff, $00, $ff, $42
	.db $00                                                  ; $9081 : $00
	ora ($00, X)                                                  ; $9082 : $01, $00
	.db $00                                                  ; $9084 : $00
	.db $70, $a8                                                  ; $9085 : $70, $a8

	bit $da                                                  ; $9087 : $24, $da
	ora $ba24.w, Y                                                  ; $9089 : $19, $24, $ba
	adc #$9208.w                                                  ; $908c : $69, $08, $92
	lsr $007e.w, X                                                  ; $908f : $5e, $7e, $00
	ora ($00, X)                                                  ; $9092 : $01, $00
	.db $70, $70                                                  ; $9094 : $70, $70

	sty $c3fc.w                                                  ; $9096 : $8c, $fc, $c3
	sbc $61fe86.l, X                                                  ; $9099 : $ff, $86, $fe, $61
	sbc $00ffc0.l, X                                                  ; $909d : $ff, $c0, $ff, $00
	.db $00                                                  ; $90a1 : $00
	.db $00                                                  ; $90a2 : $00
	.db $00                                                  ; $90a3 : $00
	.db $00                                                  ; $90a4 : $00
	.db $00                                                  ; $90a5 : $00
	.db $00                                                  ; $90a6 : $00
	.db $00                                                  ; $90a7 : $00
	.db $00                                                  ; $90a8 : $00
	.db $00                                                  ; $90a9 : $00
	.db $00                                                  ; $90aa : $00
	.db $00                                                  ; $90ab : $00
	.db $00                                                  ; $90ac : $00
	.db $00                                                  ; $90ad : $00
	.db $00                                                  ; $90ae : $00
	.db $00                                                  ; $90af : $00
	.db $00                                                  ; $90b0 : $00
	.db $00                                                  ; $90b1 : $00
	.db $00                                                  ; $90b2 : $00
	.db $00                                                  ; $90b3 : $00
	.db $00                                                  ; $90b4 : $00
	.db $00                                                  ; $90b5 : $00
	.db $00                                                  ; $90b6 : $00
	.db $00                                                  ; $90b7 : $00
	.db $00                                                  ; $90b8 : $00
	.db $00                                                  ; $90b9 : $00
	.db $00                                                  ; $90ba : $00
	.db $00                                                  ; $90bb : $00
	.db $00                                                  ; $90bc : $00
	ora ($00, X)                                                  ; $90bd : $01, $00
	ora $00, S                                                  ; $90bf : $03, $00
	.db $00                                                  ; $90c1 : $00
	.db $00                                                  ; $90c2 : $00
	.db $00                                                  ; $90c3 : $00
	.db $00                                                  ; $90c4 : $00
	.db $00                                                  ; $90c5 : $00
	.db $00                                                  ; $90c6 : $00
	.db $00                                                  ; $90c7 : $00
	.db $00                                                  ; $90c8 : $00
	.db $00                                                  ; $90c9 : $00
	.db $00                                                  ; $90ca : $00
	.db $00                                                  ; $90cb : $00
	.db $00                                                  ; $90cc : $00
	.db $00                                                  ; $90cd : $00
	.db $00                                                  ; $90ce : $00
	.db $00                                                  ; $90cf : $00
	.db $00                                                  ; $90d0 : $00
	.db $00                                                  ; $90d1 : $00
	.db $00                                                  ; $90d2 : $00
	.db $00                                                  ; $90d3 : $00
	.db $00                                                  ; $90d4 : $00
	.db $00                                                  ; $90d5 : $00
	.db $00                                                  ; $90d6 : $00
	ora $003f00.l                                                  ; $90d7 : $0f, $00, $3f, $00
	sbc $00ff00.l, X                                                  ; $90db : $ff, $00, $ff, $00
	sbc $000000.l, X                                                  ; $90df : $ff, $00, $00, $00
	.db $00                                                  ; $90e3 : $00
	.db $00                                                  ; $90e4 : $00
	.db $00                                                  ; $90e5 : $00
	.db $00                                                  ; $90e6 : $00
	.db $00                                                  ; $90e7 : $00
	.db $00                                                  ; $90e8 : $00
	.db $00                                                  ; $90e9 : $00
	.db $00                                                  ; $90ea : $00
	ora ($01, X)                                                  ; $90eb : $01, $01
	cop $03.b                                                  ; $90ed : $02, $03
	ora $00                                                  ; $90ef : $05, $00
	.db $00                                                  ; $90f1 : $00
	.db $00                                                  ; $90f2 : $00
	.db $00                                                  ; $90f3 : $00
	.db $00                                                  ; $90f4 : $00
	.db $00                                                  ; $90f5 : $00
	.db $00                                                  ; $90f6 : $00
	.db $00                                                  ; $90f7 : $00
	.db $00                                                  ; $90f8 : $00
	.db $00                                                  ; $90f9 : $00
	ora ($01, X)                                                  ; $90fa : $01, $01
	ora $03, S                                                  ; $90fc : $03, $03
	asl $07                                                  ; $90fe : $06, $07
	.db $00                                                  ; $9100 : $00
	.db $00                                                  ; $9101 : $00
	.db $00                                                  ; $9102 : $00
	.db $00                                                  ; $9103 : $00
	.db $00                                                  ; $9104 : $00
	ora $3f300f.l                                                  ; $9105 : $0f, $0f, $30, $3f
	cmp $ff30ff.l                                                  ; $9109 : $cf, $ff, $30, $ff
	cpy #$00ff.w                                                  ; $910d : $c0, $ff, $00
	.db $00                                                  ; $9110 : $00
	.db $00                                                  ; $9111 : $00
	.db $00                                                  ; $9112 : $00
	.db $00                                                  ; $9113 : $00
	ora $3f3f0f.l                                                  ; $9114 : $0f, $0f, $3f, $3f
	.db $f0, $ff                                                  ; $9118 : $f0, $ff

	cpy #$00f0.w                                                  ; $911a : $c0, $f0, $00
	cpy #$0000.w                                                  ; $911d : $c0, $00, $00
	.db $00                                                  ; $9120 : $00
	.db $00                                                  ; $9121 : $00
	.db $00                                                  ; $9122 : $00
	.db $00                                                  ; $9123 : $00
	.db $00                                                  ; $9124 : $00
	.db $00                                                  ; $9125 : $00
	.db $00                                                  ; $9126 : $00
	ora ($01, X)                                                  ; $9127 : $01, $01
	cop $03.b                                                  ; $9129 : $02, $03
	ora $07                                                  ; $912b : $05, $07
	asl                                                  ; $912d : $0a
	ora $000014.l                                                  ; $912e : $0f, $14, $00, $00
	.db $00                                                  ; $9132 : $00
	.db $00                                                  ; $9133 : $00
	.db $00                                                  ; $9134 : $00
	.db $00                                                  ; $9135 : $00
	ora ($01, X)                                                  ; $9136 : $01, $01
	ora $03, S                                                  ; $9138 : $03, $03
	asl $07                                                  ; $913a : $06, $07
	tsb $180e.w                                                  ; $913c : $0c, $0e, $18
	trb $0000.w                                                  ; $913f : $1c, $00, $00
	.db $00                                                  ; $9142 : $00
	ora $7f601f.l, X                                                  ; $9143 : $1f, $1f, $60, $7f
	sta $ff60ff.l, X                                                  ; $9147 : $9f, $ff, $60, $ff
	.db $80, $ff                                                  ; $914b : $80, $ff

	ora [$f8]                                                  ; $914d : $07, $f8
	clc                                                  ; $914f : $18
	.db $00                                                  ; $9150 : $00
	.db $00                                                  ; $9151 : $00
	ora $7f7f1f.l, X                                                  ; $9152 : $1f, $1f, $7f, $7f
	cpx #$80ff.w                                                  ; $9156 : $e0, $ff, $80
	cpx #$8000.w                                                  ; $9159 : $e0, $00, $80
	.db $00                                                  ; $915c : $00
	ora [$00]                                                  ; $915d : $07, $00
	clc                                                  ; $915f : $18
	.db $00                                                  ; $9160 : $00
	.db $00                                                  ; $9161 : $00
	.db $00                                                  ; $9162 : $00
	.db $00                                                  ; $9163 : $00
	.db $00                                                  ; $9164 : $00
	.db $00                                                  ; $9165 : $00
	.db $00                                                  ; $9166 : $00
	.db $00                                                  ; $9167 : $00
	.db $00                                                  ; $9168 : $00
	.db $00                                                  ; $9169 : $00
	.db $00                                                  ; $916a : $00
	.db $00                                                  ; $916b : $00
	.db $00                                                  ; $916c : $00
	.db $00                                                  ; $916d : $00
	.db $00                                                  ; $916e : $00
	.db $00                                                  ; $916f : $00
	.db $00                                                  ; $9170 : $00
	ora [$00]                                                  ; $9171 : $07, $00
	ora [$00]                                                  ; $9173 : $07, $00
	ora $000f00.l                                                  ; $9175 : $0f, $00, $0f, $00
	ora $001f00.l, X                                                  ; $9179 : $1f, $00, $1f, $00
	ora $001f00.l, X                                                  ; $917d : $1f, $00, $1f, $00
	.db $00                                                  ; $9181 : $00
	.db $00                                                  ; $9182 : $00
	.db $00                                                  ; $9183 : $00
	.db $00                                                  ; $9184 : $00
	.db $00                                                  ; $9185 : $00

br_3c_9186:
	.db $00                                                  ; $9186 : $00
	.db $00                                                  ; $9187 : $00
	.db $00                                                  ; $9188 : $00
	.db $00                                                  ; $9189 : $00
	.db $00                                                  ; $918a : $00
	.db $00                                                  ; $918b : $00
	.db $00                                                  ; $918c : $00
	.db $00                                                  ; $918d : $00
	.db $00                                                  ; $918e : $00
	.db $00                                                  ; $918f : $00
	.db $00                                                  ; $9190 : $00
	sbc $00ff00.l, X                                                  ; $9191 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $9195 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $9199 : $ff, $00, $ff, $00
	sbc $07ff00.l, X                                                  ; $919d : $ff, $00, $ff, $07
	asl                                                  ; $91a1 : $0a
	ora [$0a]                                                  ; $91a2 : $07, $0a
	ora $140f14.l                                                  ; $91a4 : $0f, $14, $0f, $14
	ora $281f28.l, X                                                  ; $91a8 : $1f, $28, $1f, $28
	ora $281f28.l, X                                                  ; $91ac : $1f, $28, $1f, $28
	tsb $0c0e.w                                                  ; $91b0 : $0c, $0e, $0c
	asl $1c18.w                                                  ; $91b3 : $0e, $18, $1c
	clc                                                  ; $91b6 : $18
	trb $3830.w                                                  ; $91b7 : $1c, $30, $38
	bmi br_3c_91f4                                                  ; $91ba : $30, $38

	bmi br_3c_91f6                                                  ; $91bc : $30, $38

	.db $30, $38                                                  ; $91be : $30, $38

	sbc $00ff00.l, X                                                  ; $91c0 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $91c4 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $91c8 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $91cc : $ff, $00, $ff, $00
	.db $00                                                  ; $91d0 : $00
	.db $00                                                  ; $91d1 : $00
	.db $00                                                  ; $91d2 : $00
	.db $00                                                  ; $91d3 : $00
	.db $00                                                  ; $91d4 : $00
	.db $00                                                  ; $91d5 : $00

br_3c_91d6:
	.db $00                                                  ; $91d6 : $00
	.db $00                                                  ; $91d7 : $00
	.db $00                                                  ; $91d8 : $00
	.db $00                                                  ; $91d9 : $00
	.db $00                                                  ; $91da : $00
	.db $00                                                  ; $91db : $00
	.db $00                                                  ; $91dc : $00
	.db $00                                                  ; $91dd : $00
	.db $00                                                  ; $91de : $00
	.db $00                                                  ; $91df : $00
	ora $281f14.l                                                  ; $91e0 : $0f, $14, $1f, $28
	ora $513f28.l, X                                                  ; $91e4 : $1f, $28, $3f, $51
	and $523e51.l, X                                                  ; $91e8 : $3f, $51, $3e, $52
	rol $3e52.w, X                                                  ; $91ec : $3e, $52, $3e
	eor ($18)                                                  ; $91ef : $52, $18
	trb $3830.w                                                  ; $91f1 : $1c, $30, $38

br_3c_91f4:
	.db $30, $38                                                  ; $91f4 : $30, $38

br_3c_91f6:
	rts                                                  ; $91f6 : $60


	adc ($60), Y                                                  ; $91f7 : $71, $60
	adc ($60), Y                                                  ; $91f9 : $71, $60
	adc ($60)                                                  ; $91fb : $72, $60
	adc ($60)                                                  ; $91fd : $72, $60
	adc ($e0)                                                  ; $91ff : $72, $e0
	jsr $40c0.w                                                  ; $9201 : $20, $c0, $40
	bra br_3c_9186                                                  ; $9204 : $80, $80

	ora $03, S                                                  ; $9206 : $03, $03
	ora $080f0c.l                                                  ; $9208 : $0f, $0c, $0f, $08
	ora $101f10.l, X                                                  ; $920c : $1f, $10, $1f, $10
	.db $00                                                  ; $9210 : $00
	jsr $4000.w                                                  ; $9211 : $20, $00, $40
	.db $00                                                  ; $9214 : $00
	bra br_3c_9217                                                  ; $9215 : $80, $00

br_3c_9217:
	ora $00, S                                                  ; $9217 : $03, $00
	tsb $0800.w                                                  ; $9219 : $0c, $00, $08
	.db $00                                                  ; $921c : $00
	bpl br_3c_921f                                                  ; $921d : $10, $00

br_3c_921f:
	bpl br_3c_9221                                                  ; $921f : $10, $00

br_3c_9221:
	.db $00                                                  ; $9221 : $00
	.db $00                                                  ; $9222 : $00
	.db $00                                                  ; $9223 : $00
	.db $00                                                  ; $9224 : $00
	.db $00                                                  ; $9225 : $00
	.db $00                                                  ; $9226 : $00
	cop $00.b                                                  ; $9227 : $02, $00
	tsb $00                                                  ; $9229 : $04, $00
	php                                                  ; $922b : $08
	.db $00                                                  ; $922c : $00
	bpl br_3c_922f                                                  ; $922d : $10, $00

br_3c_922f:
	.db $00                                                  ; $922f : $00
	.db $00                                                  ; $9230 : $00
	.db $00                                                  ; $9231 : $00
	.db $00                                                  ; $9232 : $00
	.db $00                                                  ; $9233 : $00
	.db $00                                                  ; $9234 : $00
	.db $00                                                  ; $9235 : $00
	cop $02.b                                                  ; $9236 : $02, $02
	tsb $04                                                  ; $9238 : $04, $04
	php                                                  ; $923a : $08
	php                                                  ; $923b : $08

br_3c_923c:
	bpl br_3c_924e                                                  ; $923c : $10, $10

br_3c_923e:
	.db $00                                                  ; $923e : $00
	.db $00                                                  ; $923f : $00
	.db $00                                                  ; $9240 : $00
	asl $00                                                  ; $9241 : $06, $00
	bmi br_3c_9245                                                  ; $9243 : $30, $00

br_3c_9245:
	bra br_3c_9247                                                  ; $9245 : $80, $00

br_3c_9247:
	.db $00                                                  ; $9247 : $00
	.db $00                                                  ; $9248 : $00
	.db $00                                                  ; $9249 : $00
	.db $00                                                  ; $924a : $00
	.db $00                                                  ; $924b : $00
	.db $00                                                  ; $924c : $00
	.db $00                                                  ; $924d : $00

br_3c_924e:
	.db $00                                                  ; $924e : $00
	.db $00                                                  ; $924f : $00
	asl $06                                                  ; $9250 : $06, $06
	bmi br_3c_9284                                                  ; $9252 : $30, $30

	bra br_3c_91d6                                                  ; $9254 : $80, $80

	.db $00                                                  ; $9256 : $00
	.db $00                                                  ; $9257 : $00
	.db $00                                                  ; $9258 : $00
	.db $00                                                  ; $9259 : $00
	.db $00                                                  ; $925a : $00
	.db $00                                                  ; $925b : $00
	.db $00                                                  ; $925c : $00
	.db $00                                                  ; $925d : $00
	.db $00                                                  ; $925e : $00
	.db $00                                                  ; $925f : $00
	.db $00                                                  ; $9260 : $00
	.db $00                                                  ; $9261 : $00
	.db $00                                                  ; $9262 : $00
	.db $00                                                  ; $9263 : $00
	.db $00                                                  ; $9264 : $00
	.db $00                                                  ; $9265 : $00
	.db $00                                                  ; $9266 : $00
	ora $03, S                                                  ; $9267 : $03, $03
	ora $06                                                  ; $9269 : $05, $06
	asl                                                  ; $926b : $0a
	tsb $0814.w                                                  ; $926c : $0c, $14, $08
	clc                                                  ; $926f : $18
	.db $00                                                  ; $9270 : $00
	.db $00                                                  ; $9271 : $00
	.db $00                                                  ; $9272 : $00
	.db $00                                                  ; $9273 : $00
	.db $00                                                  ; $9274 : $00
	.db $00                                                  ; $9275 : $00
	ora $03, S                                                  ; $9276 : $03, $03

br_3c_9278:
	asl $07                                                  ; $9278 : $06, $07
	tsb $180e.w                                                  ; $927a : $0c, $0e, $18
	trb $1810.w                                                  ; $927d : $1c, $10, $18
	.db $00                                                  ; $9280 : $00
	ora [$07]                                                  ; $9281 : $07, $07
	sec                                                  ; $9283 : $38

br_3c_9284:
	and $60e0df.l, X                                                  ; $9284 : $3f, $df, $e0, $60
	.db $80, $80                                                  ; $9288 : $80, $80

	.db $00                                                  ; $928a : $00
	.db $00                                                  ; $928b : $00
	.db $00                                                  ; $928c : $00
	.db $00                                                  ; $928d : $00
	.db $00                                                  ; $928e : $00
	.db $00                                                  ; $928f : $00
	ora [$07]                                                  ; $9290 : $07, $07
	and $ffe03f.l, X                                                  ; $9292 : $3f, $3f, $e0, $ff
	bra br_3c_9278                                                  ; $9296 : $80, $e0

	.db $00                                                  ; $9298 : $00
	bra br_3c_929b                                                  ; $9299 : $80, $00

br_3c_929b:
	.db $00                                                  ; $929b : $00
	.db $00                                                  ; $929c : $00
	.db $00                                                  ; $929d : $00
	.db $00                                                  ; $929e : $00
	.db $00                                                  ; $929f : $00
	.db $00                                                  ; $92a0 : $00
	jsr $0000.w                                                  ; $92a1 : $20, $00, $00
	.db $00                                                  ; $92a4 : $00
	rti                                                  ; $92a5 : $40


	.db $00                                                  ; $92a6 : $00
	rti                                                  ; $92a7 : $40


	.db $00                                                  ; $92a8 : $00
	.db $00                                                  ; $92a9 : $00
	.db $00                                                  ; $92aa : $00
	bra br_3c_92ad                                                  ; $92ab : $80, $00

br_3c_92ad:
	bra br_3c_92af                                                  ; $92ad : $80, $00

br_3c_92af:
	.db $00                                                  ; $92af : $00
	jsr $0020.w                                                  ; $92b0 : $20, $20, $00
	.db $00                                                  ; $92b3 : $00
	rti                                                  ; $92b4 : $40


	rti                                                  ; $92b5 : $40


	rti                                                  ; $92b6 : $40


	rti                                                  ; $92b7 : $40


	.db $00                                                  ; $92b8 : $00
	.db $00                                                  ; $92b9 : $00
	bra br_3c_923c                                                  ; $92ba : $80, $80

	bra br_3c_923e                                                  ; $92bc : $80, $80

	.db $00                                                  ; $92be : $00
	.db $00                                                  ; $92bf : $00
	.db $00                                                  ; $92c0 : $00
	.db $00                                                  ; $92c1 : $00

br_3c_92c2:
	.db $00                                                  ; $92c2 : $00
	.db $00                                                  ; $92c3 : $00
	.db $00                                                  ; $92c4 : $00
	.db $00                                                  ; $92c5 : $00
	.db $00                                                  ; $92c6 : $00
	.db $00                                                  ; $92c7 : $00
	.db $00                                                  ; $92c8 : $00
	.db $00                                                  ; $92c9 : $00
	.db $00                                                  ; $92ca : $00
	.db $00                                                  ; $92cb : $00
	.db $00                                                  ; $92cc : $00
	ora ($01, X)                                                  ; $92cd : $01, $01
	cop $00.b                                                  ; $92cf : $02, $00
	.db $00                                                  ; $92d1 : $00
	.db $00                                                  ; $92d2 : $00
	.db $00                                                  ; $92d3 : $00
	.db $00                                                  ; $92d4 : $00
	.db $00                                                  ; $92d5 : $00
	.db $00                                                  ; $92d6 : $00
	.db $00                                                  ; $92d7 : $00
	.db $00                                                  ; $92d8 : $00
	.db $00                                                  ; $92d9 : $00
	.db $00                                                  ; $92da : $00
	.db $00                                                  ; $92db : $00
	ora ($01, X)                                                  ; $92dc : $01, $01
	ora $03, S                                                  ; $92de : $03, $03
	clc                                                  ; $92e0 : $18
	plp                                                  ; $92e1 : $28
	bpl br_3c_9314                                                  ; $92e2 : $10, $30

	bmi br_3c_9336                                                  ; $92e4 : $30, $50

	jsr $2060.w                                                  ; $92e6 : $20, $60, $20
	rts                                                  ; $92e9 : $60


	rts                                                  ; $92ea : $60


	ldy #$a060.w                                                  ; $92eb : $a0, $60, $a0
	rts                                                  ; $92ee : $60


	ldy #$3830.w                                                  ; $92ef : $a0, $30, $38
	jsr $6030.w                                                  ; $92f2 : $20, $30, $60
	bvs br_3c_9337                                                  ; $92f5 : $70, $40

	rts                                                  ; $92f7 : $60


	rti                                                  ; $92f8 : $40


	rts                                                  ; $92f9 : $60


	cpy #$c0e0.w                                                  ; $92fa : $c0, $e0, $c0
	cpx #$e0c0.w                                                  ; $92fd : $e0, $c0, $e0
	.db $00                                                  ; $9300 : $00
	.db $00                                                  ; $9301 : $00
	.db $00                                                  ; $9302 : $00
	.db $00                                                  ; $9303 : $00
	.db $00                                                  ; $9304 : $00
	.db $00                                                  ; $9305 : $00
	.db $00                                                  ; $9306 : $00
	.db $00                                                  ; $9307 : $00
	ora $00, S                                                  ; $9308 : $03, $00
	ora [$03]                                                  ; $930a : $07, $03
	ora $040f06.l                                                  ; $930c : $0f, $06, $0f, $04
	.db $00                                                  ; $9310 : $00
	.db $00                                                  ; $9311 : $00
	.db $00                                                  ; $9312 : $00
	.db $00                                                  ; $9313 : $00

br_3c_9314:
	.db $00                                                  ; $9314 : $00
	.db $00                                                  ; $9315 : $00
	.db $00                                                  ; $9316 : $00
	.db $00                                                  ; $9317 : $00
	ora $03, S                                                  ; $9318 : $03, $03
	tsb $07                                                  ; $931a : $04, $07
	php                                                  ; $931c : $08
	asl $0c08.w                                                  ; $931d : $0e, $08, $0c
	ora $03, S                                                  ; $9320 : $03, $03
	.db $10, $1f                                                  ; $9322 : $10, $1f

	and $605f30.l                                                  ; $9324 : $2f, $30, $5f, $60
	and $80ff40.l, X                                                  ; $9328 : $3f, $40, $ff, $80
	adc $807f80.l, X                                                  ; $932c : $7f, $80, $7f, $80
	tsb $00                                                  ; $9330 : $04, $00
	.db $00                                                  ; $9332 : $00
	.db $00                                                  ; $9333 : $00
	.db $00                                                  ; $9334 : $00
	.db $00                                                  ; $9335 : $00

br_3c_9336:
	.db $00                                                  ; $9336 : $00

br_3c_9337:
	.db $00                                                  ; $9337 : $00
	bra br_3c_933a                                                  ; $9338 : $80, $00

br_3c_933a:
	.db $00                                                  ; $933a : $00
	.db $00                                                  ; $933b : $00
	.db $00                                                  ; $933c : $00
	.db $00                                                  ; $933d : $00
	.db $00                                                  ; $933e : $00
	.db $00                                                  ; $933f : $00
	bra br_3c_92c2                                                  ; $9340 : $80, $80

	jsr $80e0.w                                                  ; $9342 : $20, $e0, $80
	bvs br_3c_9357                                                  ; $9345 : $70, $10

	.db $f0, $e4                                                  ; $9347 : $f0, $e4

	trb $38c8.w                                                  ; $9349 : $1c, $c8, $38
	plx                                                  ; $934c : $fa
	asl $e4                                                  ; $934d : $06, $e4
	trb $0040.w                                                  ; $934f : $1c, $40, $00
	bpl br_3c_9354                                                  ; $9352 : $10, $00

br_3c_9354:
	php                                                  ; $9354 : $08
	.db $00                                                  ; $9355 : $00
	.db $00                                                  ; $9356 : $00

br_3c_9357:
	.db $00                                                  ; $9357 : $00
	cop $00.b                                                  ; $9358 : $02, $00
	tsb $00                                                  ; $935a : $04, $00
	ora ($00, X)                                                  ; $935c : $01, $00
	cop $00.b                                                  ; $935e : $02, $00
	.db $00                                                  ; $9360 : $00
	.db $00                                                  ; $9361 : $00
	ora $03, S                                                  ; $9362 : $03, $03
	clc                                                  ; $9364 : $18
	ora $2f1837.l                                                  ; $9365 : $0f, $37, $18, $2f
	.db $30, $1f                                                  ; $9369 : $30, $1f

	jsr $605f.w                                                  ; $936b : $20, $5f, $60
	eor $000060.l, X                                                  ; $936e : $5f, $60, $00, $00
	tsb $00                                                  ; $9372 : $04, $00
	bpl br_3c_9376                                                  ; $9374 : $10, $00

br_3c_9376:
	jsr $0000.w                                                  ; $9376 : $20, $00, $00
	.db $00                                                  ; $9379 : $00
	rti                                                  ; $937a : $40


	.db $00                                                  ; $937b : $00
	.db $00                                                  ; $937c : $00
	.db $00                                                  ; $937d : $00
	.db $00                                                  ; $937e : $00
	.db $00                                                  ; $937f : $00
	.db $00                                                  ; $9380 : $00
	.db $00                                                  ; $9381 : $00
	.db $00                                                  ; $9382 : $00
	.db $00                                                  ; $9383 : $00
	rti                                                  ; $9384 : $40


	cpy #$20c0.w                                                  ; $9385 : $c0, $c0, $20
	ldy #$e860.w                                                  ; $9388 : $a0, $60, $e8
	clc                                                  ; $938b : $18
	bne br_3c_93be                                                  ; $938c : $d0, $30

	pea $000c.w                                                  ; $938e : $f4, $0c, $00
	.db $00                                                  ; $9391 : $00

Call_3c_9392:
	bra br_3c_9394                                                  ; $9392 : $80, $00

br_3c_9394:
	jsr $1000.w                                                  ; $9394 : $20, $00, $10
	.db $00                                                  ; $9397 : $00
	.db $00                                                  ; $9398 : $00
	.db $00                                                  ; $9399 : $00
	tsb $00                                                  ; $939a : $04, $00
	php                                                  ; $939c : $08
	.db $00                                                  ; $939d : $00
	cop $00.b                                                  ; $939e : $02, $00
	.db $00                                                  ; $93a0 : $00
	.db $00                                                  ; $93a1 : $00
	.db $00                                                  ; $93a2 : $00
	.db $00                                                  ; $93a3 : $00
	.db $00                                                  ; $93a4 : $00
	.db $00                                                  ; $93a5 : $00
	ora $00, S                                                  ; $93a6 : $03, $00
	ora $070e01.l                                                  ; $93a8 : $0f, $01, $0e, $07
	trb $1907.w                                                  ; $93ac : $1c, $07, $19
	asl $0000.w                                                  ; $93af : $0e, $00, $00
	.db $00                                                  ; $93b2 : $00
	.db $00                                                  ; $93b3 : $00
	.db $00                                                  ; $93b4 : $00
	.db $00                                                  ; $93b5 : $00
	ora $00, S                                                  ; $93b6 : $03, $00
	asl $0800.w                                                  ; $93b8 : $0e, $00, $08
	.db $00                                                  ; $93bb : $00
	clc                                                  ; $93bc : $18
	.db $00                                                  ; $93bd : $00

br_3c_93be:
	bpl br_3c_93c0                                                  ; $93be : $10, $00

br_3c_93c0:
	.db $00                                                  ; $93c0 : $00
	.db $00                                                  ; $93c1 : $00
	.db $00                                                  ; $93c2 : $00
	.db $00                                                  ; $93c3 : $00
	.db $00                                                  ; $93c4 : $00
	.db $00                                                  ; $93c5 : $00
	cpy #$f000.w                                                  ; $93c6 : $c0, $00, $f0
	bra br_3c_943b                                                  ; $93c9 : $80, $70

	cpx #$e038.w                                                  ; $93cb : $e0, $38, $e0
	tya                                                  ; $93ce : $98
	bvs br_3c_93d1                                                  ; $93cf : $70, $00

br_3c_93d1:
	.db $00                                                  ; $93d1 : $00
	.db $00                                                  ; $93d2 : $00
	.db $00                                                  ; $93d3 : $00
	.db $00                                                  ; $93d4 : $00
	.db $00                                                  ; $93d5 : $00
	cpy #$7000.w                                                  ; $93d6 : $c0, $00, $70
	.db $00                                                  ; $93d9 : $00
	bpl br_3c_93dc                                                  ; $93da : $10, $00

br_3c_93dc:
	clc                                                  ; $93dc : $18
	.db $00                                                  ; $93dd : $00
	php                                                  ; $93de : $08
	.db $00                                                  ; $93df : $00
	bit $00                                                  ; $93e0 : $24, $00
	phy                                                  ; $93e2 : $5a
	clc                                                  ; $93e3 : $18
	lda $3c                                                  ; $93e4 : $a5, $3c
	wdm                                                  ; $93e6 : $42
	ror $7e42.w, X                                                  ; $93e7 : $7e, $42, $7e
	lda $3c                                                  ; $93ea : $a5, $3c
	phy                                                  ; $93ec : $5a
	clc                                                  ; $93ed : $18
	bit $00                                                  ; $93ee : $24, $00
	bit $6600.w, X                                                  ; $93f0 : $3c, $00, $66
	.db $00                                                  ; $93f3 : $00
	cmp $00, S                                                  ; $93f4 : $c3, $00
	sta ($00, X)                                                  ; $93f6 : $81, $00
	sta ($00, X)                                                  ; $93f8 : $81, $00
	cmp $00, S                                                  ; $93fa : $c3, $00
	ror $00                                                  ; $93fc : $66, $00
	bit $0000.w, X                                                  ; $93fe : $3c, $00, $00
	.db $00                                                  ; $9401 : $00
	.db $00                                                  ; $9402 : $00
	.db $00                                                  ; $9403 : $00
	.db $00                                                  ; $9404 : $00
	ora $03, S                                                  ; $9405 : $03, $03
	tsb $100c.w                                                  ; $9407 : $0c, $0c, $10
	phd                                                  ; $940a : $0b
	ora ($17, S), Y                                                  ; $940b : $13, $17
	rol $17                                                  ; $940d : $26, $17
	bit $00                                                  ; $940f : $24, $00
	.db $00                                                  ; $9411 : $00
	.db $00                                                  ; $9412 : $00
	.db $00                                                  ; $9413 : $00
	ora $03, S                                                  ; $9414 : $03, $03
	ora $1f1c0f.l                                                  ; $9416 : $0f, $0f, $1c, $1f
	clc                                                  ; $941a : $18
	ora $303e30.l, X                                                  ; $941b : $1f, $30, $3e, $30
	bit $807f.w, X                                                  ; $941f : $3c, $7f, $80
	sbc $403f80.l, X                                                  ; $9422 : $ff, $80, $3f, $40
	eor $302f60.l, X                                                  ; $9426 : $5f, $60, $2f, $30
	.db $10, $1f                                                  ; $942a : $10, $1f

	ora $03, S                                                  ; $942c : $03, $03
	.db $00                                                  ; $942e : $00
	.db $00                                                  ; $942f : $00
	.db $00                                                  ; $9430 : $00
	.db $00                                                  ; $9431 : $00
	.db $00                                                  ; $9432 : $00
	.db $00                                                  ; $9433 : $00
	bra br_3c_9436                                                  ; $9434 : $80, $00

br_3c_9436:
	.db $00                                                  ; $9436 : $00
	.db $00                                                  ; $9437 : $00

br_3c_9438:
	.db $00                                                  ; $9438 : $00
	.db $00                                                  ; $9439 : $00
	.db $00                                                  ; $943a : $00

br_3c_943b:
	.db $00                                                  ; $943b : $00
	tsb $00                                                  ; $943c : $04, $00
	.db $00                                                  ; $943e : $00
	.db $00                                                  ; $943f : $00
	plx                                                  ; $9440 : $fa
	asl $c8                                                  ; $9441 : $06, $c8
	sec                                                  ; $9443 : $38
	cpx $1c                                                  ; $9444 : $e4, $1c
	bpl br_3c_9438                                                  ; $9446 : $10, $f0

br_3c_9448:
	bra br_3c_94ba                                                  ; $9448 : $80, $70

	jsr $80e0.w                                                  ; $944a : $20, $e0, $80
	bra br_3c_944f                                                  ; $944d : $80, $00

br_3c_944f:
	.db $00                                                  ; $944f : $00
	ora ($00, X)                                                  ; $9450 : $01, $00
	tsb $00                                                  ; $9452 : $04, $00
	cop $00.b                                                  ; $9454 : $02, $00
	.db $00                                                  ; $9456 : $00
	.db $00                                                  ; $9457 : $00
	php                                                  ; $9458 : $08
	.db $00                                                  ; $9459 : $00
	bpl br_3c_945c                                                  ; $945a : $10, $00

br_3c_945c:
	rti                                                  ; $945c : $40


	.db $00                                                  ; $945d : $00
	.db $00                                                  ; $945e : $00
	.db $00                                                  ; $945f : $00
	eor $201f60.l, X                                                  ; $9460 : $5f, $60, $1f, $20
	and $183730.l                                                  ; $9464 : $2f, $30, $37, $18
	clc                                                  ; $9468 : $18
	ora $000303.l                                                  ; $9469 : $0f, $03, $03, $00
	.db $00                                                  ; $946d : $00
	.db $00                                                  ; $946e : $00
	.db $00                                                  ; $946f : $00
	.db $00                                                  ; $9470 : $00
	.db $00                                                  ; $9471 : $00
	rti                                                  ; $9472 : $40


	.db $00                                                  ; $9473 : $00
	.db $00                                                  ; $9474 : $00
	.db $00                                                  ; $9475 : $00
	jsr $1000.w                                                  ; $9476 : $20, $00, $10
	.db $00                                                  ; $9479 : $00
	tsb $00                                                  ; $947a : $04, $00
	.db $00                                                  ; $947c : $00
	.db $00                                                  ; $947d : $00
	.db $00                                                  ; $947e : $00
	.db $00                                                  ; $947f : $00
	bne br_3c_94b2                                                  ; $9480 : $d0, $30

	inx                                                  ; $9482 : $e8
	clc                                                  ; $9483 : $18
	ldy #$c060.w                                                  ; $9484 : $a0, $60, $c0
	jsr $c040.w                                                  ; $9487 : $20, $40, $c0
	.db $00                                                  ; $948a : $00
	.db $00                                                  ; $948b : $00
	.db $00                                                  ; $948c : $00
	.db $00                                                  ; $948d : $00
	.db $00                                                  ; $948e : $00
	.db $00                                                  ; $948f : $00
	php                                                  ; $9490 : $08
	.db $00                                                  ; $9491 : $00
	tsb $00                                                  ; $9492 : $04, $00
	.db $00                                                  ; $9494 : $00
	.db $00                                                  ; $9495 : $00
	bpl br_3c_9498                                                  ; $9496 : $10, $00

br_3c_9498:
	jsr Call_3c_8000.w                                                  ; $9498 : $20, $00, $80
	.db $00                                                  ; $949b : $00

br_3c_949c:
	.db $00                                                  ; $949c : $00
	.db $00                                                  ; $949d : $00
	.db $00                                                  ; $949e : $00
	.db $00                                                  ; $949f : $00
	ora $1c0e.w, Y                                                  ; $94a0 : $19, $0e, $1c
	ora [$0e]                                                  ; $94a3 : $07, $0e
	ora [$0f]                                                  ; $94a5 : $07, $0f
	ora ($03, X)                                                  ; $94a7 : $01, $03
	.db $00                                                  ; $94a9 : $00
	.db $00                                                  ; $94aa : $00
	.db $00                                                  ; $94ab : $00
	.db $00                                                  ; $94ac : $00
	.db $00                                                  ; $94ad : $00
	.db $00                                                  ; $94ae : $00
	.db $00                                                  ; $94af : $00
	bpl br_3c_94b2                                                  ; $94b0 : $10, $00

br_3c_94b2:
	clc                                                  ; $94b2 : $18
	.db $00                                                  ; $94b3 : $00
	php                                                  ; $94b4 : $08
	.db $00                                                  ; $94b5 : $00
	asl wColourRam.w                                                  ; $94b6 : $0e, $00, $03
	.db $00                                                  ; $94b9 : $00

br_3c_94ba:
	.db $00                                                  ; $94ba : $00
	.db $00                                                  ; $94bb : $00
	.db $00                                                  ; $94bc : $00
	.db $00                                                  ; $94bd : $00
	.db $00                                                  ; $94be : $00
	.db $00                                                  ; $94bf : $00
	tya                                                  ; $94c0 : $98
	.db $70, $38                                                  ; $94c1 : $70, $38

	cpx #$e070.w                                                  ; $94c3 : $e0, $70, $e0
	beq br_3c_9448                                                  ; $94c6 : $f0, $80

	cpy #$0000.w                                                  ; $94c8 : $c0, $00, $00
	.db $00                                                  ; $94cb : $00
	.db $00                                                  ; $94cc : $00
	.db $00                                                  ; $94cd : $00
	.db $00                                                  ; $94ce : $00
	.db $00                                                  ; $94cf : $00
	php                                                  ; $94d0 : $08
	.db $00                                                  ; $94d1 : $00
	clc                                                  ; $94d2 : $18
	.db $00                                                  ; $94d3 : $00
	bpl br_3c_94d6                                                  ; $94d4 : $10, $00

br_3c_94d6:
	bvs br_3c_94d8                                                  ; $94d6 : $70, $00

br_3c_94d8:
	cpy #$0000.w                                                  ; $94d8 : $c0, $00, $00
	.db $00                                                  ; $94db : $00
	.db $00                                                  ; $94dc : $00
	.db $00                                                  ; $94dd : $00
	.db $00                                                  ; $94de : $00
	.db $00                                                  ; $94df : $00
	.db $00                                                  ; $94e0 : $00
	.db $00                                                  ; $94e1 : $00
	.db $00                                                  ; $94e2 : $00
	ora $03, S                                                  ; $94e3 : $03, $03
	tsb $100c.w                                                  ; $94e5 : $0c, $0c, $10
	bpl br_3c_950a                                                  ; $94e8 : $10, $20

	bpl br_3c_950f                                                  ; $94ea : $10, $23

	and ($46, X)                                                  ; $94ec : $21, $46
	jsr $000044.l                                                  ; $94ee : $22, $44, $00, $00
	ora $03, S                                                  ; $94f2 : $03, $03
	ora $1f1c0f.l                                                  ; $94f4 : $0f, $0f, $1c, $1f
	bmi br_3c_9536                                                  ; $94f8 : $30, $3c

	and ($3b, S), Y                                                  ; $94fa : $33, $3b
	adc [$77]                                                  ; $94fc : $67, $77
	ror $77                                                  ; $94fe : $66, $77
	.db $00                                                  ; $9500 : $00
	ora [$00]                                                  ; $9501 : $07, $00
	clc                                                  ; $9503 : $18
	.db $00                                                  ; $9504 : $00
	jsr $4000.w                                                  ; $9505 : $20, $00, $40
	.db $00                                                  ; $9508 : $00
	rti                                                  ; $9509 : $40


br_3c_950a:
	.db $00                                                  ; $950a : $00
	bra br_3c_950d                                                  ; $950b : $80, $00

br_3c_950d:
	sta ($01, X)                                                  ; $950d : $81, $01

br_3c_950f:
	.db $82, $07, $07                                                  ; $950f : $82, $07, $07

	clc                                                  ; $9512 : $18
	clc                                                  ; $9513 : $18
	jsr $4020.w                                                  ; $9514 : $20, $20, $40
	rti                                                  ; $9517 : $40


	rti                                                  ; $9518 : $40


	rti                                                  ; $9519 : $40


	bra br_3c_949c                                                  ; $951a : $80, $80

	sta ($81, X)                                                  ; $951c : $81, $81
	sta $83, S                                                  ; $951e : $83, $83
	.db $00                                                  ; $9520 : $00
	.db $00                                                  ; $9521 : $00
	.db $00                                                  ; $9522 : $00
	.db $00                                                  ; $9523 : $00
	.db $00                                                  ; $9524 : $00
	.db $00                                                  ; $9525 : $00
	.db $00                                                  ; $9526 : $00
	.db $00                                                  ; $9527 : $00
	.db $00                                                  ; $9528 : $00
	.db $00                                                  ; $9529 : $00
	.db $00                                                  ; $952a : $00
	.db $00                                                  ; $952b : $00
	.db $00                                                  ; $952c : $00
	.db $00                                                  ; $952d : $00
	.db $00                                                  ; $952e : $00
	.db $00                                                  ; $952f : $00
	.db $00                                                  ; $9530 : $00
	.db $00                                                  ; $9531 : $00
	.db $00                                                  ; $9532 : $00
	.db $00                                                  ; $9533 : $00
	.db $00                                                  ; $9534 : $00
	.db $00                                                  ; $9535 : $00

br_3c_9536:
	.db $00                                                  ; $9536 : $00
	.db $00                                                  ; $9537 : $00
	.db $00                                                  ; $9538 : $00
	.db $00                                                  ; $9539 : $00
	.db $00                                                  ; $953a : $00
	.db $00                                                  ; $953b : $00
	.db $00                                                  ; $953c : $00
	.db $00                                                  ; $953d : $00
	.db $00                                                  ; $953e : $00
	.db $00                                                  ; $953f : $00
	.db $00                                                  ; $9540 : $00
	.db $00                                                  ; $9541 : $00
	.db $00                                                  ; $9542 : $00
	.db $00                                                  ; $9543 : $00
	.db $00                                                  ; $9544 : $00
	.db $00                                                  ; $9545 : $00
	.db $00                                                  ; $9546 : $00
	.db $00                                                  ; $9547 : $00
	ora [$00]                                                  ; $9548 : $07, $00
	tcs                                                  ; $954a : $1b
	ora $6f, S                                                  ; $954b : $03, $6f
	php                                                  ; $954d : $08
	lda $000000.l, X                                                  ; $954e : $bf, $00, $00, $00
	.db $00                                                  ; $9552 : $00
	.db $00                                                  ; $9553 : $00
	.db $00                                                  ; $9554 : $00
	.db $00                                                  ; $9555 : $00
	.db $00                                                  ; $9556 : $00
	.db $00                                                  ; $9557 : $00
	ora [$07]                                                  ; $9558 : $07, $07
	clc                                                  ; $955a : $18
	ora $807860.l, X                                                  ; $955b : $1f, $60, $78, $80
	cpy #$0007.w                                                  ; $955f : $c0, $07, $00
	tcs                                                  ; $9562 : $1b
	ora $2c, S                                                  ; $9563 : $03, $2c
	tsb $1353.w                                                  ; $9565 : $0c, $53, $13
	adc $2caf2f.l                                                  ; $9568 : $6f, $2f, $af, $2c
	cmp $58df58.l, X                                                  ; $956c : $df, $58, $df, $58
	ora [$07]                                                  ; $9570 : $07, $07
	clc                                                  ; $9572 : $18
	ora $403f20.l, X                                                  ; $9573 : $1f, $20, $3f, $40
	adc $807f40.l, X                                                  ; $9577 : $7f, $40, $7f, $80
	jsr ($f880.w, X)                                                  ; $957b : $fc, $80, $f8
	.db $80, $f8                                                  ; $957e : $80, $f8

	.db $00                                                  ; $9580 : $00
	.db $00                                                  ; $9581 : $00
	.db $00                                                  ; $9582 : $00
	.db $00                                                  ; $9583 : $00
	.db $00                                                  ; $9584 : $00
	.db $00                                                  ; $9585 : $00
	.db $00                                                  ; $9586 : $00
	.db $00                                                  ; $9587 : $00
	.db $00                                                  ; $9588 : $00
	.db $00                                                  ; $9589 : $00
	.db $00                                                  ; $958a : $00
	ora $2f3008.l                                                  ; $958b : $0f, $08, $30, $2f
	eor $000000.l                                                  ; $958f : $4f, $00, $00, $00
	.db $00                                                  ; $9593 : $00
	.db $00                                                  ; $9594 : $00
	.db $00                                                  ; $9595 : $00
	.db $00                                                  ; $9596 : $00
	.db $00                                                  ; $9597 : $00
	.db $00                                                  ; $9598 : $00
	.db $00                                                  ; $9599 : $00
	ora $3f380f.l                                                  ; $959a : $0f, $0f, $38, $3f
	rts                                                  ; $959e : $60


	adc $020001.l, X                                                  ; $959f : $7f, $01, $00, $02
	.db $00                                                  ; $95a3 : $00
	ora $00, S                                                  ; $95a4 : $03, $00
	ora $00                                                  ; $95a6 : $05, $00
	ora [$02]                                                  ; $95a8 : $07, $02
	phd                                                  ; $95aa : $0b
	.db $00                                                  ; $95ab : $00
	ora $040f04.l                                                  ; $95ac : $0f, $04, $0f, $04
	ora ($01, X)                                                  ; $95b0 : $01, $01
	cop $03.b                                                  ; $95b2 : $02, $03
	cop $02.b                                                  ; $95b4 : $02, $02
	tsb $06                                                  ; $95b6 : $04, $06
	tsb $06                                                  ; $95b8 : $04, $06
	php                                                  ; $95ba : $08
	tsb $0c08.w                                                  ; $95bb : $0c, $08, $0c
	php                                                  ; $95be : $08
	tsb $007f.w                                                  ; $95bf : $0c, $7f, $00
	sbc $00ff00.l, X                                                  ; $95c2 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $95c6 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $95ca : $ff, $00, $ff, $00
	sbc $800000.l, X                                                  ; $95ce : $ff, $00, $00, $80
	.db $00                                                  ; $95d2 : $00
	.db $00                                                  ; $95d3 : $00
	.db $00                                                  ; $95d4 : $00
	.db $00                                                  ; $95d5 : $00
	.db $00                                                  ; $95d6 : $00
	.db $00                                                  ; $95d7 : $00
	.db $00                                                  ; $95d8 : $00
	.db $00                                                  ; $95d9 : $00
	.db $00                                                  ; $95da : $00
	.db $00                                                  ; $95db : $00
	.db $00                                                  ; $95dc : $00
	.db $00                                                  ; $95dd : $00
	.db $00                                                  ; $95de : $00
	.db $00                                                  ; $95df : $00
	.db $00                                                  ; $95e0 : $00
	.db $00                                                  ; $95e1 : $00
	.db $00                                                  ; $95e2 : $00
	ora ($01, X)                                                  ; $95e3 : $01, $01
	cop $00.b                                                  ; $95e5 : $02, $00
	cop $03.b                                                  ; $95e7 : $02, $03
	ora $01                                                  ; $95e9 : $05, $01
	ora $01                                                  ; $95eb : $05, $01
	ora $01                                                  ; $95ed : $05, $01
	ora $00                                                  ; $95ef : $05, $00
	.db $00                                                  ; $95f1 : $00
	ora ($01, X)                                                  ; $95f2 : $01, $01
	ora $03, S                                                  ; $95f4 : $03, $03
	cop $03.b                                                  ; $95f6 : $02, $03
	asl $07                                                  ; $95f8 : $06, $07
	tsb $07                                                  ; $95fa : $04, $07
	tsb $07                                                  ; $95fc : $04, $07
	tsb $07                                                  ; $95fe : $04, $07
	eor $7cfc9f.l, X                                                  ; $9600 : $5f, $9f, $fc, $7c
	bvs br_3c_9676                                                  ; $9604 : $70, $70

	cpx #$c3e0.w                                                  ; $9606 : $e0, $e0, $c3
	cpy #$c1c5.w                                                  ; $9609 : $c0, $c5, $c1
	phb                                                  ; $960c : $8b
	.db $82                                                  ; $960d : $82

	sta $ffc084.l                                                  ; $960e : $8f, $84, $c0, $ff
	.db $80, $fc                                                  ; $9612 : $80, $fc

	.db $00                                                  ; $9614 : $00
	beq br_3c_9617                                                  ; $9615 : $f0, $00

br_3c_9617:
	cpx #$c303.w                                                  ; $9617 : $e0, $03, $c3
	tsb $c7                                                  ; $961a : $04, $c7
	php                                                  ; $961c : $08
	stx $8c08.w                                                  ; $961d : $8e, $08, $8c
	.db $00                                                  ; $9620 : $00
	.db $00                                                  ; $9621 : $00
	.db $00                                                  ; $9622 : $00
	.db $00                                                  ; $9623 : $00
	.db $00                                                  ; $9624 : $00
	.db $00                                                  ; $9625 : $00
	.db $00                                                  ; $9626 : $00
	.db $00                                                  ; $9627 : $00
	.db $00                                                  ; $9628 : $00
	.db $00                                                  ; $9629 : $00
	.db $00                                                  ; $962a : $00
	.db $00                                                  ; $962b : $00
	.db $00                                                  ; $962c : $00
	.db $00                                                  ; $962d : $00
	.db $00                                                  ; $962e : $00
	ora ($00, X)                                                  ; $962f : $01, $00
	.db $00                                                  ; $9631 : $00
	.db $00                                                  ; $9632 : $00
	.db $00                                                  ; $9633 : $00
	.db $00                                                  ; $9634 : $00
	.db $00                                                  ; $9635 : $00
	.db $00                                                  ; $9636 : $00
	.db $00                                                  ; $9637 : $00
	.db $00                                                  ; $9638 : $00
	.db $00                                                  ; $9639 : $00
	.db $00                                                  ; $963a : $00
	.db $00                                                  ; $963b : $00
	.db $00                                                  ; $963c : $00
	.db $00                                                  ; $963d : $00
	ora ($01, X)                                                  ; $963e : $01, $01
	.db $00                                                  ; $9640 : $00
	.db $00                                                  ; $9641 : $00
	.db $00                                                  ; $9642 : $00
	.db $00                                                  ; $9643 : $00
	.db $00                                                  ; $9644 : $00
	.db $00                                                  ; $9645 : $00
	.db $00                                                  ; $9646 : $00
	.db $00                                                  ; $9647 : $00
	.db $00                                                  ; $9648 : $00
	ora $606018.l, X                                                  ; $9649 : $1f, $18, $60, $60
	.db $80, $80                                                  ; $964d : $80, $80

	.db $00                                                  ; $964f : $00
	.db $00                                                  ; $9650 : $00
	.db $00                                                  ; $9651 : $00
	.db $00                                                  ; $9652 : $00
	.db $00                                                  ; $9653 : $00
	.db $00                                                  ; $9654 : $00
	.db $00                                                  ; $9655 : $00
	.db $00                                                  ; $9656 : $00
	.db $00                                                  ; $9657 : $00
	ora $7f781f.l, X                                                  ; $9658 : $1f, $1f, $78, $7f
	cpx #$80f8.w                                                  ; $965c : $e0, $f8, $80
	cpy #$0000.w                                                  ; $965f : $c0, $00, $00
	.db $00                                                  ; $9662 : $00
	.db $00                                                  ; $9663 : $00
	.db $00                                                  ; $9664 : $00
	.db $00                                                  ; $9665 : $00
	.db $00                                                  ; $9666 : $00
	.db $00                                                  ; $9667 : $00
	.db $00                                                  ; $9668 : $00

br_3c_9669:
	.db $00                                                  ; $9669 : $00
	.db $00                                                  ; $966a : $00
	.db $00                                                  ; $966b : $00
	.db $00                                                  ; $966c : $00
	.db $00                                                  ; $966d : $00
	.db $00                                                  ; $966e : $00
	.db $00                                                  ; $966f : $00
	.db $00                                                  ; $9670 : $00
	.db $00                                                  ; $9671 : $00
	.db $00                                                  ; $9672 : $00
	.db $00                                                  ; $9673 : $00
	.db $00                                                  ; $9674 : $00
	.db $00                                                  ; $9675 : $00

br_3c_9676:
	.db $00                                                  ; $9676 : $00
	.db $00                                                  ; $9677 : $00
	.db $00                                                  ; $9678 : $00
	.db $00                                                  ; $9679 : $00
	.db $00                                                  ; $967a : $00
	.db $00                                                  ; $967b : $00
	.db $00                                                  ; $967c : $00
	.db $00                                                  ; $967d : $00
	.db $00                                                  ; $967e : $00
	.db $00                                                  ; $967f : $00
	.db $00                                                  ; $9680 : $00
	.db $00                                                  ; $9681 : $00
	.db $00                                                  ; $9682 : $00
	.db $00                                                  ; $9683 : $00
	.db $00                                                  ; $9684 : $00
	.db $00                                                  ; $9685 : $00
	.db $00                                                  ; $9686 : $00
	.db $00                                                  ; $9687 : $00
	.db $00                                                  ; $9688 : $00
	ora $2000.w                                                  ; $9689 : $0d, $00, $20
	.db $00                                                  ; $968c : $00
	bra br_3c_968f                                                  ; $968d : $80, $00

br_3c_968f:
	.db $00                                                  ; $968f : $00
	.db $00                                                  ; $9690 : $00
	.db $00                                                  ; $9691 : $00
	.db $00                                                  ; $9692 : $00
	.db $00                                                  ; $9693 : $00
	.db $00                                                  ; $9694 : $00
	.db $00                                                  ; $9695 : $00
	.db $00                                                  ; $9696 : $00
	.db $00                                                  ; $9697 : $00
	ora $200d.w                                                  ; $9698 : $0d, $0d, $20
	jsr $8080.w                                                  ; $969b : $20, $80, $80
	.db $00                                                  ; $969e : $00
	.db $00                                                  ; $969f : $00
	ora ($02, X)                                                  ; $96a0 : $01, $02
	cop $04.b                                                  ; $96a2 : $02, $04
	cop $04.b                                                  ; $96a4 : $02, $04
	tsb $08                                                  ; $96a6 : $04, $08
	tsb $08                                                  ; $96a8 : $04, $08
	.db $00                                                  ; $96aa : $00
	php                                                  ; $96ab : $08
	.db $00                                                  ; $96ac : $00
	php                                                  ; $96ad : $08
	.db $00                                                  ; $96ae : $00
	php                                                  ; $96af : $08
	ora $03, S                                                  ; $96b0 : $03, $03
	asl $07                                                  ; $96b2 : $06, $07
	asl $07                                                  ; $96b4 : $06, $07
	tsb $0c0e.w                                                  ; $96b6 : $0c, $0e, $0c
	asl $0c08.w                                                  ; $96b9 : $0e, $08, $0c
	php                                                  ; $96bc : $08
	tsb $0c08.w                                                  ; $96bd : $0c, $08, $0c
	.db $00                                                  ; $96c0 : $00
	.db $00                                                  ; $96c1 : $00
	.db $00                                                  ; $96c2 : $00
	.db $00                                                  ; $96c3 : $00
	.db $00                                                  ; $96c4 : $00
	.db $00                                                  ; $96c5 : $00
	.db $00                                                  ; $96c6 : $00
	.db $00                                                  ; $96c7 : $00
	.db $00                                                  ; $96c8 : $00
	.db $00                                                  ; $96c9 : $00
	.db $00                                                  ; $96ca : $00
	ora $02, S                                                  ; $96cb : $03, $02
	tsb $00                                                  ; $96cd : $04, $00
	tsb $00                                                  ; $96cf : $04, $00
	bra br_3c_96d3                                                  ; $96d1 : $80, $00

br_3c_96d3:
	.db $00                                                  ; $96d3 : $00
	.db $00                                                  ; $96d4 : $00
	.db $00                                                  ; $96d5 : $00
	.db $00                                                  ; $96d6 : $00
	.db $00                                                  ; $96d7 : $00
	.db $00                                                  ; $96d8 : $00
	.db $00                                                  ; $96d9 : $00
	ora $03, S                                                  ; $96da : $03, $03
	asl $07                                                  ; $96dc : $06, $07
	tsb $07                                                  ; $96de : $04, $07
	.db $00                                                  ; $96e0 : $00
	cop $00.b                                                  ; $96e1 : $02, $00
	.db $00                                                  ; $96e3 : $00
	.db $00                                                  ; $96e4 : $00
	tsb $00                                                  ; $96e5 : $04, $00
	.db $00                                                  ; $96e7 : $00
	.db $00                                                  ; $96e8 : $00
	php                                                  ; $96e9 : $08
	.db $00                                                  ; $96ea : $00
	php                                                  ; $96eb : $08
	.db $00                                                  ; $96ec : $00
	.db $00                                                  ; $96ed : $00
	.db $00                                                  ; $96ee : $00
	php                                                  ; $96ef : $08
	cop $02.b                                                  ; $96f0 : $02, $02
	.db $00                                                  ; $96f2 : $00
	.db $00                                                  ; $96f3 : $00
	tsb $04                                                  ; $96f4 : $04, $04
	.db $00                                                  ; $96f6 : $00
	.db $00                                                  ; $96f7 : $00
	php                                                  ; $96f8 : $08
	php                                                  ; $96f9 : $08
	php                                                  ; $96fa : $08
	php                                                  ; $96fb : $08
	.db $00                                                  ; $96fc : $00
	.db $00                                                  ; $96fd : $00
	php                                                  ; $96fe : $08
	php                                                  ; $96ff : $08
	.db $00                                                  ; $9700 : $00
	.db $00                                                  ; $9701 : $00
	.db $00                                                  ; $9702 : $00
	.db $00                                                  ; $9703 : $00
	.db $00                                                  ; $9704 : $00
	.db $00                                                  ; $9705 : $00
	.db $00                                                  ; $9706 : $00
	.db $00                                                  ; $9707 : $00
	.db $00                                                  ; $9708 : $00
	.db $00                                                  ; $9709 : $00
	.db $00                                                  ; $970a : $00
	.db $00                                                  ; $970b : $00
	.db $00                                                  ; $970c : $00
	.db $00                                                  ; $970d : $00
	.db $00                                                  ; $970e : $00
	ora ($00, X)                                                  ; $970f : $01, $00
	.db $00                                                  ; $9711 : $00
	.db $00                                                  ; $9712 : $00
	.db $00                                                  ; $9713 : $00
	.db $00                                                  ; $9714 : $00
	.db $00                                                  ; $9715 : $00
	.db $00                                                  ; $9716 : $00
	.db $00                                                  ; $9717 : $00
	.db $00                                                  ; $9718 : $00
	.db $00                                                  ; $9719 : $00
	.db $00                                                  ; $971a : $00
	.db $00                                                  ; $971b : $00
	.db $00                                                  ; $971c : $00
	.db $00                                                  ; $971d : $00
	ora ($01, X)                                                  ; $971e : $01, $01
	rti                                                  ; $9720 : $40


	.db $00                                                  ; $9721 : $00
	bra br_3c_9724                                                  ; $9722 : $80, $00

br_3c_9724:
	bpl br_3c_9726                                                  ; $9724 : $10, $00

br_3c_9726:
	sty $00                                                  ; $9726 : $84, $00
	sty $00                                                  ; $9728 : $84, $00
	.db $00                                                  ; $972a : $00
	.db $00                                                  ; $972b : $00
	.db $00                                                  ; $972c : $00
	.db $00                                                  ; $972d : $00
	.db $00                                                  ; $972e : $00
	.db $00                                                  ; $972f : $00
	cpy #$8000.w                                                  ; $9730 : $c0, $00, $80
	.db $00                                                  ; $9733 : $00
	bvs br_3c_9736                                                  ; $9734 : $70, $00

br_3c_9736:
	trb $1c80.w                                                  ; $9736 : $1c, $80, $1c
	bra br_3c_97ab                                                  ; $9739 : $80, $70

	.db $00                                                  ; $973b : $00
	bra br_3c_973e                                                  ; $973c : $80, $00

br_3c_973e:
	cpy #$1c00.w                                                  ; $973e : $c0, $00, $1c
	trb $0705.w                                                  ; $9741 : $1c, $05, $07
	.db $00                                                  ; $9744 : $00
	ora ($02, X)                                                  ; $9745 : $01, $02
	.db $00                                                  ; $9747 : $00
	php                                                  ; $9748 : $08
	.db $00                                                  ; $9749 : $00
	and [$00]                                                  ; $974a : $27, $00
	jmp $07b700.l                                                  ; $974c : $5c, $00, $b7, $07


	jsr $004000.l                                                  ; $9750 : $22, $00, $40, $00
	cop $00.b                                                  ; $9754 : $02, $00
	ora ($02, X)                                                  ; $9756 : $01, $02
	ora [$0f]                                                  ; $9758 : $07, $0f
	clc                                                  ; $975a : $18
	and $4f7f23.l, X                                                  ; $975b : $3f, $23, $7f, $4f
	sed                                                  ; $975f : $f8
	.db $00                                                  ; $9760 : $00
	.db $00                                                  ; $9761 : $00
	.db $00                                                  ; $9762 : $00
	.db $00                                                  ; $9763 : $00
	.db $80, $80                                                  ; $9764 : $80, $80

	adc $8ec0.w, Y                                                  ; $9766 : $79, $c0, $8e
	cpy #$6636.w                                                  ; $9769 : $c0, $36, $66
	asl                                                  ; $976c : $0a
	ror $f1dc.w                                                  ; $976d : $6e, $dc, $f1
	.db $00                                                  ; $9770 : $00
	.db $00                                                  ; $9771 : $00
	.db $00                                                  ; $9772 : $00
	.db $00                                                  ; $9773 : $00
	.db $00                                                  ; $9774 : $00
	.db $00                                                  ; $9775 : $00
	ora $38, S                                                  ; $9776 : $03, $38
	bmi br_3c_9798                                                  ; $9778 : $30, $1e

	sta $819f19.l                                                  ; $977a : $8f, $19, $9f, $81
	sta $0e, S                                                  ; $977e : $83, $0e
	.db $00                                                  ; $9780 : $00
	.db $00                                                  ; $9781 : $00
	.db $00                                                  ; $9782 : $00
	.db $00                                                  ; $9783 : $00
	.db $00                                                  ; $9784 : $00
	.db $00                                                  ; $9785 : $00
	.db $00                                                  ; $9786 : $00
	.db $00                                                  ; $9787 : $00
	rti                                                  ; $9788 : $40


	.db $00                                                  ; $9789 : $00
	bra br_3c_978c                                                  ; $978a : $80, $00

br_3c_978c:
	.db $00                                                  ; $978c : $00
	.db $00                                                  ; $978d : $00
	ldy #$0080.w                                                  ; $978e : $a0, $80, $00
	.db $00                                                  ; $9791 : $00
	.db $00                                                  ; $9792 : $00
	.db $00                                                  ; $9793 : $00
	.db $00                                                  ; $9794 : $00
	.db $00                                                  ; $9795 : $00
	.db $00                                                  ; $9796 : $00
	.db $00                                                  ; $9797 : $00

br_3c_9798:
	cpy #$2000.w                                                  ; $9798 : $c0, $00, $20
	.db $80, $70                                                  ; $979b : $80, $70

br_3c_979d:
	.db $00                                                  ; $979d : $00
	iny                                                  ; $979e : $c8

br_3c_979f:
	rts                                                  ; $979f : $60


	.db $00                                                  ; $97a0 : $00
	.db $00                                                  ; $97a1 : $00
	ora ($00, X)                                                  ; $97a2 : $01, $00
	php                                                  ; $97a4 : $08
	clc                                                  ; $97a5 : $18
	trb $2c                                                  ; $97a6 : $14, $2c
	sec                                                  ; $97a8 : $38
	tsb $7f                                                  ; $97a9 : $04, $7f

br_3c_97ab:
	wdm                                                  ; $97ab : $42
	and $3d42.w, X                                                  ; $97ac : $3d, $42, $3d
	wdm                                                  ; $97af : $42
	.db $00                                                  ; $97b0 : $00
	.db $00                                                  ; $97b1 : $00
	.db $00                                                  ; $97b2 : $00
	ora ($01, X)                                                  ; $97b3 : $01, $01
	ora ($01, X)                                                  ; $97b5 : $01, $01
	ora ($43, X)                                                  ; $97b7 : $01, $43
	ora ($00, X)                                                  ; $97b9 : $01, $00
	ora ($00, X)                                                  ; $97bb : $01, $00
	ora ($00, X)                                                  ; $97bd : $01, $00
	ora ($6c, X)                                                  ; $97bf : $01, $6c
	ora $e71f50.l                                                  ; $97c1 : $0f, $50, $1f, $e7
	sec                                                  ; $97c5 : $38
	stz $df21.w, X                                                  ; $97c6 : $9e, $21, $df
	rts                                                  ; $97c9 : $60


	lda $403f40.l, X                                                  ; $97ca : $bf, $40, $3f, $40
	and $f09f40.l, X                                                  ; $97ce : $3f, $40, $9f, $f0
	lda $c038e0.l, X                                                  ; $97d2 : $bf, $e0, $38, $c0
	adc ($c0, X)                                                  ; $97d6 : $61, $c0
	rts                                                  ; $97d8 : $60


	bra br_3c_981b                                                  ; $97d9 : $80, $40

	bra br_3c_979d                                                  ; $97db : $80, $c0

	bra br_3c_979f                                                  ; $97dd : $80, $c0

	.db $80, $0b                                                  ; $97df : $80, $0b

	lda ($86, S), Y                                                  ; $97e1 : $b3, $86
	.db $b0, $0a                                                  ; $97e3 : $b0, $0a

	xce                                                  ; $97e5 : $fb
	ldx $8fb8.w                                                  ; $97e6 : $ae, $b8, $8f
	cli                                                  ; $97e9 : $58
	lsr $8bd8.w                                                  ; $97ea : $4e, $d8, $8b
	cli                                                  ; $97ed : $58
	eor $0cc7d8.l                                                  ; $97ee : $4f, $d8, $c7, $0c
	cmp #$c707.w                                                  ; $97f2 : $c9, $07, $c7
	tsb $c1                                                  ; $97f5 : $04, $c1
	eor [$60]                                                  ; $97f7 : $47, $60
	ora [$e1]                                                  ; $97f9 : $07, $e1
	ora [$64]                                                  ; $97fb : $07, $64
	ora [$e0]                                                  ; $97fd : $07, $e0
	ora [$42]                                                  ; $97ff : $07, $42
	.db $00                                                  ; $9801 : $00
	tay                                                  ; $9802 : $a8
	cpx #$c050.w                                                  ; $9803 : $e0, $50, $c0
	plp                                                  ; $9806 : $28
	cpx #$784a.w                                                  ; $9807 : $e0, $4a, $78
	sty $f0, X                                                  ; $980a : $94, $f0
	lda $423c.w                                                  ; $980c : $ad, $3c, $42
	ror $c086.w, X                                                  ; $980f : $7e, $86, $c0
	sbc ($18), Y                                                  ; $9812 : $f1, $18
	inc $30                                                  ; $9814 : $e6, $30
	sbc ($18), Y                                                  ; $9816 : $f1, $18
	jsr ($f986.w, X)                                                  ; $9818 : $fc, $86, $f9

br_3c_981b:
	tsb $c37e.w                                                  ; $981b : $0c, $7e, $c3
	sbc $030381.l, X                                                  ; $981e : $ff, $81, $03, $03
	php                                                  ; $9822 : $08
	ora $2f1c13.l                                                  ; $9823 : $0f, $13, $1c, $2f
	bmi br_3c_9888                                                  ; $9827 : $30, $5f

	rts                                                  ; $9829 : $60


	ora $c0bf60.l, X                                                  ; $982a : $1f, $60, $bf, $c0
	lda $0004c0.l, X                                                  ; $982e : $bf, $c0, $04, $00
	bpl br_3c_9834                                                  ; $9832 : $10, $00

br_3c_9834:
	jsr $4000.w                                                  ; $9834 : $20, $00, $40
	.db $00                                                  ; $9837 : $00
	.db $00                                                  ; $9838 : $00
	.db $00                                                  ; $9839 : $00
	bra br_3c_983c                                                  ; $983a : $80, $00

br_3c_983c:
	.db $00                                                  ; $983c : $00
	.db $00                                                  ; $983d : $00
	.db $00                                                  ; $983e : $00
	.db $00                                                  ; $983f : $00
	.db $00                                                  ; $9840 : $00
	.db $00                                                  ; $9841 : $00
	.db $00                                                  ; $9842 : $00
	.db $00                                                  ; $9843 : $00
	.db $00                                                  ; $9844 : $00
	.db $00                                                  ; $9845 : $00
	.db $00                                                  ; $9846 : $00
	.db $00                                                  ; $9847 : $00
	.db $00                                                  ; $9848 : $00
	.db $00                                                  ; $9849 : $00
	.db $00                                                  ; $984a : $00
	.db $00                                                  ; $984b : $00
	cop $03.b                                                  ; $984c : $02, $03
	php                                                  ; $984e : $08
	ora $000000.l                                                  ; $984f : $0f, $00, $00, $00
	.db $00                                                  ; $9853 : $00
	.db $00                                                  ; $9854 : $00
	.db $00                                                  ; $9855 : $00
	.db $00                                                  ; $9856 : $00
	.db $00                                                  ; $9857 : $00
	.db $00                                                  ; $9858 : $00
	.db $00                                                  ; $9859 : $00
	ora ($00, X)                                                  ; $985a : $01, $00
	tsb $00                                                  ; $985c : $04, $00
	bpl br_3c_9860                                                  ; $985e : $10, $00

br_3c_9860:
	bpl br_3c_9881                                                  ; $9860 : $10, $1f

	sta [$f8]                                                  ; $9862 : $87, $f8
	and $00ffc0.l, X                                                  ; $9864 : $3f, $c0, $ff, $00
	sbc $10e000.l, X                                                  ; $9868 : $ff, $00, $e0, $10
	.db $00                                                  ; $986c : $00
	bra br_3c_986f                                                  ; $986d : $80, $00

br_3c_986f:
	.db $00                                                  ; $986f : $00
	jsr $0000.w                                                  ; $9870 : $20, $00, $00
	.db $00                                                  ; $9873 : $00
	.db $00                                                  ; $9874 : $00
	.db $00                                                  ; $9875 : $00
	.db $00                                                  ; $9876 : $00
	.db $00                                                  ; $9877 : $00
	.db $00                                                  ; $9878 : $00
	.db $00                                                  ; $9879 : $00
	.db $00                                                  ; $987a : $00
	.db $00                                                  ; $987b : $00
	.db $00                                                  ; $987c : $00
	.db $00                                                  ; $987d : $00
	.db $00                                                  ; $987e : $00
	.db $00                                                  ; $987f : $00
	.db $00                                                  ; $9880 : $00

br_3c_9881:
	.db $00                                                  ; $9881 : $00
	.db $00                                                  ; $9882 : $00
	.db $00                                                  ; $9883 : $00
	.db $00                                                  ; $9884 : $00
	.db $00                                                  ; $9885 : $00
	.db $00                                                  ; $9886 : $00
	.db $00                                                  ; $9887 : $00

br_3c_9888:
	ora ($01, X)                                                  ; $9888 : $01, $01
	.db $00                                                  ; $988a : $00
	ora ($02, X)                                                  ; $988b : $01, $02
	ora $00, S                                                  ; $988d : $03, $00
	ora $00, S                                                  ; $988f : $03, $00
	.db $00                                                  ; $9891 : $00
	.db $00                                                  ; $9892 : $00
	.db $00                                                  ; $9893 : $00
	.db $00                                                  ; $9894 : $00
	.db $00                                                  ; $9895 : $00
	ora ($00, X)                                                  ; $9896 : $01, $00
	.db $00                                                  ; $9898 : $00
	.db $00                                                  ; $9899 : $00
	cop $00.b                                                  ; $989a : $02, $00
	.db $00                                                  ; $989c : $00
	.db $00                                                  ; $989d : $00
	tsb $00                                                  ; $989e : $04, $00
	ora ($1c, S), Y                                                  ; $98a0 : $13, $1c
	and [$38]                                                  ; $98a2 : $27, $38
	eor $e29c70.l                                                  ; $98a4 : $4f, $70, $9c, $e2
	sec                                                  ; $98a8 : $38
	cpy $70                                                  ; $98a9 : $c4, $70
	dey                                                  ; $98ab : $88
	cpx #$e010.w                                                  ; $98ac : $e0, $10, $e0
	.db $00                                                  ; $98af : $00
	jsr $4000.w                                                  ; $98b0 : $20, $00, $40
	.db $00                                                  ; $98b3 : $00
	bra br_3c_98b6                                                  ; $98b4 : $80, $00

br_3c_98b6:
	.db $00                                                  ; $98b6 : $00
	.db $00                                                  ; $98b7 : $00
	.db $00                                                  ; $98b8 : $00
	.db $00                                                  ; $98b9 : $00
	.db $00                                                  ; $98ba : $00
	.db $00                                                  ; $98bb : $00
	.db $00                                                  ; $98bc : $00
	.db $00                                                  ; $98bd : $00
	.db $00                                                  ; $98be : $00
	.db $00                                                  ; $98bf : $00
	jmp $601c62.l                                                  ; $98c0 : $5c, $62, $1c, $60


	bit $b840.w, X                                                  ; $98c4 : $3c, $40, $b8
	cpy $38                                                  ; $98c7 : $c4, $38
	cpy #$8078.w                                                  ; $98c9 : $c0, $78, $80
	sei                                                  ; $98cc : $78
	.db $80, $78                                                  ; $98cd : $80, $78

	bra br_3c_98d1                                                  ; $98cf : $80, $00

br_3c_98d1:
	.db $00                                                  ; $98d1 : $00
	.db $00                                                  ; $98d2 : $00
	.db $00                                                  ; $98d3 : $00
	bra br_3c_98d6                                                  ; $98d4 : $80, $00

br_3c_98d6:
	.db $00                                                  ; $98d6 : $00
	.db $00                                                  ; $98d7 : $00
	.db $00                                                  ; $98d8 : $00
	.db $00                                                  ; $98d9 : $00
	.db $00                                                  ; $98da : $00
	.db $00                                                  ; $98db : $00
	.db $00                                                  ; $98dc : $00
	.db $00                                                  ; $98dd : $00
	.db $00                                                  ; $98de : $00
	.db $00                                                  ; $98df : $00
	.db $00                                                  ; $98e0 : $00
	.db $00                                                  ; $98e1 : $00
	.db $00                                                  ; $98e2 : $00
	.db $00                                                  ; $98e3 : $00
	.db $00                                                  ; $98e4 : $00
	.db $00                                                  ; $98e5 : $00
	.db $00                                                  ; $98e6 : $00
	.db $00                                                  ; $98e7 : $00
	tsb $07                                                  ; $98e8 : $04, $07
	ora ($1c, S), Y                                                  ; $98ea : $13, $1c
	rol $5831.w                                                  ; $98ec : $2e, $31, $58
	stz $00                                                  ; $98ef : $64, $00
	.db $00                                                  ; $98f1 : $00
	.db $00                                                  ; $98f2 : $00
	.db $00                                                  ; $98f3 : $00
	.db $00                                                  ; $98f4 : $00
	.db $00                                                  ; $98f5 : $00
	ora ($00, X)                                                  ; $98f6 : $01, $00
	.db $00                                                  ; $98f8 : $00
	.db $00                                                  ; $98f9 : $00
	.db $00                                                  ; $98fa : $00
	.db $00                                                  ; $98fb : $00
	.db $00                                                  ; $98fc : $00
	.db $00                                                  ; $98fd : $00
	.db $00                                                  ; $98fe : $00
	.db $00                                                  ; $98ff : $00
	.db $00                                                  ; $9900 : $00
	.db $00                                                  ; $9901 : $00
	.db $00                                                  ; $9902 : $00
	.db $00                                                  ; $9903 : $00
	php                                                  ; $9904 : $08
	ora $7fff80.l                                                  ; $9905 : $0f, $80, $ff, $7f
	.db $80, $c0                                                  ; $9909 : $80, $c0

	jsr $0000.w                                                  ; $990b : $20, $00, $00
	.db $00                                                  ; $990e : $00
	.db $00                                                  ; $990f : $00
	.db $00                                                  ; $9910 : $00
	.db $00                                                  ; $9911 : $00
	.db $00                                                  ; $9912 : $00
	.db $00                                                  ; $9913 : $00
	bpl br_3c_9916                                                  ; $9914 : $10, $00

br_3c_9916:
	.db $00                                                  ; $9916 : $00
	.db $00                                                  ; $9917 : $00
	.db $00                                                  ; $9918 : $00
	.db $00                                                  ; $9919 : $00
	.db $00                                                  ; $991a : $00
	.db $00                                                  ; $991b : $00
	.db $00                                                  ; $991c : $00
	.db $00                                                  ; $991d : $00
	.db $00                                                  ; $991e : $00
	.db $00                                                  ; $991f : $00
	.db $00                                                  ; $9920 : $00
	.db $00                                                  ; $9921 : $00
	ora ($01, X)                                                  ; $9922 : $01, $01
	cop $03.b                                                  ; $9924 : $02, $03
	ora $06                                                  ; $9926 : $05, $06
	ora ($06, X)                                                  ; $9928 : $01, $06
	asl                                                  ; $992a : $0a
	ora $0806.w                                                  ; $992b : $0d, $06, $08
	tsb $0a                                                  ; $992e : $04, $0a
	.db $00                                                  ; $9930 : $00
	.db $00                                                  ; $9931 : $00
	.db $00                                                  ; $9932 : $00
	.db $00                                                  ; $9933 : $00
	.db $00                                                  ; $9934 : $00
	.db $00                                                  ; $9935 : $00
	.db $00                                                  ; $9936 : $00
	.db $00                                                  ; $9937 : $00
	.db $00                                                  ; $9938 : $00
	.db $00                                                  ; $9939 : $00
	.db $00                                                  ; $993a : $00
	.db $00                                                  ; $993b : $00
	.db $00                                                  ; $993c : $00
	.db $00                                                  ; $993d : $00
	bpl br_3c_9940                                                  ; $993e : $10, $00

br_3c_9940:
	ldy #$40d0.w                                                  ; $9940 : $a0, $d0, $40
	ldy #$4080.w                                                  ; $9943 : $a0, $80, $40
	bra br_3c_9948                                                  ; $9946 : $80, $00

br_3c_9948:
	.db $00                                                  ; $9948 : $00
	bra br_3c_994b                                                  ; $9949 : $80, $00

br_3c_994b:
	.db $00                                                  ; $994b : $00
	.db $00                                                  ; $994c : $00
	.db $00                                                  ; $994d : $00
	.db $00                                                  ; $994e : $00
	.db $00                                                  ; $994f : $00
	.db $00                                                  ; $9950 : $00
	.db $00                                                  ; $9951 : $00
	.db $00                                                  ; $9952 : $00
	.db $00                                                  ; $9953 : $00
	.db $00                                                  ; $9954 : $00
	.db $00                                                  ; $9955 : $00
	.db $00                                                  ; $9956 : $00
	.db $00                                                  ; $9957 : $00
	.db $00                                                  ; $9958 : $00
	.db $00                                                  ; $9959 : $00
	.db $00                                                  ; $995a : $00
	.db $00                                                  ; $995b : $00
	.db $00                                                  ; $995c : $00
	.db $00                                                  ; $995d : $00
	.db $00                                                  ; $995e : $00
	.db $00                                                  ; $995f : $00
	trb $18                                                  ; $9960 : $14, $18
	tsb $0810.w                                                  ; $9962 : $0c, $10, $08
	trb $08                                                  ; $9965 : $14, $08
	bpl br_3c_9991                                                  ; $9967 : $10, $28

	bmi br_3c_9973                                                  ; $9969 : $30, $08

	bmi br_3c_9975                                                  ; $996b : $30, $08

	.db $30, $08                                                  ; $996d : $30, $08

	bmi br_3c_9971                                                  ; $996f : $30, $00

br_3c_9971:
	.db $00                                                  ; $9971 : $00
	.db $00                                                  ; $9972 : $00

br_3c_9973:
	.db $00                                                  ; $9973 : $00
	.db $00                                                  ; $9974 : $00

br_3c_9975:
	.db $00                                                  ; $9975 : $00
	jsr $0000.w                                                  ; $9976 : $20, $00, $00
	.db $00                                                  ; $9979 : $00
	.db $00                                                  ; $997a : $00
	.db $00                                                  ; $997b : $00
	.db $00                                                  ; $997c : $00
	.db $00                                                  ; $997d : $00
	.db $00                                                  ; $997e : $00
	.db $00                                                  ; $997f : $00
	.db $00                                                  ; $9980 : $00
	.db $00                                                  ; $9981 : $00
	.db $00                                                  ; $9982 : $00
	.db $00                                                  ; $9983 : $00
	.db $00                                                  ; $9984 : $00
	.db $00                                                  ; $9985 : $00
	.db $00                                                  ; $9986 : $00
	.db $00                                                  ; $9987 : $00
	.db $00                                                  ; $9988 : $00
	.db $00                                                  ; $9989 : $00
	.db $00                                                  ; $998a : $00
	.db $00                                                  ; $998b : $00
	.db $00                                                  ; $998c : $00
	.db $00                                                  ; $998d : $00
	.db $00                                                  ; $998e : $00
	.db $00                                                  ; $998f : $00
	.db $00                                                  ; $9990 : $00

br_3c_9991:
	.db $00                                                  ; $9991 : $00
	.db $00                                                  ; $9992 : $00
	.db $00                                                  ; $9993 : $00
	.db $00                                                  ; $9994 : $00
	.db $00                                                  ; $9995 : $00
	ora ($00, X)                                                  ; $9996 : $01, $00
	tsb $00                                                  ; $9998 : $04, $00
	bpl br_3c_999c                                                  ; $999a : $10, $00

br_3c_999c:
	.db $00                                                  ; $999c : $00
	.db $00                                                  ; $999d : $00
	rti                                                  ; $999e : $40


	.db $00                                                  ; $999f : $00
	.db $00                                                  ; $99a0 : $00
	.db $00                                                  ; $99a1 : $00
	.db $00                                                  ; $99a2 : $00
	.db $00                                                  ; $99a3 : $00
	.db $00                                                  ; $99a4 : $00
	.db $00                                                  ; $99a5 : $00
	.db $00                                                  ; $99a6 : $00
	.db $00                                                  ; $99a7 : $00
	.db $00                                                  ; $99a8 : $00
	.db $00                                                  ; $99a9 : $00
	.db $00                                                  ; $99aa : $00
	.db $00                                                  ; $99ab : $00
	.db $00                                                  ; $99ac : $00
	.db $00                                                  ; $99ad : $00
	.db $00                                                  ; $99ae : $00
	.db $00                                                  ; $99af : $00
	.db $00                                                  ; $99b0 : $00
	.db $00                                                  ; $99b1 : $00
	ora $00, S                                                  ; $99b2 : $03, $00
	bmi br_3c_99b6                                                  ; $99b4 : $30, $00

br_3c_99b6:
	.db $00                                                  ; $99b6 : $00
	.db $00                                                  ; $99b7 : $00
	.db $00                                                  ; $99b8 : $00
	.db $00                                                  ; $99b9 : $00
	.db $00                                                  ; $99ba : $00
	.db $00                                                  ; $99bb : $00
	.db $00                                                  ; $99bc : $00
	.db $00                                                  ; $99bd : $00
	.db $00                                                  ; $99be : $00
	.db $00                                                  ; $99bf : $00
	.db $00                                                  ; $99c0 : $00
	.db $00                                                  ; $99c1 : $00
	.db $00                                                  ; $99c2 : $00
	.db $00                                                  ; $99c3 : $00
	.db $00                                                  ; $99c4 : $00
	.db $00                                                  ; $99c5 : $00
	.db $00                                                  ; $99c6 : $00
	.db $00                                                  ; $99c7 : $00
	.db $00                                                  ; $99c8 : $00
	.db $00                                                  ; $99c9 : $00
	.db $00                                                  ; $99ca : $00
	.db $00                                                  ; $99cb : $00
	.db $00                                                  ; $99cc : $00
	.db $00                                                  ; $99cd : $00
	.db $00                                                  ; $99ce : $00
	.db $00                                                  ; $99cf : $00
	.db $00                                                  ; $99d0 : $00
	.db $00                                                  ; $99d1 : $00
	ora ($00, X)                                                  ; $99d2 : $01, $00
	.db $00                                                  ; $99d4 : $00
	.db $00                                                  ; $99d5 : $00
	tsb $00                                                  ; $99d6 : $04, $00
	.db $00                                                  ; $99d8 : $00
	.db $00                                                  ; $99d9 : $00
	php                                                  ; $99da : $08
	.db $00                                                  ; $99db : $00
	.db $00                                                  ; $99dc : $00
	.db $00                                                  ; $99dd : $00
	bpl br_3c_99e0                                                  ; $99de : $10, $00

br_3c_99e0:
	.db $00                                                  ; $99e0 : $00
	.db $00                                                  ; $99e1 : $00
	.db $00                                                  ; $99e2 : $00
	.db $00                                                  ; $99e3 : $00
	.db $00                                                  ; $99e4 : $00
	.db $00                                                  ; $99e5 : $00
	.db $00                                                  ; $99e6 : $00
	.db $00                                                  ; $99e7 : $00
	.db $00                                                  ; $99e8 : $00
	.db $00                                                  ; $99e9 : $00
	.db $00                                                  ; $99ea : $00
	.db $00                                                  ; $99eb : $00
	.db $00                                                  ; $99ec : $00
	.db $00                                                  ; $99ed : $00
	.db $00                                                  ; $99ee : $00
	.db $00                                                  ; $99ef : $00
	.db $00                                                  ; $99f0 : $00
	.db $00                                                  ; $99f1 : $00
	.db $00                                                  ; $99f2 : $00
	.db $00                                                  ; $99f3 : $00
	jsr $2000.w                                                  ; $99f4 : $20, $00, $20
	.db $00                                                  ; $99f7 : $00
	.db $00                                                  ; $99f8 : $00
	.db $00                                                  ; $99f9 : $00
	.db $00                                                  ; $99fa : $00
	.db $00                                                  ; $99fb : $00
	rti                                                  ; $99fc : $40


	.db $00                                                  ; $99fd : $00
	rti                                                  ; $99fe : $40


	.db $00                                                  ; $99ff : $00
	.db $00                                                  ; $9a00 : $00
	.db $00                                                  ; $9a01 : $00
	.db $00                                                  ; $9a02 : $00
	.db $00                                                  ; $9a03 : $00
	.db $00                                                  ; $9a04 : $00
	.db $00                                                  ; $9a05 : $00
	ora ($01, X)                                                  ; $9a06 : $01, $01
	tsb $07                                                  ; $9a08 : $04, $07
	phd                                                  ; $9a0a : $0b
	tsb $0807.w                                                  ; $9a0b : $0c, $07, $08
	ora [$18], Y                                                  ; $9a0e : $17, $18
	.db $00                                                  ; $9a10 : $00
	.db $00                                                  ; $9a11 : $00
	.db $00                                                  ; $9a12 : $00
	.db $00                                                  ; $9a13 : $00
	.db $00                                                  ; $9a14 : $00
	.db $00                                                  ; $9a15 : $00
	cop $00.b                                                  ; $9a16 : $02, $00
	.db $00                                                  ; $9a18 : $00
	.db $00                                                  ; $9a19 : $00
	.db $00                                                  ; $9a1a : $00
	.db $00                                                  ; $9a1b : $00
	bpl br_3c_9a1e                                                  ; $9a1c : $10, $00

br_3c_9a1e:
	.db $00                                                  ; $9a1e : $00
	.db $00                                                  ; $9a1f : $00
	.db $00                                                  ; $9a20 : $00
	.db $00                                                  ; $9a21 : $00
	.db $00                                                  ; $9a22 : $00
	.db $00                                                  ; $9a23 : $00
	ora ($01, X)                                                  ; $9a24 : $01, $01
	cop $03.b                                                  ; $9a26 : $02, $03
	ora $06                                                  ; $9a28 : $05, $06
	phd                                                  ; $9a2a : $0b
	tsb $1817.w                                                  ; $9a2b : $0c, $17, $18
	and $000030.l                                                  ; $9a2e : $2f, $30, $00, $00
	.db $00                                                  ; $9a32 : $00
	.db $00                                                  ; $9a33 : $00
	cop $00.b                                                  ; $9a34 : $02, $00
	tsb $00                                                  ; $9a36 : $04, $00
	php                                                  ; $9a38 : $08
	.db $00                                                  ; $9a39 : $00
	bpl br_3c_9a3c                                                  ; $9a3a : $10, $00

br_3c_9a3c:
	jsr $0000.w                                                  ; $9a3c : $20, $00, $00
	.db $00                                                  ; $9a3f : $00
	php                                                  ; $9a40 : $08
	ora $3f704f.l                                                  ; $9a41 : $0f, $4f, $70, $3f
	cpy #$00ff.w                                                  ; $9a45 : $c0, $ff, $00
	sbc $00ff00.l, X                                                  ; $9a48 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $9a4c : $ff, $00, $ff, $00
	bpl br_3c_9a52                                                  ; $9a50 : $10, $00

br_3c_9a52:
	bra br_3c_9a54                                                  ; $9a52 : $80, $00

br_3c_9a54:
	.db $00                                                  ; $9a54 : $00
	.db $00                                                  ; $9a55 : $00
	.db $00                                                  ; $9a56 : $00
	.db $00                                                  ; $9a57 : $00
	.db $00                                                  ; $9a58 : $00
	.db $00                                                  ; $9a59 : $00
	.db $00                                                  ; $9a5a : $00
	.db $00                                                  ; $9a5b : $00
	.db $00                                                  ; $9a5c : $00
	.db $00                                                  ; $9a5d : $00
	.db $00                                                  ; $9a5e : $00
	.db $00                                                  ; $9a5f : $00
	.db $00                                                  ; $9a60 : $00
	.db $00                                                  ; $9a61 : $00
	clc                                                  ; $9a62 : $18
	clc                                                  ; $9a63 : $18
	bit $3c                                                  ; $9a64 : $24, $3c
	phy                                                  ; $9a66 : $5a
	ror $5a                                                  ; $9a67 : $66, $5a
	ror $24                                                  ; $9a69 : $66, $24
	bit $1818.w, X                                                  ; $9a6b : $3c, $18, $18
	.db $00                                                  ; $9a6e : $00
	.db $00                                                  ; $9a6f : $00
	.db $00                                                  ; $9a70 : $00
	.db $00                                                  ; $9a71 : $00
	.db $00                                                  ; $9a72 : $00
	.db $00                                                  ; $9a73 : $00
	.db $00                                                  ; $9a74 : $00
	.db $00                                                  ; $9a75 : $00
	.db $00                                                  ; $9a76 : $00
	.db $00                                                  ; $9a77 : $00
	.db $00                                                  ; $9a78 : $00
	.db $00                                                  ; $9a79 : $00
	.db $00                                                  ; $9a7a : $00
	.db $00                                                  ; $9a7b : $00
	.db $00                                                  ; $9a7c : $00
	.db $00                                                  ; $9a7d : $00
	.db $00                                                  ; $9a7e : $00
	.db $00                                                  ; $9a7f : $00
	ora $605f20.l, X                                                  ; $9a80 : $1f, $20, $5f, $60
	and $403f40.l, X                                                  ; $9a84 : $3f, $40, $3f, $40
	sbc $807f80.l, X                                                  ; $9a88 : $ff, $80, $7f, $80
	adc $807f80.l, X                                                  ; $9a8c : $7f, $80, $7f, $80
	rti                                                  ; $9a90 : $40


	.db $00                                                  ; $9a91 : $00
	.db $00                                                  ; $9a92 : $00
	.db $00                                                  ; $9a93 : $00
	.db $00                                                  ; $9a94 : $00

br_3c_9a95:
	.db $00                                                  ; $9a95 : $00
	bra br_3c_9a98                                                  ; $9a96 : $80, $00

br_3c_9a98:
	.db $00                                                  ; $9a98 : $00
	.db $00                                                  ; $9a99 : $00
	.db $00                                                  ; $9a9a : $00
	.db $00                                                  ; $9a9b : $00
	.db $00                                                  ; $9a9c : $00
	.db $00                                                  ; $9a9d : $00
	.db $00                                                  ; $9a9e : $00
	.db $00                                                  ; $9a9f : $00
	sbc $00ff00.l, X                                                  ; $9aa0 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $9aa4 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $9aa8 : $ff, $00, $ff, $00
	sbc $00ff00.l, X                                                  ; $9aac : $ff, $00, $ff, $00
	.db $00                                                  ; $9ab0 : $00
	.db $00                                                  ; $9ab1 : $00
	.db $00                                                  ; $9ab2 : $00
	.db $00                                                  ; $9ab3 : $00
	.db $00                                                  ; $9ab4 : $00
	.db $00                                                  ; $9ab5 : $00
	.db $00                                                  ; $9ab6 : $00
	.db $00                                                  ; $9ab7 : $00
	.db $00                                                  ; $9ab8 : $00

br_3c_9ab9:
	.db $00                                                  ; $9ab9 : $00
	.db $00                                                  ; $9aba : $00
	.db $00                                                  ; $9abb : $00
	.db $00                                                  ; $9abc : $00
	.db $00                                                  ; $9abd : $00
	.db $00                                                  ; $9abe : $00
	.db $00                                                  ; $9abf : $00
	.db $00                                                  ; $9ac0 : $00
	.db $00                                                  ; $9ac1 : $00
	.db $00                                                  ; $9ac2 : $00
	.db $00                                                  ; $9ac3 : $00

br_3c_9ac4:
	.db $00                                                  ; $9ac4 : $00
	.db $00                                                  ; $9ac5 : $00
	.db $00                                                  ; $9ac6 : $00
	.db $00                                                  ; $9ac7 : $00
	ora #$160f.w                                                  ; $9ac8 : $09, $0f, $16
	ora $302f.w, Y                                                  ; $9acb : $19, $2f, $30
	ora $000020.l, X                                                  ; $9ace : $1f, $20, $00, $00
	.db $00                                                  ; $9ad2 : $00
	.db $00                                                  ; $9ad3 : $00
	.db $00                                                  ; $9ad4 : $00
	.db $00                                                  ; $9ad5 : $00
	.db $00                                                  ; $9ad6 : $00
	.db $00                                                  ; $9ad7 : $00
	.db $00                                                  ; $9ad8 : $00

br_3c_9ad9:
	.db $00                                                  ; $9ad9 : $00
	.db $00                                                  ; $9ada : $00
	.db $00                                                  ; $9adb : $00
	.db $00                                                  ; $9adc : $00
	.db $00                                                  ; $9add : $00
	.db $00                                                  ; $9ade : $00
	.db $00                                                  ; $9adf : $00
	ora [$07]                                                  ; $9ae0 : $07, $07
	ora ($01, X)                                                  ; $9ae2 : $01, $01
	tsb $00                                                  ; $9ae4 : $04, $00
	bpl br_3c_9ae8                                                  ; $9ae6 : $10, $00

br_3c_9ae8:
	and [$00]                                                  ; $9ae8 : $27, $00
	cmp $c07880.l, X                                                  ; $9aea : $df, $80, $78, $c0
	tay                                                  ; $9aee : $a8
	eor $100008.l                                                  ; $9aef : $4f, $08, $00, $10
	.db $00                                                  ; $9af3 : $00
	ora $07, S                                                  ; $9af4 : $03, $07
	ora $3f181f.l                                                  ; $9af6 : $0f, $1f, $18, $3f
	jsr $077f.w                                                  ; $9afa : $20, $7f, $07
	and $00301f.l, X                                                  ; $9afd : $3f, $1f, $30, $00
	.db $00                                                  ; $9b01 : $00
	bvs br_3c_9ac4                                                  ; $9b02 : $70, $c0

	jsr $9f60.w                                                  ; $9b04 : $20, $60, $9f
	bmi br_3c_9b29                                                  ; $9b07 : $30, $20

	bmi br_3c_9ad9                                                  ; $9b09 : $30, $ce

	asl $1831.w, X                                                  ; $9b0b : $1e, $31, $18
	lsr $cc                                                  ; $9b0e : $46, $cc
	bra br_3c_9b12                                                  ; $9b10 : $80, $00

br_3c_9b12:
	.db $00                                                  ; $9b12 : $00
	bmi br_3c_9a95                                                  ; $9b13 : $30, $80

	.db $00                                                  ; $9b15 : $00
	rti                                                  ; $9b16 : $40


	sta $27c7cf.l                                                  ; $9b17 : $8f, $cf, $c7, $27
	cmp ($c6, X)                                                  ; $9b1b : $c1, $c6
	sbc $f1, S                                                  ; $9b1d : $e3, $f1
	and $00, S                                                  ; $9b1f : $23, $00
	.db $00                                                  ; $9b21 : $00
	.db $00                                                  ; $9b22 : $00
	.db $00                                                  ; $9b23 : $00
	.db $00                                                  ; $9b24 : $00
	.db $00                                                  ; $9b25 : $00
	beq br_3c_9b28                                                  ; $9b26 : $f0, $00

br_3c_9b28:
	rts                                                  ; $9b28 : $60


br_3c_9b29:
	.db $00                                                  ; $9b29 : $00
	cpy #$fe00.w                                                  ; $9b2a : $c0, $00, $fe
	.db $00                                                  ; $9b2d : $00
	cpy $00c0.w                                                  ; $9b2e : $cc, $c0, $00
	.db $00                                                  ; $9b31 : $00
	.db $00                                                  ; $9b32 : $00
	.db $00                                                  ; $9b33 : $00
	.db $00                                                  ; $9b34 : $00
	.db $00                                                  ; $9b35 : $00
	.db $00                                                  ; $9b36 : $00
	beq br_3c_9ab9                                                  ; $9b37 : $f0, $80

	cpx #$c000.w                                                  ; $9b39 : $e0, $00, $c0
	.db $00                                                  ; $9b3c : $00
	inc $3cf0.w, X                                                  ; $9b3d : $fe, $f0, $3c
	.db $00                                                  ; $9b40 : $00
	.db $00                                                  ; $9b41 : $00
	.db $00                                                  ; $9b42 : $00
	.db $00                                                  ; $9b43 : $00
	bra br_3c_9b46                                                  ; $9b44 : $80, $00

br_3c_9b46:
	.db $00                                                  ; $9b46 : $00
	.db $00                                                  ; $9b47 : $00
	.db $00                                                  ; $9b48 : $00
	.db $00                                                  ; $9b49 : $00
	.db $00                                                  ; $9b4a : $00
	.db $00                                                  ; $9b4b : $00
	cpy #$7000.w                                                  ; $9b4c : $c0, $00, $70
	.db $00                                                  ; $9b4f : $00
	.db $00                                                  ; $9b50 : $00
	.db $00                                                  ; $9b51 : $00
	.db $00                                                  ; $9b52 : $00
	.db $00                                                  ; $9b53 : $00
	.db $00                                                  ; $9b54 : $00
	bra br_3c_9b57                                                  ; $9b55 : $80, $00

br_3c_9b57:
	.db $00                                                  ; $9b57 : $00
	.db $00                                                  ; $9b58 : $00
	.db $00                                                  ; $9b59 : $00
	.db $00                                                  ; $9b5a : $00
	.db $00                                                  ; $9b5b : $00
	.db $00                                                  ; $9b5c : $00
	cpy #$f080.w                                                  ; $9b5d : $c0, $80, $f0
	adc $403f40.l, X                                                  ; $9b60 : $7f, $40, $3f, $40
	eor $f0af20.l, X                                                  ; $9b64 : $5f, $20, $af, $f0
	eor [$c8]                                                  ; $9b68 : $47, $c8
	ora $848388.l                                                  ; $9b6a : $0f, $88, $83, $84
	sta $84, S                                                  ; $9b6e : $83, $84
	.db $00                                                  ; $9b70 : $00
	.db $00                                                  ; $9b71 : $00
	.db $00                                                  ; $9b72 : $00
	.db $00                                                  ; $9b73 : $00
	.db $00                                                  ; $9b74 : $00
	.db $00                                                  ; $9b75 : $00
	.db $00                                                  ; $9b76 : $00
	.db $00                                                  ; $9b77 : $00
	.db $00                                                  ; $9b78 : $00

br_3c_9b79:
	.db $00                                                  ; $9b79 : $00
	.db $00                                                  ; $9b7a : $00

br_3c_9b7b:
	.db $00                                                  ; $9b7b : $00
	.db $00                                                  ; $9b7c : $00

br_3c_9b7d:
	.db $00                                                  ; $9b7d : $00
	.db $00                                                  ; $9b7e : $00
	.db $00                                                  ; $9b7f : $00
	ldx $c37f.w, Y                                                  ; $9b80 : $be, $7f, $c3
	and $d9, S                                                  ; $9b83 : $23, $d9
	and ($dd, X)                                                  ; $9b85 : $21, $dd
	and ($ec), Y                                                  ; $9b87 : $31, $ec
	bpl br_3c_9b79                                                  ; $9b89 : $10, $ee

	bpl br_3c_9b7b                                                  ; $9b8b : $10, $ee

	bpl br_3c_9b7d                                                  ; $9b8d : $10, $ee

	bpl br_3c_9bb0                                                  ; $9b8f : $10, $1f

	.db $00                                                  ; $9b91 : $00
	ora $1e071c.l, X                                                  ; $9b92 : $1f, $1c, $07, $1e
	ora $0e, S                                                  ; $9b96 : $03, $0e
	ora $0f, S                                                  ; $9b98 : $03, $0f
	ora ($0f, X)                                                  ; $9b9a : $01, $0f
	ora ($0f, X)                                                  ; $9b9c : $01, $0f
	ora ($0f, X)                                                  ; $9b9e : $01, $0f
	lda ($6d, X)                                                  ; $9ba0 : $a1, $6d
	adc ($9c, X)                                                  ; $9ba2 : $61, $9c
	ina                                                  ; $9ba4 : $1a
	inc $c6b3.w, X                                                  ; $9ba5 : $fe, $b3, $c6
	lda $d6, S                                                  ; $9ba8 : $a3, $d6
	lda ($c6)                                                  ; $9baa : $b2, $c6
	lda ($c6, S), Y                                                  ; $9bac : $b3, $c6
	lda ($c7, S), Y                                                  ; $9bae : $b3, $c7

br_3c_9bb0:
	adc ($02, S), Y                                                  ; $9bb0 : $73, $02
	sta ($01)                                                  ; $9bb2 : $92, $01
	sbc ($01), Y                                                  ; $9bb4 : $f1, $01
	iny                                                  ; $9bb6 : $c8
	ora ($d8, X)                                                  ; $9bb7 : $01, $d8
	ora ($c9, X)                                                  ; $9bb9 : $01, $c9
	ora ($c8, X)                                                  ; $9bbb : $01, $c8
	ora ($c9, X)                                                  ; $9bbd : $01, $c9
	.db $00                                                  ; $9bbf : $00
	tya                                                  ; $9bc0 : $98
	bra br_3c_9bf3                                                  ; $9bc1 : $80, $30

	.db $00                                                  ; $9bc3 : $00
	lda $30b7e0.l                                                  ; $9bc4 : $af, $e0, $b7, $30
	lsr                                                  ; $9bc8 : $4a
	sei                                                  ; $9bc9 : $78
	cmp [$10], Y                                                  ; $9bca : $d7, $10
	ldx #$693e.w                                                  ; $9bcc : $a2, $3e, $69
	ora $c078e0.l                                                  ; $9bcf : $0f, $e0, $78, $c0
	.db $f0, $f0                                                  ; $9bd3 : $f0, $f0

	ora $fccf78.l, X                                                  ; $9bd5 : $1f, $78, $cf, $fc
	stx $38                                                  ; $9bd9 : $86, $38
	sbc $9fc17f.l                                                  ; $9bdb : $ef, $7f, $c1, $9f
	beq br_3c_9be1                                                  ; $9bdf : $f0, $00

br_3c_9be1:
	.db $00                                                  ; $9be1 : $00
	ora ($01, X)                                                  ; $9be2 : $01, $01
	ora $06                                                  ; $9be4 : $05, $06
	phd                                                  ; $9be6 : $0b
	tsb $1817.w                                                  ; $9be7 : $0c, $17, $18
	and ($3e, X)                                                  ; $9bea : $21, $3e
	ora ($33)                                                  ; $9bec : $12, $33
	adc ($61, X)                                                  ; $9bee : $61, $61
	.db $00                                                  ; $9bf0 : $00
	.db $00                                                  ; $9bf1 : $00
	.db $00                                                  ; $9bf2 : $00

br_3c_9bf3:
	.db $00                                                  ; $9bf3 : $00
	.db $00                                                  ; $9bf4 : $00
	.db $00                                                  ; $9bf5 : $00
	.db $00                                                  ; $9bf6 : $00
	.db $00                                                  ; $9bf7 : $00
	.db $00                                                  ; $9bf8 : $00
	.db $00                                                  ; $9bf9 : $00
	.db $00                                                  ; $9bfa : $00
	.db $00                                                  ; $9bfb : $00
	.db $00                                                  ; $9bfc : $00
	.db $00                                                  ; $9bfd : $00
	.db $00                                                  ; $9bfe : $00
	.db $00                                                  ; $9bff : $00
	ora ($00, X)                                                  ; $9c00 : $01, $00
	asl                                                  ; $9c02 : $0a
	sed                                                  ; $9c03 : $f8
	inc $0c, X                                                  ; $9c04 : $f6, $0c
	plx                                                  ; $9c06 : $fa
	asl $fd                                                  ; $9c07 : $06, $fd
	cop $fd.b                                                  ; $9c09 : $02, $fd
	ora $fe, S                                                  ; $9c0b : $03, $fe
	ora ($fe, X)                                                  ; $9c0d : $01, $fe
	ora ($01, X)                                                  ; $9c0f : $01, $01
	.db $00                                                  ; $9c11 : $00
	ora $00, S                                                  ; $9c12 : $03, $00
	cop $00.b                                                  ; $9c14 : $02, $00
	.db $00                                                  ; $9c16 : $00
	.db $00                                                  ; $9c17 : $00
	ora ($00, X)                                                  ; $9c18 : $01, $00
	.db $00                                                  ; $9c1a : $00
	.db $00                                                  ; $9c1b : $00
	.db $00                                                  ; $9c1c : $00
	.db $00                                                  ; $9c1d : $00
	.db $00                                                  ; $9c1e : $00
	.db $00                                                  ; $9c1f : $00
	bpl br_3c_9c22                                                  ; $9c20 : $10, $00

br_3c_9c22:
	.db $10, $10                                                  ; $9c22 : $10, $10

	php                                                  ; $9c24 : $08
	php                                                  ; $9c25 : $08
	rol $04, X                                                  ; $9c26 : $36, $04
	bra br_3c_9c2a                                                  ; $9c28 : $80, $00

br_3c_9c2a:
	ora $f0f402.l, X                                                  ; $9c2a : $1f, $02, $f4, $f0
	cmp ($fd, X)                                                  ; $9c2e : $c1, $fd
	beq br_3c_9c32                                                  ; $9c30 : $f0, $00

br_3c_9c32:
	sbc #$1600.w                                                  ; $9c32 : $e9, $00, $16
	.db $00                                                  ; $9c35 : $00
	rol                                                  ; $9c36 : $2a
	.db $10, $7e                                                  ; $9c37 : $10, $7e

	sed                                                  ; $9c39 : $f8
	sbc $f8                                                  ; $9c3a : $e5, $f8
	xce                                                  ; $9c3c : $fb

br_3c_9c3d:
	tsb $007e.w                                                  ; $9c3d : $0c, $7e, $00
	.db $00                                                  ; $9c40 : $00
	.db $00                                                  ; $9c41 : $00
	.db $00                                                  ; $9c42 : $00
	.db $00                                                  ; $9c43 : $00
	.db $00                                                  ; $9c44 : $00
	.db $00                                                  ; $9c45 : $00
	.db $00                                                  ; $9c46 : $00
	.db $00                                                  ; $9c47 : $00
	.db $00                                                  ; $9c48 : $00
	.db $00                                                  ; $9c49 : $00
	.db $00                                                  ; $9c4a : $00
	.db $00                                                  ; $9c4b : $00
	.db $00                                                  ; $9c4c : $00
	.db $00                                                  ; $9c4d : $00
	cpx #$0000.w                                                  ; $9c4e : $e0, $00, $00
	.db $00                                                  ; $9c51 : $00
	bra br_3c_9c54                                                  ; $9c52 : $80, $00

br_3c_9c54:
	rti                                                  ; $9c54 : $40


	.db $00                                                  ; $9c55 : $00
	plp                                                  ; $9c56 : $28
	.db $00                                                  ; $9c57 : $00
	bmi br_3c_9c5a                                                  ; $9c58 : $30, $00

br_3c_9c5a:
	rts                                                  ; $9c5a : $60


	.db $00                                                  ; $9c5b : $00
	cmp ($00), Y                                                  ; $9c5c : $d1, $00
	stx $0060.w                                                  ; $9c5e : $8e, $60, $00
	.db $00                                                  ; $9c61 : $00
	.db $00                                                  ; $9c62 : $00
	.db $00                                                  ; $9c63 : $00
	.db $00                                                  ; $9c64 : $00
	.db $00                                                  ; $9c65 : $00
	.db $00                                                  ; $9c66 : $00
	.db $00                                                  ; $9c67 : $00
	.db $00                                                  ; $9c68 : $00
	.db $00                                                  ; $9c69 : $00
	bra br_3c_9c6c                                                  ; $9c6a : $80, $00

br_3c_9c6c:
	jsr Call_3c_c400.w                                                  ; $9c6c : $20, $00, $c4
	cpy #$0000.w                                                  ; $9c6f : $c0, $00, $00
	bra br_3c_9c74                                                  ; $9c72 : $80, $00

br_3c_9c74:
	rti                                                  ; $9c74 : $40


	.db $00                                                  ; $9c75 : $00
	bra br_3c_9c78                                                  ; $9c76 : $80, $00

br_3c_9c78:
	bmi br_3c_9c7a                                                  ; $9c78 : $30, $00

br_3c_9c7a:
	php                                                  ; $9c7a : $08
	bra br_3c_9c3d                                                  ; $9c7b : $80, $c0

	cpx #$3cf8.w                                                  ; $9c7d : $e0, $f8, $3c
	rti                                                  ; $9c80 : $40


	rti                                                  ; $9c81 : $40


	eor ($40, X)                                                  ; $9c82 : $41, $40
	ora ($00, X)                                                  ; $9c84 : $01, $00
	cop $00.b                                                  ; $9c86 : $02, $00
	ora $01, S                                                  ; $9c88 : $03, $01
	.db $00                                                  ; $9c8a : $00
	ora ($02, X)                                                  ; $9c8b : $01, $02
	ora $02, S                                                  ; $9c8d : $03, $02
	ora $01, S                                                  ; $9c8f : $03, $01
	.db $00                                                  ; $9c91 : $00
	ora $00, S                                                  ; $9c92 : $03, $00
	cop $01.b                                                  ; $9c94 : $02, $01
	ora $01, S                                                  ; $9c96 : $03, $01
	ora ($02, X)                                                  ; $9c98 : $01, $02
	ora $02, S                                                  ; $9c9a : $03, $02
	ora $00, S                                                  ; $9c9c : $03, $00
	ora $00, S                                                  ; $9c9e : $03, $00
	adc $80ff80.l, X                                                  ; $9ca0 : $7f, $80, $ff, $80
	sbc $c03f80.l, X                                                  ; $9ca4 : $ff, $80, $3f, $c0
	and $40bfc0.l, X                                                  ; $9ca8 : $3f, $c0, $bf, $40
	lda $40bf40.l, X                                                  ; $9cac : $bf, $40, $bf, $40
	.db $00                                                  ; $9cb0 : $00
	.db $00                                                  ; $9cb1 : $00
	.db $00                                                  ; $9cb2 : $00
	.db $00                                                  ; $9cb3 : $00
	bra br_3c_9cb6                                                  ; $9cb4 : $80, $00

br_3c_9cb6:
	bra br_3c_9cb8                                                  ; $9cb6 : $80, $00

br_3c_9cb8:
	bra br_3c_9cba                                                  ; $9cb8 : $80, $00

br_3c_9cba:
	.db $00                                                  ; $9cba : $00
	.db $00                                                  ; $9cbb : $00
	.db $00                                                  ; $9cbc : $00
	.db $00                                                  ; $9cbd : $00
	.db $00                                                  ; $9cbe : $00
	.db $00                                                  ; $9cbf : $00
	eor [$9d], Y                                                  ; $9cc0 : $57, $9d
	and [$b9]                                                  ; $9cc2 : $27, $b9
	pla                                                  ; $9cc4 : $68
	stx $dc53.w                                                  ; $9cc5 : $8e, $53, $dc
	lda $46, X                                                  ; $9cc8 : $b5, $46
	plb                                                  ; $9cca : $ab
	jmp $46b5.w                                                  ; $9ccb : $4c, $b5, $46


	tyx                                                  ; $9cce : $bb

br_3c_9ccf:
	wdm                                                  ; $9ccf : $42
	rol $7860.w, X                                                  ; $9cd0 : $3e, $60, $78
	rti                                                  ; $9cd3 : $40


	ora $203d70.l, X                                                  ; $9cd4 : $1f, $70, $3d, $20
	ora $301d38.l                                                  ; $9cd8 : $0f, $38, $1d, $30
	ora $3c0738.l                                                  ; $9cdc : $0f, $38, $07, $3c
	rti                                                  ; $9ce0 : $40


	.db $00                                                  ; $9ce1 : $00
	bmi br_3c_9ce4                                                  ; $9ce2 : $30, $00

br_3c_9ce4:
	jmp ($a900.w, X)                                                  ; $9ce4 : $7c, $00, $a9


	ldy #$8092.w                                                  ; $9ce7 : $a0, $92, $80
	lda $b88ba0.l                                                  ; $9cea : $af, $a0, $8b, $b8
	sta $b1, X                                                  ; $9cee : $95, $b1
	sta [$40]                                                  ; $9cf0 : $87, $40
	iny                                                  ; $9cf2 : $c8
	.db $70, $c0                                                  ; $9cf3 : $70, $c0

	bit $1f76.w, X                                                  ; $9cf5 : $3c, $76, $1f
	adc $703e.w                                                  ; $9cf8 : $6d, $3e, $70
	ora $7b077c.l, X                                                  ; $9cfb : $1f, $7c, $07, $7b
	asl $0704.w                                                  ; $9cff : $0e, $04, $07
	ora ($0e, X)                                                  ; $9d02 : $01, $0e
	ora ($13)                                                  ; $9d04 : $12, $13
	.db $00                                                  ; $9d06 : $00
	.db $00                                                  ; $9d07 : $00
	.db $00                                                  ; $9d08 : $00
	.db $00                                                  ; $9d09 : $00
	.db $00                                                  ; $9d0a : $00
	.db $00                                                  ; $9d0b : $00
	.db $00                                                  ; $9d0c : $00
	.db $00                                                  ; $9d0d : $00
	.db $00                                                  ; $9d0e : $00
	.db $00                                                  ; $9d0f : $00
	.db $00                                                  ; $9d10 : $00
	.db $00                                                  ; $9d11 : $00
	bpl br_3c_9d14                                                  ; $9d12 : $10, $00

br_3c_9d14:
	jsr $4000.w                                                  ; $9d14 : $20, $00, $40
	.db $00                                                  ; $9d17 : $00
	bra br_3c_9d1a                                                  ; $9d18 : $80, $00

br_3c_9d1a:
	.db $00                                                  ; $9d1a : $00
	.db $00                                                  ; $9d1b : $00
	.db $00                                                  ; $9d1c : $00
	.db $00                                                  ; $9d1d : $00
	.db $00                                                  ; $9d1e : $00
	.db $00                                                  ; $9d1f : $00
	.db $80, $80                                                  ; $9d20 : $80, $80

	jsr $50e0.w                                                  ; $9d22 : $20, $e0, $50
	bcs br_3c_9ccf                                                  ; $9d25 : $b0, $a8

	cld                                                  ; $9d27 : $d8
	bvs br_3c_9d72                                                  ; $9d28 : $70, $48

	trb $2c                                                  ; $9d2a : $14, $2c
	sec                                                  ; $9d2c : $38
	bit $1b                                                  ; $9d2d : $24, $1b
	tsb $00                                                  ; $9d2f : $04, $00
	.db $00                                                  ; $9d31 : $00
	.db $00                                                  ; $9d32 : $00
	.db $00                                                  ; $9d33 : $00
	.db $00                                                  ; $9d34 : $00
	.db $00                                                  ; $9d35 : $00

br_3c_9d36:
	.db $00                                                  ; $9d36 : $00
	.db $00                                                  ; $9d37 : $00
	.db $00                                                  ; $9d38 : $00
	.db $00                                                  ; $9d39 : $00
	.db $00                                                  ; $9d3a : $00
	.db $00                                                  ; $9d3b : $00
	.db $00                                                  ; $9d3c : $00
	.db $00                                                  ; $9d3d : $00
	.db $00                                                  ; $9d3e : $00
	ora $00, S                                                  ; $9d3f : $03, $00
	.db $00                                                  ; $9d41 : $00
	bra br_3c_9d44                                                  ; $9d42 : $80, $00

br_3c_9d44:
	jsr $1000.w                                                  ; $9d44 : $20, $00, $10
	.db $00                                                  ; $9d47 : $00
	php                                                  ; $9d48 : $08
	.db $00                                                  ; $9d49 : $00
	.db $00                                                  ; $9d4a : $00
	.db $00                                                  ; $9d4b : $00
	tsb $00                                                  ; $9d4c : $04, $00
	pea $0000.w                                                  ; $9d4e : $f4, $00, $00
	.db $00                                                  ; $9d51 : $00
	bra br_3c_9d54                                                  ; $9d52 : $80, $00

br_3c_9d54:
	jsr $1000.w                                                  ; $9d54 : $20, $00, $10
	.db $00                                                  ; $9d57 : $00
	php                                                  ; $9d58 : $08
	.db $00                                                  ; $9d59 : $00

br_3c_9d5a:
	.db $00                                                  ; $9d5a : $00
	.db $00                                                  ; $9d5b : $00
	tsb $00                                                  ; $9d5c : $04, $00
	tsb $f0                                                  ; $9d5e : $04, $f0
	.db $00                                                  ; $9d60 : $00
	.db $00                                                  ; $9d61 : $00
	.db $00                                                  ; $9d62 : $00
	.db $00                                                  ; $9d63 : $00
	rti                                                  ; $9d64 : $40


	.db $00                                                  ; $9d65 : $00
	cpx #$3800.w                                                  ; $9d66 : $e0, $00, $38
	bra br_3c_9ddb                                                  ; $9d69 : $80, $70

	.db $00                                                  ; $9d6b : $00

br_3c_9d6c:
	stz $4980.w                                                  ; $9d6c : $9c, $80, $49
	cpy #$0000.w                                                  ; $9d6f : $c0, $00, $00

br_3c_9d72:
	.db $00                                                  ; $9d72 : $00
	.db $00                                                  ; $9d73 : $00
	bra br_3c_9d36                                                  ; $9d74 : $80, $c0

	.db $00                                                  ; $9d76 : $00
	cpx #$78c0.w                                                  ; $9d77 : $e0, $c0, $78
	bra br_3c_9d6c                                                  ; $9d7a : $80, $f0

	cpx #$f67c.w                                                  ; $9d7c : $e0, $7c, $f6
	and $020000.l, X                                                  ; $9d7f : $3f, $00, $00, $02
	.db $00                                                  ; $9d83 : $00
	asl $03                                                  ; $9d84 : $06, $03
	tsb $0107.w                                                  ; $9d86 : $0c, $07, $01
	asl $1b                                                  ; $9d89 : $06, $1b
	tsb $0807.w                                                  ; $9d8b : $0c, $07, $08
	and [$18], Y                                                  ; $9d8e : $37, $18
	.db $00                                                  ; $9d90 : $00
	.db $00                                                  ; $9d91 : $00
	ora ($03, X)                                                  ; $9d92 : $01, $03
	ora $04, S                                                  ; $9d94 : $03, $04
	ora [$08]                                                  ; $9d96 : $07, $08
	asl $0c08.w                                                  ; $9d98 : $0e, $08, $0c
	bpl br_3c_9db5                                                  ; $9d9b : $10, $18

	bpl br_3c_9db7                                                  ; $9d9d : $10, $18

	jsr $13ee.w                                                  ; $9d9f : $20, $ee, $13
	sbc $14f2.w, X                                                  ; $9da2 : $fd, $f2, $14
	plx                                                  ; $9da5 : $fa
	ora [$f8]                                                  ; $9da6 : $07, $f8
	sbc [$19]                                                  ; $9da8 : $e7, $19
	inc $09, X                                                  ; $9daa : $f6, $09
	inc $09, X                                                  ; $9dac : $f6, $09
	inc $09, X                                                  ; $9dae : $f6, $09
	ora ($e0, X)                                                  ; $9db0 : $01, $e0
	cpx #$f101.w                                                  ; $9db2 : $e0, $01, $f1

br_3c_9db5:
	ora ($f0, X)                                                  ; $9db5 : $01, $f0

br_3c_9db7:
	ora ($10, X)                                                  ; $9db7 : $01, $10
	.db $00                                                  ; $9db9 : $00
	.db $00                                                  ; $9dba : $00
	.db $00                                                  ; $9dbb : $00
	.db $00                                                  ; $9dbc : $00
	.db $00                                                  ; $9dbd : $00
	.db $00                                                  ; $9dbe : $00
	.db $00                                                  ; $9dbf : $00
	asl $f0, X                                                  ; $9dc0 : $16, $f0
	phk                                                  ; $9dc2 : $4b
	sei                                                  ; $9dc3 : $78
	sta $36aae1.l, X                                                  ; $9dc4 : $9f, $e1, $aa, $36
	eor $1ad570.l                                                  ; $9dc8 : $4f, $70, $d5, $1a
	lda $18d730.l                                                  ; $9dcc : $af, $30, $d7, $18
	plx                                                  ; $9dd0 : $fa
	tsb $85fe.w                                                  ; $9dd1 : $0c, $fe, $85
	sbc $00, S                                                  ; $9dd4 : $e3, $00
	adc [$c1], Y                                                  ; $9dd6 : $77, $c1
	beq br_3c_9d5a                                                  ; $9dd8 : $f0, $80

	tsc                                                  ; $9dda : $3b

br_3c_9ddb:
	cpx #$c071.w                                                  ; $9ddb : $e0, $71, $c0
	and $ffe0.w, Y                                                  ; $9dde : $39, $e0, $ff
	sbc $ffffff.l, X                                                  ; $9de1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9de5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9de9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ded : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9df1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9df5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9df9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9dfd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e01 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e05 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e09 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e0d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e11 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e15 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e19 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e1d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e21 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e25 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e29 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e2d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e31 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e35 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e39 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e3d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e41 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e45 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e49 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e4d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e51 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e55 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e59 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e5d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e61 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e65 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e69 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e6d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e71 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e75 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e79 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e7d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e81 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e85 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e89 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e8d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e91 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e95 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e99 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9e9d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ea1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ea5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ea9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ead : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9eb1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9eb5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9eb9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ebd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ec1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ec5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ec9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ecd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ed1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ed5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ed9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9edd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ee1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ee5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ee9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9eed : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ef1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ef5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ef9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9efd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f01 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f05 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f09 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f0d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f11 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f15 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f19 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f1d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f21 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f25 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f29 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f2d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f31 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f35 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f39 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f3d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f41 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f45 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f49 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f4d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f51 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f55 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f59 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f5d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f61 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f65 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f69 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f6d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f71 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f75 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f79 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f7d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f81 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f85 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f89 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f8d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f91 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f95 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f99 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f9d : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fa1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fa5 : $ff, $ff, $ff, $ff

br_3c_9fa9:
	sbc $ffffff.l, X                                                  ; $9fa9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fad : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fb1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fb5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fb9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fbd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fc1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fc5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fc9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fcd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fd1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fd5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fd9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fdd : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fe1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fe5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fe9 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fed : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ff1 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ff5 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ff9 : $ff, $ff, $ff, $ff
	sbc $e2ffff.l, X                                                  ; $9ffd : $ff, $ff, $ff, $e2
	bmi br_3c_9fa9                                                  ; $a001 : $30, $a6

	ora ($fc, X)                                                  ; $a003 : $01, $fc
	php                                                  ; $a005 : $08
	ldy #$146b.w                                                  ; $a006 : $a0, $6b, $14
	ldy #$a1db.w                                                  ; $a009 : $a0, $db, $a1
	lda $bba5.w, X                                                  ; $a00c : $bd, $a5, $bb
	lda ($c1, X)                                                  ; $a00f : $a1, $c1
	lda ($c7, X)                                                  ; $a011 : $a1, $c7
	lda ($a6, X)                                                  ; $a013 : $a1, $a6
	cop $fc.b                                                  ; $a015 : $02, $fc
	ina                                                  ; $a017 : $1a
	ldy #$2660.w                                                  ; $a018 : $a0, $60, $26
	ldy #$a064.w                                                  ; $a01b : $a0, $64, $a0
	ldy $a0, X                                                  ; $a01e : $b4, $a0
	.db $00                                                  ; $a020 : $00
	lda ($29, X)                                                  ; $a021 : $a1, $29
	lda ($6d, X)                                                  ; $a023 : $a1, $6d
	lda ($ad, X)                                                  ; $a025 : $a1, $ad
	clc                                                  ; $a027 : $18
	ora $d00ac9.l, X                                                  ; $a028 : $1f, $c9, $0a, $d0
	rol $a9, X                                                  ; $a02c : $36, $a9
	cop $85.b                                                  ; $a02e : $02, $85
	cop $22.b                                                  ; $a030 : $02, $22
	dex                                                  ; $a032 : $ca
	cmp ($04), Y                                                  ; $a033 : $d1, $04
	lda #$8f00.w                                                  ; $a035 : $a9, $00, $8f
	sta ($cd), Y                                                  ; $a038 : $91, $cd
	adc $ad20c2.l, X                                                  ; $a03a : $7f, $c2, $20, $ad
	ror $8f1e.w                                                  ; $a03e : $6e, $1e, $8f
	sta ($cd)                                                  ; $a041 : $92, $cd
	adc $1e70ad.l, X                                                  ; $a043 : $7f, $ad, $70, $1e
	sta $7fcd94.l                                                  ; $a047 : $8f, $94, $cd, $7f
	lda wNewStageScrollX.w                                                  ; $a04b : $ad, $5d, $1e
	sta $1e70.w                                                  ; $a04e : $8d, $70, $1e
	sep #ACCU_8                                                  ; $a051 : $e2, $20
	lda wDynamicSpriteTileDatasIdx.w                                                  ; $a053 : $ad, $18, $1f
	sta $7fcd90.l                                                  ; $a056 : $8f, $90, $cd, $7f
	lda #$09.b                                                  ; $a05a : $a9, $09
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $a05c : $8d, $18, $1f
	jsr FarAddThreadToDynamicallyLoadSpriteData.l                                                  ; $a05f : $22, $dc, $b1, $00
	rts                                                  ; $a063 : $60


	lda $0040.w                                                  ; $a064 : $ad, $40, $00
	bne br_3c_a0b3                                                  ; $a067 : $d0, $4a

	rep #ACCU_8|F_CARRY                                                  ; $a069 : $c2, $21
	lda #$0180.w                                                  ; $a06b : $a9, $80, $01
	adc wNewStageScrollX.w                                                  ; $a06e : $6d, $5d, $1e
	sta $05                                                  ; $a071 : $85, $05
	lda #$0090.w                                                  ; $a073 : $a9, $90, $00
	clc                                                  ; $a076 : $18
	adc wNewStageScrollY.w                                                  ; $a077 : $6d, $60, $1e
	sta $08                                                  ; $a07a : $85, $08
	lda #$c482.w                                                  ; $a07c : $a9, $82, $c4
	sta $20                                                  ; $a07f : $85, $20
	tdc                                                  ; $a081 : $7b
	sta $3e                                                  ; $a082 : $85, $3e
	lda #$0000.w                                                  ; $a084 : $a9, $00, $00
	sta $7fcdc0.l                                                  ; $a087 : $8f, $c0, $cd, $7f
	sta $7fcdc2.l                                                  ; $a08b : $8f, $c2, $cd, $7f
	sep #ACCU_8                                                  ; $a08f : $e2, $20
	jsr LoadCurrEnemyBaseData.l                                                  ; $a091 : $22, $5c, $e1, $02
	stz $01                                                  ; $a095 : $64, $01
	lda #$04.b                                                  ; $a097 : $a9, $04
	sta $02                                                  ; $a099 : $85, $02
	lda #$05.b                                                  ; $a09b : $a9, $05
	sta $35                                                  ; $a09d : $85, $35
	lda #$08.b                                                  ; $a09f : $a9, $08
	sta $12                                                  ; $a0a1 : $85, $12
	stz $37                                                  ; $a0a3 : $64, $37
	lda #$0a.b                                                  ; $a0a5 : $a9, $0a
	sta $39                                                  ; $a0a7 : $85, $39
	ldy #$2008.w                                                  ; $a0a9 : $a0, $08, $20
	stz $a6, X                                                  ; $a0ac : $74, $a6
	ldy #$200a.w                                                  ; $a0ae : $a0, $0a, $20
	stz $a6, X                                                  ; $a0b1 : $74, $a6

br_3c_a0b3:
	rts                                                  ; $a0b3 : $60


	dec $39                                                  ; $a0b4 : $c6, $39
	bne br_3c_a0d8                                                  ; $a0b6 : $d0, $20

	jsr Call_3c_a694.w                                                  ; $a0b8 : $20, $94, $a6
	lda #$20.b                                                  ; $a0bb : $a9, $20
	jsr Func_4_d577.l                                                  ; $a0bd : $22, $77, $d5, $04
	ldx #$da06.w                                                  ; $a0c1 : $a2, $06, $da
	jsr Call_3c_a96a.w                                                  ; $a0c4 : $20, $6a, $a9
	plx                                                  ; $a0c7 : $fa
	dex                                                  ; $a0c8 : $ca
	.db $10, $f8                                                  ; $a0c9 : $10, $f8

	lda $35                                                  ; $a0cb : $a5, $35
	jsr Call_3c_a73b.w                                                  ; $a0cd : $20, $3b, $a7
	dec $35                                                  ; $a0d0 : $c6, $35
	bmi br_3c_a0d9                                                  ; $a0d2 : $30, $05

	lda #$0a.b                                                  ; $a0d4 : $a9, $0a
	sta $39                                                  ; $a0d6 : $85, $39

br_3c_a0d8:
	rts                                                  ; $a0d8 : $60


br_3c_a0d9:
	lda $11                                                  ; $a0d9 : $a5, $11
	sta $38                                                  ; $a0db : $85, $38
	lda $28                                                  ; $a0dd : $a5, $28
	sta $1f57.w                                                  ; $a0df : $8d, $57, $1f
	lda #$06.b                                                  ; $a0e2 : $a9, $06
	sta $02                                                  ; $a0e4 : $85, $02
	stz $01                                                  ; $a0e6 : $64, $01
	stz $35                                                  ; $a0e8 : $64, $35
	rep #ACCU_8                                                  ; $a0ea : $c2, $20
	lda #$fdc0.w                                                  ; $a0ec : $a9, $c0, $fd
	sta $1a                                                  ; $a0ef : $85, $1a
	stz $1c                                                  ; $a0f1 : $64, $1c
	sep #ACCU_8                                                  ; $a0f3 : $e2, $20
	lda #$04.b                                                  ; $a0f5 : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $a0f7 : $22, $67, $b9, $04
	jsr Func_2_d636.l                                                  ; $a0fb : $22, $36, $d6, $02
	rts                                                  ; $a0ff : $60


	jsr Func_2_d636.l                                                  ; $a100 : $22, $36, $d6, $02
	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a104 : $22, $f3, $d7, $02
	jsr AnimateEntity.l                                                  ; $a108 : $22, $4a, $b9, $04
	jsr Call_3c_a8aa.w                                                  ; $a10c : $20, $aa, $a8
	jsr Call_3c_a6e4.w                                                  ; $a10f : $20, $e4, $a6
	bne br_3c_a128                                                  ; $a112 : $d0, $14

	lda #$02.b                                                  ; $a114 : $a9, $02
	sta $01                                                  ; $a116 : $85, $01
	stz $02                                                  ; $a118 : $64, $02
	stz $03                                                  ; $a11a : $64, $03
	stz $35                                                  ; $a11c : $64, $35
	stz $3c                                                  ; $a11e : $64, $3c
	lda #$3c.b                                                  ; $a120 : $a9, $3c
	sta $39                                                  ; $a122 : $85, $39
	jsr $04d1ef.l                                                  ; $a124 : $22, $ef, $d1, $04

br_3c_a128:
	rts                                                  ; $a128 : $60


	jsr LoadCurrEnemyBaseData.l                                                  ; $a129 : $22, $5c, $e1, $02
	lda #$01.b                                                  ; $a12d : $a9, $01
	sta $30                                                  ; $a12f : $85, $30
	lda #$39.b                                                  ; $a131 : $a9, $39
	sta $11                                                  ; $a133 : $85, $11
	sta $38                                                  ; $a135 : $85, $38
	lda #$02.b                                                  ; $a137 : $a9, $02
	sta $12                                                  ; $a139 : $85, $12
	lda #$02.b                                                  ; $a13b : $a9, $02
	sta $01                                                  ; $a13d : $85, $01
	lda #$02.b                                                  ; $a13f : $a9, $02
	sta $02                                                  ; $a141 : $85, $02
	stz $03                                                  ; $a143 : $64, $03
	stz $35                                                  ; $a145 : $64, $35
	lda #$01.b                                                  ; $a147 : $a9, $01
	sta $34                                                  ; $a149 : $85, $34
	lda #$09.b                                                  ; $a14b : $a9, $09
	jsr SetupEntitysAnimation.l                                                  ; $a14d : $22, $67, $b9, $04
	rep #ACCU_8|IDX_8                                                  ; $a151 : $c2, $30
	ldy #$0000.w                                                  ; $a153 : $a0, $00, $00
	ldx $3e                                                  ; $a156 : $a6, $3e
	lda $0005.w, X                                                  ; $a158 : $bd, $05, $00
	clc                                                  ; $a15b : $18
	adc $c4bc.w, Y                                                  ; $a15c : $79, $bc, $c4
	sta $05                                                  ; $a15f : $85, $05
	lda $0008.w, X                                                  ; $a161 : $bd, $08, $00
	clc                                                  ; $a164 : $18
	adc $c4be.w, Y                                                  ; $a165 : $79, $be, $c4
	sta $08                                                  ; $a168 : $85, $08
	sep #ACCU_8|IDX_8                                                  ; $a16a : $e2, $30
	rts                                                  ; $a16c : $60


	jsr LoadCurrEnemyBaseData.l                                                  ; $a16d : $22, $5c, $e1, $02
	lda #$0c.b                                                  ; $a171 : $a9, $0c
	sta $12                                                  ; $a173 : $85, $12
	lda #$0d.b                                                  ; $a175 : $a9, $0d
	sta $28                                                  ; $a177 : $85, $28
	lda #$02.b                                                  ; $a179 : $a9, $02
	sta $01                                                  ; $a17b : $85, $01
	lda #$04.b                                                  ; $a17d : $a9, $04
	sta $02                                                  ; $a17f : $85, $02
	stz $03                                                  ; $a181 : $64, $03
	stz $35                                                  ; $a183 : $64, $35
	rep #ACCU_8|IDX_8                                                  ; $a185 : $c2, $30
	ldy #$0004.w                                                  ; $a187 : $a0, $04, $00
	ldx $3e                                                  ; $a18a : $a6, $3e
	lda $0005.w, X                                                  ; $a18c : $bd, $05, $00
	clc                                                  ; $a18f : $18
	adc $c4bc.w, Y                                                  ; $a190 : $79, $bc, $c4

br_3c_a193:
	sta $05                                                  ; $a193 : $85, $05
	sta $22                                                  ; $a195 : $85, $22
	lda $0008.w, X                                                  ; $a197 : $bd, $08, $00
	clc                                                  ; $a19a : $18
	adc $c4be.w, Y                                                  ; $a19b : $79, $be, $c4
	sta $08                                                  ; $a19e : $85, $08
	sta $24                                                  ; $a1a0 : $85, $24
	sta $1ea0.w                                                  ; $a1a2 : $8d, $a0, $1e
	lda #$fa00.w                                                  ; $a1a5 : $a9, $00, $fa
	sta $1ea2.w                                                  ; $a1a8 : $8d, $a2, $1e
	lda #$fe80.w                                                  ; $a1ab : $a9, $80, $fe
	sta $1ea4.w                                                  ; $a1ae : $8d, $a4, $1e
	sep #ACCU_8|IDX_8                                                  ; $a1b1 : $e2, $30
	lda #$13.b                                                  ; $a1b3 : $a9, $13
	sta wMainScreenDesignation.w                                                  ; $a1b5 : $8d, $c1, $00
	stz $36                                                  ; $a1b8 : $64, $36
	rts                                                  ; $a1ba : $60


	lda #$02.b                                                  ; $a1bb : $a9, $02
	sta $01                                                  ; $a1bd : $85, $01
	bra br_3c_a1db                                                  ; $a1bf : $80, $1a

	lda #$02.b                                                  ; $a1c1 : $a9, $02
	sta $01                                                  ; $a1c3 : $85, $01
	bra br_3c_a1db                                                  ; $a1c5 : $80, $14

	jsr Func_2_ddf6.l                                                  ; $a1c7 : $22, $f6, $dd, $02
	lda $0b                                                  ; $a1cb : $a5, $0b
	bne br_3c_a1d9                                                  ; $a1cd : $d0, $0a

	lda $01                                                  ; $a1cf : $a5, $01
	cmp #$04.b                                                  ; $a1d1 : $c9, $04
	bne br_3c_a1db                                                  ; $a1d3 : $d0, $06

	stz $27                                                  ; $a1d5 : $64, $27
	bra br_3c_a217                                                  ; $a1d7 : $80, $3e

br_3c_a1d9:
	bra br_3c_a1db                                                  ; $a1d9 : $80, $00

br_3c_a1db:
	jsr Func_2_d636.l                                                  ; $a1db : $22, $36, $d6, $02
	lda $38                                                  ; $a1df : $a5, $38
	tsb $11                                                  ; $a1e1 : $04, $11
	ldx $02                                                  ; $a1e3 : $a6, $02
	jsr ($a1e9.w, X)                                                  ; $a1e5 : $fc, $e9, $a1
	rts                                                  ; $a1e8 : $60


	sbc $a3eda1.l                                                  ; $a1e9 : $ef, $a1, $ed, $a3
	bcs br_3c_a193                                                  ; $a1ed : $b0, $a4

	stz $1e70.w                                                  ; $a1ef : $9c, $70, $1e
	lda #$10.b                                                  ; $a1f2 : $a9, $10
	sta $1e71.w                                                  ; $a1f4 : $8d, $71, $1e
	jsr $02df64.l                                                  ; $a1f7 : $22, $64, $df, $02
	jsr $04d8d5.l                                                  ; $a1fb : $22, $d5, $d8, $04
	ldx $03                                                  ; $a1ff : $a6, $03
	jsr ($a240.w, X)                                                  ; $a201 : $fc, $40, $a2
	jsr Func_4_cb74.l                                                  ; $a204 : $22, $74, $cb, $04
	bmi br_3c_a217                                                  ; $a208 : $30, $0d

	bne br_3c_a22e                                                  ; $a20a : $d0, $22

	jsr Func_4_cb31.l                                                  ; $a20c : $22, $31, $cb, $04
	jsr Call_3c_a884.w                                                  ; $a210 : $20, $84, $a8
	jsr Call_3c_a9db.w                                                  ; $a213 : $20, $db, $a9
	rts                                                  ; $a216 : $60


br_3c_a217:
	lda #$7f.b                                                  ; $a217 : $a9, $7f
	sta $1f45.w                                                  ; $a219 : $8d, $45, $1f
	sta $1f4f.w                                                  ; $a21c : $8d, $4f, $1f
	lda #$04.b                                                  ; $a21f : $a9, $04
	sta $01                                                  ; $a221 : $85, $01
	stz $02                                                  ; $a223 : $64, $02
	stz $03                                                  ; $a225 : $64, $03
	stz $35                                                  ; $a227 : $64, $35
	stz $3b                                                  ; $a229 : $64, $3b
	stz $34                                                  ; $a22b : $64, $34
	rts                                                  ; $a22d : $60


br_3c_a22e:
	lda #$21.b                                                  ; $a22e : $a9, $21
	jsr Func_1_8000.l                                                  ; $a230 : $22, $00, $80, $01
	lda #$60.b                                                  ; $a234 : $a9, $60
	sta $37                                                  ; $a236 : $85, $37
	lda #$0e.b                                                  ; $a238 : $a9, $0e
	trb $11                                                  ; $a23a : $14, $11
	jsr Call_3c_a9db.w                                                  ; $a23c : $20, $db, $a9
	rts                                                  ; $a23f : $60


	jmp $54a2.w                                                  ; $a240 : $4c, $a2, $54


	ldx #$84.b                                                  ; $a243 : $a2, $84
	ldx #$cd.b                                                  ; $a245 : $a2, $cd
	ldx #$da.b                                                  ; $a247 : $a2, $da
	ldx #$cb.b                                                  ; $a249 : $a2, $cb
	lda $c6, S                                                  ; $a24b : $a3, $c6
	and $03d0.w, Y                                                  ; $a24d : $39, $d0, $03
	jsr Call_3c_a780.w                                                  ; $a250 : $20, $80, $a7
	rts                                                  ; $a253 : $60


	dec $39                                                  ; $a254 : $c6, $39
	bne br_3c_a25f                                                  ; $a256 : $d0, $07

	stz $03                                                  ; $a258 : $64, $03
	lda #$3c.b                                                  ; $a25a : $a9, $3c
	sta $39                                                  ; $a25c : $85, $39
	rts                                                  ; $a25e : $60


br_3c_a25f:
	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a25f : $22, $f3, $d7, $02
	jsr $04c0f7.l                                                  ; $a263 : $22, $f7, $c0, $04
	lda $2b                                                  ; $a267 : $a5, $2b
	bit #$02.b                                                  ; $a269 : $89, $02
	bne br_3c_a277                                                  ; $a26b : $d0, $0a

	jsr Call_3c_a7f9.w                                                  ; $a26d : $20, $f9, $a7
	bne br_3c_a277                                                  ; $a270 : $d0, $05

	jsr AnimateEntity.l                                                  ; $a272 : $22, $4a, $b9, $04
	rts                                                  ; $a276 : $60


br_3c_a277:
	rep #ACCU_8                                                  ; $a277 : $c2, $20
	lda $1a                                                  ; $a279 : $a5, $1a
	eor #$ffff.w                                                  ; $a27b : $49, $ff, $ff
	ina                                                  ; $a27e : $1a
	sta $1a                                                  ; $a27f : $85, $1a
	sep #ACCU_8                                                  ; $a281 : $e2, $20
	rts                                                  ; $a283 : $60


	ldx $35                                                  ; $a284 : $a6, $35
	jsr ($a28e.w, X)                                                  ; $a286 : $fc, $8e, $a2
	jsr AnimateEntity.l                                                  ; $a289 : $22, $4a, $b9, $04
	rts                                                  ; $a28d : $60


	sta ($a2)                                                  ; $a28e : $92, $a2
	lda $a2, X                                                  ; $a290 : $b5, $a2
	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a292 : $22, $f3, $d7, $02
	jsr $04c0f7.l                                                  ; $a296 : $22, $f7, $c0, $04
	lda $2b                                                  ; $a29a : $a5, $2b
	bit #$02.b                                                  ; $a29c : $89, $02
	bne br_3c_a2a1                                                  ; $a29e : $d0, $01

	rts                                                  ; $a2a0 : $60


br_3c_a2a1:
	lda #$3c.b                                                  ; $a2a1 : $a9, $3c
	jsr Func_4_d577.l                                                  ; $a2a3 : $22, $77, $d5, $04
	rep #ACCU_8                                                  ; $a2a7 : $c2, $20
	lda #$0100.w                                                  ; $a2a9 : $a9, $00, $01
	sta $1a                                                  ; $a2ac : $85, $1a
	sep #ACCU_8                                                  ; $a2ae : $e2, $20
	lda #$02.b                                                  ; $a2b0 : $a9, $02
	sta $35                                                  ; $a2b2 : $85, $35
	rts                                                  ; $a2b4 : $60


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a2b5 : $22, $f3, $d7, $02
	jsr Call_3c_a6f9.w                                                  ; $a2b9 : $20, $f9, $a6
	bne br_3c_a2cc                                                  ; $a2bc : $d0, $0e

	stz $03                                                  ; $a2be : $64, $03
	stz $35                                                  ; $a2c0 : $64, $35
	lda #$00.b                                                  ; $a2c2 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $a2c4 : $22, $67, $b9, $04
	lda #$3c.b                                                  ; $a2c8 : $a9, $3c
	sta $39                                                  ; $a2ca : $85, $39

br_3c_a2cc:
	rts                                                  ; $a2cc : $60


	lda $7fcd91.l                                                  ; $a2cd : $af, $91, $cd, $7f
	bne br_3c_a2d9                                                  ; $a2d1 : $d0, $06

	stz $03                                                  ; $a2d3 : $64, $03
	lda #$01.b                                                  ; $a2d5 : $a9, $01
	sta $39                                                  ; $a2d7 : $85, $39

br_3c_a2d9:
	rts                                                  ; $a2d9 : $60


	ldx $35                                                  ; $a2da : $a6, $35
	jsr ($a2e0.w, X)                                                  ; $a2dc : $fc, $e0, $a2
	rts                                                  ; $a2df : $60


	inc $12a2.w                                                  ; $a2e0 : $ee, $a2, $12
	lda $28, S                                                  ; $a2e3 : $a3, $28
	lda $55, S                                                  ; $a2e5 : $a3, $55
	lda $6e, S                                                  ; $a2e7 : $a3, $6e
	lda $9b, S                                                  ; $a2e9 : $a3, $9b
	lda $b4, S                                                  ; $a2eb : $a3, $b4
	lda $a5, S                                                  ; $a2ed : $a3, $a5
	ora $c91bf0.l                                                  ; $a2ef : $0f, $f0, $1b, $c9
	ora ($d0, X)                                                  ; $a2f3 : $01, $d0
	ora $34a9.w                                                  ; $a2f5 : $0d, $a9, $34
	jsr Func_1_802b.l                                                  ; $a2f8 : $22, $2b, $80, $01
	ldy #$01.b                                                  ; $a2fc : $a0, $01
	jsr Call_3c_a8e1.w                                                  ; $a2fe : $20, $e1, $a8
	bra br_3c_a30d                                                  ; $a301 : $80, $0a

	lda #$02.b                                                  ; $a303 : $a9, $02
	sta $35                                                  ; $a305 : $85, $35
	lda #$02.b                                                  ; $a307 : $a9, $02
	jsr SetupEntitysAnimation.l                                                  ; $a309 : $22, $67, $b9, $04

br_3c_a30d:
	jsr AnimateEntity.l                                                  ; $a30d : $22, $4a, $b9, $04
	rts                                                  ; $a311 : $60


	lda $7fcd91.l                                                  ; $a312 : $af, $91, $cd, $7f
	cmp #$02.b                                                  ; $a316 : $c9, $02
	bne br_3c_a327                                                  ; $a318 : $d0, $0d

	rep #ACCU_8                                                  ; $a31a : $c2, $20
	lda #$0130.w                                                  ; $a31c : $a9, $30, $01
	sta $1c                                                  ; $a31f : $85, $1c
	sep #ACCU_8                                                  ; $a321 : $e2, $20
	lda #$04.b                                                  ; $a323 : $a9, $04
	sta $35                                                  ; $a325 : $85, $35

br_3c_a327:
	rts                                                  ; $a327 : $60


	jsr Func_2_d812.l                                                  ; $a328 : $22, $12, $d8, $02
	rep #ACCU_8                                                  ; $a32c : $c2, $20
	lda $08                                                  ; $a32e : $a5, $08
	sec                                                  ; $a330 : $38
	sbc wNewStageScrollY.w                                                  ; $a331 : $ed, $60, $1e
	cmp #$0050.w                                                  ; $a334 : $c9, $50, $00
	bpl br_3c_a34f                                                  ; $a337 : $10, $16

	lda wNewStageScrollY.w                                                  ; $a339 : $ad, $60, $1e
	clc                                                  ; $a33c : $18
	adc #$0050.w                                                  ; $a33d : $69, $50, $00
	sta $08                                                  ; $a340 : $85, $08
	sep #ACCU_8                                                  ; $a342 : $e2, $20
	lda #$03.b                                                  ; $a344 : $a9, $03
	sta $7fcd91.l                                                  ; $a346 : $8f, $91, $cd, $7f
	lda #$06.b                                                  ; $a34a : $a9, $06
	sta $35                                                  ; $a34c : $85, $35
	rts                                                  ; $a34e : $60


br_3c_a34f:
	sep #ACCU_8                                                  ; $a34f : $e2, $20
	jsr Call_3c_a93a.w                                                  ; $a351 : $20, $3a, $a9
	rts                                                  ; $a354 : $60


	lda $7fcd91.l                                                  ; $a355 : $af, $91, $cd, $7f
	cmp #$05.b                                                  ; $a359 : $c9, $05
	bne br_3c_a36d                                                  ; $a35b : $d0, $10

	rep #ACCU_8                                                  ; $a35d : $c2, $20
	lda $1c                                                  ; $a35f : $a5, $1c
	eor #$ffff.w                                                  ; $a361 : $49, $ff, $ff
	ina                                                  ; $a364 : $1a
	sta $1c                                                  ; $a365 : $85, $1c
	sep #ACCU_8                                                  ; $a367 : $e2, $20
	lda #$08.b                                                  ; $a369 : $a9, $08
	sta $35                                                  ; $a36b : $85, $35

br_3c_a36d:
	rts                                                  ; $a36d : $60


	jsr Func_2_d812.l                                                  ; $a36e : $22, $12, $d8, $02
	rep #ACCU_8                                                  ; $a372 : $c2, $20
	lda $08                                                  ; $a374 : $a5, $08
	sec                                                  ; $a376 : $38
	sbc wNewStageScrollY.w                                                  ; $a377 : $ed, $60, $1e
	cmp #$0090.w                                                  ; $a37a : $c9, $90, $00
	bmi br_3c_a395                                                  ; $a37d : $30, $16

	lda wNewStageScrollY.w                                                  ; $a37f : $ad, $60, $1e
	clc                                                  ; $a382 : $18
	adc #$0090.w                                                  ; $a383 : $69, $90, $00
	sta $08                                                  ; $a386 : $85, $08
	sep #ACCU_8                                                  ; $a388 : $e2, $20
	lda #$32.b                                                  ; $a38a : $a9, $32
	jsr Func_1_802b.l                                                  ; $a38c : $22, $2b, $80, $01
	lda #$0a.b                                                  ; $a390 : $a9, $0a
	sta $35                                                  ; $a392 : $85, $35
	rts                                                  ; $a394 : $60


br_3c_a395:
	sep #ACCU_8                                                  ; $a395 : $e2, $20
	jsr Call_3c_a952.w                                                  ; $a397 : $20, $52, $a9
	rts                                                  ; $a39a : $60


	lda $7fcd91.l                                                  ; $a39b : $af, $91, $cd, $7f
	cmp #$04.b                                                  ; $a39f : $c9, $04
	bne br_3c_a3b3                                                  ; $a3a1 : $d0, $10

	lda #$32.b                                                  ; $a3a3 : $a9, $32
	jsr Func_1_802b.l                                                  ; $a3a5 : $22, $2b, $80, $01
	lda #$03.b                                                  ; $a3a9 : $a9, $03
	jsr SetupEntitysAnimation.l                                                  ; $a3ab : $22, $67, $b9, $04
	lda #$0c.b                                                  ; $a3af : $a9, $0c
	sta $35                                                  ; $a3b1 : $85, $35

br_3c_a3b3:
	rts                                                  ; $a3b3 : $60


	lda $0f                                                  ; $a3b4 : $a5, $0f
	bpl br_3c_a3c6                                                  ; $a3b6 : $10, $0e

	lda #$00.b                                                  ; $a3b8 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $a3ba : $22, $67, $b9, $04
	lda #$01.b                                                  ; $a3be : $a9, $01
	sta $39                                                  ; $a3c0 : $85, $39
	stz $03                                                  ; $a3c2 : $64, $03
	stz $35                                                  ; $a3c4 : $64, $35

br_3c_a3c6:
	jsr AnimateEntity.l                                                  ; $a3c6 : $22, $4a, $b9, $04
	rts                                                  ; $a3ca : $60


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a3cb : $22, $f3, $d7, $02
	jsr Call_3c_a721.w                                                  ; $a3cf : $20, $21, $a7
	bne br_3c_a3ec                                                  ; $a3d2 : $d0, $18

	rep #ACCU_8                                                  ; $a3d4 : $c2, $20
	stz $1a                                                  ; $a3d6 : $64, $1a
	sep #ACCU_8                                                  ; $a3d8 : $e2, $20
	lda #$01.b                                                  ; $a3da : $a9, $01
	jsr SetupEntitysAnimation.l                                                  ; $a3dc : $22, $67, $b9, $04
	lda #$30.b                                                  ; $a3e0 : $a9, $30
	jsr Func_1_802b.l                                                  ; $a3e2 : $22, $2b, $80, $01
	lda #$08.b                                                  ; $a3e6 : $a9, $08
	sta $03                                                  ; $a3e8 : $85, $03
	stz $35                                                  ; $a3ea : $64, $35

br_3c_a3ec:
	rts                                                  ; $a3ec : $60


	rep #IDX_8                                                  ; $a3ed : $c2, $10
	ldx $3e                                                  ; $a3ef : $a6, $3e
	lda $0000.w, X                                                  ; $a3f1 : $bd, $00, $00
	beq br_3c_a404                                                  ; $a3f4 : $f0, $0e

	lda $003b.w, X                                                  ; $a3f6 : $bd, $3b, $00
	cmp #$02.b                                                  ; $a3f9 : $c9, $02
	bne br_3c_a40b                                                  ; $a3fb : $d0, $0e

	lda $0003.w, X                                                  ; $a3fd : $bd, $03, $00
	cmp #$04.b                                                  ; $a400 : $c9, $04
	bne br_3c_a40b                                                  ; $a402 : $d0, $07

br_3c_a404:
	sep #IDX_8                                                  ; $a404 : $e2, $10
	jsr todo_DisablesEntity_d928.l                                                  ; $a406 : $22, $28, $d9, $02
	rts                                                  ; $a40a : $60


br_3c_a40b:
	lda $0011.w, X                                                  ; $a40b : $bd, $11, $00
	ora #$30.b                                                  ; $a40e : $09, $30
	sta $11                                                  ; $a410 : $85, $11
	sep #IDX_8                                                  ; $a412 : $e2, $10
	ldx $03                                                  ; $a414 : $a6, $03
	jsr ($a41a.w, X)                                                  ; $a416 : $fc, $1a, $a4
	rts                                                  ; $a419 : $60


	asl $4da4.w, X                                                  ; $a41a : $1e, $a4, $4d
	ldy $af                                                  ; $a41d : $a4, $af
	sta ($cd), Y                                                  ; $a41f : $91, $cd
	adc $f001c9.l, X                                                  ; $a421 : $7f, $c9, $01, $f0
	asl $c9, X                                                  ; $a425 : $16, $c9
	ora $f0, S                                                  ; $a427 : $03, $f0
	ora ($a0)                                                  ; $a429 : $12, $a0
	.db $00                                                  ; $a42b : $00
	jsr Call_3c_a805.w                                                  ; $a42c : $20, $05, $a8
	ldy #$00.b                                                  ; $a42f : $a0, $00
	jsr Call_3c_a81a.w                                                  ; $a431 : $20, $1a, $a8
	jsr Call_3c_a82f.w                                                  ; $a434 : $20, $2f, $a8
	jsr AnimateEntity.l                                                  ; $a437 : $22, $4a, $b9, $04
	rts                                                  ; $a43b : $60


	lda #$06.b                                                  ; $a43c : $a9, $06
	jsr SetupEntitysAnimation.l                                                  ; $a43e : $22, $67, $b9, $04
	lda #$30.b                                                  ; $a442 : $a9, $30
	jsr Func_1_802b.l                                                  ; $a444 : $22, $2b, $80, $01
	lda #$02.b                                                  ; $a448 : $a9, $02
	sta $03                                                  ; $a44a : $85, $03
	rts                                                  ; $a44c : $60


	ldx $35                                                  ; $a44d : $a6, $35
	jsr ($a457.w, X)                                                  ; $a44f : $fc, $57, $a4
	jsr AnimateEntity.l                                                  ; $a452 : $22, $4a, $b9, $04
	rts                                                  ; $a456 : $60


	eor $7aa4.w, X                                                  ; $a457 : $5d, $a4, $7a
	ldy $93                                                  ; $a45a : $a4, $93
	ldy $a5                                                  ; $a45c : $a4, $a5
	ora $3018f0.l                                                  ; $a45e : $0f, $f0, $18, $30
	tsb $00a0.w                                                  ; $a462 : $0c, $a0, $00
	jsr Call_3c_a8e1.w                                                  ; $a465 : $20, $e1, $a8
	lda #$34.b                                                  ; $a468 : $a9, $34
	jsr Func_1_802b.l                                                  ; $a46a : $22, $2b, $80, $01
	rts                                                  ; $a46e : $60


	lda #$02.b                                                  ; $a46f : $a9, $02
	sta $35                                                  ; $a471 : $85, $35
	lda #$07.b                                                  ; $a473 : $a9, $07
	jsr SetupEntitysAnimation.l                                                  ; $a475 : $22, $67, $b9, $04
	rts                                                  ; $a479 : $60


	lda $7fcd91.l                                                  ; $a47a : $af, $91, $cd, $7f
	cmp #$02.b                                                  ; $a47e : $c9, $02
	bne br_3c_a492                                                  ; $a480 : $d0, $10

	lda #$32.b                                                  ; $a482 : $a9, $32
	jsr Func_1_802b.l                                                  ; $a484 : $22, $2b, $80, $01
	lda #$04.b                                                  ; $a488 : $a9, $04
	sta $35                                                  ; $a48a : $85, $35
	lda #$08.b                                                  ; $a48c : $a9, $08
	jsr SetupEntitysAnimation.l                                                  ; $a48e : $22, $67, $b9, $04

br_3c_a492:
	rts                                                  ; $a492 : $60


	lda $0f                                                  ; $a493 : $a5, $0f
	beq br_3c_a4af                                                  ; $a495 : $f0, $18

	lda #$05.b                                                  ; $a497 : $a9, $05
	jsr SetupEntitysAnimation.l                                                  ; $a499 : $22, $67, $b9, $04
	lda $7fcd91.l                                                  ; $a49d : $af, $91, $cd, $7f
	cmp #$05.b                                                  ; $a4a1 : $c9, $05
	bne br_3c_a4af                                                  ; $a4a3 : $d0, $0a

	lda #$00.b                                                  ; $a4a5 : $a9, $00
	sta $7fcd91.l                                                  ; $a4a7 : $8f, $91, $cd, $7f
	stz $03                                                  ; $a4ab : $64, $03
	stz $35                                                  ; $a4ad : $64, $35

br_3c_a4af:
	rts                                                  ; $a4af : $60


	rep #IDX_8                                                  ; $a4b0 : $c2, $10
	ldx $3e                                                  ; $a4b2 : $a6, $3e
	lda $0000.w, X                                                  ; $a4b4 : $bd, $00, $00
	beq br_3c_a4ce                                                  ; $a4b7 : $f0, $15

	lda $0001.w, X                                                  ; $a4b9 : $bd, $01, $00
	cmp #$04.b                                                  ; $a4bc : $c9, $04
	bne br_3c_a4d7                                                  ; $a4be : $d0, $17

	lda $003b.w, X                                                  ; $a4c0 : $bd, $3b, $00
	cmp #$02.b                                                  ; $a4c3 : $c9, $02
	bne br_3c_a4d4                                                  ; $a4c5 : $d0, $0d

	lda $0003.w, X                                                  ; $a4c7 : $bd, $03, $00
	cmp #$04.b                                                  ; $a4ca : $c9, $04
	bne br_3c_a4d4                                                  ; $a4cc : $d0, $06

br_3c_a4ce:
	sep #IDX_8                                                  ; $a4ce : $e2, $10
	jsr todo_DisablesEntity_d928.l                                                  ; $a4d0 : $22, $28, $d9, $02

br_3c_a4d4:
	sep #IDX_8                                                  ; $a4d4 : $e2, $10
	rts                                                  ; $a4d6 : $60


br_3c_a4d7:
	sep #IDX_8                                                  ; $a4d7 : $e2, $10
	lda #$80.b                                                  ; $a4d9 : $a9, $80
	sta $2c                                                  ; $a4db : $85, $2c
	jsr Func_4_bfae.l                                                  ; $a4dd : $22, $ae, $bf, $04
	ldx $03                                                  ; $a4e1 : $a6, $03
	jsr ($a522.w, X)                                                  ; $a4e3 : $fc, $22, $a5
	jsr Call_3c_a86d.w                                                  ; $a4e6 : $20, $6d, $a8
	lda $2c                                                  ; $a4e9 : $a5, $2c
	bit #$01.b                                                  ; $a4eb : $89, $01
	beq br_3c_a4f3                                                  ; $a4ed : $f0, $04

	jsr $04c07f.l                                                  ; $a4ef : $22, $7f, $c0, $04

br_3c_a4f3:
	rep #ACCU_8                                                  ; $a4f3 : $c2, $20
	lda #$c48c.w                                                  ; $a4f5 : $a9, $8c, $c4
	sta $20                                                  ; $a4f8 : $85, $20
	sep #ACCU_8                                                  ; $a4fa : $e2, $20
	jsr Func_4_cb31.l                                                  ; $a4fc : $22, $31, $cb, $04
	jsr Func_4_cb74.l                                                  ; $a500 : $22, $74, $cb, $04
	rep #ACCU_8                                                  ; $a504 : $c2, $20
	lda #$c4a0.w                                                  ; $a506 : $a9, $a0, $c4
	sta $20                                                  ; $a509 : $85, $20
	sep #ACCU_8                                                  ; $a50b : $e2, $20
	jsr Func_4_cb31.l                                                  ; $a50d : $22, $31, $cb, $04
	jsr Func_4_cb74.l                                                  ; $a511 : $22, $74, $cb, $04
	rep #ACCU_8                                                  ; $a515 : $c2, $20
	lda #$c496.w                                                  ; $a517 : $a9, $96, $c4
	sta $20                                                  ; $a51a : $85, $20
	sep #ACCU_8                                                  ; $a51c : $e2, $20
	jsr Call_3c_a8aa.w                                                  ; $a51e : $20, $aa, $a8
	rts                                                  ; $a521 : $60


	rol $50a5.w                                                  ; $a522 : $2e, $a5, $50
	lda $62                                                  ; $a525 : $a5, $62
	lda $7f                                                  ; $a527 : $a5, $7f
	lda $94                                                  ; $a529 : $a5, $94
	lda $ab                                                  ; $a52b : $a5, $ab
	lda $a0                                                  ; $a52d : $a5, $a0
	tsb $20                                                  ; $a52f : $04, $20
	ora wJoy1CurrButtonsHeld                                                  ; $a531 : $05, $a8
	lda $7fcd91.l                                                  ; $a533 : $af, $91, $cd, $7f
	cmp #$03.b                                                  ; $a537 : $c9, $03
	bne br_3c_a545                                                  ; $a539 : $d0, $0a

	lda #$02.b                                                  ; $a53b : $a9, $02
	sta $03                                                  ; $a53d : $85, $03
	lda #$60.b                                                  ; $a53f : $a9, $60
	sta $39                                                  ; $a541 : $85, $39
	bra br_3c_a54f                                                  ; $a543 : $80, $0a

br_3c_a545:
	cmp #$02.b                                                  ; $a545 : $c9, $02
	bne br_3c_a54f                                                  ; $a547 : $d0, $06

	lda #$05.b                                                  ; $a549 : $a9, $05
	sta $7fcd91.l                                                  ; $a54b : $8f, $91, $cd, $7f

br_3c_a54f:
	rts                                                  ; $a54f : $60


	dec $39                                                  ; $a550 : $c6, $39
	bne br_3c_a561                                                  ; $a552 : $d0, $0d

	rep #ACCU_8                                                  ; $a554 : $c2, $20
	lda #$fd00.w                                                  ; $a556 : $a9, $00, $fd
	sta $1a                                                  ; $a559 : $85, $1a
	sep #ACCU_8                                                  ; $a55b : $e2, $20
	lda #$04.b                                                  ; $a55d : $a9, $04
	sta $03                                                  ; $a55f : $85, $03

br_3c_a561:
	rts                                                  ; $a561 : $60


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a562 : $22, $f3, $d7, $02
	jsr $04c0f7.l                                                  ; $a566 : $22, $f7, $c0, $04
	lda $2b                                                  ; $a56a : $a5, $2b
	bit #$02.b                                                  ; $a56c : $89, $02
	beq br_3c_a57e                                                  ; $a56e : $f0, $0e

	lda #$78.b                                                  ; $a570 : $a9, $78
	sta $39                                                  ; $a572 : $85, $39
	lda #$3c.b                                                  ; $a574 : $a9, $3c
	jsr Func_4_d577.l                                                  ; $a576 : $22, $77, $d5, $04
	lda #$06.b                                                  ; $a57a : $a9, $06
	sta $03                                                  ; $a57c : $85, $03

br_3c_a57e:
	rts                                                  ; $a57e : $60


	dec $39                                                  ; $a57f : $c6, $39
	bne br_3c_a593                                                  ; $a581 : $d0, $10

	rep #ACCU_8                                                  ; $a583 : $c2, $20
	lda $1a                                                  ; $a585 : $a5, $1a
	eor #$ffff.w                                                  ; $a587 : $49, $ff, $ff
	ina                                                  ; $a58a : $1a
	sta $1a                                                  ; $a58b : $85, $1a
	sep #ACCU_8                                                  ; $a58d : $e2, $20
	lda #$08.b                                                  ; $a58f : $a9, $08
	sta $03                                                  ; $a591 : $85, $03

br_3c_a593:
	rts                                                  ; $a593 : $60


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a594 : $22, $f3, $d7, $02
	jsr Call_3c_a721.w                                                  ; $a598 : $20, $21, $a7
	bne br_3c_a5aa                                                  ; $a59b : $d0, $0d

	rep #ACCU_8                                                  ; $a59d : $c2, $20
	lda #$fe80.w                                                  ; $a59f : $a9, $80, $fe
	sta $1a                                                  ; $a5a2 : $85, $1a
	sep #ACCU_8                                                  ; $a5a4 : $e2, $20
	lda #$0a.b                                                  ; $a5a6 : $a9, $0a
	sta $03                                                  ; $a5a8 : $85, $03

br_3c_a5aa:
	rts                                                  ; $a5aa : $60


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $a5ab : $22, $f3, $d7, $02
	jsr Call_3c_a70e.w                                                  ; $a5af : $20, $0e, $a7
	bne br_3c_a5bc                                                  ; $a5b2 : $d0, $08

	stz $03                                                  ; $a5b4 : $64, $03
	lda #$05.b                                                  ; $a5b6 : $a9, $05
	sta $7fcd91.l                                                  ; $a5b8 : $8f, $91, $cd, $7f

br_3c_a5bc:
	rts                                                  ; $a5bc : $60


	jsr Call_3c_a9db.w                                                  ; $a5bd : $20, $db, $a9
	stz $1e70.w                                                  ; $a5c0 : $9c, $70, $1e
	lda #$10.b                                                  ; $a5c3 : $a9, $10
	sta $1e71.w                                                  ; $a5c5 : $8d, $71, $1e
	ldx $3b                                                  ; $a5c8 : $a6, $3b
	jsr ($a5ce.w, X)                                                  ; $a5ca : $fc, $ce, $a5
	rts                                                  ; $a5cd : $60


	pei ($a5)                                                  ; $a5ce : $d4, $a5
	sbc $a66fa5.l, X                                                  ; $a5d0 : $ff, $a5, $6f, $a6
	lda #$01.b                                                  ; $a5d4 : $a9, $01
	sta $0a08.w                                                  ; $a5d6 : $8d, $08, $0a
	stz $00cb.w                                                  ; $a5d9 : $9c, $cb, $00
	stz $00cc.w                                                  ; $a5dc : $9c, $cc, $00
	stz $00cd.w                                                  ; $a5df : $9c, $cd, $00
	lda $3c                                                  ; $a5e2 : $a5, $3c
	beq br_3c_a5ea                                                  ; $a5e4 : $f0, $04

	jsr $04d1ef.l                                                  ; $a5e6 : $22, $ef, $d1, $04

br_3c_a5ea:
	lda #$02.b                                                  ; $a5ea : $a9, $02
	sta $3b                                                  ; $a5ec : $85, $3b
	lda #$01.b                                                  ; $a5ee : $a9, $01
	sta $0b                                                  ; $a5f0 : $85, $0b
	lda #$1e.b                                                  ; $a5f2 : $a9, $1e
	sta $39                                                  ; $a5f4 : $85, $39
	lda $38                                                  ; $a5f6 : $a5, $38
	tsb $11                                                  ; $a5f8 : $04, $11

br_3c_a5fa:
	jsr Func_2_d636.l                                                  ; $a5fa : $22, $36, $d6, $02
	rts                                                  ; $a5fe : $60


	lda $39                                                  ; $a5ff : $a5, $39
	beq br_3c_a607                                                  ; $a601 : $f0, $04

	dec $39                                                  ; $a603 : $c6, $39
	bra br_3c_a5fa                                                  ; $a605 : $80, $f3

br_3c_a607:
	jsr $3fe1c9.l                                                  ; $a607 : $22, $c9, $e1, $3f
	lda $03                                                  ; $a60b : $a5, $03
	cmp #$04.b                                                  ; $a60d : $c9, $04
	bne br_3c_a624                                                  ; $a60f : $d0, $13

	lda #$02.b                                                  ; $a611 : $a9, $02
	trb wMainScreenDesignation.w                                                  ; $a613 : $1c, $c1, $00
	jsr Call_3c_a9ca.w                                                  ; $a616 : $20, $ca, $a9
	ldx #$20.b                                                  ; $a619 : $a2, $20

br_3c_a61b:
	lda #$01.b                                                  ; $a61b : $a9, $01
	sta $7fcda0.l, X                                                  ; $a61d : $9f, $a0, $cd, $7f
	dex                                                  ; $a621 : $ca
	bpl br_3c_a61b                                                  ; $a622 : $10, $f7

br_3c_a624:
	lda $34                                                  ; $a624 : $a5, $34
	bmi br_3c_a629                                                  ; $a626 : $30, $01

	rts                                                  ; $a628 : $60


br_3c_a629:
	lda #$04.b                                                  ; $a629 : $a9, $04
	sta $3b                                                  ; $a62b : $85, $3b
	lda #$01.b                                                  ; $a62d : $a9, $01
	jsr $04d5e5.l                                                  ; $a62f : $22, $e5, $d5, $04
	lda #$1f.b                                                  ; $a633 : $a9, $1f
	jsr Func_0_84bc.l                                                  ; $a635 : $22, $bc, $84, $00
	jsr $04d1ef.l                                                  ; $a639 : $22, $ef, $d1, $04
	stz $0b                                                  ; $a63d : $64, $0b
	rep #ACCU_8                                                  ; $a63f : $c2, $20
	lda $7fcd92.l                                                  ; $a641 : $af, $92, $cd, $7f
	sta $1e6e.w                                                  ; $a645 : $8d, $6e, $1e
	lda $7fcd94.l                                                  ; $a648 : $af, $94, $cd, $7f
	sta $1e70.w                                                  ; $a64c : $8d, $70, $1e
	sep #ACCU_8                                                  ; $a64f : $e2, $20
	stz $0a08.w                                                  ; $a651 : $9c, $08, $0a
	rep #IDX_8                                                  ; $a654 : $c2, $10
	ldx #$00a0.w                                                  ; $a656 : $a2, $a0, $00
	ldy #$001c.w                                                  ; $a659 : $a0, $1c, $00
	jsr LoadPalettesFromGivenSpecToColourX.l                                                  ; $a65c : $22, $4a, $80, $01
	sep #IDX_8                                                  ; $a660 : $e2, $10
	lda #$81.b                                                  ; $a662 : $a9, $81
	trb $1f5f.w                                                  ; $a664 : $1c, $5f, $1f
	stz $1f2c.w                                                  ; $a667 : $9c, $2c, $1f
	lda #$02.b                                                  ; $a66a : $a9, $02
	tsb wMainScreenDesignation.w                                                  ; $a66c : $0c, $c1, $00
	jsr todo_DisablesEntity_d928.l                                                  ; $a66f : $22, $28, $d9, $02
	rts                                                  ; $a673 : $60


	rep #IDX_8                                                  ; $a674 : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $a676 : $22, $a7, $d8, $02
	bne br_3c_a691                                                  ; $a67a : $d0, $15

	inc $0000.w, X                                                  ; $a67c : $fe, $00, $00
	lda #$30.b                                                  ; $a67f : $a9, $30
	sta $000a.w, X                                                  ; $a681 : $9d, $0a, $00
	stz $0001.w, X                                                  ; $a684 : $9e, $01, $00
	tya                                                  ; $a687 : $98
	sta $0002.w, X                                                  ; $a688 : $9d, $02, $00
	rep #ACCU_8                                                  ; $a68b : $c2, $20
	tdc                                                  ; $a68d : $7b
	sta $003e.w, X                                                  ; $a68e : $9d, $3e, $00

br_3c_a691:
	sep #ACCU_8|IDX_8                                                  ; $a691 : $e2, $30
	rts                                                  ; $a693 : $60


Call_3c_a694:
	ldx #$0a.b                                                  ; $a694 : $a2, $0a
	stz $0006.w                                                  ; $a696 : $9c, $06, $00
	jsr Func_4_be35.l                                                  ; $a699 : $22, $35, $be, $04
	and #$03.b                                                  ; $a69d : $29, $03
	beq br_3c_a6b1                                                  ; $a69f : $f0, $10

	cmp #$01.b                                                  ; $a6a1 : $c9, $01
	beq br_3c_a6ac                                                  ; $a6a3 : $f0, $07

	lda #$0a.b                                                  ; $a6a5 : $a9, $0a
	sta $0006.w                                                  ; $a6a7 : $8d, $06, $00
	bra br_3c_a6b1                                                  ; $a6aa : $80, $05

br_3c_a6ac:
	lda #$14.b                                                  ; $a6ac : $a9, $14
	sta $0006.w                                                  ; $a6ae : $8d, $06, $00

br_3c_a6b1:
	rep #ACCU_8                                                  ; $a6b1 : $c2, $20
	phx                                                  ; $a6b3 : $da
	txa                                                  ; $a6b4 : $8a
	clc                                                  ; $a6b5 : $18
	adc $0006.w                                                  ; $a6b6 : $6d, $06, $00
	tax                                                  ; $a6b9 : $aa
	lda wNewStageScrollX.w                                                  ; $a6ba : $ad, $5d, $1e
	clc                                                  ; $a6bd : $18
	adc #$00f8.w                                                  ; $a6be : $69, $f8, $00
	sec                                                  ; $a6c1 : $38
	sbc $c4fa.w, X                                                  ; $a6c2 : $fd, $fa, $c4
	sta $0000.w                                                  ; $a6c5 : $8d, $00, $00
	lda wNewStageScrollY.w                                                  ; $a6c8 : $ad, $60, $1e
	clc                                                  ; $a6cb : $18
	adc $c4dc.w, X                                                  ; $a6cc : $7d, $dc, $c4
	sta $0002.w                                                  ; $a6cf : $8d, $02, $00
	lda #$0508.w                                                  ; $a6d2 : $a9, $08, $05
	sta $0004.w                                                  ; $a6d5 : $8d, $04, $00
	sep #ACCU_8                                                  ; $a6d8 : $e2, $20
	jsr $04d6ae.l                                                  ; $a6da : $22, $ae, $d6, $04
	plx                                                  ; $a6de : $fa
	dex                                                  ; $a6df : $ca
	dex                                                  ; $a6e0 : $ca
	bpl br_3c_a6b1                                                  ; $a6e1 : $10, $ce

	rts                                                  ; $a6e3 : $60


Call_3c_a6e4:
	rep #ACCU_8                                                  ; $a6e4 : $c2, $20
	lda $05                                                  ; $a6e6 : $a5, $05
	sec                                                  ; $a6e8 : $38
	sbc wNewStageScrollX.w                                                  ; $a6e9 : $ed, $5d, $1e
	cmp #$0090.w                                                  ; $a6ec : $c9, $90, $00
	sep #ACCU_8                                                  ; $a6ef : $e2, $20
	bcs br_3c_a6f6                                                  ; $a6f1 : $b0, $03

	lda #$00.b                                                  ; $a6f3 : $a9, $00
	rts                                                  ; $a6f5 : $60


br_3c_a6f6:
	lda #$01.b                                                  ; $a6f6 : $a9, $01
	rts                                                  ; $a6f8 : $60


Call_3c_a6f9:
	rep #ACCU_8                                                  ; $a6f9 : $c2, $20
	lda $05                                                  ; $a6fb : $a5, $05
	sec                                                  ; $a6fd : $38
	sbc wNewStageScrollX.w                                                  ; $a6fe : $ed, $5d, $1e
	cmp #$0090.w                                                  ; $a701 : $c9, $90, $00
	sep #ACCU_8                                                  ; $a704 : $e2, $20
	bcc br_3c_a70b                                                  ; $a706 : $90, $03

	lda #$00.b                                                  ; $a708 : $a9, $00
	rts                                                  ; $a70a : $60


br_3c_a70b:
	lda #$01.b                                                  ; $a70b : $a9, $01
	rts                                                  ; $a70d : $60


Call_3c_a70e:
	rep #ACCU_8|IDX_8                                                  ; $a70e : $c2, $30
	ldx $3e                                                  ; $a710 : $a6, $3e
	lda $0005.w, X                                                  ; $a712 : $bd, $05, $00
	cmp $05                                                  ; $a715 : $c5, $05
	sep #ACCU_8|IDX_8                                                  ; $a717 : $e2, $30
	bpl br_3c_a71e                                                  ; $a719 : $10, $03

	lda #$01.b                                                  ; $a71b : $a9, $01
	rts                                                  ; $a71d : $60


br_3c_a71e:
	lda #$00.b                                                  ; $a71e : $a9, $00
	rts                                                  ; $a720 : $60


Call_3c_a721:
	rep #ACCU_8                                                  ; $a721 : $c2, $20
	lda $05                                                  ; $a723 : $a5, $05
	cmp #$10d0.w                                                  ; $a725 : $c9, $d0, $10
	sep #ACCU_8                                                  ; $a728 : $e2, $20
	bpl br_3c_a72f                                                  ; $a72a : $10, $03

	lda #$01.b                                                  ; $a72c : $a9, $01
	rts                                                  ; $a72e : $60


br_3c_a72f:
	rep #ACCU_8                                                  ; $a72f : $c2, $20
	lda #$10d0.w                                                  ; $a731 : $a9, $d0, $10
	sta $05                                                  ; $a734 : $85, $05
	sep #ACCU_8                                                  ; $a736 : $e2, $20
	lda #$00.b                                                  ; $a738 : $a9, $00
	rts                                                  ; $a73a : $60


Call_3c_a73b:
	pha                                                  ; $a73b : $48
	asl                                                  ; $a73c : $0a
	tay                                                  ; $a73d : $a8
	rep #ACCU_8                                                  ; $a73e : $c2, $20
	lda wNewStageScrollX.w                                                  ; $a740 : $ad, $5d, $1e
	clc                                                  ; $a743 : $18
	adc #$00f8.w                                                  ; $a744 : $69, $f8, $00
	sta $002c.w                                                  ; $a747 : $8d, $2c, $00
	lda wNewStageScrollY.w                                                  ; $a74a : $ad, $60, $1e
	clc                                                  ; $a74d : $18
	adc $c4aa.w, Y                                                  ; $a74e : $79, $aa, $c4
	sta $002e.w                                                  ; $a751 : $8d, $2e, $00
	and #$00ff.w                                                  ; $a754 : $29, $ff, $00
	sep #ACCU_8                                                  ; $a757 : $e2, $20
	pla                                                  ; $a759 : $68
	tay                                                  ; $a75a : $a8
	lda $c4b6.w, Y                                                  ; $a75b : $b9, $b6, $c4
	jsr $02c411.l                                                  ; $a75e : $22, $11, $c4, $02
	rts                                                  ; $a762 : $60


Call_3c_a763:
	rep #ACCU_8                                                  ; $a763 : $c2, $20
	lda #$0b60.w                                                  ; $a765 : $a9, $60, $0b
	sta $002c.w                                                  ; $a768 : $8d, $2c, $00
	lda #$01b0.w                                                  ; $a76b : $a9, $b0, $01
	sta $002e.w                                                  ; $a76e : $8d, $2e, $00
	and #$00ff.w                                                  ; $a771 : $29, $ff, $00
	sep #ACCU_8                                                  ; $a774 : $e2, $20
	ldy $36                                                  ; $a776 : $a4, $36
	lda $c4cc.w, Y                                                  ; $a778 : $b9, $cc, $c4
	jsr $02c411.l                                                  ; $a77b : $22, $11, $c4, $02
	rts                                                  ; $a77f : $60


Call_3c_a780:
	rep #ACCU_8                                                  ; $a780 : $c2, $20
	lda $05                                                  ; $a782 : $a5, $05
	cmp wPlayerEntity.x.w                                                  ; $a784 : $cd, $dd, $09
	sep #ACCU_8                                                  ; $a787 : $e2, $20
	bmi br_3c_a7e3                                                  ; $a789 : $30, $58

	ldy #$36.b                                                  ; $a78b : $a0, $36
	jsr $02dab8.l                                                  ; $a78d : $22, $b8, $da, $02
	bcs br_3c_a7ca                                                  ; $a791 : $b0, $37

	ldy #$60.b                                                  ; $a793 : $a0, $60
	jsr $02da99.l                                                  ; $a795 : $22, $99, $da, $02
	bcc br_3c_a79d                                                  ; $a799 : $90, $02

	bra br_3c_a7b4                                                  ; $a79b : $80, $17

br_3c_a79d:
	rep #ACCU_8                                                  ; $a79d : $c2, $20
	stz $1a                                                  ; $a79f : $64, $1a
	sep #ACCU_8                                                  ; $a7a1 : $e2, $20
	lda #$01.b                                                  ; $a7a3 : $a9, $01
	sta $7fcd91.l                                                  ; $a7a5 : $8f, $91, $cd, $7f
	lda #$00.b                                                  ; $a7a9 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $a7ab : $22, $67, $b9, $04
	lda #$06.b                                                  ; $a7af : $a9, $06
	sta $03                                                  ; $a7b1 : $85, $03
	rts                                                  ; $a7b3 : $60


br_3c_a7b4:
	rep #ACCU_8                                                  ; $a7b4 : $c2, $20
	lda #$fd80.w                                                  ; $a7b6 : $a9, $80, $fd
	sta $1a                                                  ; $a7b9 : $85, $1a
	sep #ACCU_8                                                  ; $a7bb : $e2, $20
	lda #$04.b                                                  ; $a7bd : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $a7bf : $22, $67, $b9, $04
	lda #$04.b                                                  ; $a7c3 : $a9, $04
	sta $03                                                  ; $a7c5 : $85, $03
	stz $35                                                  ; $a7c7 : $64, $35
	rts                                                  ; $a7c9 : $60


br_3c_a7ca:
	rep #ACCU_8                                                  ; $a7ca : $c2, $20
	stz $1a                                                  ; $a7cc : $64, $1a
	sep #ACCU_8                                                  ; $a7ce : $e2, $20
	lda #$01.b                                                  ; $a7d0 : $a9, $01
	jsr SetupEntitysAnimation.l                                                  ; $a7d2 : $22, $67, $b9, $04
	lda #$30.b                                                  ; $a7d6 : $a9, $30
	jsr Func_1_802b.l                                                  ; $a7d8 : $22, $2b, $80, $01
	lda #$08.b                                                  ; $a7dc : $a9, $08
	sta $03                                                  ; $a7de : $85, $03
	stz $35                                                  ; $a7e0 : $64, $35
	rts                                                  ; $a7e2 : $60


br_3c_a7e3:
	rep #ACCU_8                                                  ; $a7e3 : $c2, $20
	lda #$0280.w                                                  ; $a7e5 : $a9, $80, $02
	sta $1a                                                  ; $a7e8 : $85, $1a
	sep #ACCU_8                                                  ; $a7ea : $e2, $20
	lda #$04.b                                                  ; $a7ec : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $a7ee : $22, $67, $b9, $04
	lda #$0a.b                                                  ; $a7f2 : $a9, $0a
	sta $03                                                  ; $a7f4 : $85, $03
	stz $35                                                  ; $a7f6 : $64, $35
	rts                                                  ; $a7f8 : $60


Call_3c_a7f9:
	lda $05                                                  ; $a7f9 : $a5, $05
	cmp #$d4.b                                                  ; $a7fb : $c9, $d4
	bcs br_3c_a802                                                  ; $a7fd : $b0, $03

	lda #$00.b                                                  ; $a7ff : $a9, $00
	rts                                                  ; $a801 : $60


br_3c_a802:
	lda #$01.b                                                  ; $a802 : $a9, $01
	rts                                                  ; $a804 : $60


Call_3c_a805:
	rep #ACCU_8|IDX_8                                                  ; $a805 : $c2, $30
	tya                                                  ; $a807 : $98
	and #$00ff.w                                                  ; $a808 : $29, $ff, $00
	tay                                                  ; $a80b : $a8
	ldx $3e                                                  ; $a80c : $a6, $3e
	lda $0005.w, X                                                  ; $a80e : $bd, $05, $00
	clc                                                  ; $a811 : $18
	adc $c4bc.w, Y                                                  ; $a812 : $79, $bc, $c4
	sta $05                                                  ; $a815 : $85, $05
	sep #ACCU_8|IDX_8                                                  ; $a817 : $e2, $30
	rts                                                  ; $a819 : $60


Call_3c_a81a:
	rep #ACCU_8|IDX_8                                                  ; $a81a : $c2, $30
	tya                                                  ; $a81c : $98
	and #$00ff.w                                                  ; $a81d : $29, $ff, $00
	tay                                                  ; $a820 : $a8
	ldx $3e                                                  ; $a821 : $a6, $3e
	lda $0008.w, X                                                  ; $a823 : $bd, $08, $00
	clc                                                  ; $a826 : $18
	adc $c4be.w, Y                                                  ; $a827 : $79, $be, $c4
	sta $08                                                  ; $a82a : $85, $08
	sep #ACCU_8|IDX_8                                                  ; $a82c : $e2, $30
	rts                                                  ; $a82e : $60


Call_3c_a82f:
	rep #IDX_8                                                  ; $a82f : $c2, $10
	ldx $3e                                                  ; $a831 : $a6, $3e
	lda $003b.w, X                                                  ; $a833 : $bd, $3b, $00
	bne br_3c_a86a                                                  ; $a836 : $d0, $32

	lda $0001.w, X                                                  ; $a838 : $bd, $01, $00
	beq br_3c_a86a                                                  ; $a83b : $f0, $2d

	lda $0003.w, X                                                  ; $a83d : $bd, $03, $00
	cmp #$02.b                                                  ; $a840 : $c9, $02
	beq br_3c_a850                                                  ; $a842 : $f0, $0c

	cmp #$04.b                                                  ; $a844 : $c9, $04
	beq br_3c_a850                                                  ; $a846 : $f0, $08

	cmp $34                                                  ; $a848 : $c5, $34
	beq br_3c_a86a                                                  ; $a84a : $f0, $1e

	lda #$05.b                                                  ; $a84c : $a9, $05
	bra br_3c_a85d                                                  ; $a84e : $80, $0d

br_3c_a850:
	lda #$b4.b                                                  ; $a850 : $a9, $b4
	sta $39                                                  ; $a852 : $85, $39
	lda $0003.w, X                                                  ; $a854 : $bd, $03, $00
	cmp $34                                                  ; $a857 : $c5, $34
	beq br_3c_a86a                                                  ; $a859 : $f0, $0f

	lda #$09.b                                                  ; $a85b : $a9, $09

br_3c_a85d:
	pha                                                  ; $a85d : $48
	lda $0003.w, X                                                  ; $a85e : $bd, $03, $00
	sta $34                                                  ; $a861 : $85, $34
	pla                                                  ; $a863 : $68
	sep #IDX_8                                                  ; $a864 : $e2, $10
	jsr SetupEntitysAnimation.l                                                  ; $a866 : $22, $67, $b9, $04

br_3c_a86a:
	sep #IDX_8                                                  ; $a86a : $e2, $10
	rts                                                  ; $a86c : $60


Call_3c_a86d:
	rep #ACCU_8                                                  ; $a86d : $c2, $20
	lda $05                                                  ; $a86f : $a5, $05
	sec                                                  ; $a871 : $38
	sbc $22                                                  ; $a872 : $e5, $22
	sta $0000.w                                                  ; $a874 : $8d, $00, $00
	lda $1ea2.w                                                  ; $a877 : $ad, $a2, $1e
	sec                                                  ; $a87a : $38
	sbc $0000.w                                                  ; $a87b : $ed, $00, $00
	sta $1ea2.w                                                  ; $a87e : $8d, $a2, $1e
	sep #ACCU_8                                                  ; $a881 : $e2, $20
	rts                                                  ; $a883 : $60


Call_3c_a884:
	lda $3c                                                  ; $a884 : $a5, $3c
	beq br_3c_a894                                                  ; $a886 : $f0, $0c

	lda $1e89.w                                                  ; $a888 : $ad, $89, $1e
	bne br_3c_a8a9                                                  ; $a88b : $d0, $1c

	stz $3c                                                  ; $a88d : $64, $3c
	jsr $04d1ef.l                                                  ; $a88f : $22, $ef, $d1, $04
	rts                                                  ; $a893 : $60


br_3c_a894:
	lda $1e89.w                                                  ; $a894 : $ad, $89, $1e
	beq br_3c_a8a9                                                  ; $a897 : $f0, $10

	lda $09da.w                                                  ; $a899 : $ad, $da, $09
	cmp #$12.b                                                  ; $a89c : $c9, $12
	bne br_3c_a8a9                                                  ; $a89e : $d0, $09

	lda #$01.b                                                  ; $a8a0 : $a9, $01
	sta $3c                                                  ; $a8a2 : $85, $3c
	jsr todo_CausePlayerToFreeze.l                                                  ; $a8a4 : $22, $ca, $d1, $04
	rts                                                  ; $a8a8 : $60


br_3c_a8a9:
	rts                                                  ; $a8a9 : $60


Call_3c_a8aa:
	rep #ACCU_8                                                  ; $a8aa : $c2, $20
	lda $05                                                  ; $a8ac : $a5, $05
	sec                                                  ; $a8ae : $38
	sbc $22                                                  ; $a8af : $e5, $22
	beq br_3c_a8de                                                  ; $a8b1 : $f0, $2b

	bpl br_3c_a8c1                                                  ; $a8b3 : $10, $0c

	sep #ACCU_8                                                  ; $a8b5 : $e2, $20
	lda $36                                                  ; $a8b7 : $a5, $36
	beq br_3c_a8d1                                                  ; $a8b9 : $f0, $16

	cmp #$01.b                                                  ; $a8bb : $c9, $01
	beq br_3c_a8d7                                                  ; $a8bd : $f0, $18

	bra br_3c_a8cd                                                  ; $a8bf : $80, $0c

br_3c_a8c1:
	sep #ACCU_8                                                  ; $a8c1 : $e2, $20
	lda $36                                                  ; $a8c3 : $a5, $36
	beq br_3c_a8d7                                                  ; $a8c5 : $f0, $10

	cmp #$01.b                                                  ; $a8c7 : $c9, $01
	beq br_3c_a8cd                                                  ; $a8c9 : $f0, $02

	bra br_3c_a8d1                                                  ; $a8cb : $80, $04

br_3c_a8cd:
	stz $36                                                  ; $a8cd : $64, $36
	bra br_3c_a8db                                                  ; $a8cf : $80, $0a

br_3c_a8d1:
	lda #$01.b                                                  ; $a8d1 : $a9, $01
	sta $36                                                  ; $a8d3 : $85, $36
	bra br_3c_a8db                                                  ; $a8d5 : $80, $04

br_3c_a8d7:
	lda #$02.b                                                  ; $a8d7 : $a9, $02
	sta $36                                                  ; $a8d9 : $85, $36

br_3c_a8db:
	jsr Call_3c_a763.w                                                  ; $a8db : $20, $63, $a7

br_3c_a8de:
	sep #ACCU_8                                                  ; $a8de : $e2, $20
	rts                                                  ; $a8e0 : $60


Call_3c_a8e1:
	rep #IDX_8                                                  ; $a8e1 : $c2, $10
	jsr $02d8de.l                                                  ; $a8e3 : $22, $de, $d8, $02
	bne br_3c_a937                                                  ; $a8e7 : $d0, $4e

	inc $0000.w, X                                                  ; $a8e9 : $fe, $00, $00
	lda #$2f.b                                                  ; $a8ec : $a9, $2f
	sta $000a.w, X                                                  ; $a8ee : $9d, $0a, $00
	lda $18                                                  ; $a8f1 : $a5, $18
	sta $0018.w, X                                                  ; $a8f3 : $9d, $18, $00
	lda $16                                                  ; $a8f6 : $a5, $16
	sta $0016.w, X                                                  ; $a8f8 : $9d, $16, $00
	lda $38                                                  ; $a8fb : $a5, $38
	and #$0e.b                                                  ; $a8fd : $29, $0e
	ora $11                                                  ; $a8ff : $05, $11
	sta $0011.w, X                                                  ; $a901 : $9d, $11, $00
	tya                                                  ; $a904 : $98
	asl                                                  ; $a905 : $0a
	sta $000b.w, X                                                  ; $a906 : $9d, $0b, $00
	asl                                                  ; $a909 : $0a
	tay                                                  ; $a90a : $a8
	rep #ACCU_8                                                  ; $a90b : $c2, $20
	lda $05                                                  ; $a90d : $a5, $05
	clc                                                  ; $a90f : $18
	adc $c4c4.w, Y                                                  ; $a910 : $79, $c4, $c4
	sta $0005.w, X                                                  ; $a913 : $9d, $05, $00
	lda $08                                                  ; $a916 : $a5, $08
	clc                                                  ; $a918 : $18
	adc $c4c6.w, Y                                                  ; $a919 : $79, $c6, $c4
	sta $0008.w, X                                                  ; $a91c : $9d, $08, $00
	lda $3e                                                  ; $a91f : $a5, $3e
	sta $003e.w, X                                                  ; $a921 : $9d, $3e, $00
	tya                                                  ; $a924 : $98
	bne br_3c_a92e                                                  ; $a925 : $d0, $07

	txa                                                  ; $a927 : $8a
	sta $7fcdc0.l                                                  ; $a928 : $8f, $c0, $cd, $7f
	bra br_3c_a933                                                  ; $a92c : $80, $05

br_3c_a92e:
	txa                                                  ; $a92e : $8a
	sta $7fcdc2.l                                                  ; $a92f : $8f, $c2, $cd, $7f

br_3c_a933:
	sep #ACCU_8|IDX_8                                                  ; $a933 : $e2, $30
	lda #$00.b                                                  ; $a935 : $a9, $00

br_3c_a937:
	sep #IDX_8                                                  ; $a937 : $e2, $10
	rts                                                  ; $a939 : $60


Call_3c_a93a:
	rep #ACCU_8                                                  ; $a93a : $c2, $20
	lda $08                                                  ; $a93c : $a5, $08
	cmp #$0562.w                                                  ; $a93e : $c9, $62, $05
	sep #ACCU_8                                                  ; $a941 : $e2, $20
	bpl br_3c_a951                                                  ; $a943 : $10, $0c

	ldx $36                                                  ; $a945 : $a6, $36
	lda #$02.b                                                  ; $a947 : $a9, $02
	sta $7fcda0.l                                                  ; $a949 : $8f, $a0, $cd, $7f
	sta $7fcda1.l                                                  ; $a94d : $8f, $a1, $cd, $7f

br_3c_a951:
	rts                                                  ; $a951 : $60


Call_3c_a952:
	rep #ACCU_8                                                  ; $a952 : $c2, $20
	lda $08                                                  ; $a954 : $a5, $08
	cmp #$0562.w                                                  ; $a956 : $c9, $62, $05
	sep #ACCU_8                                                  ; $a959 : $e2, $20
	bmi br_3c_a969                                                  ; $a95b : $30, $0c

	ldx $36                                                  ; $a95d : $a6, $36
	lda #$00.b                                                  ; $a95f : $a9, $00
	sta $7fcda0.l                                                  ; $a961 : $8f, $a0, $cd, $7f
	sta $7fcda1.l                                                  ; $a965 : $8f, $a1, $cd, $7f

br_3c_a969:
	rts                                                  ; $a969 : $60


Call_3c_a96a:
	rep #IDX_8                                                  ; $a96a : $c2, $10
	jsr todo_XequFree_1818_EntitySlot.l                                                  ; $a96c : $22, $59, $d8, $02
	bne br_3c_a9c7                                                  ; $a970 : $d0, $55

	inc $0000.w, X                                                  ; $a972 : $fe, $00, $00
	lda #$20.b                                                  ; $a975 : $a9, $20
	sta $000a.w, X                                                  ; $a977 : $9d, $0a, $00
	lda $18                                                  ; $a97a : $a5, $18
	sta $0018.w, X                                                  ; $a97c : $9d, $18, $00
	lda $16                                                  ; $a97f : $a5, $16
	sta $0016.w, X                                                  ; $a981 : $9d, $16, $00
	lda $11                                                  ; $a984 : $a5, $11
	sta $0011.w, X                                                  ; $a986 : $9d, $11, $00
	jsr Func_4_be35.l                                                  ; $a989 : $22, $35, $be, $04
	xba                                                  ; $a98d : $eb
	lda #$00.b                                                  ; $a98e : $a9, $00
	xba                                                  ; $a990 : $eb
	and #$03.b                                                  ; $a991 : $29, $03
	tay                                                  ; $a993 : $a8
	lda $c518.w, Y                                                  ; $a994 : $b9, $18, $c5
	sta $0019.w, X                                                  ; $a997 : $9d, $19, $00
	rep #ACCU_8                                                  ; $a99a : $c2, $20
	jsr Func_4_be35.l                                                  ; $a99c : $22, $35, $be, $04
	and #$01ff.w                                                  ; $a9a0 : $29, $ff, $01
	clc                                                  ; $a9a3 : $18
	adc #$fd00.w                                                  ; $a9a4 : $69, $00, $fd
	sta $001a.w, X                                                  ; $a9a7 : $9d, $1a, $00
	jsr Func_4_be35.l                                                  ; $a9aa : $22, $35, $be, $04
	and #$000e.w                                                  ; $a9ae : $29, $0e, $00
	asl                                                  ; $a9b1 : $0a
	tay                                                  ; $a9b2 : $a8
	lda wNewStageScrollY.w                                                  ; $a9b3 : $ad, $60, $1e
	clc                                                  ; $a9b6 : $18
	adc $c4dc.w, Y                                                  ; $a9b7 : $79, $dc, $c4
	sta $0008.w, X                                                  ; $a9ba : $9d, $08, $00
	lda wNewStageScrollX.w                                                  ; $a9bd : $ad, $5d, $1e
	clc                                                  ; $a9c0 : $18
	adc #$00f0.w                                                  ; $a9c1 : $69, $f0, $00
	sta $0005.w, X                                                  ; $a9c4 : $9d, $05, $00

br_3c_a9c7:
	sep #ACCU_8|IDX_8                                                  ; $a9c7 : $e2, $30
	rts                                                  ; $a9c9 : $60


Call_3c_a9ca:
	rep #ACCU_8                                                  ; $a9ca : $c2, $20
	lda #$fa00.w                                                  ; $a9cc : $a9, $00, $fa
	sta $1ea2.w                                                  ; $a9cf : $8d, $a2, $1e
	lda #$ff80.w                                                  ; $a9d2 : $a9, $80, $ff
	sta $1ea4.w                                                  ; $a9d5 : $8d, $a4, $1e
	sep #ACCU_8                                                  ; $a9d8 : $e2, $20
	rts                                                  ; $a9da : $60


Call_3c_a9db:
	rep #ACCU_8|IDX_8                                                  ; $a9db : $c2, $30
	lda $7fcdc0.l                                                  ; $a9dd : $af, $c0, $cd, $7f
	beq br_3c_a9fa                                                  ; $a9e1 : $f0, $17

	tax                                                  ; $a9e3 : $aa
	sep #ACCU_8                                                  ; $a9e4 : $e2, $20
	lda $11                                                  ; $a9e6 : $a5, $11
	and #$0e.b                                                  ; $a9e8 : $29, $0e
	sta $0000.w                                                  ; $a9ea : $8d, $00, $00
	lda $0011.w, X                                                  ; $a9ed : $bd, $11, $00
	and #$f1.b                                                  ; $a9f0 : $29, $f1
	ora $0000.w                                                  ; $a9f2 : $0d, $00, $00
	sta $0011.w, X                                                  ; $a9f5 : $9d, $11, $00
	rep #ACCU_8                                                  ; $a9f8 : $c2, $20

br_3c_a9fa:
	lda $7fcdc2.l                                                  ; $a9fa : $af, $c2, $cd, $7f
	beq br_3c_aa15                                                  ; $a9fe : $f0, $15

	tax                                                  ; $aa00 : $aa
	sep #ACCU_8                                                  ; $aa01 : $e2, $20
	lda $11                                                  ; $aa03 : $a5, $11
	and #$0e.b                                                  ; $aa05 : $29, $0e
	sta $0000.w                                                  ; $aa07 : $8d, $00, $00
	lda $0011.w, X                                                  ; $aa0a : $bd, $11, $00
	and #$f1.b                                                  ; $aa0d : $29, $f1
	ora $0000.w                                                  ; $aa0f : $0d, $00, $00
	sta $0011.w, X                                                  ; $aa12 : $9d, $11, $00

br_3c_aa15:
	sep #ACCU_8|IDX_8                                                  ; $aa15 : $e2, $30
	rts                                                  ; $aa17 : $60


	ldx $01                                                  ; $aa18 : $a6, $01
	jsr ($aa1e.w, X)                                                  ; $aa1a : $fc, $1e, $aa
	rtl                                                  ; $aa1d : $6b


	rol                                                  ; $aa1e : $2a
	tax                                                  ; $aa1f : $aa
	adc #$aa.b                                                  ; $aa20 : $69, $aa
	adc [$aa], Y                                                  ; $aa22 : $77, $aa
	lsr $aa, X                                                  ; $aa24 : $56, $aa
	lsr $64aa.w, X                                                  ; $aa26 : $5e, $aa, $64
	tax                                                  ; $aa29 : $aa
	jsr LoadCurrEnemyBaseData.l                                                  ; $aa2a : $22, $5c, $e1, $02
	lda #$0c.b                                                  ; $aa2e : $a9, $0c
	sta $12                                                  ; $aa30 : $85, $12
	lda #$02.b                                                  ; $aa32 : $a9, $02
	sta $01                                                  ; $aa34 : $85, $01
	stz $02                                                  ; $aa36 : $64, $02
	stz $35                                                  ; $aa38 : $64, $35
	stz $2f                                                  ; $aa3a : $64, $2f
	stz $36                                                  ; $aa3c : $64, $36
	stz $1e                                                  ; $aa3e : $64, $1e
	stz $1f                                                  ; $aa40 : $64, $1f
	rep #ACCU_8                                                  ; $aa42 : $c2, $20
	stz $1c                                                  ; $aa44 : $64, $1c
	stz $1a                                                  ; $aa46 : $64, $1a
	lda #$c59e.w                                                  ; $aa48 : $a9, $9e, $c5
	sta $20                                                  ; $aa4b : $85, $20
	sep #ACCU_8                                                  ; $aa4d : $e2, $20
	lda #$00.b                                                  ; $aa4f : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $aa51 : $22, $67, $b9, $04
	rts                                                  ; $aa55 : $60


	lda #$02.b                                                  ; $aa56 : $a9, $02
	sta $01                                                  ; $aa58 : $85, $01
	stz $30                                                  ; $aa5a : $64, $30
	bra br_3c_aa69                                                  ; $aa5c : $80, $0b

	lda #$02.b                                                  ; $aa5e : $a9, $02
	sta $01                                                  ; $aa60 : $85, $01
	bra br_3c_aa69                                                  ; $aa62 : $80, $05

	jsr Func_2_ddf6.l                                                  ; $aa64 : $22, $f6, $dd, $02
	rts                                                  ; $aa68 : $60


br_3c_aa69:
	jsr Func_2_d636.l                                                  ; $aa69 : $22, $36, $d6, $02
	ldx $02                                                  ; $aa6d : $a6, $02
	jsr ($aa73.w, X)                                                  ; $aa6f : $fc, $73, $aa
	rts                                                  ; $aa72 : $60


	jmp ($92aa.w, X)                                                  ; $aa73 : $7c, $aa, $92


	tax                                                  ; $aa76 : $aa
	jsr todo_DisablesEntity_d928.l                                                  ; $aa77 : $22, $28, $d9, $02
	rts                                                  ; $aa7b : $60


	jsr Func_4_cb74.l                                                  ; $aa7c : $22, $74, $cb, $04
	beq br_3c_aa91                                                  ; $aa80 : $f0, $0f

	lda $1f2f.w                                                  ; $aa82 : $ad, $2f, $1f
	cmp #$12.b                                                  ; $aa85 : $c9, $12
	bne br_3c_aa91                                                  ; $aa87 : $d0, $08

	lda #$40.b                                                  ; $aa89 : $a9, $40
	sta $34                                                  ; $aa8b : $85, $34
	lda #$02.b                                                  ; $aa8d : $a9, $02
	sta $02                                                  ; $aa8f : $85, $02

br_3c_aa91:
	rts                                                  ; $aa91 : $60


	lda $34                                                  ; $aa92 : $a5, $34
	beq br_3c_aab4                                                  ; $aa94 : $f0, $1e

	lda $34                                                  ; $aa96 : $a5, $34
	cmp #$3a.b                                                  ; $aa98 : $c9, $3a
	bne br_3c_aa9f                                                  ; $aa9a : $d0, $03

	jsr Call_3c_aab9.w                                                  ; $aa9c : $20, $b9, $aa

br_3c_aa9f:
	lda $34                                                  ; $aa9f : $a5, $34
	and #$07.b                                                  ; $aaa1 : $29, $07
	bne br_3c_aaa8                                                  ; $aaa3 : $d0, $03

	jsr Call_3c_ab21.w                                                  ; $aaa5 : $20, $21, $ab

br_3c_aaa8:
	lda $34                                                  ; $aaa8 : $a5, $34
	and #$0f.b                                                  ; $aaaa : $29, $0f
	bne br_3c_aab1                                                  ; $aaac : $d0, $03

	jsr Call_3c_aaee.w                                                  ; $aaae : $20, $ee, $aa

br_3c_aab1:
	dec $34                                                  ; $aab1 : $c6, $34
	rts                                                  ; $aab3 : $60


br_3c_aab4:
	lda #$04.b                                                  ; $aab4 : $a9, $04
	sta $01                                                  ; $aab6 : $85, $01
	rts                                                  ; $aab8 : $60


Call_3c_aab9:
	rep #IDX_8                                                  ; $aab9 : $c2, $10
	jsr $02d8de.l                                                  ; $aabb : $22, $de, $d8, $02
	bne br_3c_aaeb                                                  ; $aabf : $d0, $2a

	inc $0000.w, X                                                  ; $aac1 : $fe, $00, $00
	lda #$17.b                                                  ; $aac4 : $a9, $17
	sta $000a.w, X                                                  ; $aac6 : $9d, $0a, $00
	lda $18                                                  ; $aac9 : $a5, $18
	sta $0018.w, X                                                  ; $aacb : $9d, $18, $00
	lda $16                                                  ; $aace : $a5, $16
	sta $0016.w, X                                                  ; $aad0 : $9d, $16, $00
	lda $11                                                  ; $aad3 : $a5, $11
	sta $0011.w, X                                                  ; $aad5 : $9d, $11, $00
	lda $0b                                                  ; $aad8 : $a5, $0b
	sta $000b.w, X                                                  ; $aada : $9d, $0b, $00
	rep #ACCU_8                                                  ; $aadd : $c2, $20
	lda $05                                                  ; $aadf : $a5, $05
	sta $0005.w, X                                                  ; $aae1 : $9d, $05, $00
	lda $08                                                  ; $aae4 : $a5, $08
	sta $0008.w, X                                                  ; $aae6 : $9d, $08, $00
	sep #ACCU_8                                                  ; $aae9 : $e2, $20

br_3c_aaeb:
	sep #IDX_8                                                  ; $aaeb : $e2, $10
	rts                                                  ; $aaed : $60


Call_3c_aaee:
	lda $35                                                  ; $aaee : $a5, $35
	tay                                                  ; $aaf0 : $a8
	rep #ACCU_8|F_CARRY                                                  ; $aaf1 : $c2, $21
	lda $05                                                  ; $aaf3 : $a5, $05
	sec                                                  ; $aaf5 : $38
	sbc #$0010.w                                                  ; $aaf6 : $e9, $10, $00

br_3c_aaf9:
	sta $002c.w                                                  ; $aaf9 : $8d, $2c, $00
	lda $08                                                  ; $aafc : $a5, $08
	sep #ACCU_8                                                  ; $aafe : $e2, $20
	clc                                                  ; $ab00 : $18
	adc $c5a8.w, Y                                                  ; $ab01 : $79, $a8, $c5
	rep #ACCU_8                                                  ; $ab04 : $c2, $20
	sta $002e.w                                                  ; $ab06 : $8d, $2e, $00
	and #$00ff.w                                                  ; $ab09 : $29, $ff, $00
	sep #ACCU_8                                                  ; $ab0c : $e2, $20
	lda $0b                                                  ; $ab0e : $a5, $0b
	asl                                                  ; $ab10 : $0a
	asl                                                  ; $ab11 : $0a
	clc                                                  ; $ab12 : $18
	adc $35                                                  ; $ab13 : $65, $35
	tay                                                  ; $ab15 : $a8
	lda $c5ac.w, Y                                                  ; $ab16 : $b9, $ac, $c5
	ina                                                  ; $ab19 : $1a
	jsr $02c411.l                                                  ; $ab1a : $22, $11, $c4, $02
	inc $35                                                  ; $ab1e : $e6, $35
	rts                                                  ; $ab20 : $60


Call_3c_ab21:
	lda $35                                                  ; $ab21 : $a5, $35
	tay                                                  ; $ab23 : $a8
	lda $c5a8.w, Y                                                  ; $ab24 : $b9, $a8, $c5
	xba                                                  ; $ab27 : $eb
	lda #$f0.b                                                  ; $ab28 : $a9, $f0
	jsr $02ded5.l                                                  ; $ab2a : $22, $d5, $de, $02
	lda $c5a8.w, Y                                                  ; $ab2e : $b9, $a8, $c5
	xba                                                  ; $ab31 : $eb
	lda #$00.b                                                  ; $ab32 : $a9, $00
	jsr $02ded5.l                                                  ; $ab34 : $22, $d5, $de, $02
	lda $c5a8.w, Y                                                  ; $ab38 : $b9, $a8, $c5
	xba                                                  ; $ab3b : $eb
	lda #$10.b                                                  ; $ab3c : $a9, $10
	jsr $02ded5.l                                                  ; $ab3e : $22, $d5, $de, $02
	rts                                                  ; $ab42 : $60


	ldx $01                                                  ; $ab43 : $a6, $01
	jsr ($ab49.w, X)                                                  ; $ab45 : $fc, $49, $ab
	rtl                                                  ; $ab48 : $6b


	eor $ab, X                                                  ; $ab49 : $55, $ab
	bvs br_3c_aaf9                                                  ; $ab4b : $70, $ac

	lda $ac40ac.l, X                                                  ; $ab4d : $bf, $ac, $40, $ac
	lsr $64ac.w, X                                                  ; $ab51 : $5e, $ac, $64
	ldy $5c22.w                                                  ; $ab54 : $ac, $22, $5c
	sbc ($02, X)                                                  ; $ab57 : $e1, $02
	lda #$04.b                                                  ; $ab59 : $a9, $04
	sta $12                                                  ; $ab5b : $85, $12
	lda #$02.b                                                  ; $ab5d : $a9, $02
	sta $01                                                  ; $ab5f : $85, $01
	stz $03                                                  ; $ab61 : $64, $03
	jsr $02e13f.l                                                  ; $ab63 : $22, $3f, $e1, $02
	lda $11                                                  ; $ab67 : $a5, $11
	sta $10                                                  ; $ab69 : $85, $10
	lda #$01.b                                                  ; $ab6b : $a9, $01
	sta $2f                                                  ; $ab6d : $85, $2f
	lda #$80.b                                                  ; $ab6f : $a9, $80
	sta $37                                                  ; $ab71 : $85, $37
	lda $0b                                                  ; $ab73 : $a5, $0b
	asl                                                  ; $ab75 : $0a
	tax                                                  ; $ab76 : $aa
	jsr ($ab94.w, X)                                                  ; $ab77 : $fc, $94, $ab
	lda $0b                                                  ; $ab7a : $a5, $0b
	cmp #$04.b                                                  ; $ab7c : $c9, $04
	beq br_3c_ab8a                                                  ; $ab7e : $f0, $0a

	stz $1f                                                  ; $ab80 : $64, $1f
	stz $1e                                                  ; $ab82 : $64, $1e
	rep #ACCU_8                                                  ; $ab84 : $c2, $20
	lda $05                                                  ; $ab86 : $a5, $05
	sta $35                                                  ; $ab88 : $85, $35

br_3c_ab8a:
	rep #ACCU_8                                                  ; $ab8a : $c2, $20
	lda #$c5b4.w                                                  ; $ab8c : $a9, $b4, $c5
	sta $20                                                  ; $ab8f : $85, $20
	sep #ACCU_8                                                  ; $ab91 : $e2, $20
	rts                                                  ; $ab93 : $60


	stz $b9ab.w, X                                                  ; $ab94 : $9e, $ab, $b9
	plb                                                  ; $ab97 : $ab
	cmp ($ab)                                                  ; $ab98 : $d2, $ab
	inx                                                  ; $ab9a : $e8
	plb                                                  ; $ab9b : $ab
	sbc $a0ab.w, Y                                                  ; $ab9c : $f9, $ab, $a0
	.db $82                                                  ; $ab9f : $82

	jsr Call_3c_af75.w                                                  ; $aba0 : $20, $75, $af
	bne br_3c_abe8                                                  ; $aba3 : $d0, $43

	jsr Call_3c_b027.w                                                  ; $aba5 : $20, $27, $b0
	ldy #$08.b                                                  ; $aba8 : $a0, $08
	jsr Call_3c_afe6.w                                                  ; $abaa : $20, $e6, $af
	jsr Call_3c_b082.w                                                  ; $abad : $20, $82, $b0
	lda #$00.b                                                  ; $abb0 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $abb2 : $22, $67, $b9, $04
	stz $02                                                  ; $abb6 : $64, $02
	rts                                                  ; $abb8 : $60


	jsr Call_3c_af1b.w                                                  ; $abb9 : $20, $1b, $af
	bne br_3c_abe8                                                  ; $abbc : $d0, $2a

	jsr Call_3c_b027.w                                                  ; $abbe : $20, $27, $b0
	ldy #$09.b                                                  ; $abc1 : $a0, $09
	jsr Call_3c_afe6.w                                                  ; $abc3 : $20, $e6, $af
	jsr Call_3c_b082.w                                                  ; $abc6 : $20, $82, $b0
	lda #$01.b                                                  ; $abc9 : $a9, $01
	jsr SetupEntitysAnimation.l                                                  ; $abcb : $22, $67, $b9, $04
	stz $02                                                  ; $abcf : $64, $02
	rts                                                  ; $abd1 : $60


	stz $2f                                                  ; $abd2 : $64, $2f
	ldy #$0c.b                                                  ; $abd4 : $a0, $0c
	jsr Call_3c_afe6.w                                                  ; $abd6 : $20, $e6, $af
	lda #$04.b                                                  ; $abd9 : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $abdb : $22, $67, $b9, $04
	lda #$01.b                                                  ; $abdf : $a9, $01
	sta $34                                                  ; $abe1 : $85, $34
	lda #$04.b                                                  ; $abe3 : $a9, $04
	sta $02                                                  ; $abe5 : $85, $02
	rts                                                  ; $abe7 : $60


br_3c_abe8:
	jsr Call_3c_b082.w                                                  ; $abe8 : $20, $82, $b0
	jsr Call_3c_b027.w                                                  ; $abeb : $20, $27, $b0
	lda #$04.b                                                  ; $abee : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $abf0 : $22, $67, $b9, $04
	lda #$02.b                                                  ; $abf4 : $a9, $02
	sta $02                                                  ; $abf6 : $85, $02
	rts                                                  ; $abf8 : $60


	lda $11                                                  ; $abf9 : $a5, $11
	bit #$40.b                                                  ; $abfb : $89, $40
	rep #ACCU_8                                                  ; $abfd : $c2, $20
	beq br_3c_ac10                                                  ; $abff : $f0, $0f

	lda $05                                                  ; $ac01 : $a5, $05
	sta $1e                                                  ; $ac03 : $85, $1e
	sec                                                  ; $ac05 : $38
	sbc #$0032.w                                                  ; $ac06 : $e9, $32, $00
	sta $05                                                  ; $ac09 : $85, $05
	lda #$0100.w                                                  ; $ac0b : $a9, $00, $01
	bra br_3c_ac1d                                                  ; $ac0e : $80, $0d

br_3c_ac10:
	lda $05                                                  ; $ac10 : $a5, $05
	sta $1e                                                  ; $ac12 : $85, $1e
	clc                                                  ; $ac14 : $18
	adc #$0032.w                                                  ; $ac15 : $69, $32, $00
	sta $05                                                  ; $ac18 : $85, $05
	lda #$ff00.w                                                  ; $ac1a : $a9, $00, $ff

br_3c_ac1d:
	sta $1a                                                  ; $ac1d : $85, $1a
	lda #$fd00.w                                                  ; $ac1f : $a9, $00, $fd
	sta $1c                                                  ; $ac22 : $85, $1c
	lda $08                                                  ; $ac24 : $a5, $08
	sta $35                                                  ; $ac26 : $85, $35
	sec                                                  ; $ac28 : $38
	sbc #$0090.w                                                  ; $ac29 : $e9, $90, $00
	sta $08                                                  ; $ac2c : $85, $08
	stz $3e                                                  ; $ac2e : $64, $3e
	sep #ACCU_8                                                  ; $ac30 : $e2, $20
	jsr Call_3c_b097.w                                                  ; $ac32 : $20, $97, $b0
	lda #$00.b                                                  ; $ac35 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $ac37 : $22, $67, $b9, $04
	lda #$0e.b                                                  ; $ac3b : $a9, $0e
	sta $02                                                  ; $ac3d : $85, $02
	rts                                                  ; $ac3f : $60


	lda $10                                                  ; $ac40 : $a5, $10
	tsb $11                                                  ; $ac42 : $04, $11
	lda $33                                                  ; $ac44 : $a5, $33
	bmi br_3c_ac4c                                                  ; $ac46 : $30, $04

	dec $30                                                  ; $ac48 : $c6, $30
	bne br_3c_ac70                                                  ; $ac4a : $d0, $24

br_3c_ac4c:
	jsr SetCarryIfEntityWayOutOfView.l                                                  ; $ac4c : $22, $8a, $d5, $02
	bcs br_3c_ac56                                                  ; $ac50 : $b0, $04

	lda #$01.b                                                  ; $ac52 : $a9, $01
	sta $0e                                                  ; $ac54 : $85, $0e

br_3c_ac56:
	jsr Func_2_db3f.l                                                  ; $ac56 : $22, $3f, $db, $02
	jsr Call_3c_b160.w                                                  ; $ac5a : $20, $60, $b1
	rts                                                  ; $ac5d : $60


	lda #$02.b                                                  ; $ac5e : $a9, $02
	sta $01                                                  ; $ac60 : $85, $01
	bra br_3c_ac70                                                  ; $ac62 : $80, $0c

	lda $10                                                  ; $ac64 : $a5, $10
	tsb $11                                                  ; $ac66 : $04, $11
	jsr Call_3c_b160.w                                                  ; $ac68 : $20, $60, $b1
	jsr Func_2_ddf6.l                                                  ; $ac6b : $22, $f6, $dd, $02
	rts                                                  ; $ac6f : $60


br_3c_ac70:
	lda $10                                                  ; $ac70 : $a5, $10
	tsb $11                                                  ; $ac72 : $04, $11
	jsr Func_2_d636.l                                                  ; $ac74 : $22, $36, $d6, $02
	lda $02                                                  ; $ac78 : $a5, $02
	cmp #$0e.b                                                  ; $ac7a : $c9, $0e
	beq br_3c_ac82                                                  ; $ac7c : $f0, $04

	lda $0e                                                  ; $ac7e : $a5, $0e
	beq br_3c_aca1                                                  ; $ac80 : $f0, $1f

br_3c_ac82:
	ldx $02                                                  ; $ac82 : $a6, $02
	jsr ($acaf.w, X)                                                  ; $ac84 : $fc, $af, $ac
	lda $01                                                  ; $ac87 : $a5, $01
	cmp #$04.b                                                  ; $ac89 : $c9, $04
	beq br_3c_aca0                                                  ; $ac8b : $f0, $13

	jsr Func_4_cb74.l                                                  ; $ac8d : $22, $74, $cb, $04
	bmi br_3c_aca8                                                  ; $ac91 : $30, $15

	beq br_3c_ac99                                                  ; $ac93 : $f0, $04

	lda #$0e.b                                                  ; $ac95 : $a9, $0e
	trb $11                                                  ; $ac97 : $14, $11

br_3c_ac99:
	jsr Call_3c_b160.w                                                  ; $ac99 : $20, $60, $b1
	jsr Func_4_cb31.l                                                  ; $ac9c : $22, $31, $cb, $04

br_3c_aca0:
	rts                                                  ; $aca0 : $60


br_3c_aca1:
	lda #$04.b                                                  ; $aca1 : $a9, $04
	sta $01                                                  ; $aca3 : $85, $01
	sta $02                                                  ; $aca5 : $85, $02
	rts                                                  ; $aca7 : $60


br_3c_aca8:
	lda #$04.b                                                  ; $aca8 : $a9, $04
	sta $01                                                  ; $acaa : $85, $01
	stz $02                                                  ; $acac : $64, $02
	rts                                                  ; $acae : $60


	ina                                                  ; $acaf : $1a
	lda $ad6e.w                                                  ; $acb0 : $ad, $6e, $ad
	sta $e5ad.w, X                                                  ; $acb3 : $9d, $ad, $e5
	lda $ae0b.w                                                  ; $acb6 : $ad, $0b, $ae
	ora $55ae.w, X                                                  ; $acb9 : $1d, $ae, $55
	ldx $ae6e.w                                                  ; $acbc : $ae, $6e, $ae
	lda $10                                                  ; $acbf : $a5, $10
	tsb $11                                                  ; $acc1 : $04, $11
	stz $3e                                                  ; $acc3 : $64, $3e
	stz $3f                                                  ; $acc5 : $64, $3f
	lda $02                                                  ; $acc7 : $a5, $02
	bne br_3c_ad0a                                                  ; $acc9 : $d0, $3f

	lda #$02.b                                                  ; $accb : $a9, $02
	sta $0000.w                                                  ; $accd : $8d, $00, $00
	lda #$2b.b                                                  ; $acd0 : $a9, $2b
	sta $0001.w                                                  ; $acd2 : $8d, $01, $00
	lda #$00.b                                                  ; $acd5 : $a9, $00
	jsr $02d96d.l                                                  ; $acd7 : $22, $6d, $d9, $02
	lda #$01.b                                                  ; $acdb : $a9, $01
	jsr $02d96d.l                                                  ; $acdd : $22, $6d, $d9, $02
	lda #$02.b                                                  ; $ace1 : $a9, $02
	jsr $02d96d.l                                                  ; $ace3 : $22, $6d, $d9, $02
	lda #$03.b                                                  ; $ace7 : $a9, $03
	jsr $02d96d.l                                                  ; $ace9 : $22, $6d, $d9, $02
	jsr $04d6e0.l                                                  ; $aced : $22, $e0, $d6, $04
	ldx $1f2f.w                                                  ; $acf1 : $ae, $2f, $1f
	lda $bc26.w, X                                                  ; $acf4 : $bd, $26, $bc
	beq br_3c_ad04                                                  ; $acf7 : $f0, $0b

	dea                                                  ; $acf9 : $3a
	beq br_3c_ad00                                                  ; $acfa : $f0, $04

	lda #$08.b                                                  ; $acfc : $a9, $08
	bra br_3c_ad06                                                  ; $acfe : $80, $06

br_3c_ad00:
	lda #$07.b                                                  ; $ad00 : $a9, $07
	bra br_3c_ad06                                                  ; $ad02 : $80, $02

br_3c_ad04:
	lda #$04.b                                                  ; $ad04 : $a9, $04

br_3c_ad06:
	jsr $04d5e5.l                                                  ; $ad06 : $22, $e5, $d5, $04

br_3c_ad0a:
	lda $0b                                                  ; $ad0a : $a5, $0b
	cmp #$04.b                                                  ; $ad0c : $c9, $04
	beq br_3c_ad15                                                  ; $ad0e : $f0, $05

	jsr Func_2_d917.l                                                  ; $ad10 : $22, $17, $d9, $02
	rts                                                  ; $ad14 : $60


br_3c_ad15:
	jsr todo_DisablesEntity_d928.l                                                  ; $ad15 : $22, $28, $d9, $02
	rts                                                  ; $ad19 : $60


	jsr $02d78e.l                                                  ; $ad1a : $22, $8e, $d7, $02
	jsr Call_3c_b178.w                                                  ; $ad1e : $20, $78, $b1
	jsr Call_3c_b1a3.w                                                  ; $ad21 : $20, $a3, $b1
	bne br_3c_ad4c                                                  ; $ad24 : $d0, $26

	jsr Call_3c_b069.w                                                  ; $ad26 : $20, $69, $b0
	bne br_3c_ad3f                                                  ; $ad29 : $d0, $14

	jsr Call_3c_b0c1.w                                                  ; $ad2b : $20, $c1, $b0
	bne br_3c_ad3f                                                  ; $ad2e : $d0, $0f

	lda $0b                                                  ; $ad30 : $a5, $0b
	beq br_3c_ad39                                                  ; $ad32 : $f0, $05

	jsr Call_3c_b0db.w                                                  ; $ad34 : $20, $db, $b0
	bne br_3c_ad43                                                  ; $ad37 : $d0, $0a

br_3c_ad39:
	jsr Call_3c_b10d.w                                                  ; $ad39 : $20, $0d, $b1
	bne br_3c_ad5f                                                  ; $ad3c : $d0, $21

	rts                                                  ; $ad3e : $60


br_3c_ad3f:
	jsr Call_3c_b0ac.w                                                  ; $ad3f : $20, $ac, $b0
	rts                                                  ; $ad42 : $60


br_3c_ad43:
	rep #IDX_8                                                  ; $ad43 : $c2, $10
	ldx $39                                                  ; $ad45 : $a6, $39
	lda #$01.b                                                  ; $ad47 : $a9, $01
	sta $003b.w, X                                                  ; $ad49 : $9d, $3b, $00

br_3c_ad4c:
	rep #IDX_8                                                  ; $ad4c : $c2, $10
	ldx $3c                                                  ; $ad4e : $a6, $3c
	lda #$01.b                                                  ; $ad50 : $a9, $01
	sta $0035.w, X                                                  ; $ad52 : $9d, $35, $00
	sep #IDX_8                                                  ; $ad55 : $e2, $10
	jsr Call_3c_b136.w                                                  ; $ad57 : $20, $36, $b1
	lda #$06.b                                                  ; $ad5a : $a9, $06
	sta $02                                                  ; $ad5c : $85, $02
	rts                                                  ; $ad5e : $60


br_3c_ad5f:
	lda $02                                                  ; $ad5f : $a5, $02
	sta $03                                                  ; $ad61 : $85, $03
	lda #$0c.b                                                  ; $ad63 : $a9, $0c
	sta $02                                                  ; $ad65 : $85, $02
	jsr Call_3c_afa6.w                                                  ; $ad67 : $20, $a6, $af
	jsr Call_3c_b0f6.w                                                  ; $ad6a : $20, $f6, $b0
	rts                                                  ; $ad6d : $60


	jsr $02d78e.l                                                  ; $ad6e : $22, $8e, $d7, $02
	jsr Call_3c_b069.w                                                  ; $ad72 : $20, $69, $b0
	bne br_3c_ad8a                                                  ; $ad75 : $d0, $13

	jsr Call_3c_b0c1.w                                                  ; $ad77 : $20, $c1, $b0
	bne br_3c_ad8a                                                  ; $ad7a : $d0, $0e

	jsr Call_3c_b10d.w                                                  ; $ad7c : $20, $0d, $b1
	bne br_3c_ad8e                                                  ; $ad7f : $d0, $0d

	dec $34                                                  ; $ad81 : $c6, $34
	bne br_3c_ad89                                                  ; $ad83 : $d0, $04

	lda #$06.b                                                  ; $ad85 : $a9, $06
	sta $02                                                  ; $ad87 : $85, $02

br_3c_ad89:
	rts                                                  ; $ad89 : $60


br_3c_ad8a:
	jsr Call_3c_b0ac.w                                                  ; $ad8a : $20, $ac, $b0
	rts                                                  ; $ad8d : $60


br_3c_ad8e:
	lda $02                                                  ; $ad8e : $a5, $02
	sta $03                                                  ; $ad90 : $85, $03
	lda #$0c.b                                                  ; $ad92 : $a9, $0c
	sta $02                                                  ; $ad94 : $85, $02
	jsr Call_3c_afa6.w                                                  ; $ad96 : $20, $a6, $af
	jsr Call_3c_b0f6.w                                                  ; $ad99 : $20, $f6, $b0
	rts                                                  ; $ad9c : $60


	ldx $03                                                  ; $ad9d : $a6, $03
	jsr ($ada7.w, X)                                                  ; $ad9f : $fc, $a7, $ad
	jsr AnimateEntity.l                                                  ; $ada2 : $22, $4a, $b9, $04
	rts                                                  ; $ada6 : $60


	plb                                                  ; $ada7 : $ab
	lda $adc5.w                                                  ; $ada8 : $ad, $c5, $ad
	dec $34                                                  ; $adab : $c6, $34
	bne br_3c_adc4                                                  ; $adad : $d0, $15

	lda #$07.b                                                  ; $adaf : $a9, $07
	jsr SetupEntitysAnimation.l                                                  ; $adb1 : $22, $67, $b9, $04
	jsr Call_3c_afa6.w                                                  ; $adb5 : $20, $a6, $af
	lda $37                                                  ; $adb8 : $a5, $37
	eor #$80.b                                                  ; $adba : $49, $80
	and #$80.b                                                  ; $adbc : $29, $80
	sta $37                                                  ; $adbe : $85, $37
	lda #$02.b                                                  ; $adc0 : $a9, $02
	sta $03                                                  ; $adc2 : $85, $03

br_3c_adc4:
	rts                                                  ; $adc4 : $60


	lda $0f                                                  ; $adc5 : $a5, $0f
	bpl br_3c_ade4                                                  ; $adc7 : $10, $1b

	lda $37                                                  ; $adc9 : $a5, $37
	and #$7f.b                                                  ; $adcb : $29, $7f
	beq br_3c_addc                                                  ; $adcd : $f0, $0d

	ldx #$50.b                                                  ; $adcf : $a2, $50
	lda $37                                                  ; $add1 : $a5, $37
	bmi br_3c_add7                                                  ; $add3 : $30, $02

	ldx #$1e.b                                                  ; $add5 : $a2, $1e

br_3c_add7:
	stx $34                                                  ; $add7 : $86, $34
	stz $03                                                  ; $add9 : $64, $03
	rts                                                  ; $addb : $60


br_3c_addc:
	lda #$04.b                                                  ; $addc : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $adde : $22, $67, $b9, $04
	inc $37                                                  ; $ade2 : $e6, $37

br_3c_ade4:
	rts                                                  ; $ade4 : $60


	lda $0f                                                  ; $ade5 : $a5, $0f
	bpl br_3c_ae06                                                  ; $ade7 : $10, $1d

	lda #$04.b                                                  ; $ade9 : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $adeb : $22, $67, $b9, $04
	lda #$40.b                                                  ; $adef : $a9, $40
	sta $1e                                                  ; $adf1 : $85, $1e
	rep #ACCU_8                                                  ; $adf3 : $c2, $20
	lda #$0001.w                                                  ; $adf5 : $a9, $01, $00
	sta $3e                                                  ; $adf8 : $85, $3e
	stz $1a                                                  ; $adfa : $64, $1a
	sep #ACCU_8                                                  ; $adfc : $e2, $20
	lda #$30.b                                                  ; $adfe : $a9, $30
	sta $34                                                  ; $ae00 : $85, $34
	lda #$08.b                                                  ; $ae02 : $a9, $08
	sta $02                                                  ; $ae04 : $85, $02

br_3c_ae06:
	jsr AnimateEntity.l                                                  ; $ae06 : $22, $4a, $b9, $04
	rts                                                  ; $ae0a : $60


	dec $34                                                  ; $ae0b : $c6, $34
	bne br_3c_ae1c                                                  ; $ae0d : $d0, $0d

	rep #ACCU_8                                                  ; $ae0f : $c2, $20
	lda #$0001.w                                                  ; $ae11 : $a9, $01, $00
	sta $3e                                                  ; $ae14 : $85, $3e
	sep #ACCU_8                                                  ; $ae16 : $e2, $20
	lda #$0a.b                                                  ; $ae18 : $a9, $0a
	sta $02                                                  ; $ae1a : $85, $02

br_3c_ae1c:
	rts                                                  ; $ae1c : $60


	jsr $04c0f7.l                                                  ; $ae1d : $22, $f7, $c0, $04
	lda $2b                                                  ; $ae21 : $a5, $2b
	bit #$04.b                                                  ; $ae23 : $89, $04
	beq br_3c_ae3c                                                  ; $ae25 : $f0, $15

	stz $1e                                                  ; $ae27 : $64, $1e
	rep #ACCU_8                                                  ; $ae29 : $c2, $20
	stz $1c                                                  ; $ae2b : $64, $1c
	sep #ACCU_8                                                  ; $ae2d : $e2, $20
	lda #$01.b                                                  ; $ae2f : $a9, $01
	sta $34                                                  ; $ae31 : $85, $34
	lda #$03.b                                                  ; $ae33 : $a9, $03
	sta $28                                                  ; $ae35 : $85, $28
	lda #$04.b                                                  ; $ae37 : $a9, $04
	sta $02                                                  ; $ae39 : $85, $02
	rts                                                  ; $ae3b : $60


br_3c_ae3c:
	jsr Func_2_d7c2.l                                                  ; $ae3c : $22, $c2, $d7, $02
	rep #ACCU_8                                                  ; $ae40 : $c2, $20
	lda $1c                                                  ; $ae42 : $a5, $1c
	cmp #$fc00.w                                                  ; $ae44 : $c9, $00, $fc
	bpl br_3c_ae52                                                  ; $ae47 : $10, $09

	lda #$fc00.w                                                  ; $ae49 : $a9, $00, $fc
	sta $1c                                                  ; $ae4c : $85, $1c
	sep #ACCU_8                                                  ; $ae4e : $e2, $20
	stz $1e                                                  ; $ae50 : $64, $1e

br_3c_ae52:
	sep #ACCU_8                                                  ; $ae52 : $e2, $20
	rts                                                  ; $ae54 : $60


	jsr AnimateEntity.l                                                  ; $ae55 : $22, $4a, $b9, $04
	lda $0f                                                  ; $ae59 : $a5, $0f
	bpl br_3c_ae6d                                                  ; $ae5b : $10, $10

	lda $37                                                  ; $ae5d : $a5, $37
	beq br_3c_ae68                                                  ; $ae5f : $f0, $07

	lda $03                                                  ; $ae61 : $a5, $03
	sta $02                                                  ; $ae63 : $85, $02
	stz $37                                                  ; $ae65 : $64, $37
	rts                                                  ; $ae67 : $60


br_3c_ae68:
	jsr Call_3c_b149.w                                                  ; $ae68 : $20, $49, $b1
	inc $37                                                  ; $ae6b : $e6, $37

br_3c_ae6d:
	rts                                                  ; $ae6d : $60


	ldx $03                                                  ; $ae6e : $a6, $03
	jsr ($ae74.w, X)                                                  ; $ae70 : $fc, $74, $ae
	rts                                                  ; $ae73 : $60


	ror $c0ae.w, X                                                  ; $ae74 : $7e, $ae, $c0
	ldx $aee5.w                                                  ; $ae77 : $ae, $e5, $ae
	sed                                                  ; $ae7a : $f8
	ldx $af0f.w                                                  ; $ae7b : $ae, $0f, $af
	lda $3e                                                  ; $ae7e : $a5, $3e
	bne br_3c_aea1                                                  ; $ae80 : $d0, $1f

	lda $11                                                  ; $ae82 : $a5, $11
	bit #$40.b                                                  ; $ae84 : $89, $40
	beq br_3c_ae8c                                                  ; $ae86 : $f0, $04

	ldy #$81.b                                                  ; $ae88 : $a0, $81
	bra br_3c_ae8e                                                  ; $ae8a : $80, $02

br_3c_ae8c:
	ldy #$80.b                                                  ; $ae8c : $a0, $80

br_3c_ae8e:
	jsr Call_3c_af75.w                                                  ; $ae8e : $20, $75, $af
	bne br_3c_aeb7                                                  ; $ae91 : $d0, $24

	ldy #$08.b                                                  ; $ae93 : $a0, $08
	jsr Call_3c_afe6.w                                                  ; $ae95 : $20, $e6, $af
	bne br_3c_aeb7                                                  ; $ae98 : $d0, $1d

	jsr Call_3c_b027.w                                                  ; $ae9a : $20, $27, $b0
	bne br_3c_aeb7                                                  ; $ae9d : $d0, $18

	bra br_3c_aeb6                                                  ; $ae9f : $80, $15

br_3c_aea1:
	jsr $02d78e.l                                                  ; $aea1 : $22, $8e, $d7, $02
	jsr Call_3c_b178.w                                                  ; $aea5 : $20, $78, $b1
	rep #ACCU_8                                                  ; $aea8 : $c2, $20
	lda $08                                                  ; $aeaa : $a5, $08
	cmp $35                                                  ; $aeac : $c5, $35
	sep #ACCU_8                                                  ; $aeae : $e2, $20
	bmi br_3c_aeb6                                                  ; $aeb0 : $30, $04

	lda #$02.b                                                  ; $aeb2 : $a9, $02
	sta $03                                                  ; $aeb4 : $85, $03

br_3c_aeb6:
	rts                                                  ; $aeb6 : $60


br_3c_aeb7:
	stz $3e                                                  ; $aeb7 : $64, $3e
	lda #$04.b                                                  ; $aeb9 : $a9, $04
	sta $01                                                  ; $aebb : $85, $01
	sta $02                                                  ; $aebd : $85, $02
	rts                                                  ; $aebf : $60


	rep #IDX_8                                                  ; $aec0 : $c2, $10
	ldx $39                                                  ; $aec2 : $a6, $39
	lda #$01.b                                                  ; $aec4 : $a9, $01
	sta $003b.w, X                                                  ; $aec6 : $9d, $3b, $00
	ldx $3c                                                  ; $aec9 : $a6, $3c
	lda #$01.b                                                  ; $aecb : $a9, $01
	sta $0035.w, X                                                  ; $aecd : $9d, $35, $00
	sep #IDX_8                                                  ; $aed0 : $e2, $10
	jsr Call_3c_b136.w                                                  ; $aed2 : $20, $36, $b1
	rep #ACCU_8                                                  ; $aed5 : $c2, $20
	lda $1c                                                  ; $aed7 : $a5, $1c
	eor #$ffff.w                                                  ; $aed9 : $49, $ff, $ff
	sta $1c                                                  ; $aedc : $85, $1c
	sep #ACCU_8                                                  ; $aede : $e2, $20
	lda #$04.b                                                  ; $aee0 : $a9, $04
	sta $03                                                  ; $aee2 : $85, $03
	rts                                                  ; $aee4 : $60


	lda $0f                                                  ; $aee5 : $a5, $0f
	bpl br_3c_aef3                                                  ; $aee7 : $10, $0a

	lda #$04.b                                                  ; $aee9 : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $aeeb : $22, $67, $b9, $04
	lda #$06.b                                                  ; $aeef : $a9, $06
	sta $03                                                  ; $aef1 : $85, $03

br_3c_aef3:
	jsr AnimateEntity.l                                                  ; $aef3 : $22, $4a, $b9, $04
	rts                                                  ; $aef7 : $60


	jsr $02d78e.l                                                  ; $aef8 : $22, $8e, $d7, $02
	rep #ACCU_8                                                  ; $aefc : $c2, $20
	lda $35                                                  ; $aefe : $a5, $35
	sec                                                  ; $af00 : $38
	sbc $08                                                  ; $af01 : $e5, $08
	cmp #$0100.w                                                  ; $af03 : $c9, $00, $01
	sep #ACCU_8                                                  ; $af06 : $e2, $20
	bmi br_3c_af0e                                                  ; $af08 : $30, $04

	lda #$08.b                                                  ; $af0a : $a9, $08
	sta $03                                                  ; $af0c : $85, $03

br_3c_af0e:
	rts                                                  ; $af0e : $60


	jsr Call_3c_af4d.w                                                  ; $af0f : $20, $4d, $af
	lda #$04.b                                                  ; $af12 : $a9, $04
	sta $01                                                  ; $af14 : $85, $01
	sta $02                                                  ; $af16 : $85, $02
	stz $3e                                                  ; $af18 : $64, $3e
	rts                                                  ; $af1a : $60


Call_3c_af1b:
	rep #IDX_8                                                  ; $af1b : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $af1d : $22, $a7, $d8, $02
	bne br_3c_af4a                                                  ; $af21 : $d0, $27

	inc $0000.w, X                                                  ; $af23 : $fe, $00, $00
	lda #$33.b                                                  ; $af26 : $a9, $33
	sta $000a.w, X                                                  ; $af28 : $9d, $0a, $00
	lda #$82.b                                                  ; $af2b : $a9, $82
	sta $000b.w, X                                                  ; $af2d : $9d, $0b, $00
	rep #ACCU_8                                                  ; $af30 : $c2, $20
	lda $05                                                  ; $af32 : $a5, $05
	sta $0005.w, X                                                  ; $af34 : $9d, $05, $00
	lda $08                                                  ; $af37 : $a5, $08
	clc                                                  ; $af39 : $18
	adc #$0010.w                                                  ; $af3a : $69, $10, $00
	sta $0008.w, X                                                  ; $af3d : $9d, $08, $00
	tdc                                                  ; $af40 : $7b
	sta $003e.w, X                                                  ; $af41 : $9d, $3e, $00
	stx $39                                                  ; $af44 : $86, $39
	sep #ACCU_8|IDX_8                                                  ; $af46 : $e2, $30
	lda #$00.b                                                  ; $af48 : $a9, $00

br_3c_af4a:
	sep #IDX_8                                                  ; $af4a : $e2, $10
	rts                                                  ; $af4c : $60


Call_3c_af4d:
	rep #IDX_8                                                  ; $af4d : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $af4f : $22, $a7, $d8, $02
	bne br_3c_af72                                                  ; $af53 : $d0, $1d

	inc $0000.w, X                                                  ; $af55 : $fe, $00, $00
	lda #$35.b                                                  ; $af58 : $a9, $35
	sta $000a.w, X                                                  ; $af5a : $9d, $0a, $00
	lda #$04.b                                                  ; $af5d : $a9, $04
	sta $000b.w, X                                                  ; $af5f : $9d, $0b, $00
	rep #ACCU_8                                                  ; $af62 : $c2, $20
	lda $1e                                                  ; $af64 : $a5, $1e
	sta $0005.w, X                                                  ; $af66 : $9d, $05, $00
	lda $35                                                  ; $af69 : $a5, $35
	sta $0008.w, X                                                  ; $af6b : $9d, $08, $00
	sep #ACCU_8|IDX_8                                                  ; $af6e : $e2, $30
	lda #$00.b                                                  ; $af70 : $a9, $00

br_3c_af72:
	sep #IDX_8                                                  ; $af72 : $e2, $10
	rts                                                  ; $af74 : $60


Call_3c_af75:
	rep #IDX_8                                                  ; $af75 : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $af77 : $22, $a7, $d8, $02
	bne br_3c_afa3                                                  ; $af7b : $d0, $26

	inc $0000.w, X                                                  ; $af7d : $fe, $00, $00
	lda #$1b.b                                                  ; $af80 : $a9, $1b
	sta $000a.w, X                                                  ; $af82 : $9d, $0a, $00
	tya                                                  ; $af85 : $98
	sta $000b.w, X                                                  ; $af86 : $9d, $0b, $00
	rep #ACCU_8                                                  ; $af89 : $c2, $20
	lda $05                                                  ; $af8b : $a5, $05
	sta $0005.w, X                                                  ; $af8d : $9d, $05, $00
	lda $08                                                  ; $af90 : $a5, $08
	clc                                                  ; $af92 : $18
	adc #$0010.w                                                  ; $af93 : $69, $10, $00
	sta $0008.w, X                                                  ; $af96 : $9d, $08, $00
	tdc                                                  ; $af99 : $7b
	sta $003e.w, X                                                  ; $af9a : $9d, $3e, $00
	stx $39                                                  ; $af9d : $86, $39
	sep #ACCU_8|IDX_8                                                  ; $af9f : $e2, $30
	lda #$00.b                                                  ; $afa1 : $a9, $00

br_3c_afa3:
	sep #IDX_8                                                  ; $afa3 : $e2, $10
	rts                                                  ; $afa5 : $60


Call_3c_afa6:
	rep #IDX_8                                                  ; $afa6 : $c2, $10
	jsr $02d8de.l                                                  ; $afa8 : $22, $de, $d8, $02
	bne br_3c_afe3                                                  ; $afac : $d0, $35

	inc $0000.w, X                                                  ; $afae : $fe, $00, $00
	lda #$18.b                                                  ; $afb1 : $a9, $18
	sta $000a.w, X                                                  ; $afb3 : $9d, $0a, $00
	lda $18                                                  ; $afb6 : $a5, $18
	sta $0018.w, X                                                  ; $afb8 : $9d, $18, $00
	lda $11                                                  ; $afbb : $a5, $11
	sta $0011.w, X                                                  ; $afbd : $9d, $11, $00
	lda $16                                                  ; $afc0 : $a5, $16
	sta $0016.w, X                                                  ; $afc2 : $9d, $16, $00
	stz $000b.w, X                                                  ; $afc5 : $9e, $0b, $00
	rep #ACCU_8                                                  ; $afc8 : $c2, $20
	lda $05                                                  ; $afca : $a5, $05
	sta $0005.w, X                                                  ; $afcc : $9d, $05, $00
	lda $08                                                  ; $afcf : $a5, $08
	sec                                                  ; $afd1 : $38
	sbc #$0011.w                                                  ; $afd2 : $e9, $11, $00
	sta $0008.w, X                                                  ; $afd5 : $9d, $08, $00
	lda #$0000.w                                                  ; $afd8 : $a9, $00, $00
	sep #ACCU_8|IDX_8                                                  ; $afdb : $e2, $30
	lda #$13.b                                                  ; $afdd : $a9, $13
	jsr Func_1_802b.l                                                  ; $afdf : $22, $2b, $80, $01

br_3c_afe3:
	sep #IDX_8                                                  ; $afe3 : $e2, $10
	rts                                                  ; $afe5 : $60


Call_3c_afe6:
	rep #IDX_8                                                  ; $afe6 : $c2, $10
	jsr $02d8de.l                                                  ; $afe8 : $22, $de, $d8, $02
	bne br_3c_b024                                                  ; $afec : $d0, $36

	inc $0000.w, X                                                  ; $afee : $fe, $00, $00
	lda #$18.b                                                  ; $aff1 : $a9, $18
	sta $000a.w, X                                                  ; $aff3 : $9d, $0a, $00
	lda $18                                                  ; $aff6 : $a5, $18
	sta $0018.w, X                                                  ; $aff8 : $9d, $18, $00
	lda $11                                                  ; $affb : $a5, $11
	sta $0011.w, X                                                  ; $affd : $9d, $11, $00
	lda $16                                                  ; $b000 : $a5, $16
	sta $0016.w, X                                                  ; $b002 : $9d, $16, $00
	lda #$01.b                                                  ; $b005 : $a9, $01
	sta $000b.w, X                                                  ; $b007 : $9d, $0b, $00
	tya                                                  ; $b00a : $98
	sta $0034.w, X                                                  ; $b00b : $9d, $34, $00
	rep #ACCU_8                                                  ; $b00e : $c2, $20
	lda $05                                                  ; $b010 : $a5, $05
	sta $0005.w, X                                                  ; $b012 : $9d, $05, $00
	lda $08                                                  ; $b015 : $a5, $08
	sta $0008.w, X                                                  ; $b017 : $9d, $08, $00
	tdc                                                  ; $b01a : $7b
	sta $003e.w, X                                                  ; $b01b : $9d, $3e, $00
	stx $3c                                                  ; $b01e : $86, $3c
	sep #ACCU_8|IDX_8                                                  ; $b020 : $e2, $30
	lda #$00.b                                                  ; $b022 : $a9, $00

br_3c_b024:
	sep #IDX_8                                                  ; $b024 : $e2, $10
	rts                                                  ; $b026 : $60


Call_3c_b027:
	rep #IDX_8                                                  ; $b027 : $c2, $10
	jsr todo_XequFree_1818_EntitySlot.l                                                  ; $b029 : $22, $59, $d8, $02
	bne br_3c_b066                                                  ; $b02d : $d0, $37

	inc $0000.w, X                                                  ; $b02f : $fe, $00, $00
	lda #$1e.b                                                  ; $b032 : $a9, $1e
	sta $000a.w, X                                                  ; $b034 : $9d, $0a, $00
	lda $18                                                  ; $b037 : $a5, $18
	sta $0018.w, X                                                  ; $b039 : $9d, $18, $00
	lda $11                                                  ; $b03c : $a5, $11
	sta $0011.w, X                                                  ; $b03e : $9d, $11, $00
	lda $16                                                  ; $b041 : $a5, $16
	sta $0016.w, X                                                  ; $b043 : $9d, $16, $00
	lda #$06.b                                                  ; $b046 : $a9, $06
	sta $0012.w, X                                                  ; $b048 : $9d, $12, $00
	lda #$0d.b                                                  ; $b04b : $a9, $0d
	sta $001e.w, X                                                  ; $b04d : $9d, $1e, $00
	rep #ACCU_8                                                  ; $b050 : $c2, $20
	lda $05                                                  ; $b052 : $a5, $05
	sta $0005.w, X                                                  ; $b054 : $9d, $05, $00
	lda $08                                                  ; $b057 : $a5, $08
	sta $0008.w, X                                                  ; $b059 : $9d, $08, $00
	tdc                                                  ; $b05c : $7b
	sta $001b.w, X                                                  ; $b05d : $9d, $1b, $00
	stx $3e                                                  ; $b060 : $86, $3e
	sep #ACCU_8|IDX_8                                                  ; $b062 : $e2, $30
	lda #$00.b                                                  ; $b064 : $a9, $00

br_3c_b066:
	sep #IDX_8                                                  ; $b066 : $e2, $10
	rts                                                  ; $b068 : $60


Call_3c_b069:
	stz $2a                                                  ; $b069 : $64, $2a
	lda #$ed.b                                                  ; $b06b : $a9, $ed
	sta $29                                                  ; $b06d : $85, $29
	rep #ACCU_8                                                  ; $b06f : $c2, $20
	lda $1a                                                  ; $b071 : $a5, $1a
	sep #ACCU_8                                                  ; $b073 : $e2, $20
	bmi br_3c_b07b                                                  ; $b075 : $30, $04

	lda #$13.b                                                  ; $b077 : $a9, $13
	sta $29                                                  ; $b079 : $85, $29

br_3c_b07b:
	jsr Func_4_be4f.l                                                  ; $b07b : $22, $4f, $be, $04
	and #$7f.b                                                  ; $b07f : $29, $7f
	rts                                                  ; $b081 : $60


Call_3c_b082:
	lda $11                                                  ; $b082 : $a5, $11
	bit #$40.b                                                  ; $b084 : $89, $40
	rep #ACCU_8                                                  ; $b086 : $c2, $20
	beq br_3c_b08f                                                  ; $b088 : $f0, $05

	lda #$0080.w                                                  ; $b08a : $a9, $80, $00
	bra br_3c_b092                                                  ; $b08d : $80, $03

br_3c_b08f:
	lda #$ff80.w                                                  ; $b08f : $a9, $80, $ff

br_3c_b092:
	sta $1a                                                  ; $b092 : $85, $1a
	sep #ACCU_8                                                  ; $b094 : $e2, $20
	rts                                                  ; $b096 : $60


Call_3c_b097:
	lda $11                                                  ; $b097 : $a5, $11
	bit #$40.b                                                  ; $b099 : $89, $40
	rep #ACCU_8                                                  ; $b09b : $c2, $20
	beq br_3c_b0a4                                                  ; $b09d : $f0, $05

	lda #$0080.w                                                  ; $b09f : $a9, $80, $00
	bra br_3c_b0a7                                                  ; $b0a2 : $80, $03

br_3c_b0a4:
	lda #$ff80.w                                                  ; $b0a4 : $a9, $80, $ff

br_3c_b0a7:
	sta $1a                                                  ; $b0a7 : $85, $1a
	sep #ACCU_8                                                  ; $b0a9 : $e2, $20
	rts                                                  ; $b0ab : $60


Call_3c_b0ac:
	lda $11                                                  ; $b0ac : $a5, $11
	eor #$40.b                                                  ; $b0ae : $49, $40
	sta $11                                                  ; $b0b0 : $85, $11
	sta $10                                                  ; $b0b2 : $85, $10
	rep #ACCU_8                                                  ; $b0b4 : $c2, $20
	lda $1a                                                  ; $b0b6 : $a5, $1a
	eor #$ffff.w                                                  ; $b0b8 : $49, $ff, $ff
	ina                                                  ; $b0bb : $1a
	sta $1a                                                  ; $b0bc : $85, $1a
	sep #ACCU_8                                                  ; $b0be : $e2, $20
	rts                                                  ; $b0c0 : $60


Call_3c_b0c1:
	rep #ACCU_8                                                  ; $b0c1 : $c2, $20
	lda $05                                                  ; $b0c3 : $a5, $05
	sec                                                  ; $b0c5 : $38
	sbc $35                                                  ; $b0c6 : $e5, $35
	bpl br_3c_b0ce                                                  ; $b0c8 : $10, $04

	eor #$ffff.w                                                  ; $b0ca : $49, $ff, $ff
	ina                                                  ; $b0cd : $1a

br_3c_b0ce:
	cmp #$0080.w                                                  ; $b0ce : $c9, $80, $00
	sep #ACCU_8                                                  ; $b0d1 : $e2, $20
	bpl br_3c_b0d8                                                  ; $b0d3 : $10, $03

	lda #$00.b                                                  ; $b0d5 : $a9, $00
	rts                                                  ; $b0d7 : $60


br_3c_b0d8:
	lda #$01.b                                                  ; $b0d8 : $a9, $01
	rts                                                  ; $b0da : $60


Call_3c_b0db:
	rep #ACCU_8                                                  ; $b0db : $c2, $20
	lda $05                                                  ; $b0dd : $a5, $05
	sec                                                  ; $b0df : $38
	sbc wPlayerEntity.x.w                                                  ; $b0e0 : $ed, $dd, $09
	bpl br_3c_b0e9                                                  ; $b0e3 : $10, $04

	eor #$ffff.w                                                  ; $b0e5 : $49, $ff, $ff
	ina                                                  ; $b0e8 : $1a

br_3c_b0e9:
	cmp #$0048.w                                                  ; $b0e9 : $c9, $48, $00
	sep #ACCU_8                                                  ; $b0ec : $e2, $20
	bpl br_3c_b0f3                                                  ; $b0ee : $10, $03

	lda #$01.b                                                  ; $b0f0 : $a9, $01
	rts                                                  ; $b0f2 : $60


br_3c_b0f3:
	lda #$00.b                                                  ; $b0f3 : $a9, $00
	rts                                                  ; $b0f5 : $60


Call_3c_b0f6:
	lda $0b                                                  ; $b0f6 : $a5, $0b
	beq br_3c_b102                                                  ; $b0f8 : $f0, $08

	cmp #$01.b                                                  ; $b0fa : $c9, $01
	beq br_3c_b106                                                  ; $b0fc : $f0, $08

	lda #$07.b                                                  ; $b0fe : $a9, $07
	bra br_3c_b108                                                  ; $b100 : $80, $06

br_3c_b102:
	lda #$05.b                                                  ; $b102 : $a9, $05
	bra br_3c_b108                                                  ; $b104 : $80, $02

br_3c_b106:
	lda #$06.b                                                  ; $b106 : $a9, $06

br_3c_b108:
	jsr SetupEntitysAnimation.l                                                  ; $b108 : $22, $67, $b9, $04
	rts                                                  ; $b10c : $60


Call_3c_b10d:
	rep #ACCU_8                                                  ; $b10d : $c2, $20
	lda $08                                                  ; $b10f : $a5, $08
	sec                                                  ; $b111 : $38
	sbc $09e0.w                                                  ; $b112 : $ed, $e0, $09
	bpl br_3c_b11b                                                  ; $b115 : $10, $04

	eor #$ffff.w                                                  ; $b117 : $49, $ff, $ff
	ina                                                  ; $b11a : $1a

br_3c_b11b:
	cmp #$0010.w                                                  ; $b11b : $c9, $10, $00
	sep #ACCU_8                                                  ; $b11e : $e2, $20
	bpl br_3c_b133                                                  ; $b120 : $10, $11

	jsr $04d308.l                                                  ; $b122 : $22, $08, $d3, $04
	and #$10.b                                                  ; $b126 : $29, $10
	asl                                                  ; $b128 : $0a
	asl                                                  ; $b129 : $0a
	eor $11                                                  ; $b12a : $45, $11
	and #$40.b                                                  ; $b12c : $29, $40
	beq br_3c_b133                                                  ; $b12e : $f0, $03

	lda #$01.b                                                  ; $b130 : $a9, $01
	rts                                                  ; $b132 : $60


br_3c_b133:
	lda #$00.b                                                  ; $b133 : $a9, $00
	rts                                                  ; $b135 : $60


Call_3c_b136:
	lda $0b                                                  ; $b136 : $a5, $0b
	beq br_3c_b142                                                  ; $b138 : $f0, $08

	cmp #$04.b                                                  ; $b13a : $c9, $04
	beq br_3c_b142                                                  ; $b13c : $f0, $04

	lda #$03.b                                                  ; $b13e : $a9, $03
	bra br_3c_b144                                                  ; $b140 : $80, $02

br_3c_b142:
	lda #$02.b                                                  ; $b142 : $a9, $02

br_3c_b144:
	jsr SetupEntitysAnimation.l                                                  ; $b144 : $22, $67, $b9, $04
	rts                                                  ; $b148 : $60


Call_3c_b149:
	lda $0b                                                  ; $b149 : $a5, $0b
	beq br_3c_b155                                                  ; $b14b : $f0, $08

	cmp #$01.b                                                  ; $b14d : $c9, $01
	beq br_3c_b159                                                  ; $b14f : $f0, $08

	lda #$04.b                                                  ; $b151 : $a9, $04
	bra br_3c_b15b                                                  ; $b153 : $80, $06

br_3c_b155:
	lda #$00.b                                                  ; $b155 : $a9, $00
	bra br_3c_b108                                                  ; $b157 : $80, $af

br_3c_b159:
	lda #$01.b                                                  ; $b159 : $a9, $01

br_3c_b15b:
	jsr SetupEntitysAnimation.l                                                  ; $b15b : $22, $67, $b9, $04
	rts                                                  ; $b15f : $60


Call_3c_b160:
	rep #ACCU_8|IDX_8                                                  ; $b160 : $c2, $30
	ldx $3c                                                  ; $b162 : $a6, $3c
	lda $05                                                  ; $b164 : $a5, $05
	sta $0005.w, X                                                  ; $b166 : $9d, $05, $00
	lda $08                                                  ; $b169 : $a5, $08
	sta $0008.w, X                                                  ; $b16b : $9d, $08, $00
	sep #ACCU_8                                                  ; $b16e : $e2, $20
	lda $11                                                  ; $b170 : $a5, $11
	sta $0011.w, X                                                  ; $b172 : $9d, $11, $00
	sep #IDX_8                                                  ; $b175 : $e2, $10
	rts                                                  ; $b177 : $60


Call_3c_b178:
	rep #ACCU_8|IDX_8                                                  ; $b178 : $c2, $30
	ldx $39                                                  ; $b17a : $a6, $39
	lda $05                                                  ; $b17c : $a5, $05
	sta $0005.w, X                                                  ; $b17e : $9d, $05, $00
	lda $08                                                  ; $b181 : $a5, $08
	clc                                                  ; $b183 : $18
	adc #$0010.w                                                  ; $b184 : $69, $10, $00
	sta $0008.w, X                                                  ; $b187 : $9d, $08, $00
	sep #ACCU_8                                                  ; $b18a : $e2, $20
	stz $38                                                  ; $b18c : $64, $38
	lda $0011.w, X                                                  ; $b18e : $bd, $11, $00
	and #$3f.b                                                  ; $b191 : $29, $3f
	tsb $38                                                  ; $b193 : $04, $38
	lda $11                                                  ; $b195 : $a5, $11
	and #$80.b                                                  ; $b197 : $29, $80
	tsb $38                                                  ; $b199 : $04, $38
	lda $38                                                  ; $b19b : $a5, $38
	sta $0011.w, X                                                  ; $b19d : $9d, $11, $00
	sep #IDX_8                                                  ; $b1a0 : $e2, $10
	rts                                                  ; $b1a2 : $60


Call_3c_b1a3:
	rep #IDX_8                                                  ; $b1a3 : $c2, $10
	ldx $39                                                  ; $b1a5 : $a6, $39
	lda $0001.w, X                                                  ; $b1a7 : $bd, $01, $00
	sep #IDX_8                                                  ; $b1aa : $e2, $10
	cmp #$04.b                                                  ; $b1ac : $c9, $04
	bne br_3c_b1b3                                                  ; $b1ae : $d0, $03

	lda #$01.b                                                  ; $b1b0 : $a9, $01
	rts                                                  ; $b1b2 : $60


br_3c_b1b3:
	lda #$00.b                                                  ; $b1b3 : $a9, $00
	rts                                                  ; $b1b5 : $60


	ldx $01                                                  ; $b1b6 : $a6, $01
	jsr ($b1bc.w, X)                                                  ; $b1b8 : $fc, $bc, $b1
	rtl                                                  ; $b1bb : $6b


	iny                                                  ; $b1bc : $c8
	lda ($16), Y                                                  ; $b1bd : $b1, $16
	lda ($29)                                                  ; $b1bf : $b2, $29
	lda ($f8)                                                  ; $b1c1 : $b2, $f8
	lda ($0b), Y                                                  ; $b1c3 : $b1, $0b
	lda ($11)                                                  ; $b1c5 : $b2, $11
	lda ($22)                                                  ; $b1c7 : $b2, $22
	jmp $a902e1.l                                                  ; $b1c9 : $5c, $e1, $02, $a9


	cop $85.b                                                  ; $b1cd : $02, $85
	ora ($4a, X)                                                  ; $b1cf : $01, $4a
	sta $30                                                  ; $b1d1 : $85, $30
	stz $02                                                  ; $b1d3 : $64, $02
	lda #$0c.b                                                  ; $b1d5 : $a9, $0c
	sta $12                                                  ; $b1d7 : $85, $12
	ldx $0b                                                  ; $b1d9 : $a6, $0b
	lda $c5f2.w, X                                                  ; $b1db : $bd, $f2, $c5
	sta $35                                                  ; $b1de : $85, $35
	rep #ACCU_8                                                  ; $b1e0 : $c2, $20
	lda $08                                                  ; $b1e2 : $a5, $08
	dea                                                  ; $b1e4 : $3a
	sta $08                                                  ; $b1e5 : $85, $08
	lda #$c5e8.w                                                  ; $b1e7 : $a9, $e8, $c5
	sta $20                                                  ; $b1ea : $85, $20
	sep #ACCU_8                                                  ; $b1ec : $e2, $20
	lda #$00.b                                                  ; $b1ee : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $b1f0 : $22, $67, $b9, $04
	jsr Call_3c_b33f.w                                                  ; $b1f4 : $20, $3f, $b3
	rts                                                  ; $b1f7 : $60


	lda #$02.b                                                  ; $b1f8 : $a9, $02
	sta $01                                                  ; $b1fa : $85, $01
	bra br_3c_b216                                                  ; $b1fc : $80, $18

	lda $33                                                  ; $b1fe : $a5, $33
	bmi br_3c_b206                                                  ; $b200 : $30, $04

	dec $30                                                  ; $b202 : $c6, $30
	bne br_3c_b216                                                  ; $b204 : $d0, $10

br_3c_b206:
	jsr Func_2_db3f.l                                                  ; $b206 : $22, $3f, $db, $02
	rts                                                  ; $b20a : $60


	lda #$02.b                                                  ; $b20b : $a9, $02
	sta $01                                                  ; $b20d : $85, $01
	bra br_3c_b216                                                  ; $b20f : $80, $05

	jsr Func_2_ddf6.l                                                  ; $b211 : $22, $f6, $dd, $02
	rts                                                  ; $b215 : $60


br_3c_b216:
	jsr Func_2_d636.l                                                  ; $b216 : $22, $36, $d6, $02
	jsr Call_3c_b33f.w                                                  ; $b21a : $20, $3f, $b3
	ldx $02                                                  ; $b21d : $a6, $02
	jsr ($b223.w, X)                                                  ; $b21f : $fc, $23, $b2
	rts                                                  ; $b222 : $60


	and ($b2)                                                  ; $b223 : $32, $b2
	phk                                                  ; $b225 : $4b
	lda ($62)                                                  ; $b226 : $b2, $62
	lda ($22)                                                  ; $b228 : $b2, $22
	cpx #$d6.b                                                  ; $b22a : $e0, $d6
	tsb $22                                                  ; $b22c : $04, $22
	plp                                                  ; $b22e : $28
	cmp $6002.w, Y                                                  ; $b22f : $d9, $02, $60
	ldx $0b                                                  ; $b232 : $a6, $0b
	ldy $c5f5.w, X                                                  ; $b234 : $bc, $f5, $c5
	jsr $02da99.l                                                  ; $b237 : $22, $99, $da, $02
	bcc br_3c_b23e                                                  ; $b23b : $90, $01

	rts                                                  ; $b23d : $60


br_3c_b23e:
	lda #$02.b                                                  ; $b23e : $a9, $02
	sta $02                                                  ; $b240 : $85, $02
	lda #$01.b                                                  ; $b242 : $a9, $01
	sta $34                                                  ; $b244 : $85, $34
	lda #$04.b                                                  ; $b246 : $a9, $04
	sta $12                                                  ; $b248 : $85, $12
	rts                                                  ; $b24a : $60


	dec $34                                                  ; $b24b : $c6, $34
	bne br_3c_b261                                                  ; $b24d : $d0, $12

	jsr Call_3c_b2f0.w                                                  ; $b24f : $20, $f0, $b2
	dec $35                                                  ; $b252 : $c6, $35
	beq br_3c_b259                                                  ; $b254 : $f0, $03

	jsr Call_3c_b28b.w                                                  ; $b256 : $20, $8b, $b2

br_3c_b259:
	lda #$40.b                                                  ; $b259 : $a9, $40
	sta $1e                                                  ; $b25b : $85, $1e
	lda #$04.b                                                  ; $b25d : $a9, $04
	sta $02                                                  ; $b25f : $85, $02

br_3c_b261:
	rts                                                  ; $b261 : $60


	lda #$80.b                                                  ; $b262 : $a9, $80
	sta $2c                                                  ; $b264 : $85, $2c
	jsr Func_4_bfae.l                                                  ; $b266 : $22, $ae, $bf, $04
	jsr Func_2_d7c2.l                                                  ; $b26a : $22, $c2, $d7, $02
	lda $2c                                                  ; $b26e : $a5, $2c
	and #$01.b                                                  ; $b270 : $29, $01
	beq br_3c_b278                                                  ; $b272 : $f0, $04

	jsr $04c07f.l                                                  ; $b274 : $22, $7f, $c0, $04

br_3c_b278:
	jsr $04c0f7.l                                                  ; $b278 : $22, $f7, $c0, $04
	lda $2b                                                  ; $b27c : $a5, $2b
	bit #$04.b                                                  ; $b27e : $89, $04
	beq br_3c_b287                                                  ; $b280 : $f0, $05

	lda #$04.b                                                  ; $b282 : $a9, $04
	sta $01                                                  ; $b284 : $85, $01
	rts                                                  ; $b286 : $60


br_3c_b287:
	jsr Call_3c_b32a.w                                                  ; $b287 : $20, $2a, $b3
	rts                                                  ; $b28a : $60


Call_3c_b28b:
	rep #IDX_8                                                  ; $b28b : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $b28d : $22, $a7, $d8, $02
	bne br_3c_b2ed                                                  ; $b291 : $d0, $5a

	inc $0000.w, X                                                  ; $b293 : $fe, $00, $00

Call_3c_b296:
	lda #$39.b                                                  ; $b296 : $a9, $39
	sta $000a.w, X                                                  ; $b298 : $9d, $0a, $00
	lda $18                                                  ; $b29b : $a5, $18
	sta $0018.w, X                                                  ; $b29d : $9d, $18, $00
	lda $16                                                  ; $b2a0 : $a5, $16
	sta $0016.w, X                                                  ; $b2a2 : $9d, $16, $00
	lda $11                                                  ; $b2a5 : $a5, $11
	sta $0011.w, X                                                  ; $b2a7 : $9d, $11, $00
	lda #$02.b                                                  ; $b2aa : $a9, $02
	sta $0001.w, X                                                  ; $b2ac : $9d, $01, $00
	sta $0002.w, X                                                  ; $b2af : $9d, $02, $00
	lda $0b                                                  ; $b2b2 : $a5, $0b
	sta $000b.w, X                                                  ; $b2b4 : $9d, $0b, $00
	lda $35                                                  ; $b2b7 : $a5, $35
	sta $0035.w, X                                                  ; $b2b9 : $9d, $35, $00
	lda #$08.b                                                  ; $b2bc : $a9, $08
	sta $0034.w, X                                                  ; $b2be : $9d, $34, $00
	lda #$40.b                                                  ; $b2c1 : $a9, $40
	sta $001e.w, X                                                  ; $b2c3 : $9d, $1e, $00
	rep #ACCU_8                                                  ; $b2c6 : $c2, $20
	lda $05                                                  ; $b2c8 : $a5, $05
	clc                                                  ; $b2ca : $18
	adc #$0010.w                                                  ; $b2cb : $69, $10, $00
	sta $0005.w, X                                                  ; $b2ce : $9d, $05, $00
	lda $08                                                  ; $b2d1 : $a5, $08
	sta $0008.w, X                                                  ; $b2d3 : $9d, $08, $00
	lda $20                                                  ; $b2d6 : $a5, $20
	sta $0020.w, X                                                  ; $b2d8 : $9d, $20, $00
	stz $001c.w, X                                                  ; $b2db : $9e, $1c, $00
	stz $001a.w, X                                                  ; $b2de : $9e, $1a, $00
	phd                                                  ; $b2e1 : $0b
	txa                                                  ; $b2e2 : $8a
	tcd                                                  ; $b2e3 : $5b
	sep #ACCU_8|IDX_8                                                  ; $b2e4 : $e2, $30
	lda #$00.b                                                  ; $b2e6 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $b2e8 : $22, $67, $b9, $04
	pld                                                  ; $b2ec : $2b

br_3c_b2ed:
	sep #ACCU_8|IDX_8                                                  ; $b2ed : $e2, $30
	rts                                                  ; $b2ef : $60


Call_3c_b2f0:
	rep #ACCU_8|F_CARRY                                                  ; $b2f0 : $c2, $21
	lda $05                                                  ; $b2f2 : $a5, $05
	sta $002c.w                                                  ; $b2f4 : $8d, $2c, $00
	lda $08                                                  ; $b2f7 : $a5, $08
	sta $002e.w                                                  ; $b2f9 : $8d, $2e, $00
	sep #ACCU_8                                                  ; $b2fc : $e2, $20
	ldx $0b                                                  ; $b2fe : $a6, $0b
	lda $c5f2.w, X                                                  ; $b300 : $bd, $f2, $c5
	sec                                                  ; $b303 : $38
	sbc $35                                                  ; $b304 : $e5, $35
	rep #ACCU_8|IDX_8                                                  ; $b306 : $c2, $30
	and #$00ff.w                                                  ; $b308 : $29, $ff, $00
	sta $0000.w                                                  ; $b30b : $8d, $00, $00
	lda $0b                                                  ; $b30e : $a5, $0b
	and #$00ff.w                                                  ; $b310 : $29, $ff, $00
	asl                                                  ; $b313 : $0a
	tax                                                  ; $b314 : $aa
	lda $c5f8.w, X                                                  ; $b315 : $bd, $f8, $c5
	clc                                                  ; $b318 : $18
	adc $0000.w                                                  ; $b319 : $6d, $00, $00
	tax                                                  ; $b31c : $aa

br_3c_b31d:
	lda $0000.w, X                                                  ; $b31d : $bd, $00, $00
	and #$00ff.w                                                  ; $b320 : $29, $ff, $00
	sep #ACCU_8|IDX_8                                                  ; $b323 : $e2, $30
	jsr $02c411.l                                                  ; $b325 : $22, $11, $c4, $02
	rts                                                  ; $b329 : $60


Call_3c_b32a:
	rep #ACCU_8                                                  ; $b32a : $c2, $20
	lda $1c                                                  ; $b32c : $a5, $1c
	cmp #$fc00.w                                                  ; $b32e : $c9, $00, $fc
	bmi br_3c_b33c                                                  ; $b331 : $30, $09

	lda #$fc00.w                                                  ; $b333 : $a9, $00, $fc
	sta $1c                                                  ; $b336 : $85, $1c
	sep #ACCU_8                                                  ; $b338 : $e2, $20
	stz $1e                                                  ; $b33a : $64, $1e

br_3c_b33c:
	sep #ACCU_8                                                  ; $b33c : $e2, $20
	rts                                                  ; $b33e : $60


Call_3c_b33f:
	rep #ACCU_8|IDX_8                                                  ; $b33f : $c2, $30
	phb                                                  ; $b341 : $8b
	ldx #$0320.w                                                  ; $b342 : $a2, $20, $03
	ldy #$04c0.w                                                  ; $b345 : $a0, $c0, $04
	lda #$001f.w                                                  ; $b348 : $a9, $1f, $00
	mvn $00, $00                                                  ; $b34b : $54, $00, $00
	plb                                                  ; $b34e : $ab
	sep #ACCU_8|IDX_8                                                  ; $b34f : $e2, $30
	lda #$01.b                                                  ; $b351 : $a9, $01
	sta wShouldUpdateCGRAM.w                                                  ; $b353 : $8d, $a1, $00
	rts                                                  ; $b356 : $60


	ldx $01                                                  ; $b357 : $a6, $01
	jsr ($b35d.w, X)                                                  ; $b359 : $fc, $5d, $b3
	rtl                                                  ; $b35c : $6b


	adc #$b3.b                                                  ; $b35d : $69, $b3
	asl $b4                                                  ; $b35f : $06, $b4
	rol $b4, X                                                  ; $b361 : $36, $b4
	sbc ($b3), Y                                                  ; $b363 : $f1, $b3
	sbc [$b3], Y                                                  ; $b365 : $f7, $b3
	sbc $22b3.w, X                                                  ; $b367 : $fd, $b3, $22
	jmp $a902e1.l                                                  ; $b36a : $5c, $e1, $02, $a9


	cop $85.b                                                  ; $b36e : $02, $85
	ora ($a9, X)                                                  ; $b370 : $01, $a9
	and #$85.b                                                  ; $b372 : $29, $85
	ora ($85), Y                                                  ; $b374 : $11, $85
	bpl br_3c_b31d                                                  ; $b376 : $10, $a5

	phd                                                  ; $b378 : $0b
	asl                                                  ; $b379 : $0a
	tax                                                  ; $b37a : $aa
	jsr ($b37f.w, X)                                                  ; $b37b : $fc, $7f, $b3
	rts                                                  ; $b37e : $60


	sta [$b3]                                                  ; $b37f : $87, $b3
	cmp $b3                                                  ; $b381 : $c5, $b3
	cmp $b3                                                  ; $b383 : $c5, $b3
	cmp $b3                                                  ; $b385 : $c5, $b3
	lda #$06.b                                                  ; $b387 : $a9, $06
	sta $12                                                  ; $b389 : $85, $12
	stz $02                                                  ; $b38b : $64, $02
	lda #$30.b                                                  ; $b38d : $a9, $30
	sta $27                                                  ; $b38f : $85, $27
	lda #$03.b                                                  ; $b391 : $a9, $03
	sta $26                                                  ; $b393 : $85, $26
	stz $30                                                  ; $b395 : $64, $30
	lda #$02.b                                                  ; $b397 : $a9, $02
	trb $1f5f.w                                                  ; $b399 : $1c, $5f, $1f
	rep #ACCU_8                                                  ; $b39c : $c2, $20
	lda #$0bd0.w                                                  ; $b39e : $a9, $d0, $0b
	sta $05                                                  ; $b3a1 : $85, $05
	lda #$02a8.w                                                  ; $b3a3 : $a9, $a8, $02
	sta $08                                                  ; $b3a6 : $85, $08
	lda #$c6b1.w                                                  ; $b3a8 : $a9, $b1, $c6
	sta $20                                                  ; $b3ab : $85, $20
	sep #ACCU_8                                                  ; $b3ad : $e2, $20
	lda #$00.b                                                  ; $b3af : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $b3b1 : $22, $67, $b9, $04
	ldy #$01.b                                                  ; $b3b5 : $a0, $01
	jsr Call_3c_b4d2.w                                                  ; $b3b7 : $20, $d2, $b4
	ldy #$02.b                                                  ; $b3ba : $a0, $02
	jsr Call_3c_b4d2.w                                                  ; $b3bc : $20, $d2, $b4
	ldy #$03.b                                                  ; $b3bf : $a0, $03
	jsr Call_3c_b4d2.w                                                  ; $b3c1 : $20, $d2, $b4
	rts                                                  ; $b3c4 : $60


	lda #$0c.b                                                  ; $b3c5 : $a9, $0c
	sta $12                                                  ; $b3c7 : $85, $12
	lda #$09.b                                                  ; $b3c9 : $a9, $09
	sta $36                                                  ; $b3cb : $85, $36
	sta $1f58.w                                                  ; $b3cd : $8d, $58, $1f
	lda #$02.b                                                  ; $b3d0 : $a9, $02
	sta $02                                                  ; $b3d2 : $85, $02
	lda #$01.b                                                  ; $b3d4 : $a9, $01
	sta $30                                                  ; $b3d6 : $85, $30
	lda $0b                                                  ; $b3d8 : $a5, $0b
	dea                                                  ; $b3da : $3a
	asl                                                  ; $b3db : $0a
	tay                                                  ; $b3dc : $a8
	rep #ACCU_8                                                  ; $b3dd : $c2, $20
	lda $c6c5.w, Y                                                  ; $b3df : $b9, $c5, $c6
	sta $05                                                  ; $b3e2 : $85, $05
	lda #$0228.w                                                  ; $b3e4 : $a9, $28, $02
	sta $08                                                  ; $b3e7 : $85, $08
	lda #$012c.w                                                  ; $b3e9 : $a9, $2c, $01
	sta $34                                                  ; $b3ec : $85, $34
	sep #ACCU_8                                                  ; $b3ee : $e2, $20
	rts                                                  ; $b3f0 : $60


	lda #$02.b                                                  ; $b3f1 : $a9, $02
	sta $01                                                  ; $b3f3 : $85, $01
	bra br_3c_b406                                                  ; $b3f5 : $80, $0f

	lda #$02.b                                                  ; $b3f7 : $a9, $02
	sta $01                                                  ; $b3f9 : $85, $01
	bra br_3c_b406                                                  ; $b3fb : $80, $09

	lda $10                                                  ; $b3fd : $a5, $10
	tsb $11                                                  ; $b3ff : $04, $11
	jsr Func_2_ddf6.l                                                  ; $b401 : $22, $f6, $dd, $02
	rts                                                  ; $b405 : $60


br_3c_b406:
	lda $10                                                  ; $b406 : $a5, $10
	tsb $11                                                  ; $b408 : $04, $11
	jsr Func_2_d636.l                                                  ; $b40a : $22, $36, $d6, $02
	ldx $02                                                  ; $b40e : $a6, $02
	jsr ($b432.w, X)                                                  ; $b410 : $fc, $32, $b4
	lda $0b                                                  ; $b413 : $a5, $0b
	bne br_3c_b423                                                  ; $b415 : $d0, $0c

	jsr Func_4_cb74.l                                                  ; $b417 : $22, $74, $cb, $04
	beq br_3c_b423                                                  ; $b41b : $f0, $06

	bmi br_3c_b42b                                                  ; $b41d : $30, $0c

	lda #$0e.b                                                  ; $b41f : $a9, $0e
	trb $11                                                  ; $b421 : $14, $11

br_3c_b423:
	rts                                                  ; $b423 : $60


	lda #$04.b                                                  ; $b424 : $a9, $04
	sta $01                                                  ; $b426 : $85, $01
	sta $02                                                  ; $b428 : $85, $02
	rts                                                  ; $b42a : $60


br_3c_b42b:
	lda #$04.b                                                  ; $b42b : $a9, $04
	sta $01                                                  ; $b42d : $85, $01
	stz $02                                                  ; $b42f : $64, $02
	rts                                                  ; $b431 : $60


	pla                                                  ; $b432 : $68
	ldy $82, X                                                  ; $b433 : $b4, $82
	ldy $a5, X                                                  ; $b435 : $b4, $a5
	bpl br_3c_b43d                                                  ; $b437 : $10, $04

	ora ($a5), Y                                                  ; $b439 : $11, $a5
	cop $d0.b                                                  ; $b43b : $02, $d0

br_3c_b43d:
	and $a9                                                  ; $b43d : $25, $a9
	cop $8d.b                                                  ; $b43f : $02, $8d
	.db $00                                                  ; $b441 : $00
	.db $00                                                  ; $b442 : $00
	lda #$2b.b                                                  ; $b443 : $a9, $2b
	sta $0001.w                                                  ; $b445 : $8d, $01, $00
	lda #$00.b                                                  ; $b448 : $a9, $00
	jsr $02d96d.l                                                  ; $b44a : $22, $6d, $d9, $02
	lda #$01.b                                                  ; $b44e : $a9, $01
	jsr $02d96d.l                                                  ; $b450 : $22, $6d, $d9, $02
	lda #$02.b                                                  ; $b454 : $a9, $02
	jsr $02d96d.l                                                  ; $b456 : $22, $6d, $d9, $02
	lda #$03.b                                                  ; $b45a : $a9, $03
	jsr $02d96d.l                                                  ; $b45c : $22, $6d, $d9, $02
	jsr Call_3c_b511.w                                                  ; $b460 : $20, $11, $b5
	jsr todo_DisablesEntity_d928.l                                                  ; $b463 : $22, $28, $d9, $02
	rts                                                  ; $b467 : $60


	jsr AnimateEntity.l                                                  ; $b468 : $22, $4a, $b9, $04
	lda #$80.b                                                  ; $b46c : $a9, $80
	sta $2c                                                  ; $b46e : $85, $2c
	jsr Func_4_bfae.l                                                  ; $b470 : $22, $ae, $bf, $04
	lda $1f5f.w                                                  ; $b474 : $ad, $5f, $1f
	and #$02.b                                                  ; $b477 : $29, $02
	beq br_3c_b481                                                  ; $b479 : $f0, $06

	lda #$04.b                                                  ; $b47b : $a9, $04
	sta $01                                                  ; $b47d : $85, $01
	sta $02                                                  ; $b47f : $85, $02

br_3c_b481:
	rts                                                  ; $b481 : $60


	rep #IDX_8                                                  ; $b482 : $c2, $10
	ldx $3e                                                  ; $b484 : $a6, $3e
	lda $0000.w, X                                                  ; $b486 : $bd, $00, $00
	beq br_3c_b4c9                                                  ; $b489 : $f0, $3e

	lda $0001.w, X                                                  ; $b48b : $bd, $01, $00
	cmp #$04.b                                                  ; $b48e : $c9, $04
	beq br_3c_b4c9                                                  ; $b490 : $f0, $37

	sep #IDX_8                                                  ; $b492 : $e2, $10
	rep #ACCU_8                                                  ; $b494 : $c2, $20
	dec $34                                                  ; $b496 : $c6, $34
	bne br_3c_b4c6                                                  ; $b498 : $d0, $2c

	lda #$012c.w                                                  ; $b49a : $a9, $2c, $01
	sta $34                                                  ; $b49d : $85, $34
	sep #ACCU_8                                                  ; $b49f : $e2, $20
	jsr Call_3c_b4f1.w                                                  ; $b4a1 : $20, $f1, $b4
	inc $09fa.w                                                  ; $b4a4 : $ee, $fa, $09
	lda #$49.b                                                  ; $b4a7 : $a9, $49
	jsr Func_1_802b.l                                                  ; $b4a9 : $22, $2b, $80, $01
	lda #$10.b                                                  ; $b4ad : $a9, $10
	jsr $04d599.l                                                  ; $b4af : $22, $99, $d5, $04
	dec $36                                                  ; $b4b3 : $c6, $36
	beq br_3c_b4c9                                                  ; $b4b5 : $f0, $12

	lda $36                                                  ; $b4b7 : $a5, $36
	sta $1f58.w                                                  ; $b4b9 : $8d, $58, $1f
	rep #ACCU_8                                                  ; $b4bc : $c2, $20
	lda $08                                                  ; $b4be : $a5, $08
	clc                                                  ; $b4c0 : $18
	adc #$0010.w                                                  ; $b4c1 : $69, $10, $00
	sta $08                                                  ; $b4c4 : $85, $08

br_3c_b4c6:
	sep #ACCU_8                                                  ; $b4c6 : $e2, $20
	rts                                                  ; $b4c8 : $60


br_3c_b4c9:
	sep #IDX_8                                                  ; $b4c9 : $e2, $10
	lda #$04.b                                                  ; $b4cb : $a9, $04
	sta $01                                                  ; $b4cd : $85, $01
	sta $02                                                  ; $b4cf : $85, $02
	rts                                                  ; $b4d1 : $60


Call_3c_b4d2:
	rep #IDX_8                                                  ; $b4d2 : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $b4d4 : $22, $a7, $d8, $02
	bne br_3c_b4ee                                                  ; $b4d8 : $d0, $14

	inc $0000.w, X                                                  ; $b4da : $fe, $00, $00
	lda #$3e.b                                                  ; $b4dd : $a9, $3e
	sta $000a.w, X                                                  ; $b4df : $9d, $0a, $00
	tya                                                  ; $b4e2 : $98
	sta $000b.w, X                                                  ; $b4e3 : $9d, $0b, $00
	rep #ACCU_8                                                  ; $b4e6 : $c2, $20
	tdc                                                  ; $b4e8 : $7b
	sta $003e.w, X                                                  ; $b4e9 : $9d, $3e, $00
	stx $3e                                                  ; $b4ec : $86, $3e

br_3c_b4ee:
	sep #ACCU_8|IDX_8                                                  ; $b4ee : $e2, $30
	rts                                                  ; $b4f0 : $60


Call_3c_b4f1:
	rep #ACCU_8                                                  ; $b4f1 : $c2, $20
	lda $05                                                  ; $b4f3 : $a5, $05
	sec                                                  ; $b4f5 : $38
	sbc #$0048.w                                                  ; $b4f6 : $e9, $48, $00
	sta $002c.w                                                  ; $b4f9 : $8d, $2c, $00
	lda $08                                                  ; $b4fc : $a5, $08
	sec                                                  ; $b4fe : $38
	sbc #$0020.w                                                  ; $b4ff : $e9, $20, $00
	sta $002e.w                                                  ; $b502 : $8d, $2e, $00
	and #$00ff.w                                                  ; $b505 : $29, $ff, $00
	sep #ACCU_8                                                  ; $b508 : $e2, $20
	lda #$09.b                                                  ; $b50a : $a9, $09
	jsr $02c411.l                                                  ; $b50c : $22, $11, $c4, $02
	rts                                                  ; $b510 : $60


Call_3c_b511:
	php                                                  ; $b511 : $08
	sep #ACCU_8|IDX_8                                                  ; $b512 : $e2, $30
	lda #$00.b                                                  ; $b514 : $a9, $00
	tax                                                  ; $b516 : $aa
	rep #ACCU_8                                                  ; $b517 : $c2, $20

br_3c_b519:
	lda $c6bb.w, X                                                  ; $b519 : $bd, $bb, $c6
	beq br_3c_b528                                                  ; $b51c : $f0, $0a

	phx                                                  ; $b51e : $da
	jsr $02ded5.l                                                  ; $b51f : $22, $d5, $de, $02
	plx                                                  ; $b523 : $fa
	inx                                                  ; $b524 : $e8
	inx                                                  ; $b525 : $e8
	bra br_3c_b519                                                  ; $b526 : $80, $f1

br_3c_b528:
	plp                                                  ; $b528 : $28
	rts                                                  ; $b529 : $60


	ldx $01                                                  ; $b52a : $a6, $01
	jsr ($b530.w, X)                                                  ; $b52c : $fc, $30, $b5
	rtl                                                  ; $b52f : $6b


	and $61b5.w, Y                                                  ; $b530 : $39, $b5, $61
	lda $9e, X                                                  ; $b533 : $b5, $9e
	lda $dc, X                                                  ; $b535 : $b5, $dc
	lda $60, X                                                  ; $b537 : $b5, $60
	rep #ACCU_8                                                  ; $b539 : $c2, $20
	lda wPlayerEntity.x.w                                                  ; $b53b : $ad, $dd, $09
	sec                                                  ; $b53e : $38
	sbc #$0930.w                                                  ; $b53f : $e9, $30, $09
	bpl br_3c_b54d                                                  ; $b542 : $10, $09

	sep #ACCU_8                                                  ; $b544 : $e2, $20
	lda $1f53.w                                                  ; $b546 : $ad, $53, $1f
	bit #$01.b                                                  ; $b549 : $89, $01
	bne br_3c_b554                                                  ; $b54b : $d0, $07

br_3c_b54d:
	sep #ACCU_8                                                  ; $b54d : $e2, $20
	lda #$06.b                                                  ; $b54f : $a9, $06
	sta $01                                                  ; $b551 : $85, $01
	rts                                                  ; $b553 : $60


br_3c_b554:
	lda #$05.b                                                  ; $b554 : $a9, $05
	sta $35                                                  ; $b556 : $85, $35
	lda #$06.b                                                  ; $b558 : $a9, $06
	sta $3d                                                  ; $b55a : $85, $3d
	lda #$02.b                                                  ; $b55c : $a9, $02
	sta $01                                                  ; $b55e : $85, $01
	rts                                                  ; $b560 : $60


	sep #ACCU_8                                                  ; $b561 : $e2, $20
	dec $35                                                  ; $b563 : $c6, $35
	bmi br_3c_b593                                                  ; $b565 : $30, $2c

	lda $35                                                  ; $b567 : $a5, $35
	asl                                                  ; $b569 : $0a
	tay                                                  ; $b56a : $a8
	rep #ACCU_8                                                  ; $b56b : $c2, $20
	lda #$0938.w                                                  ; $b56d : $a9, $38, $09
	clc                                                  ; $b570 : $18
	adc $c8b2.w, Y                                                  ; $b571 : $79, $b2, $c8
	sta $05                                                  ; $b574 : $85, $05
	lda #$06bf.w                                                  ; $b576 : $a9, $bf, $06
	sec                                                  ; $b579 : $38
	sbc $c8bc.w, Y                                                  ; $b57a : $f9, $bc, $c8
	sta $08                                                  ; $b57d : $85, $08
	sep #ACCU_8                                                  ; $b57f : $e2, $20
	lda $3d                                                  ; $b581 : $a5, $3d
	cmp #$05.b                                                  ; $b583 : $c9, $05
	bne br_3c_b58b                                                  ; $b585 : $d0, $04

	lda #$06.b                                                  ; $b587 : $a9, $06
	bra br_3c_b58d                                                  ; $b589 : $80, $02

br_3c_b58b:
	lda #$05.b                                                  ; $b58b : $a9, $05

br_3c_b58d:
	sta $3d                                                  ; $b58d : $85, $3d
	jsr Call_3c_b5e1.w                                                  ; $b58f : $20, $e1, $b5
	rts                                                  ; $b592 : $60


br_3c_b593:
	lda #$04.b                                                  ; $b593 : $a9, $04
	sta $01                                                  ; $b595 : $85, $01
	lda #$05.b                                                  ; $b597 : $a9, $05
	sta $35                                                  ; $b599 : $85, $35
	stz $34                                                  ; $b59b : $64, $34
	rts                                                  ; $b59d : $60


	sep #ACCU_8|IDX_8                                                  ; $b59e : $e2, $30
	dec $34                                                  ; $b5a0 : $c6, $34
	bpl br_3c_b5ac                                                  ; $b5a2 : $10, $08

	dec $35                                                  ; $b5a4 : $c6, $35
	bmi br_3c_b5d2                                                  ; $b5a6 : $30, $2a

	lda #$07.b                                                  ; $b5a8 : $a9, $07
	sta $34                                                  ; $b5aa : $85, $34

br_3c_b5ac:
	lda $34                                                  ; $b5ac : $a5, $34
	asl                                                  ; $b5ae : $0a
	tax                                                  ; $b5af : $aa
	lda $35                                                  ; $b5b0 : $a5, $35
	asl                                                  ; $b5b2 : $0a
	tay                                                  ; $b5b3 : $a8
	rep #ACCU_8                                                  ; $b5b4 : $c2, $20
	lda #$0948.w                                                  ; $b5b6 : $a9, $48, $09
	clc                                                  ; $b5b9 : $18
	adc $c8c6.w, X                                                  ; $b5ba : $7d, $c6, $c8
	sta $05                                                  ; $b5bd : $85, $05
	lda #$06bf.w                                                  ; $b5bf : $a9, $bf, $06
	sec                                                  ; $b5c2 : $38
	sbc $c8bc.w, Y                                                  ; $b5c3 : $f9, $bc, $c8
	sta $08                                                  ; $b5c6 : $85, $08
	sep #ACCU_8                                                  ; $b5c8 : $e2, $20
	lda #$0b.b                                                  ; $b5ca : $a9, $0b
	sta $3d                                                  ; $b5cc : $85, $3d
	jsr Call_3c_b5e1.w                                                  ; $b5ce : $20, $e1, $b5
	rts                                                  ; $b5d1 : $60


br_3c_b5d2:
	lda #$06.b                                                  ; $b5d2 : $a9, $06
	sta $01                                                  ; $b5d4 : $85, $01
	lda #$01.b                                                  ; $b5d6 : $a9, $01
	trb $1f53.w                                                  ; $b5d8 : $1c, $53, $1f
	rts                                                  ; $b5db : $60


	jsr Func_2_d917.l                                                  ; $b5dc : $22, $17, $d9, $02
	rts                                                  ; $b5e0 : $60


Call_3c_b5e1:
	rep #ACCU_8|F_CARRY                                                  ; $b5e1 : $c2, $21
	lda $05                                                  ; $b5e3 : $a5, $05
	sta $002c.w                                                  ; $b5e5 : $8d, $2c, $00
	sec                                                  ; $b5e8 : $38
	lda $08                                                  ; $b5e9 : $a5, $08
	sbc #$0038.w                                                  ; $b5eb : $e9, $38, $00
	sta $002e.w                                                  ; $b5ee : $8d, $2e, $00
	and #$00ff.w                                                  ; $b5f1 : $29, $ff, $00
	sep #ACCU_8                                                  ; $b5f4 : $e2, $20
	lda $3d                                                  ; $b5f6 : $a5, $3d
	jsr $02c411.l                                                  ; $b5f8 : $22, $11, $c4, $02
	rts                                                  ; $b5fc : $60


	ldx $01                                                  ; $b5fd : $a6, $01
	jsr ($b603.w, X)                                                  ; $b5ff : $fc, $03, $b6
	rtl                                                  ; $b602 : $6b


	ora $b8e7b6.l                                                  ; $b603 : $0f, $b6, $e7, $b8
	tyx                                                  ; $b607 : $bb
	tyx                                                  ; $b608 : $bb
	plb                                                  ; $b609 : $ab
	clv                                                  ; $b60a : $b8
	clv                                                  ; $b60b : $b8
	clv                                                  ; $b60c : $b8
	ldx $a6b8.w, Y                                                  ; $b60d : $be, $b8, $a6
	cop $fc.b                                                  ; $b610 : $02, $fc
	ora $b6, X                                                  ; $b612 : $15, $b6
	rts                                                  ; $b614 : $60


	and wBG1HorizScroll+1                                                  ; $b615 : $25, $b6
	lsr $f1b6.w, X                                                  ; $b617 : $5e, $b6, $f1
	ldx $b5, Y                                                  ; $b61a : $b6, $b5
	lda [$e7], Y                                                  ; $b61c : $b7, $e7
	lda [$1b], Y                                                  ; $b61e : $b7, $1b
	clv                                                  ; $b620 : $b8
	eor $7bb8.w                                                  ; $b621 : $4d, $b8, $7b
	clv                                                  ; $b624 : $b8
	lda #$27.b                                                  ; $b625 : $a9, $27
	jsr Func_0_84bc.l                                                  ; $b627 : $22, $bc, $84, $00
	rep #ACCU_8|IDX_8                                                  ; $b62b : $c2, $30
	phb                                                  ; $b62d : $8b
	ldx #$0300.w                                                  ; $b62e : $a2, $00, $03
	ldy #$cb40.w                                                  ; $b631 : $a0, $40, $cb
	lda #$00ff.w                                                  ; $b634 : $a9, $ff, $00
	mvn $00, $7f                                                  ; $b637 : $54, $7f, $00
	plb                                                  ; $b63a : $ab
	ldx #$00ff.w                                                  ; $b63b : $a2, $ff, $00
	lda #$0000.w                                                  ; $b63e : $a9, $00, $00

br_3c_b641:
	sta $7fc940.l, X                                                  ; $b641 : $9f, $40, $c9, $7f
	dex                                                  ; $b645 : $ca
	dex                                                  ; $b646 : $ca
	bpl br_3c_b641                                                  ; $b647 : $10, $f8

	sep #ACCU_8|IDX_8                                                  ; $b649 : $e2, $30
	lda $1f5f.w                                                  ; $b64b : $ad, $5f, $1f
	ora #$80.b                                                  ; $b64e : $09, $80
	sta $1f5f.w                                                  ; $b650 : $8d, $5f, $1f
	lda #$02.b                                                  ; $b653 : $a9, $02
	sta $02                                                  ; $b655 : $85, $02
	stz $3b                                                  ; $b657 : $64, $3b
	jsr todo_CausePlayerToFreeze.l                                                  ; $b659 : $22, $ca, $d1, $04
	rts                                                  ; $b65d : $60


	lda $3b                                                  ; $b65e : $a5, $3b
	bne br_3c_b666                                                  ; $b660 : $d0, $04

	jsr Call_3c_be8f.w                                                  ; $b662 : $20, $8f, $be
	rts                                                  ; $b665 : $60


br_3c_b666:
	jsr LoadCurrEnemyBaseData.l                                                  ; $b666 : $22, $5c, $e1, $02
	stz $27                                                  ; $b66a : $64, $27
	lda #$0c.b                                                  ; $b66c : $a9, $0c
	sta $12                                                  ; $b66e : $85, $12
	lda #$39.b                                                  ; $b670 : $a9, $39
	sta $11                                                  ; $b672 : $85, $11
	sta $38                                                  ; $b674 : $85, $38
	lda $28                                                  ; $b676 : $a5, $28
	sta $1f57.w                                                  ; $b678 : $8d, $57, $1f
	rep #ACCU_8|F_CARRY                                                  ; $b67b : $c2, $21
	lda #$0100.w                                                  ; $b67d : $a9, $00, $01
	adc wNewStageScrollX.w                                                  ; $b680 : $6d, $5d, $1e
	sta $05                                                  ; $b683 : $85, $05
	sta $7fcd92.l                                                  ; $b685 : $8f, $92, $cd, $7f
	lda #$0118.w                                                  ; $b689 : $a9, $18, $01
	clc                                                  ; $b68c : $18
	adc wNewStageScrollY.w                                                  ; $b68d : $6d, $60, $1e
	sta $08                                                  ; $b690 : $85, $08
	sta $7fcd94.l                                                  ; $b692 : $8f, $94, $cd, $7f
	lda #$c92c.w                                                  ; $b696 : $a9, $2c, $c9
	sta $20                                                  ; $b699 : $85, $20
	sep #ACCU_8                                                  ; $b69b : $e2, $20
	jsr $04d1ef.l                                                  ; $b69d : $22, $ef, $d1, $04
	lda #$0c.b                                                  ; $b6a1 : $a9, $0c
	sta $1e99.w                                                  ; $b6a3 : $8d, $99, $1e
	phd                                                  ; $b6a6 : $0b
	pea $0000.w                                                  ; $b6a7 : $f4, $00, $00
	pld                                                  ; $b6aa : $2b
	lda #$d8.b                                                  ; $b6ab : $a9, $d8
	sta $00f2.w                                                  ; $b6ad : $8d, $f2, $00
	jsr $00b4ff.l                                                  ; $b6b0 : $22, $ff, $b4, $00
	pld                                                  ; $b6b4 : $2b
	lda #$59.b                                                  ; $b6b5 : $a9, $59
	sta BG2SC.w                                                  ; $b6b7 : $8d, $08, $21
	lda #$17.b                                                  ; $b6ba : $a9, $17
	sta wMainScreenDesignation.w                                                  ; $b6bc : $8d, $c1, $00
	lda #$13.b                                                  ; $b6bf : $a9, $13
	sta wSubScreenDesignation.w                                                  ; $b6c1 : $8d, $c2, $00
	stz wBG2HorizScroll.w                                                  ; $b6c4 : $9c, $b9, $00
	stz wBG2VertScroll.w                                                  ; $b6c7 : $9c, $bb, $00
	rep #ACCU_8                                                  ; $b6ca : $c2, $20
	jsr Call_3c_bdc6.w                                                  ; $b6cc : $20, $c6, $bd
	lda #$1200.w                                                  ; $b6cf : $a9, $00, $12
	jsr $04d24b.l                                                  ; $b6d2 : $22, $4b, $d2, $04
	sep #ACCU_8                                                  ; $b6d6 : $e2, $20
	lda #$04.b                                                  ; $b6d8 : $a9, $04
	sta $02                                                  ; $b6da : $85, $02
	stz $01                                                  ; $b6dc : $64, $01
	stz $03                                                  ; $b6de : $64, $03
	lda #$00.b                                                  ; $b6e0 : $a9, $00
	sta $7fcd90.l                                                  ; $b6e2 : $8f, $90, $cd, $7f
	lda #$06.b                                                  ; $b6e6 : $a9, $06
	jsr SetupEntitysAnimation.l                                                  ; $b6e8 : $22, $67, $b9, $04
	jsr AnimateEntity.l                                                  ; $b6ec : $22, $4a, $b9, $04
	rts                                                  ; $b6f0 : $60


	jsr Call_3c_bdc6.w                                                  ; $b6f1 : $20, $c6, $bd
	ldx $03                                                  ; $b6f4 : $a6, $03
	jsr ($b702.w, X)                                                  ; $b6f6 : $fc, $02, $b7
	jsr Func_2_d636.l                                                  ; $b6f9 : $22, $36, $d6, $02
	jsr AnimateEntity.l                                                  ; $b6fd : $22, $4a, $b9, $04
	rts                                                  ; $b701 : $60


	php                                                  ; $b702 : $08
	lda [$5b], Y                                                  ; $b703 : $b7, $5b
	lda [$74], Y                                                  ; $b705 : $b7, $74
	lda [$c2], Y                                                  ; $b707 : $b7, $c2
	jsr wJoy1CurrButtonsHeld.w+1                                                  ; $b709 : $20, $a9, $00
	ora ($38)                                                  ; $b70c : $12, $38
	sbc #$08.b                                                  ; $b70e : $e9, $08
	.db $00                                                  ; $b710 : $00
	cmp wPlayerEntity.x.w                                                  ; $b711 : $cd, $dd, $09
	bcs br_3c_b758                                                  ; $b714 : $b0, $42

	sta wPlayerEntity.x.w                                                  ; $b716 : $8d, $dd, $09
	jsr $04d169.l                                                  ; $b719 : $22, $69, $d1, $04
	tdc                                                  ; $b71d : $7b
	sta $1f1f.w                                                  ; $b71e : $8d, $1f, $1f
	sep #ACCU_8                                                  ; $b721 : $e2, $20
	jsr todo_CausePlayerToFreeze.l                                                  ; $b723 : $22, $ca, $d1, $04
	lda #$02.b                                                  ; $b727 : $a9, $02
	sta $03                                                  ; $b729 : $85, $03
	ldy #$01.b                                                  ; $b72b : $a0, $01
	jsr Call_3c_bc31.w                                                  ; $b72d : $20, $31, $bc
	ldy #$02.b                                                  ; $b730 : $a0, $02
	jsr Call_3c_bc31.w                                                  ; $b732 : $20, $31, $bc
	ldy #$03.b                                                  ; $b735 : $a0, $03
	jsr Call_3c_bc31.w                                                  ; $b737 : $20, $31, $bc
	ldy #$04.b                                                  ; $b73a : $a0, $04
	jsr Call_3c_bc61.w                                                  ; $b73c : $20, $61, $bc
	ldy #$05.b                                                  ; $b73f : $a0, $05
	jsr Call_3c_bc61.w                                                  ; $b741 : $20, $61, $bc
	rep #ACCU_8|IDX_8                                                  ; $b744 : $c2, $30
	phb                                                  ; $b746 : $8b
	ldx #$cb40.w                                                  ; $b747 : $a2, $40, $cb
	ldy #$c940.w                                                  ; $b74a : $a0, $40, $c9
	lda #$00ff.w                                                  ; $b74d : $a9, $ff, $00
	mvn $7f, $7f                                                  ; $b750 : $54, $7f, $7f
	plb                                                  ; $b753 : $ab
	sep #ACCU_8|IDX_8                                                  ; $b754 : $e2, $30
	stz $3b                                                  ; $b756 : $64, $3b

br_3c_b758:
	sep #ACCU_8                                                  ; $b758 : $e2, $20
	rts                                                  ; $b75a : $60


	lda $3b                                                  ; $b75b : $a5, $3b
	bne br_3c_b763                                                  ; $b75d : $d0, $04

	jsr Call_3c_be8f.w                                                  ; $b75f : $20, $8f, $be
	rts                                                  ; $b762 : $60


br_3c_b763:
	lda $1f5f.w                                                  ; $b763 : $ad, $5f, $1f
	and #$7f.b                                                  ; $b766 : $29, $7f
	sta $1f5f.w                                                  ; $b768 : $8d, $5f, $1f
	lda #$04.b                                                  ; $b76b : $a9, $04
	sta $03                                                  ; $b76d : $85, $03
	lda #$02.b                                                  ; $b76f : $a9, $02
	sta $39                                                  ; $b771 : $85, $39
	rts                                                  ; $b773 : $60


	dec $39                                                  ; $b774 : $c6, $39
	bne br_3c_b7b4                                                  ; $b776 : $d0, $3c

	lda #$02.b                                                  ; $b778 : $a9, $02
	sta $39                                                  ; $b77a : $85, $39
	lda $27                                                  ; $b77c : $a5, $27
	and #$7f.b                                                  ; $b77e : $29, $7f
	cmp #$20.b                                                  ; $b780 : $c9, $20
	beq br_3c_b79e                                                  ; $b782 : $f0, $1a

	ina                                                  ; $b784 : $1a
	ora #$80.b                                                  ; $b785 : $09, $80
	sta $27                                                  ; $b787 : $85, $27
	lda #$01.b                                                  ; $b789 : $a9, $01
	sta $2f                                                  ; $b78b : $85, $2f
	rep #ACCU_8                                                  ; $b78d : $c2, $20
	lda #$01c8.w                                                  ; $b78f : $a9, $c8, $01
	sta $1e78.w                                                  ; $b792 : $8d, $78, $1e
	sep #ACCU_8                                                  ; $b795 : $e2, $20
	lda #$15.b                                                  ; $b797 : $a9, $15
	jsr Func_1_802b.l                                                  ; $b799 : $22, $2b, $80, $01
	rts                                                  ; $b79d : $60


br_3c_b79e:
	lda #$02.b                                                  ; $b79e : $a9, $02
	sta $01                                                  ; $b7a0 : $85, $01
	stz $02                                                  ; $b7a2 : $64, $02
	stz $03                                                  ; $b7a4 : $64, $03
	lda #$1e.b                                                  ; $b7a6 : $a9, $1e
	sta $39                                                  ; $b7a8 : $85, $39
	jsr $04d1ef.l                                                  ; $b7aa : $22, $ef, $d1, $04
	lda #$1a.b                                                  ; $b7ae : $a9, $1a
	jsr Func_0_84bc.l                                                  ; $b7b0 : $22, $bc, $84, $00

br_3c_b7b4:
	rts                                                  ; $b7b4 : $60


	jsr LoadCurrEnemyBaseData.l                                                  ; $b7b5 : $22, $5c, $e1, $02
	lda #$02.b                                                  ; $b7b9 : $a9, $02
	sta $12                                                  ; $b7bb : $85, $12
	lda #$01.b                                                  ; $b7bd : $a9, $01
	sta $30                                                  ; $b7bf : $85, $30
	lda #$39.b                                                  ; $b7c1 : $a9, $39
	sta $11                                                  ; $b7c3 : $85, $11
	sta $38                                                  ; $b7c5 : $85, $38
	lda #$00.b                                                  ; $b7c7 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $b7c9 : $22, $67, $b9, $04
	jsr Call_3c_be2a.w                                                  ; $b7cd : $20, $2a, $be
	rep #ACCU_8|F_CARRY                                                  ; $b7d0 : $c2, $21
	lda #$0118.w                                                  ; $b7d2 : $a9, $18, $01
	adc #$00ec.w                                                  ; $b7d5 : $69, $ec, $00
	sta $08                                                  ; $b7d8 : $85, $08
	sep #ACCU_8                                                  ; $b7da : $e2, $20
	lda #$04.b                                                  ; $b7dc : $a9, $04
	sta $02                                                  ; $b7de : $85, $02
	stz $03                                                  ; $b7e0 : $64, $03
	lda #$02.b                                                  ; $b7e2 : $a9, $02
	sta $01                                                  ; $b7e4 : $85, $01
	rts                                                  ; $b7e6 : $60


	jsr LoadCurrEnemyBaseData.l                                                  ; $b7e7 : $22, $5c, $e1, $02
	lda #$02.b                                                  ; $b7eb : $a9, $02
	sta $12                                                  ; $b7ed : $85, $12
	lda #$01.b                                                  ; $b7ef : $a9, $01
	sta $30                                                  ; $b7f1 : $85, $30
	lda #$39.b                                                  ; $b7f3 : $a9, $39
	eor #$40.b                                                  ; $b7f5 : $49, $40
	sta $11                                                  ; $b7f7 : $85, $11
	sta $38                                                  ; $b7f9 : $85, $38
	lda #$00.b                                                  ; $b7fb : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $b7fd : $22, $67, $b9, $04
	jsr Call_3c_be2a.w                                                  ; $b801 : $20, $2a, $be
	rep #ACCU_8|F_CARRY                                                  ; $b804 : $c2, $21
	lda #$0118.w                                                  ; $b806 : $a9, $18, $01
	adc #$00ec.w                                                  ; $b809 : $69, $ec, $00
	sta $08                                                  ; $b80c : $85, $08
	sep #ACCU_8                                                  ; $b80e : $e2, $20
	lda #$04.b                                                  ; $b810 : $a9, $04
	sta $02                                                  ; $b812 : $85, $02
	stz $03                                                  ; $b814 : $64, $03
	lda #$02.b                                                  ; $b816 : $a9, $02
	sta $01                                                  ; $b818 : $85, $01
	rts                                                  ; $b81a : $60


	jsr LoadCurrEnemyBaseData.l                                                  ; $b81b : $22, $5c, $e1, $02
	lda #$02.b                                                  ; $b81f : $a9, $02
	sta $12                                                  ; $b821 : $85, $12
	lda #$01.b                                                  ; $b823 : $a9, $01
	sta $30                                                  ; $b825 : $85, $30
	lda #$39.b                                                  ; $b827 : $a9, $39
	sta $11                                                  ; $b829 : $85, $11
	sta $38                                                  ; $b82b : $85, $38
	lda #$03.b                                                  ; $b82d : $a9, $03
	jsr SetupEntitysAnimation.l                                                  ; $b82f : $22, $67, $b9, $04
	jsr Call_3c_be2a.w                                                  ; $b833 : $20, $2a, $be
	rep #ACCU_8|F_CARRY                                                  ; $b836 : $c2, $21
	lda #$0118.w                                                  ; $b838 : $a9, $18, $01
	adc #$014c.w                                                  ; $b83b : $69, $4c, $01
	sta $08                                                  ; $b83e : $85, $08
	sep #ACCU_8                                                  ; $b840 : $e2, $20
	lda #$02.b                                                  ; $b842 : $a9, $02
	sta $02                                                  ; $b844 : $85, $02
	stz $03                                                  ; $b846 : $64, $03
	lda #$02.b                                                  ; $b848 : $a9, $02
	sta $01                                                  ; $b84a : $85, $01
	rts                                                  ; $b84c : $60


	lda #$02.b                                                  ; $b84d : $a9, $02
	sta $12                                                  ; $b84f : $85, $12
	lda #$01.b                                                  ; $b851 : $a9, $01
	sta $30                                                  ; $b853 : $85, $30
	lda #$39.b                                                  ; $b855 : $a9, $39
	sta $11                                                  ; $b857 : $85, $11
	sta $38                                                  ; $b859 : $85, $38
	lda #$00.b                                                  ; $b85b : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $b85d : $22, $67, $b9, $04
	jsr Call_3c_be2a.w                                                  ; $b861 : $20, $2a, $be
	rep #ACCU_8|F_CARRY                                                  ; $b864 : $c2, $21
	lda #$0118.w                                                  ; $b866 : $a9, $18, $01
	adc #$011c.w                                                  ; $b869 : $69, $1c, $01
	sta $08                                                  ; $b86c : $85, $08
	sep #ACCU_8                                                  ; $b86e : $e2, $20
	lda #$06.b                                                  ; $b870 : $a9, $06
	sta $02                                                  ; $b872 : $85, $02
	sta $03                                                  ; $b874 : $85, $03
	lda #$02.b                                                  ; $b876 : $a9, $02
	sta $01                                                  ; $b878 : $85, $01
	rts                                                  ; $b87a : $60


	lda #$02.b                                                  ; $b87b : $a9, $02
	sta $12                                                  ; $b87d : $85, $12
	lda #$01.b                                                  ; $b87f : $a9, $01
	sta $30                                                  ; $b881 : $85, $30
	lda #$39.b                                                  ; $b883 : $a9, $39
	eor #$40.b                                                  ; $b885 : $49, $40
	sta $11                                                  ; $b887 : $85, $11
	sta $38                                                  ; $b889 : $85, $38
	lda #$00.b                                                  ; $b88b : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $b88d : $22, $67, $b9, $04
	jsr Call_3c_be2a.w                                                  ; $b891 : $20, $2a, $be
	rep #ACCU_8                                                  ; $b894 : $c2, $20
	lda #$0118.w                                                  ; $b896 : $a9, $18, $01
	adc #$011c.w                                                  ; $b899 : $69, $1c, $01
	sta $08                                                  ; $b89c : $85, $08
	sep #ACCU_8                                                  ; $b89e : $e2, $20
	lda #$06.b                                                  ; $b8a0 : $a9, $06
	sta $02                                                  ; $b8a2 : $85, $02
	sta $03                                                  ; $b8a4 : $85, $03
	lda #$02.b                                                  ; $b8a6 : $a9, $02
	sta $01                                                  ; $b8a8 : $85, $01
	rts                                                  ; $b8aa : $60


	lda $33                                                  ; $b8ab : $a5, $33
	bmi br_3c_b8b3                                                  ; $b8ad : $30, $04

	dec $30                                                  ; $b8af : $c6, $30
	bne br_3c_b8bc                                                  ; $b8b1 : $d0, $09

br_3c_b8b3:
	jsr Func_2_db3f.l                                                  ; $b8b3 : $22, $3f, $db, $02
	rts                                                  ; $b8b7 : $60


	lda #$02.b                                                  ; $b8b8 : $a9, $02
	sta $02                                                  ; $b8ba : $85, $02

br_3c_b8bc:
	bra br_3c_b8e7                                                  ; $b8bc : $80, $29

	jsr Func_2_ddfe.l                                                  ; $b8be : $22, $fe, $dd, $02
	lda $01                                                  ; $b8c2 : $a5, $01
	cmp #$04.b                                                  ; $b8c4 : $c9, $04
	beq br_3c_b8d4                                                  ; $b8c6 : $f0, $0c

	lda $0b                                                  ; $b8c8 : $a5, $0b
	bne br_3c_b8d2                                                  ; $b8ca : $d0, $06

	lda $27                                                  ; $b8cc : $a5, $27
	beq br_3c_b8d4                                                  ; $b8ce : $f0, $04

	bmi br_3c_b8d4                                                  ; $b8d0 : $30, $02

br_3c_b8d2:
	bra br_3c_b8e7                                                  ; $b8d2 : $80, $13

br_3c_b8d4:
	lda #$7f.b                                                  ; $b8d4 : $a9, $7f
	sta $1f45.w                                                  ; $b8d6 : $8d, $45, $1f
	sta $1f4f.w                                                  ; $b8d9 : $8d, $4f, $1f
	lda #$04.b                                                  ; $b8dc : $a9, $04
	sta $01                                                  ; $b8de : $85, $01
	stz $02                                                  ; $b8e0 : $64, $02
	stz $03                                                  ; $b8e2 : $64, $03
	stz $3b                                                  ; $b8e4 : $64, $3b
	rts                                                  ; $b8e6 : $60


br_3c_b8e7:
	lda $0b                                                  ; $b8e7 : $a5, $0b
	beq br_3c_b8fd                                                  ; $b8e9 : $f0, $12

	rep #IDX_8                                                  ; $b8eb : $c2, $10
	ldx $3e                                                  ; $b8ed : $a6, $3e
	lda $0000.w, X                                                  ; $b8ef : $bd, $00, $00
	beq br_3c_b909                                                  ; $b8f2 : $f0, $15

	lda $0001.w, X                                                  ; $b8f4 : $bd, $01, $00
	cmp #$04.b                                                  ; $b8f7 : $c9, $04
	beq br_3c_b909                                                  ; $b8f9 : $f0, $0e

	sep #IDX_8                                                  ; $b8fb : $e2, $10

br_3c_b8fd:
	lda $0b                                                  ; $b8fd : $a5, $0b
	asl                                                  ; $b8ff : $0a
	tax                                                  ; $b900 : $aa
	jsr ($b921.w, X)                                                  ; $b901 : $fc, $21, $b9
	lda $0b                                                  ; $b904 : $a5, $0b
	beq br_3c_b908                                                  ; $b906 : $f0, $00

br_3c_b908:
	rts                                                  ; $b908 : $60


br_3c_b909:
	sep #IDX_8                                                  ; $b909 : $e2, $10
	lda $7fcd90.l                                                  ; $b90b : $af, $90, $cd, $7f
	cmp $0b                                                  ; $b90f : $c5, $0b
	bne br_3c_b916                                                  ; $b911 : $d0, $03

	jsr Call_3c_bea7.w                                                  ; $b913 : $20, $a7, $be

br_3c_b916:
	lda #$04.b                                                  ; $b916 : $a9, $04
	sta $3b                                                  ; $b918 : $85, $3b
	sta $01                                                  ; $b91a : $85, $01
	stz $02                                                  ; $b91c : $64, $02
	stz $03                                                  ; $b91e : $64, $03
	rts                                                  ; $b920 : $60


	and $81b9.w                                                  ; $b921 : $2d, $b9, $81
	tsx                                                  ; $b924 : $ba
	sta ($ba, X)                                                  ; $b925 : $81, $ba
	cmp ($b9), Y                                                  ; $b927 : $d1, $b9
	wdm                                                  ; $b929 : $42
	tyx                                                  ; $b92a : $bb
	wdm                                                  ; $b92b : $42
	tyx                                                  ; $b92c : $bb
	rep #ACCU_8                                                  ; $b92d : $c2, $20
	lda #$01c8.w                                                  ; $b92f : $a9, $c8, $01
	sta $1e78.w                                                  ; $b932 : $8d, $78, $1e
	sep #ACCU_8                                                  ; $b935 : $e2, $20
	jsr $04d8d5.l                                                  ; $b937 : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $b93b : $22, $64, $df, $02
	jsr Call_3c_beb0.w                                                  ; $b93f : $20, $b0, $be
	jsr Call_3c_b980.w                                                  ; $b942 : $20, $80, $b9
	jsr Func_4_cb31.l                                                  ; $b945 : $22, $31, $cb, $04
	jsr Func_4_cb74.l                                                  ; $b949 : $22, $74, $cb, $04
	bmi br_3c_b967                                                  ; $b94d : $30, $18

	bne br_3c_b953                                                  ; $b94f : $d0, $02

	bra br_3c_b97f                                                  ; $b951 : $80, $2c

br_3c_b953:
	lda #$21.b                                                  ; $b953 : $a9, $21
	jsr Func_1_802b.l                                                  ; $b955 : $22, $2b, $80, $01
	lda #$3c.b                                                  ; $b959 : $a9, $3c
	sta $37                                                  ; $b95b : $85, $37
	lda #$01.b                                                  ; $b95d : $a9, $01
	sta $28                                                  ; $b95f : $85, $28
	lda #$0e.b                                                  ; $b961 : $a9, $0e
	trb $11                                                  ; $b963 : $14, $11
	bra br_3c_b97f                                                  ; $b965 : $80, $18

br_3c_b967:
	lda #$7f.b                                                  ; $b967 : $a9, $7f
	sta $1f45.w                                                  ; $b969 : $8d, $45, $1f
	sta $1f4f.w                                                  ; $b96c : $8d, $4f, $1f
	lda #$04.b                                                  ; $b96f : $a9, $04
	sta $01                                                  ; $b971 : $85, $01
	stz $02                                                  ; $b973 : $64, $02
	stz $03                                                  ; $b975 : $64, $03
	stz $3b                                                  ; $b977 : $64, $3b
	stz $34                                                  ; $b979 : $64, $34
	jsr todo_CausePlayerToFreeze.l                                                  ; $b97b : $22, $ca, $d1, $04

br_3c_b97f:
	rts                                                  ; $b97f : $60


Call_3c_b980:
	jsr Func_2_d636.l                                                  ; $b980 : $22, $36, $d6, $02
	lda $7fcd90.l                                                  ; $b984 : $af, $90, $cd, $7f
	bne br_3c_b991                                                  ; $b988 : $d0, $07

	dec $39                                                  ; $b98a : $c6, $39
	beq br_3c_b999                                                  ; $b98c : $f0, $0b

	jsr Call_3c_bdef.w                                                  ; $b98e : $20, $ef, $bd

br_3c_b991:
	jsr Call_3c_bdc6.w                                                  ; $b991 : $20, $c6, $bd
	jsr AnimateEntity.l                                                  ; $b994 : $22, $4a, $b9, $04
	rts                                                  ; $b998 : $60


br_3c_b999:
	lda #$70.b                                                  ; $b999 : $a9, $70
	sta $39                                                  ; $b99b : $85, $39
	jsr Call_3c_bc91.w                                                  ; $b99d : $20, $91, $bc
	beq br_3c_b9b8                                                  ; $b9a0 : $f0, $16

	cmp #$01.b                                                  ; $b9a2 : $c9, $01
	beq br_3c_b9bf                                                  ; $b9a4 : $f0, $19

	lda #$04.b                                                  ; $b9a6 : $a9, $04
	sta $7fcd90.l                                                  ; $b9a8 : $8f, $90, $cd, $7f
	jsr Call_3c_bdb1.w                                                  ; $b9ac : $20, $b1, $bd
	bne br_3c_b9b7                                                  ; $b9af : $d0, $06

	lda #$05.b                                                  ; $b9b1 : $a9, $05
	sta $7fcd90.l                                                  ; $b9b3 : $8f, $90, $cd, $7f

br_3c_b9b7:
	rts                                                  ; $b9b7 : $60


br_3c_b9b8:
	lda #$03.b                                                  ; $b9b8 : $a9, $03
	sta $7fcd90.l                                                  ; $b9ba : $8f, $90, $cd, $7f
	rts                                                  ; $b9be : $60


br_3c_b9bf:
	lda #$01.b                                                  ; $b9bf : $a9, $01
	sta $7fcd90.l                                                  ; $b9c1 : $8f, $90, $cd, $7f
	jsr Call_3c_bdb1.w                                                  ; $b9c5 : $20, $b1, $bd
	bne br_3c_b9d0                                                  ; $b9c8 : $d0, $06

	lda #$02.b                                                  ; $b9ca : $a9, $02
	sta $7fcd90.l                                                  ; $b9cc : $8f, $90, $cd, $7f

br_3c_b9d0:
	rts                                                  ; $b9d0 : $60


	ldx $03                                                  ; $b9d1 : $a6, $03
	jsr ($b9de.w, X)                                                  ; $b9d3 : $fc, $de, $b9
	jsr Func_4_cb74.l                                                  ; $b9d6 : $22, $74, $cb, $04
	jsr Call_3c_be2a.w                                                  ; $b9da : $20, $2a, $be
	rts                                                  ; $b9dd : $60


	inx                                                  ; $b9de : $e8
	lda $ba08.w, Y                                                  ; $b9df : $b9, $08, $ba
	and $ba, S                                                  ; $b9e2 : $23, $ba
	lsr                                                  ; $b9e4 : $4a
	tsx                                                  ; $b9e5 : $ba
	eor $afba.w, X                                                  ; $b9e6 : $5d, $ba, $af
	bcc br_3c_b9b8                                                  ; $b9e9 : $90, $cd

	adc $d003c9.l, X                                                  ; $b9eb : $7f, $c9, $03, $d0
	ora [$a9], Y                                                  ; $b9ef : $17, $a9
	cop $85.b                                                  ; $b9f1 : $02, $85
	ora ($a9)                                                  ; $b9f3 : $12, $a9
	cop $85.b                                                  ; $b9f5 : $02, $85
	ora $a9, S                                                  ; $b9f7 : $03, $a9
	ora $85                                                  ; $b9f9 : $05, $85
	dea                                                  ; $b9fb : $3a
	lda #$04.b                                                  ; $b9fc : $a9, $04
	jsr SetupEntitysAnimation.l                                                  ; $b9fe : $22, $67, $b9, $04
	lda #$04.b                                                  ; $ba02 : $a9, $04
	jsr Call_3c_be48.w                                                  ; $ba04 : $20, $48, $be
	rts                                                  ; $ba07 : $60


	lda $0f                                                  ; $ba08 : $a5, $0f
	beq br_3c_ba1a                                                  ; $ba0a : $f0, $0e

	lda #$05.b                                                  ; $ba0c : $a9, $05
	jsr SetupEntitysAnimation.l                                                  ; $ba0e : $22, $67, $b9, $04
	lda #$04.b                                                  ; $ba12 : $a9, $04
	sta $03                                                  ; $ba14 : $85, $03
	lda #$10.b                                                  ; $ba16 : $a9, $10
	sta $39                                                  ; $ba18 : $85, $39

br_3c_ba1a:
	jsr AnimateEntity.l                                                  ; $ba1a : $22, $4a, $b9, $04
	jsr Func_2_d636.l                                                  ; $ba1e : $22, $36, $d6, $02
	rts                                                  ; $ba22 : $60


	dec $39                                                  ; $ba23 : $c6, $39
	bne br_3c_ba38                                                  ; $ba25 : $d0, $11

	jsr Call_3c_bcb8.w                                                  ; $ba27 : $20, $b8, $bc
	lda #$50.b                                                  ; $ba2a : $a9, $50
	jsr Func_1_802b.l                                                  ; $ba2c : $22, $2b, $80, $01
	lda #$20.b                                                  ; $ba30 : $a9, $20
	sta $39                                                  ; $ba32 : $85, $39
	dec $3a                                                  ; $ba34 : $c6, $3a
	bmi br_3c_ba3d                                                  ; $ba36 : $30, $05

br_3c_ba38:
	jsr Func_2_d636.l                                                  ; $ba38 : $22, $36, $d6, $02
	rts                                                  ; $ba3c : $60


br_3c_ba3d:
	lda #$50.b                                                  ; $ba3d : $a9, $50
	sta $39                                                  ; $ba3f : $85, $39
	lda #$06.b                                                  ; $ba41 : $a9, $06
	sta $03                                                  ; $ba43 : $85, $03
	jsr Func_2_d636.l                                                  ; $ba45 : $22, $36, $d6, $02
	rts                                                  ; $ba49 : $60


	dec $39                                                  ; $ba4a : $c6, $39
	bpl br_3c_ba58                                                  ; $ba4c : $10, $0a

	lda #$08.b                                                  ; $ba4e : $a9, $08
	jsr SetupEntitysAnimation.l                                                  ; $ba50 : $22, $67, $b9, $04
	lda #$08.b                                                  ; $ba54 : $a9, $08
	sta $03                                                  ; $ba56 : $85, $03

br_3c_ba58:
	jsr Func_2_d636.l                                                  ; $ba58 : $22, $36, $d6, $02
	rts                                                  ; $ba5c : $60


	lda $0f                                                  ; $ba5d : $a5, $0f
	bpl br_3c_ba78                                                  ; $ba5f : $10, $17

	lda #$03.b                                                  ; $ba61 : $a9, $03
	jsr SetupEntitysAnimation.l                                                  ; $ba63 : $22, $67, $b9, $04
	lda #$0c.b                                                  ; $ba67 : $a9, $0c
	sta $12                                                  ; $ba69 : $85, $12
	lda #$09.b                                                  ; $ba6b : $a9, $09
	jsr Call_3c_be48.w                                                  ; $ba6d : $20, $48, $be
	lda #$00.b                                                  ; $ba70 : $a9, $00
	sta $7fcd90.l                                                  ; $ba72 : $8f, $90, $cd, $7f
	stz $03                                                  ; $ba76 : $64, $03

br_3c_ba78:
	jsr AnimateEntity.l                                                  ; $ba78 : $22, $4a, $b9, $04
	jsr Func_2_d636.l                                                  ; $ba7c : $22, $36, $d6, $02
	rts                                                  ; $ba80 : $60


	ldx $03                                                  ; $ba81 : $a6, $03
	jsr ($ba8a.w, X)                                                  ; $ba83 : $fc, $8a, $ba
	jsr Call_3c_be2a.w                                                  ; $ba86 : $20, $2a, $be
	rts                                                  ; $ba89 : $60


	stx $ba, Y                                                  ; $ba8a : $96, $ba
	tsx                                                  ; $ba8c : $ba
	tsx                                                  ; $ba8d : $ba
	sbc ($ba)                                                  ; $ba8e : $f2, $ba
	ora $bb, S                                                  ; $ba90 : $03, $bb
	asl $bb, X                                                  ; $ba92 : $16, $bb
	and $afbb.w, Y                                                  ; $ba94 : $39, $bb, $af
	.db $90, $cd                                                  ; $ba97 : $90, $cd

	adc $c518f0.l, X                                                  ; $ba99 : $7f, $f0, $18, $c5
	phd                                                  ; $ba9d : $0b
	bne br_3c_bab5                                                  ; $ba9e : $d0, $15

	lda #$01.b                                                  ; $baa0 : $a9, $01
	jsr SetupEntitysAnimation.l                                                  ; $baa2 : $22, $67, $b9, $04
	lda $0b                                                  ; $baa6 : $a5, $0b
	dea                                                  ; $baa8 : $3a
	jsr Call_3c_be48.w                                                  ; $baa9 : $20, $48, $be
	lda #$02.b                                                  ; $baac : $a9, $02
	sta $03                                                  ; $baae : $85, $03
	jsr Func_2_d636.l                                                  ; $bab0 : $22, $36, $d6, $02
	rts                                                  ; $bab4 : $60


br_3c_bab5:
	lda #$0a.b                                                  ; $bab5 : $a9, $0a
	sta $03                                                  ; $bab7 : $85, $03
	rts                                                  ; $bab9 : $60


	lda $0f                                                  ; $baba : $a5, $0f
	bpl br_3c_bae9                                                  ; $babc : $10, $2b

	jsr $04d308.l                                                  ; $babe : $22, $08, $d3, $04
	sta $7fcd91.l                                                  ; $bac2 : $8f, $91, $cd, $7f
	ldy #$00.b                                                  ; $bac6 : $a0, $00
	jsr Call_3c_bcf4.w                                                  ; $bac8 : $20, $f4, $bc
	ldy #$01.b                                                  ; $bacb : $a0, $01
	jsr Call_3c_bcf4.w                                                  ; $bacd : $20, $f4, $bc
	ldy #$02.b                                                  ; $bad0 : $a0, $02
	jsr Call_3c_bcf4.w                                                  ; $bad2 : $20, $f4, $bc
	lda #$30.b                                                  ; $bad5 : $a9, $30
	sta $39                                                  ; $bad7 : $85, $39
	lda #$38.b                                                  ; $bad9 : $a9, $38
	jsr Func_1_802b.l                                                  ; $badb : $22, $2b, $80, $01
	lda #$02.b                                                  ; $badf : $a9, $02
	jsr SetupEntitysAnimation.l                                                  ; $bae1 : $22, $67, $b9, $04
	lda #$04.b                                                  ; $bae5 : $a9, $04
	sta $03                                                  ; $bae7 : $85, $03

br_3c_bae9:
	jsr AnimateEntity.l                                                  ; $bae9 : $22, $4a, $b9, $04
	jsr Func_2_d636.l                                                  ; $baed : $22, $36, $d6, $02
	rts                                                  ; $baf1 : $60


	dec $39                                                  ; $baf2 : $c6, $39
	bne br_3c_bafe                                                  ; $baf4 : $d0, $08

	lda #$70.b                                                  ; $baf6 : $a9, $70
	sta $39                                                  ; $baf8 : $85, $39
	lda #$06.b                                                  ; $bafa : $a9, $06
	sta $03                                                  ; $bafc : $85, $03

br_3c_bafe:
	jsr Func_2_d636.l                                                  ; $bafe : $22, $36, $d6, $02
	rts                                                  ; $bb02 : $60


	dec $39                                                  ; $bb03 : $c6, $39
	bne br_3c_bb11                                                  ; $bb05 : $d0, $0a

	lda #$07.b                                                  ; $bb07 : $a9, $07
	jsr SetupEntitysAnimation.l                                                  ; $bb09 : $22, $67, $b9, $04
	lda #$08.b                                                  ; $bb0d : $a9, $08
	sta $03                                                  ; $bb0f : $85, $03

br_3c_bb11:
	jsr Func_2_d636.l                                                  ; $bb11 : $22, $36, $d6, $02
	rts                                                  ; $bb15 : $60


	lda $0f                                                  ; $bb16 : $a5, $0f
	bpl br_3c_bb30                                                  ; $bb18 : $10, $16

	lda #$00.b                                                  ; $bb1a : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $bb1c : $22, $67, $b9, $04
	lda $0b                                                  ; $bb20 : $a5, $0b
	clc                                                  ; $bb22 : $18
	adc #$04.b                                                  ; $bb23 : $69, $04
	jsr Call_3c_be48.w                                                  ; $bb25 : $20, $48, $be
	stz $03                                                  ; $bb28 : $64, $03
	lda #$00.b                                                  ; $bb2a : $a9, $00
	sta $7fcd90.l                                                  ; $bb2c : $8f, $90, $cd, $7f

br_3c_bb30:
	jsr Func_2_d636.l                                                  ; $bb30 : $22, $36, $d6, $02
	jsr AnimateEntity.l                                                  ; $bb34 : $22, $4a, $b9, $04
	rts                                                  ; $bb38 : $60


	lda $7fcd90.l                                                  ; $bb39 : $af, $90, $cd, $7f
	bne br_3c_bb41                                                  ; $bb3d : $d0, $02

	stz $03                                                  ; $bb3f : $64, $03

br_3c_bb41:
	rts                                                  ; $bb41 : $60


	ldx $03                                                  ; $bb42 : $a6, $03
	jsr ($bb4b.w, X)                                                  ; $bb44 : $fc, $4b, $bb
	jsr Call_3c_be2a.w                                                  ; $bb47 : $20, $2a, $be
	rts                                                  ; $bb4a : $60


	eor ($bb, S), Y                                                  ; $bb4b : $53, $bb
	sei                                                  ; $bb4d : $78
	tyx                                                  ; $bb4e : $bb
	sta [$bb], Y                                                  ; $bb4f : $97, $bb
	lda ($bb)                                                  ; $bb51 : $b2, $bb
	lda $7fcd90.l                                                  ; $bb53 : $af, $90, $cd, $7f
	beq br_3c_bb72                                                  ; $bb57 : $f0, $19

	cmp $0b                                                  ; $bb59 : $c5, $0b
	bne br_3c_bb73                                                  ; $bb5b : $d0, $16

	lda #$00.b                                                  ; $bb5d : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $bb5f : $22, $67, $b9, $04
	lda $0b                                                  ; $bb63 : $a5, $0b
	dea                                                  ; $bb65 : $3a
	dea                                                  ; $bb66 : $3a
	jsr Call_3c_be48.w                                                  ; $bb67 : $20, $48, $be
	lda #$02.b                                                  ; $bb6a : $a9, $02
	sta $03                                                  ; $bb6c : $85, $03
	jsr Func_2_d636.l                                                  ; $bb6e : $22, $36, $d6, $02

br_3c_bb72:
	rts                                                  ; $bb72 : $60


br_3c_bb73:
	lda #$06.b                                                  ; $bb73 : $a9, $06
	sta $03                                                  ; $bb75 : $85, $03
	rts                                                  ; $bb77 : $60


	lda $0f                                                  ; $bb78 : $a5, $0f
	beq br_3c_bb8e                                                  ; $bb7a : $f0, $12

	cmp #$01.b                                                  ; $bb7c : $c9, $01
	bne br_3c_bb85                                                  ; $bb7e : $d0, $05

	jsr Call_3c_bd57.w                                                  ; $bb80 : $20, $57, $bd
	bra br_3c_bb8e                                                  ; $bb83 : $80, $09

br_3c_bb85:
	lda #$04.b                                                  ; $bb85 : $a9, $04
	sta $03                                                  ; $bb87 : $85, $03
	jsr Func_2_d636.l                                                  ; $bb89 : $22, $36, $d6, $02
	rts                                                  ; $bb8d : $60


br_3c_bb8e:
	jsr AnimateEntity.l                                                  ; $bb8e : $22, $4a, $b9, $04
	jsr Func_2_d636.l                                                  ; $bb92 : $22, $36, $d6, $02
	rts                                                  ; $bb96 : $60


	lda $7fcd96.l                                                  ; $bb97 : $af, $96, $cd, $7f
	beq br_3c_bbad                                                  ; $bb9b : $f0, $10

	lda $0b                                                  ; $bb9d : $a5, $0b
	clc                                                  ; $bb9f : $18
	adc #$03.b                                                  ; $bba0 : $69, $03
	jsr Call_3c_be48.w                                                  ; $bba2 : $20, $48, $be
	lda #$00.b                                                  ; $bba5 : $a9, $00
	sta $7fcd90.l                                                  ; $bba7 : $8f, $90, $cd, $7f
	stz $03                                                  ; $bbab : $64, $03

br_3c_bbad:
	jsr Func_2_d636.l                                                  ; $bbad : $22, $36, $d6, $02
	rts                                                  ; $bbb1 : $60


	lda $7fcd90.l                                                  ; $bbb2 : $af, $90, $cd, $7f
	bne br_3c_bbba                                                  ; $bbb6 : $d0, $02

	stz $03                                                  ; $bbb8 : $64, $03

br_3c_bbba:
	rts                                                  ; $bbba : $60


	jsr Call_3c_bdc6.w                                                  ; $bbbb : $20, $c6, $bd
	ldx $3b                                                  ; $bbbe : $a6, $3b
	jsr ($bbc4.w, X)                                                  ; $bbc0 : $fc, $c4, $bb
	rts                                                  ; $bbc3 : $60


	dex                                                  ; $bbc4 : $ca
	tyx                                                  ; $bbc5 : $bb
	jsr ($20bb.w, X)                                                  ; $bbc6 : $fc, $bb, $20
	ldy $cb9c.w, X                                                  ; $bbc9 : $bc, $9c, $cb
	.db $00                                                  ; $bbcc : $00
	stz $00cc.w                                                  ; $bbcd : $9c, $cc, $00
	stz $00cd.w                                                  ; $bbd0 : $9c, $cd, $00
	stz $0b                                                  ; $bbd3 : $64, $0b
	lda #$02.b                                                  ; $bbd5 : $a9, $02
	sta $3b                                                  ; $bbd7 : $85, $3b
	stz $1f1f.w                                                  ; $bbd9 : $9c, $1f, $1f
	stz $1f20.w                                                  ; $bbdc : $9c, $20, $1f
	lda #$1e.b                                                  ; $bbdf : $a9, $1e
	sta $39                                                  ; $bbe1 : $85, $39
	lda $38                                                  ; $bbe3 : $a5, $38
	tsb $11                                                  ; $bbe5 : $04, $11

br_3c_bbe7:
	lda wMainScreenDesignation.w                                                  ; $bbe7 : $ad, $c1, $00
	eor #$02.b                                                  ; $bbea : $49, $02
	sta wMainScreenDesignation.w                                                  ; $bbec : $8d, $c1, $00
	lda wSubScreenDesignation.w                                                  ; $bbef : $ad, $c2, $00
	eor #$02.b                                                  ; $bbf2 : $49, $02
	sta wSubScreenDesignation.w                                                  ; $bbf4 : $8d, $c2, $00
	jsr Func_2_d636.l                                                  ; $bbf7 : $22, $36, $d6, $02
	rts                                                  ; $bbfb : $60


	lda $39                                                  ; $bbfc : $a5, $39
	beq br_3c_bc04                                                  ; $bbfe : $f0, $04

	dec $39                                                  ; $bc00 : $c6, $39
	bra br_3c_bbe7                                                  ; $bc02 : $80, $e3

br_3c_bc04:
	jsr $3fe1c9.l                                                  ; $bc04 : $22, $c9, $e1, $3f
	lda $34                                                  ; $bc08 : $a5, $34
	bpl br_3c_bc11                                                  ; $bc0a : $10, $05

	lda #$04.b                                                  ; $bc0c : $a9, $04
	sta $3b                                                  ; $bc0e : $85, $3b
	rts                                                  ; $bc10 : $60


br_3c_bc11:
	lda $34                                                  ; $bc11 : $a5, $34
	cmp #$01.b                                                  ; $bc13 : $c9, $01
	bne br_3c_bbe7                                                  ; $bc15 : $d0, $d0

	lda #$02.b                                                  ; $bc17 : $a9, $02
	trb wMainScreenDesignation.w                                                  ; $bc19 : $1c, $c1, $00
	trb wSubScreenDesignation.w                                                  ; $bc1c : $1c, $c2, $00
	rts                                                  ; $bc1f : $60


	lda $0b                                                  ; $bc20 : $a5, $0b
	bne br_3c_bc2c                                                  ; $bc22 : $d0, $08

	inc wStartTeleingPlayerOutOfStage.w                                                  ; $bc24 : $ee, $36, $1f
	lda #$02.b                                                  ; $bc27 : $a9, $02
	sta $1faf.w                                                  ; $bc29 : $8d, $af, $1f

br_3c_bc2c:
	jsr todo_DisablesEntity_d928.l                                                  ; $bc2c : $22, $28, $d9, $02
	rts                                                  ; $bc30 : $60


Call_3c_bc31:
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $bc31 : $22, $a7, $d8, $02
	bne br_3c_bc60                                                  ; $bc35 : $d0, $29

	rep #IDX_8                                                  ; $bc37 : $c2, $10
	inc $0000.w, X                                                  ; $bc39 : $fe, $00, $00
	lda #$4a.b                                                  ; $bc3c : $a9, $4a
	sta $000a.w, X                                                  ; $bc3e : $9d, $0a, $00
	lda $18                                                  ; $bc41 : $a5, $18
	sta $0018.w, X                                                  ; $bc43 : $9d, $18, $00
	lda $16                                                  ; $bc46 : $a5, $16
	sta $0016.w, X                                                  ; $bc48 : $9d, $16, $00
	tya                                                  ; $bc4b : $98
	sta $000b.w, X                                                  ; $bc4c : $9d, $0b, $00
	clc                                                  ; $bc4f : $18
	adc #$02.b                                                  ; $bc50 : $69, $02
	asl                                                  ; $bc52 : $0a
	sta $0002.w, X                                                  ; $bc53 : $9d, $02, $00
	rep #ACCU_8                                                  ; $bc56 : $c2, $20
	tdc                                                  ; $bc58 : $7b
	sta $003e.w, X                                                  ; $bc59 : $9d, $3e, $00
	sep #ACCU_8|IDX_8                                                  ; $bc5c : $e2, $30
	lda #$00.b                                                  ; $bc5e : $a9, $00

br_3c_bc60:
	rts                                                  ; $bc60 : $60


Call_3c_bc61:
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $bc61 : $22, $a7, $d8, $02
	bne br_3c_bc90                                                  ; $bc65 : $d0, $29

	rep #IDX_8                                                  ; $bc67 : $c2, $10
	inc $0000.w, X                                                  ; $bc69 : $fe, $00, $00
	lda #$4a.b                                                  ; $bc6c : $a9, $4a
	sta $000a.w, X                                                  ; $bc6e : $9d, $0a, $00
	lda $18                                                  ; $bc71 : $a5, $18
	sta $0018.w, X                                                  ; $bc73 : $9d, $18, $00
	lda #$a1.b                                                  ; $bc76 : $a9, $a1
	sta $0016.w, X                                                  ; $bc78 : $9d, $16, $00
	tya                                                  ; $bc7b : $98
	sta $000b.w, X                                                  ; $bc7c : $9d, $0b, $00
	clc                                                  ; $bc7f : $18
	adc #$02.b                                                  ; $bc80 : $69, $02
	asl                                                  ; $bc82 : $0a
	sta $0002.w, X                                                  ; $bc83 : $9d, $02, $00
	rep #ACCU_8                                                  ; $bc86 : $c2, $20
	tdc                                                  ; $bc88 : $7b
	sta $003e.w, X                                                  ; $bc89 : $9d, $3e, $00
	sep #ACCU_8|IDX_8                                                  ; $bc8c : $e2, $30
	lda #$00.b                                                  ; $bc8e : $a9, $00

br_3c_bc90:
	rts                                                  ; $bc90 : $60


Call_3c_bc91:
	rep #ACCU_8                                                  ; $bc91 : $c2, $20
	lda $09e0.w                                                  ; $bc93 : $ad, $e0, $09
	cmp $08                                                  ; $bc96 : $c5, $08
	bmi br_3c_bcb3                                                  ; $bc98 : $30, $19

	lda wPlayerEntity.x.w                                                  ; $bc9a : $ad, $dd, $09
	sec                                                  ; $bc9d : $38
	sbc $05                                                  ; $bc9e : $e5, $05
	bpl br_3c_bca6                                                  ; $bca0 : $10, $04

	eor #$ffff.w                                                  ; $bca2 : $49, $ff, $ff
	ina                                                  ; $bca5 : $1a

br_3c_bca6:
	cmp #$0040.w                                                  ; $bca6 : $c9, $40, $00
	sep #ACCU_8                                                  ; $bca9 : $e2, $20
	bmi br_3c_bcb0                                                  ; $bcab : $30, $03

	lda #$02.b                                                  ; $bcad : $a9, $02
	rts                                                  ; $bcaf : $60


br_3c_bcb0:
	lda #$00.b                                                  ; $bcb0 : $a9, $00
	rts                                                  ; $bcb2 : $60


br_3c_bcb3:
	sep #ACCU_8                                                  ; $bcb3 : $e2, $20
	lda #$01.b                                                  ; $bcb5 : $a9, $01
	rts                                                  ; $bcb7 : $60


Call_3c_bcb8:
	rep #IDX_8                                                  ; $bcb8 : $c2, $10
	jsr $02d8de.l                                                  ; $bcba : $22, $de, $d8, $02
	bne br_3c_bcf1                                                  ; $bcbe : $d0, $31

	inc $0000.w, X                                                  ; $bcc0 : $fe, $00, $00
	lda #$1a.b                                                  ; $bcc3 : $a9, $1a
	sta $000a.w, X                                                  ; $bcc5 : $9d, $0a, $00
	lda $18                                                  ; $bcc8 : $a5, $18
	sta $0018.w, X                                                  ; $bcca : $9d, $18, $00
	lda #$a2.b                                                  ; $bccd : $a9, $a2
	sta $0016.w, X                                                  ; $bccf : $9d, $16, $00
	lda $38                                                  ; $bcd2 : $a5, $38
	sta $0011.w, X                                                  ; $bcd4 : $9d, $11, $00
	stz $000b.w, X                                                  ; $bcd7 : $9e, $0b, $00
	lda $3a                                                  ; $bcda : $a5, $3a
	sta $003a.w, X                                                  ; $bcdc : $9d, $3a, $00
	rep #ACCU_8                                                  ; $bcdf : $c2, $20
	lda $05                                                  ; $bce1 : $a5, $05
	sta $0005.w, X                                                  ; $bce3 : $9d, $05, $00
	lda $08                                                  ; $bce6 : $a5, $08
	sta $0008.w, X                                                  ; $bce8 : $9d, $08, $00
	tdc                                                  ; $bceb : $7b
	sta $003e.w, X                                                  ; $bcec : $9d, $3e, $00
	sep #ACCU_8                                                  ; $bcef : $e2, $20

br_3c_bcf1:
	sep #IDX_8                                                  ; $bcf1 : $e2, $10
	rts                                                  ; $bcf3 : $60


Call_3c_bcf4:
	rep #IDX_8                                                  ; $bcf4 : $c2, $10
	jsr $02d8de.l                                                  ; $bcf6 : $22, $de, $d8, $02
	bne br_3c_bd54                                                  ; $bcfa : $d0, $58

	inc $0000.w, X                                                  ; $bcfc : $fe, $00, $00
	lda #$1a.b                                                  ; $bcff : $a9, $1a
	sta $000a.w, X                                                  ; $bd01 : $9d, $0a, $00
	lda $18                                                  ; $bd04 : $a5, $18
	sta $0018.w, X                                                  ; $bd06 : $9d, $18, $00
	lda $16                                                  ; $bd09 : $a5, $16
	sta $0016.w, X                                                  ; $bd0b : $9d, $16, $00
	lda $38                                                  ; $bd0e : $a5, $38
	sta $0011.w, X                                                  ; $bd10 : $9d, $11, $00
	lda #$02.b                                                  ; $bd13 : $a9, $02
	sta $000b.w, X                                                  ; $bd15 : $9d, $0b, $00
	phy                                                  ; $bd18 : $5a
	lda $11                                                  ; $bd19 : $a5, $11
	bit #$40.b                                                  ; $bd1b : $89, $40
	bne br_3c_bd24                                                  ; $bd1d : $d0, $05

	tya                                                  ; $bd1f : $98
	clc                                                  ; $bd20 : $18
	adc #$03.b                                                  ; $bd21 : $69, $03
	tay                                                  ; $bd23 : $a8

br_3c_bd24:
	lda $c958.w, Y                                                  ; $bd24 : $b9, $58, $c9
	sta $0034.w, X                                                  ; $bd27 : $9d, $34, $00
	ply                                                  ; $bd2a : $7a
	tya                                                  ; $bd2b : $98
	asl                                                  ; $bd2c : $0a
	asl                                                  ; $bd2d : $0a
	tay                                                  ; $bd2e : $a8
	lda $11                                                  ; $bd2f : $a5, $11
	bit #$40.b                                                  ; $bd31 : $89, $40
	bne br_3c_bd3a                                                  ; $bd33 : $d0, $05

	tya                                                  ; $bd35 : $98
	clc                                                  ; $bd36 : $18
	adc #$0c.b                                                  ; $bd37 : $69, $0c
	tay                                                  ; $bd39 : $a8

br_3c_bd3a:
	rep #ACCU_8                                                  ; $bd3a : $c2, $20
	lda $05                                                  ; $bd3c : $a5, $05
	clc                                                  ; $bd3e : $18
	adc $c940.w, Y                                                  ; $bd3f : $79, $40, $c9
	sta $0005.w, X                                                  ; $bd42 : $9d, $05, $00
	lda $08                                                  ; $bd45 : $a5, $08
	clc                                                  ; $bd47 : $18
	adc $c942.w, Y                                                  ; $bd48 : $79, $42, $c9
	sta $0008.w, X                                                  ; $bd4b : $9d, $08, $00
	tdc                                                  ; $bd4e : $7b
	sta $003e.w, X                                                  ; $bd4f : $9d, $3e, $00
	sep #ACCU_8                                                  ; $bd52 : $e2, $20

br_3c_bd54:
	sep #IDX_8                                                  ; $bd54 : $e2, $10
	rts                                                  ; $bd56 : $60


Call_3c_bd57:
	jsr $02d8de.l                                                  ; $bd57 : $22, $de, $d8, $02
	bne br_3c_bdb0                                                  ; $bd5b : $d0, $53

	rep #IDX_8                                                  ; $bd5d : $c2, $10
	inc $0000.w, X                                                  ; $bd5f : $fe, $00, $00
	lda #$1a.b                                                  ; $bd62 : $a9, $1a
	sta $000a.w, X                                                  ; $bd64 : $9d, $0a, $00
	lda $18                                                  ; $bd67 : $a5, $18
	sta $0018.w, X                                                  ; $bd69 : $9d, $18, $00
	lda #$a1.b                                                  ; $bd6c : $a9, $a1
	sta $0016.w, X                                                  ; $bd6e : $9d, $16, $00
	lda #$04.b                                                  ; $bd71 : $a9, $04
	sta $000b.w, X                                                  ; $bd73 : $9d, $0b, $00
	lda $11                                                  ; $bd76 : $a5, $11
	ora $38                                                  ; $bd78 : $05, $38
	eor #$40.b                                                  ; $bd7a : $49, $40
	sta $0011.w, X                                                  ; $bd7c : $9d, $11, $00
	ldy #$0000.w                                                  ; $bd7f : $a0, $00, $00
	lda $0b                                                  ; $bd82 : $a5, $0b
	cmp #$05.b                                                  ; $bd84 : $c9, $05
	bne br_3c_bd8b                                                  ; $bd86 : $d0, $03

	ldy #$0004.w                                                  ; $bd88 : $a0, $04, $00

br_3c_bd8b:
	rep #ACCU_8                                                  ; $bd8b : $c2, $20
	tya                                                  ; $bd8d : $98
	and #$00ff.w                                                  ; $bd8e : $29, $ff, $00
	tay                                                  ; $bd91 : $a8
	lda $05                                                  ; $bd92 : $a5, $05
	clc                                                  ; $bd94 : $18
	adc $c976.w, Y                                                  ; $bd95 : $79, $76, $c9
	sta $0005.w, X                                                  ; $bd98 : $9d, $05, $00
	lda $08                                                  ; $bd9b : $a5, $08
	sec                                                  ; $bd9d : $38
	sbc #$0010.w                                                  ; $bd9e : $e9, $10, $00
	sta $0008.w, X                                                  ; $bda1 : $9d, $08, $00
	tdc                                                  ; $bda4 : $7b
	sta $003e.w, X                                                  ; $bda5 : $9d, $3e, $00
	sep #ACCU_8                                                  ; $bda8 : $e2, $20
	lda #$00.b                                                  ; $bdaa : $a9, $00
	sta $7fcd96.l                                                  ; $bdac : $8f, $96, $cd, $7f

br_3c_bdb0:
	rts                                                  ; $bdb0 : $60


Call_3c_bdb1:
	rep #ACCU_8                                                  ; $bdb1 : $c2, $20
	lda wPlayerEntity.x.w                                                  ; $bdb3 : $ad, $dd, $09
	cmp $05                                                  ; $bdb6 : $c5, $05
	bpl br_3c_bdbc                                                  ; $bdb8 : $10, $02

	bra br_3c_bdc1                                                  ; $bdba : $80, $05

br_3c_bdbc:
	sep #ACCU_8                                                  ; $bdbc : $e2, $20
	lda #$00.b                                                  ; $bdbe : $a9, $00
	rts                                                  ; $bdc0 : $60


br_3c_bdc1:
	sep #ACCU_8                                                  ; $bdc1 : $e2, $20
	lda #$01.b                                                  ; $bdc3 : $a9, $01
	rts                                                  ; $bdc5 : $60


Call_3c_bdc6:
	php                                                  ; $bdc6 : $08
	rep #ACCU_8                                                  ; $bdc7 : $c2, $20
	lda $05                                                  ; $bdc9 : $a5, $05
	sec                                                  ; $bdcb : $38
	sbc wNewStageScrollX.w                                                  ; $bdcc : $ed, $5d, $1e
	eor #$ffff.w                                                  ; $bdcf : $49, $ff, $ff
	ina                                                  ; $bdd2 : $1a
	clc                                                  ; $bdd3 : $18
	adc #$0080.w                                                  ; $bdd4 : $69, $80, $00
	sta $1e9d.w                                                  ; $bdd7 : $8d, $9d, $1e
	lda $08                                                  ; $bdda : $a5, $08
	sec                                                  ; $bddc : $38
	sbc wNewStageScrollY.w                                                  ; $bddd : $ed, $60, $1e
	eor #$ffff.w                                                  ; $bde0 : $49, $ff, $ff
	ina                                                  ; $bde3 : $1a
	clc                                                  ; $bde4 : $18
	adc #$006b.w                                                  ; $bde5 : $69, $6b, $00
	sta $1ea0.w                                                  ; $bde8 : $8d, $a0, $1e
	sep #ACCU_8                                                  ; $bdeb : $e2, $20
	plp                                                  ; $bded : $28
	rts                                                  ; $bdee : $60


Call_3c_bdef:
	jsr $04d308.l                                                  ; $bdef : $22, $08, $d3, $04
	and #$1f.b                                                  ; $bdf3 : $29, $1f
	beq br_3c_be21                                                  ; $bdf5 : $f0, $2a

	cmp #$10.b                                                  ; $bdf7 : $c9, $10
	beq br_3c_be21                                                  ; $bdf9 : $f0, $26

	bit #$10.b                                                  ; $bdfb : $89, $10
	bne br_3c_be11                                                  ; $bdfd : $d0, $12

	rep #ACCU_8                                                  ; $bdff : $c2, $20
	inc $05                                                  ; $be01 : $e6, $05
	lda $05                                                  ; $be03 : $a5, $05
	cmp #$1270.w                                                  ; $be05 : $c9, $70, $12
	bmi br_3c_be21                                                  ; $be08 : $30, $17

	lda #$1270.w                                                  ; $be0a : $a9, $70, $12
	sta $05                                                  ; $be0d : $85, $05
	bra br_3c_be21                                                  ; $be0f : $80, $10

br_3c_be11:
	rep #ACCU_8                                                  ; $be11 : $c2, $20
	dec $05                                                  ; $be13 : $c6, $05
	lda $05                                                  ; $be15 : $a5, $05
	cmp #$11a0.w                                                  ; $be17 : $c9, $a0, $11
	bpl br_3c_be21                                                  ; $be1a : $10, $05

	lda #$11a0.w                                                  ; $be1c : $a9, $a0, $11
	sta $05                                                  ; $be1f : $85, $05

br_3c_be21:
	lda $05                                                  ; $be21 : $a5, $05
	sta $7fcd92.l                                                  ; $be23 : $8f, $92, $cd, $7f
	sep #ACCU_8                                                  ; $be27 : $e2, $20
	rts                                                  ; $be29 : $60


Call_3c_be2a:
	lda $0b                                                  ; $be2a : $a5, $0b
	asl                                                  ; $be2c : $0a
	asl                                                  ; $be2d : $0a
	tay                                                  ; $be2e : $a8
	rep #ACCU_8                                                  ; $be2f : $c2, $20
	lda $7fcd92.l                                                  ; $be31 : $af, $92, $cd, $7f
	clc                                                  ; $be35 : $18
	adc $c95e.w, Y                                                  ; $be36 : $79, $5e, $c9
	sta $05                                                  ; $be39 : $85, $05
	lda $7fcd94.l                                                  ; $be3b : $af, $94, $cd, $7f
	clc                                                  ; $be3f : $18
	adc $c960.w, Y                                                  ; $be40 : $79, $60, $c9
	sta $08                                                  ; $be43 : $85, $08
	sep #ACCU_8                                                  ; $be45 : $e2, $20
	rts                                                  ; $be47 : $60


Call_3c_be48:
	phd                                                  ; $be48 : $0b
	sta $0000.w                                                  ; $be49 : $8d, $00, $00
	asl                                                  ; $be4c : $0a
	tay                                                  ; $be4d : $a8
	pea $0000.w                                                  ; $be4e : $f4, $00, $00
	pld                                                  ; $be51 : $2b
	rep #ACCU_8                                                  ; $be52 : $c2, $20
	lda $c984.w, Y                                                  ; $be54 : $b9, $84, $c9
	sta $0010.w                                                  ; $be57 : $8d, $10, $00
	sep #ACCU_8                                                  ; $be5a : $e2, $20
	ldx $a5                                                  ; $be5c : $a6, $a5
	ldy #$b100.w                                                  ; $be5e : $a0, $00, $b1
	.db $10, $f0                                                  ; $be61 : $10, $f0

	and [$85]                                                  ; $be63 : $27, $85
	.db $00                                                  ; $be65 : $00
	sta $0603.w, X                                                  ; $be66 : $9d, $03, $06
	iny                                                  ; $be69 : $c8
	lda #$80.b                                                  ; $be6a : $a9, $80
	sta $0600.w, X                                                  ; $be6c : $9d, $00, $06
	inx                                                  ; $be6f : $e8
	rep #ACCU_8                                                  ; $be70 : $c2, $20
	lda ($10), Y                                                  ; $be72 : $b1, $10
	sta $0600.w, X                                                  ; $be74 : $9d, $00, $06
	sep #ACCU_8                                                  ; $be77 : $e2, $20
	inx                                                  ; $be79 : $e8
	inx                                                  ; $be7a : $e8
	inx                                                  ; $be7b : $e8
	iny                                                  ; $be7c : $c8
	iny                                                  ; $be7d : $c8

br_3c_be7e:
	lda ($10), Y                                                  ; $be7e : $b1, $10
	sta $0600.w, X                                                  ; $be80 : $9d, $00, $06
	iny                                                  ; $be83 : $c8
	inx                                                  ; $be84 : $e8
	dec $00                                                  ; $be85 : $c6, $00
	bne br_3c_be7e                                                  ; $be87 : $d0, $f5

	.db $80, $d5                                                  ; $be89 : $80, $d5

	stx $a5                                                  ; $be8b : $86, $a5
	pld                                                  ; $be8d : $2b
	rts                                                  ; $be8e : $60


Call_3c_be8f:
	rep #ACCU_8|IDX_8                                                  ; $be8f : $c2, $30
	lda #$0080.w                                                  ; $be91 : $a9, $80, $00
	sta $0008.w                                                  ; $be94 : $8d, $08, $00
	ldx #$0000.w                                                  ; $be97 : $a2, $00, $00
	jsr $02e016.l                                                  ; $be9a : $22, $16, $e0, $02
	sep #ACCU_8|IDX_8                                                  ; $be9e : $e2, $30
	bcs br_3c_bea6                                                  ; $bea0 : $b0, $04

	lda #$01.b                                                  ; $bea2 : $a9, $01
	tsb $3b                                                  ; $bea4 : $04, $3b

br_3c_bea6:
	rts                                                  ; $bea6 : $60


Call_3c_bea7:
	ldx $0b                                                  ; $bea7 : $a6, $0b
	lda $c97e.w, X                                                  ; $bea9 : $bd, $7e, $c9
	jsr Call_3c_be48.w                                                  ; $beac : $20, $48, $be
	rts                                                  ; $beaf : $60


Call_3c_beb0:
	lda $37                                                  ; $beb0 : $a5, $37
	beq br_3c_bec5                                                  ; $beb2 : $f0, $11

	lda wMainScreenDesignation.w                                                  ; $beb4 : $ad, $c1, $00
	eor #$02.b                                                  ; $beb7 : $49, $02
	sta wMainScreenDesignation.w                                                  ; $beb9 : $8d, $c1, $00
	lda wSubScreenDesignation.w                                                  ; $bebc : $ad, $c2, $00
	eor #$02.b                                                  ; $bebf : $49, $02
	sta wSubScreenDesignation.w                                                  ; $bec1 : $8d, $c2, $00
	rts                                                  ; $bec4 : $60


br_3c_bec5:
	lda #$02.b                                                  ; $bec5 : $a9, $02
	tsb wMainScreenDesignation.w                                                  ; $bec7 : $0c, $c1, $00
	tsb wSubScreenDesignation.w                                                  ; $beca : $0c, $c2, $00
	rts                                                  ; $becd : $60


br_3c_bece:
	ldx $01                                                  ; $bece : $a6, $01
	jmp ($bed3.w, X)                                                  ; $bed0 : $7c, $d3, $be


	tsb wBG3VertScroll                                                  ; $bed3 : $04, $bf
	wai                                                  ; $bed5 : $cb
	lda $dfc344.l, X                                                  ; $bed6 : $bf, $44, $c3, $df
	ldx $beeb.w, Y                                                  ; $beda : $be, $eb, $be
	sbc ($be), Y                                                  ; $bedd : $f1, $be
	lda $33                                                  ; $bedf : $a5, $33
	bmi br_3c_bee7                                                  ; $bee1 : $30, $04

	dec $30                                                  ; $bee3 : $c6, $30
	bne br_3c_befe                                                  ; $bee5 : $d0, $17

br_3c_bee7:
	jmp Func_2_db3f.l                                                  ; $bee7 : $5c, $3f, $db, $02


	lda #$02.b                                                  ; $beeb : $a9, $02
	sta $02                                                  ; $beed : $85, $02
	bra br_3c_befe                                                  ; $beef : $80, $0d

	jsr Func_2_ddfe.l                                                  ; $bef1 : $22, $fe, $dd, $02
	lda $01                                                  ; $bef5 : $a5, $01
	cmp #$04.b                                                  ; $bef7 : $c9, $04
	bne br_3c_befe                                                  ; $bef9 : $d0, $03

	jmp Jump_3c_bfed.w                                                  ; $befb : $4c, $ed, $bf


br_3c_befe:
	jmp Jump_3c_bfcb.w                                                  ; $befe : $4c, $cb, $bf


	sep #ACCU_8                                                  ; $bf01 : $e2, $20
	rts                                                  ; $bf03 : $60


	ldx $02                                                  ; $bf04 : $a6, $02
	jmp ($bf09.w, X)                                                  ; $bf06 : $7c, $09, $bf


	ora ($bf), Y                                                  ; $bf09 : $11, $bf
	and $bf, S                                                  ; $bf0b : $23, $bf
	bcs br_3c_bece                                                  ; $bf0d : $b0, $bf

	lda $20c2bf.l, X                                                  ; $bf0f : $bf, $bf, $c2, $20
	ldx #$26.b                                                  ; $bf13 : $a2, $26

br_3c_bf15:
	stz $0880.w, X                                                  ; $bf15 : $9e, $80, $08
	dex                                                  ; $bf18 : $ca
	dex                                                  ; $bf19 : $ca
	bpl br_3c_bf15                                                  ; $bf1a : $10, $f9

	sep #ACCU_8                                                  ; $bf1c : $e2, $20
	lda #$02.b                                                  ; $bf1e : $a9, $02
	sta $02                                                  ; $bf20 : $85, $02

br_3c_bf22:
	rtl                                                  ; $bf22 : $6b


	lda $0a03.w                                                  ; $bf23 : $ad, $03, $0a
	bit #$04.b                                                  ; $bf26 : $89, $04
	beq br_3c_bf22                                                  ; $bf28 : $f0, $f8

	lda #$e3.b                                                  ; $bf2a : $a9, $e3
	sta $20                                                  ; $bf2c : $85, $20
	lda #$cd.b                                                  ; $bf2e : $a9, $cd
	sta $21                                                  ; $bf30 : $85, $21
	lda $05                                                  ; $bf32 : $a5, $05
	sta $08a2.w                                                  ; $bf34 : $8d, $a2, $08
	lda $08                                                  ; $bf37 : $a5, $08
	sec                                                  ; $bf39 : $38
	sbc #$08.b                                                  ; $bf3a : $e9, $08
	sta $08                                                  ; $bf3c : $85, $08
	sta $08a3.w                                                  ; $bf3e : $8d, $a3, $08
	lda #$13.b                                                  ; $bf41 : $a9, $13
	sta wMainScreenDesignation.w                                                  ; $bf43 : $8d, $c1, $00
	lda #$01.b                                                  ; $bf46 : $a9, $01
	sta $0e                                                  ; $bf48 : $85, $0e
	stz $11                                                  ; $bf4a : $64, $11
	stz $30                                                  ; $bf4c : $64, $30
	lda #$12.b                                                  ; $bf4e : $a9, $12
	sta $27                                                  ; $bf50 : $85, $27
	sta $08a1.w                                                  ; $bf52 : $8d, $a1, $08
	lsr                                                  ; $bf55 : $4a
	sta $0884.w                                                  ; $bf56 : $8d, $84, $08
	lda #$03.b                                                  ; $bf59 : $a9, $03
	sta $26                                                  ; $bf5b : $85, $26
	lda #$18.b                                                  ; $bf5d : $a9, $18
	sta $28                                                  ; $bf5f : $85, $28
	rep #ACCU_8                                                  ; $bf61 : $c2, $20
	lda $cdf5.w                                                  ; $bf63 : $ad, $f5, $cd
	sta $0302.w                                                  ; $bf66 : $8d, $02, $03
	lda $cdf7.w                                                  ; $bf69 : $ad, $f7, $cd
	sta $0304.w                                                  ; $bf6c : $8d, $04, $03
	lda $cdf9.w                                                  ; $bf6f : $ad, $f9, $cd
	sta $0306.w                                                  ; $bf72 : $8d, $06, $03
	sep #ACCU_8                                                  ; $bf75 : $e2, $20
	lda #$ff.b                                                  ; $bf77 : $a9, $ff
	sta $1f60.w                                                  ; $bf79 : $8d, $60, $1f
	lda $08e00a.l                                                  ; $bf7c : $af, $0a, $e0, $08
	sta $0882.w                                                  ; $bf80 : $8d, $82, $08
	sta $0883.w                                                  ; $bf83 : $8d, $83, $08
	ldy #$a2.b                                                  ; $bf86 : $a0, $a2
	jsr Func_0_872f.l                                                  ; $bf88 : $22, $2f, $87, $00
	lda #$09.b                                                  ; $bf8c : $a9, $09
	sta wBGMode.w                                                  ; $bf8e : $8d, $cf, $00
	lda #$09.b                                                  ; $bf91 : $a9, $09
	sta $00ce.w                                                  ; $bf93 : $8d, $ce, $00
	lda #$13.b                                                  ; $bf96 : $a9, $13
	sta wMainScreenDesignation.w                                                  ; $bf98 : $8d, $c1, $00
	stz $3d                                                  ; $bf9b : $64, $3d
	stz $3e                                                  ; $bf9d : $64, $3e
	stz $3f                                                  ; $bf9f : $64, $3f
	stz $12                                                  ; $bfa1 : $64, $12
	lda #$01.b                                                  ; $bfa3 : $a9, $01
	sta $3c                                                  ; $bfa5 : $85, $3c
	lda #$3c.b                                                  ; $bfa7 : $a9, $3c
	sta $3a                                                  ; $bfa9 : $85, $3a
	lda #$04.b                                                  ; $bfab : $a9, $04
	sta $02                                                  ; $bfad : $85, $02
	rtl                                                  ; $bfaf : $6b


	dec $3a                                                  ; $bfb0 : $c6, $3a
	bne br_3c_bfbe                                                  ; $bfb2 : $d0, $0a

	ldy #$a4.b                                                  ; $bfb4 : $a0, $a4
	jsr Func_0_872f.l                                                  ; $bfb6 : $22, $2f, $87, $00
	lda #$06.b                                                  ; $bfba : $a9, $06
	sta $02                                                  ; $bfbc : $85, $02

br_3c_bfbe:
	rtl                                                  ; $bfbe : $6b


	jsr Call_3c_c3c9.w                                                  ; $bfbf : $20, $c9, $c3
	lda #$02.b                                                  ; $bfc2 : $a9, $02
	sta $01                                                  ; $bfc4 : $85, $01
	stz $02                                                  ; $bfc6 : $64, $02
	stz $03                                                  ; $bfc8 : $64, $03
	rtl                                                  ; $bfca : $6b


Jump_3c_bfcb:
	ldx $02                                                  ; $bfcb : $a6, $02
	jsr ($c007.w, X)                                                  ; $bfcd : $fc, $07, $c0
	lda $30                                                  ; $bfd0 : $a5, $30
	beq br_3c_bfd6                                                  ; $bfd2 : $f0, $02

	dec $30                                                  ; $bfd4 : $c6, $30

br_3c_bfd6:
	lda $27                                                  ; $bfd6 : $a5, $27
	beq br_3c_bfed                                                  ; $bfd8 : $f0, $13

	jsr Func_4_cb74.l                                                  ; $bfda : $22, $74, $cb, $04
	bmi br_3c_bfed                                                  ; $bfde : $30, $0d

	beq br_3c_bff6                                                  ; $bfe0 : $f0, $14

	lda #$01.b                                                  ; $bfe2 : $a9, $01
	sta $28                                                  ; $bfe4 : $85, $28
	lda #$3c.b                                                  ; $bfe6 : $a9, $3c
	sta $088f.w                                                  ; $bfe8 : $8d, $8f, $08
	bra br_3c_bff6                                                  ; $bfeb : $80, $09

Jump_3c_bfed:
br_3c_bfed:
	lda #$04.b                                                  ; $bfed : $a9, $04
	sta $01                                                  ; $bfef : $85, $01
	lda #$f0.b                                                  ; $bff1 : $a9, $f0
	sta $0890.w                                                  ; $bff3 : $8d, $90, $08

br_3c_bff6:
	jsr Func_4_cb31.l                                                  ; $bff6 : $22, $31, $cb, $04
	jsr Call_3c_c404.w                                                  ; $bffa : $20, $04, $c4
	jsr Call_3c_c398.w                                                  ; $bffd : $20, $98, $c3

Call_3c_c000:
	jsr Call_3c_c3c9.w                                                  ; $c000 : $20, $c9, $c3
	jsr Call_3c_c435.w                                                  ; $c003 : $20, $35, $c4
	rtl                                                  ; $c006 : $6b


	ora ($c0), Y                                                  ; $c007 : $11, $c0
	eor $c0aec0.l, X                                                  ; $c009 : $5f, $c0, $ae, $c0
	ror                                                  ; $c00d : $6a
	cmp ($3a, X)                                                  ; $c00e : $c1, $3a
	rep #$a6.b                                                  ; $c010 : $c2, $a6
	ora $7c, S                                                  ; $c012 : $03, $7c
	asl $c0, X                                                  ; $c014 : $16, $c0
	trb $37c0.w                                                  ; $c016 : $1c, $c0, $37
	cpy #$4d.b                                                  ; $c019 : $c0, $4d
	cpy #$a5.b                                                  ; $c01b : $c0, $a5
	and $036918.l, X                                                  ; $c01d : $3f, $18, $69, $03
	and #$857f.w                                                  ; $c021 : $29, $7f, $85
	and $0880ad.l, X                                                  ; $c024 : $3f, $ad, $80, $08
	ina                                                  ; $c028 : $1a
	cmp #$9030.w                                                  ; $c029 : $c9, $30, $90
	asl $a9                                                  ; $c02c : $06, $a9
	cop $85.b                                                  ; $c02e : $02, $85
	ora $a9, S                                                  ; $c030 : $03, $a9
	.db $30, $8d                                                  ; $c032 : $30, $8d

	.db $80, $08                                                  ; $c034 : $80, $08

	rts                                                  ; $c036 : $60


	lda $3f                                                  ; $c037 : $a5, $3f
	clc                                                  ; $c039 : $18
	adc #$8503.w                                                  ; $c03a : $69, $03, $85
	and $9080c9.l, X                                                  ; $c03d : $3f, $c9, $80, $90
	asl                                                  ; $c041 : $0a
	stz $3f                                                  ; $c042 : $64, $3f
	lda #$8504.w                                                  ; $c044 : $a9, $04, $85
	ora $a9, S                                                  ; $c047 : $03, $a9
	sei                                                  ; $c049 : $78
	sta $3a                                                  ; $c04a : $85, $3a
	rts                                                  ; $c04c : $60


	dec $3a                                                  ; $c04d : $c6, $3a
	bne br_3c_c05e                                                  ; $c04f : $d0, $0d

	jsr $04d1ef.l                                                  ; $c051 : $22, $ef, $d1, $04
	stz $30                                                  ; $c055 : $64, $30
	lda #$8502.w                                                  ; $c057 : $a9, $02, $85
	cop $64.b                                                  ; $c05a : $02, $64
	ora $60, S                                                  ; $c05c : $03, $60

br_3c_c05e:
	rts                                                  ; $c05e : $60


	ldx $03                                                  ; $c05f : $a6, $03
	jmp ($c064.w, X)                                                  ; $c061 : $7c, $64, $c0


	pla                                                  ; $c064 : $68
	cpy #$89.b                                                  ; $c065 : $c0, $89
	cpy #$a5.b                                                  ; $c067 : $c0, $a5
	ora ($89), Y                                                  ; $c069 : $11, $89
	rti                                                  ; $c06b : $40


	.db $f0, $04                                                  ; $c06c : $f0, $04

	lda #$80ff.w                                                  ; $c06e : $a9, $ff, $80
	cop $a9.b                                                  ; $c071 : $02, $a9
	ora ($8d, X)                                                  ; $c073 : $01, $8d
	sta $8d08.w                                                  ; $c075 : $8d, $08, $8d
	stx $a908.w                                                  ; $c078 : $8e, $08, $a9
	ora $8d, S                                                  ; $c07b : $03, $8d
	sta ($08), Y                                                  ; $c07d : $91, $08
	lda #$8d14.w                                                  ; $c07f : $a9, $14, $8d
	sta ($08)                                                  ; $c082 : $92, $08
	lda #$8502.w                                                  ; $c084 : $a9, $02, $85
	ora $60, S                                                  ; $c087 : $03, $60
	dec $0892.w                                                  ; $c089 : $ce, $92, $08
	.db $d0, $1a                                                  ; $c08c : $d0, $1a

	lda $088d.w                                                  ; $c08e : $ad, $8d, $08
	clc                                                  ; $c091 : $18
	adc $088e.w                                                  ; $c092 : $6d, $8e, $08
	sta $088d.w                                                  ; $c095 : $8d, $8d, $08
	lda #$8d14.w                                                  ; $c098 : $a9, $14, $8d
	sta ($08)                                                  ; $c09b : $92, $08
	dec $0891.w                                                  ; $c09d : $ce, $91, $08
	.db $d0, $06                                                  ; $c0a0 : $d0, $06

	lda #$8506.w                                                  ; $c0a2 : $a9, $06, $85
	cop $64.b                                                  ; $c0a5 : $02, $64
	ora $a9, S                                                  ; $c0a7 : $03, $a9
	ora ($8d, X)                                                  ; $c0a9 : $01, $8d
	txa                                                  ; $c0ab : $8a
	php                                                  ; $c0ac : $08
	rts                                                  ; $c0ad : $60


	ldx $03                                                  ; $c0ae : $a6, $03
	jsr ($c0b9.w, X)                                                  ; $c0b0 : $fc, $b9, $c0
	lda #$8d01.w                                                  ; $c0b3 : $a9, $01, $8d
	txa                                                  ; $c0b6 : $8a
	php                                                  ; $c0b7 : $08
	rts                                                  ; $c0b8 : $60


	cmp wBG3VertScroll+1                                                  ; $c0b9 : $c5, $c0
	sbc ($c0), Y                                                  ; $c0bb : $f1, $c0
	clc                                                  ; $c0bd : $18
	cmp ($2c, X)                                                  ; $c0be : $c1, $2c
	cmp ($40, X)                                                  ; $c0c0 : $c1, $40
	cmp ($54, X)                                                  ; $c0c2 : $c1, $54
	cmp ($a9, X)                                                  ; $c0c4 : $c1, $a9
	ora ($8d, X)                                                  ; $c0c6 : $01, $8d
	txa                                                  ; $c0c8 : $8a
	php                                                  ; $c0c9 : $08
	lda $0892.w                                                  ; $c0ca : $ad, $92, $08
	beq br_3c_c0d3                                                  ; $c0cd : $f0, $04

	dec $0892.w                                                  ; $c0cf : $ce, $92, $08
	rts                                                  ; $c0d2 : $60


br_3c_c0d3:
	lda $088d.w                                                  ; $c0d3 : $ad, $8d, $08
	cmp #$f001.w                                                  ; $c0d6 : $c9, $01, $f0
	ora $ed38.w                                                  ; $c0d9 : $0d, $38, $ed
	stx $8d08.w                                                  ; $c0dc : $8e, $08, $8d
	sta $a908.w                                                  ; $c0df : $8d, $08, $a9
	trb $8d                                                  ; $c0e2 : $14, $8d
	sta ($08)                                                  ; $c0e4 : $92, $08
	rts                                                  ; $c0e6 : $60


	lda #$8502.w                                                  ; $c0e7 : $a9, $02, $85
	ora $a9, S                                                  ; $c0ea : $03, $a9
	trb $8d                                                  ; $c0ec : $14, $8d
	sta ($08)                                                  ; $c0ee : $92, $08
	rts                                                  ; $c0f0 : $60


	lda #$8d01.w                                                  ; $c0f1 : $a9, $01, $8d
	txa                                                  ; $c0f4 : $8a
	php                                                  ; $c0f5 : $08
	lda $0892.w                                                  ; $c0f6 : $ad, $92, $08
	beq br_3c_c0ff                                                  ; $c0f9 : $f0, $04

	dec $0892.w                                                  ; $c0fb : $ce, $92, $08
	rts                                                  ; $c0fe : $60


br_3c_c0ff:
	lda $088d.w                                                  ; $c0ff : $ad, $8d, $08
	cmp #$f008.w                                                  ; $c102 : $c9, $08, $f0
	ora $6d18.w                                                  ; $c105 : $0d, $18, $6d
	stx $8d08.w                                                  ; $c108 : $8e, $08, $8d
	sta $a908.w                                                  ; $c10b : $8d, $08, $a9
	trb $8d                                                  ; $c10e : $14, $8d
	sta ($08)                                                  ; $c110 : $92, $08
	rts                                                  ; $c112 : $60


	lda #$8504.w                                                  ; $c113 : $a9, $04, $85
	ora $60, S                                                  ; $c116 : $03, $60
	lda $05                                                  ; $c118 : $a5, $05
	sec                                                  ; $c11a : $38
	sbc #$8503.w                                                  ; $c11b : $e9, $03, $85
	ora $a9                                                  ; $c11e : $05, $a9
	bit $05c5.w                                                  ; $c120 : $2c, $c5, $05
	.db $90, $06                                                  ; $c123 : $90, $06

	sta $05                                                  ; $c125 : $85, $05
	lda #$8506.w                                                  ; $c127 : $a9, $06, $85
	ora $60, S                                                  ; $c12a : $03, $60
	lda $08                                                  ; $c12c : $a5, $08
	sec                                                  ; $c12e : $38
	sbc #$8503.w                                                  ; $c12f : $e9, $03, $85
	php                                                  ; $c132 : $08
	lda #$c52c.w                                                  ; $c133 : $a9, $2c, $c5
	php                                                  ; $c136 : $08
	.db $90, $06                                                  ; $c137 : $90, $06

	sta $08                                                  ; $c139 : $85, $08
	lda #$8508.w                                                  ; $c13b : $a9, $08, $85
	ora $60, S                                                  ; $c13e : $03, $60
	lda $05                                                  ; $c140 : $a5, $05
	clc                                                  ; $c142 : $18
	adc #$8503.w                                                  ; $c143 : $69, $03, $85
	ora $a9                                                  ; $c146 : $05, $a9
	cld                                                  ; $c148 : $d8
	cmp $05                                                  ; $c149 : $c5, $05
	.db $b0, $06                                                  ; $c14b : $b0, $06

	sta $05                                                  ; $c14d : $85, $05
	lda #$850a.w                                                  ; $c14f : $a9, $0a, $85
	ora $60, S                                                  ; $c152 : $03, $60
	lda $08                                                  ; $c154 : $a5, $08
	clc                                                  ; $c156 : $18
	adc #$8503.w                                                  ; $c157 : $69, $03, $85
	php                                                  ; $c15a : $08
	lda #$c598.w                                                  ; $c15b : $a9, $98, $c5
	php                                                  ; $c15e : $08
	.db $b0, $08                                                  ; $c15f : $b0, $08

	sta $08                                                  ; $c161 : $85, $08
	stz $03                                                  ; $c163 : $64, $03
	lda #$8508.w                                                  ; $c165 : $a9, $08, $85
	cop $60.b                                                  ; $c168 : $02, $60
	ldx $03                                                  ; $c16a : $a6, $03
	jsr ($c175.w, X)                                                  ; $c16c : $fc, $75, $c1
	lda #$8d01.w                                                  ; $c16f : $a9, $01, $8d
	txa                                                  ; $c172 : $8a
	php                                                  ; $c173 : $08
	rts                                                  ; $c174 : $60


	tdc                                                  ; $c175 : $7b
	cmp ($90, X)                                                  ; $c176 : $c1, $90
	cmp ($fb, X)                                                  ; $c178 : $c1, $fb
	cmp ($a9, X)                                                  ; $c17a : $c1, $a9
	jsr ($1b85.w, X)                                                  ; $c17c : $fc, $85, $1b
	stz $1a                                                  ; $c17f : $64, $1a
	stz $1c                                                  ; $c181 : $64, $1c
	stz $1d                                                  ; $c183 : $64, $1d
	stz $1e                                                  ; $c185 : $64, $1e
	lda #$8502.w                                                  ; $c187 : $a9, $02, $85
	ora $a5, S                                                  ; $c18a : $03, $a5
	and [$8d]                                                  ; $c18c : $27, $8d
	lda ($08, X)                                                  ; $c18e : $a1, $08
	jsr $02d6f8.l                                                  ; $c190 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $c194 : $22, $f7, $c0, $04
	lda $2b                                                  ; $c198 : $a5, $2b
	bit #$f003.w                                                  ; $c19a : $89, $03, $f0
	ora $20, S                                                  ; $c19d : $03, $20
	and ($c2, X)                                                  ; $c19f : $21, $c2
	lda $27                                                  ; $c1a1 : $a5, $27
	cmp $08a1.w                                                  ; $c1a3 : $cd, $a1, $08
	beq br_3c_c1b5                                                  ; $c1a6 : $f0, $0d

	lda $2b                                                  ; $c1a8 : $a5, $2b
	bit #$d004.w                                                  ; $c1aa : $89, $04, $d0
	clc                                                  ; $c1ad : $18
	lda $27                                                  ; $c1ae : $a5, $27
	and #$8d7f.w                                                  ; $c1b0 : $29, $7f, $8d
	lda ($08, X)                                                  ; $c1b3 : $a1, $08

br_3c_c1b5:
	lda $0898.w                                                  ; $c1b5 : $ad, $98, $08
	cmp #$d008.w                                                  ; $c1b8 : $c9, $08, $d0
	ora #$989c.w                                                  ; $c1bb : $09, $9c, $98
	php                                                  ; $c1be : $08
	stz $03                                                  ; $c1bf : $64, $03
	lda #$8504.w                                                  ; $c1c1 : $a9, $04, $85
	cop $60.b                                                  ; $c1c4 : $02, $60
	lda $27                                                  ; $c1c6 : $a5, $27
	and #$387f.w                                                  ; $c1c8 : $29, $7f, $38
	sbc $08a1.w                                                  ; $c1cb : $ed, $a1, $08
	eor #$1aff.w                                                  ; $c1ce : $49, $ff, $1a
	cmp #$f001.w                                                  ; $c1d1 : $c9, $01, $f0
	tsb $02c9.w                                                  ; $c1d4 : $0c, $c9, $02
	.db $f0, $04                                                  ; $c1d7 : $f0, $04

	lda #$8006.w                                                  ; $c1d9 : $a9, $06, $80
	asl $a9                                                  ; $c1dc : $06, $a9
	asl $80                                                  ; $c1de : $06, $80
	cop $a9.b                                                  ; $c1e0 : $02, $a9
	asl $85                                                  ; $c1e2 : $06, $85
	ora $1c64.w, X                                                  ; $c1e4 : $1d, $64, $1c
	lda #$8540.w                                                  ; $c1e7 : $a9, $40, $85
	asl $27a5.w, X                                                  ; $c1ea : $1e, $a5, $27
	and #$8d7f.w                                                  ; $c1ed : $29, $7f, $8d
	lda ($08, X)                                                  ; $c1f0 : $a1, $08
	lda #$8501.w                                                  ; $c1f2 : $a9, $01, $85
	and $8504a9.l                                                  ; $c1f5 : $2f, $a9, $04, $85
	ora $60, S                                                  ; $c1f9 : $03, $60
	jsr $02d6f8.l                                                  ; $c1fb : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $c1ff : $22, $f7, $c0, $04
	lda $2b                                                  ; $c203 : $a5, $2b
	bit #$f003.w                                                  ; $c205 : $89, $03, $f0
	ora [$89]                                                  ; $c208 : $07, $89
	tsb $d0                                                  ; $c20a : $04, $d0
	ora $20, S                                                  ; $c20c : $03, $20
	and ($c2, X)                                                  ; $c20e : $21, $c2
	lda $2b                                                  ; $c210 : $a5, $2b
	bit #$f004.w                                                  ; $c212 : $89, $04, $f0
	asl                                                  ; $c215 : $0a
	stz $1c                                                  ; $c216 : $64, $1c
	stz $1d                                                  ; $c218 : $64, $1d
	stz $1e                                                  ; $c21a : $64, $1e
	lda #$8502.w                                                  ; $c21c : $a9, $02, $85
	ora $60, S                                                  ; $c21f : $03, $60

Call_3c_c221:
	inc $0898.w                                                  ; $c221 : $ee, $98, $08
	lda $088d.w                                                  ; $c224 : $ad, $8d, $08
	eor #$1aff.w                                                  ; $c227 : $49, $ff, $1a
	sta $088d.w                                                  ; $c22a : $8d, $8d, $08
	rep #ACCU_8                                                  ; $c22d : $c2, $20
	lda $1a                                                  ; $c22f : $a5, $1a
	eor #$ffff.w                                                  ; $c231 : $49, $ff, $ff
	ina                                                  ; $c234 : $1a
	sta $1a                                                  ; $c235 : $85, $1a
	sep #ACCU_8                                                  ; $c237 : $e2, $20
	rts                                                  ; $c239 : $60


	ldx $03                                                  ; $c23a : $a6, $03
	jmp ($c23f.w, X)                                                  ; $c23c : $7c, $3f, $c2


	eor #$c2.b                                                  ; $c23f : $49, $c2
	sta $c4c2.w, Y                                                  ; $c241 : $99, $c2, $c4
	rep #$db.b                                                  ; $c244 : $c2, $db
	rep #$0f.b                                                  ; $c246 : $c2, $0f
	cmp $a9, S                                                  ; $c248 : $c3, $a9
	ora ($8d, X)                                                  ; $c24a : $01, $8d
	txa                                                  ; $c24c : $8a
	php                                                  ; $c24d : $08
	lda $0892.w                                                  ; $c24e : $ad, $92, $08
	beq br_3c_c257                                                  ; $c251 : $f0, $04

	dec $0892.w                                                  ; $c253 : $ce, $92, $08
	rts                                                  ; $c256 : $60


br_3c_c257:
	lda $088d.w                                                  ; $c257 : $ad, $8d, $08
	cmp #$01.b                                                  ; $c25a : $c9, $01
	beq br_3c_c26b                                                  ; $c25c : $f0, $0d

	sec                                                  ; $c25e : $38
	sbc $088e.w                                                  ; $c25f : $ed, $8e, $08
	sta $088d.w                                                  ; $c262 : $8d, $8d, $08
	lda #$14.b                                                  ; $c265 : $a9, $14
	sta $0892.w                                                  ; $c267 : $8d, $92, $08
	rts                                                  ; $c26a : $60


br_3c_c26b:
	lda $3f                                                  ; $c26b : $a5, $3f
	and #$1f.b                                                  ; $c26d : $29, $1f
	beq br_3c_c272                                                  ; $c26f : $f0, $01

	rts                                                  ; $c271 : $60


br_3c_c272:
	lda $27                                                  ; $c272 : $a5, $27
	and #$1f.b                                                  ; $c274 : $29, $1f
	cmp $0884.w                                                  ; $c276 : $cd, $84, $08
	bcs br_3c_c292                                                  ; $c279 : $b0, $17

	lda #$02.b                                                  ; $c27b : $a9, $02
	sta $03                                                  ; $c27d : $85, $03
	stz $3f                                                  ; $c27f : $64, $3f
	stz $088a.w                                                  ; $c281 : $9c, $8a, $08
	lda #$01.b                                                  ; $c284 : $a9, $01
	sta $088b.w                                                  ; $c286 : $8d, $8b, $08
	sta $088e.w                                                  ; $c289 : $8d, $8e, $08
	lda #$14.b                                                  ; $c28c : $a9, $14
	sta $0892.w                                                  ; $c28e : $8d, $92, $08
	rts                                                  ; $c291 : $60


br_3c_c292:
	lda #$02.b                                                  ; $c292 : $a9, $02
	sta $02                                                  ; $c294 : $85, $02
	stz $03                                                  ; $c296 : $64, $03
	rts                                                  ; $c298 : $60


	dec $0892.w                                                  ; $c299 : $ce, $92, $08
	bne br_3c_c2be                                                  ; $c29c : $d0, $20

	lda #$14.b                                                  ; $c29e : $a9, $14
	sta $0892.w                                                  ; $c2a0 : $8d, $92, $08
	lda $088c.w                                                  ; $c2a3 : $ad, $8c, $08
	clc                                                  ; $c2a6 : $18
	adc $088e.w                                                  ; $c2a7 : $6d, $8e, $08
	sta $088c.w                                                  ; $c2aa : $8d, $8c, $08
	cmp #$08.b                                                  ; $c2ad : $c9, $08
	bne br_3c_c2be                                                  ; $c2af : $d0, $0d

	lda #$04.b                                                  ; $c2b1 : $a9, $04
	sta $03                                                  ; $c2b3 : $85, $03
	stz $089f.w                                                  ; $c2b5 : $9c, $9f, $08
	lda #$fe.b                                                  ; $c2b8 : $a9, $fe
	sta $1b                                                  ; $c2ba : $85, $1b
	stz $1a                                                  ; $c2bc : $64, $1a

br_3c_c2be:
	lda #$01.b                                                  ; $c2be : $a9, $01
	sta $0889.w                                                  ; $c2c0 : $8d, $89, $08
	rts                                                  ; $c2c3 : $60


	lda #$01.b                                                  ; $c2c4 : $a9, $01
	sta $0889.w                                                  ; $c2c6 : $8d, $89, $08
	ldx $089f.w                                                  ; $c2c9 : $ae, $9f, $08
	lda $cded.w, X                                                  ; $c2cc : $bd, $ed, $cd
	sta $1d                                                  ; $c2cf : $85, $1d
	stz $1c                                                  ; $c2d1 : $64, $1c
	lda #$40.b                                                  ; $c2d3 : $a9, $40
	sta $1e                                                  ; $c2d5 : $85, $1e
	lda #$06.b                                                  ; $c2d7 : $a9, $06
	sta $03                                                  ; $c2d9 : $85, $03
	lda #$01.b                                                  ; $c2db : $a9, $01
	sta $0889.w                                                  ; $c2dd : $8d, $89, $08
	jsr $02d6f8.l                                                  ; $c2e0 : $22, $f8, $d6, $02
	jsr $04c0f7.l                                                  ; $c2e4 : $22, $f7, $c0, $04
	lda $2b                                                  ; $c2e8 : $a5, $2b
	bit #$03.b                                                  ; $c2ea : $89, $03
	beq br_3c_c2f5                                                  ; $c2ec : $f0, $07

	bit #$04.b                                                  ; $c2ee : $89, $04
	bne br_3c_c2f5                                                  ; $c2f0 : $d0, $03

	jsr Call_3c_c221.w                                                  ; $c2f2 : $20, $21, $c2

br_3c_c2f5:
	lda $2b                                                  ; $c2f5 : $a5, $2b
	bit #$04.b                                                  ; $c2f7 : $89, $04
	beq br_3c_c30e                                                  ; $c2f9 : $f0, $13

	inc $089f.w                                                  ; $c2fb : $ee, $9f, $08
	lda $089f.w                                                  ; $c2fe : $ad, $9f, $08
	cmp #$08.b                                                  ; $c301 : $c9, $08
	bne br_3c_c30a                                                  ; $c303 : $d0, $05

	lda #$08.b                                                  ; $c305 : $a9, $08
	sta $03                                                  ; $c307 : $85, $03
	rts                                                  ; $c309 : $60


br_3c_c30a:
	lda #$04.b                                                  ; $c30a : $a9, $04
	sta $03                                                  ; $c30c : $85, $03

br_3c_c30e:
	rts                                                  ; $c30e : $60


	lda #$01.b                                                  ; $c30f : $a9, $01
	sta $0889.w                                                  ; $c311 : $8d, $89, $08
	lda $0892.w                                                  ; $c314 : $ad, $92, $08
	beq br_3c_c31d                                                  ; $c317 : $f0, $04

	dec $0892.w                                                  ; $c319 : $ce, $92, $08
	rts                                                  ; $c31c : $60


br_3c_c31d:
	lda $088c.w                                                  ; $c31d : $ad, $8c, $08
	cmp #$01.b                                                  ; $c320 : $c9, $01
	beq br_3c_c331                                                  ; $c322 : $f0, $0d

	sec                                                  ; $c324 : $38
	sbc $088e.w                                                  ; $c325 : $ed, $8e, $08
	sta $088c.w                                                  ; $c328 : $8d, $8c, $08
	lda #$14.b                                                  ; $c32b : $a9, $14
	sta $0892.w                                                  ; $c32d : $8d, $92, $08
	rts                                                  ; $c330 : $60


br_3c_c331:
	lda $3e                                                  ; $c331 : $a5, $3e
	and #$3f.b                                                  ; $c333 : $29, $3f
	beq br_3c_c338                                                  ; $c335 : $f0, $01

	rts                                                  ; $c337 : $60


br_3c_c338:
	lda #$02.b                                                  ; $c338 : $a9, $02
	sta $02                                                  ; $c33a : $85, $02
	stz $03                                                  ; $c33c : $64, $03
	stz $3e                                                  ; $c33e : $64, $3e
	stz $0889.w                                                  ; $c340 : $9c, $89, $08
	rts                                                  ; $c343 : $60


	jsr $02dae7.l                                                  ; $c344 : $22, $e7, $da, $02
	lda wMainScreenDesignation.w                                                  ; $c348 : $ad, $c1, $00
	and #$04.b                                                  ; $c34b : $29, $04
	beq br_3c_c35b                                                  ; $c34d : $f0, $0c

	lda wMainLoopCounter.w                                                  ; $c34f : $ad, $cb, $09
	and #$02.b                                                  ; $c352 : $29, $02
	beq br_3c_c35b                                                  ; $c354 : $f0, $05

	lda #$13.b                                                  ; $c356 : $a9, $13
	sta wMainScreenDesignation.w                                                  ; $c358 : $8d, $c1, $00

br_3c_c35b:
	rep #ACCU_8                                                  ; $c35b : $c2, $20
	lda #$fff0.w                                                  ; $c35d : $a9, $f0, $ff
	sta $0000.w                                                  ; $c360 : $8d, $00, $00
	sta $0002.w                                                  ; $c363 : $8d, $02, $00
	lda #$0020.w                                                  ; $c366 : $a9, $20, $00
	sta $0004.w                                                  ; $c369 : $8d, $04, $00
	sta $0006.w                                                  ; $c36c : $8d, $06, $00
	lda #$0007.w                                                  ; $c36f : $a9, $07, $00
	sta $0008.w                                                  ; $c372 : $8d, $08, $00
	sep #ACCU_8                                                  ; $c375 : $e2, $20
	jsr $04d6fb.l                                                  ; $c377 : $22, $fb, $d6, $04
	dec $0890.w                                                  ; $c37b : $ce, $90, $08
	bne br_3c_c397                                                  ; $c37e : $d0, $17

	lda #$13.b                                                  ; $c380 : $a9, $13
	sta wMainScreenDesignation.w                                                  ; $c382 : $8d, $c1, $00
	lda #$01.b                                                  ; $c385 : $a9, $01
	jsr $04d5e5.l                                                  ; $c387 : $22, $e5, $d5, $04
	lda #$01.b                                                  ; $c38b : $a9, $01
	trb $1f5f.w                                                  ; $c38d : $1c, $5f, $1f
	stz $1f60.w                                                  ; $c390 : $9c, $60, $1f
	jmp todo_DisablesEntity_d928.l                                                  ; $c393 : $5c, $28, $d9, $02


br_3c_c397:
	rtl                                                  ; $c397 : $6b


Call_3c_c398:
	lda $0888.w                                                  ; $c398 : $ad, $88, $08
	beq br_3c_c3a8                                                  ; $c39b : $f0, $0b

	dec $0888.w                                                  ; $c39d : $ce, $88, $08
	lda $3d                                                  ; $c3a0 : $a5, $3d
	clc                                                  ; $c3a2 : $18
	adc $088b.w                                                  ; $c3a3 : $6d, $8b, $08
	sta $3d                                                  ; $c3a6 : $85, $3d

br_3c_c3a8:
	lda $0889.w                                                  ; $c3a8 : $ad, $89, $08
	beq br_3c_c3b8                                                  ; $c3ab : $f0, $0b

	dec $0889.w                                                  ; $c3ad : $ce, $89, $08
	lda $3e                                                  ; $c3b0 : $a5, $3e
	clc                                                  ; $c3b2 : $18
	adc $088c.w                                                  ; $c3b3 : $6d, $8c, $08
	sta $3e                                                  ; $c3b6 : $85, $3e

br_3c_c3b8:
	lda $088a.w                                                  ; $c3b8 : $ad, $8a, $08
	beq br_3c_c3c8                                                  ; $c3bb : $f0, $0b

	dec $088a.w                                                  ; $c3bd : $ce, $8a, $08
	lda $3f                                                  ; $c3c0 : $a5, $3f
	clc                                                  ; $c3c2 : $18
	adc $088d.w                                                  ; $c3c3 : $6d, $8d, $08
	sta $3f                                                  ; $c3c6 : $85, $3f

br_3c_c3c8:
	rts                                                  ; $c3c8 : $60


Call_3c_c3c9:
	lda #$08.b                                                  ; $c3c9 : $a9, $08
	sta $1e28.w                                                  ; $c3cb : $8d, $28, $1e
	lda $3d                                                  ; $c3ce : $a5, $3d
	sta $1e29.w                                                  ; $c3d0 : $8d, $29, $1e
	lda $3e                                                  ; $c3d3 : $a5, $3e
	sta $1e2a.w                                                  ; $c3d5 : $8d, $2a, $1e
	lda $3f                                                  ; $c3d8 : $a5, $3f
	sta $1e2b.w                                                  ; $c3da : $8d, $2b, $1e
	lda $0880.w                                                  ; $c3dd : $ad, $80, $08
	sta $1e2c.w                                                  ; $c3e0 : $8d, $2c, $1e
	lda $0881.w                                                  ; $c3e3 : $ad, $81, $08
	sta $1e2d.w                                                  ; $c3e6 : $8d, $2d, $1e
	lda #$10.b                                                  ; $c3e9 : $a9, $10
	sta $1e2e.w                                                  ; $c3eb : $8d, $2e, $1e
	lda $0883.w                                                  ; $c3ee : $ad, $83, $08
	sta $1e2f.w                                                  ; $c3f1 : $8d, $2f, $1e
	stz $1f73.w                                                  ; $c3f4 : $9c, $73, $1f
	stz $1f74.w                                                  ; $c3f7 : $9c, $74, $1f
	lda $1f69.w                                                  ; $c3fa : $ad, $69, $1f
	clc                                                  ; $c3fd : $18
	adc #$08.b                                                  ; $c3fe : $69, $08

Call_3c_c400:
	sta $1f69.w                                                  ; $c400 : $8d, $69, $1f
	rts                                                  ; $c403 : $60


Call_3c_c404:
	lda $088f.w                                                  ; $c404 : $ad, $8f, $08
	beq br_3c_c430                                                  ; $c407 : $f0, $27

	dec $088f.w                                                  ; $c409 : $ce, $8f, $08
	lda $088f.w                                                  ; $c40c : $ad, $8f, $08
	and #$02.b                                                  ; $c40f : $29, $02
	asl                                                  ; $c411 : $0a
	asl                                                  ; $c412 : $0a
	tax                                                  ; $c413 : $aa
	rep #ACCU_8                                                  ; $c414 : $c2, $20
	lda $cdf5.w, X                                                  ; $c416 : $bd, $f5, $cd
	sta $0302.w                                                  ; $c419 : $8d, $02, $03
	lda $cdf7.w, X                                                  ; $c41c : $bd, $f7, $cd
	sta $0304.w                                                  ; $c41f : $8d, $04, $03
	lda $cdf9.w, X                                                  ; $c422 : $bd, $f9, $cd
	sta $0306.w                                                  ; $c425 : $8d, $06, $03
	sep #ACCU_8                                                  ; $c428 : $e2, $20
	lda #$01.b                                                  ; $c42a : $a9, $01
	sta wShouldUpdateCGRAM.w                                                  ; $c42c : $8d, $a1, $00
	rts                                                  ; $c42f : $60


br_3c_c430:
	lda #$18.b                                                  ; $c430 : $a9, $18
	sta $28                                                  ; $c432 : $85, $28
	rts                                                  ; $c434 : $60


Call_3c_c435:
	lda $3c                                                  ; $c435 : $a5, $3c
	beq br_3c_c43e                                                  ; $c437 : $f0, $05

	jsr $02dae7.l                                                  ; $c439 : $22, $e7, $da, $02
	rts                                                  ; $c43d : $60


br_3c_c43e:
	lda #$13.b                                                  ; $c43e : $a9, $13
	sta wMainScreenDesignation.w                                                  ; $c440 : $8d, $c1, $00
	rts                                                  ; $c443 : $60


Func_3c_c444:
	sep #ACCU_8|IDX_8                                                  ; $c444 : $e2, $30
	ldx $01                                                  ; $c446 : $a6, $01
	jmp (@states.w, X)                                                  ; $c448 : $7c, $4b, $c4

@states:
	.dw Func_3c_c479
	.dw $c636
	.dw $c86e
	.dw $c457
	.dw $c463
	.dw $c469


;
	lda $33                                                  ; $c457 : $a5, $33
	bmi br_3c_c45f                                                  ; $c459 : $30, $04

	dec $30                                                  ; $c45b : $c6, $30
	bne br_3c_c476                                                  ; $c45d : $d0, $17

br_3c_c45f:
	jmp Func_2_db3f.l                                                  ; $c45f : $5c, $3f, $db, $02


	lda #$02.b                                                  ; $c463 : $a9, $02
	sta $02                                                  ; $c465 : $85, $02
	bra br_3c_c476                                                  ; $c467 : $80, $0d

	jsr Func_2_ddfe.l                                                  ; $c469 : $22, $fe, $dd, $02
	lda $01                                                  ; $c46d : $a5, $01
	cmp #$04.b                                                  ; $c46f : $c9, $04
	bne br_3c_c476                                                  ; $c471 : $d0, $03

	jmp Jump_3c_c66f.w                                                  ; $c473 : $4c, $6f, $c6


br_3c_c476:
	jmp Jump_3c_c636.w                                                  ; $c476 : $4c, $36, $c6


Func_3c_c479:
	ldx $02                                                  ; $c479 : $a6, $02
	jmp (@substates.w, X)                                                  ; $c47b : $7c, $7e, $c4

@substates:
	.dw $c486
	.dw $c4f9
	.dw $c50f
	.dw $c55a


	lda $1f5d.w                                                  ; $c486 : $ad, $5d, $1f
	and #$04.b                                                  ; $c489 : $29, $04
	ora $0040.w                                                  ; $c48b : $0d, $40, $00
	beq @br_c491                                                  ; $c48e : $f0, $01

	rtl                                                  ; $c490 : $6b

@br_c491:
; Don't spawn if the stage is already beat
	jsr SetCarryIfCurrStageBossAlreadyBeat.l                                                  ; $c491 : $22, $7b, $e2, $02
	bcs @deleteSelf                                                  ; $c495 : $b0, $27

	jsr AequNumSubweaponsAcquired.l                                                  ; $c497 : $22, $fb, $e0, $02
	cmp #$07.b                                                  ; $c49b : $c9, $07
	beq @br_c4b7                                                  ; $c49d : $f0, $18

	cmp #$05.b                                                  ; $c49f : $c9, $05
	bmi @deleteSelf                                                  ; $c4a1 : $30, $1b

	lda $1fd9.w                                                  ; $c4a3 : $ad, $d9, $1f
	lsr                                                  ; $c4a6 : $4a
	lsr                                                  ; $c4a7 : $4a
	lsr                                                  ; $c4a8 : $4a
	lsr                                                  ; $c4a9 : $4a
	cmp wStageIdx.w                                                  ; $c4aa : $cd, $ae, $1f
	beq @br_c4b7                                                  ; $c4ad : $f0, $08

	jsr Func_4_be35.l                                                  ; $c4af : $22, $35, $be, $04
	and #$01.b                                                  ; $c4b3 : $29, $01
	beq @deleteSelf                                                  ; $c4b5 : $f0, $07

@br_c4b7:
	lda $1fd8.w                                                  ; $c4b7 : $ad, $d8, $1f
	bit #$0c.b                                                  ; $c4ba : $89, $0c
	beq br_3c_c4c2                                                  ; $c4bc : $f0, $04

@deleteSelf:
	jmp todo_DisablesEntity_d928.l                                                  ; $c4be : $5c, $28, $d9, $02


br_3c_c4c2:
	lda wStageIdx.w                                                  ; $c4c2 : $ad, $ae, $1f
	and #$0f.b                                                  ; $c4c5 : $29, $0f
	asl                                                  ; $c4c7 : $0a
	asl                                                  ; $c4c8 : $0a
	asl                                                  ; $c4c9 : $0a
	asl                                                  ; $c4ca : $0a
	ora $1fd9.w                                                  ; $c4cb : $0d, $d9, $1f
	sta $1fd9.w                                                  ; $c4ce : $8d, $d9, $1f
	ldy #$01.b                                                  ; $c4d1 : $a0, $01
	lda #$f6.b                                                  ; $c4d3 : $a9, $f6
	jsr Func_0_856d.l                                                  ; $c4d5 : $22, $6d, $85, $00
	jsr LoadCurrEnemyBaseData.l                                                  ; $c4d9 : $22, $5c, $e1, $02
	lda $28                                                  ; $c4dd : $a5, $28
	sta $1f57.w                                                  ; $c4df : $8d, $57, $1f
	lda #$02.b                                                  ; $c4e2 : $a9, $02
	sta $02                                                  ; $c4e4 : $85, $02
	stz $01                                                  ; $c4e6 : $64, $01
	stz $03                                                  ; $c4e8 : $64, $03
	stz $37                                                  ; $c4ea : $64, $37
	lda #$01.b                                                  ; $c4ec : $a9, $01
	tsb $1f5f.w                                                  ; $c4ee : $0c, $5f, $1f
	lda #$1e.b                                                  ; $c4f1 : $a9, $1e
	sta $39                                                  ; $c4f3 : $85, $39
	jmp todo_CausePlayerToFreeze.l                                                  ; $c4f5 : $5c, $ca, $d1, $04


	dec $39                                                  ; $c4f9 : $c6, $39
	beq br_3c_c4fe                                                  ; $c4fb : $f0, $01

	rtl                                                  ; $c4fd : $6b


br_3c_c4fe:
	lda #$04.b                                                  ; $c4fe : $a9, $04
	sta $02                                                  ; $c500 : $85, $02
	ldx wStageIdx.w                                                  ; $c502 : $ae, $ae, $1f
	lda $ea66.w, X                                                  ; $c505 : $bd, $66, $ea
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $c508 : $8d, $18, $1f
	jmp FarAddThreadToDynamicallyLoadSpriteData.l                                                  ; $c50b : $5c, $dc, $b1, $00


	lda $0040.w                                                  ; $c50f : $ad, $40, $00
	beq br_3c_c515                                                  ; $c512 : $f0, $01

	rtl                                                  ; $c514 : $6b


br_3c_c515:
	stz $27                                                  ; $c515 : $64, $27
	stz $18                                                  ; $c517 : $64, $18
	lda #$06.b                                                  ; $c519 : $a9, $06
	sta $12                                                  ; $c51b : $85, $12
	lda #$29.b                                                  ; $c51d : $a9, $29
	sta $11                                                  ; $c51f : $85, $11
	sta $38                                                  ; $c521 : $85, $38
	lda #$cc.b                                                  ; $c523 : $a9, $cc
	sta $10                                                  ; $c525 : $85, $10
	rep #ACCU_8|F_CARRY                                                  ; $c527 : $c2, $21
	lda #$00c0.w                                                  ; $c529 : $a9, $c0, $00
	adc wNewStageScrollX.w                                                  ; $c52c : $6d, $5d, $1e
	sta $05                                                  ; $c52f : $85, $05
	lda #$ffe0.w                                                  ; $c531 : $a9, $e0, $ff
	clc                                                  ; $c534 : $18
	adc wNewStageScrollY.w                                                  ; $c535 : $6d, $60, $1e
	sta $08                                                  ; $c538 : $85, $08
	lda #$ea5c.w                                                  ; $c53a : $a9, $5c, $ea
	sta $20                                                  ; $c53d : $85, $20
	lda #$fd00.w                                                  ; $c53f : $a9, $00, $fd
	sta $1c                                                  ; $c542 : $85, $1c
	stz $1a                                                  ; $c544 : $64, $1a
	lda #$f505.w                                                  ; $c546 : $a9, $05, $f5
	sta $31                                                  ; $c549 : $85, $31
	tdc                                                  ; $c54b : $7b
	sta $1f1f.w                                                  ; $c54c : $8d, $1f, $1f
	sep #ACCU_8                                                  ; $c54f : $e2, $20
	lda #$06.b                                                  ; $c551 : $a9, $06
	sta $02                                                  ; $c553 : $85, $02
	lda #$1e.b                                                  ; $c555 : $a9, $1e
	sta $39                                                  ; $c557 : $85, $39
	rtl                                                  ; $c559 : $6b


	ldx $03                                                  ; $c55a : $a6, $03
	jsr ($c56b.w, X)                                                  ; $c55c : $fc, $6b, $c5
	jsr Func_2_d636.l                                                  ; $c55f : $22, $36, $d6, $02
	jsr AnimateEntity.l                                                  ; $c563 : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $c567 : $5c, $a2, $bc, $04


	adc [$c5], Y                                                  ; $c56b : $77, $c5
	.db $82                                                  ; $c56d : $82

	cmp $a9                                                  ; $c56e : $c5, $a9
	cmp wBG1VertScroll+1                                                  ; $c570 : $c5, $b8
	cmp $e7                                                  ; $c572 : $c5, $e7
	cmp $07                                                  ; $c574 : $c5, $07
	dec $a9                                                  ; $c576 : $c6, $a9
	cop $85.b                                                  ; $c578 : $02, $85
	ora $a9, S                                                  ; $c57a : $03, $a9
	.db $00                                                  ; $c57c : $00
	jsr SetupEntitysAnimation.l                                                  ; $c57d : $22, $67, $b9, $04
	rts                                                  ; $c581 : $60


	jsr Func_2_d812.l                                                  ; $c582 : $22, $12, $d8, $02
	rep #ACCU_8|F_CARRY                                                  ; $c586 : $c2, $21
	lda wNewStageScrollY.w                                                  ; $c588 : $ad, $60, $1e
	adc #$0078.w                                                  ; $c58b : $69, $78, $00
	cmp $08                                                  ; $c58e : $c5, $08
	sep #ACCU_8                                                  ; $c590 : $e2, $20
	bpl br_3c_c5a8                                                  ; $c592 : $10, $14

	jsr $04c0f7.l                                                  ; $c594 : $22, $f7, $c0, $04
	lda $2b                                                  ; $c598 : $a5, $2b
	bit #$04.b                                                  ; $c59a : $89, $04
	beq br_3c_c5a8                                                  ; $c59c : $f0, $0a

	lda #$04.b                                                  ; $c59e : $a9, $04
	sta $03                                                  ; $c5a0 : $85, $03
	lda #$00.b                                                  ; $c5a2 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $c5a4 : $22, $67, $b9, $04

br_3c_c5a8:
	rts                                                  ; $c5a8 : $60


	lda $0f                                                  ; $c5a9 : $a5, $0f
	bpl br_3c_c5a8                                                  ; $c5ab : $10, $fb

	lda #$06.b                                                  ; $c5ad : $a9, $06
	sta $03                                                  ; $c5af : $85, $03
	lda #$00.b                                                  ; $c5b1 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $c5b3 : $22, $67, $b9, $04
	rts                                                  ; $c5b7 : $60


	lda $39                                                  ; $c5b8 : $a5, $39
	beq br_3c_c5bf                                                  ; $c5ba : $f0, $03

	dec $39                                                  ; $c5bc : $c6, $39
	rts                                                  ; $c5be : $60


br_3c_c5bf:
	lda $1fb2.w                                                  ; $c5bf : $ad, $b2, $1f
	bit #$08.b                                                  ; $c5c2 : $89, $08
	beq br_3c_c5cf                                                  ; $c5c4 : $f0, $09

	lda #$78.b                                                  ; $c5c6 : $a9, $78
	sta $39                                                  ; $c5c8 : $85, $39
	lda #$0a.b                                                  ; $c5ca : $a9, $0a
	sta $03                                                  ; $c5cc : $85, $03
	rts                                                  ; $c5ce : $60


br_3c_c5cf:
	lda #$08.b                                                  ; $c5cf : $a9, $08
	tsb $1fb2.w                                                  ; $c5d1 : $0c, $b2, $1f
	lda #$08.b                                                  ; $c5d4 : $a9, $08
	sta $03                                                  ; $c5d6 : $85, $03
	sta $3b                                                  ; $c5d8 : $85, $3b
	lda #$35.b                                                  ; $c5da : $a9, $35
	sta $0008.w                                                  ; $c5dc : $8d, $08, $00
	sta $1f56.w                                                  ; $c5df : $8d, $56, $1f
	jsr $02fcb1.l                                                  ; $c5e2 : $22, $b1, $fc, $02
	rts                                                  ; $c5e6 : $60


	lda $1f3f.w                                                  ; $c5e7 : $ad, $3f, $1f
	bmi br_3c_c5f5                                                  ; $c5ea : $30, $09

	lda #$0a.b                                                  ; $c5ec : $a9, $0a
	sta $03                                                  ; $c5ee : $85, $03
	lda #$02.b                                                  ; $c5f0 : $a9, $02
	sta $39                                                  ; $c5f2 : $85, $39
	rts                                                  ; $c5f4 : $60


br_3c_c5f5:
	lda #$00.b                                                  ; $c5f5 : $a9, $00
	sta $0000.w                                                  ; $c5f7 : $8d, $00, $00
	lda #$0a.b                                                  ; $c5fa : $a9, $0a
	sta $0001.w                                                  ; $c5fc : $8d, $01, $00
	stz $0002.w                                                  ; $c5ff : $9c, $02, $00
	jsr $02e24b.l                                                  ; $c602 : $22, $4b, $e2, $02
	rts                                                  ; $c606 : $60


	dec $39                                                  ; $c607 : $c6, $39
	bne br_3c_c635                                                  ; $c609 : $d0, $2a

	lda #$02.b                                                  ; $c60b : $a9, $02
	sta $39                                                  ; $c60d : $85, $39
	lda $27                                                  ; $c60f : $a5, $27
	and #$7f.b                                                  ; $c611 : $29, $7f
	cmp #$20.b                                                  ; $c613 : $c9, $20
	beq br_3c_c623                                                  ; $c615 : $f0, $0c

	ina                                                  ; $c617 : $1a
	ora #$80.b                                                  ; $c618 : $09, $80
	sta $27                                                  ; $c61a : $85, $27
	lda #$15.b                                                  ; $c61c : $a9, $15
	jsr Func_1_802b.l                                                  ; $c61e : $22, $2b, $80, $01
	rts                                                  ; $c622 : $60


br_3c_c623:
	lda #$02.b                                                  ; $c623 : $a9, $02
	sta $01                                                  ; $c625 : $85, $01
	sta $02                                                  ; $c627 : $85, $02
	stz $03                                                  ; $c629 : $64, $03
	jsr $04d1ef.l                                                  ; $c62b : $22, $ef, $d1, $04
	lda #$1a.b                                                  ; $c62f : $a9, $1a
	jsr Func_0_84bc.l                                                  ; $c631 : $22, $bc, $84, $00

br_3c_c635:
	rts                                                  ; $c635 : $60


Jump_3c_c636:
	jsr $04d8d5.l                                                  ; $c636 : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $c63a : $22, $64, $df, $02
	ldx $02                                                  ; $c63e : $a6, $02
	jsr ($c6cb.w, X)                                                  ; $c640 : $fc, $cb, $c6
	jsr Func_4_cb74.l                                                  ; $c643 : $22, $74, $cb, $04
	bmi br_3c_c66f                                                  ; $c647 : $30, $26

	bne br_3c_c65b                                                  ; $c649 : $d0, $10

	lda $27                                                  ; $c64b : $a5, $27
	beq br_3c_c66f                                                  ; $c64d : $f0, $20

	stz $36                                                  ; $c64f : $64, $36
	jsr Func_4_cb31.l                                                  ; $c651 : $22, $31, $cb, $04
	beq br_3c_c690                                                  ; $c655 : $f0, $39

	inc $36                                                  ; $c657 : $e6, $36
	bra br_3c_c690                                                  ; $c659 : $80, $35

br_3c_c65b:
	lda #$21.b                                                  ; $c65b : $a9, $21
	jsr Func_1_8000.l                                                  ; $c65d : $22, $00, $80, $01
	lda #$3c.b                                                  ; $c661 : $a9, $3c
	sta $37                                                  ; $c663 : $85, $37
	lda #$01.b                                                  ; $c665 : $a9, $01
	sta $28                                                  ; $c667 : $85, $28
	lda #$0e.b                                                  ; $c669 : $a9, $0e
	trb $11                                                  ; $c66b : $14, $11
	bra br_3c_c690                                                  ; $c66d : $80, $21

Jump_3c_c66f:
br_3c_c66f:
	jsr Call_3c_c6ab.w                                                  ; $c66f : $20, $ab, $c6
	lda #$04.b                                                  ; $c672 : $a9, $04
	sta $01                                                  ; $c674 : $85, $01
	stz $02                                                  ; $c676 : $64, $02
	stz $03                                                  ; $c678 : $64, $03
	stz $3a                                                  ; $c67a : $64, $3a
	stz $34                                                  ; $c67c : $64, $34
	ldy #$01.b                                                  ; $c67e : $a0, $01
	lda #$f6.b                                                  ; $c680 : $a9, $f6
	jsr Func_0_856d.l                                                  ; $c682 : $22, $6d, $85, $00
	lda #$00.b                                                  ; $c686 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $c688 : $22, $67, $b9, $04
	jsr todo_CausePlayerToFreeze.l                                                  ; $c68c : $22, $ca, $d1, $04

br_3c_c690:
	lda $01                                                  ; $c690 : $a5, $01
	sta $1f54.w                                                  ; $c692 : $8d, $54, $1f
	lda $02                                                  ; $c695 : $a5, $02
	sta $1f55.w                                                  ; $c697 : $8d, $55, $1f
	lda $03                                                  ; $c69a : $a5, $03
	sta $1f56.w                                                  ; $c69c : $8d, $56, $1f
	jsr Func_2_d636.l                                                  ; $c69f : $22, $36, $d6, $02
	jsr AnimateEntity.l                                                  ; $c6a3 : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $c6a7 : $5c, $a2, $bc, $04


Call_3c_c6ab:
	lda $1f2f.w                                                  ; $c6ab : $ad, $2f, $1f
	cmp #$0b.b                                                  ; $c6ae : $c9, $0b
	beq br_3c_c6c8                                                  ; $c6b0 : $f0, $16

	cmp #$14.b                                                  ; $c6b2 : $c9, $14
	beq br_3c_c6c8                                                  ; $c6b4 : $f0, $12

	cmp #$1c.b                                                  ; $c6b6 : $c9, $1c
	beq br_3c_c6c8                                                  ; $c6b8 : $f0, $0e

	cmp #$0e.b                                                  ; $c6ba : $c9, $0e
	beq br_3c_c6c8                                                  ; $c6bc : $f0, $0a

	cmp #$17.b                                                  ; $c6be : $c9, $17
	beq br_3c_c6c8                                                  ; $c6c0 : $f0, $06

	lda #$01.b                                                  ; $c6c2 : $a9, $01
	sta $3d                                                  ; $c6c4 : $85, $3d
	bra br_3c_c6ca                                                  ; $c6c6 : $80, $02

br_3c_c6c8:
	stz $3d                                                  ; $c6c8 : $64, $3d

br_3c_c6ca:
	rts                                                  ; $c6ca : $60


	cmp ($c6, S), Y                                                  ; $c6cb : $d3, $c6
	sep #$c6.b                                                  ; $c6cd : $e2, $c6
	and $dcc7.w                                                  ; $c6cf : $2d, $c7, $dc
	cmp [$22]                                                  ; $c6d2 : $c7, $22
	and $c602e1.l, X                                                  ; $c6d4 : $3f, $e1, $02, $c6
	and $06d0.w, Y                                                  ; $c6d8 : $39, $d0, $06
	lda $03                                                  ; $c6db : $a5, $03
	sta $02                                                  ; $c6dd : $85, $02
	stz $03                                                  ; $c6df : $64, $03
	rts                                                  ; $c6e1 : $60


	ldx $03                                                  ; $c6e2 : $a6, $03
	jmp ($c6e7.w, X)                                                  ; $c6e4 : $7c, $e7, $c6


	sbc $fac6.w                                                  ; $c6e7 : $ed, $c6, $fa
	dec $18                                                  ; $c6ea : $c6, $18
	cmp [$a9]                                                  ; $c6ec : $c7, $a9
	cop $85.b                                                  ; $c6ee : $02, $85
	ora $64, S                                                  ; $c6f0 : $03, $64
	and $0ea9.w, X                                                  ; $c6f2 : $3d, $a9, $0e
	jsr SetupEntitysAnimation.l                                                  ; $c6f5 : $22, $67, $b9, $04
	rts                                                  ; $c6f9 : $60


	lda $3d                                                  ; $c6fa : $a5, $3d
	bne br_3c_c709                                                  ; $c6fc : $d0, $0b

	lda $0f                                                  ; $c6fe : $a5, $0f
	bit #$40.b                                                  ; $c700 : $89, $40
	beq br_3c_c717                                                  ; $c702 : $f0, $13

	inc $3d                                                  ; $c704 : $e6, $3d
	jsr Call_3c_c9c8.w                                                  ; $c706 : $20, $c8, $c9

br_3c_c709:
	lda $0f                                                  ; $c709 : $a5, $0f
	bpl br_3c_c717                                                  ; $c70b : $10, $0a

	lda #$04.b                                                  ; $c70d : $a9, $04
	sta $03                                                  ; $c70f : $85, $03
	lda #$0f.b                                                  ; $c711 : $a9, $0f
	jsr SetupEntitysAnimation.l                                                  ; $c713 : $22, $67, $b9, $04

br_3c_c717:
	rts                                                  ; $c717 : $60


	lda $0f                                                  ; $c718 : $a5, $0f
	bpl br_3c_c72c                                                  ; $c71a : $10, $10

	stz $02                                                  ; $c71c : $64, $02
	lda #$04.b                                                  ; $c71e : $a9, $04
	sta $03                                                  ; $c720 : $85, $03
	lda #$3c.b                                                  ; $c722 : $a9, $3c
	sta $39                                                  ; $c724 : $85, $39
	lda #$00.b                                                  ; $c726 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $c728 : $22, $67, $b9, $04

br_3c_c72c:
	rts                                                  ; $c72c : $60


	ldx $03                                                  ; $c72d : $a6, $03
	jmp ($c732.w, X)                                                  ; $c72f : $7c, $32, $c7


	sec                                                  ; $c732 : $38
	cmp [$55]                                                  ; $c733 : $c7, $55
	cmp [$a0]                                                  ; $c735 : $c7, $a0
	cmp [$a5]                                                  ; $c737 : $c7, $a5
	ora ($89), Y                                                  ; $c739 : $11, $89
	rti                                                  ; $c73b : $40


	beq br_3c_c742                                                  ; $c73c : $f0, $04

	lda #$04.b                                                  ; $c73e : $a9, $04
	bra br_3c_c744                                                  ; $c740 : $80, $02

br_3c_c742:
	lda #$fc.b                                                  ; $c742 : $a9, $fc

br_3c_c744:
	sta $1b                                                  ; $c744 : $85, $1b
	stz $1a                                                  ; $c746 : $64, $1a
	lda #$02.b                                                  ; $c748 : $a9, $02
	sta $03                                                  ; $c74a : $85, $03
	stz $3d                                                  ; $c74c : $64, $3d
	lda #$01.b                                                  ; $c74e : $a9, $01
	jsr SetupEntitysAnimation.l                                                  ; $c750 : $22, $67, $b9, $04
	rts                                                  ; $c754 : $60


	lda $3d                                                  ; $c755 : $a5, $3d
	bne br_3c_c765                                                  ; $c757 : $d0, $0c

	lda $0f                                                  ; $c759 : $a5, $0f
	bpl br_3c_c79f                                                  ; $c75b : $10, $42

	inc $3d                                                  ; $c75d : $e6, $3d
	lda #$02.b                                                  ; $c75f : $a9, $02
	jsr SetupEntitysAnimation.l                                                  ; $c761 : $22, $67, $b9, $04

br_3c_c765:
	jsr AddEntityXSpeedOntoSubX.l                                                  ; $c765 : $22, $f3, $d7, $02
	jsr Call_3c_c97f.w                                                  ; $c769 : $20, $7f, $c9
	lda $36                                                  ; $c76c : $a5, $36
	beq br_3c_c783                                                  ; $c76e : $f0, $13

	jsr $02e13f.l                                                  ; $c770 : $22, $3f, $e1, $02
	lda #$06.b                                                  ; $c774 : $a9, $06
	sta $02                                                  ; $c776 : $85, $02
	stz $03                                                  ; $c778 : $64, $03
	stz $3d                                                  ; $c77a : $64, $3d
	lda #$03.b                                                  ; $c77c : $a9, $03
	jsr SetupEntitysAnimation.l                                                  ; $c77e : $22, $67, $b9, $04
	rts                                                  ; $c782 : $60


br_3c_c783:
	jsr $04c0f7.l                                                  ; $c783 : $22, $f7, $c0, $04
	lda $2b                                                  ; $c787 : $a5, $2b
	bit #$03.b                                                  ; $c789 : $89, $03
	beq br_3c_c79f                                                  ; $c78b : $f0, $12

	stz $3d                                                  ; $c78d : $64, $3d
	lda #$3c.b                                                  ; $c78f : $a9, $3c
	sta $39                                                  ; $c791 : $85, $39
	ldx #$02.b                                                  ; $c793 : $a2, $02
	ldy #$01.b                                                  ; $c795 : $a0, $01
	jsr Func_4_d577.l                                                  ; $c797 : $22, $77, $d5, $04
	lda #$04.b                                                  ; $c79b : $a9, $04
	sta $03                                                  ; $c79d : $85, $03

br_3c_c79f:
	rts                                                  ; $c79f : $60


	dec $39                                                  ; $c7a0 : $c6, $39
	beq br_3c_c7c5                                                  ; $c7a2 : $f0, $21

	lda $3d                                                  ; $c7a4 : $a5, $3d
	beq br_3c_c7b7                                                  ; $c7a6 : $f0, $0f

	lsr                                                  ; $c7a8 : $4a
	bcc br_3c_c7db                                                  ; $c7a9 : $90, $30

	lda $0a08.w                                                  ; $c7ab : $ad, $08, $0a
	beq br_3c_c7b7                                                  ; $c7ae : $f0, $07

	inc $3d                                                  ; $c7b0 : $e6, $3d
	jsr $04d1ef.l                                                  ; $c7b2 : $22, $ef, $d1, $04
	rts                                                  ; $c7b6 : $60


br_3c_c7b7:
	lda $0a03.w                                                  ; $c7b7 : $ad, $03, $0a
	bit #$03.b                                                  ; $c7ba : $89, $03
	beq br_3c_c7db                                                  ; $c7bc : $f0, $1d

	jsr todo_CausePlayerToFreeze.l                                                  ; $c7be : $22, $ca, $d1, $04
	inc $3d                                                  ; $c7c2 : $e6, $3d
	rts                                                  ; $c7c4 : $60


br_3c_c7c5:
	lda #$3c.b                                                  ; $c7c5 : $a9, $3c
	sta $39                                                  ; $c7c7 : $85, $39
	lda #$02.b                                                  ; $c7c9 : $a9, $02
	sta $03                                                  ; $c7cb : $85, $03
	stz $02                                                  ; $c7cd : $64, $02
	stz $3d                                                  ; $c7cf : $64, $3d
	jsr $04d1ef.l                                                  ; $c7d1 : $22, $ef, $d1, $04
	lda #$00.b                                                  ; $c7d5 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $c7d7 : $22, $67, $b9, $04

br_3c_c7db:
	rts                                                  ; $c7db : $60


	ldx $03                                                  ; $c7dc : $a6, $03
	jmp ($c7e1.w, X)                                                  ; $c7de : $7c, $e1, $c7


	sbc #$c7.b                                                  ; $c7e1 : $e9, $c7
	tsb $19c8.w                                                  ; $c7e3 : $0c, $c8, $19
	iny                                                  ; $c7e6 : $c8
	eor $c8                                                  ; $c7e7 : $45, $c8
	lda $3d                                                  ; $c7e9 : $a5, $3d
	bne br_3c_c7f9                                                  ; $c7eb : $d0, $0c

	lda $0f                                                  ; $c7ed : $a5, $0f
	bit #$40.b                                                  ; $c7ef : $89, $40
	beq br_3c_c80b                                                  ; $c7f1 : $f0, $18

	jsr Call_3c_c9a4.w                                                  ; $c7f3 : $20, $a4, $c9
	inc $3d                                                  ; $c7f6 : $e6, $3d
	rts                                                  ; $c7f8 : $60


br_3c_c7f9:
	lda $0f                                                  ; $c7f9 : $a5, $0f
	bpl br_3c_c80b                                                  ; $c7fb : $10, $0e

	lda #$02.b                                                  ; $c7fd : $a9, $02
	sta $03                                                  ; $c7ff : $85, $03
	lda #$0a.b                                                  ; $c801 : $a9, $0a
	sta $39                                                  ; $c803 : $85, $39
	lda #$05.b                                                  ; $c805 : $a9, $05
	jsr SetupEntitysAnimation.l                                                  ; $c807 : $22, $67, $b9, $04

br_3c_c80b:
	rts                                                  ; $c80b : $60


	jsr $02e13f.l                                                  ; $c80c : $22, $3f, $e1, $02
	dec $39                                                  ; $c810 : $c6, $39
	bne br_3c_c80b                                                  ; $c812 : $d0, $f7

	lda #$04.b                                                  ; $c814 : $a9, $04
	sta $03                                                  ; $c816 : $85, $03
	rts                                                  ; $c818 : $60


	jsr $02e13f.l                                                  ; $c819 : $22, $3f, $e1, $02
	ldy #$38.b                                                  ; $c81d : $a0, $38
	jsr $02da99.l                                                  ; $c81f : $22, $99, $da, $02
	bcs br_3c_c83a                                                  ; $c823 : $b0, $15

	ldy #$40.b                                                  ; $c825 : $a0, $40
	jsr $02dab8.l                                                  ; $c827 : $22, $b8, $da, $02
	bcs br_3c_c839                                                  ; $c82b : $b0, $0c

	lda #$06.b                                                  ; $c82d : $a9, $06
	sta $03                                                  ; $c82f : $85, $03
	stz $3d                                                  ; $c831 : $64, $3d
	lda #$06.b                                                  ; $c833 : $a9, $06
	jsr SetupEntitysAnimation.l                                                  ; $c835 : $22, $67, $b9, $04

br_3c_c839:
	rts                                                  ; $c839 : $60


br_3c_c83a:
	lda #$78.b                                                  ; $c83a : $a9, $78
	sta $39                                                  ; $c83c : $85, $39
	lda #$04.b                                                  ; $c83e : $a9, $04
	sta $03                                                  ; $c840 : $85, $03
	stz $02                                                  ; $c842 : $64, $02
	rts                                                  ; $c844 : $60


	lda $3d                                                  ; $c845 : $a5, $3d
	bne br_3c_c859                                                  ; $c847 : $d0, $10

	lda $0f                                                  ; $c849 : $a5, $0f
	bit #$40.b                                                  ; $c84b : $89, $40
	beq br_3c_c86d                                                  ; $c84d : $f0, $1e

	jsr $04cd6a.l                                                  ; $c84f : $22, $6a, $cd, $04
	jsr Call_3c_c9b6.w                                                  ; $c853 : $20, $b6, $c9
	inc $3d                                                  ; $c856 : $e6, $3d
	rts                                                  ; $c858 : $60


br_3c_c859:
	lda $0f                                                  ; $c859 : $a5, $0f
	bpl br_3c_c86d                                                  ; $c85b : $10, $10

	lda #$3c.b                                                  ; $c85d : $a9, $3c
	sta $39                                                  ; $c85f : $85, $39
	lda #$04.b                                                  ; $c861 : $a9, $04
	sta $03                                                  ; $c863 : $85, $03
	stz $02                                                  ; $c865 : $64, $02
	lda #$00.b                                                  ; $c867 : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $c869 : $22, $67, $b9, $04

br_3c_c86d:
	rts                                                  ; $c86d : $60


	lda $3d                                                  ; $c86e : $a5, $3d
	beq br_3c_c877                                                  ; $c870 : $f0, $05

	ldx $3a                                                  ; $c872 : $a6, $3a
	jmp ($c888.w, X)                                                  ; $c874 : $7c, $88, $c8


br_3c_c877:
	ldx $3a                                                  ; $c877 : $a6, $3a
	jmp ($c87c.w, X)                                                  ; $c879 : $7c, $7c, $c8


	sty $c8, X                                                  ; $c87c : $94, $c8
	lda $ebc8.w, X                                                  ; $c87e : $bd, $c8, $eb
	iny                                                  ; $c881 : $c8
	ora ($c9, S), Y                                                  ; $c882 : $13, $c9
	pld                                                  ; $c884 : $2b
	cmp #$44.b                                                  ; $c885 : $c9, $44
	cmp #$94.b                                                  ; $c887 : $c9, $94
	iny                                                  ; $c889 : $c8
	cmp ($c8, S), Y                                                  ; $c88a : $d3, $c8
	xba                                                  ; $c88c : $eb
	iny                                                  ; $c88d : $c8
	adc ($c9)                                                  ; $c88e : $72, $c9
	tdc                                                  ; $c890 : $7b
	cmp #$44.b                                                  ; $c891 : $c9, $44
	cmp #$a9.b                                                  ; $c893 : $c9, $a9
	asl $3985.w, X                                                  ; $c895 : $1e, $85, $39
	lda $38                                                  ; $c898 : $a5, $38
	tsb $11                                                  ; $c89a : $04, $11
	stz $1f1f.w                                                  ; $c89c : $9c, $1f, $1f
	stz $1f20.w                                                  ; $c89f : $9c, $20, $1f
	lda #$40.b                                                  ; $c8a2 : $a9, $40
	trb $0a41.w                                                  ; $c8a4 : $1c, $41, $0a
	jsr $02e13f.l                                                  ; $c8a7 : $22, $3f, $e1, $02
	lda $11                                                  ; $c8ab : $a5, $11
	and #$40.b                                                  ; $c8ad : $29, $40
	eor #$40.b                                                  ; $c8af : $49, $40
	ora $0a41.w                                                  ; $c8b1 : $0d, $41, $0a
	sta $0a41.w                                                  ; $c8b4 : $8d, $41, $0a
	lda #$02.b                                                  ; $c8b7 : $a9, $02
	sta $3a                                                  ; $c8b9 : $85, $3a
	bra br_3c_c927                                                  ; $c8bb : $80, $6a

	dec $39                                                  ; $c8bd : $c6, $39
	bne br_3c_c927                                                  ; $c8bf : $d0, $66

	lda #$04.b                                                  ; $c8c1 : $a9, $04
	sta $3a                                                  ; $c8c3 : $85, $3a
	lda #$37.b                                                  ; $c8c5 : $a9, $37
	sta $1f56.w                                                  ; $c8c7 : $8d, $56, $1f
	sta $0008.w                                                  ; $c8ca : $8d, $08, $00
	jsr $02fcb1.l                                                  ; $c8cd : $22, $b1, $fc, $02
	bra br_3c_c927                                                  ; $c8d1 : $80, $54

	dec $39                                                  ; $c8d3 : $c6, $39
	bne br_3c_c927                                                  ; $c8d5 : $d0, $50

	lda #$04.b                                                  ; $c8d7 : $a9, $04
	sta $3a                                                  ; $c8d9 : $85, $3a
	sta $3b                                                  ; $c8db : $85, $3b
	lda #$36.b                                                  ; $c8dd : $a9, $36
	sta $0008.w                                                  ; $c8df : $8d, $08, $00
	sta $1f56.w                                                  ; $c8e2 : $8d, $56, $1f
	jsr $02fcb1.l                                                  ; $c8e5 : $22, $b1, $fc, $02
	bra br_3c_c927                                                  ; $c8e9 : $80, $3c

	lda $1f3f.w                                                  ; $c8eb : $ad, $3f, $1f
	bmi br_3c_c8f6                                                  ; $c8ee : $30, $06

	lda #$06.b                                                  ; $c8f0 : $a9, $06
	sta $3a                                                  ; $c8f2 : $85, $3a
	bra br_3c_c927                                                  ; $c8f4 : $80, $31

br_3c_c8f6:
	lda #$00.b                                                  ; $c8f6 : $a9, $00
	sta $0000.w                                                  ; $c8f8 : $8d, $00, $00
	lda #$0a.b                                                  ; $c8fb : $a9, $0a
	sta $0001.w                                                  ; $c8fd : $8d, $01, $00
	stz $0002.w                                                  ; $c900 : $9c, $02, $00
	jsr $02e24b.l                                                  ; $c903 : $22, $4b, $e2, $02
	jsr Func_2_d636.l                                                  ; $c907 : $22, $36, $d6, $02
	jsr AnimateEntity.l                                                  ; $c90b : $22, $4a, $b9, $04
	jmp $04bca2.l                                                  ; $c90f : $5c, $a2, $bc, $04


	stz $00cb.w                                                  ; $c913 : $9c, $cb, $00
	stz $00cc.w                                                  ; $c916 : $9c, $cc, $00
	stz $00cd.w                                                  ; $c919 : $9c, $cd, $00
	lda #$0c.b                                                  ; $c91c : $a9, $0c
	tsb $1fd8.w                                                  ; $c91e : $0c, $d8, $1f
	lda #$08.b                                                  ; $c921 : $a9, $08
	sta $3a                                                  ; $c923 : $85, $3a
	sta $0b                                                  ; $c925 : $85, $0b

br_3c_c927:
	jmp Func_2_d636.l                                                  ; $c927 : $5c, $36, $d6, $02


	lda $39                                                  ; $c92b : $a5, $39
	beq br_3c_c933                                                  ; $c92d : $f0, $04

	dec $39                                                  ; $c92f : $c6, $39
	bra br_3c_c927                                                  ; $c931 : $80, $f4

br_3c_c933:
	jsr $3fe1c9.l                                                  ; $c933 : $22, $c9, $e1, $3f
	lda $34                                                  ; $c937 : $a5, $34
	bpl br_3c_c943                                                  ; $c939 : $10, $08

	lda #$0a.b                                                  ; $c93b : $a9, $0a
	sta $3a                                                  ; $c93d : $85, $3a
	lda #$1e.b                                                  ; $c93f : $a9, $1e
	sta $39                                                  ; $c941 : $85, $39

br_3c_c943:
	rtl                                                  ; $c943 : $6b


	dec $39                                                  ; $c944 : $c6, $39
	bne br_3c_c943                                                  ; $c946 : $d0, $fb

	rep #IDX_8                                                  ; $c948 : $c2, $10
	ldx #$00a0.w                                                  ; $c94a : $a2, $a0, $00
	ldy #$001c.w                                                  ; $c94d : $a0, $1c, $00
	jsr LoadPalettesFromGivenSpecToColourX.l                                                  ; $c950 : $22, $4a, $80, $01
	sep #IDX_8                                                  ; $c954 : $e2, $10
	ldx wStageIdx.w                                                  ; $c956 : $ae, $ae, $1f
	lda $890b.w, X                                                  ; $c959 : $bd, $0b, $89
	jsr Func_0_84bc.l                                                  ; $c95c : $22, $bc, $84, $00
	jsr $04d1ef.l                                                  ; $c960 : $22, $ef, $d1, $04
	lda #$81.b                                                  ; $c964 : $a9, $81
	trb $1f5f.w                                                  ; $c966 : $1c, $5f, $1f
	stz $1f2c.w                                                  ; $c969 : $9c, $2c, $1f
	sep #IDX_8                                                  ; $c96c : $e2, $10
	jmp todo_DisablesEntity_d928.l                                                  ; $c96e : $5c, $28, $d9, $02


	lda #$04.b                                                  ; $c972 : $a9, $04
	tsb $1fd8.w                                                  ; $c974 : $0c, $d8, $1f
	jmp $05a9b2.l                                                  ; $c977 : $5c, $b2, $a9, $05


	jmp $05a9cb.l                                                  ; $c97b : $5c, $cb, $a9, $05


Call_3c_c97f:
	lda wMainLoopCounter.w                                                  ; $c97f : $ad, $cb, $09
	and #$03.b                                                  ; $c982 : $29, $03
	bne br_3c_c9a3                                                  ; $c984 : $d0, $1d

	rep #ACCU_8                                                  ; $c986 : $c2, $20
	lda #$0022.w                                                  ; $c988 : $a9, $22, $00
	sta $0000.w                                                  ; $c98b : $8d, $00, $00
	lda #$0024.w                                                  ; $c98e : $a9, $24, $00
	sta $0002.w                                                  ; $c991 : $8d, $02, $00
	sta $0004.w                                                  ; $c994 : $8d, $04, $00
	lda #$00c0.w                                                  ; $c997 : $a9, $c0, $00
	sta $0006.w                                                  ; $c99a : $8d, $06, $00
	sep #ACCU_8                                                  ; $c99d : $e2, $20
	jsr $02df8a.l                                                  ; $c99f : $22, $8a, $df, $02

br_3c_c9a3:
	rts                                                  ; $c9a3 : $60


Call_3c_c9a4:
	rep #IDX_8                                                  ; $c9a4 : $c2, $10
	jsr $02d8de.l                                                  ; $c9a6 : $22, $de, $d8, $02
	bne br_3c_c9d6                                                  ; $c9aa : $d0, $2a

	jsr Call_3c_c9d9.w                                                  ; $c9ac : $20, $d9, $c9
	lda #$02.b                                                  ; $c9af : $a9, $02
	sta $000b.w, X                                                  ; $c9b1 : $9d, $0b, $00
	bra br_3c_c9d6                                                  ; $c9b4 : $80, $20

Call_3c_c9b6:
	rep #IDX_8                                                  ; $c9b6 : $c2, $10
	jsr $02d8de.l                                                  ; $c9b8 : $22, $de, $d8, $02
	bne br_3c_c9d6                                                  ; $c9bc : $d0, $18

	jsr Call_3c_c9d9.w                                                  ; $c9be : $20, $d9, $c9
	lda #$04.b                                                  ; $c9c1 : $a9, $04
	sta $000b.w, X                                                  ; $c9c3 : $9d, $0b, $00
	bra br_3c_c9d6                                                  ; $c9c6 : $80, $0e

Call_3c_c9c8:
	rep #IDX_8                                                  ; $c9c8 : $c2, $10
	jsr $02d8de.l                                                  ; $c9ca : $22, $de, $d8, $02
	bne br_3c_c9d6                                                  ; $c9ce : $d0, $06

	jsr Call_3c_c9d9.w                                                  ; $c9d0 : $20, $d9, $c9
	stz $000b.w, X                                                  ; $c9d3 : $9e, $0b, $00

br_3c_c9d6:
	sep #ACCU_8|IDX_8                                                  ; $c9d6 : $e2, $30
	rts                                                  ; $c9d8 : $60


Call_3c_c9d9:
	rep #IDX_8                                                  ; $c9d9 : $c2, $10
	inc $0000.w, X                                                  ; $c9db : $fe, $00, $00
	lda #$1f.b                                                  ; $c9de : $a9, $1f
	sta $000a.w, X                                                  ; $c9e0 : $9d, $0a, $00
	lda $16                                                  ; $c9e3 : $a5, $16
	sta $0016.w, X                                                  ; $c9e5 : $9d, $16, $00
	lda $11                                                  ; $c9e8 : $a5, $11
	ora $38                                                  ; $c9ea : $05, $38
	sta $0011.w, X                                                  ; $c9ec : $9d, $11, $00
	lda #$1b.b                                                  ; $c9ef : $a9, $1b
	sta $0028.w, X                                                  ; $c9f1 : $9d, $28, $00
	lda $18                                                  ; $c9f4 : $a5, $18
	sta $0018.w, X                                                  ; $c9f6 : $9d, $18, $00
	lda #$08.b                                                  ; $c9f9 : $a9, $08
	sta $0012.w, X                                                  ; $c9fb : $9d, $12, $00
	rep #ACCU_8                                                  ; $c9fe : $c2, $20
	lda $11                                                  ; $ca00 : $a5, $11
	bit #$0040.w                                                  ; $ca02 : $89, $40, $00
	beq br_3c_ca0c                                                  ; $ca05 : $f0, $05

	lda #$001c.w                                                  ; $ca07 : $a9, $1c, $00
	bra br_3c_ca0f                                                  ; $ca0a : $80, $03

br_3c_ca0c:
	lda #$ffe4.w                                                  ; $ca0c : $a9, $e4, $ff

br_3c_ca0f:
	clc                                                  ; $ca0f : $18
	adc $05                                                  ; $ca10 : $65, $05
	sta $0005.w, X                                                  ; $ca12 : $9d, $05, $00
	lda $08                                                  ; $ca15 : $a5, $08
	sec                                                  ; $ca17 : $38
	sbc #$0002.w                                                  ; $ca18 : $e9, $02, $00
	sta $0008.w, X                                                  ; $ca1b : $9d, $08, $00
	tdc                                                  ; $ca1e : $7b
	sta $0038.w, X                                                  ; $ca1f : $9d, $38, $00
	sep #ACCU_8                                                  ; $ca22 : $e2, $20
	rts                                                  ; $ca24 : $60


	ldx $01                                                  ; $ca25 : $a6, $01
	jmp ($ca2a.w, X)                                                  ; $ca27 : $7c, $2a, $ca


	rol $ca, X                                                  ; $ca2a : $36, $ca
	and ($cb, X)                                                  ; $ca2c : $21, $cb
	cpx $00cc.w                                                  ; $ca2e : $ec, $cc, $00
	wai                                                  ; $ca31 : $cb
	asl $14cb.w                                                  ; $ca32 : $0e, $cb, $14
	wai                                                  ; $ca35 : $cb
	ldx $02                                                  ; $ca36 : $a6, $02
	jmp ($ca3b.w, X)                                                  ; $ca38 : $7c, $3b, $ca


	eor ($ca, X)                                                  ; $ca3b : $41, $ca
	lda $cad8ca.l                                                  ; $ca3d : $af, $ca, $d8, $ca
	rep #ACCU_8                                                  ; $ca41 : $c2, $20
	lda $1e6e.w                                                  ; $ca43 : $ad, $6e, $1e
	sta $7fcd98.l                                                  ; $ca46 : $8f, $98, $cd, $7f
	lda $1e70.w                                                  ; $ca4a : $ad, $70, $1e
	sta $7fcd9a.l                                                  ; $ca4d : $8f, $9a, $cd, $7f
	lda #$0120.w                                                  ; $ca51 : $a9, $20, $01
	clc                                                  ; $ca54 : $18
	adc wNewStageScrollX.w                                                  ; $ca55 : $6d, $5d, $1e
	sta $05                                                  ; $ca58 : $85, $05
	lda #$00a0.w                                                  ; $ca5a : $a9, $a0, $00
	clc                                                  ; $ca5d : $18
	adc wNewStageScrollY.w                                                  ; $ca5e : $6d, $60, $1e
	sta $08                                                  ; $ca61 : $85, $08
	lda #$ea83.w                                                  ; $ca63 : $a9, $83, $ea
	sta $20                                                  ; $ca66 : $85, $20
	sep #ACCU_8                                                  ; $ca68 : $e2, $20
	jsr LoadCurrEnemyBaseData.l                                                  ; $ca6a : $22, $5c, $e1, $02
	lda $28                                                  ; $ca6e : $a5, $28
	sta $1f57.w                                                  ; $ca70 : $8d, $57, $1f
	lda #$06.b                                                  ; $ca73 : $a9, $06
	sta $12                                                  ; $ca75 : $85, $12
	lda #$02.b                                                  ; $ca77 : $a9, $02
	sta $02                                                  ; $ca79 : $85, $02
	stz $01                                                  ; $ca7b : $64, $01
	stz $37                                                  ; $ca7d : $64, $37
	lda #$01.b                                                  ; $ca7f : $a9, $01
	tsb $1f5f.w                                                  ; $ca81 : $0c, $5f, $1f
	lda #$80.b                                                  ; $ca84 : $a9, $80
	sta $1a                                                  ; $ca86 : $85, $1a
	lda #$ff.b                                                  ; $ca88 : $a9, $ff
	sta $1b                                                  ; $ca8a : $85, $1b
	lda #$29.b                                                  ; $ca8c : $a9, $29
	sta $11                                                  ; $ca8e : $85, $11
	sta $38                                                  ; $ca90 : $85, $38
	jsr $02e13f.l                                                  ; $ca92 : $22, $3f, $e1, $02
	jsr todo_CausePlayerToFreeze.l                                                  ; $ca96 : $22, $ca, $d1, $04
	jsr Call_3c_cd96.w                                                  ; $ca9a : $20, $96, $cd
	jsr Call_3c_ce35.w                                                  ; $ca9d : $20, $35, $ce
	lda #$01.b                                                  ; $caa0 : $a9, $01
	tsb $1f5f.w                                                  ; $caa2 : $0c, $5f, $1f
	lda #$10.b                                                  ; $caa5 : $a9, $10
	sta $36                                                  ; $caa7 : $85, $36
	lda #$00.b                                                  ; $caa9 : $a9, $00
	jmp SetupEntitysAnimation.l                                                  ; $caab : $5c, $67, $b9, $04


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $caaf : $22, $f3, $d7, $02
	jsr Call_3c_cd75.w                                                  ; $cab3 : $20, $75, $cd
	rep #ACCU_8|F_CARRY                                                  ; $cab6 : $c2, $21
	lda wNewStageScrollX.w                                                  ; $cab8 : $ad, $5d, $1e
	adc #$0080.w                                                  ; $cabb : $69, $80, $00
	cmp $05                                                  ; $cabe : $c5, $05
	sep #ACCU_8                                                  ; $cac0 : $e2, $20
	bcc br_3c_cad0                                                  ; $cac2 : $90, $0c

	lda #$04.b                                                  ; $cac4 : $a9, $04
	sta $02                                                  ; $cac6 : $85, $02
	stz $3b                                                  ; $cac8 : $64, $3b
	lda #$16.b                                                  ; $caca : $a9, $16
	jsr SetupEntitysAnimation.l                                                  ; $cacc : $22, $67, $b9, $04

br_3c_cad0:
	jsr Func_2_d636.l                                                  ; $cad0 : $22, $36, $d6, $02
	jmp AnimateEntity.l                                                  ; $cad4 : $5c, $4a, $b9, $04


	lda $1fb2.w                                                  ; $cad8 : $ad, $b2, $1f
	bit #$40.b                                                  ; $cadb : $89, $40
	bne br_3c_caef                                                  ; $cadd : $d0, $10

	lda #$0c.b                                                  ; $cadf : $a9, $0c
	jsr $04dc97.l                                                  ; $cae1 : $22, $97, $dc, $04
	rep #ACCU_8                                                  ; $cae5 : $c2, $20
	tdc                                                  ; $cae7 : $7b
	sta $0cd4.w                                                  ; $cae8 : $8d, $d4, $0c
	sep #ACCU_8                                                  ; $caeb : $e2, $20
	bra br_3c_caf3                                                  ; $caed : $80, $04

br_3c_caef:
	jsr $04d1ef.l                                                  ; $caef : $22, $ef, $d1, $04

br_3c_caf3:
	lda #$02.b                                                  ; $caf3 : $a9, $02
	sta $01                                                  ; $caf5 : $85, $01
	sta $1f54.w                                                  ; $caf7 : $8d, $54, $1f
	stz $02                                                  ; $cafa : $64, $02
	stz $03                                                  ; $cafc : $64, $03
	bra br_3c_cad0                                                  ; $cafe : $80, $d0

	lda $33                                                  ; $cb00 : $a5, $33
	bmi br_3c_cb08                                                  ; $cb02 : $30, $04

	dec $30                                                  ; $cb04 : $c6, $30
	bne br_3c_cb21                                                  ; $cb06 : $d0, $19

br_3c_cb08:
	jsr Func_2_db3f.l                                                  ; $cb08 : $22, $3f, $db, $02
	bra br_3c_cb18                                                  ; $cb0c : $80, $0a

	lda #$02.b                                                  ; $cb0e : $a9, $02
	sta $01                                                  ; $cb10 : $85, $01
	bra br_3c_cb21                                                  ; $cb12 : $80, $0d

	jsr Func_2_ddfe.l                                                  ; $cb14 : $22, $fe, $dd, $02

br_3c_cb18:
	lda $01                                                  ; $cb18 : $a5, $01
	cmp #$04.b                                                  ; $cb1a : $c9, $04
	bne br_3c_cb21                                                  ; $cb1c : $d0, $03

	jmp Jump_3c_cb74.w                                                  ; $cb1e : $4c, $74, $cb


br_3c_cb21:
	jsr $04d8d5.l                                                  ; $cb21 : $22, $d5, $d8, $04
	jsr $02df64.l                                                  ; $cb25 : $22, $64, $df, $02
	lda #$60.b                                                  ; $cb29 : $a9, $60
	sta $1e70.w                                                  ; $cb2b : $8d, $70, $1e
	lda #$0a.b                                                  ; $cb2e : $a9, $0a
	sta $1e71.w                                                  ; $cb30 : $8d, $71, $1e
	lda #$80.b                                                  ; $cb33 : $a9, $80
	sta $2c                                                  ; $cb35 : $85, $2c
	jsr Func_4_bfae.l                                                  ; $cb37 : $22, $ae, $bf, $04
	lda $1f58.w                                                  ; $cb3b : $ad, $58, $1f
	cmp #$04.b                                                  ; $cb3e : $c9, $04
	bcc br_3c_cb47                                                  ; $cb40 : $90, $05

	ldx $02                                                  ; $cb42 : $a6, $02
	jsr ($cba1.w, X)                                                  ; $cb44 : $fc, $a1, $cb

br_3c_cb47:
	jsr Func_4_cb74.l                                                  ; $cb47 : $22, $74, $cb, $04
	bmi br_3c_cb74                                                  ; $cb4b : $30, $27

	bne br_3c_cb60                                                  ; $cb4d : $d0, $11

	lda $1f58.w                                                  ; $cb4f : $ad, $58, $1f
	cmp #$02.b                                                  ; $cb52 : $c9, $02
	beq br_3c_cb74                                                  ; $cb54 : $f0, $1e

	lda $27                                                  ; $cb56 : $a5, $27
	beq br_3c_cb74                                                  ; $cb58 : $f0, $1a

	jsr Func_4_cb31.l                                                  ; $cb5a : $22, $31, $cb, $04
	bra br_3c_cb82                                                  ; $cb5e : $80, $22

br_3c_cb60:
	lda #$21.b                                                  ; $cb60 : $a9, $21
	jsr Func_1_8000.l                                                  ; $cb62 : $22, $00, $80, $01
	lda #$3c.b                                                  ; $cb66 : $a9, $3c
	sta $37                                                  ; $cb68 : $85, $37
	lda #$01.b                                                  ; $cb6a : $a9, $01
	sta $28                                                  ; $cb6c : $85, $28
	lda #$0e.b                                                  ; $cb6e : $a9, $0e
	trb $11                                                  ; $cb70 : $14, $11
	bra br_3c_cb82                                                  ; $cb72 : $80, $0e

Jump_3c_cb74:
br_3c_cb74:
	lda #$04.b                                                  ; $cb74 : $a9, $04
	sta $01                                                  ; $cb76 : $85, $01
	stz $02                                                  ; $cb78 : $64, $02
	stz $03                                                  ; $cb7a : $64, $03
	stz $3b                                                  ; $cb7c : $64, $3b
	jsr todo_CausePlayerToFreeze.l                                                  ; $cb7e : $22, $ca, $d1, $04

br_3c_cb82:
	lda $01                                                  ; $cb82 : $a5, $01
	sta $1f54.w                                                  ; $cb84 : $8d, $54, $1f
	lda $02                                                  ; $cb87 : $a5, $02
	sta $1f55.w                                                  ; $cb89 : $8d, $55, $1f
	lda $03                                                  ; $cb8c : $a5, $03
	sta $1f56.w                                                  ; $cb8e : $8d, $56, $1f
	jsr Func_2_d636.l                                                  ; $cb91 : $22, $36, $d6, $02
	lda $1f58.w                                                  ; $cb95 : $ad, $58, $1f
	cmp #$04.b                                                  ; $cb98 : $c9, $04
	bcc br_3c_cba0                                                  ; $cb9a : $90, $04

	jmp AnimateEntity.l                                                  ; $cb9c : $5c, $4a, $b9, $04


br_3c_cba0:
	rtl                                                  ; $cba0 : $6b


	lda $cb                                                  ; $cba1 : $a5, $cb
	php                                                  ; $cba3 : $08
	cpy $03a6.w                                                  ; $cba4 : $cc, $a6, $03
	jmp ($cbaa.w, X)                                                  ; $cba7 : $7c, $aa, $cb


	ldx $d0cb.w                                                  ; $cbaa : $ae, $cb, $d0
	wai                                                  ; $cbad : $cb
	lda #$02.b                                                  ; $cbae : $a9, $02
	sta $03                                                  ; $cbb0 : $85, $03
	lda #$10.b                                                  ; $cbb2 : $a9, $10
	sta $36                                                  ; $cbb4 : $85, $36
	lda $3b                                                  ; $cbb6 : $a5, $3b
	beq br_3c_cbc5                                                  ; $cbb8 : $f0, $0b

	lda #$ff.b                                                  ; $cbba : $a9, $ff
	sta $1b                                                  ; $cbbc : $85, $1b
	lda #$00.b                                                  ; $cbbe : $a9, $00
	jsr SetupEntitysAnimation.l                                                  ; $cbc0 : $22, $67, $b9, $04
	rts                                                  ; $cbc4 : $60


br_3c_cbc5:
	lda #$00.b                                                  ; $cbc5 : $a9, $00
	sta $1b                                                  ; $cbc7 : $85, $1b
	lda #$17.b                                                  ; $cbc9 : $a9, $17
	jsr SetupEntitysAnimation.l                                                  ; $cbcb : $22, $67, $b9, $04
	rts                                                  ; $cbcf : $60


	jsr AddEntityXSpeedOntoSubX.l                                                  ; $cbd0 : $22, $f3, $d7, $02
	jsr Call_3c_cd75.w                                                  ; $cbd4 : $20, $75, $cd
	lda $3b                                                  ; $cbd7 : $a5, $3b
	beq br_3c_cbe6                                                  ; $cbd9 : $f0, $0b

	rep #ACCU_8                                                  ; $cbdb : $c2, $20
	lda $05                                                  ; $cbdd : $a5, $05
	cmp #$0a80.w                                                  ; $cbdf : $c9, $80, $0a
	bcs br_3c_cc05                                                  ; $cbe2 : $b0, $21

	bra br_3c_cbef                                                  ; $cbe4 : $80, $09

br_3c_cbe6:
	rep #ACCU_8                                                  ; $cbe6 : $c2, $20
	lda $05                                                  ; $cbe8 : $a5, $05
	cmp #$0b20.w                                                  ; $cbea : $c9, $20, $0b
	bcc br_3c_cc05                                                  ; $cbed : $90, $16

br_3c_cbef:
	sep #ACCU_8                                                  ; $cbef : $e2, $20
	lda $3b                                                  ; $cbf1 : $a5, $3b
	eor #$01.b                                                  ; $cbf3 : $49, $01
	sta $3b                                                  ; $cbf5 : $85, $3b
	lda #$02.b                                                  ; $cbf7 : $a9, $02
	sta $02                                                  ; $cbf9 : $85, $02
	stz $03                                                  ; $cbfb : $64, $03
	stz $3c                                                  ; $cbfd : $64, $3c
	lda #$03.b                                                  ; $cbff : $a9, $03
	jsr SetupEntitysAnimation.l                                                  ; $cc01 : $22, $67, $b9, $04

br_3c_cc05:
	sep #ACCU_8                                                  ; $cc05 : $e2, $20
	rts                                                  ; $cc07 : $60


	ldx $03                                                  ; $cc08 : $a6, $03
	jmp ($cc0d.w, X)                                                  ; $cc0a : $7c, $0d, $cc


	ora $59cc.w, Y                                                  ; $cc0d : $19, $cc, $59
	cpy $cc6a.w                                                  ; $cc10 : $cc, $6a, $cc
	sta [$cc], Y                                                  ; $cc13 : $97, $cc
	tay                                                  ; $cc15 : $a8
	cpy $ccc8.w                                                  ; $cc16 : $cc, $c8, $cc
	lda $3c                                                  ; $cc19 : $a5, $3c
	bne br_3c_cc2e                                                  ; $cc1b : $d0, $11

	lda $0f                                                  ; $cc1d : $a5, $0f
	bit #$40.b                                                  ; $cc1f : $89, $40
	beq br_3c_cc58                                                  ; $cc21 : $f0, $35

	lda #$51.b                                                  ; $cc23 : $a9, $51
	jsr Func_1_802b.l                                                  ; $cc25 : $22, $2b, $80, $01
	jsr Call_3c_ce01.w                                                  ; $cc29 : $20, $01, $ce
	inc $3c                                                  ; $cc2c : $e6, $3c

br_3c_cc2e:
	lda $0f                                                  ; $cc2e : $a5, $0f
	bpl br_3c_cc58                                                  ; $cc30 : $10, $26

	rep #ACCU_8                                                  ; $cc32 : $c2, $20
	lda wPlayerEntity.x.w                                                  ; $cc34 : $ad, $dd, $09
	cmp $05                                                  ; $cc37 : $c5, $05
	sep #ACCU_8                                                  ; $cc39 : $e2, $20
	bcc br_3c_cc48                                                  ; $cc3b : $90, $0b

	lda #$04.b                                                  ; $cc3d : $a9, $04
	sta $39                                                  ; $cc3f : $85, $39
	lda #$0a.b                                                  ; $cc41 : $a9, $0a
	sta $03                                                  ; $cc43 : $85, $03
	stz $3c                                                  ; $cc45 : $64, $3c
	rts                                                  ; $cc47 : $60


br_3c_cc48:
	lda #$02.b                                                  ; $cc48 : $a9, $02
	sta $03                                                  ; $cc4a : $85, $03
	lda #$78.b                                                  ; $cc4c : $a9, $78
	sta $39                                                  ; $cc4e : $85, $39
	stz $3c                                                  ; $cc50 : $64, $3c
	lda #$01.b                                                  ; $cc52 : $a9, $01
	jsr SetupEntitysAnimation.l                                                  ; $cc54 : $22, $67, $b9, $04

br_3c_cc58:
	rts                                                  ; $cc58 : $60


	lda $0f                                                  ; $cc59 : $a5, $0f
	bpl br_3c_cc69                                                  ; $cc5b : $10, $0c

	lda #$04.b                                                  ; $cc5d : $a9, $04
	sta $03                                                  ; $cc5f : $85, $03
	stz $3c                                                  ; $cc61 : $64, $3c
	lda #$02.b                                                  ; $cc63 : $a9, $02
	jsr SetupEntitysAnimation.l                                                  ; $cc65 : $22, $67, $b9, $04

br_3c_cc69:
	rts                                                  ; $cc69 : $60


	dec $39                                                  ; $cc6a : $c6, $39
	beq br_3c_cc8a                                                  ; $cc6c : $f0, $1c

	lda $3c                                                  ; $cc6e : $a5, $3c
	bne br_3c_cc83                                                  ; $cc70 : $d0, $11

	lda $0f                                                  ; $cc72 : $a5, $0f
	bit #$40.b                                                  ; $cc74 : $89, $40
	beq br_3c_cc89                                                  ; $cc76 : $f0, $11

	inc $3c                                                  ; $cc78 : $e6, $3c
	lda #$70.b                                                  ; $cc7a : $a9, $70
	jsr Func_1_802b.l                                                  ; $cc7c : $22, $2b, $80, $01
	jmp Jump_3c_cde4.w                                                  ; $cc80 : $4c, $e4, $cd


br_3c_cc83:
	lda $0f                                                  ; $cc83 : $a5, $0f
	bpl br_3c_cc89                                                  ; $cc85 : $10, $02

	stz $3c                                                  ; $cc87 : $64, $3c

br_3c_cc89:
	rts                                                  ; $cc89 : $60


br_3c_cc8a:
	stz $3c                                                  ; $cc8a : $64, $3c
	lda #$06.b                                                  ; $cc8c : $a9, $06
	sta $03                                                  ; $cc8e : $85, $03
	lda #$18.b                                                  ; $cc90 : $a9, $18
	jsr SetupEntitysAnimation.l                                                  ; $cc92 : $22, $67, $b9, $04
	rts                                                  ; $cc96 : $60


	lda $0f                                                  ; $cc97 : $a5, $0f
	bpl br_3c_cca7                                                  ; $cc99 : $10, $0c

	lda #$08.b                                                  ; $cc9b : $a9, $08
	sta $03                                                  ; $cc9d : $85, $03
	stz $3c                                                  ; $cc9f : $64, $3c
	lda #$03.b                                                  ; $cca1 : $a9, $03
	jsr SetupEntitysAnimation.l                                                  ; $cca3 : $22, $67, $b9, $04

br_3c_cca7:
	rts                                                  ; $cca7 : $60


	lda $3c                                                  ; $cca8 : $a5, $3c
	bne br_3c_ccbd                                                  ; $ccaa : $d0, $11

	lda $0f                                                  ; $ccac : $a5, $0f
	bit #$40.b                                                  ; $ccae : $89, $40
	beq br_3c_ccc7                                                  ; $ccb0 : $f0, $15

	lda #$51.b                                                  ; $ccb2 : $a9, $51
	jsr Func_1_802b.l                                                  ; $ccb4 : $22, $2b, $80, $01
	jsr Call_3c_ce01.w                                                  ; $ccb8 : $20, $01, $ce
	inc $3c                                                  ; $ccbb : $e6, $3c

br_3c_ccbd:
	lda $0f                                                  ; $ccbd : $a5, $0f
	bpl br_3c_ccc7                                                  ; $ccbf : $10, $06

	stz $02                                                  ; $ccc1 : $64, $02
	stz $03                                                  ; $ccc3 : $64, $03
	stz $3c                                                  ; $ccc5 : $64, $3c

br_3c_ccc7:
	rts                                                  ; $ccc7 : $60


	lda $3c                                                  ; $ccc8 : $a5, $3c
	bne br_3c_ccdd                                                  ; $ccca : $d0, $11

	lda $0f                                                  ; $cccc : $a5, $0f
	bit #$40.b                                                  ; $ccce : $89, $40
	beq br_3c_cceb                                                  ; $ccd0 : $f0, $19

	lda #$51.b                                                  ; $ccd2 : $a9, $51
	jsr Func_1_802b.l                                                  ; $ccd4 : $22, $2b, $80, $01
	jsr Call_3c_ce01.w                                                  ; $ccd8 : $20, $01, $ce
	inc $3c                                                  ; $ccdb : $e6, $3c

br_3c_ccdd:
	lda $0f                                                  ; $ccdd : $a5, $0f
	bpl br_3c_cceb                                                  ; $ccdf : $10, $0a

	stz $3c                                                  ; $cce1 : $64, $3c
	dec $39                                                  ; $cce3 : $c6, $39
	bne br_3c_cceb                                                  ; $cce5 : $d0, $04

	stz $02                                                  ; $cce7 : $64, $02
	stz $03                                                  ; $cce9 : $64, $03

br_3c_cceb:
	rts                                                  ; $cceb : $60


	ldx $3b                                                  ; $ccec : $a6, $3b
	jmp ($ccf1.w, X)                                                  ; $ccee : $7c, $f1, $cc


	sbc $09cc.w, Y                                                  ; $ccf1 : $f9, $cc, $09
	cmp $cd3f.w                                                  ; $ccf4 : $cd, $3f, $cd
	cli                                                  ; $ccf7 : $58
	cmp $02a9.w                                                  ; $ccf8 : $cd, $a9, $02
	sta $3b                                                  ; $ccfb : $85, $3b
	lda #$78.b                                                  ; $ccfd : $a9, $78
	sta $39                                                  ; $ccff : $85, $39
	lda $38                                                  ; $cd01 : $a5, $38
	tsb $11                                                  ; $cd03 : $04, $11

br_3c_cd05:
	jmp Func_2_d636.l                                                  ; $cd05 : $5c, $36, $d6, $02


	dec $39                                                  ; $cd09 : $c6, $39
	lda $39                                                  ; $cd0b : $a5, $39
	beq br_3c_cd36                                                  ; $cd0d : $f0, $27

	and #$07.b                                                  ; $cd0f : $29, $07
	bne br_3c_cd30                                                  ; $cd11 : $d0, $1d

	rep #ACCU_8                                                  ; $cd13 : $c2, $20
	lda #$ffe1.w                                                  ; $cd15 : $a9, $e1, $ff
	sta $0000.w                                                  ; $cd18 : $8d, $00, $00
	sta $0002.w                                                  ; $cd1b : $8d, $02, $00
	lda #$003f.w                                                  ; $cd1e : $a9, $3f, $00
	sta $0004.w                                                  ; $cd21 : $8d, $04, $00
	sta $0006.w                                                  ; $cd24 : $8d, $06, $00
	sep #ACCU_8                                                  ; $cd27 : $e2, $20
	stz $0008.w                                                  ; $cd29 : $9c, $08, $00
	jsr $04d6fb.l                                                  ; $cd2c : $22, $fb, $d6, $04

br_3c_cd30:
	lda $39                                                  ; $cd30 : $a5, $39
	lsr                                                  ; $cd32 : $4a
	bcc br_3c_cd05                                                  ; $cd33 : $90, $d0

	rtl                                                  ; $cd35 : $6b


br_3c_cd36:
	lda #$04.b                                                  ; $cd36 : $a9, $04
	sta $3b                                                  ; $cd38 : $85, $3b
	lda #$01.b                                                  ; $cd3a : $a9, $01
	trb $1f5f.w                                                  ; $cd3c : $1c, $5f, $1f
	lda #$01.b                                                  ; $cd3f : $a9, $01
	trb $1f53.w                                                  ; $cd41 : $1c, $53, $1f
	lda $1fb2.w                                                  ; $cd44 : $ad, $b2, $1f
	bit #$40.b                                                  ; $cd47 : $89, $40
	beq br_3c_cd5e                                                  ; $cd49 : $f0, $13

	inc $3b                                                  ; $cd4b : $e6, $3b
	inc $3b                                                  ; $cd4d : $e6, $3b
	lda #$0e.b                                                  ; $cd4f : $a9, $0e
	sta wDynamicSpriteTileDatasIdx.w                                                  ; $cd51 : $8d, $18, $1f
	jmp FarAddThreadToDynamicallyLoadSpriteData.l                                                  ; $cd54 : $5c, $dc, $b1, $00


	lda $0040.w                                                  ; $cd58 : $ad, $40, $00
	beq br_3c_cd5e                                                  ; $cd5b : $f0, $01

	rtl                                                  ; $cd5d : $6b


br_3c_cd5e:
	rep #ACCU_8                                                  ; $cd5e : $c2, $20
	lda $7fcd9a.l                                                  ; $cd60 : $af, $9a, $cd, $7f
	clc                                                  ; $cd64 : $18
	adc #$0100.w                                                  ; $cd65 : $69, $00, $01
	sta $1e70.w                                                  ; $cd68 : $8d, $70, $1e
	sep #ACCU_8                                                  ; $cd6b : $e2, $20
	jsr $04d1ef.l                                                  ; $cd6d : $22, $ef, $d1, $04
	jmp todo_DisablesEntity_d928.l                                                  ; $cd71 : $5c, $28, $d9, $02


Call_3c_cd75:
	lda $0f                                                  ; $cd75 : $a5, $0f
	and #$30.b                                                  ; $cd77 : $29, $30
	cmp $36                                                  ; $cd79 : $c5, $36
	beq br_3c_cd95                                                  ; $cd7b : $f0, $18

	and #$30.b                                                  ; $cd7d : $29, $30
	beq br_3c_cd93                                                  ; $cd7f : $f0, $12

	bit #$10.b                                                  ; $cd81 : $89, $10
	bne br_3c_cd89                                                  ; $cd83 : $d0, $04

	lda #$32.b                                                  ; $cd85 : $a9, $32
	bra br_3c_cd8b                                                  ; $cd87 : $80, $02

br_3c_cd89:
	lda #$33.b                                                  ; $cd89 : $a9, $33

br_3c_cd8b:
	jsr Func_1_802b.l                                                  ; $cd8b : $22, $2b, $80, $01
	lda $0f                                                  ; $cd8f : $a5, $0f
	and #$30.b                                                  ; $cd91 : $29, $30

br_3c_cd93:
	sta $36                                                  ; $cd93 : $85, $36

br_3c_cd95:
	rts                                                  ; $cd95 : $60


Call_3c_cd96:
	rep #IDX_8                                                  ; $cd96 : $c2, $10
	jsr todo_XequFree_1818_EntitySlot.l                                                  ; $cd98 : $22, $59, $d8, $02
	bne br_3c_cda4                                                  ; $cd9c : $d0, $06

	jsr Call_3c_cdc2.w                                                  ; $cd9e : $20, $c2, $cd
	stz $000b.w, X                                                  ; $cda1 : $9e, $0b, $00

br_3c_cda4:
	sep #ACCU_8|IDX_8                                                  ; $cda4 : $e2, $30
	rts                                                  ; $cda6 : $60


Call_3c_cda7:
	rep #ACCU_8                                                  ; $cda7 : $c2, $20
	lda #$fff0.w                                                  ; $cda9 : $a9, $f0, $ff
	sta $0000.w                                                  ; $cdac : $8d, $00, $00
	lda #$0006.w                                                  ; $cdaf : $a9, $06, $00
	sta $0002.w                                                  ; $cdb2 : $8d, $02, $00
	stz $0004.w                                                  ; $cdb5 : $9c, $04, $00
	stz $0006.w                                                  ; $cdb8 : $9c, $06, $00
	sep #ACCU_8                                                  ; $cdbb : $e2, $20
	jsr $02df8a.l                                                  ; $cdbd : $22, $8a, $df, $02
	rts                                                  ; $cdc1 : $60


Call_3c_cdc2:
	rep #IDX_8                                                  ; $cdc2 : $c2, $10
	inc $0000.w, X                                                  ; $cdc4 : $fe, $00, $00
	lda #$29.b                                                  ; $cdc7 : $a9, $29
	sta $000a.w, X                                                  ; $cdc9 : $9d, $0a, $00
	lda $16                                                  ; $cdcc : $a5, $16
	sta $0016.w, X                                                  ; $cdce : $9d, $16, $00
	lda $18                                                  ; $cdd1 : $a5, $18
	sta $0018.w, X                                                  ; $cdd3 : $9d, $18, $00
	lda #$06.b                                                  ; $cdd6 : $a9, $06
	sta $0012.w, X                                                  ; $cdd8 : $9d, $12, $00
	rep #ACCU_8                                                  ; $cddb : $c2, $20
	tdc                                                  ; $cddd : $7b
	sta $001e.w, X                                                  ; $cdde : $9d, $1e, $00
	sep #ACCU_8                                                  ; $cde1 : $e2, $20
	rts                                                  ; $cde3 : $60


Jump_3c_cde4:
	jsr Call_3c_cda7.w                                                  ; $cde4 : $20, $a7, $cd
	rep #IDX_8                                                  ; $cde7 : $c2, $10
	jsr $02d8de.l                                                  ; $cde9 : $22, $de, $d8, $02
	bne br_3c_cdfe                                                  ; $cded : $d0, $0f

	jsr Call_3c_ce13.w                                                  ; $cdef : $20, $13, $ce
	lda $0b                                                  ; $cdf2 : $a5, $0b

br_3c_cdf4:
	sta $000b.w, X                                                  ; $cdf4 : $9d, $0b, $00
	and #$3f.b                                                  ; $cdf7 : $29, $3f
	sta $0b                                                  ; $cdf9 : $85, $0b
	stz $003a.w, X                                                  ; $cdfb : $9e, $3a, $00

br_3c_cdfe:
	sep #IDX_8                                                  ; $cdfe : $e2, $10
	rts                                                  ; $ce00 : $60


Call_3c_ce01:
	rep #IDX_8                                                  ; $ce01 : $c2, $10
	jsr $02d8de.l                                                  ; $ce03 : $22, $de, $d8, $02
	bne br_3c_cdfe                                                  ; $ce07 : $d0, $f5

	jsr Call_3c_ce13.w                                                  ; $ce09 : $20, $13, $ce
	lda #$02.b                                                  ; $ce0c : $a9, $02
	sta $003a.w, X                                                  ; $ce0e : $9d, $3a, $00
	bra br_3c_cdfe                                                  ; $ce11 : $80, $eb

Call_3c_ce13:
	rep #IDX_8                                                  ; $ce13 : $c2, $10
	inc $0000.w, X                                                  ; $ce15 : $fe, $00, $00
	lda #$29.b                                                  ; $ce18 : $a9, $29
	sta $000a.w, X                                                  ; $ce1a : $9d, $0a, $00
	lda $38                                                  ; $ce1d : $a5, $38
	sta $0011.w, X                                                  ; $ce1f : $9d, $11, $00
	lda $18                                                  ; $ce22 : $a5, $18
	sta $0018.w, X                                                  ; $ce24 : $9d, $18, $00
	lda $16                                                  ; $ce27 : $a5, $16
	sta $0016.w, X                                                  ; $ce29 : $9d, $16, $00
	rep #ACCU_8                                                  ; $ce2c : $c2, $20
	tdc                                                  ; $ce2e : $7b
	sta $0036.w, X                                                  ; $ce2f : $9d, $36, $00
	sep #ACCU_8                                                  ; $ce32 : $e2, $20
	rts                                                  ; $ce34 : $60


Call_3c_ce35:
	rep #IDX_8                                                  ; $ce35 : $c2, $10
	jsr XequNextFreeEntitySlotForEnemies.l                                                  ; $ce37 : $22, $a7, $d8, $02
	bne br_3c_ce48                                                  ; $ce3b : $d0, $0b

	inc $0000.w, X                                                  ; $ce3d : $fe, $00, $00
	lda #$3e.b                                                  ; $ce40 : $a9, $3e
	sta $000a.w, X                                                  ; $ce42 : $9d, $0a, $00
	stz $000b.w, X                                                  ; $ce45 : $9e, $0b, $00

br_3c_ce48:
	sep #ACCU_8|IDX_8                                                  ; $ce48 : $e2, $30
	rts                                                  ; $ce4a : $60


; single-byte rows are column idxes
; 7-byte entries are:
;   - entity major type (0 - Item, 1 - ???, 2 - Event, 3 - Enemy)
;   - y coord
;   - entity minor type
;   - entity subtype/param
;   - x coord, with bit 7 set if the final entity entry for column idx
AllStagesEntityData:
	.dw EntityLocations0_IntroStage
	.dw EntityLocations1_BlastHornet
	.dw EntityLocations2_BlizzardBuffalo
	.dw EntityLocations3_GravityBeetle
	.dw EntityLocations4_ToxicSeahorse
	.dw EntityLocations5_VoltCatfish
	.dw EntityLocations6_CrushCrawfish
	.dw EntityLocations7_TunnelRhino
	.dw EntityLocations8_NeonTiger
	.dw EntityLocations9_Vile
	.dw EntityLocationsA_Doppler1
	.dw EntityLocationsB_Doppler2
	.dw EntityLocationsC_Doppler3
	.dw EntityLocationsD_Doppler4
	.dw EntityLocationsE
	.dw Data_3c_fe7e


EntityLocations0_IntroStage:
	.db $0c
	.db $01, $80, $01, $12, $00, $80, $81
	.db $54
	.db $02, $80, $01, $00, $00, $80, $0a
	.db $01, $80, $04, $33, $28, $80, $0a
	.db $02, $80, $04, $0b, $01, $80, $0a
	.db $01, $80, $04, $33, $27, $80, $8a
	.db $55
	.db $03, $80, $04, $02, $02, $a0, $8a
	.db $56
	.db $02, $80, $04, $15, $01, $d0, $8a
	.db $57
	.db $02, $80, $04, $00, $01, $e0, $8a
	.db $5c
	.db $02, $80, $04, $00, $02, $80, $0b
	.db $03, $b0, $04, $08, $01, $98, $8b
	.db $60
	.db $00, $60, $04, $09, $00, $00, $8c
	.db $62
	.db $03, $90, $04, $08, $01, $58, $8c
	.db $64
	.db $02, $80, $04, $17, $01, $80, $8c
	.db $66
	.db $03, $b0, $04, $08, $01, $d8, $8c
	.db $67
	.db $00, $60, $04, $09, $00, $e0, $8c
	.db $69
	.db $03, $80, $05, $0b, $80, $30, $8d
	.db $6a
	.db $02, $60, $05, $04, $07, $40, $0d
	.db $02, $60, $05, $1a, $12, $40, $8d
	.db $6c
	.db $02, $80, $04, $00, $04, $80, $0d
	.db $02, $80, $04, $00, $03, $80, $0d
	.db $02, $80, $05, $00, $06, $80, $0d
	.db $01, $80, $05, $33, $29, $80, $0d
	.db $02, $80, $05, $00, $05, $80, $8d
	.db $6e
	.db $03, $50, $04, $0b, $00, $d0, $0d
	.db $00, $78, $04, $02, $80, $d4, $8d
	.db $6f
	.db $03, $b0, $05, $08, $01, $e8, $8d
	.db $71
	.db $03, $50, $05, $0b, $80, $30, $8e
	.db $75
	.db $03, $90, $05, $08, $01, $a8, $8e
	.db $7b
	.db $03, $70, $05, $08, $01, $78, $8f
	.db $81
	.db $03, $b0, $05, $08, $01, $28, $90
	.db $82
	.db $02, $60, $06, $1a, $23, $40, $10
	.db $02, $60, $06, $04, $08, $40, $10
	.db $02, $80, $06, $18, $12, $40, $90
	.db $84
	.db $02, $80, $05, $00, $08, $80, $10
	.db $02, $80, $05, $00, $07, $80, $10
	.db $02, $80, $06, $00, $0a, $80, $10
	.db $02, $80, $06, $00, $09, $80, $90
	.db $89
	.db $03, $a0, $06, $62, $00, $30, $91
	.db $91
	.db $02, $80, $06, $15, $23, $20, $92
	.db $93
	.db $03, $06, $06, $20, $00, $70, $92
	.db $99
	.db $03, $06, $06, $20, $00, $30, $93
	.db $9b
	.db $03, $50, $06, $06, $00, $70, $93
	.db $9d
	.db $03, $06, $06, $20, $00, $b0, $93
	.db $9f
	.db $03, $a0, $06, $18, $00, $e0, $93
	.db $a1
	.db $03, $06, $06, $20, $00, $30, $94
	.db $a4
	.db $03, $50, $06, $06, $00, $80, $94
	.db $a6
	.db $03, $b0, $06, $18, $00, $c0, $94
	.db $a9
	.db $02, $80, $05, $18, $43, $38, $95
	.db $aa
	.db $02, $80, $05, $04, $09, $40, $95
	.db $ac
	.db $02, $80, $05, $00, $0d, $80, $15
	.db $02, $80, $05, $00, $0e, $80, $15
	.db $02, $80, $06, $00, $0c, $80, $15
	.db $02, $80, $06, $00, $0b, $80, $15
	.db $03, $b0, $06, $18, $00, $90, $95
	.db $ae
	.db $02, $40, $05, $17, $34, $c0, $95
	.db $b2
	.db $03, $80, $02, $1b, $01, $58, $16
	.db $03, $80, $03, $1b, $01, $58, $16
	.db $03, $b0, $04, $1b, $01, $58, $96
	.db $b4
	.db $03, $48, $02, $35, $04, $80, $16
	.db $02, $80, $02, $00, $12, $80, $16
	.db $02, $80, $02, $00, $11, $80, $16
	.db $03, $d0, $02, $21, $00, $80, $16
	.db $03, $40, $03, $21, $00, $80, $16
	.db $03, $b0, $03, $21, $00, $80, $16
	.db $03, $20, $04, $21, $00, $80, $16
	.db $03, $90, $04, $21, $00, $80, $16
	.db $03, $00, $05, $21, $00, $80, $16
	.db $03, $70, $05, $21, $00, $80, $16
	.db $02, $80, $05, $00, $0f, $80, $96
	.db $b5
	.db $03, $00, $03, $1b, $00, $a8, $16
	.db $03, $20, $04, $1b, $00, $a8, $16
	.db $00, $98, $05, $02, $80, $b0, $96
	.db $bc
	.db $01, $80, $02, $33, $2a, $80, $17
	.db $01, $80, $02, $33, $2b, $80, $17
	.db $02, $80, $02, $17, $45, $80, $97
	.db $bf
	.db $00, $a7, $02, $08, $00, $f8, $17
	.db $00, $a7, $02, $07, $00, $f8, $17
	.db $00, $a7, $02, $16, $00, $f0, $97
	.db $c0
	.db $02, $b0, $02, $15, $45, $00, $98
	.db $c4
	.db $02, $80, $02, $0d, $00, $80, $18
	.db $02, $a0, $02, $04, $0a, $80, $98
	.db $c7
	.db $00, $a7, $02, $07, $01, $f8, $98
	.db $ca
	.db $01, $a0, $02, $33, $28, $40, $19
	.db $01, $a0, $02, $33, $27, $40, $99
	.db $cc
	.db $02, $80, $01, $00, $16, $80, $19
	.db $02, $80, $01, $00, $17, $80, $19
	.db $02, $80, $02, $00, $15, $80, $19
	.db $02, $80, $02, $1a, $65, $80, $19
	.db $02, $80, $02, $0b, $02, $80, $19
	.db $02, $80, $02, $00, $14, $80, $99
	.db $cf
	.db $00, $77, $01, $07, $88, $f8, $99
	.db $d0
	.db $02, $40, $01, $17, $67, $10, $1a
	.db $02, $80, $01, $15, $56, $00, $9a
	.db $d1
	.db $03, $70, $01, $50, $00, $20, $9a
	.db $d4
	.db $02, $80, $01, $10, $00, $80, $1a
	.db $02, $80, $01, $00, $18, $80, $9a
	.db $dc
	.db $01, $80, $02, $33, $52, $80, $1b
	.db $01, $80, $02, $33, $53, $80, $1b
	.db $01, $80, $02, $33, $51, $80, $9b
	.db $de
	.db $01, $ad, $02, $19, $00, $c0, $9b
	.db $de


EntityLocations1_BlastHornet:
	.db $0c
	.db $01, $80, $04, $33, $03, $80, $01
	.db $01, $80, $04, $33, $04, $80, $01
	.db $01, $80, $04, $33, $05, $80, $01
	.db $02, $80, $04, $00, $00, $80, $81
	.db $17
	.db $03, $70, $04, $08, $01, $e0, $82
	.db $1e
	.db $03, $a0, $04, $08, $01, $d0, $83
	.db $21
	.db $03, $a0, $03, $18, $01, $30, $04
	.db $02, $80, $04, $00, $01, $20, $84
	.db $22
	.db $03, $ae, $04, $05, $00, $50, $84
	.db $24
	.db $02, $a0, $02, $00, $03, $80, $04
	.db $02, $a0, $02, $00, $02, $80, $84
	.db $26
	.db $03, $a0, $03, $18, $02, $d0, $04
	.db $03, $a0, $04, $18, $02, $d0, $84
	.db $27
	.db $02, $70, $02, $15, $01, $f8, $84
	.db $2c
	.db $02, $40, $02, $00, $07, $80, $05
	.db $03, $50, $02, $2f, $0b, $90, $85
	.db $34
	.db $02, $30, $01, $00, $05, $80, $06
	.db $02, $e0, $01, $00, $06, $80, $06
	.db $02, $80, $02, $00, $04, $80, $86
	.db $38
	.db $02, $70, $02, $15, $12, $00, $87
	.db $39
	.db $03, $20, $04, $08, $00, $30, $07
	.db $00, $a8, $05, $02, $80, $38, $87
	.db $3a
	.db $03, $a0, $03, $08, $80, $40, $07
	.db $03, $a0, $04, $08, $80, $40, $87
	.db $3e
	.db $02, $80, $02, $00, $09, $c0, $07
	.db $02, $80, $02, $00, $08, $c0, $87
	.db $42
	.db $03, $a0, $03, $08, $00, $40, $08
	.db $03, $70, $05, $08, $00, $50, $88
	.db $44
	.db $02, $40, $05, $00, $0d, $80, $08
	.db $02, $40, $05, $00, $0c, $80, $88
	.db $45
	.db $03, $20, $04, $08, $80, $b0, $88
	.db $46
	.db $02, $80, $02, $00, $0a, $c0, $08
	.db $02, $80, $02, $00, $0b, $c0, $08
	.db $03, $a0, $04, $08, $00, $c0, $88
	.db $48
	.db $02, $70, $02, $15, $23, $00, $89
	.db $4d
	.db $03, $60, $02, $4d, $10, $a0, $89
	.db $4e
	.db $02, $90, $05, $15, $24, $d0, $89
	.db $4f
.ifdef ZERO_MOD
	.db $00, $00, $00, $00, $00, $00, $00
.else
	.db $00, $80, $05, $0a, $00, $e0, $09
.endif
	.db $00, $97, $05, $11, $00, $f8, $89
	.db $54
	.db $02, $80, $05, $17, $01, $80, $0a
	.db $02, $80, $05, $00, $0e, $80, $8a
	.db $55
	.db $03, $80, $05, $2c, $00, $a0, $8a
	.db $57
	.db $00, $97, $05, $11, $01, $f8, $8a
	.db $58
	.db $02, $80, $05, $04, $0b, $00, $0b
	.db $00, $80, $05, $0a, $01, $18, $8b
	.db $5a
	.db $02, $98, $05, $15, $55, $40, $8b
	.db $5c
	.db $02, $80, $05, $17, $12, $80, $0b
	.db $01, $80, $05, $33, $06, $80, $0b
	.db $02, $80, $05, $0c, $00, $80, $0b
	.db $02, $80, $05, $0b, $01, $80, $0b
	.db $02, $80, $05, $00, $0f, $80, $8b
	.db $61
	.db $02, $80, $05, $00, $10, $20, $8c
	.db $66
	.db $03, $70, $04, $0d, $00, $c0, $8c
	.db $68
	.db $02, $80, $04, $17, $23, $00, $0d
	.db $02, $80, $05, $17, $23, $00, $8d
	.db $6a
	.db $02, $c0, $05, $00, $12, $40, $0d
	.db $02, $c0, $05, $00, $11, $40, $8d
	.db $6b
	.db $03, $90, $04, $08, $00, $70, $8d
	.db $6c
	.db $03, $c8, $07, $26, $03, $90, $8d
	.db $6e
	.db $03, $60, $04, $0d, $00, $c0, $8d
	.db $72
	.db $03, $80, $04, $0d, $00, $50, $8e
	.db $75
	.db $03, $54, $07, $4c, $00, $a0, $8e
	.db $76
	.db $03, $78, $04, $0d, $00, $d0, $8e
	.db $7a
	.db $03, $90, $04, $08, $00, $50, $0f
	.db $02, $c0, $05, $00, $12, $40, $0f
	.db $02, $c0, $05, $00, $11, $40, $8f
	.db $7e
	.db $03, $40, $04, $0d, $00, $c0, $0f
	.db $02, $a0, $05, $15, $65, $d0, $8f
	.db $85
	.db $03, $40, $04, $0d, $00, $a0, $10
	.db $00, $a0, $05, $02, $80, $b0, $90
	.db $89
	.db $03, $90, $04, $08, $00, $30, $91
	.db $90
	.db $02, $60, $04, $15, $57, $00, $12
	.db $02, $80, $04, $17, $34, $00, $12
	.db $02, $70, $05, $15, $57, $00, $12
	.db $02, $80, $05, $17, $34, $00, $92
	.db $9c
	.db $01, $80, $05, $33, $06, $80, $13
	.db $03, $80, $05, $0f, $00, $90, $93
	.db $a8
	.db $02, $40, $05, $15, $78, $00, $15
	.db $02, $80, $05, $17, $45, $00, $15
	.db $02, $a0, $05, $15, $78, $00, $95
	.db $b0
	.db $02, $80, $05, $17, $56, $00, $96
	.db $b2
	.db $02, $40, $04, $15, $89, $40, $16
	.db $01, $80, $04, $33, $09, $40, $16
	.db $01, $80, $05, $33, $09, $40, $96
	.db $b4
	.db $02, $80, $05, $00, $1c, $80, $16
	.db $02, $80, $05, $00, $13, $80, $96
	.db $b7
	.db $00, $48, $04, $0b, $01, $e0, $16
.ifdef ZERO_MOD
	.db $00, $00, $00, $00, $00, $00, $00
.else
	.db $00, $80, $05, $0a, $00, $e0, $16
.endif
	.db $00, $97, $05, $11, $01, $f8, $96
	.db $bd
	.db $03, $a0, $05, $47, $00, $a0, $17
	.db $03, $a0, $05, $46, $00, $a0, $97
	.db $bf
	.db $00, $97, $05, $11, $01, $f8, $97
	.db $c0
	.db $00, $80, $05, $0a, $01, $18, $98
	.db $c1
	.db $02, $10, $05, $17, $67, $30, $18
	.db $02, $10, $05, $04, $0c, $30, $18
	.db $02, $98, $05, $15, $bb, $30, $98
	.db $c3
	.db $03, $50, $06, $08, $01, $70, $98
	.db $c4
	.db $02, $80, $05, $00, $15, $80, $18
	.db $01, $80, $05, $33, $0b, $80, $18
	.db $01, $80, $05, $33, $0a, $80, $18
	.db $02, $80, $05, $00, $14, $80, $18
	.db $02, $80, $08, $00, $17, $80, $18
	.db $02, $80, $08, $00, $16, $80, $98
	.db $c6
	.db $03, $10, $07, $08, $01, $c0, $18
	.db $03, $d0, $07, $08, $01, $d0, $98
	.db $c7
	.db $03, $a0, $08, $18, $00, $f0, $98
	.db $d0
	.db $03, $a0, $08, $18, $00, $00, $1a
	.db $03, $a8, $08, $4b, $80, $00, $9a
	.db $d4
	.db $03, $d8, $08, $4b, $01, $88, $9a
	.db $d7
	.db $03, $a0, $08, $18, $00, $f0, $9a
	.db $da
	.db $03, $a8, $08, $4b, $02, $58, $9b
	.db $de
	.db $03, $a0, $08, $18, $00, $c0, $9b
	.db $e1
	.db $03, $a8, $08, $4b, $04, $28, $9c
	.db $e5
	.db $03, $a0, $08, $18, $00, $a0, $9c
	.db $ef
	.db $00, $97, $08, $07, $02, $f8, $9d
	.db $f0
	.db $00, $80, $08, $0a, $01, $18, $9e
	.db $f4
	.db $01, $80, $08, $33, $0a, $80, $1e
	.db $02, $80, $08, $0b, $02, $80, $1e
	.db $01, $80, $08, $33, $09, $80, $9e
	.db $f5
	.db $02, $80, $08, $04, $0d, $a0, $9e
	.db $f6
	.db $02, $98, $08, $15, $bc, $d0, $9e
	.db $f7
.ifdef ZERO_MOD
	.db $00, $00, $00, $00, $00, $00, $00
.else
	.db $00, $80, $08, $0a, $00, $e0, $1e
.endif
	.db $00, $97, $08, $07, $82, $f8, $9e
	.db $fd
	.db $03, $a0, $08, $53, $00, $a0, $9f
	.db $fe
	.db $00, $f8, $07, $06, $00, $c7, $9f
	.db $fe


EntityLocations2_BlizzardBuffalo:
	.db $09
	.db $03, $a0, $03, $2f, $0b, $30, $81
	.db $0c
	.db $01, $80, $03, $33, $54, $80, $01
	.db $01, $80, $03, $33, $1a, $80, $81
	.db $16
	.db $03, $30, $03, $0d, $00, $d0, $82
	.db $19
	.db $03, $80, $03, $0d, $00, $30, $83
	.db $1d
	.db $03, $40, $03, $0d, $00, $b0, $83
	.db $23
	.db $03, $60, $03, $0d, $00, $60, $84
	.db $24
	.db $01, $80, $03, $33, $1c, $80, $04
	.db $01, $80, $03, $33, $0d, $80, $84
	.db $2c
	.db $02, $80, $02, $00, $02, $80, $05
	.db $02, $80, $02, $00, $03, $80, $05
	.db $02, $48, $03, $00, $01, $80, $05
	.db $02, $48, $03, $00, $00, $80, $05
	.db $02, $80, $03, $0c, $01, $80, $85
	.db $34
	.db $02, $40, $03, $18, $01, $88, $86
	.db $39
	.db $03, $70, $02, $0d, $00, $30, $87
	.db $3a
	.db $00, $98, $03, $0b, $02, $50, $87
	.db $3d
	.db $03, $a0, $02, $0d, $00, $b0, $87
	.db $3e
	.db $02, $80, $02, $0c, $01, $c0, $87
	.db $41
	.db $03, $c0, $02, $0d, $00, $20, $88
	.db $43
	.db $03, $c0, $02, $0d, $00, $70, $88
	.db $48
	.db $02, $90, $03, $15, $02, $00, $89
	.db $4d
	.db $03, $50, $02, $08, $00, $a0, $89
	.db $4e
	.db $00, $c8, $04, $02, $80, $d0, $89
	.db $50
	.db $03, $c0, $02, $08, $00, $00, $0a
	.db $03, $c0, $04, $08, $00, $00, $8a
	.db $53
	.db $03, $50, $02, $08, $00, $60, $8a
	.db $54
	.db $00, $58, $02, $02, $80, $90, $0a
	.db $02, $80, $02, $00, $04, $80, $0a
	.db $03, $c0, $02, $08, $00, $88, $0a
	.db $02, $80, $03, $00, $05, $80, $0a
	.db $02, $00, $04, $04, $04, $80, $0a
	.db $02, $00, $04, $1a, $01, $80, $0a
	.db $01, $80, $04, $33, $1d, $80, $0a
	.db $01, $80, $04, $33, $0e, $80, $0a
	.db $02, $80, $04, $00, $05, $80, $0a
	.db $03, $c0, $04, $08, $00, $90, $0a
	.db $02, $00, $05, $00, $06, $80, $0a
	.db $02, $90, $05, $00, $08, $80, $0a
	.db $02, $90, $05, $00, $07, $80, $8a
	.db $57
.ifdef ZERO_MOD
	.db $00, $00, $00, $00, $00, $00, $00
.else
	.db $00, $90, $05, $0a, $00, $e0, $0a
.endif
	.db $00, $a7, $05, $11, $02, $f8, $8a
	.db $5d
	.db $03, $a0, $05, $47, $00, $a0, $0b
	.db $03, $a0, $05, $46, $00, $a0, $8b
	.db $5f
	.db $00, $a7, $05, $11, $02, $f8, $8b
	.db $60
	.db $00, $90, $05, $0a, $01, $18, $8c
	.db $61
	.db $02, $a8, $05, $15, $44, $30, $8c
	.db $64
	.db $02, $40, $05, $00, $09, $80, $0c
	.db $01, $80, $05, $33, $1d, $80, $0c
	.db $02, $80, $05, $09, $00, $80, $0c
	.db $01, $80, $05, $33, $0e, $80, $0c
	.db $02, $80, $05, $0b, $01, $80, $0c
	.db $02, $c0, $06, $00, $0c, $80, $0c
	.db $02, $c0, $06, $00, $0b, $80, $8c
	.db $68
	.db $02, $40, $05, $00, $0a, $00, $8d
	.db $6b
	.db $03, $3c, $06, $29, $02, $60, $8d
	.db $6e
	.db $00, $b8, $05, $02, $80, $d0, $8d
	.db $76
	.db $03, $3c, $06, $29, $03, $c0, $8e
	.db $7a
	.db $03, $a0, $05, $08, $00, $40, $0f
	.db $03, $3c, $06, $29, $04, $58, $0f
	.db $00, $7a, $07, $1a, $00, $48, $8f
	.db $7b
	.db $00, $00, $03, $05, $10, $70, $8f
	.db $7c
	.db $02, $20, $03, $03, $00, $80, $0f
	.db $02, $80, $03, $00, $11, $80, $0f
	.db $02, $80, $03, $00, $12, $80, $0f
	.db $02, $70, $04, $1a, $21, $80, $0f
	.db $01, $80, $04, $33, $55, $80, $0f
	.db $01, $80, $04, $33, $59, $80, $0f
	.db $03, $80, $04, $02, $03, $80, $0f
	.db $02, $80, $04, $18, $54, $88, $0f
	.db $02, $00, $05, $04, $05, $80, $0f
	.db $02, $c0, $05, $09, $00, $80, $0f
	.db $02, $80, $06, $00, $10, $80, $0f
	.db $02, $80, $06, $00, $0f, $80, $0f
	.db $02, $80, $06, $00, $0e, $80, $0f
	.db $02, $80, $06, $00, $0d, $80, $8f
	.db $7d
	.db $03, $70, $02, $0d, $00, $b0, $8f
	.db $7e
	.db $00, $a8, $04, $02, $80, $d0, $8f
	.db $80
	.db $03, $60, $03, $24, $00, $00, $90
	.db $81
	.db $03, $20, $03, $0d, $00, $20, $90
	.db $82
	.db $03, $c0, $02, $0d, $00, $40, $10
	.db $03, $6e, $03, $23, $02, $58, $90
	.db $84
	.db $03, $1e, $03, $23, $02, $88, $90
	.db $8b
	.db $03, $8e, $03, $23, $02, $68, $91
	.db $94
	.db $03, $ae, $02, $23, $00, $80, $92
	.db $95
	.db $03, $1e, $03, $23, $02, $b0, $92
	.db $96
	.db $03, $80, $02, $0d, $00, $c0, $12
	.db $00, $98, $03, $02, $80, $c0, $92
	.db $9c
	.db $03, $5e, $03, $23, $02, $80, $93
	.db $a0
	.db $02, $80, $02, $03, $00, $00, $14
	.db $02, $80, $03, $03, $00, $00, $94
	.db $a1
	.db $03, $8e, $03, $23, $00, $30, $94
	.db $a4
	.db $01, $80, $02, $33, $1f, $80, $14
	.db $03, $80, $02, $02, $03, $80, $14
	.db $01, $80, $02, $33, $10, $80, $14
	.db $01, $80, $02, $33, $10, $80, $14
	.db $01, $80, $02, $33, $1f, $80, $14
	.db $02, $80, $02, $15, $56, $80, $14
	.db $01, $80, $03, $33, $1f, $80, $14
	.db $01, $80, $03, $33, $10, $80, $14
	.db $03, $80, $03, $02, $03, $80, $14
	.db $01, $80, $03, $33, $10, $80, $14
	.db $01, $80, $03, $33, $1f, $80, $14
	.db $02, $80, $03, $00, $17, $80, $94
	.db $a6
	.db $02, $80, $02, $00, $14, $c0, $14
	.db $02, $80, $03, $00, $16, $c0, $14
	.db $02, $a0, $03, $15, $57, $d0, $94
	.db $a8
	.db $02, $80, $02, $00, $13, $00, $95
	.db $ac
	.db $02, $80, $02, $00, $15, $80, $15
	.db $03, $80, $02, $4d, $80, $80, $15
	.db $02, $80, $03, $17, $23, $80, $95
	.db $af
	.db $00, $97, $03, $07, $06, $f8, $95
	.db $b0
	.db $00, $98, $03, $0a, $01, $18, $96
	.db $b4
	.db $01, $80, $03, $33, $1e, $80, $16
	.db $01, $80, $03, $33, $10, $80, $16
	.db $01, $80, $03, $33, $1f, $80, $16
	.db $01, $80, $03, $33, $55, $80, $16
	.db $02, $80, $03, $0b, $02, $80, $16
	.db $01, $80, $03, $33, $0f, $80, $96
	.db $b5
	.db $02, $80, $03, $04, $06, $a0, $96
	.db $b6
	.db $02, $98, $03, $15, $78, $d0, $96
	.db $b7
	.db $00, $97, $03, $07, $86, $f8, $16
	.db $00, $98, $03, $0a, $00, $e0, $96
	.db $bc
	.db $02, $80, $03, $00, $18, $80, $97
	.db $bd
	.db $03, $70, $03, $52, $00, $a0, $97
	.db $bd


EntityLocations3_GravityBeetle:
	.db $0c
	.db $01, $80, $0d, $33, $24, $80, $01
	.db $01, $80, $0d, $33, $20, $80, $81
	.db $14
	.db $03, $a0, $0d, $18, $00, $80, $82
	.db $23
	.db $02, $40, $0d, $04, $0e, $70, $84
	.db $24
	.db $01, $80, $0d, $33, $21, $80, $84
	.db $25
	.db $02, $80, $0d, $17, $01, $a0, $84
	.db $28
	.db $02, $80, $0d, $00, $01, $00, $05
	.db $02, $80, $0d, $00, $00, $00, $85
	.db $29
	.db $00, $74, $0c, $0b, $04, $30, $85
	.db $2d
	.db $03, $70, $0d, $18, $00, $a0, $85
	.db $30
	.db $03, $50, $0c, $18, $00, $00, $86
	.db $32
	.db $03, $c0, $0c, $08, $00, $40, $06
	.db $03, $40, $0d, $18, $00, $48, $86
	.db $35
	.db $03, $b0, $0d, $08, $00, $b0, $86
	.db $36
	.db $03, $70, $0c, $18, $00, $d0, $86
	.db $39
	.db $00, $20, $0d, $02, $80, $30, $87
	.db $3c
	.db $02, $80, $0b, $00, $04, $80, $07
	.db $01, $80, $0b, $33, $23, $80, $07
	.db $02, $80, $0b, $00, $05, $80, $07
	.db $02, $c0, $0b, $1a, $21, $80, $07
	.db $02, $00, $0c, $18, $20, $80, $07
	.db $02, $40, $0c, $00, $03, $80, $07
	.db $02, $40, $0c, $00, $02, $80, $07
	.db $03, $70, $0c, $08, $00, $98, $87
	.db $3d
	.db $03, $10, $0d, $08, $00, $a0, $87
	.db $3e
	.db $03, $b0, $0d, $18, $00, $c0, $87
	.db $3f
	.db $03, $90, $0b, $08, $00, $e0, $87
	.db $44
	.db $02, $80, $0b, $00, $07, $80, $08
	.db $02, $80, $0b, $00, $06, $80, $88
	.db $47
	.db $00, $40, $0b, $0a, $00, $e0, $08
	.db $00, $47, $0b, $11, $03, $f8, $88
	.db $4d
	.db $03, $a0, $0b, $47, $00, $a0, $09
	.db $03, $a0, $0b, $46, $00, $a0, $89
	.db $4f
	.db $00, $a7, $0b, $11, $03, $f8, $89
	.db $50
	.db $02, $80, $0b, $05, $00, $00, $0a
	.db $00, $a8, $0b, $0a, $01, $18, $8a
	.db $52
	.db $00, $d4, $09, $17, $08, $40, $0a
	.db $02, $a8, $0a, $18, $55, $58, $0a
	.db $01, $a0, $0b, $33, $24, $40, $0a
	.db $01, $a0, $0b, $33, $23, $40, $0a
	.db $02, $a0, $0b, $0b, $01, $40, $8a
	.db $54
	.db $01, $80, $0a, $33, $25, $80, $0a
	.db $02, $80, $0a, $1e, $00, $80, $0a
	.db $02, $80, $0b, $00, $08, $80, $8a
	.db $55
	.db $03, $d0, $09, $06, $00, $b0, $8a
	.db $5a
	.db $03, $30, $0a, $08, $00, $50, $8b
	.db $5c
	.db $03, $00, $0a, $06, $00, $90, $8b
	.db $5e
	.db $03, $70, $09, $08, $00, $d0, $8b
	.db $61
	.db $03, $30, $09, $06, $00, $20, $8c
	.db $63
	.db $03, $50, $09, $03, $00, $70, $8c
	.db $64
	.db $03, $10, $09, $06, $00, $90, $8c
	.db $67
	.db $03, $60, $08, $06, $00, $f0, $8c
	.db $6c
	.db $03, $70, $08, $08, $00, $88, $8d
	.db $70
	.db $03, $50, $08, $03, $00, $10, $8e
	.db $76
	.db $03, $50, $08, $03, $00, $c0, $8e
	.db $78
	.db $02, $40, $08, $17, $23, $00, $8f
	.db $7c
	.db $02, $40, $08, $1e, $00, $80, $0f
	.db $03, $40, $08, $06, $00, $90, $0f
	.db $02, $80, $08, $00, $0a, $80, $0f
	.db $02, $80, $08, $00, $09, $80, $0f
	.db $02, $80, $09, $00, $0c, $80, $0f
	.db $02, $80, $09, $00, $0b, $80, $8f
	.db $7e
	.db $03, $70, $08, $08, $00, $c0, $8f
	.db $7f
	.db $00, $80, $08, $02, $80, $f0, $8f
	.db $80
	.db $02, $70, $09, $15, $56, $10, $90
	.db $84
	.db $01, $80, $09, $33, $26, $80, $90
	.db $89
	.db $03, $c0, $06, $18, $00, $38, $11
	.db $00, $c4, $07, $04, $80, $28, $11
	.db $00, $c4, $07, $02, $80, $38, $11
	.db $03, $c0, $08, $18, $00, $38, $91
	.db $8a
	.db $03, $a0, $09, $19, $11, $50, $91
	.db $8c
	.db $02, $80, $05, $00, $10, $80, $11
	.db $02, $80, $05, $00, $0f, $80, $11
	.db $02, $e0, $05, $1a, $43, $80, $11
	.db $02, $80, $09, $00, $0e, $80, $11
	.db $02, $80, $09, $00, $0d, $80, $91
	.db $8e
	.db $00, $c4, $06, $01, $80, $d8, $11
	.db $00, $c4, $06, $02, $80, $c8, $11
	.db $03, $c0, $07, $18, $00, $c8, $11
	.db $00, $c4, $08, $02, $80, $d8, $11
	.db $00, $c4, $08, $01, $80, $c8, $91
	.db $8f
	.db $00, $a7, $05, $11, $03, $f8, $91
	.db $90
	.db $02, $a8, $05, $15, $77, $00, $12
	.db $00, $a8, $05, $0a, $01, $18, $92
	.db $91
	.db $03, $b0, $04, $2f, $0a, $30, $92
	.db $92
	.db $02, $c0, $04, $00, $13, $40, $12
	.db $02, $80, $05, $00, $11, $40, $92
	.db $94
	.db $02, $80, $04, $00, $12, $80, $12
	.db $02, $80, $05, $17, $45, $80, $12
	.db $02, $80, $05, $00, $14, $80, $92
	.db $97
	.db $02, $78, $05, $15, $78, $e0, $92
	.db $98
	.db $01, $80, $05, $33, $62, $00, $93
	.db $9c
	.db $03, $c0, $05, $25, $06, $90, $93
	.db $a3
	.db $03, $90, $05, $08, $00, $60, $94
	.db $a4
	.db $03, $e0, $05, $25, $06, $90, $94
	.db $a9
	.db $00, $68, $04, $02, $80, $30, $95
	.db $aa
	.db $02, $80, $05, $00, $16, $40, $15
	.db $02, $80, $05, $00, $15, $40, $95
	.db $ab
	.db $03, $90, $05, $08, $00, $60, $95
	.db $ad
	.db $02, $80, $04, $00, $17, $ba, $15
	.db $02, $80, $04, $00, $18, $ba, $15
	.db $03, $60, $05, $08, $00, $a0, $95
	.db $ae
	.db $02, $60, $04, $15, $89, $c0, $95
	.db $b6
	.db $03, $b0, $04, $18, $00, $c8, $96
	.db $ba
	.db $03, $a0, $04, $18, $00, $50, $97
	.db $be
	.db $03, $90, $04, $18, $00, $c0, $97
	.db $c1
	.db $03, $50, $02, $08, $00, $30, $98
	.db $c4
	.db $02, $80, $01, $00, $1c, $80, $18
	.db $02, $80, $01, $00, $1d, $80, $18
	.db $02, $80, $04, $00, $1a, $80, $18
	.db $01, $80, $04, $33, $58, $80, $18
	.db $02, $80, $04, $0c, $05, $80, $18
	.db $02, $80, $04, $00, $19, $80, $98
	.db $c6
	.db $03, $80, $02, $0e, $00, $d8, $18
	.db $03, $d0, $02, $08, $00, $c0, $18
	.db $02, $e0, $03, $18, $b9, $c0, $98
	.db $c7
	.db $00, $87, $01, $07, $0b, $f8, $18
	.db $02, $80, $04, $00, $1b, $e0, $98
	.db $c8
	.db $00, $88, $01, $0a, $01, $18, $19
	.db $02, $90, $04, $15, $9a, $00, $99
	.db $cc
	.db $01, $80, $01, $33, $24, $80, $19
	.db $01, $80, $01, $33, $23, $80, $19
	.db $01, $80, $01, $33, $58, $80, $19
	.db $02, $80, $01, $0b, $02, $80, $99
	.db $cd
	.db $02, $80, $01, $05, $01, $a0, $99
	.db $ce
	.db $02, $88, $01, $15, $bc, $d0, $99
	.db $cf
	.db $00, $87, $01, $07, $8b, $f8, $19
	.db $00, $88, $01, $0a, $00, $e0, $99
	.db $d5
	.db $03, $80, $01, $59, $00, $a0, $9a
	.db $d6
	.db $03, $90, $04, $4d, $20, $c0, $9a
	.db $d6


EntityLocations4_ToxicSeahorse:
	.db $0c
	.db $01, $80, $07, $33, $01, $80, $01
	.db $01, $80, $07, $33, $00, $80, $81
	.db $16
	.db $03, $b0, $07, $1e, $00, $c0, $82
	.db $1d
	.db $03, $a0, $07, $1e, $00, $a0, $83
	.db $22
	.db $02, $58, $08, $18, $01, $40, $84
	.db $24
	.db $02, $80, $07, $00, $01, $80, $04
	.db $02, $80, $07, $08, $80, $80, $04
	.db $02, $80, $07, $00, $00, $80, $04
	.db $01, $80, $08, $33, $02, $80, $04
	.db $02, $80, $08, $00, $00, $80, $84
	.db $28
	.db $02, $80, $08, $00, $02, $00, $85
	.db $2c
	.db $03, $90, $08, $08, $00, $80, $85
	.db $33
	.db $03, $90, $08, $08, $00, $60, $86
	.db $34
	.db $02, $30, $01, $00, $07, $80, $06
	.db $02, $e0, $01, $00, $08, $80, $06
	.db $01, $80, $02, $33, $11, $80, $06
	.db $02, $80, $02, $00, $05, $80, $06
	.db $02, $80, $02, $00, $06, $80, $06
	.db $03, $d5, $04, $06, $00, $80, $06
	.db $03, $05, $07, $06, $00, $80, $06
	.db $03, $75, $07, $06, $00, $85, $06
	.db $02, $80, $08, $00, $04, $80, $06
	.db $02, $80, $08, $00, $03, $80, $86
	.db $35
	.db $03, $90, $01, $08, $00, $a0, $06
	.db $03, $55, $05, $06, $00, $b6, $86
	.db $36
	.db $00, $a0, $01, $0b, $08, $d0, $06
	.db $03, $80, $02, $08, $00, $d0, $06
	.db $00, $a6, $03, $02, $80, $c8, $06
	.db $03, $40, $04, $08, $00, $c8, $06
	.db $03, $70, $06, $08, $00, $d0, $06
	.db $03, $00, $07, $08, $00, $c0, $06
	.db $00, $08, $07, $02, $80, $d8, $86
	.db $38
	.db $02, $80, $02, $15, $12, $00, $87
	.db $3c
	.db $02, $80, $02, $17, $01, $80, $87
	.db $3f
	.db $00, $67, $02, $11, $09, $f8, $07
	.db $00, $68, $02, $0a, $00, $e0, $87
	.db $45
	.db $03, $a0, $02, $47, $00, $a0, $08
	.db $03, $a0, $02, $46, $00, $a0, $88
	.db $47
	.db $00, $a7, $02, $11, $08, $f8, $88
	.db $48
	.db $00, $a8, $02, $0a, $01, $18, $89
	.db $49
	.db $02, $a8, $02, $15, $33, $28, $89
	.db $4c
	.db $01, $80, $02, $33, $11, $80, $09
	.db $02, $80, $02, $0c, $03, $80, $09
	.db $02, $80, $02, $0b, $01, $80, $09
	.db $02, $80, $02, $00, $09, $80, $89
	.db $4e
	.db $02, $60, $02, $15, $34, $c0, $09
	.db $02, $80, $02, $04, $00, $c0, $89
	.db $52
	.db $02, $80, $02, $00, $0c, $40, $8a
	.db $54
	.db $02, $50, $02, $15, $45, $80, $0a
	.db $02, $80, $02, $08, $00, $80, $0a
	.db $02, $80, $02, $00, $0a, $80, $0a
	.db $02, $40, $03, $00, $0d, $80, $0a
	.db $01, $80, $03, $33, $22, $80, $0a
	.db $02, $80, $03, $1a, $12, $80, $0a
	.db $01, $00, $04, $33, $15, $80, $0a
	.db $01, $00, $04, $33, $5e, $80, $0a
	.db $01, $00, $04, $33, $14, $80, $0a
	.db $01, $00, $04, $33, $12, $80, $0a
	.db $02, $80, $04, $00, $0e, $80, $8a
	.db $56
	.db $02, $80, $02, $00, $0b, $c0, $0a
	.db $03, $f0, $04, $1c, $00, $d0, $8a
	.db $59
	.db $00, $54, $03, $17, $02, $30, $8b
	.db $5a
	.db $03, $70, $02, $2f, $0a, $50, $0b
	.db $03, $08, $05, $1c, $00, $58, $8b
	.db $5c
	.db $01, $80, $03, $33, $13, $80, $0b
	.db $01, $80, $04, $33, $13, $80, $0b
	.db $01, $80, $05, $33, $13, $80, $8b
	.db $64
	.db $03, $00, $05, $1c, $00, $88, $8c
	.db $66
	.db $03, $90, $05, $1c, $00, $c8, $8c
	.db $67
	.db $03, $a8, $04, $1c, $00, $f0, $8c
	.db $68
	.db $02, $80, $02, $0e, $00, $00, $0d
	.db $02, $80, $03, $0e, $00, $00, $0d
	.db $02, $80, $04, $0e, $00, $00, $0d
	.db $02, $80, $05, $0e, $00, $00, $8d
	.db $69
	.db $03, $a0, $05, $1c, $00, $30, $8d
	.db $6b
	.db $03, $b0, $04, $1c, $00, $60, $8d
	.db $6f
	.db $03, $88, $05, $1c, $00, $e8, $8d
	.db $71
	.db $03, $78, $04, $1c, $00, $38, $8e
	.db $74
	.db $03, $60, $05, $1c, $00, $80, $8e
	.db $78
	.db $03, $90, $04, $1c, $00, $00, $8f
	.db $7c
	.db $02, $80, $03, $00, $12, $80, $0f
	.db $03, $80, $04, $02, $00, $80, $0f
	.db $03, $f8, $04, $1c, $00, $80, $8f
	.db $7d
	.db $03, $50, $05, $1c, $00, $b0, $8f
	.db $7e
	.db $02, $80, $02, $0e, $00, $c0, $0f
	.db $02, $80, $03, $0e, $00, $c0, $0f
	.db $02, $80, $04, $0e, $00, $c0, $0f
	.db $02, $80, $05, $0e, $00, $c0, $8f
	.db $80
	.db $02, $80, $05, $00, $14, $00, $10
	.db $02, $80, $05, $17, $23, $00, $10
	.db $02, $80, $05, $00, $13, $00, $90
	.db $81
	.db $02, $78, $05, $15, $48, $20, $90
	.db $84
	.db $02, $80, $03, $00, $11, $80, $90
	.db $86
	.db $02, $68, $02, $15, $47, $d0, $90
	.db $87
	.db $00, $67, $05, $11, $0f, $f8, $10
	.db $00, $68, $05, $0a, $00, $e0, $90
	.db $8c
	.db $03, $80, $05, $42, $00, $80, $91
	.db $8e
	.db $03, $62, $02, $4d, $80, $c8, $91
	.db $8f
	.db $00, $a7, $05, $11, $0a, $f8, $91
	.db $90
	.db $00, $a8, $05, $0a, $01, $18, $92
	.db $91
	.db $00, $18, $04, $02, $80, $28, $12
	.db $02, $a8, $05, $15, $99, $30, $92
	.db $94
	.db $01, $80, $02, $33, $18, $80, $12
	.db $02, $80, $02, $00, $16, $80, $12
	.db $02, $80, $02, $00, $17, $80, $12
	.db $01, $80, $02, $33, $17, $80, $12
	.db $03, $70, $03, $0b, $00, $90, $12
	.db $02, $00, $05, $1a, $43, $80, $12
	.db $02, $40, $05, $04, $01, $80, $12
	.db $01, $80, $05, $33, $16, $80, $12
	.db $02, $80, $05, $00, $15, $80, $92
	.db $96
	.db $03, $40, $04, $0b, $00, $d0, $92
	.db $a0
	.db $03, $90, $02, $18, $00, $00, $94
	.db $af
	.db $03, $70, $02, $18, $00, $e0, $95
	.db $b2
	.db $03, $70, $03, $18, $00, $48, $96
	.db $b4
	.db $03, $60, $02, $18, $00, $90, $16
	.db $02, $80, $02, $00, $19, $80, $16
	.db $02, $80, $02, $00, $18, $80, $16
	.db $02, $80, $03, $04, $02, $80, $16
	.db $01, $80, $03, $33, $19, $80, $16
	.db $02, $90, $03, $1a, $45, $80, $16
	.db $02, $80, $04, $00, $1b, $80, $16
	.db $02, $80, $04, $00, $1a, $80, $96
	.db $b7
	.db $00, $a7, $04, $07, $05, $f8, $96
	.db $b8
	.db $00, $a8, $04, $0a, $01, $18, $97
	.db $bc
	.db $01, $80, $04, $33, $19, $80, $17
	.db $02, $80, $04, $0b, $02, $80, $17
	.db $01, $80, $04, $33, $16, $80, $97
	.db $be
	.db $02, $a8, $04, $15, $ab, $d0, $97
	.db $bf
	.db $00, $a7, $04, $07, $85, $f8, $17
	.db $00, $a8, $04, $0a, $00, $e0, $97
	.db $c5
	.db $03, $80, $04, $57, $00, $a0, $98
	.db $c5


EntityLocations5_VoltCatfish:
	.db $0c
	.db $01, $80, $0a, $33, $36, $80, $01
	.db $01, $80, $0a, $33, $35, $80, $81
	.db $13
	.db $03, $58, $0a, $3d, $01, $60, $82
	.db $17
	.db $03, $7e, $0a, $11, $b0, $e8, $82
	.db $19
	.db $03, $60, $06, $0b, $80, $30, $83
	.db $1a
	.db $03, $80, $05, $0b, $80, $40, $03
	.db $03, $58, $0a, $3d, $01, $50, $03
	.db $00, $9a, $0b, $1a, $00, $48, $83
	.db $1c
	.db $03, $b0, $06, $18, $00, $98, $83
	.db $1d
	.db $03, $3e, $06, $16, $01, $a0, $83
	.db $21
	.db $03, $80, $03, $37, $00, $38, $04
	.db $03, $3e, $06, $16, $01, $30, $04
	.db $03, $4e, $0a, $11, $b0, $20, $84
	.db $22
	.db $03, $b0, $06, $18, $00, $50, $04
	.db $02, $80, $07, $00, $09, $40, $04
	.db $02, $80, $07, $00, $08, $40, $84
	.db $24
	.db $02, $40, $03, $00, $14, $80, $04
	.db $02, $40, $03, $00, $13, $80, $04
	.db $02, $80, $05, $00, $12, $80, $04
	.db $02, $80, $05, $00, $11, $80, $04
	.db $03, $4e, $07, $11, $b0, $80, $04
	.db $02, $80, $08, $00, $07, $80, $04
	.db $02, $80, $08, $00, $06, $80, $04
	.db $02, $a0, $0b, $15, $10, $90, $84
	.db $25
	.db $03, $90, $02, $4d, $40, $b8, $84
	.db $26
	.db $02, $e0, $04, $18, $42, $c8, $04
	.db $03, $b8, $05, $26, $02, $c8, $04
	.db $03, $a0, $08, $18, $00, $d8, $04
	.db $02, $a0, $0a, $00, $00, $c0, $04
	.db $02, $a0, $0a, $00, $01, $c0, $04
	.db $03, $b0, $0a, $26, $84, $c8, $84
	.db $28
	.db $02, $40, $04, $00, $15, $00, $05
	.db $02, $40, $04, $00, $16, $00, $05
	.db $03, $80, $0a, $18, $00, $08, $85
	.db $2c
	.db $02, $60, $04, $15, $45, $80, $05
	.db $02, $80, $04, $04, $10, $80, $05
	.db $02, $80, $06, $00, $0d, $80, $05
	.db $02, $80, $06, $00, $0c, $80, $05
	.db $02, $80, $06, $00, $0e, $80, $05
	.db $02, $80, $07, $00, $0b, $80, $05
	.db $02, $80, $07, $00, $0a, $80, $05
	.db $03, $a0, $08, $18, $00, $90, $05
	.db $03, $4e, $0a, $11, $b0, $80, $85
	.db $2e
	.db $02, $80, $05, $00, $0f, $c0, $05
	.db $02, $80, $05, $00, $10, $c0, $05
	.db $02, $78, $06, $18, $20, $c8, $05
	.db $03, $98, $07, $26, $01, $c8, $85
	.db $2f
	.db $02, $50, $05, $15, $23, $f8, $85
	.db $31
	.db $03, $48, $08, $3d, $02, $30, $06
	.db $03, $a0, $0a, $11, $00, $20, $86
	.db $32
	.db $00, $28, $09, $02, $80, $48, $06
	.db $00, $b8, $09, $02, $80, $48, $86
	.db $33
	.db $03, $4e, $08, $11, $b0, $70, $86
	.db $34
	.db $02, $80, $04, $17, $01, $80, $06
	.db $02, $80, $08, $00, $05, $80, $06
	.db $02, $80, $08, $00, $04, $80, $06
	.db $03, $20, $09, $18, $00, $80, $06
	.db $03, $b0, $09, $18, $00, $80, $06
	.db $02, $80, $0a, $00, $03, $80, $06
	.db $02, $80, $0a, $00, $02, $80, $86
	.db $36
	.db $00, $b8, $05, $0b, $10, $d8, $06
	.db $03, $b9, $0a, $26, $00, $c8, $86
	.db $3d
	.db $03, $90, $04, $11, $00, $a0, $87
	.db $3e
	.db $03, $50, $04, $06, $00, $d0, $87
	.db $41
	.db $03, $50, $04, $06, $00, $30, $88
	.db $42
	.db $03, $90, $04, $11, $00, $50, $88
	.db $49
	.db $03, $90, $05, $0b, $80, $30, $09
	.db $03, $f0, $06, $0b, $80, $30, $89
	.db $4a
	.db $03, $30, $06, $0b, $00, $50, $09
	.db $03, $50, $08, $0b, $80, $50, $09
	.db $00, $88, $08, $02, $80, $48, $09
	.db $03, $30, $09, $32, $00, $48, $89
	.db $4b
	.db $03, $90, $07, $11, $00, $60, $09
	.db $00, $88, $08, $01, $80, $60, $09
	.db $02, $28, $09, $18, $9a, $60, $89
	.db $4c
	.db $02, $80, $04, $17, $12, $80, $09
	.db $03, $a0, $05, $11, $00, $88, $89
	.db $4d
	.db $03, $38, $05, $3d, $00, $a0, $89
	.db $4f
	.db $01, $80, $04, $33, $38, $e0, $09
	.db $01, $80, $04, $33, $37, $e0, $09
	.db $02, $80, $04, $04, $11, $e0, $09
	.db $00, $a7, $04, $11, $04, $f8, $09
	.db $00, $a8, $04, $0a, $00, $e0, $09
	.db $03, $90, $07, $11, $00, $e0, $89
	.db $50
	.db $03, $b0, $08, $32, $00, $18, $8a
	.db $52
	.db $03, $a0, $05, $11, $00, $40, $8a
	.db $54
	.db $02, $80, $05, $00, $20, $80, $0a
	.db $02, $80, $05, $00, $21, $80, $0a
	.db $03, $f0, $08, $32, $00, $88, $0a
	.db $02, $80, $09, $00, $23, $80, $0a
	.db $02, $80, $09, $00, $22, $80, $8a
	.db $55
	.db $03, $a0, $04, $47, $00, $a0, $0a
	.db $03, $a0, $04, $46, $00, $a0, $0a
	.db $03, $3e, $05, $11, $b0, $a0, $0a
	.db $03, $70, $09, $32, $00, $b8, $8a
	.db $57
	.db $00, $a7, $04, $11, $04, $f8, $8a
	.db $58
	.db $00, $a8, $04, $0a, $01, $18, $8b
	.db $59
	.db $02, $a8, $04, $15, $66, $28, $0b
	.db $02, $30, $05, $15, $96, $20, $0b
	.db $03, $60, $05, $11, $00, $20, $0b
	.db $03, $80, $09, $32, $00, $28, $8b
	.db $5b
	.db $00, $78, $07, $02, $80, $60, $0b
	.db $00, $78, $07, $01, $80, $70, $0b
	.db $03, $50, $09, $18, $00, $78, $8b
	.db $5c
	.db $01, $80, $04, $33, $35, $80, $0b
	.db $01, $80, $04, $33, $38, $80, $0b
	.db $02, $80, $04, $00, $17, $80, $0b
	.db $02, $80, $04, $00, $18, $80, $0b
	.db $02, $80, $04, $0b, $01, $80, $0b
	.db $01, $80, $04, $33, $37, $80, $0b
	.db $00, $78, $07, $05, $20, $80, $0b
	.db $00, $78, $07, $01, $80, $90, $0b
	.db $03, $90, $08, $18, $00, $80, $0b
	.db $02, $80, $0b, $00, $27, $80, $0b
	.db $02, $80, $0b, $00, $26, $80, $8b
	.db $5d
	.db $00, $78, $07, $02, $80, $a0, $8b
	.db $5e
	.db $03, $60, $03, $2f, $0c, $d8, $0b
	.db $02, $40, $08, $00, $25, $c0, $0b
	.db $02, $40, $08, $00, $24, $c0, $0b
	.db $03, $78, $08, $0b, $00, $c0, $0b
	.db $03, $10, $09, $32, $00, $c8, $8b
	.db $5f
	.db $02, $40, $04, $00, $1a, $e0, $0b
	.db $02, $40, $04, $00, $19, $e0, $0b
	.db $00, $97, $0b, $07, $0d, $f8, $8b
	.db $60
	.db $03, $6e, $07, $11, $b0, $00, $0c
	.db $00, $98, $0b, $0a, $01, $18, $8c
	.db $61
	.db $03, $a0, $05, $11, $00, $20, $8c
	.db $63
	.db $02, $40, $03, $15, $76, $60, $0c
	.db $03, $8e, $05, $11, $b0, $78, $8c
	.db $64
	.db $03, $70, $04, $11, $00, $80, $0c
	.db $01, $80, $04, $33, $57, $80, $0c
	.db $02, $80, $05, $00, $1c, $80, $0c
	.db $02, $80, $05, $00, $1d, $80, $0c
	.db $02, $80, $05, $00, $1b, $80, $0c
	.db $02, $80, $07, $00, $1f, $80, $0c
	.db $02, $80, $07, $00, $1e, $80, $0c
	.db $03, $90, $07, $11, $00, $80, $0c
	.db $01, $80, $0b, $33, $35, $80, $0c
	.db $01, $80, $0b, $33, $37, $80, $0c
	.db $01, $80, $0b, $33, $57, $80, $0c
	.db $01, $80, $0b, $33, $39, $80, $0c
	.db $02, $c0, $0b, $0b, $02, $80, $8c
	.db $65
	.db $03, $d0, $04, $32, $00, $b8, $8c
	.db $66
	.db $03, $d0, $05, $3a, $00, $d0, $0c
	.db $02, $50, $07, $18, $68, $d0, $0c
	.db $02, $98, $0b, $15, $ab, $d0, $8c
	.db $67
	.db $03, $70, $04, $32, $00, $e8, $0c
	.db $03, $30, $05, $32, $00, $e8, $0c
	.db $00, $97, $0b, $07, $8e, $f8, $0c
	.db $00, $98, $0b, $0a, $00, $e0, $8c
	.db $6d
	.db $03, $70, $0b, $58, $00, $a0, $8d
	.db $6d


EntityLocations6_CrushCrawfish:
	.db $0c
	.db $01, $80, $02, $33, $2c, $80, $01
	.db $01, $80, $02, $33, $2d, $80, $01
	.db $02, $80, $03, $00, $1d, $80, $81
	.db $0e
	.db $03, $50, $02, $2f, $0b, $d0, $81
	.db $10
	.db $02, $80, $03, $00, $1d, $00, $82
	.db $11
	.db $03, $48, $02, $0d, $00, $38, $82
	.db $14
	.db $02, $80, $02, $00, $1e, $80, $02
	.db $02, $80, $03, $00, $1e, $80, $82
	.db $15
	.db $03, $60, $02, $0d, $00, $a8, $02
	.db $03, $10, $03, $0d, $00, $a8, $82
	.db $19
	.db $03, $a0, $02, $0d, $00, $20, $83
	.db $1a
	.db $03, $00, $03, $0d, $00, $40, $03
	.db $02, $80, $03, $00, $00, $40, $03
	.db $02, $80, $03, $00, $01, $40, $03
	.db $03, $b4, $03, $3c, $00, $58, $83
	.db $1e
	.db $00, $a4, $04, $17, $04, $d0, $83
	.db $1f
	.db $03, $30, $02, $0d, $00, $e8, $83
	.db $22
	.db $03, $b0, $02, $0d, $00, $50, $84
	.db $24
	.db $00, $48, $02, $02, $80, $90, $84
	.db $26
	.db $03, $30, $02, $0d, $00, $c0, $04
	.db $00, $d8, $02, $02, $80, $d0, $84
	.db $28
	.db $02, $80, $03, $15, $02, $00, $85
	.db $29
	.db $03, $90, $07, $4d, $40, $30, $85
	.db $2c
	.db $02, $80, $03, $00, $03, $80, $05
	.db $02, $80, $03, $00, $02, $80, $05
	.db $02, $80, $05, $0c, $07, $80, $05
	.db $02, $80, $06, $00, $08, $80, $05
	.db $02, $80, $06, $00, $07, $80, $85
	.db $2d
	.db $03, $a0, $03, $2d, $01, $a0, $85
	.db $2f
	.db $02, $80, $05, $00, $04, $f0, $85
	.db $30
	.db $02, $80, $05, $00, $06, $10, $06
	.db $02, $80, $05, $00, $05, $00, $86
	.db $33
	.db $02, $90, $07, $15, $32, $60, $86
	.db $34
	.db $02, $80, $07, $0c, $07, $80, $86
	.db $36
	.db $00, $a8, $05, $0b, $20, $d0, $06
	.db $02, $b0, $06, $00, $0a, $c0, $06
	.db $02, $b0, $06, $00, $09, $c0, $86
	.db $38
	.db $02, $70, $06, $15, $24, $00, $87
	.db $47
	.db $00, $97, $06, $11, $05, $f8, $08
	.db $00, $98, $06, $0a, $00, $e0, $08
	.db $02, $a0, $06, $15, $45, $e0, $88
	.db $4d
	.db $03, $a0, $06, $47, $00, $a0, $09
	.db $03, $a0, $06, $46, $00, $a0, $89
	.db $4f
	.db $00, $97, $06, $11, $05, $f8, $89
	.db $50
	.db $00, $80, $06, $0a, $01, $18, $0a
	.db $02, $a0, $06, $15, $66, $00, $8a
	.db $54
	.db $01, $80, $06, $33, $2c, $80, $0a
	.db $01, $80, $06, $33, $2d, $80, $0a
	.db $02, $80, $06, $0b, $01, $80, $0a
	.db $02, $80, $06, $00, $0b, $80, $8a
	.db $5c
	.db $03, $70, $06, $3b, $00, $80, $8b
	.db $60
	.db $03, $50, $06, $28, $00, $00, $8c
	.db $61
	.db $00, $b8, $06, $02, $80, $30, $8c
	.db $62
	.db $00, $8a, $07, $1a, $00, $48, $8c
	.db $64
	.db $02, $80, $06, $00, $0d, $80, $0c
	.db $02, $80, $06, $00, $0e, $80, $0c
	.db $02, $80, $06, $00, $0f, $80, $0c
	.db $02, $80, $06, $00, $0c, $80, $8c
	.db $69
	.db $03, $70, $07, $0e, $01, $28, $8d
	.db $6a
	.db $03, $70, $06, $28, $00, $50, $0d
	.db $02, $80, $08, $00, $13, $40, $0d
	.db $02, $80, $08, $00, $12, $40, $8d
	.db $6c
	.db $02, $80, $06, $00, $11, $80, $0d
	.db $02, $80, $06, $00, $10, $80, $0d
	.db $02, $60, $07, $04, $14, $80, $0d
	.db $01, $80, $07, $33, $2f, $80, $0d
	.db $01, $80, $07, $33, $2e, $80, $0d
	.db $02, $80, $07, $1a, $01, $80, $8d
	.db $6e
	.db $03, $50, $06, $0e, $00, $d9, $0d
	.db $03, $b0, $07, $28, $00, $c0, $0d
	.db $00, $b8, $07, $02, $80, $d6, $8d
	.db $74
	.db $02, $50, $08, $15, $67, $80, $8e
	.db $7c
	.db $02, $80, $08, $17, $12, $80, $8f
	.db $7f
	.db $03, $60, $08, $2d, $00, $f0, $8f
	.db $89
	.db $00, $68, $09, $01, $80, $30, $11
	.db $00, $98, $0a, $02, $80, $30, $91
	.db $8a
	.db $00, $98, $0a, $02, $80, $40, $91
	.db $8c
	.db $01, $80, $08, $33, $30, $80, $11
	.db $02, $80, $08, $00, $14, $80, $11
	.db $02, $80, $08, $00, $15, $80, $11
	.db $03, $a0, $08, $2d, $02, $80, $11
	.db $02, $20, $09, $04, $15, $80, $11
	.db $02, $80, $09, $00, $17, $80, $11
	.db $01, $80, $09, $33, $31, $80, $11
	.db $01, $80, $09, $33, $32, $80, $11
	.db $02, $80, $09, $00, $16, $80, $11
	.db $03, $30, $0a, $0d, $00, $88, $91
	.db $91
	.db $02, $60, $09, $15, $78, $30, $92
	.db $92
	.db $03, $b0, $0a, $2d, $00, $50, $92
	.db $93
	.db $03, $40, $09, $0d, $00, $60, $92
	.db $94
	.db $03, $a0, $09, $0d, $00, $90, $92
	.db $99
	.db $03, $50, $09, $0d, $00, $30, $93
	.db $9a
	.db $03, $f0, $09, $0d, $00, $40, $93
	.db $9b
	.db $03, $70, $0a, $0d, $00, $70, $93
	.db $9d
	.db $03, $00, $0a, $0d, $00, $a0, $93
	.db $9e
	.db $03, $70, $0a, $2d, $00, $d0, $93
	.db $a0
	.db $03, $40, $09, $0d, $00, $00, $14
	.db $02, $80, $0a, $17, $23, $00, $94
	.db $a3
	.db $03, $70, $09, $0d, $00, $60, $94
	.db $a4
	.db $02, $80, $09, $0c, $06, $80, $14
	.db $02, $00, $0a, $1a, $23, $80, $94
	.db $a6
	.db $00, $98, $09, $04, $80, $d0, $14
	.db $00, $98, $09, $04, $80, $c0, $94
	.db $a7
	.db $00, $a7, $0a, $11, $06, $f8, $94
	.db $a8
	.db $01, $80, $0a, $33, $33, $00, $15
	.db $00, $90, $0a, $0a, $01, $18, $95
	.db $aa
	.db $02, $80, $0a, $04, $16, $40, $95
	.db $ac
	.db $02, $80, $0a, $00, $18, $80, $95
	.db $af
	.db $03, $80, $0a, $2a, $00, $e8, $95
	.db $b1
	.db $03, $40, $08, $0e, $01, $36, $16
	.db $02, $80, $0a, $17, $34, $20, $96
	.db $b2
	.db $02, $70, $06, $00, $1b, $40, $16
	.db $02, $70, $06, $00, $1c, $40, $16
	.db $03, $b0, $07, $0e, $01, $56, $96
	.db $b4
	.db $02, $80, $0a, $00, $1a, $80, $16
	.db $01, $80, $0a, $33, $34, $80, $16
	.db $02, $80, $0a, $00, $19, $80, $96
	.db $b5
	.db $02, $00, $0a, $18, $99, $a0, $96
	.db $b6
	.db $03, $60, $07, $28, $00, $c8, $96
	.db $b7
	.db $00, $67, $06, $07, $0a, $f8, $96
	.db $b8
	.db $00, $68, $06, $0a, $01, $18, $97
	.db $bc
	.db $01, $80, $06, $33, $34, $80, $17
	.db $02, $80, $06, $0b, $02, $80, $17
	.db $01, $80, $06, $33, $32, $80, $97
	.db $be
	.db $02, $80, $06, $15, $9a, $d0, $97
	.db $bf
	.db $00, $67, $06, $07, $8a, $f8, $17
	.db $00, $68, $06, $0a, $00, $e0, $97
	.db $c1
	.db $03, $80, $06, $54, $00, $20, $98
	.db $c1


EntityLocations7_TunnelRhino:
	.db $14
	.db $03, $30, $07, $35, $01, $80, $82
	.db $1c
	.db $03, $30, $07, $35, $01, $80, $83
	.db $20
	.db $01, $80, $07, $33, $3e, $00, $84
	.db $24
	.db $02, $80, $07, $00, $01, $80, $04
	.db $02, $80, $07, $00, $00, $80, $04
	.db $02, $20, $08, $00, $03, $80, $04
	.db $02, $20, $08, $00, $02, $80, $84
	.db $27
	.db $02, $a0, $08, $15, $01, $f0, $84
	.db $28
	.db $02, $80, $08, $04, $1b, $00, $85
	.db $2c
	.db $02, $80, $08, $17, $01, $80, $85
	.db $2f
	.db $03, $b0, $08, $2b, $00, $f0, $85
	.db $32
	.db $02, $30, $07, $18, $32, $50, $06
	.db $03, $70, $07, $29, $83, $50, $86
	.db $34
	.db $03, $78, $04, $3f, $04, $90, $06
	.db $03, $78, $05, $3f, $03, $80, $06
	.db $02, $b0, $06, $00, $0c, $80, $06
	.db $02, $b0, $06, $00, $0b, $80, $06
	.db $02, $80, $07, $00, $09, $80, $06
	.db $02, $80, $07, $00, $0a, $80, $06
	.db $02, $80, $07, $00, $06, $80, $06
	.db $03, $80, $07, $02, $04, $80, $06
	.db $01, $80, $08, $33, $5d, $80, $06
	.db $02, $80, $08, $00, $05, $80, $06
	.db $02, $80, $08, $00, $04, $80, $86
	.db $35
	.db $03, $68, $06, $3f, $00, $b0, $86
	.db $36
	.db $02, $f0, $07, $18, $21, $c0, $06
	.db $03, $10, $08, $29, $82, $c0, $86
	.db $37
	.db $03, $40, $05, $29, $05, $e0, $86
	.db $39
	.db $03, $90, $06, $2b, $00, $30, $07
	.db $02, $80, $07, $00, $08, $20, $07
	.db $02, $80, $07, $00, $07, $20, $87
	.db $3b
	.db $03, $58, $06, $3f, $01, $70, $07
	.db $03, $48, $07, $34, $00, $78, $87
	.db $3c
	.db $03, $18, $04, $3f, $05, $80, $07
	.db $02, $80, $04, $00, $0d, $80, $07
	.db $02, $80, $04, $00, $0e, $80, $07
	.db $03, $78, $05, $3f, $02, $80, $87
	.db $3d
	.db $02, $58, $04, $15, $34, $a0, $87
	.db $3f
.ifdef SWAP_CAPSULE
	.db $03, $58, $07, $4d, $10, $e0, $87
.else
	.db $00, $58, $07, $0b, $40, $e0, $87
.endif
	.db $43
	.db $03, $58, $04, $3f, $06, $70, $88
	.db $44
	.db $02, $80, $04, $00, $0f, $80, $08
	.db $02, $80, $04, $00, $10, $80, $08
	.db $03, $18, $05, $0e, $01, $87, $08
	.db $02, $00, $06, $04, $2a, $80, $88
	.db $46
	.db $03, $24, $05, $0e, $00, $da, $08
	.db $00, $d4, $05, $01, $80, $c0, $08
	.db $02, $80, $06, $00, $12, $c0, $08
	.db $02, $80, $06, $00, $11, $c0, $88

	.db $47
Data_3c_e9ee:
	.db $00 ; low nybble determines entry in todo_XequNextFreeEntitySlotForTypeX
	.db $38 ; stored in entity+8 (this and below is Y?)
	.db $04 ; stored in entity+9
	.db $05 ; in +0a
	.db $40 ; in +0b
	.db $e0 ; in +5 (this and below is X?)
	.db $08 ; &1f in +6

	.db $02, $a0, $06, $15, $45, $e0, $08
	.db $00, $a7, $06, $11, $07, $f8, $08
	.db $00, $a8, $06, $0a, $00, $e0, $88
	.db $4d
	.db $03, $a0, $06, $47, $00, $a0, $09
	.db $03, $a0, $06, $46, $00, $a0, $89
	.db $4f
	.db $00, $a7, $06, $11, $0d, $f8, $89
	.db $50
	.db $02, $a0, $06, $15, $66, $00, $0a
	.db $00, $a8, $06, $0a, $01, $18, $8a
	.db $54
	.db $01, $80, $06, $33, $3e, $80, $0a
	.db $01, $80, $06, $33, $5d, $80, $0a
	.db $02, $80, $06, $0b, $01, $80, $0a
	.db $02, $80, $06, $00, $13, $80, $8a
	.db $5b
	.db $03, $b0, $06, $0c, $00, $70, $8b
	.db $5f
	.db $03, $90, $06, $2b, $00, $e0, $8b
	.db $61
	.db $00, $78, $05, $02, $80, $30, $8c
	.db $62
	.db $03, $70, $05, $2b, $00, $50, $8c
	.db $64
	.db $02, $c0, $05, $00, $16, $80, $0c
	.db $02, $c0, $05, $00, $17, $80, $0c
	.db $02, $40, $06, $00, $15, $80, $0c
	.db $02, $40, $06, $00, $14, $80, $0c
	.db $03, $90, $06, $0c, $00, $90, $8c
	.db $67
	.db $02, $80, $05, $00, $19, $e0, $0c
	.db $02, $80, $05, $00, $18, $e0, $8c
	.db $6c
	.db $02, $a0, $02, $00, $1e, $80, $0d
	.db $02, $a0, $02, $00, $1f, $80, $0d
	.db $03, $78, $03, $34, $01, $88, $0d
	.db $02, $80, $03, $00, $1d, $80, $0d
	.db $02, $80, $03, $00, $1c, $80, $0d
	.db $03, $88, $04, $33, $01, $98, $0d
	.db $03, $28, $05, $33, $02, $98, $8d
	.db $6e
	.db $03, $a0, $02, $4d, $10, $c0, $8d
	.db $70
	.db $02, $00, $04, $1a, $21, $00, $0e
	.db $02, $40, $04, $04, $1c, $00, $0e
	.db $02, $80, $04, $15, $76, $00, $0e
	.db $03, $70, $05, $2b, $00, $10, $8e
	.db $71
	.db $02, $80, $05, $00, $1b, $20, $0e
	.db $02, $80, $05, $00, $1a, $20, $8e
	.db $74
	.db $02, $80, $03, $00, $21, $80, $0e
	.db $02, $80, $03, $00, $20, $80, $8e
	.db $75
	.db $03, $68, $04, $33, $02, $a8, $8e
	.db $78
	.db $02, $60, $03, $15, $78, $00, $0f
	.db $02, $80, $03, $04, $29, $00, $8f
	.db $7c
	.db $02, $80, $03, $00, $23, $80, $0f
	.db $02, $80, $03, $00, $22, $80, $0f
	.db $02, $80, $05, $17, $23, $80, $8f
	.db $7e
	.db $03, $e8, $03, $33, $00, $d8, $0f
	.db $02, $80, $05, $00, $25, $c0, $0f
	.db $02, $80, $05, $00, $24, $c0, $8f
	.db $7f
	.db $00, $a7, $05, $11, $0e, $f8, $0f
	.db $00, $a8, $05, $0a, $00, $e0, $8f
	.db $80
	.db $02, $a0, $05, $15, $8a, $00, $90
	.db $84
	.db $02, $80, $05, $00, $26, $80, $10
	.db $03, $80, $05, $30, $00, $80, $90
	.db $88
	.db $00, $90, $05, $0a, $01, $18, $91
	.db $8a
	.db $02, $a0, $05, $15, $aa, $40, $91
	.db $94
	.db $02, $80, $05, $17, $31, $80, $12
	.db $03, $90, $05, $0c, $00, $80, $92
	.db $9c
	.db $02, $b0, $04, $00, $2a, $80, $13
	.db $02, $b0, $04, $00, $29, $80, $13
	.db $03, $40, $05, $29, $07, $90, $13
	.db $02, $80, $05, $00, $28, $80, $13
	.db $02, $80, $05, $00, $27, $80, $93
	.db $a1
	.db $03, $60, $03, $0e, $01, $28, $94
	.db $a2
	.db $03, $d0, $03, $0e, $01, $48, $94
	.db $a4
	.db $02, $80, $03, $00, $2e, $80, $14
	.db $02, $80, $03, $00, $2d, $80, $14
	.db $03, $30, $04, $29, $88, $80, $14
	.db $02, $40, $04, $00, $2c, $80, $14
	.db $02, $40, $04, $00, $2b, $80, $94
	.db $a6
	.db $03, $00, $04, $0e, $00, $d8, $94
	.db $a7
	.db $03, $50, $03, $0c, $00, $e0, $94
	.db $a8
	.db $02, $80, $03, $04, $1d, $00, $95
	.db $ab
	.db $02, $a0, $01, $00, $32, $60, $15
	.db $02, $a0, $01, $00, $31, $60, $95
	.db $ac
	.db $01, $80, $02, $33, $63, $80, $15
	.db $03, $90, $02, $0c, $00, $80, $15
	.db $03, $40, $03, $29, $09, $80, $15
	.db $02, $80, $03, $00, $30, $80, $15
	.db $02, $80, $03, $00, $2f, $80, $95
	.db $af
	.db $00, $a7, $01, $07, $0f, $f8, $95
	.db $b0
	.db $00, $a8, $01, $0a, $01, $18, $96
	.db $b4
	.db $01, $80, $01, $33, $63, $80, $16
	.db $02, $80, $01, $17, $14, $80, $16
	.db $02, $80, $01, $0b, $02, $80, $16
	.db $01, $80, $01, $33, $3e, $80, $96
	.db $b6
	.db $02, $a0, $01, $15, $ab, $d0, $96
	.db $b7
	.db $00, $a7, $01, $07, $8f, $f8, $16
	.db $00, $a8, $01, $0a, $00, $e0, $96
	.db $b9
	.db $03, $80, $01, $55, $00, $20, $97
	.db $b9


EntityLocations8_NeonTiger:
	.db $0c
	.db $01, $80, $03, $33, $56, $80, $81
	.db $14
	.db $03, $50, $03, $1f, $00, $80, $82
	.db $1b
	.db $03, $30, $03, $1f, $00, $70, $83
	.db $24
	.db $03, $48, $03, $1f, $00, $80, $04
	.db $01, $80, $03, $33, $3a, $80, $84
	.db $2c
	.db $02, $80, $01, $15, $01, $90, $05
	.db $01, $80, $01, $33, $3b, $80, $05
	.db $02, $a0, $01, $00, $05, $80, $05
	.db $02, $a0, $01, $00, $04, $80, $05
	.db $02, $20, $02, $00, $03, $80, $05
	.db $02, $20, $02, $00, $02, $80, $05
	.db $00, $d8, $02, $02, $80, $90, $05
	.db $02, $80, $03, $00, $01, $80, $05
	.db $02, $80, $03, $00, $00, $80, $85
	.db $2e
	.db $03, $58, $02, $1f, $00, $c8, $85
	.db $30
	.db $03, $80, $02, $2d, $00, $18, $86
	.db $32
	.db $03, $20, $03, $1f, $00, $40, $86
	.db $35
	.db $03, $80, $01, $0b, $80, $a0, $86
	.db $36
	.db $03, $40, $03, $1f, $00, $d0, $86
	.db $38
	.db $03, $a0, $02, $2d, $00, $10, $87
	.db $39
	.db $03, $a0, $03, $1d, $01, $30, $87
	.db $3a
	.db $03, $a0, $01, $2b, $00, $48, $87
	.db $3d
	.db $03, $90, $02, $1f, $00, $a0, $87
	.db $3f
	.db $03, $a0, $01, $2b, $00, $f8, $87
	.db $40
	.db $03, $a0, $03, $1d, $01, $00, $88
	.db $42
	.db $03, $d0, $02, $2d, $00, $40, $88
	.db $44
	.db $03, $90, $02, $1f, $00, $80, $08
	.db $03, $80, $03, $1d, $01, $90, $88
	.db $45
	.db $03, $a0, $01, $2b, $00, $a8, $88
	.db $46
	.db $00, $46, $02, $05, $80, $d0, $08
	.db $00, $68, $03, $02, $80, $d0, $88
	.db $47
	.db $03, $38, $01, $0b, $80, $f0, $88
	.db $49
	.db $03, $40, $02, $0b, $80, $20, $09
	.db $00, $b4, $02, $02, $80, $20, $89
	.db $4a
	.db $03, $b0, $02, $08, $00, $48, $89
	.db $4b
	.db $03, $a0, $01, $08, $00, $70, $89
	.db $4c
	.db $02, $80, $01, $0c, $04, $80, $09
	.db $02, $00, $03, $1a, $01, $80, $09
	.db $01, $80, $03, $33, $3d, $80, $89
	.db $4e
	.db $02, $b0, $01, $00, $06, $c0, $09
	.db $02, $b0, $01, $00, $07, $c0, $09
	.db $02, $b0, $01, $00, $08, $c0, $09
	.db $03, $40, $02, $08, $00, $d0, $89
	.db $4f
	.db $00, $a7, $03, $11, $0c, $f8, $09
	.db $00, $a8, $03, $0a, $00, $e0, $89
	.db $51
	.db $02, $b0, $01, $00, $0a, $20, $0a
	.db $02, $b0, $01, $00, $09, $20, $8a
	.db $54
	.db $02, $80, $03, $00, $0b, $80, $8a
	.db $56
	.db $02, $e0, $01, $15, $12, $c0, $0a
	.db $03, $70, $03, $27, $00, $d0, $8a
	.db $57
	.db $00, $a7, $03, $11, $0c, $f8, $8a
	.db $58
	.db $00, $a8, $03, $0a, $01, $18, $8b
	.db $59
	.db $02, $a0, $03, $15, $44, $28, $8b
	.db $5c
	.db $01, $80, $03, $33, $3a, $80, $0b
	.db $01, $80, $03, $33, $3b, $80, $0b
	.db $01, $80, $03, $33, $56, $80, $0b
	.db $02, $80, $03, $0b, $01, $80, $0b
	.db $02, $80, $03, $00, $0c, $80, $8b
	.db $5e
	.db $03, $c0, $01, $4d, $20, $c0, $8b
	.db $60
	.db $02, $80, $03, $04, $17, $00, $0c
	.db $02, $80, $03, $17, $12, $00, $8c
	.db $61
	.db $03, $70, $02, $2f, $0c, $30, $8c
	.db $64
	.db $02, $b0, $02, $00, $0e, $80, $0c
	.db $02, $b0, $02, $00, $0d, $80, $8c
	.db $6b
	.db $02, $90, $02, $15, $45, $70, $8d
	.db $74
	.db $03, $a0, $02, $2d, $00, $90, $8e
	.db $78
	.db $03, $70, $02, $16, $00, $10, $8f
	.db $7f
	.db $03, $4e, $02, $16, $01, $e0, $8f
	.db $82
	.db $03, $a0, $02, $2d, $00, $50, $90
	.db $86
	.db $03, $a0, $02, $16, $00, $c0, $90
	.db $8e
	.db $03, $80, $02, $2d, $00, $c0, $91
	.db $95
	.db $03, $a0, $02, $2d, $00, $a0, $92
	.db $9b
	.db $03, $90, $02, $16, $00, $70, $93
	.db $9c
	.db $01, $80, $02, $33, $3c, $80, $93
	.db $a7
	.db $00, $a7, $02, $11, $0b, $f8, $14
	.db $00, $a8, $02, $0a, $00, $e0, $94
	.db $ad
	.db $03, $a0, $02, $47, $00, $a0, $15
	.db $03, $a0, $02, $46, $00, $a0, $95
	.db $af
	.db $00, $a7, $02, $11, $0b, $f8, $95
	.db $b0
	.db $00, $90, $02, $0a, $01, $18, $96
	.db $b1
	.db $02, $a0, $02, $15, $77, $28, $96
	.db $b2
	.db $03, $3e, $03, $16, $01, $40, $96
	.db $b3
	.db $02, $80, $04, $00, $12, $60, $16
	.db $02, $80, $04, $00, $11, $60, $96
	.db $b4
	.db $02, $80, $02, $00, $0f, $80, $16
	.db $02, $b0, $02, $00, $10, $80, $16
	.db $02, $80, $03, $04, $18, $80, $96
	.db $b8
	.db $03, $a0, $04, $22, $00, $10, $97
	.db $b9
	.db $03, $2e, $04, $16, $01, $20, $97
	.db $be
	.db $03, $a0, $04, $22, $00, $d0, $97
	.db $c1
	.db $03, $b0, $04, $22, $00, $30, $98
	.db $c8
	.db $03, $80, $04, $22, $00, $10, $99
	.db $c9
	.db $02, $80, $04, $00, $14, $20, $19
	.db $02, $80, $04, $00, $13, $20, $99
	.db $cd
	.db $02, $70, $04, $15, $78, $a0, $19
	.db $03, $b0, $04, $22, $00, $b0, $99
	.db $d3
	.db $03, $b0, $04, $1f, $00, $70, $9a
	.db $df
	.db $00, $74, $04, $0b, $80, $e0, $1b
	.db $00, $a7, $05, $07, $0c, $f8, $9b
	.db $e0
	.db $00, $a8, $05, $0a, $01, $18, $9c
	.db $e4
	.db $01, $80, $05, $33, $3a, $80, $1c
	.db $01, $80, $05, $33, $3c, $80, $1c
	.db $02, $80, $05, $0b, $02, $80, $1c
	.db $02, $80, $05, $00, $15, $80, $9c
	.db $e6
	.db $02, $a0, $05, $15, $89, $d0, $9c
	.db $e7
	.db $00, $a7, $05, $07, $8c, $f8, $1c
	.db $00, $a8, $05, $0a, $00, $e0, $9c
	.db $ee
	.db $03, $80, $05, $56, $00, $d0, $9d
	.db $ee


EntityLocations9_Vile:
	.db $0c
	.db $01, $80, $05, $33, $45, $80, $81
	.db $13
	.db $03, $90, $05, $08, $00, $70, $82
	.db $19
	.db $03, $70, $05, $08, $00, $20, $03
	.db $03, $40, $06, $0e, $01, $26, $83
	.db $1b
	.db $02, $80, $06, $00, $03, $60, $03
	.db $02, $80, $06, $00, $02, $60, $83
	.db $1c
	.db $02, $80, $05, $00, $00, $80, $03
	.db $02, $80, $05, $00, $01, $80, $03
	.db $03, $c0, $05, $0e, $01, $96, $03
	.db $02, $00, $06, $04, $1f, $80, $83
	.db $1e
	.db $03, $70, $05, $0e, $00, $da, $83
	.db $22
	.db $00, $e4, $03, $02, $80, $50, $04
	.db $00, $24, $05, $02, $80, $50, $04
	.db $02, $80, $06, $00, $04, $40, $04
	.db $02, $80, $06, $00, $05, $40, $04
	.db $03, $a0, $06, $31, $00, $50, $84
	.db $24
	.db $02, $80, $03, $00, $06, $80, $04
	.db $02, $80, $03, $00, $07, $80, $04
	.db $02, $00, $05, $18, $10, $80, $84
	.db $25
	.db $00, $88, $04, $02, $80, $b0, $04
	.db $00, $c4, $05, $02, $80, $b0, $84
	.db $2b
	.db $02, $80, $03, $04, $20, $60, $85
	.db $30
	.db $03, $90, $03, $2d, $00, $00, $86
	.db $32
	.db $02, $80, $03, $00, $09, $40, $06
	.db $02, $80, $03, $00, $08, $40, $86
	.db $34
	.db $02, $a0, $02, $00, $0b, $80, $06
	.db $02, $a0, $02, $00, $0a, $80, $86
	.db $36
	.db $00, $34, $03, $01, $80, $d0, $86
	.db $37
	.db $00, $87, $02, $07, $10, $f8, $86
	.db $39
	.db $02, $88, $02, $15, $12, $30, $87
	.db $3f
	.db $00, $87, $02, $07, $89, $f8, $87
	.db $45
	.db $03, $80, $02, $49, $00, $a0, $88
	.db $47
	.db $00, $37, $02, $07, $11, $f8, $88
	.db $49
	.db $02, $38, $02, $15, $33, $30, $89
	.db $4a
	.db $02, $80, $02, $04, $21, $40, $89
	.db $4c
	.db $01, $80, $02, $33, $45, $80, $09
	.db $02, $80, $02, $0b, $01, $80, $09
	.db $02, $80, $02, $00, $0c, $80, $89
	.db $51
	.db $03, $20, $02, $40, $00, $20, $0a
	.db $00, $46, $03, $02, $80, $30, $0a
	.db $00, $e6, $03, $02, $80, $30, $8a
	.db $53
	.db $03, $70, $02, $2d, $00, $68, $0a
	.db $03, $90, $03, $0e, $00, $7a, $8a
	.db $54
	.db $02, $80, $02, $00, $0d, $80, $0a
	.db $02, $80, $02, $00, $0e, $80, $0a
	.db $03, $a0, $02, $0e, $01, $86, $0a
	.db $02, $80, $04, $00, $10, $80, $0a
	.db $02, $80, $04, $00, $0f, $80, $8a
	.db $55
	.db $00, $04, $04, $04, $80, $b0, $8a
	.db $56
	.db $00, $68, $02, $02, $80, $d0, $8a
	.db $5b
	.db $03, $a0, $04, $2b, $00, $70, $8b
	.db $63
	.db $03, $a0, $04, $2b, $00, $70, $8c
	.db $64
	.db $02, $a0, $04, $15, $34, $80, $8c
	.db $6b
	.db $03, $a0, $04, $2b, $00, $70, $8d
	.db $6d
	.db $02, $80, $04, $04, $22, $a0, $8d
	.db $6f
	.db $02, $80, $04, $00, $12, $e0, $0d
	.db $02, $80, $04, $00, $11, $e0, $8d
	.db $71
	.db $00, $b8, $04, $02, $80, $30, $8e
	.db $72
	.db $02, $80, $04, $00, $13, $40, $0e
	.db $02, $80, $04, $00, $14, $40, $0e
	.db $03, $a0, $04, $31, $01, $50, $8e
	.db $74
	.db $02, $00, $03, $18, $54, $80, $8e
	.db $76
	.db $00, $78, $01, $02, $80, $d0, $0e
	.db $02, $80, $01, $00, $16, $c0, $0e
	.db $02, $80, $01, $00, $15, $c0, $8e
	.db $7c
	.db $02, $80, $01, $04, $28, $80, $0f
	.db $03, $a8, $01, $39, $00, $88, $8f
	.db $83
	.db $03, $a8, $01, $39, $01, $68, $90
	.db $88
	.db $02, $60, $01, $15, $56, $00, $91
	.db $8c
	.db $03, $a8, $01, $39, $02, $98, $91
	.db $94
	.db $02, $80, $01, $00, $18, $90, $12
	.db $02, $80, $01, $00, $17, $90, $92
	.db $9e
	.db $00, $7a, $01, $1a, $01, $c8, $93
	.db $9e


EntityLocationsA_Doppler1:
	.db $0c
	.db $01, $80, $08, $33, $49, $80, $01
	.db $01, $80, $08, $33, $4a, $80, $01
	.db $01, $80, $08, $33, $48, $80, $81
	.db $16
	.db $03, $2e, $08, $16, $01, $c0, $82
	.db $17
	.db $03, $b0, $08, $18, $80, $e8, $82
	.db $19
	.db $03, $60, $07, $0b, $80, $30, $83
	.db $1c
	.db $02, $a0, $07, $00, $03, $80, $03
	.db $02, $a0, $07, $00, $02, $80, $83
	.db $1d
	.db $03, $0e, $08, $16, $01, $b0, $03
	.db $02, $80, $08, $00, $01, $a0, $03
	.db $02, $80, $08, $00, $00, $a0, $83
	.db $1e
	.db $03, $90, $07, $18, $80, $c0, $03
	.db $03, $b0, $08, $18, $80, $c8, $83
	.db $23
	.db $03, $90, $07, $18, $80, $68, $84
	.db $25
	.db $03, $10, $07, $36, $00, $a0, $84
	.db $29
	.db $03, $10, $07, $36, $01, $20, $05
	.db $03, $90, $07, $18, $80, $28, $85
	.db $2b
	.db $03, $10, $07, $36, $02, $60, $85
	.db $2f
	.db $03, $10, $07, $36, $03, $e0, $05
	.db $03, $90, $07, $18, $80, $e8, $85
	.db $30
	.db $03, $10, $07, $36, $04, $18, $86
	.db $32
	.db $03, $10, $07, $36, $05, $48, $86
	.db $35
	.db $03, $90, $07, $18, $80, $a8, $86
	.db $36
	.db $03, $10, $07, $36, $06, $d8, $86
	.db $38
	.db $03, $10, $07, $36, $07, $08, $87
	.db $3c
	.db $03, $70, $07, $18, $80, $88, $87
	.db $40
	.db $02, $60, $07, $15, $01, $00, $88
	.db $41
	.db $03, $00, $03, $0b, $80, $30, $08
	.db $03, $b0, $03, $2d, $00, $38, $88
	.db $44
	.db $00, $1c, $03, $02, $80, $98, $88
	.db $45
	.db $00, $1c, $03, $01, $80, $b0, $88
	.db $47
	.db $03, $b0, $07, $18, $80, $e0, $88
	.db $49
	.db $03, $bf, $06, $38, $00, $38, $09
	.db $03, $90, $07, $41, $00, $30, $89
	.db $4c
	.db $02, $48, $02, $15, $23, $80, $09
	.db $02, $80, $02, $00, $09, $80, $09
	.db $02, $80, $02, $00, $08, $80, $09
	.db $02, $80, $03, $00, $06, $80, $09
	.db $02, $80, $03, $00, $07, $80, $09
	.db $02, $f0, $03, $18, $21, $88, $09
	.db $02, $80, $07, $00, $05, $80, $09
	.db $02, $80, $07, $00, $04, $80, $89
	.db $4e
	.db $02, $40, $02, $04, $23, $c0, $89
	.db $4f
	.db $00, $37, $02, $07, $43, $f8, $09
	.db $00, $48, $02, $0a, $00, $e8, $89
	.db $54
	.db $03, $a0, $02, $51, $00, $80, $8a
	.db $5f
	.db $00, $a7, $02, $07, $03, $f8, $8b
	.db $60
	.db $00, $90, $02, $0a, $01, $18, $8c
	.db $64
	.db $02, $80, $02, $00, $0b, $80, $0c
	.db $01, $80, $02, $33, $48, $80, $0c
	.db $01, $80, $02, $33, $49, $80, $0c
	.db $01, $80, $02, $33, $4a, $80, $0c
	.db $02, $80, $02, $0b, $01, $80, $0c
	.db $02, $a8, $02, $15, $44, $88, $8c
	.db $65
	.db $02, $80, $02, $17, $01, $a0, $8c
	.db $67
	.db $02, $80, $02, $04, $24, $e0, $8c
	.db $69
	.db $03, $70, $01, $0b, $80, $30, $8d
	.db $6b
	.db $03, $c8, $01, $0b, $00, $70, $8d
	.db $6c
	.db $02, $80, $01, $00, $0e, $80, $0d
	.db $02, $80, $01, $00, $0f, $80, $0d
	.db $02, $60, $02, $00, $0d, $80, $0d
	.db $02, $60, $02, $00, $0c, $80, $8d
	.db $6d
	.db $03, $b0, $02, $2d, $00, $a0, $8d
	.db $70
	.db $02, $50, $01, $15, $45, $00, $8e
	.db $71
	.db $03, $00, $02, $0b, $80, $30, $0e
	.db $03, $40, $04, $0b, $80, $30, $8e
	.db $72
	.db $02, $80, $01, $00, $10, $40, $0e
	.db $03, $80, $06, $4d, $10, $50, $8e
	.db $73
	.db $03, $88, $02, $0b, $80, $70, $8e
	.db $75
	.db $03, $08, $03, $0b, $80, $b0, $0e
	.db $03, $70, $04, $28, $00, $b0, $0e
	.db $02, $48, $05, $15, $67, $a0, $0e
	.db $02, $80, $05, $00, $13, $a0, $0e
	.db $02, $80, $05, $00, $12, $a0, $0e
	.db $02, $80, $06, $00, $15, $a0, $0e
	.db $02, $80, $06, $00, $14, $a0, $8e
	.db $79
	.db $03, $70, $04, $28, $00, $30, $8f
	.db $7a
	.db $03, $18, $02, $0b, $00, $50, $0f
	.db $03, $b0, $03, $0b, $80, $50, $0f
	.db $02, $80, $06, $15, $87, $40, $8f
	.db $7b
	.db $00, $f4, $01, $02, $80, $70, $8f
	.db $7c
	.db $02, $80, $05, $00, $17, $80, $0f
	.db $02, $80, $05, $00, $16, $80, $8f
	.db $7d
	.db $03, $90, $01, $2f, $0b, $b8, $0f
	.db $02, $40, $03, $18, $56, $b8, $8f
	.db $7e
	.db $03, $00, $03, $0b, $00, $d0, $0f
	.db $03, $e0, $03, $0b, $00, $d0, $8f
	.db $80
	.db $03, $10, $05, $1b, $02, $00, $90
	.db $83
	.db $03, $60, $05, $2b, $00, $60, $90
	.db $8a
	.db $03, $10, $05, $1b, $02, $50, $91
	.db $95
	.db $03, $10, $05, $1b, $02, $a0, $92
	.db $96
	.db $03, $70, $05, $2b, $00, $d0, $92
	.db $99
	.db $03, $70, $07, $0b, $80, $30, $93
	.db $9c
	.db $02, $80, $05, $00, $19, $80, $13
	.db $02, $80, $05, $00, $18, $80, $13
	.db $02, $80, $06, $21, $00, $80, $13
	.db $02, $80, $07, $00, $1b, $80, $13
	.db $02, $80, $07, $00, $1a, $80, $93
	.db $9d
	.db $02, $90, $05, $18, $79, $b0, $93
	.db $9f
	.db $03, $90, $07, $2d, $00, $e8, $93
	.db $a4
	.db $02, $c0, $06, $00, $1d, $80, $14
	.db $02, $c0, $06, $00, $1f, $80, $14
	.db $02, $80, $07, $00, $1e, $80, $14
	.db $02, $80, $07, $00, $1c, $80, $94
	.db $a7
	.db $02, $80, $06, $17, $13, $e0, $14
	.db $00, $a7, $06, $07, $03, $f8, $14
	.db $02, $80, $07, $17, $12, $e0, $14
	.db $00, $a7, $07, $07, $03, $f8, $94
	.db $a8
	.db $00, $a8, $06, $0a, $01, $18, $15
	.db $00, $a8, $07, $0a, $01, $18, $95
	.db $ac
	.db $01, $80, $06, $33, $4a, $80, $15
	.db $01, $80, $06, $33, $49, $80, $15
	.db $01, $80, $06, $33, $48, $80, $15
	.db $02, $80, $06, $0b, $03, $80, $15
	.db $01, $80, $07, $33, $4a, $80, $15
	.db $01, $80, $07, $33, $49, $80, $15
	.db $02, $80, $07, $0b, $02, $80, $15
	.db $01, $80, $07, $33, $48, $80, $15
	.db $02, $a8, $07, $15, $9b, $90, $95
	.db $ad
	.db $02, $80, $06, $04, $26, $a0, $15
	.db $02, $80, $07, $04, $25, $a0, $95
	.db $ae
	.db $02, $a8, $06, $15, $9a, $d0, $95
	.db $af
	.db $00, $a7, $06, $07, $83, $f8, $15
	.db $00, $a8, $06, $0a, $00, $e0, $15
	.db $00, $a7, $07, $07, $83, $f8, $15
	.db $00, $a8, $07, $0a, $00, $e0, $95
	.db $b1
	.db $02, $a0, $06, $08, $03, $20, $96
	.db $b5
	.db $03, $80, $07, $45, $00, $b0, $96
	.db $b7
	.db $03, $40, $06, $5a, $00, $e0, $96
	.db $b7


EntityLocationsB_Doppler2:
	.db $0c
	.db $01, $80, $06, $33, $43, $80, $01
	.db $01, $80, $06, $33, $64, $80, $01
	.db $01, $80, $06, $33, $65, $80, $01
	.db $01, $80, $06, $33, $42, $80, $81
	.db $17
	.db $03, $90, $06, $1e, $01, $e0, $82
	.db $19
	.db $03, $90, $04, $0b, $80, $30, $83
	.db $1a
	.db $03, $b0, $05, $1e, $01, $40, $03
	.db $03, $2e, $06, $16, $01, $50, $83
	.db $1b
	.db $03, $d0, $04, $0b, $00, $70, $83
	.db $1c
	.db $02, $80, $04, $00, $02, $80, $03
	.db $02, $80, $04, $00, $03, $80, $03
	.db $02, $80, $06, $00, $01, $80, $03
	.db $02, $80, $06, $00, $00, $80, $83
	.db $1d
	.db $03, $4e, $05, $16, $01, $b0, $83
	.db $1f
	.db $03, $70, $04, $1e, $01, $f0, $83
	.db $24
	.db $03, $a0, $04, $1e, $01, $80, $84
	.db $30
	.db $02, $60, $04, $15, $01, $00, $86
	.db $34
	.db $02, $80, $04, $00, $05, $80, $06
	.db $02, $80, $04, $00, $04, $80, $06
	.db $03, $70, $05, $2f, $0b, $90, $06
	.db $02, $80, $06, $18, $12, $80, $06
	.db $02, $80, $07, $04, $2b, $80, $06
	.db $02, $80, $07, $08, $01, $80, $06
	.db $02, $40, $08, $00, $07, $80, $06
	.db $02, $40, $08, $00, $06, $80, $86
	.db $3a
	.db $03, $40, $09, $1c, $00, $50, $87
	.db $3b
	.db $03, $b0, $09, $1c, $00, $70, $87
	.db $3f
	.db $03, $90, $09, $1c, $00, $e0, $87
	.db $42
	.db $03, $30, $09, $1c, $00, $40, $88
	.db $44
	.db $03, $80, $09, $1c, $00, $90, $88
	.db $47
	.db $03, $80, $09, $1c, $00, $f0, $88
	.db $4b
	.db $03, $40, $09, $1c, $00, $60, $89
	.db $4c
	.db $02, $c0, $07, $00, $0a, $80, $09
	.db $02, $c0, $07, $00, $0b, $80, $09
	.db $02, $80, $08, $00, $09, $80, $09
	.db $02, $80, $08, $00, $08, $80, $89
	.db $4d
	.db $03, $20, $09, $1c, $00, $a0, $89
	.db $4f
	.db $00, $97, $07, $07, $04, $f8, $89
	.db $50
	.db $02, $98, $07, $15, $23, $00, $8a
	.db $54
	.db $02, $80, $07, $00, $0c, $80, $8a
	.db $56
	.db $03, $80, $07, $5b, $00, $c0, $8a
	.db $5f
	.db $00, $97, $07, $07, $04, $f8, $8b
	.db $61
	.db $02, $98, $07, $15, $44, $28, $8c
	.db $64
	.db $01, $80, $07, $33, $42, $80, $0c
	.db $01, $80, $07, $33, $43, $80, $0c
	.db $01, $80, $07, $33, $64, $80, $0c
	.db $01, $80, $07, $33, $65, $80, $0c
	.db $02, $80, $07, $0b, $01, $80, $0c
	.db $02, $80, $07, $00, $0d, $80, $8c
	.db $6a
	.db $03, $70, $06, $1e, $01, $40, $8d
	.db $6b
	.db $03, $50, $05, $0d, $00, $68, $8d
	.db $6c
	.db $02, $80, $05, $00, $11, $80, $0d
	.db $02, $80, $05, $00, $10, $80, $8d
	.db $6e
	.db $03, $b0, $06, $28, $00, $c0, $8d
	.db $6f
	.db $03, $b0, $07, $1e, $01, $e0, $8d
	.db $72
	.db $03, $b0, $07, $28, $00, $50, $8e
	.db $73
	.db $03, $40, $05, $0d, $00, $70, $8e
	.db $74
	.db $02, $80, $05, $15, $45, $80, $0e
	.db $02, $40, $07, $00, $0f, $80, $0e
	.db $02, $40, $07, $00, $0e, $80, $8e
	.db $76
	.db $03, $78, $06, $0d, $00, $c0, $8e
	.db $79
	.db $03, $20, $02, $09, $40, $30, $0f
	.db $03, $e0, $02, $09, $40, $30, $0f
	.db $03, $20, $04, $09, $40, $30, $8f
	.db $7a
	.db $03, $20, $03, $0d, $00, $58, $0f
	.db $03, $a0, $04, $0d, $00, $58, $8f
	.db $7b
	.db $03, $e0, $02, $0d, $00, $68, $0f
	.db $03, $50, $04, $0d, $00, $68, $8f
	.db $7c
	.db $02, $80, $01, $00, $14, $80, $0f
	.db $02, $80, $01, $00, $15, $80, $0f
	.db $02, $40, $05, $00, $13, $80, $0f
	.db $02, $40, $05, $00, $12, $80, $8f
	.db $7d
	.db $03, $80, $02, $0d, $00, $a8, $0f
	.db $03, $b0, $03, $0d, $00, $b0, $0f
	.db $03, $b0, $05, $28, $00, $b0, $8f
	.db $7e
	.db $03, $60, $03, $09, $00, $d0, $0f
	.db $03, $30, $05, $09, $00, $d0, $8f
	.db $7f
	.db $00, $67, $01, $07, $04, $f8, $8f
	.db $80
	.db $00, $68, $01, $0a, $01, $18, $90
	.db $82
	.db $02, $80, $01, $17, $01, $40, $90
	.db $84
	.db $01, $80, $01, $33, $43, $80, $10
	.db $02, $80, $01, $0b, $02, $80, $10
	.db $01, $80, $01, $33, $42, $80, $90
	.db $85
	.db $02, $80, $01, $08, $02, $a0, $90
	.db $86
	.db $02, $68, $01, $15, $56, $d0, $90
	.db $87
	.db $00, $67, $01, $07, $84, $f8, $10
	.db $00, $68, $01, $0a, $00, $e0, $90
	.db $89
	.db $03, $80, $01, $4a, $00, $20, $91
	.db $8c
	.db $02, $80, $01, $00, $16, $80, $11
	.db $02, $80, $02, $00, $16, $80, $91
	.db $96
	.db $02, $a8, $02, $15, $67, $d0, $92
	.db $9c
	.db $02, $80, $02, $00, $17, $80, $93
	.db $9c


EntityLocationsC_Doppler3:
	.db $09
	.db $03, $60, $02, $0e, $01, $28, $01
	.db $03, $70, $03, $0e, $01, $28, $81
	.db $0b
	.db $03, $f0, $02, $0b, $00, $70, $81
	.db $0c
	.db $01, $80, $01, $33, $50, $80, $01
	.db $01, $80, $01, $33, $4f, $80, $01
	.db $01, $80, $01, $33, $5f, $80, $01
	.db $02, $a0, $01, $00, $01, $80, $01
	.db $02, $a0, $01, $00, $00, $80, $81
	.db $0d
	.db $03, $90, $03, $0e, $00, $b8, $81
	.db $0e
	.db $03, $40, $02, $0e, $00, $d8, $01
	.db $02, $80, $04, $00, $03, $c0, $01
	.db $02, $80, $04, $00, $02, $c0, $81
	.db $0f
	.db $00, $57, $04, $07, $07, $f8, $81
	.db $10
	.db $02, $00, $04, $0b, $01, $00, $02
	.db $02, $78, $04, $15, $01, $00, $82
	.db $12
	.db $00, $a2, $04, $0d, $01, $48, $82
	.db $14
	.db $02, $80, $04, $00, $04, $80, $02
	.db $00, $12, $05, $0d, $05, $98, $82
	.db $17
	.db $00, $72, $04, $0d, $02, $e8, $82
	.db $19
	.db $03, $d8, $04, $65, $00, $20, $03
	.db $00, $32, $05, $0d, $06, $28, $83
	.db $1c
	.db $01, $40, $04, $40, $00, $80, $03
	.db $01, $80, $04, $33, $5f, $80, $03
	.db $01, $80, $04, $33, $50, $80, $03
	.db $01, $80, $04, $33, $4f, $80, $83
	.db $1e
	.db $00, $32, $05, $0d, $07, $c8, $83
	.db $20
	.db $00, $72, $04, $0d, $03, $08, $84
	.db $22
	.db $00, $12, $05, $0d, $08, $58, $84
	.db $25
	.db $00, $a2, $04, $0d, $04, $a8, $84
	.db $27
	.db $00, $57, $04, $07, $07, $f8, $84
	.db $29
	.db $02, $78, $04, $15, $22, $28, $85
	.db $2c
	.db $02, $80, $04, $00, $06, $80, $05
	.db $01, $80, $04, $33, $4f, $80, $05
	.db $01, $80, $04, $33, $50, $80, $05
	.db $01, $80, $04, $33, $5f, $80, $05
	.db $02, $80, $04, $0b, $02, $80, $05
	.db $02, $80, $04, $00, $05, $80, $05
	.db $02, $00, $05, $04, $27, $80, $85
	.db $2e
	.db $02, $80, $05, $00, $08, $c0, $05
	.db $02, $80, $05, $00, $07, $c0, $85
	.db $30
	.db $03, $48, $05, $3d, $00, $00, $86
	.db $34
	.db $03, $48, $05, $3d, $00, $80, $86
	.db $38
	.db $03, $48, $05, $3d, $00, $00, $87
	.db $3c
	.db $03, $48, $05, $3d, $00, $80, $87
	.db $40
	.db $03, $48, $05, $3d, $00, $00, $88
	.db $41
	.db $00, $bc, $04, $02, $80, $30, $88
	.db $42
	.db $02, $80, $05, $00, $0a, $40, $08
	.db $02, $80, $05, $00, $09, $40, $88
	.db $44
	.db $02, $c0, $04, $00, $0c, $80, $08
	.db $02, $c0, $04, $00, $0b, $80, $88
	.db $48
	.db $02, $80, $04, $17, $02, $00, $89
	.db $4a
	.db $03, $b0, $04, $28, $00, $50, $89
	.db $4c
	.db $01, $80, $04, $33, $61, $80, $89
	.db $4e
	.db $03, $40, $04, $48, $01, $d0, $89
	.db $4f
	.db $00, $37, $04, $07, $87, $f8, $89
	.db $50
	.db $02, $38, $04, $15, $23, $00, $8a
	.db $54
	.db $03, $80, $04, $48, $00, $80, $0a
	.db $00, $70, $05, $12, $00, $80, $0a
	.db $01, $80, $05, $33, $50, $80, $0a
	.db $01, $80, $05, $33, $61, $80, $0a
	.db $01, $80, $05, $33, $4f, $80, $8a
	.db $5c
	.db $03, $80, $04, $56, $00, $80, $0b
	.db $03, $80, $04, $59, $00, $80, $0b
	.db $03, $80, $04, $54, $00, $80, $0b
	.db $01, $80, $04, $33, $4f, $80, $0b
	.db $01, $80, $04, $33, $50, $80, $0b
	.db $01, $80, $04, $33, $60, $80, $0b
	.db $03, $80, $04, $57, $00, $80, $8b
	.db $64
	.db $01, $80, $04, $33, $4f, $80, $0c
	.db $01, $80, $04, $33, $50, $80, $0c
	.db $01, $80, $04, $33, $60, $80, $0c
	.db $03, $80, $04, $58, $00, $80, $8c
	.db $6c
	.db $01, $80, $04, $33, $4f, $80, $0d
	.db $01, $80, $04, $33, $50, $80, $0d
	.db $01, $80, $04, $33, $60, $80, $0d
	.db $03, $80, $04, $52, $00, $80, $8d
	.db $7c
	.db $03, $80, $03, $55, $00, $80, $0f
	.db $01, $80, $03, $33, $50, $80, $0f
	.db $01, $80, $03, $33, $4f, $80, $0f
	.db $01, $80, $03, $33, $60, $80, $0f
	.db $01, $80, $04, $33, $60, $80, $0f
	.db $01, $80, $04, $33, $50, $80, $0f
	.db $01, $80, $04, $33, $4f, $80, $0f
	.db $03, $80, $04, $53, $00, $80, $8f
	.db $7c


EntityLocationsD_Doppler4:
	.db $0c
	.db $01, $80, $0e, $33, $4c, $80, $01
	.db $03, $80, $0e, $02, $06, $80, $01
	.db $01, $80, $0e, $33, $4b, $80, $81
	.db $15
	.db $03, $70, $0e, $35, $02, $a0, $82
	.db $18
	.db $03, $b0, $0e, $28, $00, $00, $83
	.db $1b
	.db $03, $70, $0e, $35, $02, $60, $83
	.db $21
	.db $03, $60, $0e, $28, $00, $30, $04
	.db $03, $b0, $0e, $35, $02, $20, $84
	.db $26
	.db $03, $70, $0e, $35, $02, $c0, $84
	.db $32
	.db $01, $70, $0e, $30, $02, $40, $86
	.db $34
	.db $02, $80, $0d, $00, $03, $80, $06
	.db $02, $80, $0d, $00, $02, $80, $06
	.db $01, $80, $0d, $33, $4e, $80, $06
	.db $02, $60, $0e, $00, $01, $80, $06
	.db $02, $60, $0e, $00, $00, $80, $86
	.db $3a
	.db $02, $80, $0d, $00, $05, $40, $07
	.db $02, $80, $0d, $00, $04, $40, $87
	.db $3b
	.db $00, $c8, $0a, $06, $82, $77, $07
	.db $02, $00, $0b, $18, $21, $78, $87
	.db $3c
	.db $01, $c0, $06, $30, $04, $80, $07
	.db $02, $a0, $07, $18, $42, $80, $07
	.db $03, $40, $0a, $02, $05, $80, $07
	.db $01, $80, $0a, $33, $4e, $80, $07
	.db $01, $80, $0a, $33, $4b, $80, $07
	.db $01, $80, $0a, $33, $4d, $80, $07
	.db $02, $80, $0a, $00, $06, $80, $07
	.db $02, $00, $0b, $1a, $10, $80, $07
	.db $01, $80, $0b, $33, $4d, $80, $07
	.db $02, $00, $0d, $18, $10, $80, $87
	.db $3e
	.db $02, $b0, $06, $00, $07, $c0, $07
	.db $03, $10, $0a, $5e, $00, $c0, $87
	.db $3e


EntityLocationsE:
	.db $0c
	.db $01, $80, $06, $33, $43, $80, $01
	.db $01, $80, $06, $33, $64, $80, $01
	.db $01, $80, $06, $33, $65, $80, $01
	.db $01, $80, $06, $33, $42, $80, $81
	.db $17
	.db $03, $90, $06, $2d, $00, $e0, $82
	.db $19
	.db $03, $40, $04, $0e, $01, $28, $03
	.db $03, $b0, $05, $2d, $00, $38, $83
	.db $1b
	.db $03, $d0, $04, $0e, $00, $78, $83
	.db $1c
	.db $02, $80, $04, $00, $02, $80, $03
	.db $02, $80, $04, $00, $03, $80, $03
	.db $02, $80, $06, $00, $01, $80, $03
	.db $02, $80, $06, $00, $00, $80, $83
	.db $1d
	.db $03, $90, $06, $08, $00, $b0, $83
	.db $1e
	.db $03, $70, $04, $2d, $00, $d0, $03
	.db $03, $90, $05, $0e, $00, $d8, $03
	.db $03, $10, $06, $0e, $00, $d8, $83
	.db $23
	.db $03, $a0, $04, $08, $00, $60, $84
	.db $25
	.db $03, $a0, $04, $2d, $00, $b0, $84
	.db $30
	.db $02, $60, $04, $15, $01, $00, $86
	.db $34
	.db $02, $80, $04, $00, $05, $80, $06
	.db $02, $80, $04, $00, $04, $80, $06
	.db $03, $70, $05, $2f, $0b, $90, $06
	.db $02, $80, $06, $18, $12, $80, $06
	.db $02, $80, $07, $04, $2b, $80, $06
	.db $02, $40, $08, $00, $07, $80, $06
	.db $02, $40, $08, $00, $06, $80, $06
	.db $03, $70, $09, $2d, $00, $88, $86
	.db $39
	.db $03, $70, $09, $2d, $00, $28, $87
	.db $42
	.db $03, $50, $09, $2d, $00, $48, $88
	.db $4c
	.db $02, $c0, $07, $00, $0a, $80, $09
	.db $02, $c0, $07, $00, $0b, $80, $09
	.db $02, $80, $08, $00, $09, $80, $09
	.db $02, $80, $08, $00, $08, $80, $89
	.db $4d
	.db $03, $70, $09, $2d, $00, $b0, $89
	.db $4f
	.db $00, $97, $07, $07, $04, $f8, $89
	.db $50
	.db $00, $98, $07, $0a, $01, $18, $8a
	.db $54
	.db $02, $80, $07, $00, $0c, $80, $8a
	.db $5f
	.db $00, $97, $07, $07, $04, $f8, $8b
	.db $60
	.db $00, $98, $07, $0a, $01, $18, $8c
	.db $61
	.db $02, $98, $07, $15, $44, $30, $8c
	.db $64
	.db $01, $80, $07, $33, $42, $80, $0c
	.db $01, $80, $07, $33, $43, $80, $0c
	.db $01, $80, $07, $33, $64, $80, $0c
	.db $01, $80, $07, $33, $65, $80, $0c
	.db $02, $80, $07, $0b, $01, $80, $0c
	.db $02, $80, $07, $00, $0d, $80, $8c
	.db $69
	.db $03, $50, $05, $0e, $01, $28, $0d
	.db $03, $70, $06, $2d, $00, $38, $8d
	.db $6b
	.db $03, $c8, $05, $0e, $00, $78, $8d
	.db $6c
	.db $02, $80, $05, $00, $11, $80, $0d
	.db $02, $80, $05, $00, $10, $80, $8d
	.db $6d
	.db $03, $b0, $06, $2d, $00, $b8, $8d
	.db $6e
	.db $03, $b0, $07, $2d, $00, $d0, $8d
	.db $71
	.db $03, $d0, $06, $2d, $00, $38, $8e
	.db $74
	.db $02, $70, $05, $15, $45, $80, $0e
	.db $02, $40, $07, $00, $0f, $80, $0e
	.db $02, $40, $07, $00, $0e, $80, $8e
	.db $76
	.db $03, $80, $06, $0e, $00, $d8, $0e
	.db $03, $b0, $07, $2d, $00, $c0, $8e
	.db $79
	.db $03, $20, $02, $09, $40, $30, $0f
	.db $03, $e0, $02, $09, $40, $30, $0f
	.db $03, $20, $04, $09, $40, $30, $8f
	.db $7a
	.db $03, $20, $03, $0d, $00, $58, $0f
	.db $03, $a0, $04, $0d, $00, $58, $8f
	.db $7b
	.db $03, $e0, $02, $0d, $00, $68, $0f
	.db $03, $50, $04, $0d, $00, $68, $8f
	.db $7c
	.db $02, $80, $01, $00, $14, $80, $0f
	.db $02, $80, $01, $00, $15, $80, $0f
	.db $02, $40, $05, $00, $13, $80, $0f
	.db $02, $40, $05, $00, $12, $80, $8f
	.db $7d
	.db $03, $80, $02, $0d, $00, $a8, $0f
	.db $03, $b0, $03, $0d, $00, $b0, $8f
	.db $7e
	.db $03, $60, $03, $09, $00, $d0, $0f
	.db $03, $30, $05, $09, $00, $d0, $8f
	.db $7f
	.db $00, $67, $01, $07, $04, $f8, $8f
	.db $80
	.db $00, $68, $01, $0a, $01, $18, $90
	.db $84
	.db $01, $80, $01, $33, $43, $80, $10
	.db $01, $80, $01, $33, $66, $80, $10
	.db $01, $80, $01, $33, $67, $80, $10
	.db $02, $80, $01, $0b, $02, $80, $10
	.db $01, $80, $01, $33, $42, $80, $90
	.db $86
	.db $02, $68, $01, $15, $56, $d0, $10
	.db $02, $80, $01, $04, $2c, $c0, $90
	.db $87
	.db $00, $67, $01, $07, $04, $f8, $10
	.db $00, $68, $01, $0a, $00, $e0, $90
	.db $8c
	.db $02, $80, $01, $00, $16, $80, $11
	.db $02, $80, $02, $00, $16, $80, $91
	.db $96
	.db $02, $a8, $01, $15, $67, $d0, $92
	.db $97
	.db $00, $a7, $02, $07, $84, $f8, $92
	.db $9c
	.db $02, $80, $02, $00, $17, $80, $93
	.db $9d
	.db $03, $80, $02, $63, $00, $a0, $93
	.db $9d


Data_3c_fe7e:
