.include "includes.s"
        
.bank $00c slot 3
.org $0

	cmp $1e23.w                                                  ; $8000 : $cd, $23, $1e
	.db $f0                                                  ; $8003 : $f0

	sbc ($2e), Y                                                  ; $8004 : $f1, $2e
	sbc ($1f)                                                  ; $8006 : $f2, $1f
	sta ($0e)                                                  ; $8008 : $92, $0e
	cmp ($20), Y                                                  ; $800a : $d1, $20
	cpx #$f430.w                                                  ; $800c : $e0, $30, $f4
	eor ($fd, X)                                                  ; $800f : $41, $fd
	stx $01, Y                                                  ; $8011 : $96, $01
	and ($cb)                                                  ; $8013 : $32, $cb
	rol $eb, X                                                  ; $8015 : $36, $eb
	tsb $2b                                                  ; $8017 : $04, $2b
	cpy $92                                                  ; $8019 : $c4, $92
	jsr $3fe1.w                                                  ; $801b : $20, $e1, $3f
	sbc $dc24ed.l                                                  ; $801e : $ef, $ed, $24, $dc
	ora ($9a)                                                  ; $8022 : $12, $9a
	ora $32f1f0.l                                                  ; $8024 : $0f, $f0, $f1, $32
	cmp $ff41fe.l, X                                                  ; $8028 : $df, $fe, $41, $ff
	sta ($df)                                                  ; $802c : $92, $df
	eor ($df, X)                                                  ; $802e : $41, $df
	.db $10, $01                                                  ; $8030 : $10, $01

	inc $ffee.w, X                                                  ; $8032 : $fe, $ee, $ff
	txs                                                  ; $8035 : $9a
	ora ($be), Y                                                  ; $8036 : $11, $be
	adc [$b9]                                                  ; $8038 : $67, $b9
	and ($d3), Y                                                  ; $803a : $31, $d3
	tsc                                                  ; $803c : $3b
	and $92, X                                                  ; $803d : $35, $92
	trb $0f12.w                                                  ; $803f : $1c, $12, $0f
	sbc ($ff), Y                                                  ; $8042 : $f1, $ff
	asl $41d2.w, X                                                  ; $8044 : $1e, $d2, $41
	stx $df, Y                                                  ; $8047 : $96, $df
	rti                                                  ; $8049 : $40


	ldx #$bc70.w                                                  ; $804a : $a2, $70, $bc
	ora $5f, X                                                  ; $804d : $15, $5f
	lda $d0a2.w                                                  ; $804f : $ad, $a2, $d0
	eor ($e0, X)                                                  ; $8052 : $41, $e0
	ora ($0f), Y                                                  ; $8054 : $11, $0f
	.db $00                                                  ; $8056 : $00
	ora ($ed), Y                                                  ; $8057 : $11, $ed
	sta ($24)                                                  ; $8059 : $92, $24
	beq br_0c_808e                                                  ; $805b : $f0, $31

	stp                                                  ; $805d : $db
	cpy #$dc43.w                                                  ; $805e : $c0, $43, $dc
	.db $00                                                  ; $8061 : $00
	stx $02, Y                                                  ; $8062 : $96, $02
	beq br_0c_80a4                                                  ; $8064 : $f0, $3e

	lda ($0f)                                                  ; $8066 : $b2, $0f
	adc $bc, S                                                  ; $8068 : $63, $bc
	cop $96.b                                                  ; $806a : $02, $96
	ora $22ca13.l, X                                                  ; $806c : $1f, $13, $ca, $22
	eor $cb                                                  ; $8070 : $45, $cb
	sbc ($4d), Y                                                  ; $8072 : $f1, $4d
	stx $d4, Y                                                  ; $8074 : $96, $d4
	rol $22ef.w                                                  ; $8076 : $2e, $ef, $22
	sbc ($1e), Y                                                  ; $8079 : $f1, $1e
	sbc $029a02.l, X                                                  ; $807b : $ff, $02, $9a, $02
	wai                                                  ; $807f : $cb
	bit $2c, X                                                  ; $8080 : $34, $2c
	sbc ($e3), Y                                                  ; $8082 : $f1, $e3
	rol                                                  ; $8084 : $2a
	mvn $0c, $96                                                  ; $8085 : $54, $96, $0c
	.db $b0, $42                                                  ; $8088 : $b0, $42

	ora $342dc1.l, X                                                  ; $808a : $1f, $c1, $2d, $34

br_0c_808e:
	.db $d0, $96                                                  ; $808e : $d0, $96

	nop                                                  ; $8090 : $ea
	eor ($e2, S), Y                                                  ; $8091 : $53, $e2
	jsr $cffe.w                                                  ; $8093 : $20, $fe, $cf
	eor ($0e, S), Y                                                  ; $8096 : $53, $0e
	sta ($ee)                                                  ; $8098 : $92, $ee
	sbc $6d17.w                                                  ; $809a : $ed, $17, $6d
	stz $e042.w, X                                                  ; $809d : $9e, $42, $e0
	ora ($a2)                                                  ; $80a0 : $12, $a2
	.db $30, $dd                                                  ; $80a2 : $30, $dd

br_0c_80a4:
	ora $0b, S                                                  ; $80a4 : $03, $0b
	cmp $1f0111.l                                                  ; $80a6 : $cf, $11, $01, $1f
	ldx #$de00.w                                                  ; $80aa : $a2, $00, $de
	jsr $0e12fe.l                                                  ; $80ad : $22, $fe, $12, $0e
	sep #$3e.b                                                  ; $80b1 : $e2, $3e
	sta ($9d)                                                  ; $80b3 : $92, $9d
	ora $20, S                                                  ; $80b5 : $03, $20
	.db $f0, $0f                                                  ; $80b7 : $f0, $0f

	bit $db, X                                                  ; $80b9 : $34, $db
	ora ($92), Y                                                  ; $80bb : $11, $92
	cpx $4d                                                  ; $80bd : $e4, $4d
	cpx #$00.b                                                  ; $80bf : $e0, $00
	jml [$2e05.w]                                                  ; $80c1 : $dc, $05, $2e


	and ($92, X)                                                  ; $80c4 : $21, $92
	pea $2e2f.w                                                  ; $80c6 : $f4, $2f, $2e
	lda ($65, X)                                                  ; $80c9 : $a1, $65
	eor ($fc, X)                                                  ; $80cb : $41, $fc
	inc $92                                                  ; $80cd : $e6, $92
	adc $d220ce.l                                                  ; $80cf : $6f, $ce, $20, $d2
	eor ($df), Y                                                  ; $80d3 : $51, $df
	sbc $a2a2.w, Y                                                  ; $80d5 : $f9, $a2, $a2
	.db $10, $0f                                                  ; $80d8 : $10, $0f

	.db $f0, $ff                                                  ; $80da : $f0, $ff

	bit $1e                                                  ; $80dc : $24, $1e
	sbc $4ea2f4.l, X                                                  ; $80de : $ff, $f4, $a2, $4e
	sbc ($f1), Y                                                  ; $80e2 : $f1, $f1
	and ($00), Y                                                  ; $80e4 : $31, $00
	sbc $a20e23.l, X                                                  ; $80e6 : $ff, $23, $0e, $a2
	cop $1f.b                                                  ; $80ea : $02, $1f
	beq br_0c_80ee                                                  ; $80ec : $f0, $00

br_0c_80ee:
	ora ($0d)                                                  ; $80ee : $12, $0d
	tsb $1e                                                  ; $80f0 : $04, $1e
	stx $0c, Y                                                  ; $80f2 : $96, $0c
	ror $a2                                                  ; $80f4 : $66, $a2
	lsr                                                  ; $80f6 : $4a
	trb wBG3HorizScroll+1                                                  ; $80f7 : $14, $be
	adc $cc, S                                                  ; $80f9 : $63, $cc
	sta ($e2)                                                  ; $80fb : $92, $e2
	jsr $f10d.w                                                  ; $80fd : $20, $0d, $f1
	plb                                                  ; $8100 : $ab
	and ($10, S), Y                                                  ; $8101 : $33, $10
	inc $02a2.w, X                                                  ; $8103 : $fe, $a2, $02
	and ($00, X)                                                  ; $8106 : $21, $00
	ora $0f34ef.l                                                  ; $8108 : $0f, $ef, $34, $0f
	jsr $03dfa6.l                                                  ; $810c : $22, $a6, $df, $03

br_0c_8110:
	jmp $12c2.w                                                  ; $8110 : $4c, $c2, $12


	and $11df.w                                                  ; $8113 : $2d, $df, $11
	ldx #$00.b                                                  ; $8116 : $a2, $00
	ora ($2f, X)                                                  ; $8118 : $01, $2f
	cmp $100043.l                                                  ; $811a : $cf, $43, $00, $10
	ora ($92, X)                                                  ; $811e : $01, $92
	and ($00, X)                                                  ; $8120 : $21, $00
	and $df4dc3.l                                                  ; $8122 : $2f, $c3, $4d, $df
	inc $96f2.w, X                                                  ; $8126 : $fe, $f2, $96
	asl $21de.w                                                  ; $8129 : $0e, $de, $21
	tsb $3b                                                  ; $812c : $04, $3b
	rep #$04.b                                                  ; $812e : $c2, $04
	tcd                                                  ; $8130 : $5b
	stx $af, Y                                                  ; $8131 : $96, $af
	and ($e1, S), Y                                                  ; $8133 : $33, $e1
	eor $64bce1.l                                                  ; $8135 : $4f, $e1, $bc, $64
	cmp ($92), Y                                                  ; $8139 : $d1, $92
	rol $36ae.w, X                                                  ; $813b : $3e, $ae, $36
	lsr $02be.w, X                                                  ; $813e : $5e, $be, $02
	ora $2f9612.l                                                  ; $8141 : $0f, $12, $96, $2f
	cmp ($11, X)                                                  ; $8145 : $c1, $11
	and $1ed3.w                                                  ; $8147 : $2d, $d3, $1e
	ora ($20, X)                                                  ; $814a : $01, $20
	ldx $de                                                  ; $814c : $a6, $de
	and ($0e, S), Y                                                  ; $814e : $33, $0e
	sbc $f21d03.l, X                                                  ; $8150 : $ff, $03, $1d, $f2
	asl $d082.w, X                                                  ; $8154 : $1e, $82, $d0
	sbc ($3e, S), Y                                                  ; $8157 : $f3, $3e
	ora ($13)                                                  ; $8159 : $12, $13
	rol $5dd4.w, X                                                  ; $815b : $3e, $d4, $5d
	sta ($c1)                                                  ; $815e : $92, $c1
	.db $62                                                  ; $8160 : $62

	bpl br_0c_8110                                                  ; $8161 : $10, $ad

	and $ed42e2.l                                                  ; $8163 : $2f, $e2, $42, $ed
	sta ($f3)                                                  ; $8167 : $92, $f3
	bit $f1d1.w                                                  ; $8169 : $2c, $d1, $f1
	rti                                                  ; $816c : $40


	sbc ($0b, S), Y                                                  ; $816d : $f3, $0b
	sbc $92, X                                                  ; $816f : $f5, $92
	and $31e1.w                                                  ; $8171 : $2d, $e1, $31
	ldx $1f43.w, Y                                                  ; $8174 : $be, $43, $1f
	tsx                                                  ; $8177 : $ba
	ora $82, X                                                  ; $8178 : $15, $82
	xce                                                  ; $817a : $fb
	bit $20, X                                                  ; $817b : $34, $20
	dex                                                  ; $817d : $ca
	ora ($df, S), Y                                                  ; $817e : $13, $df
	ora $219246.l                                                  ; $8180 : $0f, $46, $92, $21
	jsr $2134cc.l                                                  ; $8184 : $22, $cc, $34, $21
	inc $e132.w                                                  ; $8188 : $ee, $32, $e1
	sta ($0b)                                                  ; $818b : $92, $0b
	cpy #$1d.b                                                  ; $818d : $c0, $1d
	.db $b0, $66                                                  ; $818f : $b0, $66

	jsr ($01ef.w, X)                                                  ; $8191 : $fc, $ef, $01
	sta ($1d)                                                  ; $8194 : $92, $1d
	dec $5b                                                  ; $8196 : $c6, $5b
	sbc ($e1)                                                  ; $8198 : $f2, $e1
	tcs                                                  ; $819a : $1b
	sbc $1e, X                                                  ; $819b : $f5, $1e
	ldx #$ef.b                                                  ; $819d : $a2, $ef
	and ($fe, S), Y                                                  ; $819f : $33, $fe
	ora ($ed, X)                                                  ; $81a1 : $01, $ed
	beq br_0c_81c9                                                  ; $81a3 : $f0, $24

	ora $24a6.w, X                                                  ; $81a5 : $1d, $a6, $24
	inc $1a03.w, X                                                  ; $81a8 : $fe, $03, $1a
	dec $5d                                                  ; $81ab : $c6, $5d
	cpx #$e0.b                                                  ; $81ad : $e0, $e0
	sta ($ff)                                                  ; $81af : $92, $ff
	sbc $df34.w                                                  ; $81b1 : $ed, $34, $df
	asl $ac32.w                                                  ; $81b4 : $0e, $32, $ac
	and $0ff79a.l                                                  ; $81b7 : $2f, $9a, $f7, $0f
	jsr ($54f2.w, X)                                                  ; $81bb : $fc, $f2, $54
	tyx                                                  ; $81be : $bb
	sbc $6f, S                                                  ; $81bf : $e3, $6f
	ldx #$11.b                                                  ; $81c1 : $a2, $11
	jsr $f2dd.w                                                  ; $81c3 : $20, $dd, $f2
	ora $01e1.w, X                                                  ; $81c6 : $1d, $e1, $01

br_0c_81c9:
	rol $e5a6.w                                                  ; $81c9 : $2e, $a6, $e5
	and $32d0.w                                                  ; $81cc : $2d, $d0, $32
	ora $330de2.l                                                  ; $81cf : $0f, $e2, $0d, $33
	sta ($43)                                                  ; $81d3 : $92, $43
	tsb $3304.w                                                  ; $81d5 : $0c, $04, $33
	tcs                                                  ; $81d8 : $1b
	cmp ($10, X)                                                  ; $81d9 : $c1, $10
	sbc $d41ea6.l, X                                                  ; $81db : $ff, $a6, $1e, $d4
	and $0ff2.w, X                                                  ; $81df : $3d, $f2, $0f
	cmp ($4f), Y                                                  ; $81e2 : $d1, $4f
	sbc ($96), Y                                                  ; $81e4 : $f1, $96
	sbc $6ff41e.l                                                  ; $81e6 : $ef, $1e, $f4, $6f
	ldx $361f.w                                                  ; $81ea : $ae, $1f, $36
	dex                                                  ; $81ed : $ca
	sta ($cd)                                                  ; $81ee : $92, $cd
	inc $3ce3.w, X                                                  ; $81f0 : $fe, $e3, $3c
	lda $7e, S                                                  ; $81f3 : $a3, $7e
	ldx $920f.w                                                  ; $81f5 : $ae, $0f, $92
	cop $eb.b                                                  ; $81f8 : $02, $eb
	ora $2b                                                  ; $81fa : $05, $2b
	sbc [$5c]                                                  ; $81fc : $e7, $5c
	dec $5d, X                                                  ; $81fe : $d6, $5d
	stx $f2, Y                                                  ; $8200 : $96, $f2
	eor ($ac, S), Y                                                  ; $8202 : $53, $ac
	ora ($41, X)                                                  ; $8204 : $01, $41
	sbc $a6dc11.l                                                  ; $8206 : $ef, $11, $dc, $a6
	bit $1c                                                  ; $820a : $24, $1c
	cmp ($41, X)                                                  ; $820c : $c1, $41
	asl $0fe2.w                                                  ; $820e : $0e, $e2, $0f
	and $2ef2aa.l                                                  ; $8211 : $2f, $aa, $f2, $2e
	cop $de.b                                                  ; $8215 : $02, $de
	and ($0c, S), Y                                                  ; $8217 : $33, $0c
	rep #$53.b                                                  ; $8219 : $c2, $53
	ldx $3e                                                  ; $821b : $a6, $3e
	cmp $20e130.l                                                  ; $821d : $cf, $30, $e1, $20
	cmp $961031.l                                                  ; $8221 : $cf, $31, $10, $96
	lda $954b23.l                                                  ; $8225 : $af, $23, $4b, $95
	ror $3fce.w, X                                                  ; $8229 : $7e, $ce, $3f
	dec $92, X                                                  ; $822c : $d6, $92
	eor $1dbf.w, X                                                  ; $822e : $5d, $bf, $1d
	rep #$52.b                                                  ; $8231 : $c2, $52
	dec $d050.w                                                  ; $8233 : $ce, $50, $d0
	stx $e1, Y                                                  ; $8236 : $96, $e1
	ora ($5f), Y                                                  ; $8238 : $11, $5f
	cmp ($cd, X)                                                  ; $823a : $c1, $cd
	.db $50, $04                                                  ; $823c : $50, $04

	lda $2192.w, X                                                  ; $823e : $bd, $92, $21
	sbc $e10d01.l                                                  ; $8241 : $ef, $01, $0d, $e1
	jsr ($3f04.w, X)                                                  ; $8245 : $fc, $04, $3f
	stx $e2, Y                                                  ; $8248 : $96, $e2
	ora ($1f), Y                                                  ; $824a : $11, $1f
	cpx #$fe21.w                                                  ; $824c : $e0, $21, $fe
	and $a9                                                  ; $824f : $25, $a9
	sta ($02)                                                  ; $8251 : $92, $02
	ora ($f1, X)                                                  ; $8253 : $01, $f1
	eor $2906cc.l                                                  ; $8255 : $4f, $cc, $06, $29
	lda ($92), Y                                                  ; $8259 : $b1, $92
	and $20, S                                                  ; $825b : $23, $20
	jsr $75af1e.l                                                  ; $825d : $22, $1e, $af, $75
	inc $9610.w                                                  ; $8261 : $ee, $10, $96
	ora ($f1), Y                                                  ; $8264 : $11, $f1
	sbc DMAP0.w                                                  ; $8266 : $ed, $00, $43
	cmp $a2420d.l                                                  ; $8269 : $cf, $0d, $42, $a2
	sbc $d1fd10.l                                                  ; $826d : $ef, $10, $fd, $d1
	eor $ff, S                                                  ; $8271 : $43, $ff
	ora $33a2e1.l, X                                                  ; $8273 : $1f, $e1, $a2, $33
	ora $2d24ef.l, X                                                  ; $8277 : $1f, $ef, $24, $2d
	cmp ($30, X)                                                  ; $827b : $c1, $30
	sbc ($92), Y                                                  ; $827d : $f1, $92
	ora $b151e0.l, X                                                  ; $827f : $1f, $e0, $51, $b1
	eor $07feee.l                                                  ; $8283 : $4f, $ee, $fe, $07
	sta ($6e)                                                  ; $8287 : $92, $6e
	ldy $33d0.w, X                                                  ; $8289 : $bc, $d0, $33
	ora $16de.w                                                  ; $828c : $0d, $de, $16
	and $dd92.w, X                                                  ; $828f : $3d, $92, $dd
	ora $40                                                  ; $8292 : $05, $40
	inc $31f1.w                                                  ; $8294 : $ee, $f1, $31
	ora ($33, X)                                                  ; $8297 : $01, $33
	stx $ef, Y                                                  ; $8299 : $96, $ef
	.db $00                                                  ; $829b : $00
	and ($f0, X)                                                  ; $829c : $21, $f0
	jml [$f135.w]                                                  ; $829e : $dc, $35, $f1


	plx                                                  ; $82a1 : $fa
	sta ($bd)                                                  ; $82a2 : $92, $bd
	asl $1a, X                                                  ; $82a4 : $16, $1a
	cmp ($fe), Y                                                  ; $82a6 : $d1, $fe
	bit $fe                                                  ; $82a8 : $24, $fe
	ora $20e396.l, X                                                  ; $82aa : $1f, $96, $e3, $20
	sbc $0f141f.l                                                  ; $82ae : $ef, $1f, $14, $0f
	cpx #$923d.w                                                  ; $82b2 : $e0, $3d, $92
	sbc $63, S                                                  ; $82b5 : $e3, $63
	dec $0021.w, X                                                  ; $82b7 : $de, $21, $00
	sbc $92ceec.l, X                                                  ; $82ba : $ff, $ec, $ce, $92
	trb $2c                                                  ; $82be : $14, $2c
	lda $21e1.w, X                                                  ; $82c0 : $bd, $e1, $21
	ora ($2d, S), Y                                                  ; $82c3 : $13, $2d
	inc $96                                                  ; $82c5 : $e6, $96
	asl                                                  ; $82c7 : $0a
	sbc ($24, X)                                                  ; $82c8 : $e1, $24
	xce                                                  ; $82ca : $fb
	and $0c                                                  ; $82cb : $25, $0c
	cmp $ab9644.l, X                                                  ; $82cd : $df, $44, $96, $ab
	and ($ff)                                                  ; $82d1 : $32, $ff
	ora ($ef, S), Y                                                  ; $82d3 : $13, $ef
	ora $92e131.l                                                  ; $82d5 : $0f, $31, $e1, $92
	sbc $2435.w                                                  ; $82d9 : $ed, $35, $24
	rti                                                  ; $82dc : $40


	ora $0142e2.l                                                  ; $82dd : $0f, $e2, $42, $01
	stx $1f, Y                                                  ; $82e1 : $96, $1f
	sbc $cc33e0.l, X                                                  ; $82e3 : $ff, $e0, $33, $cc
	and ($32, X)                                                  ; $82e7 : $21, $32
	lda $dd92.w, X                                                  ; $82e9 : $bd, $92, $dd
	tsb $2d                                                  ; $82ec : $04, $2d
	cmp $fe55f1.l, X                                                  ; $82ee : $df, $f1, $55, $fe
	.db $10, $92                                                  ; $82f2 : $10, $92

	ora ($f0, X)                                                  ; $82f4 : $01, $f0
	jsr $33ab64.l                                                  ; $82f6 : $22, $64, $ab, $33
	jsr $2596ec.l                                                  ; $82fa : $22, $ec, $96, $25
	ora $ee00.w, X                                                  ; $82fe : $1d, $00, $ee
	ora $1a                                                  ; $8301 : $05, $1a
	dec $6a                                                  ; $8303 : $c6, $6a
	stx $e5, Y                                                  ; $8305 : $96, $e5
	cmp $fe31.w, X                                                  ; $8307 : $dd, $31, $fe
	ora $4d                                                  ; $830a : $05, $4d
	cmp $e292ef.l, X                                                  ; $830c : $df, $ef, $92, $e2
	and $23ae.w, X                                                  ; $8310 : $3d, $ae, $23
	and $11fee0.l                                                  ; $8313 : $2f, $e0, $fe, $11
	stx $f1, Y                                                  ; $8317 : $96, $f1
	inc $4df4.w, X                                                  ; $8319 : $fe, $f4, $4d
	bne br_0c_831e                                                  ; $831c : $d0, $00

br_0c_831e:
	ora ($ff)                                                  ; $831e : $12, $ff
	stx $03, Y                                                  ; $8320 : $96, $03
	and $1db7.w, Y                                                  ; $8322 : $39, $b7, $1d
	rol $21d2.w                                                  ; $8325 : $2e, $d2, $21
	and ($a6, X)                                                  ; $8328 : $21, $a6
	asl $43c0.w                                                  ; $832a : $0e, $c0, $43
	ora $0f02.w                                                  ; $832d : $0d, $02, $0f
	sbc $1d9601.l, X                                                  ; $8330 : $ff, $01, $96, $1d
	sbc $3d, X                                                  ; $8334 : $f5, $3d
	cmp ($30, X)                                                  ; $8336 : $c1, $30
	dec $3111.w, X                                                  ; $8338 : $de, $11, $31
	stx $de, Y                                                  ; $833b : $96, $de
	ora $2e, S                                                  ; $833d : $03, $2e
	ora $4101c2.l, X                                                  ; $833f : $1f, $c2, $01, $41
	jml [$d092.w]                                                  ; $8343 : $dc, $92, $d0


	and $30, S                                                  ; $8346 : $23, $30
	cpy $6203.w                                                  ; $8348 : $cc, $03, $62
	cmp $a60f.w                                                  ; $834b : $cd, $0f, $a6
	ora ($fe, X)                                                  ; $834e : $01, $fe
	jsr $0001fe.l                                                  ; $8350 : $22, $fe, $01, $00
	and ($bc), Y                                                  ; $8354 : $31, $bc
	ldx #$43e3.w                                                  ; $8356 : $a2, $e3, $43
	ora $1f11e0.l, X                                                  ; $8359 : $1f, $e0, $11, $1f
	dec $92f1.w, X                                                  ; $835d : $de, $f1, $92
	wdm                                                  ; $8360 : $42
	phd                                                  ; $8361 : $0b
	ldy #$fd0f.w                                                  ; $8362 : $a0, $0f, $fd

br_0c_8365:
	tsb $0c                                                  ; $8365 : $04, $0c
	sbc ($96)                                                  ; $8367 : $f2, $96
	.db $f0, $ff                                                  ; $8369 : $f0, $ff

	cop $0e.b                                                  ; $836b : $02, $0e
	mvp $04, $cb                                                  ; $836d : $44, $cb, $04
	.db $10, $96                                                  ; $8370 : $10, $96

	asl $36ce.w, X                                                  ; $8372 : $1e, $ce, $36
	asl $912d.w                                                  ; $8375 : $0e, $2d, $91
	.db $50, $e0                                                  ; $8378 : $50, $e0

	sta ($10)                                                  ; $837a : $92, $10
	cmp $02fe30.l                                                  ; $837c : $cf, $30, $fe, $02
	dec $e263.w, X                                                  ; $8380 : $de, $63, $e2
	stx $1b, Y                                                  ; $8383 : $96, $1b
	ora ($f1, S), Y                                                  ; $8385 : $13, $f1
	.db $f0, $2c                                                  ; $8387 : $f0, $2c

	sbc $3e, X                                                  ; $8389 : $f5, $3e
	ldx $2296.w, Y                                                  ; $838b : $be, $96, $22
	beq br_0c_83be                                                  ; $838e : $f0, $2e

	beq br_0c_8365                                                  ; $8390 : $f0, $d3

	and $92b11e.l, X                                                  ; $8392 : $3f, $1e, $b1, $92
	.db $00                                                  ; $8396 : $00
	ora ($30, S), Y                                                  ; $8397 : $13, $30
	sbc $d23fef.l                                                  ; $8399 : $ef, $ef, $3f, $d2
	and $02ffa2.l                                                  ; $839d : $2f, $a2, $ff, $02
	and $1011d0.l, X                                                  ; $83a1 : $3f, $d0, $11, $10
	asl $96e1.w                                                  ; $83a5 : $0e, $e1, $96
	rol $00ee.w                                                  ; $83a8 : $2e, $ee, $00
	ora ($0c, S), Y                                                  ; $83ab : $13, $0c
	rol $bb, X                                                  ; $83ad : $36, $bb
	ora ($92), Y                                                  ; $83af : $11, $92
	.db $00                                                  ; $83b1 : $00
	ora $3d, X                                                  ; $83b2 : $15, $3d
	sep #$32.b                                                  ; $83b4 : $e2, $32
	jsr ($37ab.w, X)                                                  ; $83b6 : $fc, $ab, $37
	sta ($2e)                                                  ; $83b9 : $92, $2e
	cmp $01f0.w, X                                                  ; $83bb : $dd, $f0, $01

br_0c_83be:
	rol $25ad.w                                                  ; $83be : $2e, $ad, $25
	tcs                                                  ; $83c1 : $1b
	sta ($f5)                                                  ; $83c2 : $92, $f5
	adc ($ce, X)                                                  ; $83c4 : $61, $ce
	ora $43de22.l                                                  ; $83c6 : $0f, $22, $de, $43
	sbc ($92), Y                                                  ; $83ca : $f1, $92
	rol $16aa.w                                                  ; $83cc : $2e, $aa, $16
	rti                                                  ; $83cf : $40


	wai                                                  ; $83d0 : $cb
	pea $232f.w                                                  ; $83d1 : $f4, $2f, $23
	stx $dd, Y                                                  ; $83d4 : $96, $dd
	and $1f                                                  ; $83d6 : $25, $1f
	sbc $1ef2.w, X                                                  ; $83d8 : $fd, $f2, $1e
	.db $d0, $64                                                  ; $83db : $d0, $64

	ldx $cd                                                  ; $83dd : $a6, $cd
	and $1f, S                                                  ; $83df : $23, $1f
	sbc $f22ee2.l, X                                                  ; $83e1 : $ff, $e2, $2e, $f2
	ora $e10f92.l                                                  ; $83e5 : $0f, $92, $0f, $e1
	jsr $20ef.w                                                  ; $83e9 : $20, $ef, $20
	ora $41                                                  ; $83ec : $05, $41
	asl $f196.w                                                  ; $83ee : $0e, $96, $f1
	wdm                                                  ; $83f1 : $42
	wai                                                  ; $83f2 : $cb
	rol $ea, X                                                  ; $83f3 : $36, $ea
	tsb $2b                                                  ; $83f5 : $04, $2b
	pei ($93)                                                  ; $83f7 : $d4, $93
	jsr $3fe1.w                                                  ; $83f9 : $20, $e1, $3f
	sbc $dc24ed.l                                                  ; $83fc : $ef, $ed, $24, $dc
	ora ($ff)                                                  ; $8400 : $12, $ff
	.db $00                                                  ; $8402 : $00
	.db $00                                                  ; $8403 : $00
	.db $00                                                  ; $8404 : $00
	.db $00                                                  ; $8405 : $00
	sbc $bc0004.l, X                                                  ; $8406 : $ff, $04, $00, $bc
	and $e35e.w, Y                                                  ; $840a : $39, $5e, $e3
	eor ($e6)                                                  ; $840d : $52, $e6
	asl $00                                                  ; $840f : $06, $00
	sep #$3a.b                                                  ; $8411 : $e2, $3a
	and $b8e0ff.l                                                  ; $8413 : $2f, $ff, $e0, $b8
	ora [$00]                                                  ; $8417 : $07, $00
	bit $03, X                                                  ; $8419 : $34, $03
	lsr $02e3.w, X                                                  ; $841b : $5e, $e3, $02
	.db $00                                                  ; $841e : $00
	.db $00                                                  ; $841f : $00
	.db $00                                                  ; $8420 : $00
	.db $00                                                  ; $8421 : $00
	.db $00                                                  ; $8422 : $00
	.db $00                                                  ; $8423 : $00
	.db $00                                                  ; $8424 : $00
	.db $00                                                  ; $8425 : $00
	lsr $6f, X                                                  ; $8426 : $56, $6f
	sbc ($2e, S), Y                                                  ; $8428 : $f3, $2e
	sbc $3124de.l                                                  ; $842a : $ef, $de, $24, $31
	ora $131f4a.l                                                  ; $842e : $0f, $4a, $1f, $13
	ora $f212cc.l, X                                                  ; $8432 : $1f, $cc, $12, $f2
	eor $df5afd.l                                                  ; $8436 : $4f, $fd, $5a, $df
	ora ($ff), Y                                                  ; $843a : $11, $ff
	dec $02ef.w, X                                                  ; $843c : $de, $ef, $02
	tsb $5ada.w                                                  ; $843f : $0c, $da, $5a
	lda ($41, X)                                                  ; $8442 : $a1, $41
	cop $fe.b                                                  ; $8444 : $02, $fe
	.db $f0, $11                                                  ; $8446 : $f0, $11

	stp                                                  ; $8448 : $db
	sbc $6a, S                                                  ; $8449 : $e3, $6a
	bpl br_0c_8483                                                  ; $844b : $10, $36

	wdm                                                  ; $844d : $42
	jsr $dfff.w                                                  ; $844e : $20, $ff, $df
	bit $12, X                                                  ; $8451 : $34, $12
	phy                                                  ; $8453 : $5a
	adc ($15)                                                  ; $8454 : $72, $15
	wdm                                                  ; $8456 : $42
	.db $00                                                  ; $8457 : $00
	ora $44c0.w                                                  ; $8458 : $0d, $c0, $44
	and $8a, X                                                  ; $845b : $35, $8a
	bpl br_0c_845f                                                  ; $845d : $10, $00

br_0c_845f:
	ora ($1f), Y                                                  ; $845f : $11, $1f
	sbc $f1dd.w                                                  ; $8461 : $ed, $dd, $f1
	eor $9a, X                                                  ; $8464 : $55, $9a
	inc $f011.w, X                                                  ; $8466 : $fe, $11, $f0
	jsr $d1ec.w                                                  ; $8469 : $20, $ec, $d1
	ora ($31)                                                  ; $846c : $12, $31
	txa                                                  ; $846e : $8a
	ora $ff11dc.l                                                  ; $846f : $0f, $dc, $11, $ff
	ora $0f22f1.l                                                  ; $8473 : $0f, $f1, $22, $0f
	ror                                                  ; $8477 : $6a
	cmp $3ed053.l, X                                                  ; $8478 : $df, $53, $d0, $3e
	ora $0d, S                                                  ; $847c : $03, $0d
	cpx $7aba.w                                                  ; $847e : $ec, $ba, $7a
	sbc $41, S                                                  ; $8481 : $e3, $41

br_0c_8483:
	ora $f0effe.l                                                  ; $8483 : $0f, $fe, $ef, $f0
	ora $fe8a24.l                                                  ; $8487 : $0f, $24, $8a, $fe
	ora ($1f, S), Y                                                  ; $848b : $13, $1f
	ora $3d, S                                                  ; $848d : $03, $3d
	cmp ($40, X)                                                  ; $848f : $c1, $40
	cpx #$8a.b                                                  ; $8491 : $e0, $8a
	and ($ef, S), Y                                                  ; $8493 : $33, $ef
	and ($e1)                                                  ; $8495 : $32, $e1
	and $1022cf.l                                                  ; $8497 : $2f, $cf, $22, $10
	tax                                                  ; $849b : $aa
	bpl br_0c_849e                                                  ; $849c : $10, $00

br_0c_849e:
	ora ($2f)                                                  ; $849e : $12, $2f
	ldy $f3f0.w, X                                                  ; $84a0 : $bc, $f0, $f3
	lsr $aa                                                  ; $84a3 : $46, $aa
	rol                                                  ; $84a5 : $2a
	.db $b0, $ee                                                  ; $84a6 : $b0, $ee

	and $31, S                                                  ; $84a8 : $23, $31
	cmp $0f02.w, X                                                  ; $84aa : $dd, $02, $0f
	txa                                                  ; $84ad : $8a
	sbc ($bc), Y                                                  ; $84ae : $f1, $bc
	trb $21                                                  ; $84b0 : $14, $21
	.db $00                                                  ; $84b2 : $00
	sbc $8a01d0.l, X                                                  ; $84b3 : $ff, $d0, $01, $8a
	ora $e30b15.l                                                  ; $84b7 : $0f, $15, $0b, $e3
	and ($f1, X)                                                  ; $84bb : $21, $f1
	rol $7abc.w, X                                                  ; $84bd : $3e, $bc, $7a
	sbc $42, X                                                  ; $84c0 : $f5, $42
	adc ($bb, S), Y                                                  ; $84c2 : $73, $bb
	sbc $2202dd.l, X                                                  ; $84c4 : $ff, $dd, $02, $22
	txs                                                  ; $84c8 : $9a
	.db $00                                                  ; $84c9 : $00
	ora ($1f), Y                                                  ; $84ca : $11, $1f
	ora ($1d)                                                  ; $84cc : $12, $1d
	cpy #$40.b                                                  ; $84ce : $c0, $40
	sbc ($9a, X)                                                  ; $84d0 : $e1, $9a
	wdm                                                  ; $84d2 : $42
	inc $ff12.w                                                  ; $84d3 : $ee, $12, $ff
	jsr $12ee.w                                                  ; $84d6 : $20, $ee, $12
	jsr $01aa.w                                                  ; $84d9 : $20, $aa, $01
	ora $ba3103.l                                                  ; $84dc : $0f, $03, $31, $ba
	.db $d0, $f3                                                  ; $84e0 : $d0, $f3

	eor $ba, X                                                  ; $84e2 : $55, $ba
	and $020fbe.l, X                                                  ; $84e4 : $3f, $be, $0f, $02
	jsr $10e00d.l                                                  ; $84e8 : $22, $0d, $e0, $10
	txs                                                  ; $84ec : $9a
	and ($eb, X)                                                  ; $84ed : $21, $eb
	sep #$42.b                                                  ; $84ef : $e2, $42
	sbc $12ef0f.l, X                                                  ; $84f1 : $ff, $0f, $ef, $12
	txa                                                  ; $84f5 : $8a
	ora $5bc5.w                                                  ; $84f6 : $0d, $c5, $5b
	ldy $51                                                  ; $84f9 : $a4, $51
	bne br_0c_852e                                                  ; $84fb : $d0, $31

	tsx                                                  ; $84fd : $ba
	txa                                                  ; $84fe : $8a
	pea $3420.w                                                  ; $84ff : $f4, $20, $34
	sbc $0eef.w                                                  ; $8502 : $ed, $ef, $0e
	cmp ($20), Y                                                  ; $8505 : $d1, $20
	txa                                                  ; $8507 : $8a
	ora ($22, S), Y                                                  ; $8508 : $13, $22
	ora $bd0b24.l, X                                                  ; $850a : $1f, $24, $0b, $bd
	bit $e0, X                                                  ; $850e : $34, $e0
	txa                                                  ; $8510 : $8a
	ror $eb, X                                                  ; $8511 : $76, $eb
	cpx $3c                                                  ; $8513 : $e4, $3c
	sbc [$4c]                                                  ; $8515 : $e7, $4c
	.db $b0, $53                                                  ; $8517 : $b0, $53

	tsx                                                  ; $8519 : $ba
	.db $00                                                  ; $851a : $00
	.db $00                                                  ; $851b : $00
	.db $00                                                  ; $851c : $00
	ora ($1d)                                                  ; $851d : $12, $1d

br_0c_851f:
	cmp $ba1210.l                                                  ; $851f : $cf, $10, $12, $ba
	and $fc, S                                                  ; $8523 : $23, $fc
	sbc $2f22f1.l                                                  ; $8525 : $ef, $f1, $22, $2f
	cmp $178a00.l, X                                                  ; $8529 : $df, $00, $8a, $17
	tcs                                                  ; $852d : $1b

br_0c_852e:
	dec $3e26.w                                                  ; $852e : $ce, $26, $3e
	bne br_0c_851f                                                  ; $8531 : $d0, $ec

	sbc ($8a)                                                  ; $8533 : $f2, $8a
	and $aa75ef.l                                                  ; $8535 : $2f, $ef, $75, $aa
	and $0e, S                                                  ; $8539 : $23, $0e
	tsb $1a                                                  ; $853b : $04, $1a
	txa                                                  ; $853d : $8a
	lda ($52, X)                                                  ; $853e : $a1, $52
	pea $be3d.w                                                  ; $8540 : $f4, $3d, $be
	ora ($ed), Y                                                  ; $8543 : $11, $ed
	cop $9a.b                                                  ; $8545 : $02, $9a
	bpl br_0c_8549                                                  ; $8547 : $10, $00

br_0c_8549:
	jsr $dd1101.l                                                  ; $8549 : $22, $01, $11, $dd
	pei ($3f)                                                  ; $854d : $d4, $3f
	txa                                                  ; $854f : $8a
	dec $6f, X                                                  ; $8550 : $d6, $6f
	ldx $d053.w                                                  ; $8552 : $ae, $53, $d0
	adc ($bd, X)                                                  ; $8555 : $61, $bd
	and $aa                                                  ; $8557 : $25, $aa
	.db $00                                                  ; $8559 : $00
	ora ($f0, X)                                                  ; $855a : $01, $f0
	trb $3e                                                  ; $855c : $14, $3e
	txy                                                  ; $855e : $9b
	.db $f0, $04                                                  ; $855f : $f0, $04

	tsx                                                  ; $8561 : $ba
	and $2d, S                                                  ; $8562 : $23, $2d
	cmp $2023ff.l                                                  ; $8564 : $cf, $ff, $23, $20
	inc $8af0.w                                                  ; $8568 : $ee, $f0, $8a
	eor ($20)                                                  ; $856b : $52, $20
	cpy $62e4.w                                                  ; $856d : $cc, $e4, $62
	cmp $9ac00d.l                                                  ; $8570 : $cf, $0d, $c0, $9a
	and ($fe, X)                                                  ; $8574 : $21, $fe
	tsb $1d                                                  ; $8576 : $04, $1d
	sbc ($1f), Y                                                  ; $8578 : $f1, $1f
	cpx #$30.b                                                  ; $857a : $e0, $30
	txa                                                  ; $857c : $8a
	plb                                                  ; $857d : $ab
	and $1e, X                                                  ; $857e : $35, $1e
	eor $dc, S                                                  ; $8580 : $43, $dc
	cmp ($0d), Y                                                  ; $8582 : $d1, $0d
	sbc $9a, S                                                  ; $8584 : $e3, $9a
	bpl br_0c_8588                                                  ; $8586 : $10, $00

br_0c_8588:
	cop $10.b                                                  ; $8588 : $02, $10
	and $0b, S                                                  ; $858a : $23, $0b
	cpy #$51.b                                                  ; $858c : $c0, $51
	stx $ee, Y                                                  ; $858e : $96, $ee
	and $3f                                                  ; $8590 : $25, $3f
	cpx #$0e.b                                                  ; $8592 : $e0, $0e
	ora ($0e, X)                                                  ; $8594 : $01, $0e
	dec $10ba.w, X                                                  ; $8596 : $de, $ba, $10
	.db $00                                                  ; $8599 : $00
	ora $fc2011.l                                                  ; $859a : $0f, $11, $20, $fc
	cpx #$01.b                                                  ; $859e : $e0, $01
	tsx                                                  ; $85a0 : $ba
	and $30, S                                                  ; $85a1 : $23, $30
	lda $020f.w, X                                                  ; $85a3 : $bd, $0f, $02
	and ($0d)                                                  ; $85a6 : $32, $0d
	sbc $30448a.l                                                  ; $85a8 : $ef, $8a, $44, $30
	ora $76b0.w                                                  ; $85ac : $0d, $b0, $76
	sbc $bd0f.w                                                  ; $85af : $ed, $0f, $bd
	txs                                                  ; $85b2 : $9a
	ora ($0f)                                                  ; $85b3 : $12, $0f
	sep #$4f.b                                                  ; $85b5 : $e2, $4f
	cpy #$31.b                                                  ; $85b7 : $c0, $31
	sbc $8a12.w                                                  ; $85b9 : $ed, $12, $8a
	phx                                                  ; $85bc : $da
	ora $3f                                                  ; $85bd : $05, $3f
	bit $0b                                                  ; $85bf : $24, $0b
	lda $9acf3f.l, X                                                  ; $85c1 : $bf, $3f, $cf, $9a
	ora ($10), Y                                                  ; $85c5 : $11, $10
	ora ($10, X)                                                  ; $85c7 : $01, $10
	ora $2f, S                                                  ; $85c9 : $03, $2f
	cpy $9624.w                                                  ; $85cb : $cc, $24, $96
	asl $42f2.w, X                                                  ; $85ce : $1e, $f2, $42
	sbc $20d01f.l, X                                                  ; $85d1 : $ff, $1f, $d0, $20
	inc $01ba.w                                                  ; $85d5 : $ee, $ba, $01
	.db $00                                                  ; $85d8 : $00
	.db $00                                                  ; $85d9 : $00
	sbc ($22), Y                                                  ; $85da : $f1, $22
	ora wBGMode.w                                                  ; $85dc : $0d, $cf, $00
	tsx                                                  ; $85df : $ba
	and $22, S                                                  ; $85e0 : $23, $22
	xce                                                  ; $85e2 : $fb
	cpx #$f1.b                                                  ; $85e3 : $e0, $f1
	and $2f, S                                                  ; $85e5 : $23, $2f
	dec $429a.w                                                  ; $85e7 : $ce, $9a, $42
	.db $f0, $2f                                                  ; $85ea : $f0, $2f

	inc $2f13.w                                                  ; $85ec : $ee, $13, $2f
	.db $00                                                  ; $85ef : $00
	sbc $f58a.w                                                  ; $85f0 : $ed, $8a, $f5
	rol $65cf.w, X                                                  ; $85f3 : $3e, $cf, $65
	plb                                                  ; $85f6 : $ab
	mvp $e3, $fb                                                  ; $85f7 : $44, $fb, $e3
	txa                                                  ; $85fa : $8a
	trb $30d2.w                                                  ; $85fb : $1c, $d2, $30
	sbc $5c, X                                                  ; $85fe : $f5, $5c
	lda $dc22.w                                                  ; $8600 : $ad, $22, $dc
	txs                                                  ; $8603 : $9a
	cop $10.b                                                  ; $8604 : $02, $10
	beq br_0c_862a                                                  ; $8606 : $f0, $22

	sbc ($31), Y                                                  ; $8608 : $f1, $31
	cpx $86e2.w                                                  ; $860a : $ec, $e2, $86
	eor $1e66b0.l                                                  ; $860d : $4f, $b0, $66, $1e
	cop $db.b                                                  ; $8611 : $02, $db
	trb $0b                                                  ; $8613 : $14, $0b
	tax                                                  ; $8615 : $aa
	ora ($10, X)                                                  ; $8616 : $01, $10
	ora ($0f, X)                                                  ; $8618 : $01, $0f
	ora $40, S                                                  ; $861a : $03, $40
	lda #$f0.b                                                  ; $861c : $a9, $f0
	tsx                                                  ; $861e : $ba
	ora ($33, X)                                                  ; $861f : $01, $33
	and $ffcf.w                                                  ; $8621 : $2d, $cf, $ff
	jsr $9afc22.l                                                  ; $8624 : $22, $22, $fc, $9a
	lda $1f, S                                                  ; $8628 : $a3, $1f

br_0c_862a:
	jsr $42e1ed.l                                                  ; $862a : $22, $ed, $e1, $42
	sbc $d09a0f.l, X                                                  ; $862e : $ff, $0f, $9a, $d0
	and ($ef, X)                                                  ; $8632 : $21, $ef
	tsb $1d                                                  ; $8634 : $04, $1d
	sep #IDX_8                                                  ; $8636 : $e2, $10
	sbc $bd218a.l                                                  ; $8638 : $ef, $8a, $21, $bd
	bit $0f, X                                                  ; $863c : $34, $0f
	stz wBG2HorizScroll                                                  ; $863e : $64, $b9
	sbc $1c, S                                                  ; $8640 : $e3, $1c
	txs                                                  ; $8642 : $9a
	sbc ($21, X)                                                  ; $8643 : $e1, $21
	beq br_0c_8649                                                  ; $8645 : $f0, $02

	.db $10, $13                                                  ; $8647 : $10, $13

br_0c_8649:
	ora $96cf.w, X                                                  ; $8649 : $1d, $cf, $96
	cop $fd.b                                                  ; $864c : $02, $fd
	tsb $40                                                  ; $864e : $04, $40
	cpx #$1e.b                                                  ; $8650 : $e0, $1e
	sbc ($1f, X)                                                  ; $8652 : $e1, $1f
	tsx                                                  ; $8654 : $ba
	.db $00                                                  ; $8655 : $00
	.db $00                                                  ; $8656 : $00
	bpl br_0c_8668                                                  ; $8657 : $10, $0f

	ora ($20), Y                                                  ; $8659 : $11, $20
	sbc $baef.w, X                                                  ; $865b : $fd, $ef, $ba
	.db $00                                                  ; $865e : $00
	and $31, S                                                  ; $865f : $23, $31
	cmp $f2ff.w                                                  ; $8661 : $cd, $ff, $f2
	and ($0d, S), Y                                                  ; $8664 : $33, $0d
	stx $de, Y                                                  ; $8666 : $96, $de

br_0c_8668:
	nop                                                  ; $8668 : $ea
	sta $cbfe.w, X                                                  ; $8669 : $9d, $fe, $cb
	sep #$32.b                                                  ; $866c : $e2, $32
	jsr $03ee9a.l                                                  ; $866e : $22, $9a, $ee, $03
	ora $c03fe2.l                                                  ; $8672 : $0f, $e2, $3f, $c0
	and ($fd), Y                                                  ; $8676 : $31, $fd

br_0c_8678:
	txa                                                  ; $8678 : $8a
	ora $fb, S                                                  ; $8679 : $03, $fb
	tsb $2e                                                  ; $867b : $04, $2e
	ora [$1a], Y                                                  ; $867d : $17, $1a
	.db $b0, $3f                                                  ; $867f : $b0, $3f

	txs                                                  ; $8681 : $9a
	cmp $010f22.l, X                                                  ; $8682 : $df, $22, $0f, $01
	jsr $30f3.w                                                  ; $8686 : $20, $f3, $30
	cmp $e196.w                                                  ; $8689 : $cd, $96, $e1
	asl $42f3.w, X                                                  ; $868c : $1e, $f3, $42
	ora $21df0f.l                                                  ; $868f : $0f, $0f, $df, $21
	tsx                                                  ; $8693 : $ba
	beq br_0c_86a7                                                  ; $8694 : $f0, $11

	.db $f0, $01                                                  ; $8696 : $f0, $01

	.db $f0, $12                                                  ; $8698 : $f0, $12

	asl $bade.w, X                                                  ; $869a : $1e, $de, $ba
	ora $fc3213.l                                                  ; $869d : $0f, $13, $32, $fc
	cpx #$ff.b                                                  ; $86a1 : $e0, $ff
	and $3f, S                                                  ; $86a3 : $23, $3f
	ldx $2e                                                  ; $86a5 : $a6, $2e

br_0c_86a7:
	inc $ffdd.w, X                                                  ; $86a7 : $fe, $dd, $ff
	inc $11ef.w, X                                                  ; $86aa : $fe, $ef, $11
	ora ($8a), Y                                                  ; $86ad : $11, $8a
	asl                                                  ; $86af : $0a
	rep #F_OVERFLOW|IDX_8                                                  ; $86b0 : $c2, $50
	dec $ca45.w, X                                                  ; $86b2 : $de, $45, $ca
	bit $1c, X                                                  ; $86b5 : $34, $1c
	txa                                                  ; $86b7 : $8a
	cpy #$c03e.w                                                  ; $86b8 : $c0, $3e, $c0
	and ($f4)                                                  ; $86bb : $32, $f4
	eor $9a129d.l, X                                                  ; $86bd : $5f, $9d, $12, $9a
	sbc $2f02.w, X                                                  ; $86c1 : $fd, $02, $2f
	.db $f0, $22                                                  ; $86c4 : $f0, $22

	ora $96fc32.l                                                  ; $86c6 : $0f, $32, $fc, $96
	sbc $34e021.l                                                  ; $86ca : $ef, $21, $e0, $34
	jsr $edf0.w                                                  ; $86ce : $20, $f0, $ed
	sbc ($ba)                                                  ; $86d1 : $f2, $ba
	ora $000001.l                                                  ; $86d3 : $0f, $01, $00, $00
	.db $00                                                  ; $86d7 : $00
	ora ($31, X)                                                  ; $86d8 : $01, $31
	cpy $e1aa.w                                                  ; $86da : $cc, $aa, $e1
	pea $3d56.w                                                  ; $86dd : $f4, $56, $3d
	stz $05fd.w                                                  ; $86e0 : $9c, $fd, $05
	mvn $fc, $aa                                                  ; $86e3 : $54, $aa, $fc
	cmp $0f11ff.l, X                                                  ; $86e6 : $df, $ff, $11, $0f
	.db $f0, $21                                                  ; $86ea : $f0, $21

	beq br_0c_8678                                                  ; $86ec : $f0, $8a

	and $339f.w                                                  ; $86ee : $2d, $9f, $33
	sbc $4bf5.w, X                                                  ; $86f1 : $fd, $f5, $4b
	cmp $40, S                                                  ; $86f4 : $c3, $40
	txa                                                  ; $86f6 : $8a
	lda $cd22.w                                                  ; $86f7 : $ad, $22, $cd
	bit $00                                                  ; $86fa : $24, $00
	mvn $d2, $ca                                                  ; $86fc : $54, $ca, $d2
	txs                                                  ; $86ff : $9a
	asl $31e0.w, X                                                  ; $8700 : $1e, $e0, $31
	sbc $041e13.l, X                                                  ; $8703 : $ff, $13, $1e, $04
	and $fe96.w                                                  ; $8707 : $2d, $96, $fe
	ora ($fe)                                                  ; $870a : $12, $fe
	ora ($31, S), Y                                                  ; $870c : $13, $31
	.db $00                                                  ; $870e : $00
	inc $baf0.w, X                                                  ; $870f : $fe, $f0, $ba
	.db $00                                                  ; $8712 : $00
	.db $00                                                  ; $8713 : $00
	.db $00                                                  ; $8714 : $00
	ora ($00, X)                                                  ; $8715 : $01, $00
	ora ($11, X)                                                  ; $8717 : $01, $11
	sbc $e0ba.w                                                  ; $8719 : $ed, $ba, $e0
	ora ($23, X)                                                  ; $871c : $01, $23
	and $020fbe.l, X                                                  ; $871e : $3f, $be, $0f, $02
	and ($aa)                                                  ; $8722 : $32, $aa
	xba                                                  ; $8724 : $eb
	.db $d0, $ff                                                  ; $8725 : $d0, $ff

	ora ($ff)                                                  ; $8727 : $12, $ff
	.db $f0, $12                                                  ; $8729 : $f0, $12

	ora $ad1e8a.l                                                  ; $872b : $0f, $8a, $1e, $ad
	mvp $06, $ec                                                  ; $872f : $44, $ec, $06
	dea                                                  ; $8732 : $3a
	cpy $40                                                  ; $8733 : $c4, $40
	txa                                                  ; $8735 : $8a
	lda $dd21.w                                                  ; $8736 : $ad, $21, $dd
	and $10, S                                                  ; $8739 : $23, $10
	mvn $c2, $ca                                                  ; $873b : $54, $ca, $c2
	txs                                                  ; $873e : $9a
	ora $0f21e0.l, X                                                  ; $873f : $1f, $e0, $21, $0f
	cop $2f.b                                                  ; $8743 : $02, $2f
	tsb $2d                                                  ; $8745 : $04, $2d
	sta [$fd], Y                                                  ; $8747 : $97, $fd
	cop $fe.b                                                  ; $8749 : $02, $fe
	trb $30                                                  ; $874b : $14, $30
	.db $f0, $0e                                                  ; $874d : $f0, $0e

	.db $f0, $ff                                                  ; $874f : $f0, $ff

	.db $00                                                  ; $8751 : $00
	.db $00                                                  ; $8752 : $00
	.db $00                                                  ; $8753 : $00
	.db $00                                                  ; $8754 : $00
	sbc $520002.l, X                                                  ; $8755 : $ff, $02, $00, $52
	ora $e234.w, Y                                                  ; $8759 : $19, $34, $e2
	tsb $0001.w                                                  ; $875c : $0c, $01, $00
	bit $71, X                                                  ; $875f : $34, $71
	jmp ($0000.w)                                                  ; $8761 : $6c, $00, $00


	.db $00                                                  ; $8764 : $00
	.db $00                                                  ; $8765 : $00
	.db $00                                                  ; $8766 : $00
	.db $00                                                  ; $8767 : $00
	.db $00                                                  ; $8768 : $00
	.db $00                                                  ; $8769 : $00
	.db $00                                                  ; $876a : $00
	.db $00                                                  ; $876b : $00
	.db $00                                                  ; $876c : $00
	.db $00                                                  ; $876d : $00
	.db $00                                                  ; $876e : $00
	.db $00                                                  ; $876f : $00
	.db $00                                                  ; $8770 : $00
	.db $00                                                  ; $8771 : $00
	.db $00                                                  ; $8772 : $00
	.db $00                                                  ; $8773 : $00
	.db $00                                                  ; $8774 : $00
	.db $00                                                  ; $8775 : $00
	.db $00                                                  ; $8776 : $00
	.db $00                                                  ; $8777 : $00
	.db $00                                                  ; $8778 : $00
	.db $00                                                  ; $8779 : $00
	.db $00                                                  ; $877a : $00
	.db $00                                                  ; $877b : $00
	.db $00                                                  ; $877c : $00
	.db $00                                                  ; $877d : $00
	.db $00                                                  ; $877e : $00
	.db $00                                                  ; $877f : $00
	.db $00                                                  ; $8780 : $00
	.db $00                                                  ; $8781 : $00
	.db $00                                                  ; $8782 : $00
	.db $00                                                  ; $8783 : $00
	.db $00                                                  ; $8784 : $00
	.db $00                                                  ; $8785 : $00
	.db $00                                                  ; $8786 : $00
	.db $00                                                  ; $8787 : $00
	.db $00                                                  ; $8788 : $00
	.db $00                                                  ; $8789 : $00
	.db $00                                                  ; $878a : $00
	.db $00                                                  ; $878b : $00
	.db $00                                                  ; $878c : $00
	.db $00                                                  ; $878d : $00
	.db $00                                                  ; $878e : $00
	.db $00                                                  ; $878f : $00
	.db $00                                                  ; $8790 : $00
	.db $00                                                  ; $8791 : $00
	.db $00                                                  ; $8792 : $00
	.db $00                                                  ; $8793 : $00
	.db $00                                                  ; $8794 : $00
	.db $00                                                  ; $8795 : $00
	.db $00                                                  ; $8796 : $00
	.db $00                                                  ; $8797 : $00
	.db $00                                                  ; $8798 : $00
	.db $00                                                  ; $8799 : $00
	.db $00                                                  ; $879a : $00
	.db $00                                                  ; $879b : $00
	.db $00                                                  ; $879c : $00
	.db $00                                                  ; $879d : $00
	.db $00                                                  ; $879e : $00
	.db $00                                                  ; $879f : $00
	.db $00                                                  ; $87a0 : $00
	.db $00                                                  ; $87a1 : $00
	.db $00                                                  ; $87a2 : $00
	.db $00                                                  ; $87a3 : $00
	.db $00                                                  ; $87a4 : $00
	.db $00                                                  ; $87a5 : $00
	.db $00                                                  ; $87a6 : $00
	.db $00                                                  ; $87a7 : $00
	.db $00                                                  ; $87a8 : $00
	.db $00                                                  ; $87a9 : $00
	.db $00                                                  ; $87aa : $00
	.db $00                                                  ; $87ab : $00
	.db $00                                                  ; $87ac : $00
	.db $00                                                  ; $87ad : $00
	.db $00                                                  ; $87ae : $00
	.db $00                                                  ; $87af : $00
	.db $00                                                  ; $87b0 : $00
	.db $00                                                  ; $87b1 : $00
	.db $00                                                  ; $87b2 : $00
	.db $00                                                  ; $87b3 : $00
	.db $00                                                  ; $87b4 : $00
	.db $00                                                  ; $87b5 : $00
	.db $00                                                  ; $87b6 : $00
	.db $00                                                  ; $87b7 : $00
	.db $00                                                  ; $87b8 : $00
	.db $00                                                  ; $87b9 : $00
	.db $00                                                  ; $87ba : $00
	.db $00                                                  ; $87bb : $00
	.db $00                                                  ; $87bc : $00
	.db $00                                                  ; $87bd : $00
	.db $00                                                  ; $87be : $00
	.db $00                                                  ; $87bf : $00
	.db $00                                                  ; $87c0 : $00
	.db $00                                                  ; $87c1 : $00
	.db $00                                                  ; $87c2 : $00
	.db $00                                                  ; $87c3 : $00
	.db $00                                                  ; $87c4 : $00
	.db $00                                                  ; $87c5 : $00
	.db $00                                                  ; $87c6 : $00
	.db $00                                                  ; $87c7 : $00
	.db $00                                                  ; $87c8 : $00
	.db $00                                                  ; $87c9 : $00
	.db $00                                                  ; $87ca : $00
	.db $00                                                  ; $87cb : $00
	.db $00                                                  ; $87cc : $00
	.db $00                                                  ; $87cd : $00
	.db $00                                                  ; $87ce : $00
	.db $00                                                  ; $87cf : $00
	.db $00                                                  ; $87d0 : $00
	.db $00                                                  ; $87d1 : $00
	.db $00                                                  ; $87d2 : $00
	.db $00                                                  ; $87d3 : $00
	.db $00                                                  ; $87d4 : $00
	.db $00                                                  ; $87d5 : $00
	.db $00                                                  ; $87d6 : $00
	.db $00                                                  ; $87d7 : $00
	.db $00                                                  ; $87d8 : $00
	.db $00                                                  ; $87d9 : $00
	.db $00                                                  ; $87da : $00
	.db $00                                                  ; $87db : $00
	.db $00                                                  ; $87dc : $00
	.db $00                                                  ; $87dd : $00
	.db $00                                                  ; $87de : $00
	.db $00                                                  ; $87df : $00
	.db $00                                                  ; $87e0 : $00
	.db $00                                                  ; $87e1 : $00
	.db $00                                                  ; $87e2 : $00
	.db $00                                                  ; $87e3 : $00
	.db $00                                                  ; $87e4 : $00
	.db $00                                                  ; $87e5 : $00
	.db $00                                                  ; $87e6 : $00
	.db $00                                                  ; $87e7 : $00
	.db $00                                                  ; $87e8 : $00
	.db $00                                                  ; $87e9 : $00
	.db $00                                                  ; $87ea : $00
	.db $00                                                  ; $87eb : $00
	.db $00                                                  ; $87ec : $00
	.db $00                                                  ; $87ed : $00
	.db $00                                                  ; $87ee : $00
	.db $00                                                  ; $87ef : $00
	.db $00                                                  ; $87f0 : $00
	.db $00                                                  ; $87f1 : $00
	.db $00                                                  ; $87f2 : $00
	.db $00                                                  ; $87f3 : $00
	.db $00                                                  ; $87f4 : $00
	.db $00                                                  ; $87f5 : $00
	.db $00                                                  ; $87f6 : $00
	.db $00                                                  ; $87f7 : $00
	.db $00                                                  ; $87f8 : $00
	.db $00                                                  ; $87f9 : $00
	.db $00                                                  ; $87fa : $00
	.db $00                                                  ; $87fb : $00
	.db $00                                                  ; $87fc : $00
	.db $00                                                  ; $87fd : $00
	.db $00                                                  ; $87fe : $00
	.db $00                                                  ; $87ff : $00
	.db $00                                                  ; $8800 : $00
	.db $00                                                  ; $8801 : $00
	.db $00                                                  ; $8802 : $00
	.db $00                                                  ; $8803 : $00
	.db $00                                                  ; $8804 : $00
	.db $00                                                  ; $8805 : $00
	.db $00                                                  ; $8806 : $00
	.db $00                                                  ; $8807 : $00
	.db $00                                                  ; $8808 : $00
	.db $00                                                  ; $8809 : $00
	.db $00                                                  ; $880a : $00
	.db $00                                                  ; $880b : $00
	.db $00                                                  ; $880c : $00
	.db $00                                                  ; $880d : $00
	.db $00                                                  ; $880e : $00
	.db $00                                                  ; $880f : $00
	.db $00                                                  ; $8810 : $00
	.db $00                                                  ; $8811 : $00
	.db $00                                                  ; $8812 : $00
	.db $00                                                  ; $8813 : $00
	.db $00                                                  ; $8814 : $00
	.db $00                                                  ; $8815 : $00
	.db $00                                                  ; $8816 : $00
	.db $00                                                  ; $8817 : $00
	.db $00                                                  ; $8818 : $00
	.db $00                                                  ; $8819 : $00
	.db $00                                                  ; $881a : $00
	.db $00                                                  ; $881b : $00
	.db $00                                                  ; $881c : $00
	.db $00                                                  ; $881d : $00
	.db $00                                                  ; $881e : $00
	.db $00                                                  ; $881f : $00
	.db $00                                                  ; $8820 : $00
	.db $00                                                  ; $8821 : $00
	.db $00                                                  ; $8822 : $00
	.db $00                                                  ; $8823 : $00
	.db $00                                                  ; $8824 : $00
	.db $00                                                  ; $8825 : $00
	.db $00                                                  ; $8826 : $00
	.db $00                                                  ; $8827 : $00
	.db $00                                                  ; $8828 : $00
	.db $00                                                  ; $8829 : $00
	.db $00                                                  ; $882a : $00
	.db $00                                                  ; $882b : $00
	.db $00                                                  ; $882c : $00
	.db $00                                                  ; $882d : $00
	.db $00                                                  ; $882e : $00
	.db $00                                                  ; $882f : $00
	.db $00                                                  ; $8830 : $00
	.db $00                                                  ; $8831 : $00
	.db $00                                                  ; $8832 : $00
	.db $00                                                  ; $8833 : $00
	.db $00                                                  ; $8834 : $00
	.db $00                                                  ; $8835 : $00
	.db $00                                                  ; $8836 : $00
	.db $00                                                  ; $8837 : $00
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
	jsr $f334.w                                                  ; $8842 : $20, $34, $f3
	bit $f4, X                                                  ; $8845 : $34, $f4
	bit $f5, X                                                  ; $8847 : $34, $f5
	bit $f6, X                                                  ; $8849 : $34, $f6
	bit $f7, X                                                  ; $884b : $34, $f7
	bit $f8, X                                                  ; $884d : $34, $f8
	bit $f9, X                                                  ; $884f : $34, $f9
	bit $fa, X                                                  ; $8851 : $34, $fa
	ora [$17], Y                                                  ; $8853 : $17, $17
	ora [$17], Y                                                  ; $8855 : $17, $17
	ora [$17], Y                                                  ; $8857 : $17, $17
	ora [$1c], Y                                                  ; $8859 : $17, $1c
	ora ($05, X)                                                  ; $885b : $01, $05
	ora ($44, X)                                                  ; $885d : $01, $44
	asl $9b                                                  ; $885f : $06, $9b
	ora [$60]                                                  ; $8861 : $07, $60
	ora #$02.b                                                  ; $8863 : $09, $02
	ora $0810.w, X                                                  ; $8865 : $1d, $10, $08
	ora ($48)                                                  ; $8868 : $12, $48
	lsr                                                  ; $886a : $4a
	ora [$00], Y                                                  ; $886b : $17, $00
	.db $00                                                  ; $886d : $00
	.db $00                                                  ; $886e : $00
	.db $00                                                  ; $886f : $00
	sbc $520006.l, X                                                  ; $8870 : $ff, $06, $00, $52
	ora $e234.w, Y                                                  ; $8874 : $19, $34, $e2
	and $27, X                                                  ; $8877 : $35, $27
	and $6c, X                                                  ; $8879 : $35, $6c
	stz $0001.w                                                  ; $887b : $9c, $01, $00
	bit $73, X                                                  ; $887e : $34, $73
	jmp ($0000.w)                                                  ; $8880 : $6c, $00, $00


	.db $00                                                  ; $8883 : $00
	.db $00                                                  ; $8884 : $00
	.db $00                                                  ; $8885 : $00
	.db $00                                                  ; $8886 : $00
	.db $00                                                  ; $8887 : $00
	.db $00                                                  ; $8888 : $00
	.db $00                                                  ; $8889 : $00
	.db $00                                                  ; $888a : $00
	.db $00                                                  ; $888b : $00
	.db $00                                                  ; $888c : $00
	.db $00                                                  ; $888d : $00
	.db $00                                                  ; $888e : $00
	.db $00                                                  ; $888f : $00
	.db $00                                                  ; $8890 : $00
	.db $00                                                  ; $8891 : $00
	.db $00                                                  ; $8892 : $00
	.db $00                                                  ; $8893 : $00
	.db $00                                                  ; $8894 : $00
	.db $00                                                  ; $8895 : $00
	.db $00                                                  ; $8896 : $00
	.db $00                                                  ; $8897 : $00
	.db $00                                                  ; $8898 : $00
	.db $00                                                  ; $8899 : $00
	.db $00                                                  ; $889a : $00
	.db $00                                                  ; $889b : $00
	.db $00                                                  ; $889c : $00
	.db $00                                                  ; $889d : $00
	.db $00                                                  ; $889e : $00
	.db $00                                                  ; $889f : $00
	.db $00                                                  ; $88a0 : $00
	.db $00                                                  ; $88a1 : $00
	.db $00                                                  ; $88a2 : $00
	.db $00                                                  ; $88a3 : $00
	.db $00                                                  ; $88a4 : $00
	.db $00                                                  ; $88a5 : $00
	.db $00                                                  ; $88a6 : $00
	.db $00                                                  ; $88a7 : $00
	.db $00                                                  ; $88a8 : $00
	.db $00                                                  ; $88a9 : $00
	.db $00                                                  ; $88aa : $00
	.db $00                                                  ; $88ab : $00
	.db $00                                                  ; $88ac : $00
	.db $00                                                  ; $88ad : $00
	.db $00                                                  ; $88ae : $00
	.db $00                                                  ; $88af : $00
	.db $00                                                  ; $88b0 : $00
	.db $00                                                  ; $88b1 : $00
	.db $00                                                  ; $88b2 : $00
	.db $00                                                  ; $88b3 : $00
	.db $00                                                  ; $88b4 : $00
	.db $00                                                  ; $88b5 : $00
	.db $00                                                  ; $88b6 : $00
	.db $00                                                  ; $88b7 : $00
	.db $00                                                  ; $88b8 : $00
	.db $00                                                  ; $88b9 : $00
	.db $00                                                  ; $88ba : $00
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
	.db $00                                                  ; $88ea : $00
	.db $00                                                  ; $88eb : $00
	.db $00                                                  ; $88ec : $00
	.db $00                                                  ; $88ed : $00
	.db $00                                                  ; $88ee : $00
	.db $00                                                  ; $88ef : $00
	.db $00                                                  ; $88f0 : $00
	.db $00                                                  ; $88f1 : $00
	.db $00                                                  ; $88f2 : $00
	.db $00                                                  ; $88f3 : $00
	.db $00                                                  ; $88f4 : $00
	.db $00                                                  ; $88f5 : $00
	.db $00                                                  ; $88f6 : $00
	.db $00                                                  ; $88f7 : $00
	.db $00                                                  ; $88f8 : $00
	.db $00                                                  ; $88f9 : $00
	.db $00                                                  ; $88fa : $00
	.db $00                                                  ; $88fb : $00
	.db $00                                                  ; $88fc : $00
	.db $00                                                  ; $88fd : $00
	.db $00                                                  ; $88fe : $00
	.db $00                                                  ; $88ff : $00
	.db $00                                                  ; $8900 : $00
	.db $00                                                  ; $8901 : $00
	.db $00                                                  ; $8902 : $00
	.db $00                                                  ; $8903 : $00
	.db $00                                                  ; $8904 : $00
	.db $00                                                  ; $8905 : $00
	.db $00                                                  ; $8906 : $00
	.db $00                                                  ; $8907 : $00
	.db $00                                                  ; $8908 : $00
	.db $00                                                  ; $8909 : $00
	.db $00                                                  ; $890a : $00
	.db $00                                                  ; $890b : $00
	.db $00                                                  ; $890c : $00
	.db $00                                                  ; $890d : $00
	.db $00                                                  ; $890e : $00
	.db $00                                                  ; $890f : $00
	.db $00                                                  ; $8910 : $00
	.db $00                                                  ; $8911 : $00
	.db $00                                                  ; $8912 : $00
	.db $00                                                  ; $8913 : $00
	.db $00                                                  ; $8914 : $00
	.db $00                                                  ; $8915 : $00
	.db $00                                                  ; $8916 : $00
	.db $00                                                  ; $8917 : $00
	.db $00                                                  ; $8918 : $00
	.db $00                                                  ; $8919 : $00
	.db $00                                                  ; $891a : $00
	.db $00                                                  ; $891b : $00
	.db $00                                                  ; $891c : $00
	.db $00                                                  ; $891d : $00
	.db $00                                                  ; $891e : $00
	.db $00                                                  ; $891f : $00
	.db $00                                                  ; $8920 : $00
	.db $00                                                  ; $8921 : $00
	.db $00                                                  ; $8922 : $00
	.db $00                                                  ; $8923 : $00
	.db $00                                                  ; $8924 : $00
	.db $00                                                  ; $8925 : $00
	.db $00                                                  ; $8926 : $00
	.db $00                                                  ; $8927 : $00
	.db $00                                                  ; $8928 : $00
	.db $00                                                  ; $8929 : $00
	.db $00                                                  ; $892a : $00
	.db $00                                                  ; $892b : $00
	.db $00                                                  ; $892c : $00
	.db $00                                                  ; $892d : $00
	.db $00                                                  ; $892e : $00
	.db $00                                                  ; $892f : $00
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
	.db $00                                                  ; $893a : $00
	.db $00                                                  ; $893b : $00
	.db $00                                                  ; $893c : $00
	.db $00                                                  ; $893d : $00
	.db $00                                                  ; $893e : $00
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
	.db $00                                                  ; $894e : $00
	.db $00                                                  ; $894f : $00
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
	.db $00                                                  ; $895e : $00
	.db $00                                                  ; $895f : $00
	.db $00                                                  ; $8960 : $00
	jsr $f334.w                                                  ; $8961 : $20, $34, $f3
	bit $f4, X                                                  ; $8964 : $34, $f4
	bit $f5, X                                                  ; $8966 : $34, $f5
	bit $f6, X                                                  ; $8968 : $34, $f6
	bit $f7, X                                                  ; $896a : $34, $f7
	bit $f8, X                                                  ; $896c : $34, $f8
	bit $f9, X                                                  ; $896e : $34, $f9
	and $10, X                                                  ; $8970 : $35, $10
	ora [$17], Y                                                  ; $8972 : $17, $17
	ora [$17], Y                                                  ; $8974 : $17, $17
	ora [$17], Y                                                  ; $8976 : $17, $17
	trb $0501.w                                                  ; $8978 : $1c, $01, $05
	ora ($20, X)                                                  ; $897b : $01, $20
	asl $ff                                                  ; $897d : $06, $ff
	ora [$1c]                                                  ; $897f : $07, $1c
	ora #$03.b                                                  ; $8981 : $09, $03
	php                                                  ; $8983 : $08
	tsb $001a.w                                                  ; $8984 : $0c, $1a, $00
	rti                                                  ; $8987 : $40


	ina                                                  ; $8988 : $1a
	cop $7f.b                                                  ; $8989 : $02, $7f
	ora $fa10.w, X                                                  ; $898b : $1d, $10, $fa
	ora [$1c], Y                                                  ; $898e : $17, $1c
	ora ($05, X)                                                  ; $8990 : $01, $05
	ora ($20, X)                                                  ; $8992 : $01, $20
	asl $ff                                                  ; $8994 : $06, $ff
	ora [$20]                                                  ; $8996 : $07, $20
	ora #$03.b                                                  ; $8998 : $09, $03
	php                                                  ; $899a : $08
	tsb $1a                                                  ; $899b : $04, $1a
	.db $00                                                  ; $899d : $00
	ora $1a, X                                                  ; $899e : $15, $1a
	cop $03.b                                                  ; $89a0 : $02, $03
	ora $fa10.w, X                                                  ; $89a2 : $1d, $10, $fa
	ora [$20], Y                                                  ; $89a5 : $17, $20
	and $38, X                                                  ; $89a7 : $35, $38
	and $39, X                                                  ; $89a9 : $35, $39
	and $3a, X                                                  ; $89ab : $35, $3a
	and $3b, X                                                  ; $89ad : $35, $3b
	and $3c, X                                                  ; $89af : $35, $3c
	and $3d, X                                                  ; $89b1 : $35, $3d
	and $3e, X                                                  ; $89b3 : $35, $3e
	and $55, X                                                  ; $89b5 : $35, $55
	ora [$17], Y                                                  ; $89b7 : $17, $17
	ora [$17], Y                                                  ; $89b9 : $17, $17
	ora [$17], Y                                                  ; $89bb : $17, $17
	trb $0501.w                                                  ; $89bd : $1c, $01, $05
	ora ($00, X)                                                  ; $89c0 : $01, $00
	asl $ff                                                  ; $89c2 : $06, $ff
	ora [$1c]                                                  ; $89c4 : $07, $1c
	ora #$03.b                                                  ; $89c6 : $09, $03
	php                                                  ; $89c8 : $08
	tsb $001a.w                                                  ; $89c9 : $0c, $1a, $00
	rti                                                  ; $89cc : $40


	ina                                                  ; $89cd : $1a
	cop $7f.b                                                  ; $89ce : $02, $7f
	ora $fa10.w, X                                                  ; $89d0 : $1d, $10, $fa
	ora [$1c], Y                                                  ; $89d3 : $17, $1c
	ora ($05, X)                                                  ; $89d5 : $01, $05
	ora ($00, X)                                                  ; $89d7 : $01, $00
	asl $ff                                                  ; $89d9 : $06, $ff
	ora [$20]                                                  ; $89db : $07, $20
	ora #$03.b                                                  ; $89dd : $09, $03
	ora $1a40.w                                                  ; $89df : $0d, $40, $1a
	.db $00                                                  ; $89e2 : $00

br_0c_89e3:
	ora $1a, X                                                  ; $89e3 : $15, $1a
	cop $03.b                                                  ; $89e5 : $02, $03
	php                                                  ; $89e7 : $08
	tsb $fa                                                  ; $89e8 : $04, $fa
	ora [$20], Y                                                  ; $89ea : $17, $20
	and $7d, X                                                  ; $89ec : $35, $7d
	and $7e, X                                                  ; $89ee : $35, $7e
	and $7f, X                                                  ; $89f0 : $35, $7f
	and $80, X                                                  ; $89f2 : $35, $80
	and $81, X                                                  ; $89f4 : $35, $81
	and $82, X                                                  ; $89f6 : $35, $82
	and $83, X                                                  ; $89f8 : $35, $83
	and $84, X                                                  ; $89fa : $35, $84
	ora [$17], Y                                                  ; $89fc : $17, $17
	ora [$17], Y                                                  ; $89fe : $17, $17
	ora [$17], Y                                                  ; $8a00 : $17, $17
	ora [$1c], Y                                                  ; $8a02 : $17, $1c
	ora ($05, X)                                                  ; $8a04 : $01, $05
	ora ($00, X)                                                  ; $8a06 : $01, $00
	asl $10                                                  ; $8a08 : $06, $10
	ora [$30]                                                  ; $8a0a : $07, $30
	ora #$04.b                                                  ; $8a0c : $09, $04
	ora $0818.w, X                                                  ; $8a0e : $1d, $18, $08
	trb $4f03.w                                                  ; $8a11 : $1c, $03, $4f
	ora [$2a]                                                  ; $8a14 : $07, $2a
	eor $4f2007.l                                                  ; $8a16 : $4f, $07, $20, $4f
	ora [$00], Y                                                  ; $8a1a : $17, $00
	.db $00                                                  ; $8a1c : $00
	.db $00                                                  ; $8a1d : $00
	.db $00                                                  ; $8a1e : $00
	sbc $52000a.l, X                                                  ; $8a1f : $ff, $0a, $00, $52
	ora $e234.w, Y                                                  ; $8a23 : $19, $34, $e2
	and $0b, X                                                  ; $8a26 : $35, $0b
	and $44, X                                                  ; $8a28 : $35, $44
	and $71, X                                                  ; $8a2a : $35, $71
	and $a2, X                                                  ; $8a2c : $35, $a2
	phx                                                  ; $8a2e : $da
	ora ($00, X)                                                  ; $8a2f : $01, $00
	bit $75, X                                                  ; $8a31 : $34, $75
	jmp ($0000.w)                                                  ; $8a33 : $6c, $00, $00


	.db $00                                                  ; $8a36 : $00
	.db $00                                                  ; $8a37 : $00
	.db $00                                                  ; $8a38 : $00
	.db $00                                                  ; $8a39 : $00
	.db $00                                                  ; $8a3a : $00
	.db $00                                                  ; $8a3b : $00
	.db $00                                                  ; $8a3c : $00
	.db $00                                                  ; $8a3d : $00
	.db $00                                                  ; $8a3e : $00
	.db $00                                                  ; $8a3f : $00
	.db $00                                                  ; $8a40 : $00
	.db $00                                                  ; $8a41 : $00
	.db $00                                                  ; $8a42 : $00
	.db $00                                                  ; $8a43 : $00
	.db $00                                                  ; $8a44 : $00
	.db $00                                                  ; $8a45 : $00
	.db $00                                                  ; $8a46 : $00
	.db $00                                                  ; $8a47 : $00
	.db $00                                                  ; $8a48 : $00
	.db $00                                                  ; $8a49 : $00
	.db $00                                                  ; $8a4a : $00
	.db $00                                                  ; $8a4b : $00
	.db $00                                                  ; $8a4c : $00
	.db $00                                                  ; $8a4d : $00
	.db $00                                                  ; $8a4e : $00
	.db $00                                                  ; $8a4f : $00
	.db $00                                                  ; $8a50 : $00
	.db $00                                                  ; $8a51 : $00
	.db $00                                                  ; $8a52 : $00
	.db $00                                                  ; $8a53 : $00
	.db $00                                                  ; $8a54 : $00
	.db $00                                                  ; $8a55 : $00
	.db $00                                                  ; $8a56 : $00
	.db $00                                                  ; $8a57 : $00
	.db $00                                                  ; $8a58 : $00
	.db $00                                                  ; $8a59 : $00
	.db $00                                                  ; $8a5a : $00
	.db $00                                                  ; $8a5b : $00
	.db $00                                                  ; $8a5c : $00
	.db $00                                                  ; $8a5d : $00
	.db $00                                                  ; $8a5e : $00
	.db $00                                                  ; $8a5f : $00
	.db $00                                                  ; $8a60 : $00
	.db $00                                                  ; $8a61 : $00
	.db $00                                                  ; $8a62 : $00
	.db $00                                                  ; $8a63 : $00
	.db $00                                                  ; $8a64 : $00
	.db $00                                                  ; $8a65 : $00
	.db $00                                                  ; $8a66 : $00
	.db $00                                                  ; $8a67 : $00
	.db $00                                                  ; $8a68 : $00
	.db $00                                                  ; $8a69 : $00
	.db $00                                                  ; $8a6a : $00
	.db $00                                                  ; $8a6b : $00
	.db $00                                                  ; $8a6c : $00
	.db $00                                                  ; $8a6d : $00
	.db $00                                                  ; $8a6e : $00
	.db $00                                                  ; $8a6f : $00
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
	.db $00                                                  ; $8a7a : $00
	.db $00                                                  ; $8a7b : $00
	.db $00                                                  ; $8a7c : $00
	.db $00                                                  ; $8a7d : $00
	.db $00                                                  ; $8a7e : $00
	.db $00                                                  ; $8a7f : $00
	.db $00                                                  ; $8a80 : $00
	.db $00                                                  ; $8a81 : $00
	.db $00                                                  ; $8a82 : $00
	.db $00                                                  ; $8a83 : $00
	.db $00                                                  ; $8a84 : $00
	.db $00                                                  ; $8a85 : $00
	.db $00                                                  ; $8a86 : $00
	.db $00                                                  ; $8a87 : $00
	.db $00                                                  ; $8a88 : $00
	.db $00                                                  ; $8a89 : $00
	.db $00                                                  ; $8a8a : $00
	.db $00                                                  ; $8a8b : $00
	.db $00                                                  ; $8a8c : $00
	.db $00                                                  ; $8a8d : $00
	.db $00                                                  ; $8a8e : $00
	.db $00                                                  ; $8a8f : $00
	.db $00                                                  ; $8a90 : $00
	.db $00                                                  ; $8a91 : $00
	.db $00                                                  ; $8a92 : $00
	.db $00                                                  ; $8a93 : $00
	.db $00                                                  ; $8a94 : $00
	.db $00                                                  ; $8a95 : $00
	.db $00                                                  ; $8a96 : $00
	.db $00                                                  ; $8a97 : $00
	.db $00                                                  ; $8a98 : $00
	.db $00                                                  ; $8a99 : $00
	.db $00                                                  ; $8a9a : $00
	.db $00                                                  ; $8a9b : $00
	.db $00                                                  ; $8a9c : $00
	.db $00                                                  ; $8a9d : $00
	.db $00                                                  ; $8a9e : $00
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
	.db $00                                                  ; $8aae : $00
	.db $00                                                  ; $8aaf : $00
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
	.db $00                                                  ; $8abe : $00
	.db $00                                                  ; $8abf : $00
	.db $00                                                  ; $8ac0 : $00
	.db $00                                                  ; $8ac1 : $00
	.db $00                                                  ; $8ac2 : $00
	.db $00                                                  ; $8ac3 : $00
	.db $00                                                  ; $8ac4 : $00
	.db $00                                                  ; $8ac5 : $00
	.db $00                                                  ; $8ac6 : $00
	.db $00                                                  ; $8ac7 : $00
	.db $00                                                  ; $8ac8 : $00
	.db $00                                                  ; $8ac9 : $00
	.db $00                                                  ; $8aca : $00
	.db $00                                                  ; $8acb : $00
	.db $00                                                  ; $8acc : $00
	.db $00                                                  ; $8acd : $00
	.db $00                                                  ; $8ace : $00
	.db $00                                                  ; $8acf : $00
	.db $00                                                  ; $8ad0 : $00
	.db $00                                                  ; $8ad1 : $00
	.db $00                                                  ; $8ad2 : $00
	.db $00                                                  ; $8ad3 : $00
	.db $00                                                  ; $8ad4 : $00
	.db $00                                                  ; $8ad5 : $00
	.db $00                                                  ; $8ad6 : $00
	.db $00                                                  ; $8ad7 : $00
	.db $00                                                  ; $8ad8 : $00
	.db $00                                                  ; $8ad9 : $00
	.db $00                                                  ; $8ada : $00
	.db $00                                                  ; $8adb : $00
	.db $00                                                  ; $8adc : $00
	.db $00                                                  ; $8add : $00
	.db $00                                                  ; $8ade : $00
	.db $00                                                  ; $8adf : $00
	.db $00                                                  ; $8ae0 : $00
	.db $00                                                  ; $8ae1 : $00
	.db $00                                                  ; $8ae2 : $00
	.db $00                                                  ; $8ae3 : $00
	.db $00                                                  ; $8ae4 : $00
	.db $00                                                  ; $8ae5 : $00
	.db $00                                                  ; $8ae6 : $00
	.db $00                                                  ; $8ae7 : $00
	.db $00                                                  ; $8ae8 : $00
	.db $00                                                  ; $8ae9 : $00
	.db $00                                                  ; $8aea : $00
	.db $00                                                  ; $8aeb : $00
	.db $00                                                  ; $8aec : $00
	.db $00                                                  ; $8aed : $00
	.db $00                                                  ; $8aee : $00
	.db $00                                                  ; $8aef : $00
	.db $00                                                  ; $8af0 : $00
	.db $00                                                  ; $8af1 : $00
	.db $00                                                  ; $8af2 : $00
	.db $00                                                  ; $8af3 : $00
	.db $00                                                  ; $8af4 : $00
	.db $00                                                  ; $8af5 : $00
	.db $00                                                  ; $8af6 : $00
	.db $00                                                  ; $8af7 : $00
	.db $00                                                  ; $8af8 : $00
	.db $00                                                  ; $8af9 : $00
	.db $00                                                  ; $8afa : $00
	.db $00                                                  ; $8afb : $00
	.db $00                                                  ; $8afc : $00
	.db $00                                                  ; $8afd : $00
	.db $00                                                  ; $8afe : $00
	.db $00                                                  ; $8aff : $00
	.db $00                                                  ; $8b00 : $00
	.db $00                                                  ; $8b01 : $00
	.db $00                                                  ; $8b02 : $00
	.db $00                                                  ; $8b03 : $00
	.db $00                                                  ; $8b04 : $00
	.db $00                                                  ; $8b05 : $00
	.db $00                                                  ; $8b06 : $00
	.db $00                                                  ; $8b07 : $00
	.db $00                                                  ; $8b08 : $00
	.db $00                                                  ; $8b09 : $00
	.db $00                                                  ; $8b0a : $00
	.db $00                                                  ; $8b0b : $00
	.db $00                                                  ; $8b0c : $00
	.db $00                                                  ; $8b0d : $00
	.db $00                                                  ; $8b0e : $00
	.db $00                                                  ; $8b0f : $00
	.db $00                                                  ; $8b10 : $00
	.db $00                                                  ; $8b11 : $00
	.db $00                                                  ; $8b12 : $00
	.db $00                                                  ; $8b13 : $00
	jsr $f334.w                                                  ; $8b14 : $20, $34, $f3
	bit $f4, X                                                  ; $8b17 : $34, $f4
	bit $f5, X                                                  ; $8b19 : $34, $f5
	bit $f6, X                                                  ; $8b1b : $34, $f6
	bit $f7, X                                                  ; $8b1d : $34, $f7
	bit $f8, X                                                  ; $8b1f : $34, $f8
	bit $f9, X                                                  ; $8b21 : $34, $f9
	and $0a, X                                                  ; $8b23 : $35, $0a
	ora [$17], Y                                                  ; $8b25 : $17, $17
	ora [$17], Y                                                  ; $8b27 : $17, $17
	ora [$17], Y                                                  ; $8b29 : $17, $17
	trb $0501.w                                                  ; $8b2b : $1c, $01, $05
	cop $50.b                                                  ; $8b2e : $02, $50
	asl $70                                                  ; $8b30 : $06, $70
	ora [$48]                                                  ; $8b32 : $07, $48
	ora $0819.w, X                                                  ; $8b34 : $1d, $19, $08
	ora ($09), Y                                                  ; $8b37 : $11, $09
	ora $a9, S                                                  ; $8b39 : $03, $a9
	ora [$17], Y                                                  ; $8b3b : $17, $17
	jsr $1c35.w                                                  ; $8b3d : $20, $35, $1c
	and $1d, X                                                  ; $8b40 : $35, $1d
	and $1e, X                                                  ; $8b42 : $35, $1e
	and $1f, X                                                  ; $8b44 : $35, $1f
	and $20, X                                                  ; $8b46 : $35, $20
	and $21, X                                                  ; $8b48 : $35, $21
	and $22, X                                                  ; $8b4a : $35, $22
	and $23, X                                                  ; $8b4c : $35, $23
	ora [$17], Y                                                  ; $8b4e : $17, $17
	ora [$17], Y                                                  ; $8b50 : $17, $17
	ora [$17], Y                                                  ; $8b52 : $17, $17
	ora [$05], Y                                                  ; $8b54 : $17, $05
	cop $7f.b                                                  ; $8b56 : $02, $7f
	asl $79                                                  ; $8b58 : $06, $79
	ora [$52]                                                  ; $8b5a : $07, $52
	ora #$03.b                                                  ; $8b5c : $09, $03
	ora $081f.w, X                                                  ; $8b5e : $1d, $1f, $08
	ora ($01)                                                  ; $8b61 : $12, $01
	and $0103.w, X                                                  ; $8b63 : $3d, $03, $01
	rol                                                  ; $8b66 : $2a
	ina                                                  ; $8b67 : $1a
	.db $00                                                  ; $8b68 : $00
	and $1a, S                                                  ; $8b69 : $23, $1a
	cop $ff.b                                                  ; $8b6b : $02, $ff
	php                                                  ; $8b6d : $08
	phd                                                  ; $8b6e : $0b
	ora ($32, X)                                                  ; $8b6f : $01, $32
	ora $017f.w                                                  ; $8b71 : $0d, $7f, $01
	wdm                                                  ; $8b74 : $42
	ora [$20], Y                                                  ; $8b75 : $17, $20
	and $55, X                                                  ; $8b77 : $35, $55
	and $56, X                                                  ; $8b79 : $35, $56
	and $57, X                                                  ; $8b7b : $35, $57
	and $58, X                                                  ; $8b7d : $35, $58
	and $59, X                                                  ; $8b7f : $35, $59
	and $5a, X                                                  ; $8b81 : $35, $5a
	and $5b, X                                                  ; $8b83 : $35, $5b
	and $5c, X                                                  ; $8b85 : $35, $5c
	ora [$17], Y                                                  ; $8b87 : $17, $17
	ora [$17], Y                                                  ; $8b89 : $17, $17
	ora [$17], Y                                                  ; $8b8b : $17, $17
	ora [$1c], Y                                                  ; $8b8d : $17, $1c
	ora ($05, X)                                                  ; $8b8f : $01, $05
	cop $ca.b                                                  ; $8b91 : $02, $ca
	asl $50                                                  ; $8b93 : $06, $50
	ora #$03.b                                                  ; $8b95 : $09, $03
	ora [$30]                                                  ; $8b97 : $07, $30
	ina                                                  ; $8b99 : $1a
	cop $18.b                                                  ; $8b9a : $02, $18
	ina                                                  ; $8b9c : $1a
	.db $00                                                  ; $8b9d : $00
	clc                                                  ; $8b9e : $18
	php                                                  ; $8b9f : $08
	cop $f8.b                                                  ; $8ba0 : $02, $f8
	ora [$20], Y                                                  ; $8ba2 : $17, $20
	and $82, X                                                  ; $8ba4 : $35, $82
	and $83, X                                                  ; $8ba6 : $35, $83
	and $84, X                                                  ; $8ba8 : $35, $84
	and $85, X                                                  ; $8baa : $35, $85
	and $86, X                                                  ; $8bac : $35, $86
	and $87, X                                                  ; $8bae : $35, $87
	and $88, X                                                  ; $8bb0 : $35, $88
	and $89, X                                                  ; $8bb2 : $35, $89
	ora [$17], Y                                                  ; $8bb4 : $17, $17
	ora [$17], Y                                                  ; $8bb6 : $17, $17
	ora [$17], Y                                                  ; $8bb8 : $17, $17
	ora [$05], Y                                                  ; $8bba : $17, $05
	ora ($10, X)                                                  ; $8bbc : $01, $10
	asl $20                                                  ; $8bbe : $06, $20
	ora [$69]                                                  ; $8bc0 : $07, $69
	ora #$02.b                                                  ; $8bc2 : $09, $02
	ora $0814.w, X                                                  ; $8bc4 : $1d, $14, $08
	phd                                                  ; $8bc7 : $0b
	ora $0d, S                                                  ; $8bc8 : $03, $0d
	adc $0d7201.l, X                                                  ; $8bca : $7f, $01, $72, $0d
	adc $01041d.l, X                                                  ; $8bce : $7f, $1d, $04, $01
	rol $17, X                                                  ; $8bd2 : $36, $17
	jsr $b335.w                                                  ; $8bd4 : $20, $35, $b3
	and $b4, X                                                  ; $8bd7 : $35, $b4
	and $b5, X                                                  ; $8bd9 : $35, $b5
	and $b6, X                                                  ; $8bdb : $35, $b6
	and $b7, X                                                  ; $8bdd : $35, $b7
	and $b8, X                                                  ; $8bdf : $35, $b8
	and $b9, X                                                  ; $8be1 : $35, $b9
	and $ba, X                                                  ; $8be3 : $35, $ba
	ora [$17], Y                                                  ; $8be5 : $17, $17
	ora [$17], Y                                                  ; $8be7 : $17, $17
	ora [$17], Y                                                  ; $8be9 : $17, $17
	ora [$1c], Y                                                  ; $8beb : $17, $1c
	ora ($05, X)                                                  ; $8bed : $01, $05
	.db $00                                                  ; $8bef : $00
	rts                                                  ; $8bf0 : $60


	asl $af                                                  ; $8bf1 : $06, $af
	ora [$60]                                                  ; $8bf3 : $07, $60
	ora #$01.b                                                  ; $8bf5 : $09, $01
	ina                                                  ; $8bf7 : $1a
	.db $00                                                  ; $8bf8 : $00
	.db $30, $1a                                                  ; $8bf9 : $30, $1a

	cop $e0.b                                                  ; $8bfb : $02, $e0
	ora $081f.w, X                                                  ; $8bfd : $1d, $1f, $08
	asl $6804.w                                                  ; $8c00 : $0e, $04, $68
	plp                                                  ; $8c03 : $28
	rol $21                                                  ; $8c04 : $26, $21
	ora $36, S                                                  ; $8c06 : $03, $36
	and ($31)                                                  ; $8c08 : $32, $31
	and $0017.w                                                  ; $8c0a : $2d, $17, $00
	.db $00                                                  ; $8c0d : $00
	.db $00                                                  ; $8c0e : $00
	.db $00                                                  ; $8c0f : $00
	sbc $520008.l, X                                                  ; $8c10 : $ff, $08, $00, $52
	ora $e234.w, Y                                                  ; $8c14 : $19, $34, $e2
	and $10, X                                                  ; $8c17 : $35, $10
	and $3b, X                                                  ; $8c19 : $35, $3b
	and $87, X                                                  ; $8c1b : $35, $87
	rep #$01.b                                                  ; $8c1d : $c2, $01
	.db $00                                                  ; $8c1f : $00
	bit $74, X                                                  ; $8c20 : $34, $74
	jmp ($0000.w)                                                  ; $8c22 : $6c, $00, $00


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
	.db $00                                                  ; $8c2f : $00
	.db $00                                                  ; $8c30 : $00
	.db $00                                                  ; $8c31 : $00
	.db $00                                                  ; $8c32 : $00
	.db $00                                                  ; $8c33 : $00
	.db $00                                                  ; $8c34 : $00
	.db $00                                                  ; $8c35 : $00
	.db $00                                                  ; $8c36 : $00
	.db $00                                                  ; $8c37 : $00
	.db $00                                                  ; $8c38 : $00
	.db $00                                                  ; $8c39 : $00
	.db $00                                                  ; $8c3a : $00
	.db $00                                                  ; $8c3b : $00
	.db $00                                                  ; $8c3c : $00
	.db $00                                                  ; $8c3d : $00
	.db $00                                                  ; $8c3e : $00
	.db $00                                                  ; $8c3f : $00
	.db $00                                                  ; $8c40 : $00
	.db $00                                                  ; $8c41 : $00
	.db $00                                                  ; $8c42 : $00
	.db $00                                                  ; $8c43 : $00
	.db $00                                                  ; $8c44 : $00
	.db $00                                                  ; $8c45 : $00
	.db $00                                                  ; $8c46 : $00
	.db $00                                                  ; $8c47 : $00
	.db $00                                                  ; $8c48 : $00
	.db $00                                                  ; $8c49 : $00
	.db $00                                                  ; $8c4a : $00
	.db $00                                                  ; $8c4b : $00
	.db $00                                                  ; $8c4c : $00
	.db $00                                                  ; $8c4d : $00
	.db $00                                                  ; $8c4e : $00
	.db $00                                                  ; $8c4f : $00
	.db $00                                                  ; $8c50 : $00
	.db $00                                                  ; $8c51 : $00
	.db $00                                                  ; $8c52 : $00
	.db $00                                                  ; $8c53 : $00
	.db $00                                                  ; $8c54 : $00
	.db $00                                                  ; $8c55 : $00
	.db $00                                                  ; $8c56 : $00
	.db $00                                                  ; $8c57 : $00
	.db $00                                                  ; $8c58 : $00
	.db $00                                                  ; $8c59 : $00
	.db $00                                                  ; $8c5a : $00
	.db $00                                                  ; $8c5b : $00
	.db $00                                                  ; $8c5c : $00
	.db $00                                                  ; $8c5d : $00
	.db $00                                                  ; $8c5e : $00
	.db $00                                                  ; $8c5f : $00
	.db $00                                                  ; $8c60 : $00
	.db $00                                                  ; $8c61 : $00
	.db $00                                                  ; $8c62 : $00
	.db $00                                                  ; $8c63 : $00
	.db $00                                                  ; $8c64 : $00
	.db $00                                                  ; $8c65 : $00
	.db $00                                                  ; $8c66 : $00
	.db $00                                                  ; $8c67 : $00
	.db $00                                                  ; $8c68 : $00
	.db $00                                                  ; $8c69 : $00
	.db $00                                                  ; $8c6a : $00
	.db $00                                                  ; $8c6b : $00
	.db $00                                                  ; $8c6c : $00
	.db $00                                                  ; $8c6d : $00
	.db $00                                                  ; $8c6e : $00
	.db $00                                                  ; $8c6f : $00
	.db $00                                                  ; $8c70 : $00
	.db $00                                                  ; $8c71 : $00
	.db $00                                                  ; $8c72 : $00
	.db $00                                                  ; $8c73 : $00
	.db $00                                                  ; $8c74 : $00
	.db $00                                                  ; $8c75 : $00
	.db $00                                                  ; $8c76 : $00
	.db $00                                                  ; $8c77 : $00
	.db $00                                                  ; $8c78 : $00
	.db $00                                                  ; $8c79 : $00
	.db $00                                                  ; $8c7a : $00
	.db $00                                                  ; $8c7b : $00
	.db $00                                                  ; $8c7c : $00
	.db $00                                                  ; $8c7d : $00
	.db $00                                                  ; $8c7e : $00
	.db $00                                                  ; $8c7f : $00
	.db $00                                                  ; $8c80 : $00
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
	.db $00                                                  ; $8c8e : $00
	.db $00                                                  ; $8c8f : $00
	.db $00                                                  ; $8c90 : $00
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
	.db $00                                                  ; $8c9f : $00
	.db $00                                                  ; $8ca0 : $00
	.db $00                                                  ; $8ca1 : $00
	.db $00                                                  ; $8ca2 : $00
	.db $00                                                  ; $8ca3 : $00
	.db $00                                                  ; $8ca4 : $00
	.db $00                                                  ; $8ca5 : $00
	.db $00                                                  ; $8ca6 : $00
	.db $00                                                  ; $8ca7 : $00
	.db $00                                                  ; $8ca8 : $00
	.db $00                                                  ; $8ca9 : $00
	.db $00                                                  ; $8caa : $00
	.db $00                                                  ; $8cab : $00
	.db $00                                                  ; $8cac : $00
	.db $00                                                  ; $8cad : $00
	.db $00                                                  ; $8cae : $00
	.db $00                                                  ; $8caf : $00
	.db $00                                                  ; $8cb0 : $00
	.db $00                                                  ; $8cb1 : $00
	.db $00                                                  ; $8cb2 : $00
	.db $00                                                  ; $8cb3 : $00
	.db $00                                                  ; $8cb4 : $00
	.db $00                                                  ; $8cb5 : $00
	.db $00                                                  ; $8cb6 : $00
	.db $00                                                  ; $8cb7 : $00
	.db $00                                                  ; $8cb8 : $00
	.db $00                                                  ; $8cb9 : $00
	.db $00                                                  ; $8cba : $00
	.db $00                                                  ; $8cbb : $00
	.db $00                                                  ; $8cbc : $00
	.db $00                                                  ; $8cbd : $00
	.db $00                                                  ; $8cbe : $00
	.db $00                                                  ; $8cbf : $00
	.db $00                                                  ; $8cc0 : $00
	.db $00                                                  ; $8cc1 : $00
	.db $00                                                  ; $8cc2 : $00
	.db $00                                                  ; $8cc3 : $00
	.db $00                                                  ; $8cc4 : $00
	.db $00                                                  ; $8cc5 : $00
	.db $00                                                  ; $8cc6 : $00
	.db $00                                                  ; $8cc7 : $00
	.db $00                                                  ; $8cc8 : $00
	.db $00                                                  ; $8cc9 : $00
	.db $00                                                  ; $8cca : $00
	.db $00                                                  ; $8ccb : $00
	.db $00                                                  ; $8ccc : $00
	.db $00                                                  ; $8ccd : $00
	.db $00                                                  ; $8cce : $00
	.db $00                                                  ; $8ccf : $00
	.db $00                                                  ; $8cd0 : $00
	.db $00                                                  ; $8cd1 : $00
	.db $00                                                  ; $8cd2 : $00
	.db $00                                                  ; $8cd3 : $00
	.db $00                                                  ; $8cd4 : $00
	.db $00                                                  ; $8cd5 : $00
	.db $00                                                  ; $8cd6 : $00
	.db $00                                                  ; $8cd7 : $00
	.db $00                                                  ; $8cd8 : $00
	.db $00                                                  ; $8cd9 : $00
	.db $00                                                  ; $8cda : $00
	.db $00                                                  ; $8cdb : $00
	.db $00                                                  ; $8cdc : $00
	.db $00                                                  ; $8cdd : $00
	.db $00                                                  ; $8cde : $00
	.db $00                                                  ; $8cdf : $00
	.db $00                                                  ; $8ce0 : $00
	.db $00                                                  ; $8ce1 : $00
	.db $00                                                  ; $8ce2 : $00
	.db $00                                                  ; $8ce3 : $00
	.db $00                                                  ; $8ce4 : $00
	.db $00                                                  ; $8ce5 : $00
	.db $00                                                  ; $8ce6 : $00
	.db $00                                                  ; $8ce7 : $00
	.db $00                                                  ; $8ce8 : $00
	.db $00                                                  ; $8ce9 : $00
	.db $00                                                  ; $8cea : $00
	.db $00                                                  ; $8ceb : $00
	.db $00                                                  ; $8cec : $00
	.db $00                                                  ; $8ced : $00
	.db $00                                                  ; $8cee : $00
	.db $00                                                  ; $8cef : $00
	.db $00                                                  ; $8cf0 : $00
	.db $00                                                  ; $8cf1 : $00
	.db $00                                                  ; $8cf2 : $00
	.db $00                                                  ; $8cf3 : $00
	.db $00                                                  ; $8cf4 : $00
	.db $00                                                  ; $8cf5 : $00
	.db $00                                                  ; $8cf6 : $00
	.db $00                                                  ; $8cf7 : $00
	.db $00                                                  ; $8cf8 : $00
	.db $00                                                  ; $8cf9 : $00
	.db $00                                                  ; $8cfa : $00
	.db $00                                                  ; $8cfb : $00
	.db $00                                                  ; $8cfc : $00
	.db $00                                                  ; $8cfd : $00
	.db $00                                                  ; $8cfe : $00
	.db $00                                                  ; $8cff : $00
	.db $00                                                  ; $8d00 : $00
	.db $00                                                  ; $8d01 : $00
	.db $00                                                  ; $8d02 : $00
	jsr $f334.w                                                  ; $8d03 : $20, $34, $f3
	bit $f4, X                                                  ; $8d06 : $34, $f4
	bit $f5, X                                                  ; $8d08 : $34, $f5
	bit $f6, X                                                  ; $8d0a : $34, $f6
	bit $f7, X                                                  ; $8d0c : $34, $f7
	bit $f8, X                                                  ; $8d0e : $34, $f8
	and $0e, X                                                  ; $8d10 : $35, $0e
	and $0f, X                                                  ; $8d12 : $35, $0f
	ora [$17], Y                                                  ; $8d14 : $17, $17
	ora [$17], Y                                                  ; $8d16 : $17, $17
	ora [$1c], Y                                                  ; $8d18 : $17, $1c
	ora ($05, X)                                                  ; $8d1a : $01, $05
	ora ($7f, X)                                                  ; $8d1c : $01, $7f
	asl $9b                                                  ; $8d1e : $06, $9b
	ora [$30]                                                  ; $8d20 : $07, $30
	ora #$03.b                                                  ; $8d22 : $09, $03
	ora $087f.w                                                  ; $8d24 : $0d, $7f, $08
	.db $00                                                  ; $8d27 : $00
	ora $01, S                                                  ; $8d28 : $03, $01
	rol $0103.w                                                  ; $8d2a : $2e, $03, $01
	adc $1717.w                                                  ; $8d2d : $6d, $17, $17
	ora [$20], Y                                                  ; $8d30 : $17, $20
	and $21, X                                                  ; $8d32 : $35, $21
	and $22, X                                                  ; $8d34 : $35, $22
	and $23, X                                                  ; $8d36 : $35, $23
	and $24, X                                                  ; $8d38 : $35, $24
	and $25, X                                                  ; $8d3a : $35, $25
	and $26, X                                                  ; $8d3c : $35, $26
	and $27, X                                                  ; $8d3e : $35, $27
	and $28, X                                                  ; $8d40 : $35, $28
	ora [$17], Y                                                  ; $8d42 : $17, $17
	ora [$17], Y                                                  ; $8d44 : $17, $17
	ora [$17], Y                                                  ; $8d46 : $17, $17
	ora [$1c], Y                                                  ; $8d48 : $17, $1c
	ora ($05, X)                                                  ; $8d4a : $01, $05
	ora ($10, X)                                                  ; $8d4c : $01, $10
	asl $50                                                  ; $8d4e : $06, $50
	ora [$70]                                                  ; $8d50 : $07, $70
	ora #$02.b                                                  ; $8d52 : $09, $02
	ora $0801.w, X                                                  ; $8d54 : $1d, $01, $08
	tsb $ca01.w                                                  ; $8d57 : $0c, $01, $ca
	dex                                                  ; $8d5a : $ca
	ora [$20], Y                                                  ; $8d5b : $17, $20
	and $4c, X                                                  ; $8d5d : $35, $4c
	and $4d, X                                                  ; $8d5f : $35, $4d
	and $4e, X                                                  ; $8d61 : $35, $4e
	and $4f, X                                                  ; $8d63 : $35, $4f
	and $50, X                                                  ; $8d65 : $35, $50
	and $51, X                                                  ; $8d67 : $35, $51
	and $52, X                                                  ; $8d69 : $35, $52
	and $53, X                                                  ; $8d6b : $35, $53
	ora [$17], Y                                                  ; $8d6d : $17, $17
	ora [$17], Y                                                  ; $8d6f : $17, $17
	ora [$17], Y                                                  ; $8d71 : $17, $17
	ora [$1c], Y                                                  ; $8d73 : $17, $1c
	ora ($05, X)                                                  ; $8d75 : $01, $05
	ora ($60, X)                                                  ; $8d77 : $01, $60
	asl $50                                                  ; $8d79 : $06, $50
	ora [$70]                                                  ; $8d7b : $07, $70
	ora #$02.b                                                  ; $8d7d : $09, $02
	ora $0801.w, X                                                  ; $8d7f : $1d, $01, $08
	tsb $6a01.w                                                  ; $8d82 : $0c, $01, $6a
	ora [$6d]                                                  ; $8d85 : $07, $6d
	adc #$07.b                                                  ; $8d87 : $69, $07
	ror                                                  ; $8d89 : $6a
	pla                                                  ; $8d8a : $68
	ora [$67]                                                  ; $8d8b : $07, $67
	adc [$07]                                                  ; $8d8d : $67, $07
	adc $66, S                                                  ; $8d8f : $63, $66
	ora [$60]                                                  ; $8d91 : $07, $60
	adc $07                                                  ; $8d93 : $65, $07
	eor $0764.w, X                                                  ; $8d95 : $5d, $64, $07
	phy                                                  ; $8d98 : $5a
	adc $07, S                                                  ; $8d99 : $63, $07
	eor [$62], Y                                                  ; $8d9b : $57, $62
	ora [$53]                                                  ; $8d9d : $07, $53
	adc ($07, X)                                                  ; $8d9f : $61, $07
	bvc br_0c_8da4                                                  ; $8da1 : $50, $01

	rts                                                  ; $8da3 : $60


br_0c_8da4:
	ora [$40]                                                  ; $8da4 : $07, $40
	rts                                                  ; $8da6 : $60


	ora [$20], Y                                                  ; $8da7 : $17, $20
	and $98, X                                                  ; $8da9 : $35, $98
	and $99, X                                                  ; $8dab : $35, $99
	and $9a, X                                                  ; $8dad : $35, $9a
	and $9b, X                                                  ; $8daf : $35, $9b
	and $9c, X                                                  ; $8db1 : $35, $9c
	and $9d, X                                                  ; $8db3 : $35, $9d
	and $9e, X                                                  ; $8db5 : $35, $9e
	and $b0, X                                                  ; $8db7 : $35, $b0
	ora [$17], Y                                                  ; $8db9 : $17, $17
	ora [$17], Y                                                  ; $8dbb : $17, $17
	ora [$17], Y                                                  ; $8dbd : $17, $17
	trb $0501.w                                                  ; $8dbf : $1c, $01, $05
	cop $c2.b                                                  ; $8dc2 : $02, $c2
	asl $5b                                                  ; $8dc4 : $06, $5b
	ora [$30]                                                  ; $8dc6 : $07, $30
	ora $0819.w, X                                                  ; $8dc8 : $1d, $19, $08
	ora ($09), Y                                                  ; $8dcb : $11, $09
	cop $7e.b                                                  ; $8dcd : $02, $7e
	tdc                                                  ; $8dcf : $7b
	ora [$1c], Y                                                  ; $8dd0 : $17, $1c
	ora ($05, X)                                                  ; $8dd2 : $01, $05
	cop $c2.b                                                  ; $8dd4 : $02, $c2
	asl $5b                                                  ; $8dd6 : $06, $5b
	ora [$2a]                                                  ; $8dd8 : $07, $2a
	ora $0819.w, X                                                  ; $8dda : $1d, $19, $08
	ora ($09, S), Y                                                  ; $8ddd : $13, $09
	ora ($7e, X)                                                  ; $8ddf : $01, $7e
	tdc                                                  ; $8de1 : $7b
	ora [$00], Y                                                  ; $8de2 : $17, $00
	.db $00                                                  ; $8de4 : $00
	.db $00                                                  ; $8de5 : $00
	.db $00                                                  ; $8de6 : $00
	sbc $520006.l, X                                                  ; $8de7 : $ff, $06, $00, $52
	ora $e234.w, Y                                                  ; $8deb : $19, $34, $e2
	and $11, X                                                  ; $8dee : $35, $11
	and $3e, X                                                  ; $8df0 : $35, $3e
	adc $340001.l                                                  ; $8df2 : $6f, $01, $00, $34
	adc ($6c, S), Y                                                  ; $8df6 : $73, $6c
	.db $00                                                  ; $8df8 : $00
	.db $00                                                  ; $8df9 : $00
	.db $00                                                  ; $8dfa : $00
	.db $00                                                  ; $8dfb : $00
	.db $00                                                  ; $8dfc : $00
	.db $00                                                  ; $8dfd : $00
	.db $00                                                  ; $8dfe : $00
	.db $00                                                  ; $8dff : $00
	.db $00                                                  ; $8e00 : $00
	.db $00                                                  ; $8e01 : $00
	.db $00                                                  ; $8e02 : $00
	.db $00                                                  ; $8e03 : $00
	.db $00                                                  ; $8e04 : $00
	.db $00                                                  ; $8e05 : $00
	.db $00                                                  ; $8e06 : $00
	.db $00                                                  ; $8e07 : $00
	.db $00                                                  ; $8e08 : $00
	.db $00                                                  ; $8e09 : $00
	.db $00                                                  ; $8e0a : $00
	.db $00                                                  ; $8e0b : $00
	.db $00                                                  ; $8e0c : $00
	.db $00                                                  ; $8e0d : $00
	.db $00                                                  ; $8e0e : $00
	.db $00                                                  ; $8e0f : $00
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
	.db $00                                                  ; $8e1a : $00
	.db $00                                                  ; $8e1b : $00
	.db $00                                                  ; $8e1c : $00
	.db $00                                                  ; $8e1d : $00
	.db $00                                                  ; $8e1e : $00
	.db $00                                                  ; $8e1f : $00
	.db $00                                                  ; $8e20 : $00
	.db $00                                                  ; $8e21 : $00
	.db $00                                                  ; $8e22 : $00
	.db $00                                                  ; $8e23 : $00
	.db $00                                                  ; $8e24 : $00
	.db $00                                                  ; $8e25 : $00
	.db $00                                                  ; $8e26 : $00
	.db $00                                                  ; $8e27 : $00
	.db $00                                                  ; $8e28 : $00
	.db $00                                                  ; $8e29 : $00
	.db $00                                                  ; $8e2a : $00
	.db $00                                                  ; $8e2b : $00
	.db $00                                                  ; $8e2c : $00
	.db $00                                                  ; $8e2d : $00
	.db $00                                                  ; $8e2e : $00
	.db $00                                                  ; $8e2f : $00
	.db $00                                                  ; $8e30 : $00
	.db $00                                                  ; $8e31 : $00
	.db $00                                                  ; $8e32 : $00
	.db $00                                                  ; $8e33 : $00
	.db $00                                                  ; $8e34 : $00
	.db $00                                                  ; $8e35 : $00
	.db $00                                                  ; $8e36 : $00
	.db $00                                                  ; $8e37 : $00
	.db $00                                                  ; $8e38 : $00
	.db $00                                                  ; $8e39 : $00
	.db $00                                                  ; $8e3a : $00
	.db $00                                                  ; $8e3b : $00
	.db $00                                                  ; $8e3c : $00
	.db $00                                                  ; $8e3d : $00
	.db $00                                                  ; $8e3e : $00
	.db $00                                                  ; $8e3f : $00
	.db $00                                                  ; $8e40 : $00
	.db $00                                                  ; $8e41 : $00
	.db $00                                                  ; $8e42 : $00
	.db $00                                                  ; $8e43 : $00
	.db $00                                                  ; $8e44 : $00
	.db $00                                                  ; $8e45 : $00
	.db $00                                                  ; $8e46 : $00
	.db $00                                                  ; $8e47 : $00
	.db $00                                                  ; $8e48 : $00
	.db $00                                                  ; $8e49 : $00
	.db $00                                                  ; $8e4a : $00
	.db $00                                                  ; $8e4b : $00
	.db $00                                                  ; $8e4c : $00
	.db $00                                                  ; $8e4d : $00
	.db $00                                                  ; $8e4e : $00
	.db $00                                                  ; $8e4f : $00
	.db $00                                                  ; $8e50 : $00
	.db $00                                                  ; $8e51 : $00
	.db $00                                                  ; $8e52 : $00
	.db $00                                                  ; $8e53 : $00
	.db $00                                                  ; $8e54 : $00
	.db $00                                                  ; $8e55 : $00
	.db $00                                                  ; $8e56 : $00
	.db $00                                                  ; $8e57 : $00
	.db $00                                                  ; $8e58 : $00
	.db $00                                                  ; $8e59 : $00
	.db $00                                                  ; $8e5a : $00
	.db $00                                                  ; $8e5b : $00
	.db $00                                                  ; $8e5c : $00
	.db $00                                                  ; $8e5d : $00
	.db $00                                                  ; $8e5e : $00
	.db $00                                                  ; $8e5f : $00
	.db $00                                                  ; $8e60 : $00
	.db $00                                                  ; $8e61 : $00
	.db $00                                                  ; $8e62 : $00
	.db $00                                                  ; $8e63 : $00
	.db $00                                                  ; $8e64 : $00
	.db $00                                                  ; $8e65 : $00
	.db $00                                                  ; $8e66 : $00
	.db $00                                                  ; $8e67 : $00
	.db $00                                                  ; $8e68 : $00
	.db $00                                                  ; $8e69 : $00
	.db $00                                                  ; $8e6a : $00
	.db $00                                                  ; $8e6b : $00
	.db $00                                                  ; $8e6c : $00
	.db $00                                                  ; $8e6d : $00
	.db $00                                                  ; $8e6e : $00
	.db $00                                                  ; $8e6f : $00
	.db $00                                                  ; $8e70 : $00
	.db $00                                                  ; $8e71 : $00
	.db $00                                                  ; $8e72 : $00
	.db $00                                                  ; $8e73 : $00
	.db $00                                                  ; $8e74 : $00
	.db $00                                                  ; $8e75 : $00
	.db $00                                                  ; $8e76 : $00
	.db $00                                                  ; $8e77 : $00
	.db $00                                                  ; $8e78 : $00
	.db $00                                                  ; $8e79 : $00
	.db $00                                                  ; $8e7a : $00
	.db $00                                                  ; $8e7b : $00
	.db $00                                                  ; $8e7c : $00
	.db $00                                                  ; $8e7d : $00
	.db $00                                                  ; $8e7e : $00
	.db $00                                                  ; $8e7f : $00
	.db $00                                                  ; $8e80 : $00
	.db $00                                                  ; $8e81 : $00
	.db $00                                                  ; $8e82 : $00
	.db $00                                                  ; $8e83 : $00
	.db $00                                                  ; $8e84 : $00
	.db $00                                                  ; $8e85 : $00
	.db $00                                                  ; $8e86 : $00
	.db $00                                                  ; $8e87 : $00
	.db $00                                                  ; $8e88 : $00
	.db $00                                                  ; $8e89 : $00
	.db $00                                                  ; $8e8a : $00
	.db $00                                                  ; $8e8b : $00
	.db $00                                                  ; $8e8c : $00
	.db $00                                                  ; $8e8d : $00
	.db $00                                                  ; $8e8e : $00
	.db $00                                                  ; $8e8f : $00
	.db $00                                                  ; $8e90 : $00
	.db $00                                                  ; $8e91 : $00
	.db $00                                                  ; $8e92 : $00
	.db $00                                                  ; $8e93 : $00
	.db $00                                                  ; $8e94 : $00
	.db $00                                                  ; $8e95 : $00
	.db $00                                                  ; $8e96 : $00
	.db $00                                                  ; $8e97 : $00
	.db $00                                                  ; $8e98 : $00
	.db $00                                                  ; $8e99 : $00
	.db $00                                                  ; $8e9a : $00
	.db $00                                                  ; $8e9b : $00
	.db $00                                                  ; $8e9c : $00
	.db $00                                                  ; $8e9d : $00
	.db $00                                                  ; $8e9e : $00
	.db $00                                                  ; $8e9f : $00
	.db $00                                                  ; $8ea0 : $00
	.db $00                                                  ; $8ea1 : $00
	.db $00                                                  ; $8ea2 : $00
	.db $00                                                  ; $8ea3 : $00
	.db $00                                                  ; $8ea4 : $00
	.db $00                                                  ; $8ea5 : $00
	.db $00                                                  ; $8ea6 : $00
	.db $00                                                  ; $8ea7 : $00
	.db $00                                                  ; $8ea8 : $00
	.db $00                                                  ; $8ea9 : $00
	.db $00                                                  ; $8eaa : $00
	.db $00                                                  ; $8eab : $00
	.db $00                                                  ; $8eac : $00
	.db $00                                                  ; $8ead : $00
	.db $00                                                  ; $8eae : $00
	.db $00                                                  ; $8eaf : $00
	.db $00                                                  ; $8eb0 : $00
	.db $00                                                  ; $8eb1 : $00
	.db $00                                                  ; $8eb2 : $00
	.db $00                                                  ; $8eb3 : $00
	.db $00                                                  ; $8eb4 : $00
	.db $00                                                  ; $8eb5 : $00
	.db $00                                                  ; $8eb6 : $00
	.db $00                                                  ; $8eb7 : $00
	.db $00                                                  ; $8eb8 : $00
	.db $00                                                  ; $8eb9 : $00
	.db $00                                                  ; $8eba : $00
	.db $00                                                  ; $8ebb : $00
	.db $00                                                  ; $8ebc : $00
	.db $00                                                  ; $8ebd : $00
	.db $00                                                  ; $8ebe : $00
	.db $00                                                  ; $8ebf : $00
	.db $00                                                  ; $8ec0 : $00
	.db $00                                                  ; $8ec1 : $00
	.db $00                                                  ; $8ec2 : $00
	.db $00                                                  ; $8ec3 : $00
	.db $00                                                  ; $8ec4 : $00
	.db $00                                                  ; $8ec5 : $00
	.db $00                                                  ; $8ec6 : $00
	.db $00                                                  ; $8ec7 : $00
	.db $00                                                  ; $8ec8 : $00
	.db $00                                                  ; $8ec9 : $00
	.db $00                                                  ; $8eca : $00
	.db $00                                                  ; $8ecb : $00
	.db $00                                                  ; $8ecc : $00
	.db $00                                                  ; $8ecd : $00
	.db $00                                                  ; $8ece : $00
	.db $00                                                  ; $8ecf : $00
	.db $00                                                  ; $8ed0 : $00
	.db $00                                                  ; $8ed1 : $00
	.db $00                                                  ; $8ed2 : $00
	.db $00                                                  ; $8ed3 : $00
	.db $00                                                  ; $8ed4 : $00
	.db $00                                                  ; $8ed5 : $00
	.db $00                                                  ; $8ed6 : $00
	.db $00                                                  ; $8ed7 : $00
	jsr $f334.w                                                  ; $8ed8 : $20, $34, $f3
	bit $f4, X                                                  ; $8edb : $34, $f4
	bit $f5, X                                                  ; $8edd : $34, $f5
	bit $f6, X                                                  ; $8edf : $34, $f6
	bit $f7, X                                                  ; $8ee1 : $34, $f7
	bit $f8, X                                                  ; $8ee3 : $34, $f8
	bit $f9, X                                                  ; $8ee5 : $34, $f9
	bit $fa, X                                                  ; $8ee7 : $34, $fa
	ora [$17], Y                                                  ; $8ee9 : $17, $17
	ora [$17], Y                                                  ; $8eeb : $17, $17
	ora [$17], Y                                                  ; $8eed : $17, $17
	ora [$1c], Y                                                  ; $8eef : $17, $1c
	ora ($05, X)                                                  ; $8ef1 : $01, $05
	cop $50.b                                                  ; $8ef3 : $02, $50
	asl $48                                                  ; $8ef5 : $06, $48
	ora [$20]                                                  ; $8ef7 : $07, $20
	ora $0915.w, X                                                  ; $8ef9 : $1d, $15, $09
	ora $1a, S                                                  ; $8efc : $03, $1a
	.db $00                                                  ; $8efe : $00
	ora #$1a.b                                                  ; $8eff : $09, $1a
	cop $09.b                                                  ; $8f01 : $02, $09
	php                                                  ; $8f03 : $08
	asl $17fe.w                                                  ; $8f04 : $0e, $fe, $17
	jsr $2235.w                                                  ; $8f07 : $20, $35, $22
	and $23, X                                                  ; $8f0a : $35, $23
	and $24, X                                                  ; $8f0c : $35, $24
	and $25, X                                                  ; $8f0e : $35, $25
	and $26, X                                                  ; $8f10 : $35, $26
	and $27, X                                                  ; $8f12 : $35, $27
	and $28, X                                                  ; $8f14 : $35, $28
	and $3d, X                                                  ; $8f16 : $35, $3d
	ora [$17], Y                                                  ; $8f18 : $17, $17
	ora [$17], Y                                                  ; $8f1a : $17, $17
	ora [$17], Y                                                  ; $8f1c : $17, $17
	trb $0501.w                                                  ; $8f1e : $1c, $01, $05
	ora ($c0, X)                                                  ; $8f21 : $01, $c0
	asl $40                                                  ; $8f23 : $06, $40
	ora #$02.b                                                  ; $8f25 : $09, $02
	ora [$40]                                                  ; $8f27 : $07, $40
	ina                                                  ; $8f29 : $1a
	cop $36.b                                                  ; $8f2a : $02, $36
	ina                                                  ; $8f2c : $1a
	.db $00                                                  ; $8f2d : $00
	lsr $08                                                  ; $8f2e : $46, $08
	asl $f8, X                                                  ; $8f30 : $16, $f8
	ora [$17], Y                                                  ; $8f32 : $17, $17
	jsr $4f35.w                                                  ; $8f34 : $20, $35, $4f
	and $50, X                                                  ; $8f37 : $35, $50
	and $51, X                                                  ; $8f39 : $35, $51
	and $52, X                                                  ; $8f3b : $35, $52
	and $53, X                                                  ; $8f3d : $35, $53
	and $54, X                                                  ; $8f3f : $35, $54
	and $55, X                                                  ; $8f41 : $35, $55
	and $6e, X                                                  ; $8f43 : $35, $6e
	ora [$17], Y                                                  ; $8f45 : $17, $17
	ora [$17], Y                                                  ; $8f47 : $17, $17
	ora [$17], Y                                                  ; $8f49 : $17, $17
	trb $0501.w                                                  ; $8f4b : $1c, $01, $05
	ora $ff, S                                                  ; $8f4e : $03, $ff
	asl $9b                                                  ; $8f50 : $06, $9b
	ora [$40]                                                  ; $8f52 : $07, $40
	ora #$04.b                                                  ; $8f54 : $09, $04
	ora $1d7f.w                                                  ; $8f56 : $0d, $7f, $1d
	clc                                                  ; $8f59 : $18
	php                                                  ; $8f5a : $08
	plp                                                  ; $8f5b : $28
	ora $01, S                                                  ; $8f5c : $03, $01
	lsr                                                  ; $8f5e : $4a
	ora $01, S                                                  ; $8f5f : $03, $01
	adc ($80, X)                                                  ; $8f61 : $61, $80
	ora [$17], Y                                                  ; $8f63 : $17, $17
	.db $00                                                  ; $8f65 : $00
	.db $00                                                  ; $8f66 : $00
	.db $00                                                  ; $8f67 : $00
	.db $00                                                  ; $8f68 : $00
	sbc $52000a.l, X                                                  ; $8f69 : $ff, $0a, $00, $52
	ora $e234.w, Y                                                  ; $8f6d : $19, $34, $e2
	and $12, X                                                  ; $8f70 : $35, $12
	and $2e, X                                                  ; $8f72 : $35, $2e
	and $60, X                                                  ; $8f74 : $35, $60
	and $9c, X                                                  ; $8f76 : $35, $9c
	dec $0001.w, X                                                  ; $8f78 : $de, $01, $00
	bit $75, X                                                  ; $8f7b : $34, $75
	jmp ($0000.w)                                                  ; $8f7d : $6c, $00, $00


	.db $00                                                  ; $8f80 : $00
	.db $00                                                  ; $8f81 : $00
	.db $00                                                  ; $8f82 : $00
	.db $00                                                  ; $8f83 : $00
	.db $00                                                  ; $8f84 : $00
	.db $00                                                  ; $8f85 : $00
	.db $00                                                  ; $8f86 : $00
	.db $00                                                  ; $8f87 : $00
	.db $00                                                  ; $8f88 : $00
	.db $00                                                  ; $8f89 : $00
	.db $00                                                  ; $8f8a : $00
	.db $00                                                  ; $8f8b : $00
	.db $00                                                  ; $8f8c : $00
	.db $00                                                  ; $8f8d : $00
	.db $00                                                  ; $8f8e : $00
	.db $00                                                  ; $8f8f : $00
	.db $00                                                  ; $8f90 : $00
	.db $00                                                  ; $8f91 : $00
	.db $00                                                  ; $8f92 : $00
	.db $00                                                  ; $8f93 : $00
	.db $00                                                  ; $8f94 : $00
	.db $00                                                  ; $8f95 : $00
	.db $00                                                  ; $8f96 : $00
	.db $00                                                  ; $8f97 : $00
	.db $00                                                  ; $8f98 : $00
	.db $00                                                  ; $8f99 : $00
	.db $00                                                  ; $8f9a : $00
	.db $00                                                  ; $8f9b : $00
	.db $00                                                  ; $8f9c : $00
	.db $00                                                  ; $8f9d : $00
	.db $00                                                  ; $8f9e : $00
	.db $00                                                  ; $8f9f : $00
	.db $00                                                  ; $8fa0 : $00
	.db $00                                                  ; $8fa1 : $00
	.db $00                                                  ; $8fa2 : $00
	.db $00                                                  ; $8fa3 : $00
	.db $00                                                  ; $8fa4 : $00
	.db $00                                                  ; $8fa5 : $00
	.db $00                                                  ; $8fa6 : $00
	.db $00                                                  ; $8fa7 : $00
	.db $00                                                  ; $8fa8 : $00
	.db $00                                                  ; $8fa9 : $00
	.db $00                                                  ; $8faa : $00
	.db $00                                                  ; $8fab : $00
	.db $00                                                  ; $8fac : $00
	.db $00                                                  ; $8fad : $00
	.db $00                                                  ; $8fae : $00
	.db $00                                                  ; $8faf : $00
	.db $00                                                  ; $8fb0 : $00
	.db $00                                                  ; $8fb1 : $00
	.db $00                                                  ; $8fb2 : $00
	.db $00                                                  ; $8fb3 : $00
	.db $00                                                  ; $8fb4 : $00
	.db $00                                                  ; $8fb5 : $00
	.db $00                                                  ; $8fb6 : $00
	.db $00                                                  ; $8fb7 : $00
	.db $00                                                  ; $8fb8 : $00
	.db $00                                                  ; $8fb9 : $00
	.db $00                                                  ; $8fba : $00
	.db $00                                                  ; $8fbb : $00
	.db $00                                                  ; $8fbc : $00
	.db $00                                                  ; $8fbd : $00
	.db $00                                                  ; $8fbe : $00
	.db $00                                                  ; $8fbf : $00
	.db $00                                                  ; $8fc0 : $00
	.db $00                                                  ; $8fc1 : $00
	.db $00                                                  ; $8fc2 : $00
	.db $00                                                  ; $8fc3 : $00
	.db $00                                                  ; $8fc4 : $00
	.db $00                                                  ; $8fc5 : $00
	.db $00                                                  ; $8fc6 : $00
	.db $00                                                  ; $8fc7 : $00
	.db $00                                                  ; $8fc8 : $00
	.db $00                                                  ; $8fc9 : $00
	.db $00                                                  ; $8fca : $00
	.db $00                                                  ; $8fcb : $00
	.db $00                                                  ; $8fcc : $00
	.db $00                                                  ; $8fcd : $00
	.db $00                                                  ; $8fce : $00
	.db $00                                                  ; $8fcf : $00
	.db $00                                                  ; $8fd0 : $00
	.db $00                                                  ; $8fd1 : $00
	.db $00                                                  ; $8fd2 : $00
	.db $00                                                  ; $8fd3 : $00
	.db $00                                                  ; $8fd4 : $00
	.db $00                                                  ; $8fd5 : $00
	.db $00                                                  ; $8fd6 : $00
	.db $00                                                  ; $8fd7 : $00
	.db $00                                                  ; $8fd8 : $00
	.db $00                                                  ; $8fd9 : $00
	.db $00                                                  ; $8fda : $00
	.db $00                                                  ; $8fdb : $00
	.db $00                                                  ; $8fdc : $00
	.db $00                                                  ; $8fdd : $00
	.db $00                                                  ; $8fde : $00
	.db $00                                                  ; $8fdf : $00
	.db $00                                                  ; $8fe0 : $00
	.db $00                                                  ; $8fe1 : $00
	.db $00                                                  ; $8fe2 : $00
	.db $00                                                  ; $8fe3 : $00
	.db $00                                                  ; $8fe4 : $00
	.db $00                                                  ; $8fe5 : $00
	.db $00                                                  ; $8fe6 : $00
	.db $00                                                  ; $8fe7 : $00
	.db $00                                                  ; $8fe8 : $00
	.db $00                                                  ; $8fe9 : $00
	.db $00                                                  ; $8fea : $00
	.db $00                                                  ; $8feb : $00
	.db $00                                                  ; $8fec : $00
	.db $00                                                  ; $8fed : $00
	.db $00                                                  ; $8fee : $00
	.db $00                                                  ; $8fef : $00
	.db $00                                                  ; $8ff0 : $00
	.db $00                                                  ; $8ff1 : $00
	.db $00                                                  ; $8ff2 : $00
	.db $00                                                  ; $8ff3 : $00
	.db $00                                                  ; $8ff4 : $00
	.db $00                                                  ; $8ff5 : $00
	.db $00                                                  ; $8ff6 : $00
	.db $00                                                  ; $8ff7 : $00
	.db $00                                                  ; $8ff8 : $00
	.db $00                                                  ; $8ff9 : $00
	.db $00                                                  ; $8ffa : $00
	.db $00                                                  ; $8ffb : $00
	.db $00                                                  ; $8ffc : $00
	.db $00                                                  ; $8ffd : $00
	.db $00                                                  ; $8ffe : $00
	.db $00                                                  ; $8fff : $00
	.db $00                                                  ; $9000 : $00
	.db $00                                                  ; $9001 : $00
	.db $00                                                  ; $9002 : $00
	.db $00                                                  ; $9003 : $00
	.db $00                                                  ; $9004 : $00
	.db $00                                                  ; $9005 : $00
	.db $00                                                  ; $9006 : $00
	.db $00                                                  ; $9007 : $00
	.db $00                                                  ; $9008 : $00
	.db $00                                                  ; $9009 : $00
	.db $00                                                  ; $900a : $00
	.db $00                                                  ; $900b : $00
	.db $00                                                  ; $900c : $00
	.db $00                                                  ; $900d : $00
	.db $00                                                  ; $900e : $00
	.db $00                                                  ; $900f : $00
	.db $00                                                  ; $9010 : $00
	.db $00                                                  ; $9011 : $00
	.db $00                                                  ; $9012 : $00
	.db $00                                                  ; $9013 : $00
	.db $00                                                  ; $9014 : $00
	.db $00                                                  ; $9015 : $00
	.db $00                                                  ; $9016 : $00
	.db $00                                                  ; $9017 : $00
	.db $00                                                  ; $9018 : $00
	.db $00                                                  ; $9019 : $00
	.db $00                                                  ; $901a : $00
	.db $00                                                  ; $901b : $00
	.db $00                                                  ; $901c : $00
	.db $00                                                  ; $901d : $00
	.db $00                                                  ; $901e : $00
	.db $00                                                  ; $901f : $00
	.db $00                                                  ; $9020 : $00
	.db $00                                                  ; $9021 : $00
	.db $00                                                  ; $9022 : $00
	.db $00                                                  ; $9023 : $00
	.db $00                                                  ; $9024 : $00
	.db $00                                                  ; $9025 : $00
	.db $00                                                  ; $9026 : $00
	.db $00                                                  ; $9027 : $00
	.db $00                                                  ; $9028 : $00
	.db $00                                                  ; $9029 : $00
	.db $00                                                  ; $902a : $00
	.db $00                                                  ; $902b : $00
	.db $00                                                  ; $902c : $00
	.db $00                                                  ; $902d : $00
	.db $00                                                  ; $902e : $00
	.db $00                                                  ; $902f : $00
	.db $00                                                  ; $9030 : $00
	.db $00                                                  ; $9031 : $00
	.db $00                                                  ; $9032 : $00
	.db $00                                                  ; $9033 : $00
	.db $00                                                  ; $9034 : $00
	.db $00                                                  ; $9035 : $00
	.db $00                                                  ; $9036 : $00
	.db $00                                                  ; $9037 : $00
	.db $00                                                  ; $9038 : $00
	.db $00                                                  ; $9039 : $00
	.db $00                                                  ; $903a : $00
	.db $00                                                  ; $903b : $00
	.db $00                                                  ; $903c : $00
	.db $00                                                  ; $903d : $00
	.db $00                                                  ; $903e : $00
	.db $00                                                  ; $903f : $00
	.db $00                                                  ; $9040 : $00
	.db $00                                                  ; $9041 : $00
	.db $00                                                  ; $9042 : $00
	.db $00                                                  ; $9043 : $00
	.db $00                                                  ; $9044 : $00
	.db $00                                                  ; $9045 : $00
	.db $00                                                  ; $9046 : $00
	.db $00                                                  ; $9047 : $00
	.db $00                                                  ; $9048 : $00
	.db $00                                                  ; $9049 : $00
	.db $00                                                  ; $904a : $00
	.db $00                                                  ; $904b : $00
	.db $00                                                  ; $904c : $00
	.db $00                                                  ; $904d : $00
	.db $00                                                  ; $904e : $00
	.db $00                                                  ; $904f : $00
	.db $00                                                  ; $9050 : $00
	.db $00                                                  ; $9051 : $00
	.db $00                                                  ; $9052 : $00
	.db $00                                                  ; $9053 : $00
	.db $00                                                  ; $9054 : $00
	.db $00                                                  ; $9055 : $00
	.db $00                                                  ; $9056 : $00
	.db $00                                                  ; $9057 : $00
	.db $00                                                  ; $9058 : $00
	.db $00                                                  ; $9059 : $00
	.db $00                                                  ; $905a : $00
	.db $00                                                  ; $905b : $00
	.db $00                                                  ; $905c : $00
	.db $00                                                  ; $905d : $00
	jsr $f334.w                                                  ; $905e : $20, $34, $f3
	bit $f4, X                                                  ; $9061 : $34, $f4
	bit $f5, X                                                  ; $9063 : $34, $f5
	bit $f6, X                                                  ; $9065 : $34, $f6
	bit $f7, X                                                  ; $9067 : $34, $f7
	bit $f8, X                                                  ; $9069 : $34, $f8
	bit $f9, X                                                  ; $906b : $34, $f9
	and $11, X                                                  ; $906d : $35, $11
	ora [$17], Y                                                  ; $906f : $17, $17
	ora [$17], Y                                                  ; $9071 : $17, $17
	ora [$17], Y                                                  ; $9073 : $17, $17
	trb $0501.w                                                  ; $9075 : $1c, $01, $05
	cop $30.b                                                  ; $9078 : $02, $30
	asl $9b                                                  ; $907a : $06, $9b
	ora [$30]                                                  ; $907c : $07, $30
	ora #$05.b                                                  ; $907e : $09, $05
	ora $081c.w, X                                                  ; $9080 : $1d, $1c, $08
	asl $5603.w                                                  ; $9083 : $0e, $03, $56
	eor $5658.w, Y                                                  ; $9086 : $59, $58, $56
	mvn $51, $52                                                  ; $9089 : $54, $52, $51
	ora [$17], Y                                                  ; $908c : $17, $17
	jsr $2335.w                                                  ; $908e : $20, $35, $23
	and $24, X                                                  ; $9091 : $35, $24
	and $25, X                                                  ; $9093 : $35, $25
	and $26, X                                                  ; $9095 : $35, $26
	and $27, X                                                  ; $9097 : $35, $27
	and $28, X                                                  ; $9099 : $35, $28
	and $29, X                                                  ; $909b : $35, $29
	and $2d, X                                                  ; $909d : $35, $2d
	ora [$17], Y                                                  ; $909f : $17, $17
	ora [$17], Y                                                  ; $90a1 : $17, $17
	ora [$17], Y                                                  ; $90a3 : $17, $17
	ora [$01]                                                  ; $90a5 : $07, $01
	plx                                                  ; $90a7 : $fa
	ora [$17], Y                                                  ; $90a8 : $17, $17
	jsr $3f35.w                                                  ; $90aa : $20, $35, $3f
	and $40, X                                                  ; $90ad : $35, $40
	and $41, X                                                  ; $90af : $35, $41
	and $42, X                                                  ; $90b1 : $35, $42
	and $43, X                                                  ; $90b3 : $35, $43
	and $44, X                                                  ; $90b5 : $35, $44
	and $45, X                                                  ; $90b7 : $35, $45
	and $46, X                                                  ; $90b9 : $35, $46
	ora [$17], Y                                                  ; $90bb : $17, $17
	ora [$17], Y                                                  ; $90bd : $17, $17
	ora [$17], Y                                                  ; $90bf : $17, $17
	ora [$1c], Y                                                  ; $90c1 : $17, $1c
	ora ($05, X)                                                  ; $90c3 : $01, $05
	cop $70.b                                                  ; $90c5 : $02, $70
	asl $ff                                                  ; $90c7 : $06, $ff
	ora [$20]                                                  ; $90c9 : $07, $20
	ora #$02.b                                                  ; $90cb : $09, $02
	ina                                                  ; $90cd : $1a
	.db $00                                                  ; $90ce : $00
	jsr $021a.w                                                  ; $90cf : $20, $1a, $02
	.db $70, $08                                                  ; $90d2 : $70, $08

	tsb $01                                                  ; $90d4 : $04, $01
	and $200d.w                                                  ; $90d6 : $2d, $0d, $20
	ora $f9, S                                                  ; $90d9 : $03, $f9
	ora [$20], Y                                                  ; $90db : $17, $20
	and $71, X                                                  ; $90dd : $35, $71
	and $72, X                                                  ; $90df : $35, $72
	and $73, X                                                  ; $90e1 : $35, $73
	and $74, X                                                  ; $90e3 : $35, $74
	and $75, X                                                  ; $90e5 : $35, $75
	and $76, X                                                  ; $90e7 : $35, $76
	and $77, X                                                  ; $90e9 : $35, $77
	and $78, X                                                  ; $90eb : $35, $78
	ora [$17], Y                                                  ; $90ed : $17, $17
	ora [$17], Y                                                  ; $90ef : $17, $17
	ora [$17], Y                                                  ; $90f1 : $17, $17
	ora [$1c], Y                                                  ; $90f3 : $17, $1c
	ora ($05, X)                                                  ; $90f5 : $01, $05
	cop $7a.b                                                  ; $90f7 : $02, $7a
	asl $9b                                                  ; $90f9 : $06, $9b
	ora [$37]                                                  ; $90fb : $07, $37
	ora #$04.b                                                  ; $90fd : $09, $04
	ina                                                  ; $90ff : $1a
	.db $00                                                  ; $9100 : $00
	and ($1a)                                                  ; $9101 : $32, $1a
	cop $50.b                                                  ; $9103 : $02, $50
	ora $081c.w, X                                                  ; $9105 : $1d, $1c, $08
	asl $3940.w                                                  ; $9108 : $0e, $40, $39
	ora $2d, S                                                  ; $910b : $03, $2d
	and $31                                                  ; $910d : $25, $31
	plp                                                  ; $910f : $28
	bit $26, X                                                  ; $9110 : $34, $26
	and ($25)                                                  ; $9112 : $32, $25
	and ($21), Y                                                  ; $9114 : $31, $21
	and $2017.w                                                  ; $9116 : $2d, $17, $20
	and $ad, X                                                  ; $9119 : $35, $ad
	and $ae, X                                                  ; $911b : $35, $ae
	and $af, X                                                  ; $911d : $35, $af
	and $b0, X                                                  ; $911f : $35, $b0
	and $b1, X                                                  ; $9121 : $35, $b1
	and $b2, X                                                  ; $9123 : $35, $b2
	and $b3, X                                                  ; $9125 : $35, $b3
	and $b4, X                                                  ; $9127 : $35, $b4
	ora [$17], Y                                                  ; $9129 : $17, $17
	ora [$17], Y                                                  ; $912b : $17, $17
	ora [$17], Y                                                  ; $912d : $17, $17
	ora [$1c], Y                                                  ; $912f : $17, $1c
	ora ($05, X)                                                  ; $9131 : $01, $05
	cop $60.b                                                  ; $9133 : $02, $60
	asl $9b                                                  ; $9135 : $06, $9b
	ora [$00]                                                  ; $9137 : $07, $00
	ora #$04.b                                                  ; $9139 : $09, $04
	ina                                                  ; $913b : $1a
	.db $00                                                  ; $913c : $00
	and ($1a)                                                  ; $913d : $32, $1a
	cop $50.b                                                  ; $913f : $02, $50
	ora $071c.w, X                                                  ; $9141 : $1d, $1c, $07
	.db $00                                                  ; $9144 : $00
	rti                                                  ; $9145 : $40


	ora $07, S                                                  ; $9146 : $03, $07
	.db $00                                                  ; $9148 : $00
	bit $08, X                                                  ; $9149 : $34, $08
	asl $4a07.w                                                  ; $914b : $0e, $07, $4a
	ora #$01.b                                                  ; $914e : $09, $01
	ina                                                  ; $9150 : $1a
	.db $00                                                  ; $9151 : $00
	.db $00                                                  ; $9152 : $00
	ora ($79, X)                                                  ; $9153 : $01, $79
	ora $0130.w                                                  ; $9155 : $0d, $30, $01
	cmp ($17, X)                                                  ; $9158 : $c1, $17
	.db $00                                                  ; $915a : $00
	.db $00                                                  ; $915b : $00
	.db $00                                                  ; $915c : $00
	.db $00                                                  ; $915d : $00
	sbc $52000a.l, X                                                  ; $915e : $ff, $0a, $00, $52
	ora $e234.w, Y                                                  ; $9162 : $19, $34, $e2
	and $40, X                                                  ; $9165 : $35, $40
	and $9e, X                                                  ; $9167 : $35, $9e
	and $de, X                                                  ; $9169 : $35, $de
	rol $0f, X                                                  ; $916b : $36, $0f
	lsr                                                  ; $916d : $4a
	cop $00.b                                                  ; $916e : $02, $00
	bit $75, X                                                  ; $9170 : $34, $75
	jmp ($0000.w)                                                  ; $9172 : $6c, $00, $00


	.db $00                                                  ; $9175 : $00
	.db $00                                                  ; $9176 : $00
	.db $00                                                  ; $9177 : $00
	.db $00                                                  ; $9178 : $00
	.db $00                                                  ; $9179 : $00
	.db $00                                                  ; $917a : $00
	.db $00                                                  ; $917b : $00
	.db $00                                                  ; $917c : $00
	.db $00                                                  ; $917d : $00
	.db $00                                                  ; $917e : $00
	.db $00                                                  ; $917f : $00
	.db $00                                                  ; $9180 : $00
	.db $00                                                  ; $9181 : $00
	.db $00                                                  ; $9182 : $00
	.db $00                                                  ; $9183 : $00
	.db $00                                                  ; $9184 : $00
	.db $00                                                  ; $9185 : $00
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
	.db $00                                                  ; $9191 : $00
	.db $00                                                  ; $9192 : $00
	.db $00                                                  ; $9193 : $00
	.db $00                                                  ; $9194 : $00
	.db $00                                                  ; $9195 : $00
	.db $00                                                  ; $9196 : $00
	.db $00                                                  ; $9197 : $00
	.db $00                                                  ; $9198 : $00
	.db $00                                                  ; $9199 : $00
	.db $00                                                  ; $919a : $00
	.db $00                                                  ; $919b : $00
	.db $00                                                  ; $919c : $00
	.db $00                                                  ; $919d : $00
	.db $00                                                  ; $919e : $00
	.db $00                                                  ; $919f : $00
	.db $00                                                  ; $91a0 : $00
	.db $00                                                  ; $91a1 : $00
	.db $00                                                  ; $91a2 : $00
	.db $00                                                  ; $91a3 : $00
	.db $00                                                  ; $91a4 : $00
	.db $00                                                  ; $91a5 : $00
	.db $00                                                  ; $91a6 : $00
	.db $00                                                  ; $91a7 : $00
	.db $00                                                  ; $91a8 : $00
	.db $00                                                  ; $91a9 : $00
	.db $00                                                  ; $91aa : $00
	.db $00                                                  ; $91ab : $00
	.db $00                                                  ; $91ac : $00
	.db $00                                                  ; $91ad : $00
	.db $00                                                  ; $91ae : $00
	.db $00                                                  ; $91af : $00
	.db $00                                                  ; $91b0 : $00
	.db $00                                                  ; $91b1 : $00
	.db $00                                                  ; $91b2 : $00
	.db $00                                                  ; $91b3 : $00
	.db $00                                                  ; $91b4 : $00
	.db $00                                                  ; $91b5 : $00
	.db $00                                                  ; $91b6 : $00
	.db $00                                                  ; $91b7 : $00
	.db $00                                                  ; $91b8 : $00
	.db $00                                                  ; $91b9 : $00
	.db $00                                                  ; $91ba : $00
	.db $00                                                  ; $91bb : $00
	.db $00                                                  ; $91bc : $00
	.db $00                                                  ; $91bd : $00
	.db $00                                                  ; $91be : $00
	.db $00                                                  ; $91bf : $00
	.db $00                                                  ; $91c0 : $00
	.db $00                                                  ; $91c1 : $00
	.db $00                                                  ; $91c2 : $00
	.db $00                                                  ; $91c3 : $00
	.db $00                                                  ; $91c4 : $00
	.db $00                                                  ; $91c5 : $00
	.db $00                                                  ; $91c6 : $00
	.db $00                                                  ; $91c7 : $00
	.db $00                                                  ; $91c8 : $00
	.db $00                                                  ; $91c9 : $00
	.db $00                                                  ; $91ca : $00
	.db $00                                                  ; $91cb : $00
	.db $00                                                  ; $91cc : $00
	.db $00                                                  ; $91cd : $00
	.db $00                                                  ; $91ce : $00
	.db $00                                                  ; $91cf : $00
	.db $00                                                  ; $91d0 : $00
	.db $00                                                  ; $91d1 : $00
	.db $00                                                  ; $91d2 : $00
	.db $00                                                  ; $91d3 : $00
	.db $00                                                  ; $91d4 : $00
	.db $00                                                  ; $91d5 : $00
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
	.db $00                                                  ; $91e0 : $00
	.db $00                                                  ; $91e1 : $00
	.db $00                                                  ; $91e2 : $00
	.db $00                                                  ; $91e3 : $00
	.db $00                                                  ; $91e4 : $00
	.db $00                                                  ; $91e5 : $00
	.db $00                                                  ; $91e6 : $00
	.db $00                                                  ; $91e7 : $00
	.db $00                                                  ; $91e8 : $00
	.db $00                                                  ; $91e9 : $00
	.db $00                                                  ; $91ea : $00
	.db $00                                                  ; $91eb : $00
	.db $00                                                  ; $91ec : $00
	.db $00                                                  ; $91ed : $00
	.db $00                                                  ; $91ee : $00
	.db $00                                                  ; $91ef : $00
	.db $00                                                  ; $91f0 : $00
	.db $00                                                  ; $91f1 : $00
	.db $00                                                  ; $91f2 : $00
	.db $00                                                  ; $91f3 : $00
	.db $00                                                  ; $91f4 : $00
	.db $00                                                  ; $91f5 : $00
	.db $00                                                  ; $91f6 : $00
	.db $00                                                  ; $91f7 : $00
	.db $00                                                  ; $91f8 : $00
	.db $00                                                  ; $91f9 : $00
	.db $00                                                  ; $91fa : $00
	.db $00                                                  ; $91fb : $00
	.db $00                                                  ; $91fc : $00
	.db $00                                                  ; $91fd : $00
	.db $00                                                  ; $91fe : $00
	.db $00                                                  ; $91ff : $00
	.db $00                                                  ; $9200 : $00
	.db $00                                                  ; $9201 : $00
	.db $00                                                  ; $9202 : $00
	.db $00                                                  ; $9203 : $00
	.db $00                                                  ; $9204 : $00
	.db $00                                                  ; $9205 : $00
	.db $00                                                  ; $9206 : $00
	.db $00                                                  ; $9207 : $00
	.db $00                                                  ; $9208 : $00
	.db $00                                                  ; $9209 : $00
	.db $00                                                  ; $920a : $00
	.db $00                                                  ; $920b : $00
	.db $00                                                  ; $920c : $00
	.db $00                                                  ; $920d : $00
	.db $00                                                  ; $920e : $00
	.db $00                                                  ; $920f : $00
	.db $00                                                  ; $9210 : $00
	.db $00                                                  ; $9211 : $00
	.db $00                                                  ; $9212 : $00
	.db $00                                                  ; $9213 : $00
	.db $00                                                  ; $9214 : $00
	.db $00                                                  ; $9215 : $00
	.db $00                                                  ; $9216 : $00
	.db $00                                                  ; $9217 : $00
	.db $00                                                  ; $9218 : $00
	.db $00                                                  ; $9219 : $00
	.db $00                                                  ; $921a : $00
	.db $00                                                  ; $921b : $00
	.db $00                                                  ; $921c : $00
	.db $00                                                  ; $921d : $00
	.db $00                                                  ; $921e : $00
	.db $00                                                  ; $921f : $00
	.db $00                                                  ; $9220 : $00
	.db $00                                                  ; $9221 : $00
	.db $00                                                  ; $9222 : $00
	.db $00                                                  ; $9223 : $00
	.db $00                                                  ; $9224 : $00
	.db $00                                                  ; $9225 : $00
	.db $00                                                  ; $9226 : $00
	.db $00                                                  ; $9227 : $00
	.db $00                                                  ; $9228 : $00
	.db $00                                                  ; $9229 : $00
	.db $00                                                  ; $922a : $00
	.db $00                                                  ; $922b : $00
	.db $00                                                  ; $922c : $00
	.db $00                                                  ; $922d : $00
	.db $00                                                  ; $922e : $00
	.db $00                                                  ; $922f : $00
	.db $00                                                  ; $9230 : $00
	.db $00                                                  ; $9231 : $00
	.db $00                                                  ; $9232 : $00
	.db $00                                                  ; $9233 : $00
	.db $00                                                  ; $9234 : $00
	.db $00                                                  ; $9235 : $00
	.db $00                                                  ; $9236 : $00
	.db $00                                                  ; $9237 : $00
	.db $00                                                  ; $9238 : $00
	.db $00                                                  ; $9239 : $00
	.db $00                                                  ; $923a : $00
	.db $00                                                  ; $923b : $00
	.db $00                                                  ; $923c : $00
	.db $00                                                  ; $923d : $00
	.db $00                                                  ; $923e : $00
	.db $00                                                  ; $923f : $00
	.db $00                                                  ; $9240 : $00
	.db $00                                                  ; $9241 : $00
	.db $00                                                  ; $9242 : $00
	.db $00                                                  ; $9243 : $00
	.db $00                                                  ; $9244 : $00
	.db $00                                                  ; $9245 : $00
	.db $00                                                  ; $9246 : $00
	.db $00                                                  ; $9247 : $00
	.db $00                                                  ; $9248 : $00
	.db $00                                                  ; $9249 : $00
	.db $00                                                  ; $924a : $00
	.db $00                                                  ; $924b : $00
	.db $00                                                  ; $924c : $00
	.db $00                                                  ; $924d : $00
	.db $00                                                  ; $924e : $00
	.db $00                                                  ; $924f : $00
	.db $00                                                  ; $9250 : $00
	.db $00                                                  ; $9251 : $00
	.db $00                                                  ; $9252 : $00
	jsr $f334.w                                                  ; $9253 : $20, $34, $f3
	bit $f4, X                                                  ; $9256 : $34, $f4
	bit $f5, X                                                  ; $9258 : $34, $f5
	bit $f6, X                                                  ; $925a : $34, $f6
	bit $f7, X                                                  ; $925c : $34, $f7
	bit $f8, X                                                  ; $925e : $34, $f8
	and $23, X                                                  ; $9260 : $35, $23
	and $3f, X                                                  ; $9262 : $35, $3f
	ora [$17], Y                                                  ; $9264 : $17, $17
	ora [$17], Y                                                  ; $9266 : $17, $17
	ora [$1c], Y                                                  ; $9268 : $17, $1c
	ora ($05, X)                                                  ; $926a : $01, $05
	ora $60, S                                                  ; $926c : $03, $60
	asl $e1                                                  ; $926e : $06, $e1
	ora [$5a]                                                  ; $9270 : $07, $5a
	ora #$01.b                                                  ; $9272 : $09, $01
	ora $081f.w, X                                                  ; $9274 : $1d, $1f, $08
	ora $066803.l, X                                                  ; $9277 : $1f, $03, $68, $06
	and [$07], Y                                                  ; $927b : $37, $07
	eor ($09, X)                                                  ; $927d : $41, $09
	ora ($1d, X)                                                  ; $927f : $01, $1d
	trb $08                                                  ; $9281 : $14, $08
	trb $03                                                  ; $9283 : $14, $03
	ora ($21, X)                                                  ; $9285 : $01, $21
	ora $317f.w                                                  ; $9287 : $0d, $7f, $31
	and ($36)                                                  ; $928a : $32, $36
	and $033d.w, Y                                                  ; $928c : $39, $3d, $03
	plp                                                  ; $928f : $28
	ora ($ac, X)                                                  ; $9290 : $01, $ac
	ldy #$1c17.w                                                  ; $9292 : $a0, $17, $1c
	ora ($05, X)                                                  ; $9295 : $01, $05
	ora $60, S                                                  ; $9297 : $03, $60
	asl $e1                                                  ; $9299 : $06, $e1
	ora [$50]                                                  ; $929b : $07, $50
	ora #$01.b                                                  ; $929d : $09, $01
	tsb $1dce.w                                                  ; $929f : $0c, $ce, $1d
	ora $012708.l, X                                                  ; $92a2 : $1f, $08, $27, $01
	eor $037b01.l                                                  ; $92a6 : $4f, $01, $7b, $03
	ora ($29, X)                                                  ; $92aa : $01, $29
	ora $01, S                                                  ; $92ac : $03, $01
	tya                                                  ; $92ae : $98
	ora [$17], Y                                                  ; $92af : $17, $17
	jsr $5135.w                                                  ; $92b1 : $20, $35, $51
	and $52, X                                                  ; $92b4 : $35, $52
	and $53, X                                                  ; $92b6 : $35, $53
	and $54, X                                                  ; $92b8 : $35, $54
	and $55, X                                                  ; $92ba : $35, $55
	and $56, X                                                  ; $92bc : $35, $56
	and $81, X                                                  ; $92be : $35, $81
	and $9d, X                                                  ; $92c0 : $35, $9d
	ora [$17], Y                                                  ; $92c2 : $17, $17
	ora [$17], Y                                                  ; $92c4 : $17, $17
	ora [$1c], Y                                                  ; $92c6 : $17, $1c
	ora ($05, X)                                                  ; $92c8 : $01, $05
	cop $60.b                                                  ; $92ca : $02, $60
	asl $e1                                                  ; $92cc : $06, $e1
	ora [$60]                                                  ; $92ce : $07, $60
	ora #$01.b                                                  ; $92d0 : $09, $01
	ora $081f.w, X                                                  ; $92d2 : $1d, $1f, $08
	ora $066803.l, X                                                  ; $92d5 : $1f, $03, $68, $06
	and [$07], Y                                                  ; $92d9 : $37, $07
	eor ($09, X)                                                  ; $92db : $41, $09
	ora ($1d, X)                                                  ; $92dd : $01, $1d
	trb $08                                                  ; $92df : $14, $08
	trb $03                                                  ; $92e1 : $14, $03
	ora ($21, X)                                                  ; $92e3 : $01, $21
	ora $317f.w                                                  ; $92e5 : $0d, $7f, $31
	and ($36)                                                  ; $92e8 : $32, $36
	and $033d.w, Y                                                  ; $92ea : $39, $3d, $03
	plp                                                  ; $92ed : $28
	ora ($ac, X)                                                  ; $92ee : $01, $ac
	ldy #$1c17.w                                                  ; $92f0 : $a0, $17, $1c
	ora ($05, X)                                                  ; $92f3 : $01, $05
	cop $60.b                                                  ; $92f5 : $02, $60
	asl $e1                                                  ; $92f7 : $06, $e1
	ora [$59]                                                  ; $92f9 : $07, $59
	ora #$01.b                                                  ; $92fb : $09, $01
	tsb $1dce.w                                                  ; $92fd : $0c, $ce, $1d
	ora $012708.l, X                                                  ; $9300 : $1f, $08, $27, $01
	eor $037b01.l                                                  ; $9304 : $4f, $01, $7b, $03
	ora ($29, X)                                                  ; $9308 : $01, $29
	ora $01, S                                                  ; $930a : $03, $01
	tya                                                  ; $930c : $98
	ora [$17], Y                                                  ; $930d : $17, $17
	jsr $af35.w                                                  ; $930f : $20, $35, $af
	and $b0, X                                                  ; $9312 : $35, $b0
	and $b1, X                                                  ; $9314 : $35, $b1
	and $b2, X                                                  ; $9316 : $35, $b2
	and $b3, X                                                  ; $9318 : $35, $b3
	and $b4, X                                                  ; $931a : $35, $b4
	and $b5, X                                                  ; $931c : $35, $b5
	and $dd, X                                                  ; $931e : $35, $dd
	ora [$17], Y                                                  ; $9320 : $17, $17
	ora [$17], Y                                                  ; $9322 : $17, $17
	ora [$17], Y                                                  ; $9324 : $17, $17
	trb $0501.w                                                  ; $9326 : $1c, $01, $05
	cop $30.b                                                  ; $9329 : $02, $30
	asl $10                                                  ; $932b : $06, $10
	ora [$45]                                                  ; $932d : $07, $45
	ora #$06.b                                                  ; $932f : $09, $06
	ina                                                  ; $9331 : $1a
	.db $00                                                  ; $9332 : $00
	bpl br_0c_934f                                                  ; $9333 : $10, $1a

	ora ($10, X)                                                  ; $9335 : $01, $10
	ina                                                  ; $9337 : $1a
	cop $60.b                                                  ; $9338 : $02, $60
	php                                                  ; $933a : $08
	asl $03, X                                                  ; $933b : $16, $03
	adc $3a07.w                                                  ; $933d : $6d, $07, $3a
	adc $2007.w                                                  ; $9340 : $6d, $07, $20
	adc $1a07.w                                                  ; $9343 : $6d, $07, $1a
	adc $1007.w                                                  ; $9346 : $6d, $07, $10
	adc $0907.w                                                  ; $9349 : $6d, $07, $09
	adc $1717.w                                                  ; $934c : $6d, $17, $17

br_0c_934f:
	jsr $ef35.w                                                  ; $934f : $20, $35, $ef
	and $f0, X                                                  ; $9352 : $35, $f0
	and $f1, X                                                  ; $9354 : $35, $f1
	and $f2, X                                                  ; $9356 : $35, $f2
	and $f3, X                                                  ; $9358 : $35, $f3
	and $f4, X                                                  ; $935a : $35, $f4
	and $f5, X                                                  ; $935c : $35, $f5
	rol $0e, X                                                  ; $935e : $36, $0e
	ora [$17], Y                                                  ; $9360 : $17, $17
	ora [$17], Y                                                  ; $9362 : $17, $17
	ora [$17], Y                                                  ; $9364 : $17, $17
	trb $0501.w                                                  ; $9366 : $1c, $01, $05
	ora ($00, X)                                                  ; $9369 : $01, $00

br_0c_936b:
	asl $9b                                                  ; $936b : $06, $9b
	ora [$7a]                                                  ; $936d : $07, $7a
	ora #$02.b                                                  ; $936f : $09, $02

br_0c_9371:
	ina                                                  ; $9371 : $1a
	.db $00                                                  ; $9372 : $00
	ora [$1a]                                                  ; $9373 : $07, $1a
	cop $ff.b                                                  ; $9375 : $02, $ff
	php                                                  ; $9377 : $08
	tsb $4903.w                                                  ; $9378 : $0c, $03, $49
	eor #$49.b                                                  ; $937b : $49, $49
	eor #$17.b                                                  ; $937d : $49, $17
	ora [$20], Y                                                  ; $937f : $17, $20
	rol $20, X                                                  ; $9381 : $36, $20
	rol $21, X                                                  ; $9383 : $36, $21
	rol $22, X                                                  ; $9385 : $36, $22
	rol $23, X                                                  ; $9387 : $36, $23
	rol $24, X                                                  ; $9389 : $36, $24
	rol $25, X                                                  ; $938b : $36, $25
	rol $26, X                                                  ; $938d : $36, $26
	rol $49, X                                                  ; $938f : $36, $49
	ora [$17], Y                                                  ; $9391 : $17, $17
	ora [$17], Y                                                  ; $9393 : $17, $17
	ora [$17], Y                                                  ; $9395 : $17, $17
	trb $0501.w                                                  ; $9397 : $1c, $01, $05
	ora ($c0, X)                                                  ; $939a : $01, $c0
	asl $c8                                                  ; $939c : $06, $c8
	ora [$37]                                                  ; $939e : $07, $37
	ora #$02.b                                                  ; $93a0 : $09, $02
	ina                                                  ; $93a2 : $1a
	.db $00                                                  ; $93a3 : $00
	stz $1a                                                  ; $93a4 : $64, $1a
	cop $ff.b                                                  ; $93a6 : $02, $ff
	ora $08ff.w, X                                                  ; $93a8 : $1d, $ff, $08
	ora ($0d)                                                  ; $93ab : $12, $0d
	jsr $6203.w                                                  ; $93ad : $20, $03, $62
	adc $64, S                                                  ; $93b0 : $63, $64
	adc $66                                                  ; $93b2 : $65, $66
	adc [$68]                                                  ; $93b4 : $67, $68
	adc #$6a.b                                                  ; $93b6 : $69, $6a
	rtl                                                  ; $93b8 : $6b


	ora [$17], Y                                                  ; $93b9 : $17, $17
	.db $00                                                  ; $93bb : $00
	.db $00                                                  ; $93bc : $00
	.db $00                                                  ; $93bd : $00
	.db $00                                                  ; $93be : $00
	sbc $520010.l, X                                                  ; $93bf : $ff, $10, $00, $52
	ora $e234.w, Y                                                  ; $93c3 : $19, $34, $e2
	and $25, X                                                  ; $93c6 : $35, $25
	and $68, X                                                  ; $93c8 : $35, $68
	and $9d, X                                                  ; $93ca : $35, $9d
	and $e2, X                                                  ; $93cc : $35, $e2
	rol $17, X                                                  ; $93ce : $36, $17
	rol $48, X                                                  ; $93d0 : $36, $48
	rol $64, X                                                  ; $93d2 : $36, $64
	sta [$02], Y                                                  ; $93d4 : $97, $02
	.db $00                                                  ; $93d6 : $00
	bit $78, X                                                  ; $93d7 : $34, $78
	jmp ($0000.w)                                                  ; $93d9 : $6c, $00, $00


	.db $00                                                  ; $93dc : $00
	.db $00                                                  ; $93dd : $00
	.db $00                                                  ; $93de : $00
	.db $00                                                  ; $93df : $00
	.db $00                                                  ; $93e0 : $00
	.db $00                                                  ; $93e1 : $00
	.db $00                                                  ; $93e2 : $00
	.db $00                                                  ; $93e3 : $00
	.db $00                                                  ; $93e4 : $00
	.db $00                                                  ; $93e5 : $00
	.db $00                                                  ; $93e6 : $00
	.db $00                                                  ; $93e7 : $00
	.db $00                                                  ; $93e8 : $00
	.db $00                                                  ; $93e9 : $00
	.db $00                                                  ; $93ea : $00
	.db $00                                                  ; $93eb : $00
	.db $00                                                  ; $93ec : $00
	.db $00                                                  ; $93ed : $00
	.db $00                                                  ; $93ee : $00
	.db $00                                                  ; $93ef : $00
	.db $00                                                  ; $93f0 : $00
	.db $00                                                  ; $93f1 : $00
	.db $00                                                  ; $93f2 : $00
	.db $00                                                  ; $93f3 : $00
	.db $00                                                  ; $93f4 : $00
	.db $00                                                  ; $93f5 : $00
	.db $00                                                  ; $93f6 : $00
	.db $00                                                  ; $93f7 : $00
	.db $00                                                  ; $93f8 : $00
	.db $00                                                  ; $93f9 : $00
	.db $00                                                  ; $93fa : $00
	.db $00                                                  ; $93fb : $00
	.db $00                                                  ; $93fc : $00
	.db $00                                                  ; $93fd : $00
	.db $00                                                  ; $93fe : $00
	.db $00                                                  ; $93ff : $00
	.db $00                                                  ; $9400 : $00
	.db $00                                                  ; $9401 : $00
	.db $00                                                  ; $9402 : $00
	.db $00                                                  ; $9403 : $00
	.db $00                                                  ; $9404 : $00
	.db $00                                                  ; $9405 : $00
	.db $00                                                  ; $9406 : $00
	.db $00                                                  ; $9407 : $00
	.db $00                                                  ; $9408 : $00
	.db $00                                                  ; $9409 : $00
	.db $00                                                  ; $940a : $00
	.db $00                                                  ; $940b : $00
	.db $00                                                  ; $940c : $00
	.db $00                                                  ; $940d : $00
	.db $00                                                  ; $940e : $00
	.db $00                                                  ; $940f : $00
	.db $00                                                  ; $9410 : $00
	.db $00                                                  ; $9411 : $00
	.db $00                                                  ; $9412 : $00
	.db $00                                                  ; $9413 : $00
	.db $00                                                  ; $9414 : $00
	.db $00                                                  ; $9415 : $00
	.db $00                                                  ; $9416 : $00
	.db $00                                                  ; $9417 : $00
	.db $00                                                  ; $9418 : $00
	.db $00                                                  ; $9419 : $00
	.db $00                                                  ; $941a : $00
	.db $00                                                  ; $941b : $00
	.db $00                                                  ; $941c : $00
	.db $00                                                  ; $941d : $00
	.db $00                                                  ; $941e : $00
	.db $00                                                  ; $941f : $00
	.db $00                                                  ; $9420 : $00
	.db $00                                                  ; $9421 : $00
	.db $00                                                  ; $9422 : $00
	.db $00                                                  ; $9423 : $00
	.db $00                                                  ; $9424 : $00
	.db $00                                                  ; $9425 : $00
	.db $00                                                  ; $9426 : $00
	.db $00                                                  ; $9427 : $00
	.db $00                                                  ; $9428 : $00
	.db $00                                                  ; $9429 : $00
	.db $00                                                  ; $942a : $00
	.db $00                                                  ; $942b : $00
	.db $00                                                  ; $942c : $00
	.db $00                                                  ; $942d : $00
	.db $00                                                  ; $942e : $00
	.db $00                                                  ; $942f : $00
	.db $00                                                  ; $9430 : $00
	.db $00                                                  ; $9431 : $00
	.db $00                                                  ; $9432 : $00
	.db $00                                                  ; $9433 : $00
	.db $00                                                  ; $9434 : $00
	.db $00                                                  ; $9435 : $00
	.db $00                                                  ; $9436 : $00
	.db $00                                                  ; $9437 : $00
	.db $00                                                  ; $9438 : $00
	.db $00                                                  ; $9439 : $00
	.db $00                                                  ; $943a : $00
	.db $00                                                  ; $943b : $00
	.db $00                                                  ; $943c : $00
	.db $00                                                  ; $943d : $00
	.db $00                                                  ; $943e : $00
	.db $00                                                  ; $943f : $00
	.db $00                                                  ; $9440 : $00
	.db $00                                                  ; $9441 : $00
	.db $00                                                  ; $9442 : $00
	.db $00                                                  ; $9443 : $00
	.db $00                                                  ; $9444 : $00
	.db $00                                                  ; $9445 : $00
	.db $00                                                  ; $9446 : $00
	.db $00                                                  ; $9447 : $00
	.db $00                                                  ; $9448 : $00
	.db $00                                                  ; $9449 : $00
	.db $00                                                  ; $944a : $00
	.db $00                                                  ; $944b : $00
	.db $00                                                  ; $944c : $00
	.db $00                                                  ; $944d : $00
	.db $00                                                  ; $944e : $00
	.db $00                                                  ; $944f : $00
	.db $00                                                  ; $9450 : $00
	.db $00                                                  ; $9451 : $00
	.db $00                                                  ; $9452 : $00
	.db $00                                                  ; $9453 : $00
	.db $00                                                  ; $9454 : $00
	.db $00                                                  ; $9455 : $00
	.db $00                                                  ; $9456 : $00
	.db $00                                                  ; $9457 : $00
	.db $00                                                  ; $9458 : $00
	.db $00                                                  ; $9459 : $00
	.db $00                                                  ; $945a : $00
	.db $00                                                  ; $945b : $00
	.db $00                                                  ; $945c : $00
	.db $00                                                  ; $945d : $00
	.db $00                                                  ; $945e : $00
	.db $00                                                  ; $945f : $00
	.db $00                                                  ; $9460 : $00
	.db $00                                                  ; $9461 : $00
	.db $00                                                  ; $9462 : $00
	.db $00                                                  ; $9463 : $00
	.db $00                                                  ; $9464 : $00
	.db $00                                                  ; $9465 : $00
	.db $00                                                  ; $9466 : $00
	.db $00                                                  ; $9467 : $00
	.db $00                                                  ; $9468 : $00
	.db $00                                                  ; $9469 : $00
	.db $00                                                  ; $946a : $00
	.db $00                                                  ; $946b : $00
	.db $00                                                  ; $946c : $00
	.db $00                                                  ; $946d : $00
	.db $00                                                  ; $946e : $00
	.db $00                                                  ; $946f : $00
	.db $00                                                  ; $9470 : $00
	.db $00                                                  ; $9471 : $00
	.db $00                                                  ; $9472 : $00
	.db $00                                                  ; $9473 : $00
	.db $00                                                  ; $9474 : $00
	.db $00                                                  ; $9475 : $00
	.db $00                                                  ; $9476 : $00
	.db $00                                                  ; $9477 : $00
	.db $00                                                  ; $9478 : $00
	.db $00                                                  ; $9479 : $00
	.db $00                                                  ; $947a : $00
	.db $00                                                  ; $947b : $00
	.db $00                                                  ; $947c : $00
	.db $00                                                  ; $947d : $00
	.db $00                                                  ; $947e : $00
	.db $00                                                  ; $947f : $00
	.db $00                                                  ; $9480 : $00
	.db $00                                                  ; $9481 : $00
	.db $00                                                  ; $9482 : $00
	.db $00                                                  ; $9483 : $00
	.db $00                                                  ; $9484 : $00
	.db $00                                                  ; $9485 : $00
	.db $00                                                  ; $9486 : $00
	.db $00                                                  ; $9487 : $00
	.db $00                                                  ; $9488 : $00
	.db $00                                                  ; $9489 : $00
	.db $00                                                  ; $948a : $00
	.db $00                                                  ; $948b : $00
	.db $00                                                  ; $948c : $00
	.db $00                                                  ; $948d : $00
	.db $00                                                  ; $948e : $00
	.db $00                                                  ; $948f : $00
	.db $00                                                  ; $9490 : $00
	.db $00                                                  ; $9491 : $00
	.db $00                                                  ; $9492 : $00
	.db $00                                                  ; $9493 : $00
	.db $00                                                  ; $9494 : $00
	.db $00                                                  ; $9495 : $00
	.db $00                                                  ; $9496 : $00
	.db $00                                                  ; $9497 : $00
	.db $00                                                  ; $9498 : $00
	.db $00                                                  ; $9499 : $00
	.db $00                                                  ; $949a : $00
	.db $00                                                  ; $949b : $00
	.db $00                                                  ; $949c : $00
	.db $00                                                  ; $949d : $00
	.db $00                                                  ; $949e : $00
	.db $00                                                  ; $949f : $00
	.db $00                                                  ; $94a0 : $00
	.db $00                                                  ; $94a1 : $00
	.db $00                                                  ; $94a2 : $00
	.db $00                                                  ; $94a3 : $00
	.db $00                                                  ; $94a4 : $00
	.db $00                                                  ; $94a5 : $00
	.db $00                                                  ; $94a6 : $00
	.db $00                                                  ; $94a7 : $00
	.db $00                                                  ; $94a8 : $00
	.db $00                                                  ; $94a9 : $00
	.db $00                                                  ; $94aa : $00
	.db $00                                                  ; $94ab : $00
	.db $00                                                  ; $94ac : $00
	.db $00                                                  ; $94ad : $00
	.db $00                                                  ; $94ae : $00
	.db $00                                                  ; $94af : $00
	.db $00                                                  ; $94b0 : $00
	.db $00                                                  ; $94b1 : $00
	.db $00                                                  ; $94b2 : $00
	.db $00                                                  ; $94b3 : $00
	.db $00                                                  ; $94b4 : $00
	.db $00                                                  ; $94b5 : $00
	.db $00                                                  ; $94b6 : $00
	.db $00                                                  ; $94b7 : $00
	.db $00                                                  ; $94b8 : $00
	.db $00                                                  ; $94b9 : $00
	jsr $f334.w                                                  ; $94ba : $20, $34, $f3
	bit $f4, X                                                  ; $94bd : $34, $f4
	bit $f5, X                                                  ; $94bf : $34, $f5
	bit $f6, X                                                  ; $94c1 : $34, $f6
	bit $f7, X                                                  ; $94c3 : $34, $f7
	bit $f8, X                                                  ; $94c5 : $34, $f8
	bit $f9, X                                                  ; $94c7 : $34, $f9
	bit $fa, X                                                  ; $94c9 : $34, $fa
	ora [$17], Y                                                  ; $94cb : $17, $17
	ora [$17], Y                                                  ; $94cd : $17, $17
	ora [$17], Y                                                  ; $94cf : $17, $17
	ora [$05], Y                                                  ; $94d1 : $17, $05
	.db $00                                                  ; $94d3 : $00
	tsx                                                  ; $94d4 : $ba
	asl $40                                                  ; $94d5 : $06, $40
	ora [$60]                                                  ; $94d7 : $07, $60
	ora #$02.b                                                  ; $94d9 : $09, $02
	ora $0810.w, X                                                  ; $94db : $1d, $10, $08
	phd                                                  ; $94de : $0b
	ora $4d, S                                                  ; $94df : $03, $4d
	ora [$5a]                                                  ; $94e1 : $07, $5a
	eor $5007.w                                                  ; $94e3 : $4d, $07, $50
	eor $4a07.w                                                  ; $94e6 : $4d, $07, $4a
	eor $4007.w                                                  ; $94e9 : $4d, $07, $40
	eor $3a07.w                                                  ; $94ec : $4d, $07, $3a
	eor $3007.w                                                  ; $94ef : $4d, $07, $30
	eor $2a07.w                                                  ; $94f2 : $4d, $07, $2a
	eor $2007.w                                                  ; $94f5 : $4d, $07, $20
	eor $1a07.w                                                  ; $94f8 : $4d, $07, $1a
	eor $2017.w                                                  ; $94fb : $4d, $17, $20
	and $36, X                                                  ; $94fe : $35, $36
	and $37, X                                                  ; $9500 : $35, $37
	and $38, X                                                  ; $9502 : $35, $38
	and $39, X                                                  ; $9504 : $35, $39
	and $3a, X                                                  ; $9506 : $35, $3a
	and $3b, X                                                  ; $9508 : $35, $3b
	and $3c, X                                                  ; $950a : $35, $3c
	and $3d, X                                                  ; $950c : $35, $3d
	ora [$17], Y                                                  ; $950e : $17, $17
	ora [$17], Y                                                  ; $9510 : $17, $17
	ora [$17], Y                                                  ; $9512 : $17, $17
	ora [$05], Y                                                  ; $9514 : $17, $05
	.db $00                                                  ; $9516 : $00
	.db $d0, $06                                                  ; $9517 : $d0, $06

	rti                                                  ; $9519 : $40


	ora [$20]                                                  ; $951a : $07, $20
	ora #$02.b                                                  ; $951c : $09, $02
	ora $0810.w, X                                                  ; $951e : $1d, $10, $08
	phd                                                  ; $9521 : $0b
	ora $4d, S                                                  ; $9522 : $03, $4d
	ora [$20]                                                  ; $9524 : $07, $20
	eor $2a07.w                                                  ; $9526 : $4d, $07, $2a
	eor $3007.w                                                  ; $9529 : $4d, $07, $30
	eor $3a07.w                                                  ; $952c : $4d, $07, $3a
	eor $4007.w                                                  ; $952f : $4d, $07, $40
	eor $4a07.w                                                  ; $9532 : $4d, $07, $4a
	eor $5007.w                                                  ; $9535 : $4d, $07, $50
	eor $5a07.w                                                  ; $9538 : $4d, $07, $5a
	eor $6007.w                                                  ; $953b : $4d, $07, $60
	eor $2017.w                                                  ; $953e : $4d, $17, $20
	and $79, X                                                  ; $9541 : $35, $79
	and $7a, X                                                  ; $9543 : $35, $7a
	and $7b, X                                                  ; $9545 : $35, $7b
	and $7c, X                                                  ; $9547 : $35, $7c
	and $7d, X                                                  ; $9549 : $35, $7d
	and $7e, X                                                  ; $954b : $35, $7e
	and $7f, X                                                  ; $954d : $35, $7f
	and $80, X                                                  ; $954f : $35, $80
	ora [$17], Y                                                  ; $9551 : $17, $17
	ora [$17], Y                                                  ; $9553 : $17, $17
	ora [$17], Y                                                  ; $9555 : $17, $17
	ora [$05], Y                                                  ; $9557 : $17, $05
	ora ($dd, X)                                                  ; $9559 : $01, $dd
	asl $20                                                  ; $955b : $06, $20
	ora [$6c]                                                  ; $955d : $07, $6c
	ora #$02.b                                                  ; $955f : $09, $02
	ora $0810.w, X                                                  ; $9561 : $1d, $10, $08
	phd                                                  ; $9564 : $0b
	ora $01, S                                                  ; $9565 : $03, $01
	and $7f0d.w                                                  ; $9567 : $2d, $0d, $7f
	ora ($72, X)                                                  ; $956a : $01, $72
	ora ($36, X)                                                  ; $956c : $01, $36
	ora $017f.w                                                  ; $956e : $0d, $7f, $01
	adc ($01)                                                  ; $9571 : $72, $01
	rol $17, X                                                  ; $9573 : $36, $17
	jsr $ae35.w                                                  ; $9575 : $20, $35, $ae
	and $af, X                                                  ; $9578 : $35, $af
	and $b0, X                                                  ; $957a : $35, $b0
	and $b1, X                                                  ; $957c : $35, $b1
	and $b2, X                                                  ; $957e : $35, $b2
	and $b3, X                                                  ; $9580 : $35, $b3
	and $b4, X                                                  ; $9582 : $35, $b4
	and $b5, X                                                  ; $9584 : $35, $b5
	ora [$17], Y                                                  ; $9586 : $17, $17
	ora [$17], Y                                                  ; $9588 : $17, $17
	ora [$17], Y                                                  ; $958a : $17, $17
	ora [$1c], Y                                                  ; $958c : $17, $1c
	ora ($05, X)                                                  ; $958e : $01, $05
	cop $a0.b                                                  ; $9590 : $02, $a0
	asl $7d                                                  ; $9592 : $06, $7d
	ora [$40]                                                  ; $9594 : $07, $40
	ora #$03.b                                                  ; $9596 : $09, $03
	ora $081f.w, X                                                  ; $9598 : $1d, $1f, $08
	ora ($03)                                                  ; $959b : $12, $03
	pha                                                  ; $959d : $48
	ora [$4a]                                                  ; $959e : $07, $4a
	ora #$04.b                                                  ; $95a0 : $09, $04
	ina                                                  ; $95a2 : $1a
	.db $00                                                  ; $95a3 : $00
	and $1a, S                                                  ; $95a4 : $23, $1a
	cop $ff.b                                                  ; $95a6 : $02, $ff
	php                                                  ; $95a8 : $08
	phd                                                  ; $95a9 : $0b
	ora ($32, X)                                                  ; $95aa : $01, $32
	ora $2f7f.w                                                  ; $95ac : $0d, $7f, $2f
	pld                                                  ; $95af : $2b
	plp                                                  ; $95b0 : $28
	ora $01, S                                                  ; $95b1 : $03, $01
	and $6f0d.w                                                  ; $95b3 : $2d, $0d, $6f
	ora $a11b.w, X                                                  ; $95b6 : $1d, $1b, $a1
	ora [$20], Y                                                  ; $95b9 : $17, $20
	and $f3, X                                                  ; $95bb : $35, $f3
	and $f4, X                                                  ; $95bd : $35, $f4
	and $f5, X                                                  ; $95bf : $35, $f5
	and $f6, X                                                  ; $95c1 : $35, $f6
	and $f7, X                                                  ; $95c3 : $35, $f7
	and $f8, X                                                  ; $95c5 : $35, $f8
	and $f9, X                                                  ; $95c7 : $35, $f9
	and $fa, X                                                  ; $95c9 : $35, $fa
	ora [$17], Y                                                  ; $95cb : $17, $17
	ora [$17], Y                                                  ; $95cd : $17, $17
	ora [$17], Y                                                  ; $95cf : $17, $17
	ora [$05], Y                                                  ; $95d1 : $17, $05
	ora ($dd, X)                                                  ; $95d3 : $01, $dd
	asl $20                                                  ; $95d5 : $06, $20
	ora [$6c]                                                  ; $95d7 : $07, $6c
	ora #$02.b                                                  ; $95d9 : $09, $02
	ora $0810.w, X                                                  ; $95db : $1d, $10, $08
	phd                                                  ; $95de : $0b
	ora $01, S                                                  ; $95df : $03, $01
	and $7f0d.w                                                  ; $95e1 : $2d, $0d, $7f
	ora ($72, X)                                                  ; $95e4 : $01, $72
	ora ($36, X)                                                  ; $95e6 : $01, $36
	ora $017f.w                                                  ; $95e8 : $0d, $7f, $01
	adc ($01)                                                  ; $95eb : $72, $01
	rol $17, X                                                  ; $95ed : $36, $17
	jsr $2836.w                                                  ; $95ef : $20, $36, $28
	rol $29, X                                                  ; $95f2 : $36, $29
	rol $2a, X                                                  ; $95f4 : $36, $2a
	rol $2b, X                                                  ; $95f6 : $36, $2b
	rol $2c, X                                                  ; $95f8 : $36, $2c
	rol $2d, X                                                  ; $95fa : $36, $2d
	rol $2e, X                                                  ; $95fc : $36, $2e
	rol $2f, X                                                  ; $95fe : $36, $2f
	ora [$17], Y                                                  ; $9600 : $17, $17
	ora [$17], Y                                                  ; $9602 : $17, $17
	ora [$17], Y                                                  ; $9604 : $17, $17
	ora [$05], Y                                                  ; $9606 : $17, $05
	.db $00                                                  ; $9608 : $00
	bra br_0c_9611                                                  ; $9609 : $80, $06

	ora $095007.l                                                  ; $960b : $0f, $07, $50, $09
	cop $08.b                                                  ; $960f : $02, $08

br_0c_9611:
	phd                                                  ; $9611 : $0b
	ora $01, S                                                  ; $9612 : $03, $01
	and $2d2d.w                                                  ; $9614 : $2d, $2d, $2d
	and $2d2d.w                                                  ; $9617 : $2d, $2d, $2d
	and $2d2d.w                                                  ; $961a : $2d, $2d, $2d
	and $172d.w                                                  ; $961d : $2d, $2d, $17
	jsr $5936.w                                                  ; $9620 : $20, $36, $59
	rol $5a, X                                                  ; $9623 : $36, $5a
	rol $5b, X                                                  ; $9625 : $36, $5b
	rol $5c, X                                                  ; $9627 : $36, $5c
	rol $5d, X                                                  ; $9629 : $36, $5d
	rol $5e, X                                                  ; $962b : $36, $5e
	rol $5f, X                                                  ; $962d : $36, $5f
	rol $60, X                                                  ; $962f : $36, $60
	ora [$17], Y                                                  ; $9631 : $17, $17
	ora [$17], Y                                                  ; $9633 : $17, $17
	ora [$17], Y                                                  ; $9635 : $17, $17
	ora [$07], Y                                                  ; $9637 : $17, $07
	ora ($fa, X)                                                  ; $9639 : $01, $fa
	ora [$20], Y                                                  ; $963b : $17, $20
	rol $75, X                                                  ; $963d : $36, $75
	rol $76, X                                                  ; $963f : $36, $76
	rol $77, X                                                  ; $9641 : $36, $77
	rol $78, X                                                  ; $9643 : $36, $78
	rol $79, X                                                  ; $9645 : $36, $79
	rol $7a, X                                                  ; $9647 : $36, $7a
	rol $7b, X                                                  ; $9649 : $36, $7b
	rol $7c, X                                                  ; $964b : $36, $7c
	ora [$17], Y                                                  ; $964d : $17, $17
	ora [$17], Y                                                  ; $964f : $17, $17
	ora [$17], Y                                                  ; $9651 : $17, $17
	ora [$1c], Y                                                  ; $9653 : $17, $1c
	ora ($05, X)                                                  ; $9655 : $01, $05
	.db $00                                                  ; $9657 : $00
	.db $d0, $06                                                  ; $9658 : $d0, $06

	xba                                                  ; $965a : $eb
	ora [$68]                                                  ; $965b : $07, $68
	ina                                                  ; $965d : $1a
	.db $00                                                  ; $965e : $00
	ora $0f021a.l                                                  ; $965f : $0f, $1a, $02, $0f
	ora $0812.w, X                                                  ; $9663 : $1d, $12, $08
	tsb $0309.w                                                  ; $9666 : $0c, $09, $03
	ora ($4d, X)                                                  ; $9669 : $01, $4d
	ora ($4e, X)                                                  ; $966b : $01, $4e
	ldy #$0017.w                                                  ; $966d : $a0, $17, $00
	.db $00                                                  ; $9670 : $00
	.db $00                                                  ; $9671 : $00
	.db $00                                                  ; $9672 : $00
	sbc $52000e.l, X                                                  ; $9673 : $ff, $0e, $00, $52
	ora $e234.w, Y                                                  ; $9677 : $19, $34, $e2
	and $39, X                                                  ; $967a : $35, $39
	and $6d, X                                                  ; $967c : $35, $6d
	and $b6, X                                                  ; $967e : $35, $b6
	and $f5, X                                                  ; $9680 : $35, $f5
	rol $11, X                                                  ; $9682 : $36, $11
	rol $46, X                                                  ; $9684 : $36, $46
	sta ($02, S), Y                                                  ; $9686 : $93, $02
	.db $00                                                  ; $9688 : $00
	bit $77, X                                                  ; $9689 : $34, $77
	jmp ($0000.w)                                                  ; $968b : $6c, $00, $00


	.db $00                                                  ; $968e : $00
	.db $00                                                  ; $968f : $00
	.db $00                                                  ; $9690 : $00
	.db $00                                                  ; $9691 : $00
	.db $00                                                  ; $9692 : $00
	.db $00                                                  ; $9693 : $00
	.db $00                                                  ; $9694 : $00
	.db $00                                                  ; $9695 : $00
	.db $00                                                  ; $9696 : $00
	.db $00                                                  ; $9697 : $00
	.db $00                                                  ; $9698 : $00
	.db $00                                                  ; $9699 : $00
	.db $00                                                  ; $969a : $00
	.db $00                                                  ; $969b : $00
	.db $00                                                  ; $969c : $00
	.db $00                                                  ; $969d : $00
	.db $00                                                  ; $969e : $00
	.db $00                                                  ; $969f : $00
	.db $00                                                  ; $96a0 : $00
	.db $00                                                  ; $96a1 : $00
	.db $00                                                  ; $96a2 : $00
	.db $00                                                  ; $96a3 : $00
	.db $00                                                  ; $96a4 : $00
	.db $00                                                  ; $96a5 : $00
	.db $00                                                  ; $96a6 : $00
	.db $00                                                  ; $96a7 : $00
	.db $00                                                  ; $96a8 : $00
	.db $00                                                  ; $96a9 : $00
	.db $00                                                  ; $96aa : $00
	.db $00                                                  ; $96ab : $00
	.db $00                                                  ; $96ac : $00
	.db $00                                                  ; $96ad : $00
	.db $00                                                  ; $96ae : $00
	.db $00                                                  ; $96af : $00
	.db $00                                                  ; $96b0 : $00
	.db $00                                                  ; $96b1 : $00
	.db $00                                                  ; $96b2 : $00
	.db $00                                                  ; $96b3 : $00
	.db $00                                                  ; $96b4 : $00
	.db $00                                                  ; $96b5 : $00
	.db $00                                                  ; $96b6 : $00
	.db $00                                                  ; $96b7 : $00
	.db $00                                                  ; $96b8 : $00
	.db $00                                                  ; $96b9 : $00
	.db $00                                                  ; $96ba : $00
	.db $00                                                  ; $96bb : $00
	.db $00                                                  ; $96bc : $00
	.db $00                                                  ; $96bd : $00
	.db $00                                                  ; $96be : $00
	.db $00                                                  ; $96bf : $00
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
	.db $00                                                  ; $96cb : $00
	.db $00                                                  ; $96cc : $00
	.db $00                                                  ; $96cd : $00
	.db $00                                                  ; $96ce : $00
	.db $00                                                  ; $96cf : $00
	.db $00                                                  ; $96d0 : $00
	.db $00                                                  ; $96d1 : $00
	.db $00                                                  ; $96d2 : $00
	.db $00                                                  ; $96d3 : $00
	.db $00                                                  ; $96d4 : $00
	.db $00                                                  ; $96d5 : $00
	.db $00                                                  ; $96d6 : $00
	.db $00                                                  ; $96d7 : $00
	.db $00                                                  ; $96d8 : $00
	.db $00                                                  ; $96d9 : $00
	.db $00                                                  ; $96da : $00
	.db $00                                                  ; $96db : $00
	.db $00                                                  ; $96dc : $00
	.db $00                                                  ; $96dd : $00
	.db $00                                                  ; $96de : $00
	.db $00                                                  ; $96df : $00
	.db $00                                                  ; $96e0 : $00
	.db $00                                                  ; $96e1 : $00
	.db $00                                                  ; $96e2 : $00
	.db $00                                                  ; $96e3 : $00
	.db $00                                                  ; $96e4 : $00
	.db $00                                                  ; $96e5 : $00
	.db $00                                                  ; $96e6 : $00
	.db $00                                                  ; $96e7 : $00
	.db $00                                                  ; $96e8 : $00
	.db $00                                                  ; $96e9 : $00
	.db $00                                                  ; $96ea : $00
	.db $00                                                  ; $96eb : $00
	.db $00                                                  ; $96ec : $00
	.db $00                                                  ; $96ed : $00
	.db $00                                                  ; $96ee : $00
	.db $00                                                  ; $96ef : $00
	.db $00                                                  ; $96f0 : $00
	.db $00                                                  ; $96f1 : $00
	.db $00                                                  ; $96f2 : $00
	.db $00                                                  ; $96f3 : $00
	.db $00                                                  ; $96f4 : $00
	.db $00                                                  ; $96f5 : $00
	.db $00                                                  ; $96f6 : $00
	.db $00                                                  ; $96f7 : $00
	.db $00                                                  ; $96f8 : $00
	.db $00                                                  ; $96f9 : $00
	.db $00                                                  ; $96fa : $00
	.db $00                                                  ; $96fb : $00
	.db $00                                                  ; $96fc : $00
	.db $00                                                  ; $96fd : $00
	.db $00                                                  ; $96fe : $00
	.db $00                                                  ; $96ff : $00
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
	.db $00                                                  ; $970f : $00
	.db $00                                                  ; $9710 : $00
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
	.db $00                                                  ; $971e : $00
	.db $00                                                  ; $971f : $00
	.db $00                                                  ; $9720 : $00
	.db $00                                                  ; $9721 : $00
	.db $00                                                  ; $9722 : $00
	.db $00                                                  ; $9723 : $00
	.db $00                                                  ; $9724 : $00
	.db $00                                                  ; $9725 : $00
	.db $00                                                  ; $9726 : $00
	.db $00                                                  ; $9727 : $00
	.db $00                                                  ; $9728 : $00
	.db $00                                                  ; $9729 : $00
	.db $00                                                  ; $972a : $00
	.db $00                                                  ; $972b : $00
	.db $00                                                  ; $972c : $00
	.db $00                                                  ; $972d : $00
	.db $00                                                  ; $972e : $00
	.db $00                                                  ; $972f : $00
	.db $00                                                  ; $9730 : $00
	.db $00                                                  ; $9731 : $00
	.db $00                                                  ; $9732 : $00
	.db $00                                                  ; $9733 : $00
	.db $00                                                  ; $9734 : $00
	.db $00                                                  ; $9735 : $00
	.db $00                                                  ; $9736 : $00
	.db $00                                                  ; $9737 : $00
	.db $00                                                  ; $9738 : $00
	.db $00                                                  ; $9739 : $00
	.db $00                                                  ; $973a : $00
	.db $00                                                  ; $973b : $00
	.db $00                                                  ; $973c : $00
	.db $00                                                  ; $973d : $00
	.db $00                                                  ; $973e : $00
	.db $00                                                  ; $973f : $00
	.db $00                                                  ; $9740 : $00
	.db $00                                                  ; $9741 : $00
	.db $00                                                  ; $9742 : $00
	.db $00                                                  ; $9743 : $00
	.db $00                                                  ; $9744 : $00
	.db $00                                                  ; $9745 : $00
	.db $00                                                  ; $9746 : $00
	.db $00                                                  ; $9747 : $00
	.db $00                                                  ; $9748 : $00
	.db $00                                                  ; $9749 : $00
	.db $00                                                  ; $974a : $00
	.db $00                                                  ; $974b : $00
	.db $00                                                  ; $974c : $00
	.db $00                                                  ; $974d : $00
	.db $00                                                  ; $974e : $00
	.db $00                                                  ; $974f : $00
	.db $00                                                  ; $9750 : $00
	.db $00                                                  ; $9751 : $00
	.db $00                                                  ; $9752 : $00
	.db $00                                                  ; $9753 : $00
	.db $00                                                  ; $9754 : $00
	.db $00                                                  ; $9755 : $00
	.db $00                                                  ; $9756 : $00
	.db $00                                                  ; $9757 : $00
	.db $00                                                  ; $9758 : $00
	.db $00                                                  ; $9759 : $00
	.db $00                                                  ; $975a : $00
	.db $00                                                  ; $975b : $00
	.db $00                                                  ; $975c : $00
	.db $00                                                  ; $975d : $00
	.db $00                                                  ; $975e : $00
	.db $00                                                  ; $975f : $00
	.db $00                                                  ; $9760 : $00
	.db $00                                                  ; $9761 : $00
	.db $00                                                  ; $9762 : $00
	.db $00                                                  ; $9763 : $00
	.db $00                                                  ; $9764 : $00
	.db $00                                                  ; $9765 : $00
	.db $00                                                  ; $9766 : $00
	.db $00                                                  ; $9767 : $00
	.db $00                                                  ; $9768 : $00
	.db $00                                                  ; $9769 : $00
	.db $00                                                  ; $976a : $00
	.db $00                                                  ; $976b : $00
	jsr $f334.w                                                  ; $976c : $20, $34, $f3
	bit $f4, X                                                  ; $976f : $34, $f4
	bit $f5, X                                                  ; $9771 : $34, $f5
	bit $f6, X                                                  ; $9773 : $34, $f6
	bit $f7, X                                                  ; $9775 : $34, $f7
	bit $f8, X                                                  ; $9777 : $34, $f8
	bit $f9, X                                                  ; $9779 : $34, $f9
	and $1c, X                                                  ; $977b : $35, $1c
	ora [$17], Y                                                  ; $977d : $17, $17
	ora [$17], Y                                                  ; $977f : $17, $17
	ora [$17], Y                                                  ; $9781 : $17, $17
	trb $0501.w                                                  ; $9783 : $1c, $01, $05
	ora $70, S                                                  ; $9786 : $03, $70
	asl $64                                                  ; $9788 : $06, $64
	ora [$65]                                                  ; $978a : $07, $65
	ora #$03.b                                                  ; $978c : $09, $03
	ina                                                  ; $978e : $1a
	ora ($7f, X)                                                  ; $978f : $01, $7f
	ina                                                  ; $9791 : $1a
	cop $30.b                                                  ; $9792 : $02, $30
	ora $081b.w, X                                                  ; $9794 : $1d, $1b, $08
	tsb $0103.w                                                  ; $9797 : $0c, $03, $01
	plp                                                  ; $979a : $28
	ora ($4d, X)                                                  ; $979b : $01, $4d
	asl $20                                                  ; $979d : $06, $20
	ina                                                  ; $979f : $1a
	ora ($00, X)                                                  ; $97a0 : $01, $00
	ora $8d19.w, X                                                  ; $97a2 : $1d, $19, $8d
	ora [$05], Y                                                  ; $97a5 : $17, $05
	ora $70, S                                                  ; $97a7 : $03, $70
	rti                                                  ; $97a9 : $40


	tsb $04c4.w                                                  ; $97aa : $0c, $c4, $04
	.db $00                                                  ; $97ad : $00
	trb $0601.w                                                  ; $97ae : $1c, $01, $06
	cmp ($07, X)                                                  ; $97b1 : $c1, $07
	rol                                                  ; $97b3 : $2a
	ora #$02.b                                                  ; $97b4 : $09, $02
	ora $081f.w, X                                                  ; $97b6 : $1d, $1f, $08
	ora $067503.l                                                  ; $97b9 : $0f, $03, $75, $06
	jsr $1f1d.w                                                  ; $97bd : $20, $1d, $1f
	sbc $1780.w, Y                                                  ; $97c0 : $f9, $80, $17
	jsr $4a35.w                                                  ; $97c3 : $20, $35, $4a
	and $4b, X                                                  ; $97c6 : $35, $4b
	and $4c, X                                                  ; $97c8 : $35, $4c
	and $4d, X                                                  ; $97ca : $35, $4d
	and $4e, X                                                  ; $97cc : $35, $4e
	and $4f, X                                                  ; $97ce : $35, $4f
	and $50, X                                                  ; $97d0 : $35, $50
	and $51, X                                                  ; $97d2 : $35, $51
	ora [$17], Y                                                  ; $97d4 : $17, $17
	ora [$17], Y                                                  ; $97d6 : $17, $17
	ora [$17], Y                                                  ; $97d8 : $17, $17
	ora [$1c], Y                                                  ; $97da : $17, $1c
	ora ($05, X)                                                  ; $97dc : $01, $05
	.db $00                                                  ; $97de : $00
	sbc $07c806.l, X                                                  ; $97df : $ff, $06, $c8, $07
	bit $0109.w, X                                                  ; $97e3 : $3c, $09, $01
	ina                                                  ; $97e6 : $1a
	.db $00                                                  ; $97e7 : $00
	tsb $021a.w                                                  ; $97e8 : $0c, $1a, $02
	rts                                                  ; $97eb : $60


	php                                                  ; $97ec : $08
	ora $0d, S                                                  ; $97ed : $03, $0d
	bit $01                                                  ; $97ef : $24, $01
	tcd                                                  ; $97f1 : $5b
	ora $01, S                                                  ; $97f2 : $03, $01
	ldx $1780.w                                                  ; $97f4 : $ae, $80, $17
	jsr $7e35.w                                                  ; $97f7 : $20, $35, $7e
	and $7f, X                                                  ; $97fa : $35, $7f
	and $80, X                                                  ; $97fc : $35, $80
	and $81, X                                                  ; $97fe : $35, $81
	and $82, X                                                  ; $9800 : $35, $82
	and $83, X                                                  ; $9802 : $35, $83
	and $84, X                                                  ; $9804 : $35, $84
	and $85, X                                                  ; $9806 : $35, $85
	ora [$17], Y                                                  ; $9808 : $17, $17
	ora [$17], Y                                                  ; $980a : $17, $17
	ora [$17], Y                                                  ; $980c : $17, $17
	ora [$1c], Y                                                  ; $980e : $17, $1c
	ora ($05, X)                                                  ; $9810 : $01, $05
	ora ($05, X)                                                  ; $9812 : $01, $05
	asl $01                                                  ; $9814 : $06, $01
	ora [$60]                                                  ; $9816 : $07, $60
	ora #$03.b                                                  ; $9818 : $09, $03
	ina                                                  ; $981a : $1a
	.db $00                                                  ; $981b : $00
	asl $021a.w, X                                                  ; $981c : $1e, $1a, $02
	xba                                                  ; $981f : $eb
	ora $081f.w, X                                                  ; $9820 : $1d, $1f, $08
	ora $0001.w                                                  ; $9823 : $0d, $01, $00
	and $3431.w                                                  ; $9826 : $2d, $31, $34
	sec                                                  ; $9829 : $38
	and $2803.w, Y                                                  ; $982a : $39, $03, $28
	and $3832.w                                                  ; $982d : $2d, $32, $38
	rol $34, X                                                  ; $9830 : $36, $34
	and ($31)                                                  ; $9832 : $32, $31
	and $2a2c2d.l                                                  ; $9834 : $2f, $2d, $2c, $2a
	tsb $68                                                  ; $9838 : $04, $68
	plp                                                  ; $983a : $28
	rol $25                                                  ; $983b : $26, $25
	and $21, S                                                  ; $983d : $23, $21
	ora [$20], Y                                                  ; $983f : $17, $20
	and $c7, X                                                  ; $9841 : $35, $c7
	and $c8, X                                                  ; $9843 : $35, $c8
	and $c9, X                                                  ; $9845 : $35, $c9
	and $ca, X                                                  ; $9847 : $35, $ca
	and $cb, X                                                  ; $9849 : $35, $cb
	and $cc, X                                                  ; $984b : $35, $cc
	and $cd, X                                                  ; $984d : $35, $cd
	and $ce, X                                                  ; $984f : $35, $ce
	ora [$17], Y                                                  ; $9851 : $17, $17
	ora [$17], Y                                                  ; $9853 : $17, $17
	ora [$17], Y                                                  ; $9855 : $17, $17
	ora [$1c], Y                                                  ; $9857 : $17, $1c
	ora ($05, X)                                                  ; $9859 : $01, $05
	ora ($50, X)                                                  ; $985b : $01, $50
	asl $01                                                  ; $985d : $06, $01
	ora [$64]                                                  ; $985f : $07, $64
	ora #$03.b                                                  ; $9861 : $09, $03
	ina                                                  ; $9863 : $1a
	.db $00                                                  ; $9864 : $00
	asl $021a.w, X                                                  ; $9865 : $1e, $1a, $02
	xba                                                  ; $9868 : $eb
	ora $081f.w, X                                                  ; $9869 : $1d, $1f, $08
	ora $6804.w                                                  ; $986c : $0d, $04, $68
	plp                                                  ; $986f : $28
	rol $25                                                  ; $9870 : $26, $25
	and $21, S                                                  ; $9872 : $23, $21
	ora $38, S                                                  ; $9874 : $03, $38
	rol $34, X                                                  ; $9876 : $36, $34
	and ($31)                                                  ; $9878 : $32, $31
	and $2a2c2d.l                                                  ; $987a : $2f, $2d, $2c, $2a
	ora [$20], Y                                                  ; $987e : $17, $20
	rol $06, X                                                  ; $9880 : $36, $06
	rol $07, X                                                  ; $9882 : $36, $07
	rol $08, X                                                  ; $9884 : $36, $08
	rol $09, X                                                  ; $9886 : $36, $09
	rol $0a, X                                                  ; $9888 : $36, $0a
	rol $0b, X                                                  ; $988a : $36, $0b
	rol $0c, X                                                  ; $988c : $36, $0c
	rol $0d, X                                                  ; $988e : $36, $0d
	ora [$17], Y                                                  ; $9890 : $17, $17
	ora [$17], Y                                                  ; $9892 : $17, $17
	ora [$17], Y                                                  ; $9894 : $17, $17
	ora [$07], Y                                                  ; $9896 : $17, $07
	ora ($fa, X)                                                  ; $9898 : $01, $fa
	ora [$20], Y                                                  ; $989a : $17, $20
	rol $22, X                                                  ; $989c : $36, $22
	rol $23, X                                                  ; $989e : $36, $23
	rol $24, X                                                  ; $98a0 : $36, $24
	rol $25, X                                                  ; $98a2 : $36, $25
	rol $26, X                                                  ; $98a4 : $36, $26
	rol $27, X                                                  ; $98a6 : $36, $27
	rol $28, X                                                  ; $98a8 : $36, $28
	rol $29, X                                                  ; $98aa : $36, $29
	ora [$17], Y                                                  ; $98ac : $17, $17
	ora [$17], Y                                                  ; $98ae : $17, $17
	ora [$17], Y                                                  ; $98b0 : $17, $17
	ora [$1c], Y                                                  ; $98b2 : $17, $1c
	ora ($05, X)                                                  ; $98b4 : $01, $05
	.db $00                                                  ; $98b6 : $00
	cpy #$eb06.w                                                  ; $98b7 : $c0, $06, $eb
	ora [$5a]                                                  ; $98ba : $07, $5a
	ina                                                  ; $98bc : $1a
	.db $00                                                  ; $98bd : $00
	ora $1a, X                                                  ; $98be : $15, $1a
	cop $04.b                                                  ; $98c0 : $02, $04
	ora $0812.w, X                                                  ; $98c2 : $1d, $12, $08
	tsb $0209.w                                                  ; $98c5 : $0c, $09, $02
	phd                                                  ; $98c8 : $0b
	ora $01                                                  ; $98c9 : $05, $01
	eor $4e01.w                                                  ; $98cb : $4d, $01, $4e
	ldy #$2017.w                                                  ; $98ce : $a0, $17, $20
	rol $57, X                                                  ; $98d1 : $36, $57
	rol $58, X                                                  ; $98d3 : $36, $58
	rol $59, X                                                  ; $98d5 : $36, $59
	rol $5a, X                                                  ; $98d7 : $36, $5a
	rol $5b, X                                                  ; $98d9 : $36, $5b
	rol $5c, X                                                  ; $98db : $36, $5c
	rol $5d, X                                                  ; $98dd : $36, $5d
	rol $79, X                                                  ; $98df : $36, $79
	ora [$17], Y                                                  ; $98e1 : $17, $17
	ora [$17], Y                                                  ; $98e3 : $17, $17
	ora [$17], Y                                                  ; $98e5 : $17, $17
	trb $0501.w                                                  ; $98e7 : $1c, $01, $05
	ora ($70, X)                                                  ; $98ea : $01, $70
	asl $46                                                  ; $98ec : $06, $46
	ora [$2e]                                                  ; $98ee : $07, $2e
	ora $1a64.w                                                  ; $98f0 : $0d, $64, $1a
	.db $00                                                  ; $98f3 : $00
	ora [$1a]                                                  ; $98f4 : $07, $1a
	cop $64.b                                                  ; $98f6 : $02, $64
	ora #$02.b                                                  ; $98f8 : $09, $02
	ora $0812.w, X                                                  ; $98fa : $1d, $12, $08
	tsb $9e01.w                                                  ; $98fd : $0c, $01, $9e
	ora ($a1, X)                                                  ; $9900 : $01, $a1
	ora [$1c], Y                                                  ; $9902 : $17, $1c
	ora ($05, X)                                                  ; $9904 : $01, $05
	ora ($70, X)                                                  ; $9906 : $01, $70
	asl $46                                                  ; $9908 : $06, $46
	ora [$4e]                                                  ; $990a : $07, $4e
	ora $1a64.w                                                  ; $990c : $0d, $64, $1a
	.db $00                                                  ; $990f : $00
	ora [$1a]                                                  ; $9910 : $07, $1a
	cop $64.b                                                  ; $9912 : $02, $64
	ora $0812.w, X                                                  ; $9914 : $1d, $12, $08
	ora ($01)                                                  ; $9917 : $12, $01
	stz $a101.w, X                                                  ; $9919 : $9e, $01, $a1
	ora [$00], Y                                                  ; $991c : $17, $00
	.db $00                                                  ; $991e : $00
	.db $00                                                  ; $991f : $00
	.db $00                                                  ; $9920 : $00
	sbc $520014.l, X                                                  ; $9921 : $ff, $14, $00, $52
	ora $e234.w, Y                                                  ; $9925 : $19, $34, $e2
	and $0b, X                                                  ; $9928 : $35, $0b
	and $44, X                                                  ; $992a : $35, $44
	and $89, X                                                  ; $992c : $35, $89
	and $cf, X                                                  ; $992e : $35, $cf
	and $fa, X                                                  ; $9930 : $35, $fa
	rol $33, X                                                  ; $9932 : $36, $33
	rol $6a, X                                                  ; $9934 : $36, $6a
	rol $a3, X                                                  ; $9936 : $36, $a3
	rol $dc, X                                                  ; $9938 : $36, $dc
	pld                                                  ; $993a : $2b
	ora $00, S                                                  ; $993b : $03, $00
	bit $7a, X                                                  ; $993d : $34, $7a
	jmp ($0000.w)                                                  ; $993f : $6c, $00, $00


	.db $00                                                  ; $9942 : $00
	.db $00                                                  ; $9943 : $00
	.db $00                                                  ; $9944 : $00
	.db $00                                                  ; $9945 : $00
	.db $00                                                  ; $9946 : $00
	.db $00                                                  ; $9947 : $00
	.db $00                                                  ; $9948 : $00
	.db $00                                                  ; $9949 : $00
	.db $00                                                  ; $994a : $00
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
	.db $00                                                  ; $9960 : $00
	.db $00                                                  ; $9961 : $00
	.db $00                                                  ; $9962 : $00
	.db $00                                                  ; $9963 : $00
	.db $00                                                  ; $9964 : $00
	.db $00                                                  ; $9965 : $00
	.db $00                                                  ; $9966 : $00
	.db $00                                                  ; $9967 : $00
	.db $00                                                  ; $9968 : $00
	.db $00                                                  ; $9969 : $00
	.db $00                                                  ; $996a : $00
	.db $00                                                  ; $996b : $00
	.db $00                                                  ; $996c : $00
	.db $00                                                  ; $996d : $00
	.db $00                                                  ; $996e : $00
	.db $00                                                  ; $996f : $00
	.db $00                                                  ; $9970 : $00
	.db $00                                                  ; $9971 : $00
	.db $00                                                  ; $9972 : $00
	.db $00                                                  ; $9973 : $00
	.db $00                                                  ; $9974 : $00
	.db $00                                                  ; $9975 : $00
	.db $00                                                  ; $9976 : $00
	.db $00                                                  ; $9977 : $00
	.db $00                                                  ; $9978 : $00
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
	.db $00                                                  ; $9991 : $00
	.db $00                                                  ; $9992 : $00
	.db $00                                                  ; $9993 : $00
	.db $00                                                  ; $9994 : $00
	.db $00                                                  ; $9995 : $00
	.db $00                                                  ; $9996 : $00
	.db $00                                                  ; $9997 : $00
	.db $00                                                  ; $9998 : $00
	.db $00                                                  ; $9999 : $00
	.db $00                                                  ; $999a : $00
	.db $00                                                  ; $999b : $00
	.db $00                                                  ; $999c : $00
	.db $00                                                  ; $999d : $00
	.db $00                                                  ; $999e : $00
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
	.db $00                                                  ; $99b2 : $00
	.db $00                                                  ; $99b3 : $00
	.db $00                                                  ; $99b4 : $00
	.db $00                                                  ; $99b5 : $00
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
	.db $00                                                  ; $99d2 : $00
	.db $00                                                  ; $99d3 : $00
	.db $00                                                  ; $99d4 : $00
	.db $00                                                  ; $99d5 : $00
	.db $00                                                  ; $99d6 : $00
	.db $00                                                  ; $99d7 : $00
	.db $00                                                  ; $99d8 : $00
	.db $00                                                  ; $99d9 : $00
	.db $00                                                  ; $99da : $00
	.db $00                                                  ; $99db : $00
	.db $00                                                  ; $99dc : $00
	.db $00                                                  ; $99dd : $00
	.db $00                                                  ; $99de : $00
	.db $00                                                  ; $99df : $00
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
	.db $00                                                  ; $99f4 : $00
	.db $00                                                  ; $99f5 : $00
	.db $00                                                  ; $99f6 : $00
	.db $00                                                  ; $99f7 : $00
	.db $00                                                  ; $99f8 : $00
	.db $00                                                  ; $99f9 : $00
	.db $00                                                  ; $99fa : $00
	.db $00                                                  ; $99fb : $00
	.db $00                                                  ; $99fc : $00
	.db $00                                                  ; $99fd : $00
	.db $00                                                  ; $99fe : $00
	.db $00                                                  ; $99ff : $00
	.db $00                                                  ; $9a00 : $00
	.db $00                                                  ; $9a01 : $00
	.db $00                                                  ; $9a02 : $00
	.db $00                                                  ; $9a03 : $00
	.db $00                                                  ; $9a04 : $00
	.db $00                                                  ; $9a05 : $00
	.db $00                                                  ; $9a06 : $00
	.db $00                                                  ; $9a07 : $00
	.db $00                                                  ; $9a08 : $00
	.db $00                                                  ; $9a09 : $00
	.db $00                                                  ; $9a0a : $00
	.db $00                                                  ; $9a0b : $00
	.db $00                                                  ; $9a0c : $00
	.db $00                                                  ; $9a0d : $00
	.db $00                                                  ; $9a0e : $00
	.db $00                                                  ; $9a0f : $00
	.db $00                                                  ; $9a10 : $00
	.db $00                                                  ; $9a11 : $00
	.db $00                                                  ; $9a12 : $00
	.db $00                                                  ; $9a13 : $00
	.db $00                                                  ; $9a14 : $00
	.db $00                                                  ; $9a15 : $00
	.db $00                                                  ; $9a16 : $00
	.db $00                                                  ; $9a17 : $00
	.db $00                                                  ; $9a18 : $00
	.db $00                                                  ; $9a19 : $00
	.db $00                                                  ; $9a1a : $00
	.db $00                                                  ; $9a1b : $00
	.db $00                                                  ; $9a1c : $00
	.db $00                                                  ; $9a1d : $00
	.db $00                                                  ; $9a1e : $00
	.db $00                                                  ; $9a1f : $00
	jsr $f334.w                                                  ; $9a20 : $20, $34, $f3
	bit $f4, X                                                  ; $9a23 : $34, $f4
	bit $f5, X                                                  ; $9a25 : $34, $f5
	bit $f6, X                                                  ; $9a27 : $34, $f6
	bit $f7, X                                                  ; $9a29 : $34, $f7
	bit $f8, X                                                  ; $9a2b : $34, $f8
	bit $f9, X                                                  ; $9a2d : $34, $f9
	bit $fa, X                                                  ; $9a2f : $34, $fa
	ora [$17], Y                                                  ; $9a31 : $17, $17
	ora [$17], Y                                                  ; $9a33 : $17, $17
	ora [$17], Y                                                  ; $9a35 : $17, $17
	ora [$1c], Y                                                  ; $9a37 : $17, $1c
	ora ($05, X)                                                  ; $9a39 : $01, $05
	ora ($c2, X)                                                  ; $9a3b : $01, $c2
	asl $eb                                                  ; $9a3d : $06, $eb
	ora [$40]                                                  ; $9a3f : $07, $40
	ora #$03.b                                                  ; $9a41 : $09, $03
	ora $081f.w, X                                                  ; $9a43 : $1d, $1f, $08
	ora ($b9)                                                  ; $9a46 : $12, $b9
	ora [$20], Y                                                  ; $9a48 : $17, $20
	and $1c, X                                                  ; $9a4a : $35, $1c
	and $1d, X                                                  ; $9a4c : $35, $1d
	and $1e, X                                                  ; $9a4e : $35, $1e
	and $1f, X                                                  ; $9a50 : $35, $1f
	and $20, X                                                  ; $9a52 : $35, $20
	and $21, X                                                  ; $9a54 : $35, $21
	and $22, X                                                  ; $9a56 : $35, $22
	and $43, X                                                  ; $9a58 : $35, $43
	ora [$17], Y                                                  ; $9a5a : $17, $17
	ora [$17], Y                                                  ; $9a5c : $17, $17
	ora [$17], Y                                                  ; $9a5e : $17, $17
	ora $02                                                  ; $9a60 : $05, $02
	jsr $011c.w                                                  ; $9a62 : $20, $1c, $01
	asl $eb                                                  ; $9a65 : $06, $eb
	ora [$30]                                                  ; $9a67 : $07, $30
	ora #$02.b                                                  ; $9a69 : $09, $02
	ora $1a7f.w                                                  ; $9a6b : $0d, $7f, $1a
	.db $00                                                  ; $9a6e : $00
	tsb $021a.w                                                  ; $9a6f : $0c, $1a, $02
	ldy #$191d.w                                                  ; $9a72 : $a0, $1d, $19
	php                                                  ; $9a75 : $08
	ora [$01]                                                  ; $9a76 : $07, $01
	and $c803.w, Y                                                  ; $9a78 : $39, $03, $c8
	and ($03, X)                                                  ; $9a7b : $21, $03
	ora ($21, X)                                                  ; $9a7d : $01, $21
	ldy #$1717.w                                                  ; $9a7f : $a0, $17, $17
	jsr $5535.w                                                  ; $9a82 : $20, $35, $55
	and $56, X                                                  ; $9a85 : $35, $56
	and $57, X                                                  ; $9a87 : $35, $57
	and $58, X                                                  ; $9a89 : $35, $58
	and $59, X                                                  ; $9a8b : $35, $59
	and $5a, X                                                  ; $9a8d : $35, $5a
	and $5b, X                                                  ; $9a8f : $35, $5b
	and $6d, X                                                  ; $9a91 : $35, $6d
	ora [$17], Y                                                  ; $9a93 : $17, $17
	ora [$17], Y                                                  ; $9a95 : $17, $17
	ora [$17], Y                                                  ; $9a97 : $17, $17
	trb $0501.w                                                  ; $9a99 : $1c, $01, $05
	cop $50.b                                                  ; $9a9c : $02, $50
	asl $e1                                                  ; $9a9e : $06, $e1
	ora [$78]                                                  ; $9aa0 : $07, $78
	ora #$02.b                                                  ; $9aa2 : $09, $02
	ora $081f.w, X                                                  ; $9aa4 : $1d, $1f, $08
	ora $174803.l, X                                                  ; $9aa7 : $1f, $03, $48, $17
	trb $0501.w                                                  ; $9aab : $1c, $01, $05
	cop $50.b                                                  ; $9aae : $02, $50
	asl $e1                                                  ; $9ab0 : $06, $e1
	ora [$5f]                                                  ; $9ab2 : $07, $5f
	ora #$01.b                                                  ; $9ab4 : $09, $01
	tsb $1dce.w                                                  ; $9ab6 : $0c, $ce, $1d
	ora $012708.l, X                                                  ; $9ab9 : $1f, $08, $27, $01
	eor $037b01.l                                                  ; $9abd : $4f, $01, $7b, $03
	ora ($29, X)                                                  ; $9ac1 : $01, $29
	ora $01, S                                                  ; $9ac3 : $03, $01
	tya                                                  ; $9ac5 : $98
	ora [$20], Y                                                  ; $9ac6 : $17, $20
	and $9a, X                                                  ; $9ac8 : $35, $9a
	and $9b, X                                                  ; $9aca : $35, $9b
	and $9c, X                                                  ; $9acc : $35, $9c
	and $9d, X                                                  ; $9ace : $35, $9d
	and $9e, X                                                  ; $9ad0 : $35, $9e
	and $9f, X                                                  ; $9ad2 : $35, $9f
	and $a0, X                                                  ; $9ad4 : $35, $a0
	and $b3, X                                                  ; $9ad6 : $35, $b3
	ora [$17], Y                                                  ; $9ad8 : $17, $17
	ora [$17], Y                                                  ; $9ada : $17, $17
	ora [$17], Y                                                  ; $9adc : $17, $17
	trb $0501.w                                                  ; $9ade : $1c, $01, $05
	cop $00.b                                                  ; $9ae1 : $02, $00
	asl $e1                                                  ; $9ae3 : $06, $e1
	ora [$78]                                                  ; $9ae5 : $07, $78
	ora #$02.b                                                  ; $9ae7 : $09, $02
	ora $081f.w, X                                                  ; $9ae9 : $1d, $1f, $08
	ora $6a4803.l, X                                                  ; $9aec : $1f, $03, $48, $6a
	ora [$1c], Y                                                  ; $9af0 : $17, $1c
	ora ($05, X)                                                  ; $9af2 : $01, $05
	cop $00.b                                                  ; $9af4 : $02, $00
	asl $e1                                                  ; $9af6 : $06, $e1
	ora [$5f]                                                  ; $9af8 : $07, $5f
	ora #$01.b                                                  ; $9afa : $09, $01
	tsb $1dce.w                                                  ; $9afc : $0c, $ce, $1d
	ora $012708.l, X                                                  ; $9aff : $1f, $08, $27, $01
	eor $037b01.l                                                  ; $9b03 : $4f, $01, $7b, $03
	ora ($29, X)                                                  ; $9b07 : $01, $29
	ora $01, S                                                  ; $9b09 : $03, $01
	tya                                                  ; $9b0b : $98
	ora [$20], Y                                                  ; $9b0c : $17, $20
	and $e0, X                                                  ; $9b0e : $35, $e0
	and $e1, X                                                  ; $9b10 : $35, $e1
	and $e2, X                                                  ; $9b12 : $35, $e2
	and $e3, X                                                  ; $9b14 : $35, $e3
	and $e4, X                                                  ; $9b16 : $35, $e4
	and $e5, X                                                  ; $9b18 : $35, $e5
	and $e6, X                                                  ; $9b1a : $35, $e6
	and $e7, X                                                  ; $9b1c : $35, $e7
	ora [$17], Y                                                  ; $9b1e : $17, $17
	ora [$17], Y                                                  ; $9b20 : $17, $17
	ora [$17], Y                                                  ; $9b22 : $17, $17
	ora [$1c], Y                                                  ; $9b24 : $17, $1c
	ora ($05, X)                                                  ; $9b26 : $01, $05
	.db $00                                                  ; $9b28 : $00
	rti                                                  ; $9b29 : $40


	asl $18                                                  ; $9b2a : $06, $18
	ora #$02.b                                                  ; $9b2c : $09, $02
	ora $0810.w, X                                                  ; $9b2e : $1d, $10, $08
	phd                                                  ; $9b31 : $0b
	ora [$50]                                                  ; $9b32 : $07, $50
	ora $01, S                                                  ; $9b34 : $03, $01
	adc ($17)                                                  ; $9b36 : $72, $17
	jsr $0b36.w                                                  ; $9b38 : $20, $36, $0b
	rol $0c, X                                                  ; $9b3b : $36, $0c
	rol $0d, X                                                  ; $9b3d : $36, $0d
	rol $0e, X                                                  ; $9b3f : $36, $0e
	rol $0f, X                                                  ; $9b41 : $36, $0f
	rol $10, X                                                  ; $9b43 : $36, $10
	rol $11, X                                                  ; $9b45 : $36, $11
	rol $32, X                                                  ; $9b47 : $36, $32
	ora [$17], Y                                                  ; $9b49 : $17, $17
	ora [$17], Y                                                  ; $9b4b : $17, $17
	ora [$17], Y                                                  ; $9b4d : $17, $17
	trb $0501.w                                                  ; $9b4f : $1c, $01, $05
	cop $37.b                                                  ; $9b52 : $02, $37
	asl $ff                                                  ; $9b54 : $06, $ff
	ora [$1a]                                                  ; $9b56 : $07, $1a
	ora #$01.b                                                  ; $9b58 : $09, $01
	php                                                  ; $9b5a : $08
	ora [$01]                                                  ; $9b5b : $07, $01
	and $380d.w                                                  ; $9b5d : $2d, $0d, $38
	ora $f9, S                                                  ; $9b60 : $03, $f9
	tsb $48                                                  ; $9b62 : $04, $48
	ora $0c40.w                                                  ; $9b64 : $0d, $40, $0c
	bvc br_0c_9be1                                                  ; $9b67 : $50, $78

	tsb $7900.w                                                  ; $9b69 : $0c, $00, $79
	asl $c3, X                                                  ; $9b6c : $16, $c3
	.db $f0, $17                                                  ; $9b6e : $f0, $17

	ora [$20], Y                                                  ; $9b70 : $17, $20
	rol $44, X                                                  ; $9b72 : $36, $44
	rol $45, X                                                  ; $9b74 : $36, $45
	rol $46, X                                                  ; $9b76 : $36, $46
	rol $47, X                                                  ; $9b78 : $36, $47
	rol $48, X                                                  ; $9b7a : $36, $48
	rol $49, X                                                  ; $9b7c : $36, $49
	rol $4a, X                                                  ; $9b7e : $36, $4a
	rol $4b, X                                                  ; $9b80 : $36, $4b
	ora [$17], Y                                                  ; $9b82 : $17, $17
	ora [$17], Y                                                  ; $9b84 : $17, $17
	ora [$17], Y                                                  ; $9b86 : $17, $17
	ora [$1c], Y                                                  ; $9b88 : $17, $1c
	ora ($05, X)                                                  ; $9b8a : $01, $05
	cop $00.b                                                  ; $9b8c : $02, $00
	asl $9b                                                  ; $9b8e : $06, $9b
	ora [$40]                                                  ; $9b90 : $07, $40
	ora #$04.b                                                  ; $9b92 : $09, $04
	ora $081c.w, X                                                  ; $9b94 : $1d, $1c, $08
	asl $3940.w                                                  ; $9b97 : $0e, $40, $39
	ora $2d, S                                                  ; $9b9a : $03, $2d
	and $31                                                  ; $9b9c : $25, $31
	plp                                                  ; $9b9e : $28
	bit $26, X                                                  ; $9b9f : $34, $26
	and ($25)                                                  ; $9ba1 : $32, $25
	and ($21), Y                                                  ; $9ba3 : $31, $21
	and $1725.w                                                  ; $9ba5 : $2d, $25, $17
	jsr $7b36.w                                                  ; $9ba8 : $20, $36, $7b
	rol $7c, X                                                  ; $9bab : $36, $7c
	rol $7d, X                                                  ; $9bad : $36, $7d
	rol $7e, X                                                  ; $9baf : $36, $7e
	rol $7f, X                                                  ; $9bb1 : $36, $7f
	rol $80, X                                                  ; $9bb3 : $36, $80
	rol $81, X                                                  ; $9bb5 : $36, $81
	rol $a2, X                                                  ; $9bb7 : $36, $a2
	ora [$17], Y                                                  ; $9bb9 : $17, $17
	ora [$17], Y                                                  ; $9bbb : $17, $17
	ora [$17], Y                                                  ; $9bbd : $17, $17
	trb $0501.w                                                  ; $9bbf : $1c, $01, $05
	cop $37.b                                                  ; $9bc2 : $02, $37
	asl $ff                                                  ; $9bc4 : $06, $ff
	ora [$1a]                                                  ; $9bc6 : $07, $1a
	ora #$01.b                                                  ; $9bc8 : $09, $01
	php                                                  ; $9bca : $08
	cop $01.b                                                  ; $9bcb : $02, $01
	and $380d.w                                                  ; $9bcd : $2d, $0d, $38
	ora $f9, S                                                  ; $9bd0 : $03, $f9
	tsb $48                                                  ; $9bd2 : $04, $48
	ora $0c40.w                                                  ; $9bd4 : $0d, $40, $0c
	bvc br_0c_9c51                                                  ; $9bd7 : $50, $78

	tsb $7900.w                                                  ; $9bd9 : $0c, $00, $79
	asl $c4, X                                                  ; $9bdc : $16, $c4
	rts                                                  ; $9bde : $60


	ora [$17], Y                                                  ; $9bdf : $17, $17

br_0c_9be1:
	jsr $b436.w                                                  ; $9be1 : $20, $36, $b4
	rol $b5, X                                                  ; $9be4 : $36, $b5
	rol $b6, X                                                  ; $9be6 : $36, $b6
	rol $b7, X                                                  ; $9be8 : $36, $b7
	rol $b8, X                                                  ; $9bea : $36, $b8
	rol $b9, X                                                  ; $9bec : $36, $b9
	rol $ba, X                                                  ; $9bee : $36, $ba
	rol $db, X                                                  ; $9bf0 : $36, $db
	ora [$17], Y                                                  ; $9bf2 : $17, $17
	ora [$17], Y                                                  ; $9bf4 : $17, $17
	ora [$17], Y                                                  ; $9bf6 : $17, $17
	trb $0501.w                                                  ; $9bf8 : $1c, $01, $05
	cop $37.b                                                  ; $9bfb : $02, $37
	asl $ff                                                  ; $9bfd : $06, $ff
	ora [$1e]                                                  ; $9bff : $07, $1e
	ora #$01.b                                                  ; $9c01 : $09, $01
	php                                                  ; $9c03 : $08
	ora ($01, X)                                                  ; $9c04 : $01, $01
	and $380d.w                                                  ; $9c06 : $2d, $0d, $38
	ora $f9, S                                                  ; $9c09 : $03, $f9
	tsb $48                                                  ; $9c0b : $04, $48
	ora $0c40.w                                                  ; $9c0d : $0d, $40, $0c
	bvc br_0c_9c8a                                                  ; $9c10 : $50, $78

	tsb $7900.w                                                  ; $9c12 : $0c, $00, $79
	asl $c4, X                                                  ; $9c15 : $16, $c4
	sta $1717.w, Y                                                  ; $9c17 : $99, $17, $17

Call_0c_9c1a:
	jsr $ed36.w                                                  ; $9c1a : $20, $36, $ed
	rol $ee, X                                                  ; $9c1d : $36, $ee
	rol $ef, X                                                  ; $9c1f : $36, $ef
	rol $f0, X                                                  ; $9c21 : $36, $f0
	rol $f1, X                                                  ; $9c23 : $36, $f1
	rol $f2, X                                                  ; $9c25 : $36, $f2
	rol $f3, X                                                  ; $9c27 : $36, $f3
	and [$12], Y                                                  ; $9c29 : $37, $12
	ora [$17], Y                                                  ; $9c2b : $17, $17
	ora [$17], Y                                                  ; $9c2d : $17, $17
	ora [$17], Y                                                  ; $9c2f : $17, $17
	trb $0501.w                                                  ; $9c31 : $1c, $01, $05
	cop $05.b                                                  ; $9c34 : $02, $05
	asl $01                                                  ; $9c36 : $06, $01
	ora [$80]                                                  ; $9c38 : $07, $80
	ora #$03.b                                                  ; $9c3a : $09, $03
	ina                                                  ; $9c3c : $1a
	.db $00                                                  ; $9c3d : $00
	bpl br_0c_9c5a                                                  ; $9c3e : $10, $1a

	cop $60.b                                                  ; $9c40 : $02, $60
	php                                                  ; $9c42 : $08
	and ($03, X)                                                  ; $9c43 : $21, $03
	adc $6107.w                                                  ; $9c45 : $6d, $07, $61
	adc $3807.w                                                  ; $9c48 : $6d, $07, $38
	adc $2907.w                                                  ; $9c4b : $6d, $07, $29
	adc $1c17.w                                                  ; $9c4e : $6d, $17, $1c

br_0c_9c51:
	ora ($05, X)                                                  ; $9c51 : $01, $05
	ora $ff, S                                                  ; $9c53 : $03, $ff
	asl $10                                                  ; $9c55 : $06, $10
	ora [$30]                                                  ; $9c57 : $07, $30
	ina                                                  ; $9c59 : $1a

br_0c_9c5a:
	.db $00                                                  ; $9c5a : $00
	ora $0f021a.l                                                  ; $9c5b : $0f, $1a, $02, $0f
	ora $0801.w, X                                                  ; $9c5f : $1d, $01, $08
	tsb $0109.w                                                  ; $9c62 : $0c, $09, $01
	ora ($de, X)                                                  ; $9c65 : $01, $de
	ldy #$0017.w                                                  ; $9c67 : $a0, $17, $00
	.db $00                                                  ; $9c6a : $00
	.db $00                                                  ; $9c6b : $00
	.db $00                                                  ; $9c6c : $00
	sbc $52000a.l, X                                                  ; $9c6d : $ff, $0a, $00, $52
	ora $e234.w, Y                                                  ; $9c71 : $19, $34, $e2
	and $29, X                                                  ; $9c74 : $35, $29
	and $68, X                                                  ; $9c76 : $35, $68
	and $a2, X                                                  ; $9c78 : $35, $a2
	and $dc, X                                                  ; $9c7a : $35, $dc
	lsr $0002.w                                                  ; $9c7c : $4e, $02, $00
	bit $75, X                                                  ; $9c7f : $34, $75
	jmp ($0000.w)                                                  ; $9c81 : $6c, $00, $00


	.db $00                                                  ; $9c84 : $00
	.db $00                                                  ; $9c85 : $00
	.db $00                                                  ; $9c86 : $00
	.db $00                                                  ; $9c87 : $00
	.db $00                                                  ; $9c88 : $00
	.db $00                                                  ; $9c89 : $00

br_0c_9c8a:
	.db $00                                                  ; $9c8a : $00
	.db $00                                                  ; $9c8b : $00
	.db $00                                                  ; $9c8c : $00
	.db $00                                                  ; $9c8d : $00
	.db $00                                                  ; $9c8e : $00
	.db $00                                                  ; $9c8f : $00
	.db $00                                                  ; $9c90 : $00
	.db $00                                                  ; $9c91 : $00
	.db $00                                                  ; $9c92 : $00
	.db $00                                                  ; $9c93 : $00
	.db $00                                                  ; $9c94 : $00
	.db $00                                                  ; $9c95 : $00
	.db $00                                                  ; $9c96 : $00
	.db $00                                                  ; $9c97 : $00
	.db $00                                                  ; $9c98 : $00
	.db $00                                                  ; $9c99 : $00
	.db $00                                                  ; $9c9a : $00
	.db $00                                                  ; $9c9b : $00
	.db $00                                                  ; $9c9c : $00
	.db $00                                                  ; $9c9d : $00
	.db $00                                                  ; $9c9e : $00
	.db $00                                                  ; $9c9f : $00
	.db $00                                                  ; $9ca0 : $00
	.db $00                                                  ; $9ca1 : $00
	.db $00                                                  ; $9ca2 : $00
	.db $00                                                  ; $9ca3 : $00
	.db $00                                                  ; $9ca4 : $00
	.db $00                                                  ; $9ca5 : $00
	.db $00                                                  ; $9ca6 : $00
	.db $00                                                  ; $9ca7 : $00
	.db $00                                                  ; $9ca8 : $00
	.db $00                                                  ; $9ca9 : $00
	.db $00                                                  ; $9caa : $00
	.db $00                                                  ; $9cab : $00
	.db $00                                                  ; $9cac : $00
	.db $00                                                  ; $9cad : $00
	.db $00                                                  ; $9cae : $00
	.db $00                                                  ; $9caf : $00
	.db $00                                                  ; $9cb0 : $00
	.db $00                                                  ; $9cb1 : $00
	.db $00                                                  ; $9cb2 : $00
	.db $00                                                  ; $9cb3 : $00
	.db $00                                                  ; $9cb4 : $00
	.db $00                                                  ; $9cb5 : $00
	.db $00                                                  ; $9cb6 : $00
	.db $00                                                  ; $9cb7 : $00
	.db $00                                                  ; $9cb8 : $00
	.db $00                                                  ; $9cb9 : $00
	.db $00                                                  ; $9cba : $00
	.db $00                                                  ; $9cbb : $00
	.db $00                                                  ; $9cbc : $00
	.db $00                                                  ; $9cbd : $00
	.db $00                                                  ; $9cbe : $00
	.db $00                                                  ; $9cbf : $00
	.db $00                                                  ; $9cc0 : $00
	.db $00                                                  ; $9cc1 : $00
	.db $00                                                  ; $9cc2 : $00
	.db $00                                                  ; $9cc3 : $00
	.db $00                                                  ; $9cc4 : $00
	.db $00                                                  ; $9cc5 : $00
	.db $00                                                  ; $9cc6 : $00
	.db $00                                                  ; $9cc7 : $00
	.db $00                                                  ; $9cc8 : $00
	.db $00                                                  ; $9cc9 : $00
	.db $00                                                  ; $9cca : $00
	.db $00                                                  ; $9ccb : $00
	.db $00                                                  ; $9ccc : $00
	.db $00                                                  ; $9ccd : $00
	.db $00                                                  ; $9cce : $00
	.db $00                                                  ; $9ccf : $00
	.db $00                                                  ; $9cd0 : $00
	.db $00                                                  ; $9cd1 : $00
	.db $00                                                  ; $9cd2 : $00
	.db $00                                                  ; $9cd3 : $00
	.db $00                                                  ; $9cd4 : $00
	.db $00                                                  ; $9cd5 : $00
	.db $00                                                  ; $9cd6 : $00
	.db $00                                                  ; $9cd7 : $00
	.db $00                                                  ; $9cd8 : $00
	.db $00                                                  ; $9cd9 : $00
	.db $00                                                  ; $9cda : $00
	.db $00                                                  ; $9cdb : $00
	.db $00                                                  ; $9cdc : $00
	.db $00                                                  ; $9cdd : $00
	.db $00                                                  ; $9cde : $00
	.db $00                                                  ; $9cdf : $00
	.db $00                                                  ; $9ce0 : $00
	.db $00                                                  ; $9ce1 : $00
	.db $00                                                  ; $9ce2 : $00
	.db $00                                                  ; $9ce3 : $00
	.db $00                                                  ; $9ce4 : $00
	.db $00                                                  ; $9ce5 : $00
	.db $00                                                  ; $9ce6 : $00
	.db $00                                                  ; $9ce7 : $00
	.db $00                                                  ; $9ce8 : $00
	.db $00                                                  ; $9ce9 : $00
	.db $00                                                  ; $9cea : $00
	.db $00                                                  ; $9ceb : $00
	.db $00                                                  ; $9cec : $00
	.db $00                                                  ; $9ced : $00
	.db $00                                                  ; $9cee : $00
	.db $00                                                  ; $9cef : $00
	.db $00                                                  ; $9cf0 : $00
	.db $00                                                  ; $9cf1 : $00
	.db $00                                                  ; $9cf2 : $00
	.db $00                                                  ; $9cf3 : $00
	.db $00                                                  ; $9cf4 : $00
	.db $00                                                  ; $9cf5 : $00
	.db $00                                                  ; $9cf6 : $00
	.db $00                                                  ; $9cf7 : $00
	.db $00                                                  ; $9cf8 : $00
	.db $00                                                  ; $9cf9 : $00
	.db $00                                                  ; $9cfa : $00
	.db $00                                                  ; $9cfb : $00
	.db $00                                                  ; $9cfc : $00
	.db $00                                                  ; $9cfd : $00
	.db $00                                                  ; $9cfe : $00
	.db $00                                                  ; $9cff : $00
	.db $00                                                  ; $9d00 : $00
	.db $00                                                  ; $9d01 : $00
	.db $00                                                  ; $9d02 : $00
	.db $00                                                  ; $9d03 : $00
	.db $00                                                  ; $9d04 : $00
	.db $00                                                  ; $9d05 : $00
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
	.db $00                                                  ; $9d12 : $00
	.db $00                                                  ; $9d13 : $00
	.db $00                                                  ; $9d14 : $00
	.db $00                                                  ; $9d15 : $00
	.db $00                                                  ; $9d16 : $00
	.db $00                                                  ; $9d17 : $00
	.db $00                                                  ; $9d18 : $00
	.db $00                                                  ; $9d19 : $00
	.db $00                                                  ; $9d1a : $00
	.db $00                                                  ; $9d1b : $00
	.db $00                                                  ; $9d1c : $00
	.db $00                                                  ; $9d1d : $00
	.db $00                                                  ; $9d1e : $00
	.db $00                                                  ; $9d1f : $00
	.db $00                                                  ; $9d20 : $00
	.db $00                                                  ; $9d21 : $00
	.db $00                                                  ; $9d22 : $00
	.db $00                                                  ; $9d23 : $00
	.db $00                                                  ; $9d24 : $00
	.db $00                                                  ; $9d25 : $00
	.db $00                                                  ; $9d26 : $00
	.db $00                                                  ; $9d27 : $00
	.db $00                                                  ; $9d28 : $00
	.db $00                                                  ; $9d29 : $00
	.db $00                                                  ; $9d2a : $00
	.db $00                                                  ; $9d2b : $00
	.db $00                                                  ; $9d2c : $00
	.db $00                                                  ; $9d2d : $00
	.db $00                                                  ; $9d2e : $00
	.db $00                                                  ; $9d2f : $00
	.db $00                                                  ; $9d30 : $00
	.db $00                                                  ; $9d31 : $00
	.db $00                                                  ; $9d32 : $00
	.db $00                                                  ; $9d33 : $00
	.db $00                                                  ; $9d34 : $00
	.db $00                                                  ; $9d35 : $00
	.db $00                                                  ; $9d36 : $00
	.db $00                                                  ; $9d37 : $00
	.db $00                                                  ; $9d38 : $00

br_0c_9d39:
	.db $00                                                  ; $9d39 : $00
	.db $00                                                  ; $9d3a : $00
	.db $00                                                  ; $9d3b : $00

Jump_0c_9d3c:
	.db $00                                                  ; $9d3c : $00
	.db $00                                                  ; $9d3d : $00
	.db $00                                                  ; $9d3e : $00
	.db $00                                                  ; $9d3f : $00
	.db $00                                                  ; $9d40 : $00
	.db $00                                                  ; $9d41 : $00
	.db $00                                                  ; $9d42 : $00
	.db $00                                                  ; $9d43 : $00
	.db $00                                                  ; $9d44 : $00
	.db $00                                                  ; $9d45 : $00
	.db $00                                                  ; $9d46 : $00
	.db $00                                                  ; $9d47 : $00
	.db $00                                                  ; $9d48 : $00
	.db $00                                                  ; $9d49 : $00
	.db $00                                                  ; $9d4a : $00
	.db $00                                                  ; $9d4b : $00
	.db $00                                                  ; $9d4c : $00
	.db $00                                                  ; $9d4d : $00
	.db $00                                                  ; $9d4e : $00
	.db $00                                                  ; $9d4f : $00
	.db $00                                                  ; $9d50 : $00
	.db $00                                                  ; $9d51 : $00
	.db $00                                                  ; $9d52 : $00
	.db $00                                                  ; $9d53 : $00
	.db $00                                                  ; $9d54 : $00
	.db $00                                                  ; $9d55 : $00
	.db $00                                                  ; $9d56 : $00
	.db $00                                                  ; $9d57 : $00
	.db $00                                                  ; $9d58 : $00
	.db $00                                                  ; $9d59 : $00
	.db $00                                                  ; $9d5a : $00
	.db $00                                                  ; $9d5b : $00
	.db $00                                                  ; $9d5c : $00
	.db $00                                                  ; $9d5d : $00
	.db $00                                                  ; $9d5e : $00
	.db $00                                                  ; $9d5f : $00
	.db $00                                                  ; $9d60 : $00
	.db $00                                                  ; $9d61 : $00
	jsr $f334.w                                                  ; $9d62 : $20, $34, $f3
	bit $f4, X                                                  ; $9d65 : $34, $f4
	bit $f5, X                                                  ; $9d67 : $34, $f5
	bit $f6, X                                                  ; $9d69 : $34, $f6
	bit $f7, X                                                  ; $9d6b : $34, $f7
	bit $f8, X                                                  ; $9d6d : $34, $f8
	bit $f9, X                                                  ; $9d6f : $34, $f9
	and $0c, X                                                  ; $9d71 : $35, $0c
	ora [$17], Y                                                  ; $9d73 : $17, $17
	ora [$17], Y                                                  ; $9d75 : $17, $17
	ora [$17], Y                                                  ; $9d77 : $17, $17
	trb $0501.w                                                  ; $9d79 : $1c, $01, $05
	cop $ff.b                                                  ; $9d7c : $02, $ff
	asl $50                                                  ; $9d7e : $06, $50
	ora [$45]                                                  ; $9d80 : $07, $45
	ora #$01.b                                                  ; $9d82 : $09, $01
	ora $0810.w, X                                                  ; $9d84 : $1d, $10, $08
	rol $03                                                  ; $9d87 : $26, $03
	ora ($32, X)                                                  ; $9d89 : $01, $32
	ora [$1c], Y                                                  ; $9d8b : $17, $1c
	ora ($05, X)                                                  ; $9d8d : $01, $05
	cop $ff.b                                                  ; $9d8f : $02, $ff
	asl $4a                                                  ; $9d91 : $06, $4a
	ora [$40]                                                  ; $9d93 : $07, $40
	ora #$02.b                                                  ; $9d95 : $09, $02
	ora $1a7f.w                                                  ; $9d97 : $0d, $7f, $1a
	.db $00                                                  ; $9d9a : $00
	sei                                                  ; $9d9b : $78
	ina                                                  ; $9d9c : $1a
	cop $14.b                                                  ; $9d9d : $02, $14
	ora $0819.w, X                                                  ; $9d9f : $1d, $19, $08
	jsr $320103.l                                                  ; $9da2 : $22, $03, $01, $32
	ora ($66, X)                                                  ; $9da6 : $01, $66
	ora [$20], Y                                                  ; $9da8 : $17, $20
	and $3a, X                                                  ; $9daa : $35, $3a
	and $3b, X                                                  ; $9dac : $35, $3b
	and $3c, X                                                  ; $9dae : $35, $3c
	and $3d, X                                                  ; $9db0 : $35, $3d
	and $3e, X                                                  ; $9db2 : $35, $3e
	and $65, X                                                  ; $9db4 : $35, $65
	and $66, X                                                  ; $9db6 : $35, $66
	and $67, X                                                  ; $9db8 : $35, $67
	ora [$17], Y                                                  ; $9dba : $17, $17
	ora [$17], Y                                                  ; $9dbc : $17, $17
	trb $0601.w                                                  ; $9dbe : $1c, $01, $06
	plx                                                  ; $9dc1 : $fa
	ora $01                                                  ; $9dc2 : $05, $01
	bmi br_0c_9de0                                                  ; $9dc4 : $30, $1a

	.db $00                                                  ; $9dc6 : $00
	.db $00                                                  ; $9dc7 : $00
	ina                                                  ; $9dc8 : $1a
	ora ($20, X)                                                  ; $9dc9 : $01, $20
	ina                                                  ; $9dcb : $1a
	cop $a0.b                                                  ; $9dcc : $02, $a0
	php                                                  ; $9dce : $08
	asl                                                  ; $9dcf : $0a
	ora $081a.w, X                                                  ; $9dd0 : $1d, $1a, $08
	asl                                                  ; $9dd3 : $0a
	ora $0100.w                                                  ; $9dd4 : $0d, $00, $01
	ora #$05.b                                                  ; $9dd7 : $09, $05
	ora [$7e]                                                  ; $9dd9 : $07, $7e
	bit $09, X                                                  ; $9ddb : $34, $09
	cop $0d.b                                                  ; $9ddd : $02, $0d
	clc                                                  ; $9ddf : $18

br_0c_9de0:
	ora [$70]                                                  ; $9de0 : $07, $70
	cop $cf.b                                                  ; $9de2 : $02, $cf
	ora [$17], Y                                                  ; $9de4 : $17, $17
	ora [$17], Y                                                  ; $9de6 : $17, $17
	jsr $7935.w                                                  ; $9de8 : $20, $35, $79
	and $7a, X                                                  ; $9deb : $35, $7a
	and $7b, X                                                  ; $9ded : $35, $7b
	and $7c, X                                                  ; $9def : $35, $7c
	and $7d, X                                                  ; $9df1 : $35, $7d
	and $9f, X                                                  ; $9df3 : $35, $9f
	and $a0, X                                                  ; $9df5 : $35, $a0
	and $a1, X                                                  ; $9df7 : $35, $a1
	ora [$17], Y                                                  ; $9df9 : $17, $17
	ora [$17], Y                                                  ; $9dfb : $17, $17
	trb $0501.w                                                  ; $9dfd : $1c, $01, $05
	ora ($a0, X)                                                  ; $9e00 : $01, $a0
	asl $fa                                                  ; $9e02 : $06, $fa
	ina                                                  ; $9e04 : $1a
	.db $00                                                  ; $9e05 : $00
	ora $1a                                                  ; $9e06 : $05, $1a
	ora ($21, X)                                                  ; $9e08 : $01, $21
	ina                                                  ; $9e0a : $1a
	cop $9f.b                                                  ; $9e0b : $02, $9f
	ora #$05.b                                                  ; $9e0d : $09, $05
	ora $081a.w, X                                                  ; $9e0f : $1d, $1a, $08
	asl                                                  ; $9e12 : $0a
	ora $0100.w                                                  ; $9e13 : $0d, $00, $01
	ora [$78]                                                  ; $9e16 : $07, $78
	ldy $07, X                                                  ; $9e18 : $b4, $07
	ror $c316.w, X                                                  ; $9e1a : $7e, $16, $c3
	stz $17                                                  ; $9e1d : $64, $17
	ora [$17], Y                                                  ; $9e1f : $17, $17
	ora [$20], Y                                                  ; $9e21 : $17, $20
	and $b3, X                                                  ; $9e23 : $35, $b3
	and $b4, X                                                  ; $9e25 : $35, $b4
	and $b5, X                                                  ; $9e27 : $35, $b5
	and $b6, X                                                  ; $9e29 : $35, $b6
	and $b7, X                                                  ; $9e2b : $35, $b7
	and $d9, X                                                  ; $9e2d : $35, $d9
	and $da, X                                                  ; $9e2f : $35, $da
	and $db, X                                                  ; $9e31 : $35, $db
	ora [$17], Y                                                  ; $9e33 : $17, $17
	ora [$17], Y                                                  ; $9e35 : $17, $17
	trb $0501.w                                                  ; $9e37 : $1c, $01, $05
	ora ($60, X)                                                  ; $9e3a : $01, $60
	asl $fa                                                  ; $9e3c : $06, $fa
	ora #$04.b                                                  ; $9e3e : $09, $04
	ora [$60]                                                  ; $9e40 : $07, $60
	ora $1a1a.w, X                                                  ; $9e42 : $1d, $1a, $1a
	.db $00                                                  ; $9e45 : $00
	ora ($1a)                                                  ; $9e46 : $12, $1a
	ora ($3a, X)                                                  ; $9e48 : $01, $3a
	ina                                                  ; $9e4a : $1a
	cop $a0.b                                                  ; $9e4b : $02, $a0
	php                                                  ; $9e4d : $08
	tsb $0721.w                                                  ; $9e4e : $0c, $21, $07
	ror $2a0d.w, X                                                  ; $9e51 : $7e, $0d, $2a
	ora #$05.b                                                  ; $9e54 : $09, $05
	cop $b8.b                                                  ; $9e56 : $02, $b8
	ora [$17], Y                                                  ; $9e58 : $17, $17
	ora [$17], Y                                                  ; $9e5a : $17, $17
	jsr $ed35.w                                                  ; $9e5c : $20, $35, $ed
	and $ee, X                                                  ; $9e5f : $35, $ee
	and $ef, X                                                  ; $9e61 : $35, $ef
	and $f0, X                                                  ; $9e63 : $35, $f0
	and $f1, X                                                  ; $9e65 : $35, $f1
	and $f2, X                                                  ; $9e67 : $35, $f2
	rol $21, X                                                  ; $9e69 : $36, $21
	rol $22, X                                                  ; $9e6b : $36, $22
	ora [$17], Y                                                  ; $9e6d : $17, $17
	ora [$17], Y                                                  ; $9e6f : $17, $17
	ora [$1c], Y                                                  ; $9e71 : $17, $1c
	ora ($05, X)                                                  ; $9e73 : $01, $05
	ora ($30, X)                                                  ; $9e75 : $01, $30
	asl $9a                                                  ; $9e77 : $06, $9a
	ora #$03.b                                                  ; $9e79 : $09, $03
	phd                                                  ; $9e7b : $0b
	.db $00                                                  ; $9e7c : $00
	ina                                                  ; $9e7d : $1a
	.db $00                                                  ; $9e7e : $00
	php                                                  ; $9e7f : $08
	ina                                                  ; $9e80 : $1a
	cop $f0.b                                                  ; $9e81 : $02, $f0
	ora $081f.w, X                                                  ; $9e83 : $1d, $1f, $08
	ora $010b.w                                                  ; $9e86 : $0d, $0b, $01
	ora [$60]                                                  ; $9e89 : $07, $60
	ora $2040.w                                                  ; $9e8b : $0d, $40, $20
	bit $0d91.w                                                  ; $9e8e : $2c, $91, $0d

br_0c_9e91:
	.db $00                                                  ; $9e91 : $00
	asl $6a                                                  ; $9e92 : $06, $6a
	bit $600d.w                                                  ; $9e94 : $2c, $0d, $60
	.db $90, $0d                                                  ; $9e97 : $90, $0d

	.db $00                                                  ; $9e99 : $00
	asl $80                                                  ; $9e9a : $06, $80
	bit $500d.w                                                  ; $9e9c : $2c, $0d, $50
	sta $1c1717.l                                                  ; $9e9f : $8f, $17, $17, $1c
	ora ($05, X)                                                  ; $9ea3 : $01, $05
	ora ($30, X)                                                  ; $9ea5 : $01, $30
	asl $9a                                                  ; $9ea7 : $06, $9a
	ora #$03.b                                                  ; $9ea9 : $09, $03
	phd                                                  ; $9eab : $0b
	.db $00                                                  ; $9eac : $00
	ina                                                  ; $9ead : $1a
	.db $00                                                  ; $9eae : $00
	php                                                  ; $9eaf : $08
	ina                                                  ; $9eb0 : $1a
	cop $f0.b                                                  ; $9eb1 : $02, $f0
	ora $081f.w, X                                                  ; $9eb3 : $1d, $1f, $08
	pld                                                  ; $9eb6 : $2b
	ora [$60]                                                  ; $9eb7 : $07, $60
	ora $2c40.w                                                  ; $9eb9 : $0d, $40, $2c
	sta ($0d), Y                                                  ; $9ebc : $91, $0d
	.db $00                                                  ; $9ebe : $00
	asl $6a                                                  ; $9ebf : $06, $6a
	bit $600d.w                                                  ; $9ec1 : $2c, $0d, $60
	.db $90, $0d                                                  ; $9ec4 : $90, $0d

	.db $00                                                  ; $9ec6 : $00
	asl $80                                                  ; $9ec7 : $06, $80
	bit $500d.w                                                  ; $9ec9 : $2c, $0d, $50
	sta $000017.l                                                  ; $9ecc : $8f, $17, $00, $00
	.db $00                                                  ; $9ed0 : $00
	.db $00                                                  ; $9ed1 : $00
	sbc $ffffff.l, X                                                  ; $9ed2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ed6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9eda : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ede : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ee2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ee6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9eea : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9eee : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ef2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ef6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9efa : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9efe : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f02 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f06 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f0a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f0e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f12 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f16 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f1a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f1e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f22 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f26 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f2a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f2e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f32 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f36 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f3a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f3e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f42 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f46 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f4a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f4e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f52 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f56 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f5a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f5e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f62 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f66 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f6a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f6e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f72 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f76 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f7a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f7e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f82 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f86 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f8a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f8e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f92 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f96 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f9a : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9f9e : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fa2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fa6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9faa : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fae : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fb2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fb6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fba : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fbe : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fc2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fc6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fca : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fce : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fd2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fd6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fda : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fde : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fe2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fe6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fea : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9fee : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ff2 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ff6 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $9ffa : $ff, $ff, $ff, $ff
	sbc $f822ff.l, X                                                  ; $9ffe : $ff, $ff, $22, $f8
	ina                                                  ; $a002 : $1a
	ora $b5, S                                                  ; $a003 : $03, $b5
	.db $00                                                  ; $a005 : $00
	ora ($1a, X)                                                  ; $a006 : $01, $1a
	ora $ff, S                                                  ; $a008 : $03, $ff
	.db $00                                                  ; $a00a : $00
	.db $00                                                  ; $a00b : $00
	.db $00                                                  ; $a00c : $00
	.db $00                                                  ; $a00d : $00
	bpl br_0c_a010                                                  ; $a00e : $10, $00

br_0c_a010:
	.db $00                                                  ; $a010 : $00
	.db $00                                                  ; $a011 : $00
	.db $00                                                  ; $a012 : $00
	.db $00                                                  ; $a013 : $00
	.db $00                                                  ; $a014 : $00
	.db $00                                                  ; $a015 : $00
	.db $00                                                  ; $a016 : $00
	.db $00                                                  ; $a017 : $00
	.db $00                                                  ; $a018 : $00
	.db $00                                                  ; $a019 : $00
	.db $00                                                  ; $a01a : $00
	.db $00                                                  ; $a01b : $00
	.db $00                                                  ; $a01c : $00
	.db $00                                                  ; $a01d : $00
	.db $00                                                  ; $a01e : $00
	.db $00                                                  ; $a01f : $00
	.db $00                                                  ; $a020 : $00
	.db $00                                                  ; $a021 : $00
	.db $00                                                  ; $a022 : $00
	.db $00                                                  ; $a023 : $00
	.db $00                                                  ; $a024 : $00
	jml [$ff00.w]                                                  ; $a025 : $dc, $00, $ff


	sbc $ffffff.l, X                                                  ; $a028 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $a02c : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $a030 : $ff, $ff, $ff, $ff
	sbc $ffffff.l, X                                                  ; $a034 : $ff, $ff, $ff, $ff
	sbc $1f40ff.l, X                                                  ; $a038 : $ff, $ff, $40, $1f
	eor ($05, X)                                                  ; $a03c : $41, $05
	rti                                                  ; $a03e : $40


	tsb $41                                                  ; $a03f : $04, $41
	and $010441.l, X                                                  ; $a041 : $3f, $41, $04, $01
	asl $41                                                  ; $a045 : $06, $41
	ora $01                                                  ; $a047 : $05, $01
	ora $41                                                  ; $a049 : $05, $41
	ora $01                                                  ; $a04b : $05, $01
	ora $41                                                  ; $a04d : $05, $41
	jsr $18c1.w                                                  ; $a04f : $20, $c1, $18
	eor ($0e, X)                                                  ; $a052 : $41, $0e
	cmp ($1a, X)                                                  ; $a054 : $c1, $1a
	eor ($0e, X)                                                  ; $a056 : $41, $0e
	rti                                                  ; $a058 : $40


	ora $41                                                  ; $a059 : $05, $41
	tsb $40                                                  ; $a05b : $04, $40
	tsb $41                                                  ; $a05d : $04, $41
	ora $0501.w, Y                                                  ; $a05f : $19, $01, $05
	eor ($0e, X)                                                  ; $a062 : $41, $0e
	rti                                                  ; $a064 : $40


	ora #$41.b                                                  ; $a065 : $09, $41
	ora [$40]                                                  ; $a067 : $07, $40
	ora $41, S                                                  ; $a069 : $03, $41
	ora $000401.l, X                                                  ; $a06b : $1f, $01, $04, $00
	cop $40.b                                                  ; $a06f : $02, $40
	asl $00                                                  ; $a071 : $06, $00
	tsb $40                                                  ; $a073 : $04, $40
	tsb $00                                                  ; $a075 : $04, $00
	asl $40                                                  ; $a077 : $06, $40
	ora $00, S                                                  ; $a079 : $03, $00
	tsb $40                                                  ; $a07b : $04, $40
	ora [$41]                                                  ; $a07d : $07, $41
	asl $40                                                  ; $a07f : $06, $40
	tsb $41                                                  ; $a081 : $04, $41
	ora [$c1]                                                  ; $a083 : $07, $c1
	ora $0c41.w, X                                                  ; $a085 : $1d, $41, $0c
	rti                                                  ; $a088 : $40


	ora $41                                                  ; $a089 : $05, $41
	ora $40                                                  ; $a08b : $05, $40
	ora $41, S                                                  ; $a08d : $03, $41
	tsb $02c1.w                                                  ; $a08f : $0c, $c1, $02
	cpy #$800e.w                                                  ; $a092 : $c0, $0e, $80
	ora ($00, X)                                                  ; $a095 : $01, $00
	ora $40                                                  ; $a097 : $05, $40
	asl $41, X                                                  ; $a099 : $16, $41
	asl $40                                                  ; $a09b : $06, $40
	ora $41, S                                                  ; $a09d : $03, $41
	ora $0d40.w, Y                                                  ; $a09f : $19, $40, $0d
	cpy #$400e.w                                                  ; $a0a2 : $c0, $0e, $40
	ora ($00, X)                                                  ; $a0a5 : $01, $00
	ora $40, S                                                  ; $a0a7 : $03, $40
	ora ($c0, S), Y                                                  ; $a0a9 : $13, $c0
	tsb $c1                                                  ; $a0ab : $04, $c1
	ora ($41)                                                  ; $a0ad : $12, $41
	ora [$c1]                                                  ; $a0af : $07, $c1
	ora $41, X                                                  ; $a0b1 : $15, $41
	ora [$40]                                                  ; $a0b3 : $07, $40
	ora #$42.b                                                  ; $a0b5 : $09, $42
	jsr $1c44.w                                                  ; $a0b7 : $20, $44, $1c
	cpy $0a                                                  ; $a0ba : $c4, $0a
	cpy #$4001.w                                                  ; $a0bc : $c0, $01, $40
	trb $0742.w                                                  ; $a0bf : $1c, $42, $07
	rti                                                  ; $a0c2 : $40


	cop $42.b                                                  ; $a0c3 : $02, $42
	ora [$40], Y                                                  ; $a0c5 : $17, $40

br_0c_a0c7:
	asl $0500.w                                                  ; $a0c7 : $0e, $00, $05
	rti                                                  ; $a0ca : $40


	phd                                                  ; $a0cb : $0b
	wdm                                                  ; $a0cc : $42
	asl $40                                                  ; $a0cd : $06, $40
	tsb $42                                                  ; $a0cf : $04, $42
	ora $0940.w, X                                                  ; $a0d1 : $1d, $40, $09
	eor ($06, X)                                                  ; $a0d4 : $41, $06
	ora ($01, X)                                                  ; $a0d6 : $01, $01
	.db $00                                                  ; $a0d8 : $00
	ora $40                                                  ; $a0d9 : $05, $40
	ora $00                                                  ; $a0db : $05, $00
	tsb $40                                                  ; $a0dd : $04, $40
	tsb $00                                                  ; $a0df : $04, $00
	tsb $40                                                  ; $a0e1 : $04, $40
	asl $00                                                  ; $a0e3 : $06, $00
	ora $40, S                                                  ; $a0e5 : $03, $40
	ora ($00, S), Y                                                  ; $a0e7 : $13, $00
	ora $40                                                  ; $a0e9 : $05, $40
	ora $00                                                  ; $a0eb : $05, $00
	tsb $40                                                  ; $a0ed : $04, $40
	ora $00                                                  ; $a0ef : $05, $00
	tsb $40                                                  ; $a0f1 : $04, $40
	and $411840.l, X                                                  ; $a0f3 : $3f, $40, $18, $41
	asl $0140.w, X                                                  ; $a0f7 : $1e, $40, $01
	wdm                                                  ; $a0fa : $42
	cop $40.b                                                  ; $a0fb : $02, $40
	cop $c0.b                                                  ; $a0fd : $02, $c0
	php                                                  ; $a0ff : $08
	rti                                                  ; $a100 : $40


	ora ($00, X)                                                  ; $a101 : $01, $00
	ora [$40]                                                  ; $a103 : $07, $40
	asl $0641.w                                                  ; $a105 : $0e, $41, $06
	rti                                                  ; $a108 : $40


	ora $41, S                                                  ; $a109 : $03, $41
	jsr $410540.l                                                  ; $a10b : $22, $40, $05, $41
	ora $40                                                  ; $a10f : $05, $40
	tsb $41                                                  ; $a111 : $04, $41
	ora $10c1.w, Y                                                  ; $a113 : $19, $c1, $10
	eor ($03, X)                                                  ; $a116 : $41, $03
	ora ($06, X)                                                  ; $a118 : $01, $06
	eor ($07, X)                                                  ; $a11a : $41, $07
	rti                                                  ; $a11c : $40


	tsb $0741.w                                                  ; $a11d : $0c, $41, $07
	rti                                                  ; $a120 : $40


	cop $41.b                                                  ; $a121 : $02, $41
	ora ($c1), Y                                                  ; $a123 : $11, $c1
	ora $0741.w, Y                                                  ; $a125 : $19, $41, $07
	ora ($06, X)                                                  ; $a128 : $01, $06
	eor ($05, X)                                                  ; $a12a : $41, $05
	ora ($01, X)                                                  ; $a12c : $01, $01
	.db $00                                                  ; $a12e : $00
	ora $40, S                                                  ; $a12f : $03, $40
	ora $00                                                  ; $a131 : $05, $00
	tsb $40                                                  ; $a133 : $04, $40
	asl $00                                                  ; $a135 : $06, $00
	ora ($40, X)                                                  ; $a137 : $01, $40
	ora $41                                                  ; $a139 : $05, $41
	asl $40                                                  ; $a13b : $06, $40
	ora $41, S                                                  ; $a13d : $03, $41
	rol                                                  ; $a13f : $2a
	ora ($06, X)                                                  ; $a140 : $01, $06
	eor ($05, X)                                                  ; $a142 : $41, $05
	ora ($04, X)                                                  ; $a144 : $01, $04
	eor ($02, X)                                                  ; $a146 : $41, $02
	rti                                                  ; $a148 : $40


	tsb $00                                                  ; $a149 : $04, $00
	ora $40, S                                                  ; $a14b : $03, $40
	php                                                  ; $a14d : $08
	eor ($07, X)                                                  ; $a14e : $41, $07
	rti                                                  ; $a150 : $40


	cop $41.b                                                  ; $a151 : $02, $41
	trb $23c1.w                                                  ; $a153 : $1c, $c1, $23
	eor ($14, X)                                                  ; $a156 : $41, $14
	eor #$01.b                                                  ; $a158 : $49, $01
	pha                                                  ; $a15a : $48
	cop $4a.b                                                  ; $a15b : $02, $4a
	ora ($42, X)                                                  ; $a15d : $01, $42
	ora $2744.w                                                  ; $a15f : $0d, $44, $27
	cpy $02                                                  ; $a162 : $c4, $02
	cpy #$4009.w                                                  ; $a164 : $c0, $09, $40
	ora #$00.b                                                  ; $a167 : $09, $00
	asl                                                  ; $a169 : $0a
	cop $07.b                                                  ; $a16a : $02, $07
	.db $00                                                  ; $a16c : $00
	ora $02, S                                                  ; $a16d : $03, $02
	jsr $1500.w                                                  ; $a16f : $20, $00, $15
	ora ($3f, X)                                                  ; $a172 : $01, $3f
	ora ($3f, X)                                                  ; $a174 : $01, $3f
	ora ($3f, X)                                                  ; $a176 : $01, $3f
	ora ($14, X)                                                  ; $a178 : $01, $14
	.db $00                                                  ; $a17a : $00
	and $003f00.l, X                                                  ; $a17b : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a17f : $3f, $00, $3f, $00
	ora $1040.w, X                                                  ; $a183 : $1d, $40, $10
	.db $00                                                  ; $a186 : $00
	and $003f00.l, X                                                  ; $a187 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a18b : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a18f : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a193 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a197 : $3f, $00, $3f, $00
	and $400a00.l, X                                                  ; $a19b : $3f, $00, $0a, $40
	ora [$00]                                                  ; $a19f : $07, $00
	and $003f00.l, X                                                  ; $a1a1 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1a5 : $3f, $00, $3f, $00
	rol $40, X                                                  ; $a1a9 : $36, $40
	php                                                  ; $a1ab : $08
	.db $00                                                  ; $a1ac : $00
	and $003f00.l, X                                                  ; $a1ad : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1b1 : $3f, $00, $3f, $00
	and $401800.l, X                                                  ; $a1b5 : $3f, $00, $18, $40
	ora #$00.b                                                  ; $a1b9 : $09, $00
	and $003f00.l, X                                                  ; $a1bb : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1bf : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1c3 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1c7 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1cb : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1cf : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a1d3 : $3f, $00, $3f, $00
	bpl br_0c_a219                                                  ; $a1d7 : $10, $40

	.db $10, $41                                                  ; $a1d9 : $10, $41

	asl $40                                                  ; $a1db : $06, $40
	ora $41, S                                                  ; $a1dd : $03, $41
	plp                                                  ; $a1df : $28
	rti                                                  ; $a1e0 : $40


	tsb $0241.w                                                  ; $a1e1 : $0c, $41, $02
	rti                                                  ; $a1e4 : $40


	ora $41                                                  ; $a1e5 : $05, $41
	jsr $410b40.l                                                  ; $a1e7 : $22, $40, $0b, $41
	php                                                  ; $a1eb : $08
	rti                                                  ; $a1ec : $40


	cop $41.b                                                  ; $a1ed : $02, $41
	and $40, S                                                  ; $a1ef : $23, $40
	ora $41                                                  ; $a1f1 : $05, $41
	ora $40                                                  ; $a1f3 : $05, $40
	ora $41, S                                                  ; $a1f5 : $03, $41
	bmi br_0c_a239                                                  ; $a1f7 : $30, $40

	ora $41                                                  ; $a1f9 : $05, $41
	ora $40                                                  ; $a1fb : $05, $40
	ora $41, S                                                  ; $a1fd : $03, $41
	tsb $01                                                  ; $a1ff : $04, $01
	tsb $00                                                  ; $a201 : $04, $00
	ora $40, S                                                  ; $a203 : $03, $40
	ora #$00.b                                                  ; $a205 : $09, $00
	asl $40                                                  ; $a207 : $06, $40
	bit $42                                                  ; $a209 : $24, $42
	ora [$40]                                                  ; $a20b : $07, $40
	php                                                  ; $a20d : $08
	cpy #$8002.w                                                  ; $a20e : $c0, $02, $80
	ora ($c0, X)                                                  ; $a211 : $01, $c0
	ora $c2                                                  ; $a213 : $05, $c2
	ora ($42, X)                                                  ; $a215 : $01, $42
	cop $02.b                                                  ; $a217 : $02, $02

br_0c_a219:
	ora ($42), Y                                                  ; $a219 : $11, $42
	ora $1040.w                                                  ; $a21b : $0d, $40, $10
	eor ($07, X)                                                  ; $a21e : $41, $07
	rti                                                  ; $a220 : $40


	cop $41.b                                                  ; $a221 : $02, $41
	ora $410540.l, X                                                  ; $a223 : $1f, $40, $05, $41
	asl $40                                                  ; $a227 : $06, $40
	cop $41.b                                                  ; $a229 : $02, $41
	asl $0440.w, X                                                  ; $a22b : $1e, $40, $04
	eor ($06, X)                                                  ; $a22e : $41, $06
	rti                                                  ; $a230 : $40


	cop $41.b                                                  ; $a231 : $02, $41
	ora $0501.w                                                  ; $a233 : $0d, $01, $05
	.db $00                                                  ; $a236 : $00
	ora ($40, X)                                                  ; $a237 : $01, $40

br_0c_a239:
	ora $00                                                  ; $a239 : $05, $00
	ora $40                                                  ; $a23b : $05, $40
	tsb $00                                                  ; $a23d : $04, $00
	tsb $40                                                  ; $a23f : $04, $40
	ora $00                                                  ; $a241 : $05, $00
	tsb $40                                                  ; $a243 : $04, $40
	asl $00                                                  ; $a245 : $06, $00
	cop $40.b                                                  ; $a247 : $02, $40
	plp                                                  ; $a249 : $28
	cpy #$8005.w                                                  ; $a24a : $c0, $05, $80
	ora $00, S                                                  ; $a24d : $03, $00
	ora $40                                                  ; $a24f : $05, $40
	ora ($41, S), Y                                                  ; $a251 : $13, $41
	ora [$40]                                                  ; $a253 : $07, $40
	cop $41.b                                                  ; $a255 : $02, $41
	ina                                                  ; $a257 : $1a
	rti                                                  ; $a258 : $40


	asl $41                                                  ; $a259 : $06, $41
	tsb $40                                                  ; $a25b : $04, $40
	tsb $41                                                  ; $a25d : $04, $41
	ora ($01, S), Y                                                  ; $a25f : $13, $01
	asl $41                                                  ; $a261 : $06, $41
	tsb $00                                                  ; $a263 : $04, $00
	ora $40                                                  ; $a265 : $05, $40
	ora $00                                                  ; $a267 : $05, $00
	tsb $40                                                  ; $a269 : $04, $40
	ora $00                                                  ; $a26b : $05, $00
	tsb $40                                                  ; $a26d : $04, $40
	ora [$00]                                                  ; $a26f : $07, $00
	ora ($40, X)                                                  ; $a271 : $01, $40
	ora $41                                                  ; $a273 : $05, $41
	asl $40                                                  ; $a275 : $06, $40
	ora $41, S                                                  ; $a277 : $03, $41
	asl $06c1.w                                                  ; $a279 : $0e, $c1, $06
	iny                                                  ; $a27c : $c8
	cop $c2.b                                                  ; $a27d : $02, $c2
	ora #$42.b                                                  ; $a27f : $09, $42
	asl $c2                                                  ; $a281 : $06, $c2
	ora ($42, S), Y                                                  ; $a283 : $13, $42
	asl $c2                                                  ; $a285 : $06, $c2
	asl $42, X                                                  ; $a287 : $16, $42
	ora #$40.b                                                  ; $a289 : $09, $40
	ora $42                                                  ; $a28b : $05, $42
	asl $40                                                  ; $a28d : $06, $40
	cop $42.b                                                  ; $a28f : $02, $42
	ora $c2                                                  ; $a291 : $05, $c2
	asl $ca                                                  ; $a293 : $06, $ca
	cop $c8.b                                                  ; $a295 : $02, $c8
	cop $ca.b                                                  ; $a297 : $02, $ca
	tsb $05c8.w                                                  ; $a299 : $0c, $c8, $05
	pha                                                  ; $a29c : $48
	and $401b48.l, X                                                  ; $a29d : $3f, $48, $1b, $40
	ora $41                                                  ; $a2a1 : $05, $41
	trb $0201.w                                                  ; $a2a3 : $1c, $01, $02
	.db $00                                                  ; $a2a6 : $00
	ora $40, S                                                  ; $a2a7 : $03, $40
	ora #$00.b                                                  ; $a2a9 : $09, $00
	asl $40                                                  ; $a2ab : $06, $40
	asl                                                  ; $a2ad : $0a
	.db $00                                                  ; $a2ae : $00
	ora #$40.b                                                  ; $a2af : $09, $40
	asl $0400.w                                                  ; $a2b1 : $0e, $00, $04
	rti                                                  ; $a2b4 : $40


	ora [$00]                                                  ; $a2b5 : $07, $00
	ora $40, S                                                  ; $a2b7 : $03, $40
	and #$41.b                                                  ; $a2b9 : $29, $41
	asl $1501.w                                                  ; $a2bb : $0e, $01, $15
	.db $00                                                  ; $a2be : $00
	asl $01                                                  ; $a2bf : $06, $01
	ora $00                                                  ; $a2c1 : $05, $00
	ora $01, S                                                  ; $a2c3 : $03, $01
	ora [$00], Y                                                  ; $a2c5 : $17, $00
	asl $01                                                  ; $a2c7 : $06, $01
	tsb $00                                                  ; $a2c9 : $04, $00
	tsb $01                                                  ; $a2cb : $04, $01
	ora $0b81.w, Y                                                  ; $a2cd : $19, $81, $0b
	bit #$01.b                                                  ; $a2d0 : $89, $01
	dey                                                  ; $a2d2 : $88
	cop $8a.b                                                  ; $a2d3 : $02, $8a
	ora ($82, X)                                                  ; $a2d5 : $01, $82
	ora $02                                                  ; $a2d7 : $05, $02
	asl $82                                                  ; $a2d9 : $06, $82
	trb $02                                                  ; $a2db : $14, $02
	tsb $82                                                  ; $a2dd : $04, $82
	trb $02                                                  ; $a2df : $14, $02
	cop $0a.b                                                  ; $a2e1 : $02, $0a
	ora $8a                                                  ; $a2e3 : $05, $8a
	ora ($8a, X)                                                  ; $a2e5 : $01, $8a
	sta $88, S                                                  ; $a2e7 : $83, $88
	.db $82                                                  ; $a2e9 : $82

	sta ($9e, X)                                                  ; $a2ea : $81, $9e
	ora ($08, X)                                                  ; $a2ec : $01, $08
	sta ($14, X)                                                  ; $a2ee : $81, $14
	ora ($03, X)                                                  ; $a2f0 : $01, $03
	sta ($15, X)                                                  ; $a2f2 : $81, $15
	ora ($06, X)                                                  ; $a2f4 : $01, $06
	sta ($01, X)                                                  ; $a2f6 : $81, $01
	sta ($84, X)                                                  ; $a2f8 : $81, $84
	dey                                                  ; $a2fa : $88
	sta ($82, X)                                                  ; $a2fb : $81, $82

br_0c_a2fd:
	sta $0b02.w, Y                                                  ; $a2fd : $99, $02, $0b
	.db $82, $15, $02

	tsb $82                                                  ; $a303 : $04, $82
	clc                                                  ; $a305 : $18
	cop $08.b                                                  ; $a306 : $02, $08
	.db $82                                                  ; $a308 : $82

	ora ($82, X)                                                  ; $a309 : $01, $82
	sta ($8a, X)                                                  ; $a30b : $81, $8a
	sta $88                                                  ; $a30d : $85, $88
	sta ($81, X)                                                  ; $a30f : $81, $81
	sta $0281.w, X                                                  ; $a311 : $9d, $81, $02
	ora ($06, X)                                                  ; $a314 : $01, $06
	sta ($16, X)                                                  ; $a316 : $81, $16
	ora ($04, X)                                                  ; $a318 : $01, $04
	sta ($19, X)                                                  ; $a31a : $81, $19
	ora ($06, X)                                                  ; $a31c : $01, $06
	sta ($82, X)                                                  ; $a31e : $81, $82
	sty $81                                                  ; $a320 : $84, $81
	.db $82, $9b, $02

	sta ($02, X)                                                  ; $a325 : $81, $02
	phd                                                  ; $a327 : $0b
	.db $82, $14, $02                                                  ; $a328 : $82, $14, $02

	ora $82                                                  ; $a32b : $05, $82
	asl $02, X                                                  ; $a32d : $16, $02
	asl                                                  ; $a32f : $0a
	.db $82                                                  ; $a330 : $82

	.db $82                                                  ; $a331 : $82

	txa                                                  ; $a332 : $8a
	.db $82                                                  ; $a333 : $82

	dey                                                  ; $a334 : $88
	sta ($81, X)                                                  ; $a335 : $81, $81
	ldy $01                                                  ; $a337 : $a4, $01
	sta ($01, X)                                                  ; $a339 : $81, $01
	ora #$81.b                                                  ; $a33b : $09, $81
	asl $01, X                                                  ; $a33d : $16, $01
	php                                                  ; $a33f : $08
	sta ($1b, X)                                                  ; $a340 : $81, $1b
	ora ($12, X)                                                  ; $a342 : $01, $12
	.db $00                                                  ; $a344 : $00
	ora $01                                                  ; $a345 : $05, $01
	asl $00                                                  ; $a347 : $06, $00
	ora $01, S                                                  ; $a349 : $03, $01
	and $013f01.l, X                                                  ; $a34b : $3f, $01, $3f, $01
	ora $00, X                                                  ; $a34f : $15, $00
	ora [$20], Y                                                  ; $a351 : $17, $20
	ora ($30, X)                                                  ; $a353 : $01, $30
	.db $00                                                  ; $a355 : $00
	.db $00                                                  ; $a356 : $00
	and $003f00.l, X                                                  ; $a357 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a35b : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a35f : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a363 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a367 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a36b : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a36f : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a373 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a377 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a37b : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a37f : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a383 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a387 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a38b : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a38f : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a393 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a397 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a39b : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a39f : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3a3 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3a7 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3ab : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3af : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3b3 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3b7 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3bb : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3bf : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3c3 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3c7 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3cb : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3cf : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3d3 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3d7 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3db : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3df : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3e3 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3e7 : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3eb : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3ef : $3f, $00, $3f, $00
	and $003f00.l, X                                                  ; $a3f3 : $3f, $00, $3f, $00
	and $423f00.l, X                                                  ; $a3f7 : $3f, $00, $3f, $42
	asl $c2                                                  ; $a3fb : $06, $c2
	ora $0642.w                                                  ; $a3fd : $0d, $42, $06


PaletteData_c_a400:
	.dw $35d0, $7bde, $239d, $091e, $7b6f, $7a8a, $5963, $7e00, $7900, $40c4, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a420:
	.dw $35d0, $7bde, $239d, $091e, $1f1e, $11f8, $0132, $43f7, $1bac, $1689, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a440:
	.dw $35d0, $7bde, $239d, $091e, $6776, $424e, $2547, $03ff, $02d7, $018d, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a460:
	.dw $2184, $73bc, $5394, $3b8e, $2308, $1284, $731c, $5a3a, $728a, $3098, $7394, $730f, $4559, $7205, $7180, $18c6

PaletteData_c_a480:
	.dw $35d0, $7bde, $239d, $091e, $1f1e, $11f8, $0132, $43f7, $1bac, $1689, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a4a0:
	.dw $35d0, $7bde, $239d, $091e, $6776, $424e, $2547, $03ff, $02d7, $018d, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a4c0:
	.dw $35d0, $7bde, $239d, $091e, $4f9a, $274f, $222c, $7e14, $5d0e, $3c8c, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a4e0:
	.dw $35d0, $7bde, $239d, $091e, $6318, $4210, $2108, $195f, $0098, $0010, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a500:
	.dw $35d0, $7bde, $239d, $091e, $03ff, $02d7, $018d, $1ede, $11b8, $00f2, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a520:
	.dw $35d0, $7bde, $239d, $091e, $531c, $3214, $110c, $7dfe, $6518, $5093, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a540:
	.dw $35d0, $7bde, $239d, $091e, $7e3a, $7174, $58ef, $7baf, $6b29, $5264, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a560:
	.dw $35d0, $7bde, $239d, $091e, $1ede, $0976, $0050, $73d0, $5b08, $3a00, $42df, $2597, $1110, $739c, $4e73, $0c63

PaletteData_c_a580:
	.dw $35d0, $7bde, $239d, $091e, $7bff, $1f9f, $09df, $73df, $0ade, $055d, $42df, $2597, $1110, $4fbf, $121d, $0c63

PaletteData_c_a5a0:
	.dw $35af, $739c, $239d, $091e, $4f5f, $3e9e, $163c, $16bf, $163c, $113c, $42df, $2597, $1110, $4f5f, $3e9e, $0011

PaletteData_c_a5c0:
	.dw $35af, $739c, $239d, $091e, $7b9c, $5e8f, $518d, $626f, $518d, $5109, $42df, $2597, $1110, $7b9c, $59ef, $40a6

PaletteData_c_a5e0:
	.dw $35af, $739c, $239d, $091e, $7bfa, $5389, $4324, $43f1, $4324, $22a4, $42df, $2597, $1110, $7bfa, $5389, $0180

PaletteData_c_a600:
	.dw $35af, $739c, $239d, $091e, $6ff8, $3f24, $2e44, $12c8, $2e44, $11a4, $42df, $2597, $1110, $6ff8, $3f24, $0120

PaletteData_c_a620:
	.dw $35af, $739c, $239d, $091e, $7fb9, $7740, $6e20, $6ea0, $6e20, $6d60, $42df, $2597, $1110, $7fb9, $6e20, $6d60

PaletteData_c_a640:
	.dw $35af, $739c, $239d, $091e, $7b34, $6ec8, $7900, $7e00, $7900, $40c4, $42df, $2597, $1110, $7b34, $6ec8, $0c63

PaletteData_c_a660:
	.dw $35af, $739c, $239d, $091e, $7b5d, $7a59, $7976, $7a3a, $7976, $5c91, $42df, $2597, $1110, $7b5d, $7a59, $3828

PaletteData_c_a680:
	.dw $35af, $739c, $239d, $091e, $7b9f, $45de, $351b, $563e, $351b, $34d3, $42df, $2597, $1110, $7b9f, $45de, $140c

PaletteData_c_a6a0:
	.dw $0000, $6b5a, $5a0a, $28c4, $0000, $63b1, $0220, $10e3, $0000, $2f1f, $0577, $0049, $0000, $0000, $0000, $0000

PaletteData_c_a6c0:
	.dw $36ca, $129c, $1194, $5691, $1c8a, $2d48, $45ea, $779b, $01c0, $469a, $5542, $3218, $2516, $1833, $7eab, $1443
	.dw $36ca, $4bf2, $3b4d, $2aa8, $1e02, $7b97, $76d3, $760f, $69aa, $7adb, $6e16, $5d51, $50ad, $7146, $6103, $24e5
	.dw $36ca, $5bbe, $3b3d, $1e9c, $09fa, $227f, $117d, $08dc, $0878, $7b1f, $6a3f, $517d, $3cdb, $0559, $04d8, $24e5
	.dw $35f1, $739c, $6f38, $6af4, $6ab0, $662a, $74bf, $50dc, $2c98, $1894, $769f, $75df, $108f, $66b5, $418c, $1887

PaletteData_c_a740:
	.dw $2d6e, $7716, $6ad3, $5e4e, $4589, $2ce6, $7fff, $7fe0, $7e60, $7ce0, $5400, $0000, $6318, $4e73, $318c, $0000

PaletteData_c_a760:
	.dw $2d6e, $7716, $6ad3, $5e4e, $4589, $2ce6, $7fff, $7fe0, $7e60, $7ce0, $5400, $0000, $6318, $4e73, $318c, $0000

PaletteData_c_a780:
	.dw $0000, $7504, $10eb, $081e, $7f49, $7a43, $5942, $6405, $4000, $1800, $25f7, $1970, $4b3f, $739c, $2801, $0840
	.dw $0000, $7504, $10eb, $081e, $7f49, $7a43, $5942, $6405, $4000, $1800, $25f7, $1970, $4b3f, $739c, $2801, $0840

PaletteData_c_a7c0:
	.dw $35af, $739c, $0abe, $091e, $7b6f, $6e05, $7e40, $7900, $40c4, $42df, $25f8, $1131, $5584, $4e73, $318c, $1084
	.dw $35af, $091e, $69e5, $7e40, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $7900, $40c4, $1084
	.dw $35af, $7fff, $72cf, $7625, $7f3d, $7aba, $7638, $71d6, $6994, $6172, $5950, $0000, $0000, $0000, $0000, $0000
; Unused colours
	.dw $35d0, $739c, $0abe, $091e, $1bff, $0718, $5252, $3dad, $2908, $42df, $25f8, $1131, $0252, $4e73, $318c, $1084
	.dw $35d0, $739c, $0abe, $091e, $031f, $021f, $75ab, $590a, $28e8, $42df, $25f8, $1131, $017b, $4e73, $318c, $1084
	.dw $35d0, $739c, $0abe, $091e, $761f, $4d59, $139f, $069b, $01b5, $42df, $25f8, $1131, $3cb6, $4e73, $318c, $1084
	.dw $35d0, $739c, $0abe, $091e, $7f98, $7acf, $10df, $0cb7, $0452, $42df, $25f8, $1131, $6645, $4e73, $318c, $1084
	.dw $35d0, $739c, $0abe, $091e, $7f3e, $7256, $7b6f, $7a8a, $59a5, $42df, $25f8, $1131, $5db1, $4e73, $318c, $1084
	.dw $35d0, $739c, $0abe, $091e, $5ff4, $3f2c, $1e1f, $011f, $00f6, $42df, $25f8, $1131, $1e65, $4e73, $318c, $1084
	.dw $35d0, $739c, $0abe, $091e, $779c, $62d6, $79f6, $7151, $590d, $42df, $25f8, $1131, $4e10, $4e73, $318c, $1084
	.dw $35d0, $739c, $0abe, $091e, $7f7f, $7e59, $2b00, $2200, $1964, $42df, $25f8, $1131, $75b5, $4e73, $318c, $1084
	.dw $35af, $091e, $3dad, $5252, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $2908, $20c6, $1084
	.dw $35d0, $091e, $590a, $75ab, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $38e8, $28a6, $1084
	.dw $35af, $091e, $06bc, $139f, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $0239, $0172, $1084
	.dw $35af, $091e, $0cb5, $10dd, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $0473, $0450, $1084
	.dw $35af, $091e, $7a8a, $7b6f, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $59a5, $4d65, $1084
	.dw $35af, $091e, $011f, $1e1f, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $00f8, $00b5, $1084
	.dw $35af, $091e, $7151, $79f6, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $590d, $50cb, $1084
	.dw $35af, $091e, $2240, $2b00, $08b6, $08af, $739c, $4e73, $2d6b, $2224, $239d, $161a, $23c8, $25c4, $1964, $1084
	.dw $0000, $7504, $10eb, $081e, $7f49, $7a43, $5942, $6405, $4000, $1800, $25f7, $1970, $4b3f, $739c, $2801, $0840
	.dw $0000, $0ac6, $10eb, $081e, $1adc, $0db6, $0111, $0de6, $0543, $00a1, $25f7, $1970, $4b3f, $739c, $04e2, $0441
	.dw $0000, $0e54, $10eb, $081e, $52d1, $31ca, $2127, $09d0, $052a, $00a5, $25f7, $1970, $4b3f, $739c, $04e7, $0042
	.dw $0000, $5d0f, $10eb, $081e, $3332, $1e69, $11a6, $44ab, $3448, $1803, $25f7, $1970, $4b3f, $739c, $2425, $0802
	.dw $0000, $185e, $10eb, $081e, $4a52, $318c, $1ce7, $1035, $002e, $0006, $25f7, $1970, $4b3f, $739c, $0009, $0043
	.dw $0000, $0d78, $10eb, $081e, $037c, $0234, $016c, $08d2, $006e, $0046, $25f7, $1970, $4b3f, $739c, $004a, $0023
	.dw $0000, $4cd4, $10eb, $081e, $4298, $2191, $0ceb, $3470, $204c, $1005, $25f7, $1970, $4b3f, $739c, $1428, $0802
	.dw $0000, $5625, $10eb, $081e, $7618, $6151, $4cac, $4162, $2ce1, $1460, $25f7, $1970, $4b3f, $739c, $20a0, $0c20
	.dw $0000, $4664, $10eb, $081e, $1a3d, $0935, $0071, $35a3, $2521, $1480, $25f7, $1970, $4b3f, $739c, $1cc0, $0860

PaletteData_c_ab40:
	.dw $35af, $739c, $239d, $091e, $7bba, $7b6a, $6283, $7f00, $7ae0, $5aa4, $42df, $2597, $1110, $7fff, $5ef7, $2660

PaletteData_c_ab60:
	.dw $35af, $739c, $239d, $091e, $7b7c, $7a97, $596f, $7eb3, $7915, $40ce, $42df, $2597, $1110, $7fff, $5ef7, $347c

PaletteData_c_ab80:
	.dw $4a0d, $73b0, $46c5, $331a, $2a57, $1952, $049e, $761e, $5348, $7f80, $7e20, $6904, $7bde, $5294, $35ad, $14a5

PaletteData_c_aba0:
	.dw $4a0d, $73b0, $46c5, $337e, $2a5a, $19b5, $059e, $76be, $5348, $7f16, $7e32, $710e, $7fff, $5ef7, $4210, $3ca5

PaletteData_c_abc0:
	.dw $4a0d, $73b0, $46c5, $739e, $5edb, $3df9, $31fe, $771e, $5348, $7f7f, $7e37, $7116, $7fff, $6739, $4631, $7a07

PaletteData_c_abe0:
	.dw $4a0d, $73b0, $46c5, $331a, $2a57, $1952, $049e, $761e, $5348, $723e, $4138, $1c33, $7bde, $5294, $35ad, $14a5

PaletteData_c_ac00:
	.dw $4a0d, $73b0, $46c5, $337e, $2a5a, $19b5, $059e, $76be, $5348, $7ade, $55b8, $3cd3, $7fff, $5ef7, $4210, $2cac

PaletteData_c_ac20:
	.dw $4a0d, $73b0, $46c5, $739e, $5edb, $3df9, $31fe, $771e, $5348, $7b7e, $6e3f, $615a, $7fff, $6739, $4631, $5cb4

PaletteData_c_ac40:
	.dw $0000, $7756, $620c, $1442, $0000, $1614, $090b, $0866, $0000, $7eff, $599c, $0c46, $0000, $371c, $0256, $010c
	.dw $0000, $0552, $008c, $0422, $0000, $373e, $01ba, $00ca, $0000, $3b1c, $0216, $1084, $0000, $0000, $0000, $0000
	.dw $0000, $30c3, $4da5, $5e47, $6ee8, $7f8a, $6f73, $1504, $21a7, $2e2a, $3a8d, $4710, $5394, $18a1, $0000, $0000

PaletteData_c_aca0:
	.dw $0000, $77bd, $7790, $30c2, $0000, $73fc, $63b1, $0d03, $0000, $67be, $36ff, $048b, $0000, $737f, $725a, $1c47
; Unused colours
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000

PaletteData_c_ad00:
	.dw $137f, $7b9a, $7f8a, $1084, $0000, $373e, $023e, $1084, $0000, $77bd, $6bb2, $1484, $0000, $4b9f, $039f, $1084
	.dw $137f, $1844, $7270, $55a9, $42a8, $38e5, $2060, $1280, $2340, $43e4, $2108, $10f6, $115b, $1a1e, $4210, $739c
	.dw $137f, $7bde, $7ef1, $7126, $7a37, $590e, $265e, $08b9, $137f, $2b85, $1e03, $5e3e, $106e, $56b5, $318c, $0000
	.dw $137f, $555f, $42a8, $7a49, $7aef, $7fb8, $4b7a, $1b5e, $0e1b, $00d9, $7f45, $6a24, $5903, $6318, $4631, $0c63
	.dw $137f, $7fff, $6ad3, $560d, $4568, $2cc6, $1844, $6a3f, $5579, $40b3, $2c0d, $53de, $1b5e, $09f5, $0424, $42a8
	.dw $137f, $5694, $59c8, $5083, $550e, $3c68, $0d35, $0471, $0a14, $1642, $1162, $3514, $0c4a, $39ce, $2529, $0000
	.dw $137f, $3cb6, $42a8, $5563, $59e7, $566e, $2e52, $0e14, $0953, $0050, $51e3, $4543, $3482, $39ce, $2529, $0c63
	.dw $137f, $5251, $520d, $4168, $30e5, $2084, $1844, $48f4, $344f, $242c, $1809, $2a74, $09f4, $094f, $0424, $42a8

PaletteData_c_ae00:
	.dw $137f, $7b9a, $7f8a, $1084, $0000, $373e, $023e, $1084, $0000, $77bd, $6bb2, $1484, $0000, $4b9f, $039f, $1084
	.dw $137f, $1844, $7270, $55a9, $4062, $38e5, $2060, $1280, $2340, $43e4, $2108, $10f6, $115b, $1a1e, $4210, $739c
	.dw $137f, $7bde, $7ef1, $7126, $7a37, $590e, $265e, $08b9, $137f, $2b85, $1e03, $5e3e, $106e, $56b5, $318c, $0000
	.dw $137f, $555f, $42a8, $7a49, $7aef, $7fb8, $4b7a, $1b5e, $0e1b, $00d9, $7f45, $6a24, $5903, $6318, $4631, $0c63
	.dw $137f, $7fff, $6ad3, $560d, $4568, $2cc6, $1844, $6a3f, $5579, $40b3, $2c0d, $53de, $1b5e, $09f5, $0424, $42a8
	.dw $137f, $5694, $59c8, $5083, $550e, $3c68, $0d35, $0471, $0a14, $1642, $1162, $3514, $0c4a, $39ce, $2529, $0000
	.dw $137f, $3cb6, $42a8, $5563, $59e7, $566e, $2e52, $0e14, $0953, $0050, $51e3, $4543, $3482, $39ce, $2529, $0c63
	.dw $137f, $5251, $520d, $4168, $30e5, $2084, $1844, $48f4, $344f, $242c, $1809, $2a74, $09f4, $094f, $0424, $42a8

PaletteData_c_af00:
	.dw $6d8a, $7fff, $7f74, $6a4d, $6318, $4e73, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $14a5

PaletteData_c_af20:
	.dw $35d0, $3c8e, $4397, $4118, $62d4, $5a90, $496a, $660c, $5906, $40c9, $72b8, $4d97, $3910, $7b9e, $4e33, $2046

PaletteData_c_af40:
	.dw $45cf, $7fff, $6e9e, $663d, $61fc, $59bb, $557a, $4d3a, $48f9, $40b8, $3c77, $3837, $555f, $6318, $4631, $0c63

PaletteData_c_af60:
	.dw $35af, $7fff, $239d, $61be, $7bd4, $7b6a, $7203, $7ee0, $7a40, $79a4, $42df, $2597, $1110, $7fff, $5ad6, $7143

PaletteData_c_af80:
	.dw $35af, $7fff, $239d, $61be, $7f9c, $7ed9, $7a33, $7eb6, $7e36, $75d1, $42df, $2597, $1110, $7fff, $5ad6, $6c12

PaletteData_c_afa0:
	.dw $001c, $739c, $539c, $339c, $139c, $0390, $030c, $0288, $0204, $0180, $0100, $620c, $0380, $6318, $4210, $1084

PaletteData_c_afc0:
	.dw $3190, $739c, $231c, $0214, $010c, $001c, $7000, $2108, $7108, $7210, $0280, $4388, $411c, $6318, $4210, $1084

PaletteData_c_afe0:
	.dw $3190, $739c, $7310, $7208, $7184, $7100, $7080, $411c, $6110, $508c, $4008, $2108, $411c, $5294, $318c, $1084

PaletteData_c_b000:
	.dw $3190, $739c, $339c, $0380, $318c, $2108, $421c, $211c, $001c, $0010, $0008, $129c, $1198, $6318, $4210, $1084

PaletteData_c_b020:
	.dw $3188, $739c, $7318, $7294, $7210, $718c, $7108, $7084, $2108, $639c, $335a, $0318, $411c, $6318, $4210, $1084

PaletteData_c_b040:
	.dw $3190, $739c, $2108, $331c, $221c, $111c, $2380, $4388, $6390, $7214, $6110, $608c, $1084, $6318, $4210, $1084

PaletteData_c_b060:
	.dw $3184, $739c, $7310, $7208, $7184, $7100, $7080, $6110, $508c, $4008, $2108, $039c, $0294, $6318, $4210, $1084

PaletteData_c_b080:
	.dw $3190, $739c, $2108, $7290, $7188, $6088, $729c, $721c, $719c, $711c, $321c, $011c, $0094, $6318, $4210, $1080
; Unused colours
	.dw $2d6c, $7fff, $7b3a, $7a74, $79d0, $794c, $78c8, $737c, $6a76, $5db3, $4cf0, $404d, $555f, $6318, $4631, $0c63
	.dw $39f1, $7bde, $7a37, $6d72, $68cb, $7ef1, $71aa, $10a6, $192f, $1519, $25de, $12fc, $555f, $6318, $4631, $10a6

PaletteData_c_b0e0:
	.dw $3df2, $7fff, $5fbf, $1f1f, $325e, $1d9f, $0cbb, $5294, $7f45, $61e5, $5903, $031f, $555f, $6318, $4631, $0c63

PaletteData_c_b100:
	.dw $4215, $7fff, $7ffe, $7ffd, $7ffc, $7ffb, $7ffa, $7ff9, $7ff8, $7ff7, $7ff6, $7ff5, $7ff4, $7ff3, $7ff2, $7ff1

PaletteData_c_b120:
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $3180, $739c, $539c, $439c, $031c, $029c, $0218, $0198, $0110, $6923, $6923, $6923, $6923, $6923, $6923, $0000
; Carries on for $60 bytes

PaletteData_c_b160:
	.dw $3180, $1015, $0c4e, $080a, $0f66, $0ee6, $0e86, $0e06, $0da6, $77bd, $7f38, $7ef4, $7e90, $65c8, $3525, $10e2
; Unused colours
	.dw $3180, $5318, $3ab5, $2ad6, $0256, $01d6, $0152, $00f0, $008c, $6923, $6923, $6923, $6923, $6923, $6923, $0000
	.dw $3180, $080d, $082a, $0407, $0aa4, $0643, $05e2, $0582, $0522, $6b18, $6a93, $6a70, $6a0c, $5144, $24c3, $0482
	.dw $24c8, $3a31, $258c, $1d28, $14e6, $0ca4, $0883, $6338, $4230, $296a, $323c, $108f, $14e8, $0885, $116e, $0d0b
	.dw $24c8, $3e12, $31af, $254c, $65f0, $5d4e, $58ac, $7f30, $6a6c, $4585, $7357, $4eeb, $3606, $2543, $3dd9, $24d3
	.dw $24c8, $031b, $0258, $01b6, $5673, $41ae, $310a, $1a36, $0d70, $0086, $7378, $66f4, $4a0e, $02b9, $0104, $40a3
	.dw $24c8, $7358, $72b6, $6211, $35cf, $254c, $1ce9, $3a6b, $29c7, $1924, $354b, $7731, $6acc, $5a46, $3a95, $29f1
	.dw $24c8, $2218, $1935, $1493, $0c6f, $7378, $5ed7, $4a11, $314b, $2d06, $2842, $3063, $2021, $3884, $4908, $40c6
	.dw $24c8, $522b, $6af1, $5e8e, $564c, $35cd, $2128, $4d66, $08cd, $048a, $3de9, $398a, $4673, $2dad, $1908, $6b7a
	.dw $24c8, $26d2, $19ee, $1948, $42da, $2e17, $1d93, $192e, $2d2c, $1cc9, $6b15, $66d4, $618c, $0958, $08d3, $6b7c
	.dw $24c8, $16be, $11f6, $5419, $3616, $2df1, $01e8, $0145, $00c2, $25b2, $194f, $110c, $0cca, $6b7a, $3a75, $258e

PaletteData_c_b2c0:
	.dw $0000, $7b9a, $7f8a, $1084, $0000, $373e, $023e, $1084, $0000, $77bd, $6bb2, $1484, $0000, $4b9f, $039f, $1084
	.dw $0000, $6f7b, $7f8a, $1084, $0000, $6f7b, $3f4f, $1084, $0000, $6f7b, $6a3d, $1084, $0000, $6f7b, $725a, $1084

PaletteData_c_b300:
	.dw $0000, $53ff, $43bf, $1f7e, $031d, $02bc, $023b, $01d9, $01b6, $0173, $012f, $00ec, $00ca, $0214, $7fff, $6fff
	.dw $0000, $7fff, $779b, $6f37, $6ad3, $626f, $5a0b, $55a7, $4d43, $4900, $2d49, $3dac, $4e0f, $5e73, $6ed6, $7f5a
	.dw $0000, $77df, $4f9f, $32d9, $2277, $11d6, $0d74, $0912, $08b1, $66f6, $5251, $3dac, $2d49, $1cc6, $01b6, $0173

PaletteData_c_b360:
	.dw $0000, $77ff, $179c, $0b39, $02f7, $0294, $6f9e, $0afb, $0277, $01f4, $0191, $4966, $4545, $4124, $3d03, $0842
	.dw $0000, $179c, $77ff, $0b39, $02f7, $0294, $0afb, $6f9e, $0277, $01f4, $0191, $3d03, $4966, $4545, $4124, $0842
	.dw $0000, $0b39, $179c, $77ff, $02f7, $0294, $0277, $0afb, $6f9e, $01f4, $0191, $4124, $3d03, $4966, $4545, $0842
	.dw $0000, $0b39, $137b, $1fde, $77ff, $77ff, $0236, $0ab9, $133d, $6f9e, $6f9e, $4d87, $4966, $4545, $51a8, $0000

PaletteData_c_b3e0:
	.dw $196e, $7fff, $7b16, $3506, $196e, $7f5f, $6e7f, $2493, $0000, $2f1f, $0577, $0049, $0000, $63b1, $0220, $10e3
	.dw $3630, $1885, $2d2a, $41cf, $1ca6, $2d2a, $41cf, $5674, $45f0, $3dae, $2d2a, $1885, $41cf, $2d2a, $1885, $1043
	.dw $0cc3, $196e, $112c, $44e5, $6318, $4631, $2d6b, $1ce8, $4776, $32b0, $19ca, $0926, $3e59, $25d3, $18ee, $0c8a
	.dw $3630, $452b, $2647, $19c6, $0d46, $3235, $25d3, $196e, $112c, $5df2, $7b9a, $6ef4, $5e6e, $4e09, $45a5, $3522
	.dw $3630, $0842, $77bd, $7212, $514c, $3086, $235c, $1278, $0594, $5a94, $3dce, $20e7, $000c, $0006, $51e9, $4584
; Carries on for $60 bytes

PaletteData_c_b480:
	.dw $3630, $50c2, $4e23, $672d, $3428, $54ec, $6a14, $779d, $3218, $131c, $0179, $212d, $5cfd, $1838, $1c6e, $0c22
; Unused colours
	.dw $3630, $0942, $2227, $3f2a, $3428, $54ec, $6a14, $779d, $4afc, $672d, $4e23, $3102, $09bb, $1838, $1c6e, $0c22
	.dw $3630, $50c2, $4a22, $672d, $342b, $54ef, $7259, $779d, $4afc, $0b1c, $25db, $1916, $5cfd, $3835, $1c6e, $0c22

PaletteData_c_b4e0:
	.dw $0000, $02da, $135c, $17df, $77ff, $77ff, $0150, $01f5, $02dc, $6f9e, $6f9e, $5104, $4ce3, $48c2, $5525, $0842

PaletteData_c_b500:
	.dw $0000, $77bd, $7790, $30c2, $0000, $73fc, $63b1, $0d03, $0000, $67be, $36ff, $048b, $0000, $737f, $725a, $1c47
	.dw $0000, $0000, $41ac, $7917, $68d3, $5890, $484c, $3809, $5eb3, $7b49, $6ea7, $6625, $59a3, $5121, $48a0, $739c
	.dw $0000, $001c, $019c, $039c, $038c, $0380, $3380, $7380, $7180, $7000, $700c, $701c, $301c, $2108, $4210, $739c

PaletteData_c_b560:
	.dw $4a0d, $42df, $2597, $1110, $7e00, $7900, $40c4, $3b5e, $19f6, $01dc, $00fa, $0016, $7bde, $56b5, $35ad, $0c63

PaletteData_c_b580:
	.dw $2188, $1284, $728c, $5100, $639c, $5294, $318c, $009c, $0094, $008c, $2194, $429c, $2388, $031c, $0194, $1084
; Carries on for $40 bytes

PaletteData_c_b5a0:
	.dw $4108, $739c, $738c, $7308, $7284, $7200, $5394, $338c, $2308, $2288, $439c, $039c, $029c, $731c, $621c, $1084
; Unused colours
	.dw $4a0d, $7fff, $7fb5, $7f4b, $7ac6, $7642, $5fd7, $4390, $2749, $2288, $4bde, $07de, $033e, $7b1f, $6a3f, $555f

PaletteData_c_b5e0:
	.dw $2daf, $14c4, $6b1a, $4a12, $2d2b, $666b, $61c8, $5525, $2a9c, $1db7, $1110, $0897, $1284, $09a2, $558f, $40ea
	.dw $2daf, $14c4, $739b, $6795, $5b91, $534c, $42e8, $737c, $629a, $61b9, $58f6, $344f, $48ab, $09a2, $59b0, $40ea

PaletteData_c_b620:
	.dw $2d6e, $5f6a, $4287, $29c5, $714c, $5a1e, $4578, $30d3, $202e, $2f3d, $1e37, $1151, $6718, $4e31, $356b, $18a7
	.dw $2d6e, $666e, $5da9, $5505, $573e, $3a5a, $2176, $625c, $0cdc, $0872, $7a74, $718e, $775c, $6297, $398e, $1487
	.dw $2d6e, $7b9c, $7b70, $6acb, $5e26, $51a2, $66be, $51fa, $3d57, $3b7e, $2a9b, $1dd9, $3fd8, $2ef1, $1e2a, $0000

PaletteData_c_b680:
	.dw $39ee, $00d6, $39da, $4ede, $175a, $388c, $494f, $6215, $66f7, $6748, $3e40, $739c, $5ef8, $3df0, $252a, $14a6
	.dw $39ee, $053a, $11fd, $1ede, $2bbf, $43be, $739c, $5ad7, $4632, $318d, $671e, $76fb, $6e39, $6997, $64f5, $14a6
	.dw $39ee, $7bdc, $67b8, $4f50, $5ae8, $3e45, $3182, $28e5, $1863, $52fc, $39da, $2951, $1ced, $1087, $7dbe, $14a6

PaletteData_c_b6e0:
	.dw $35af, $0c83, $18e6, $1d08, $2dac, $4250, $1df4, $1570, $110c, $24e9, $5630, $49ef, $7b37, $45b1, $314c, $18a6
; Unused colours
	.dw $3a09, $439e, $36dd, $2a1c, $1d5b, $10ba, $76f2, $6e2b, $1887, $73be, $673a, $5eb7, $45d1, $314c, $24c9, $1887

PaletteData_c_b720:
	.dw $6a8f, $5bdf, $4f3f, $3ebb, $2e17, $29b3, $1d4f, $18eb, $14a7, $1464, $22db, $123a, $0157, $00f6, $0072, $002f

PaletteData_c_b740:
	.dw $35af, $179e, $09da, $0090, $0018, $53f9, $3b93, $272b, $1a44, $7f02, $77bc, $5ef6, $4630, $35ac, $2528, $18a5

PaletteData_c_b760:
	.dw $3df2, $7fff, $7fb3, $7b49, $7a8d, $7a27, $7c62, $5294, $7f45, $61e5, $5903, $031f, $051a, $6318, $4631, $0c63

PaletteData_c_b780:
	.dw $2608, $7bde, $66bf, $51fe, $289d, $2896, $1872, $3391, $3b9e, $1a7d, $1cf8, $3391, $7bde, $4e75, $2d6e, $14a5

PaletteData_c_b7a0:
	.dw $19af, $739c, $7b1f, $6a7e, $59dd, $4d3c, $3c9b, $301a, $3bc3, $0e40, $035f, $01bc, $4ded, $3d8b, $2d28, $18c6

PaletteData_c_b7c0:
	.dw $2df2, $28a4, $38e5, $4148, $520c, $192f, $29d6, $3a99, $4b3c, $108c, $2114, $4198, $739c, $5294, $318c, $1084

PaletteData_c_b7e0:
	.dw $2a00, $088e, $2152, $3e17, $5afc, $098c, $1e10, $3294, $4739, $3886, $514a, $6a2e, $739c, $5294, $318c, $1084

PaletteData_c_b800:
	.dw $592f, $2108, $39ce, $5694, $735a, $110c, $2194, $3298, $539c, $108c, $2114, $4198, $6a2e, $514a, $3886, $1084

PaletteData_c_b820:
	.dw $5a48, $1124, $25c8, $3a6c, $5330, $110c, $2194, $3298, $539c, $108c, $2114, $4198, $739c, $5294, $318c, $1084

PaletteData_c_b840:
	.dw $18a5, $1063, $1cc6, $2929, $39ad, $198c, $2e10, $4294, $5718, $044b, $0892, $0cda, $739c, $5294, $318c, $1084

PaletteData_c_b860:
	.dw $0000, $03c0, $03df, $0016, $0000, $03c0, $7940, $0000, $0000, $03c0, $001e, $0000, $0000, $03c0, $7800, $0000

PaletteData_c_b880:
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $18e0, $739c, $4b3f, $2e5b, $29d7, $1550, $10eb, $081e, $7665, $65a0, $7504, $6405, $4000, $2801, $1800, $0840
	.dw $18e0, $739c, $4b3f, $29d9, $1572, $0cac, $0813, $0c1d, $7280, $3560, $163f, $0469, $56b5, $4631, $2d6b, $0c63
	.dw $18e0, $739c, $4b3f, $29d9, $1572, $0cac, $1110, $0cee, $1ce8, $39ce, $163f, $0488, $56b5, $4631, $2d6b, $0c63
	.dw $24e7, $7bde, $7bb2, $6f23, $5a40, $3d80, $20c0, $1880, $1480, $653f, $653f, $653f, $653f, $653f, $653f, $0000

PaletteData_c_b920:
	.dw $0140, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0140, $1027, $1069, $106b, $10ad, $10cf, $10f1, $1113, $004a, $08af, $1134, $1027, $1534, $083f, $083f, $6bde
	.dw $0140, $22ba, $1df7, $1935, $1493, $0c6f, $084c, $0429, $0006, $0003, $439c, $106b, $10ad, $10cf, $1113, $017a
	.dw $0140, $5f1f, $323c, $25b5, $1951, $14ed, $148a, $1447, $1043, $1be8, $1be8, $1be8, $1fe6, $1be8, $1be8, $1fe6
	.dw $0000, $0000, $63de, $439c, $2b1c, $26db, $229a, $1e38, $19d7, $1553, $14ef, $106b, $1028, $14ea, $18c8, $1ca6
	.dw $0140, $04b9, $0d1b, $159d, $1e1f, $1491, $1cd3, $1935, $1996, $1df7, $229a, $2b1c, $439c, $3a19, $469d, $63de
	.dw $0140, $10ed, $1950, $25b3, $2e16, $3a79, $46dc, $533f, $010a, $054f, $09b4, $1116, $090c, $10b1, $0000, $0000

PaletteData_c_ba00:
	.dw $722f, $3edc, $2e1a, $1d95, $1951, $14ed, $148a, $1447, $1043, $6b38, $5671, $41cd, $3149, $24e5, $1c63, $0c42

PaletteData_c_ba20:
	.dw $3190, $2084, $3108, $41ad, $5252, $62f7, $739c, $000c, $1474, $2cfc, $0c85, $254b, $3e11, $012c, $1a34, $333c

PaletteData_c_ba40:
	.dw $3190, $2086, $310a, $41ae, $5253, $62f7, $739c, $0180, $1685, $2f8a, $0c85, $212a, $39f0, $24c4, $3947, $66d2

PaletteData_c_ba60:
	.dw $0000, $6fb9, $5f95, $432e, $2ac8, $1683, $2a02, $3da1, $5141, $0921, $7779, $66f5, $5250, $39ac, $2507, $18a4

PaletteData_c_ba80:
	.dw $39c9, $18a5, $0094, $00fa, $09bc, $12de, $1244, $1b26, $3cc8, $510b, $6d50, $7a56, $314a, $4e31, $66f7, $739c

PaletteData_c_baa0:
	.dw $328c, $039c, $123e, $5390, $430c, $2284, $111c, $1098, $0014, $7f10, $620c, $58e4, $7bde, $6318, $4631, $0c63

PaletteData_c_bac0:
	.dw $2184, $18c6, $0017, $00fe, $0961, $1202, $1ec4, $2386, $0214, $035e, $40c3, $5188, $6a8e, $294a, $4210, $7bde

PaletteData_c_bae0:
	.dw $3a31, $040d, $5dd7, $44f1, $3c6d, $037c, $01f8, $010e, $0016, $2180, $02ca, $739c, $5ad6, $4210, $294a, $14a5

PaletteData_c_bb00:
	.dw $2046, $494e, $38eb, $2c89, $2046, $044e, $044a, $0447, $2046, $044c, $0449, $0447, $2046, $0447, $0426, $0425
	.dw $2046, $1d69, $1927, $14e5, $14c3, $10a3, $0c82, $5f12, $4a6f, $23de, $362f, $0048, $115f, $3be8, $2302, $1a41
	.dw $2046, $739c, $72f6, $5a30, $45ac, $2ce6, $20a4, $1863, $4a53, $31ad, $2129, $14c6, $0c84, $3528, $015f, $0916
	.dw $2046, $7fff, $4a53, $31ad, $2129, $14c6, $14c3, $10a3, $7fff, $7716, $6ad3, $5e4e, $4589, $2ce6, $7fff, $0842
	.dw $2046, $29af, $314d, $3d0b, $48ca, $3ca8, $3086, $2464, $158e, $150c, $1c23, $2cf1, $286e, $204a, $1c46, $1802
	.dw $2046, $5f0f, $4e8a, $45e8, $35a7, $2d45, $20c3, $14a1, $475c, $1e16, $00ee, $0c46, $1904, $019f, $019f, $019f
	.dw $2046, $2866, $2445, $2024, $1c03, $1802, $20c2, $1c82, $1c42, $1c62, $1c03, $3169, $2504, $3250, $29ae, $1928
	.dw $2046, $77bd, $6395, $4eef, $360b, $2986, $1904, $10c2, $4926, $3ce5, $30c4, $2483, $1862, $0882, $019f, $1156
; Unused colours
	.dw $2083, $356a, $2907, $1ca4, $1483, $1062, $2125, $18e4, $14c3, $1083, $1e3a, $20c4, $1ca4, $1883, $1462, $1041
	.dw $2083, $23de, $1e5b, $150e, $3948, $3507, $28c4, $2302, $19e1, $2d07, $24e5, $20c4, $1ca4, $1883, $1462, $1041
	.dw $2046, $2866, $2445, $2024, $1c03, $1802, $20c2, $1c82, $1c42, $1c62, $1c03, $3169, $2504, $3250, $29ae, $1928
	.dw $2046, $218a, $1d69, $1927, $14e5, $10a3, $0c82, $306a, $4088, $14c3, $2865, $3526, $2ce4, $24a3, $1231, $28c6
	.dw $2046, $218a, $1d69, $1927, $14e5, $10a3, $0c82, $3e2f, $31cc, $14c3, $15ca, $0566, $115f, $00ce, $3be8, $1a41
	.dw $2046, $2866, $2445, $2024, $1c03, $1802, $20c2, $1c82, $1c42, $1c62, $1c03, $3169, $2504, $3250, $29ae, $1928
	.dw $2046, $77bd, $6395, $4eef, $360b, $2986, $1904, $10c2, $4926, $3ce5, $30c4, $2483, $1862, $0882, $019f, $1156
	.dw $2083, $3549, $2907, $1ca4, $1483, $1062, $2ce6, $24c4, $1c83, $1862, $1e3a, $18a5, $1484, $1483, $1062, $0c42
	.dw $2083, $23de, $1e5b, $150e, $3948, $3507, $28c4, $2302, $19e1, $2908, $20c6, $18a5, $1484, $1483, $1062, $0c42
	.dw $2046, $2967, $1d04, $14e3, $14c2, $3b9e, $1238, $194f, $1c16, $1ce9, $3fe2, $575a, $4212, $35af, $294c, $1884
	.dw $2046, $0870, $044c, $0447, $2046, $044e, $044a, $0447, $2046, $044c, $0449, $0447, $2046, $0447, $0426, $0425
	.dw $0048, $115f, $3be8, $2302, $1a41, $006c, $0d1a, $2f27, $1e82, $15e1, $04b1, $08d5, $2686, $1a02, $1181, $08d5
	.dw $04b1, $1dc5, $1582, $1122, $0d1a, $006c, $1524, $1102, $0cc2, $115f, $0048, $0c83, $0c83, $0c83, $019f, $1156
	.dw $0159, $0d12, $0514, $0cef, $04ef, $0ccb, $08aa, $0ca8, $0c85, $0c85, $23de, $1e5b, $150e, $1e98, $19d5, $10cb
	.dw $19d5, $1570, $10a8, $1570, $10a8, $1086, $10a8, $1086, $1063, $1041, $1041, $1041, $2865, $24c4, $2523, $2183
	.dw $21e2, $2262, $1a25, $15e9, $0dac, $0970, $0554, $0911, $10ce, $188b, $2069, $15ca, $0566, $115f, $00ce, $0d21
	.dw $0d21, $15ea, $0566, $0d1a, $00ad, $15a2, $0d41, $1a0b, $0987, $08d6, $008c, $1e23, $1181, $1e2b, $0d88, $04b2
	.dw $006b, $26c5, $11c1, $224c, $11a9, $006e, $004a, $2f46, $1601, $266d, $15ca, $004a, $004a, $3be8, $1a41, $416e
	.dw $7bde, $6f7b, $6739, $5ef7, $56b5, $4e73, $4631, $3def, $318c, $294a, $2108, $18c6, $1084, $0842, $0000, $2046
	.dw $1d69, $1927, $14e5, $14c3, $10a3, $0c82, $5f12, $4a6f, $23de, $362f, $0048, $115f, $3be8, $2302, $1a41, $2046
	.dw $739c, $72f6, $5a30, $45ac, $2ce6, $20a4, $1863, $4a53, $31ad, $2129, $14c6, $0c84, $3528, $015f, $0916, $2046
	.dw $7fff, $4a53, $31ad, $2129, $14c6, $14c3, $10a3, $7fff, $7716, $6ad3, $5e4e, $4589, $2ce6, $7fff, $0842, $2046
	.dw $4188, $3546, $2d05, $24c4, $1c83, $475c, $1e16, $00ee, $0c46, $6670, $5a0d, $51cb, $392c, $30ea, $28c8, $2046
	.dw $2150, $190d, $14cb, $1088, $0c46, $6670, $5a0d, $51cb, $1c83, $3a36, $2dd5, $2174, $392c, $30ea, $28c8, $2046
	.dw $218a, $1d69, $1927, $14e5, $10a3, $0c82, $3e2f, $31cc, $14c3, $15ca, $0566, $115f, $00ce, $3be8, $1a41, $2046
	.dw $218a, $1d69, $1927, $14e5, $10a3, $0c82, $306a, $4088, $14c3, $2865, $3526, $2ce4, $24a3, $1231, $28c6

PaletteData_c_bf3e:
	.dw $24c8, $739c, $6b5a, $6318, $5ad6, $5294, $4a52, $4210, $39ce, $318c, $294a, $2108, $18c6, $1084, $0842, $0000
	.dw $24c8, $0462, $5eb1, $41ca, $28e4, $1c81, $7bfe, $6338, $4a72, $31ac, $18e6, $0421, $0d90, $092d, $04ca, $0088
	.dw $24c8, $5f5a, $4ab5, $3a31, $258c, $0cc6, $3651, $29cd, $1d49, $14e6, $0883, $0421, $327a, $29fa, $1933, $0c6d
	.dw $24c8, $14e8, $0ca6, $0885, $0464, $0043, $14e6, $0ca4, $0883, $0462, $0441, $0421, $092c, $04c9, $0087, $0044
	.dw $24c8, $0554, $0d2d, $0c83, $20a2, $1860, $1040, $00eb, $14e3, $10a2, $0842, $0421, $0025, $00a9, $0067, $0046
	.dw $24c8, $18d4, $2525, $1ce3, $14a2, $0c61, $41ef, $316b, $2508, $18a5, $1063, $0421, $2cc5, $2083, $1862, $1090
	.dw $24c8, $0885, $3a0c, $2988, $1904, $0080, $6f7c, $5295, $3df0, $252a, $14a6, $0842, $0d90, $092d, $04ca, $0088
	.dw $24c8, $3a31, $258c, $10e7, $0464, $10c5, $0ca4, $0883, $0862, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde, $0421
; Unused colours
	.dw $24c8, $4630, $35ac, $2949, $2107, $18c4, $4a96, $3a12, $298e, $190a, $0ca7, $0842, $4611, $358d, $292a, $1cc7
	.dw $24c8, $52b5, $3e10, $296b, $1d08, $10a5, $5f18, $2510, $1ccc, $1488, $1046, $0842, $4a2f, $3dcb, $3168, $2505
	.dw $24c8, $3655, $2df2, $258f, $1d2c, $14ea, $0ca8, $14c8, $18c7, $1cc5, $10d4, $52b5, $3e10, $296b, $1d08, $18c4
	.dw $24c8, $3a0b, $2dc9, $2988, $2547, $2106, $1ce5, $18c4, $14a3, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde, $0421
	.dw $24c8, $739c, $5ad5, $460f, $2d48, $18a2, $635a, $4ab5, $3610, $216b, $0cc6, $0842, $45d2, $354e, $24ca, $1ca8
	.dw $24c8, $77bd, $5ef7, $4631, $318c, $14a5, $4b15, $3a70, $29cb, $1926, $08c2, $0842, $3e35, $2990, $214e, $10ca
	.dw $24c8, $108c, $5ab7, $4611, $2d4b, $18a6, $2926, $671a, $1daf, $0d2b, $00a7, $0842, $2505, $1cc3, $1481, $0848
	.dw $24c8, $7758, $6b15, $5a70, $4e0d, $45cb, $3d8a, $3548, $2d06, $24c4, $1ca3, $049d, $0c72, $086b, $2b4a, $1a02
	.dw $24c8, $1082, $2952, $1cee, $0c6a, $0006, $77ff, $5b18, $4252, $298c, $10c6, $0421, $3677, $21d2, $114e, $00ca
	.dw $24c8, $6719, $4e53, $3dcf, $292a, $18a6, $6b16, $5250, $398a, $28e6, $1862, $0421, $4215, $3190, $210c, $14a8
	.dw $24c8, $18e8, $10a6, $0c85, $0864, $0443, $1ce5, $18c4, $14a3, $1082, $0c61, $0421, $092c, $04c9, $0087, $0044
	.dw $24c8, $0554, $0d2d, $0c83, $20a2, $1860, $1040, $00eb, $14e3, $10a2, $0842, $0421, $0025, $00a9, $0067, $0046
	.dw $24c8, $6719, $4e53, $3dcf, $292a, $18a6, $77ff, $5b18, $4252, $298c, $10c6, $0421, $1ce5, $18c4, $14a3, $1082
	.dw $24c8, $0c85, $3a0d, $2989, $1d26, $10c3, $739b, $56b4, $420f, $2d6a, $18c5, $0421, $5a31, $45ad, $3529, $24a5
	.dw $24c8, $3dcf, $292a, $18a6, $0864, $18c4, $14a3, $1082, $0c61, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde, $0000
	.dw $24c8, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0d90, $092d, $04ca, $0088, $092d, $04ca, $0088, $0d90, $04ca, $0088, $0d90, $092d, $0088, $0d90, $092d, $04ca
	.dw $0554, $0d2d, $0c83, $20a2, $1860, $1040, $00eb, $14e3, $10a2, $0842, $0421, $0025, $00a9, $0067, $0046, $0d2d
	.dw $00eb, $0c83, $20a2, $1860, $1040, $14e9, $14c3, $10a2, $0842, $0421, $00a9, $0067, $0046, $0025, $1909, $14e6
	.dw $0c83, $20a2, $1860, $1040, $18e4, $0cc2, $0c81, $0842, $0421, $0067, $0046, $0025, $00a9, $1909, $14e6, $0c83
	.dw $20a2, $1860, $1040, $18e4, $0cc2, $0c81, $0842, $0421, $0046, $0025, $00a9, $0067, $1909, $14e6, $0c83, $20a2
	.dw $1860, $1040, $18e4, $0cc2, $0c81, $0842, $0421, $0025, $00a9, $0067, $0046, $1909, $14e6, $0c83, $20a2, $1860
	.dw $1040, $18e4, $0cc2, $0c81, $0842, $0421, $00a9, $0067, $0046, $0025, $0d2d, $00eb, $0c83, $20a2, $1860, $1040
	.dw $14e9, $14c3, $10a2, $0842, $0421, $0067, $0046, $0025, $00a9, $0554, $0d2d, $0c83, $20a2, $1860, $1040, $00eb
	.dw $14e3, $10a2, $0842, $0421, $0046, $0025, $00a9, $0067, $0d90, $092d, $04ca, $0088, $092d, $04ca, $0088, $0d90
	.dw $04ca, $0088, $0d90, $092d, $0088, $0d90, $092d, $04ca, $108c, $5ab7, $4611, $2d4b, $18a6, $2926, $671a, $1daf
	.dw $0d2b, $00a7, $0842, $20e4, $18a2, $1060, $0848, $0848, $5ab7, $4611, $2d4b, $18a6, $2926, $671a, $0d2b, $00a7
	.dw $0842, $0842, $20e4, $18a2, $1060, $0000, $0000, $5ab7, $4611, $2d4b, $18a6, $2926, $671a, $00a7, $0842, $0842
	.dw $0842, $20e4, $18a2, $1060, $0000, $0000, $5ab7, $4611, $2d4b, $18a6, $2926, $671a, $0842, $0842, $0842, $0842
	.dw $20e4, $18a2, $1060, $108c, $3677, $21d2, $114e, $00ca, $21d2, $114e, $00ca, $3677, $114e, $00ca, $3677, $21d2
	.dw $00ca, $3677, $21d2, $114e, $24c8, $18a5, $1084, $0c63, $1904, $1cc6, $14a5, $1084, $1904, $20e7, $18c6, $14a5
	.dw $1904, $18e7, $14c6, $10a5, $24c8, $1cc6, $1084, $0c63, $1904, $1cc6, $14a5, $1084, $1904, $20e7, $18c6, $14a5
	.dw $1904, $18e7, $14c6, $10a5, $24c8, $18a5, $1084, $0c63, $1904, $20e7, $14a5, $1084, $1904, $20e7, $18c6, $14a5
	.dw $1904, $18e7, $14c6, $10a5, $24c8, $18a5, $1084, $0c63, $1904, $1cc6, $14a5, $1084, $1904, $2508, $18c6, $14a5
	.dw $1904, $18e7, $14c6, $10a5, $5a31, $45ad, $3529, $24a5, $45ad, $3529, $24a5, $5a31, $3529, $24a5, $5a31, $45ad
	.dw $24a5, $5a31, $45ad, $3529

PaletteData_c_c4a6:
	.dw $614d, $39ce, $318c, $294a, $0000, $72ec, $5585, $7358, $4210, $6318, $7fff, $0000, $4108, $7318, $7f9c, $0000
	.dw $614d, $4ef8, $4274, $45ef, $3dab, $7f17, $72b1, $69ef, $614d, $58ac, $4333, $42af, $422c, $45a9, $72b1, $7fbc
	.dw $614d, $7716, $6ad3, $0000, $4e97, $7f34, $5e4e, $4589, $2ce6, $1ca3, $7fbc, $4233, $35d0, $296d, $1d0a, $10a7
	.dw $614d, $2cc1, $5ad0, $39e7, $2103, $7b33, $6a6a, $55c6, $4123, $34c3, $7fba, $5d6f, $512a, $40c8, $3085, $1c64
	.dw $614d, $7f55, $6628, $5585, $4ebd, $7f34, $6a8b, $55e7, $4164, $2ce4, $7bde, $3dd7, $3953, $350f, $24cb, $24c4
	.dw $614d, $7270, $2481, $1c40, $3a0f, $7f13, $6e4b, $55c7, $4144, $1440, $7759, $2dac, $254a, $1d29, $14e6, $0c84
	.dw $614d, $7b54, $6a6a, $55c6, $2b03, $2d05, $24c4, $1883, $1062, $1042, $4566, $3904, $2cc1, $2061, $1c40, $1840
	.dw $614d, $7734, $6aaf, $5a2e, $49cb, $7b78, $7f34, $76d0, $726a, $6207, $6313, $5ad0, $4e6d, $420a, $3187, $2524
; Unused colours
	.dw $7270, $24c5, $20a4, $1c83, $1862, $1041, $0c21, $0820, $520d, $45aa, $3527, $3104, $1ca3, $22d8, $11d7, $04ce
	.dw $0000, $20c7, $1ca6, $1485, $0c65, $0444, $0023, $0022, $3968, $3548, $2906, $28c2, $1461, $2518, $0010, $0009
	.dw $2b03, $7734, $6aaf, $5a2e, $49cb, $7b78, $7f34, $76d0, $726a, $6207, $6313, $5ad0, $4e6d, $420a, $3187, $2524
	.dw $6628, $5585, $5a4c, $45ca, $4e91, $3a2f, $46d5, $2e94, $3b1a, $2299, $335f, $16df, $22d8, $11d7, $04ce, $04ce
	.dw $22d8, $11d7, $11d7, $04ce, $22d8, $2b03, $1e42, $15a2, $0d02, $2518, $0010, $0009, $0009, $2518, $0010, $0010
	.dw $0009, $2518, $22d8, $11d7, $04ce, $1633, $0d72, $048b, $0d8e, $090d, $0469, $04ea, $04a9, $0447, $2518, $0010
	.dw $0009, $18b4, $000d, $0007, $0c50, $000a, $0005, $000d, $0008, $0004, $72b1, $7f38, $7fbc

PaletteData_c_c680:
	.dw $1c82, $6b37, $62f5, $5a92, $1c82, $7337, $6ef4, $6ab1, $1c82, $02b9, $0258, $0217, $18c6, $1084, $0842, $0000
	.dw $1c82, $63de, $439c, $2b1c, $26db, $229a, $1df7, $1996, $1935, $1cd3, $1491, $1e14, $21d2, $258f, $294c, $312a
	.dw $1c82, $739c, $6b37, $62d4, $460f, $398c, $24e8, $1c85, $00cc, $008a, $0048, $22dc, $1a36, $0d70, $04ea, $0086
	.dw $1c82, $7758, $6b15, $5a70, $4e0d, $45cb, $3d8a, $3548, $2d06, $24c4, $1ca3, $475c, $03ff, $02ff, $19d6, $3800
	.dw $1c82, $739c, $7736, $66d2, $520c, $3947, $2d06, $20a3, $0926, $0086, $0844, $0040, $03ff, $02ff, $19d6, $0cce
	.dw $1c82, $675a, $5ad7, $4e74, $41f1, $39af, $314d, $290b, $03ff, $02ff, $01b6, $1950, $1928, $0146, $0125, $0104
	.dw $1c82, $0d27, $08e5, $04c4, $04a3, $0082, $0061, $0040, $6f9f, $529f, $253f, $0010, $0108, $00c5, $00a2, $0080
	.dw $1c82, $1a57, $1e14, $21d2, $258f, $294c, $312a, $2b1c, $025a, $2532, $26db, $229a, $1df7, $1996, $1935, $1cd3
; Unused colours
	.dw $1c82, $529c, $319b, $1090, $1040, $1040, $08ac, $0468, $0445, $30e4, $28c3, $24a2, $1c82, $1861, $1040, $0c20
	.dw $1c82, $7716, $6ad3, $5e4e, $4589, $2ce6, $7fff, $0000, $352b, $02ff, $19d6, $4168, $3526, $2ce4, $24a3, $1c65
	.dw $1c82, $018f, $014d, $012b, $0109, $00e7, $00c5, $0083, $0062, $0061, $0040, $0345, $01e3, $0101, $0141, $0126
	.dw $1c82, $010a, $00e8, $00c6, $00a5, $0083, $0061, $0040, $6f9f, $529f, $253f, $0010, $0108, $00c5, $00a2, $0080
	.dw $1c82, $63de, $439c, $2b1c, $26db, $229a, $1df7, $1996, $1935, $1cd3, $1491, $148e, $148c, $03e5, $0304, $0223
	.dw $1c82, $03ff, $031b, $02b9, $0258, $0217, $01b6, $0175, $0131, $04ed, $04a9, $0865, $0844, $03e5, $0304, $0223
	.dw $1c82, $529c, $319b, $1090, $0444, $0444, $2466, $1864, $1444, $10a5, $0c85, $0865, $0444, $0443, $0422, $0002
	.dw $03ff, $02ff, $19d6, $031a, $0259, $1172, $0255, $01b4, $0d0f, $0190, $010f, $04ab, $00cc, $008a, $0048, $6f9f
	.dw $529f, $253f, $0010, $52bb, $3dfa, $18f9, $000d, $35d7, $2956, $10b3, $002a, $18f3, $14b1, $086d, $0027, $0010
	.dw $000d, $0027, $0044, $529c, $319b, $1090, $1040, $1040, $39d8, $2536, $0c6c, $00c2, $1040, $2534, $18d1, $0c48
	.dw $0166, $00c2, $1090, $0c6c, $0c24, $020a, $0124, $0c20, $0c20, $0c20, $02cf, $0187, $03ff, $02ff, $19d6, $0cce
	.dw $071a, $0659, $1972, $10ab, $0a55, $09d4, $192e, $14a9, $0d70, $0d2e, $18ca, $1887, $10ab, $14a9, $1887, $1c85
	.dw $2083, $2083, $2083, $2083, $0345, $01e3, $0101, $0101, $0345, $01e3, $01e3, $0101, $0345, $03e5, $0304, $0223
	.dw $0304, $0223, $0142, $0223, $0142, $148a, $0142, $148a, $148a, $148a, $148a, $148a, $529c, $319b, $1090, $0444
	.dw $0444, $39d8, $2536, $0c6c, $00c2, $0444, $2534, $18d1, $0c48, $0166, $00c2, $1090, $0c6c, $0423, $020a, $0124
	.dw $0423, $0423, $0423, $02cf, $0187

PaletteData_c_c96a:
	.dw $1840, $28c2, $1840, $1840, $0000, $28c2, $1840, $1840, $0000, $28c2, $1840, $1840, $0000, $28c2, $1840, $1840
	.dw $4904, $001e, $001e, $7fd8, $7f95, $7f52, $7f0f, $2287, $1a05, $15c4, $0d83, $0942, $31e6, $566a, $6a8b, $7ecd
	.dw $4904, $6f7b, $3ad7, $2e33, $25af, $192b, $10a7, $7716, $6ad3, $5e4e, $4589, $2ce6, $5e32, $49ae, $24c7, $0c43
	.dw $4904, $737a, $6eb6, $5e32, $49ae, $2d09, $1485, $298c, $254a, $1d08, $10c6, $0c84, $0863, $0442, $0b9f, $0e1c
	.dw $5104, $2d26, $24e4, $1ca3, $1883, $1462, $1042, $35cb, $3169, $1e76, $19f0, $154a, $08e6, $04a4, $0483, $0462
	.dw $4904, $2dcd, $31cf, $214b, $14e8, $0ca6, $0863, $256b, $1d08, $10c6, $2dae, $214b, $14e8, $0ca6, $0b9f, $0e1c
	.dw $4904, $14e8, $0ca6, $0885, $0863, $0442, $4a91, $3e2e, $35ec, $2d8a, $2527, $18c5, $1083, $0841, $001e, $001e
	.dw $4904, $04e4, $0905, $1126, $1947, $1d69, $1d8b, $1dac, $19ce, $11ac, $04a2, $04c3, $04e4, $0505, $0526, $0947
; Unused colours
	.dw $4904, $4274, $39f0, $2d8d, $294b, $2509, $20e7, $1ca5, $1fc4, $12e5, $5f5a, $2def, $10e9, $466d, $41ea, $3126
	.dw $4904, $6b76, $52cf, $466d, $41ea, $3988, $3126, $24c4, $5f5a, $42b4, $2def, $1d4c, $10e9, $3d6d, $08c3, $08c3
	.dw $4904, $14e8, $0ca6, $0885, $0863, $0442, $6d72, $60ef, $50eb, $40e7, $30e3, $20e0, $1cc0, $1fc4, $12e5, $1205
	.dw $4904, $4252, $35ce, $2d8c, $254b, $2109, $18c8, $14a7, $1085, $7ecd, $0922, $08c3, $49e7, $49e8, $4e0a, $522c
	.dw $4904, $6f7b, $3ad7, $2e33, $25af, $192b, $10a7, $66d1, $6af4, $6f17, $5646, $5a69, $5e8c, $62af, $66d1, $1085
	.dw $4904, $6f7b, $3ad7, $2e33, $25af, $192b, $10a7, $7716, $6ad3, $5e4e, $4589, $2ce6, $5e32, $49ae, $24c7, $0c43
	.dw $4904, $35cf, $39cd, $2949, $2107, $14a4, $0c63, $2d8d, $212a, $14c7, $39cd, $2d6a, $2107, $14a4, $0b9f, $0e1c
	.dw $4904, $1ce6, $14a4, $1083, $0c63, $0842, $4a91, $3e2e, $35ec, $2d8a, $2527, $18c5, $1083, $0841, $001e, $001e
	.dw $4904, $5624, $5646, $5a69, $5e8c, $62af, $66d1, $6af4, $6f17, $735a, $5646, $5a69, $5e8c, $62af, $5646, $6f17
	.dw $5104, $2d26, $24e4, $1ca3, $1883, $1462, $1042, $35cb, $3169, $1e76, $19f0, $154a, $08e6, $04a4, $0483, $0462
	.dw $4904, $737a, $6eb6, $5e32, $49ae, $2d09, $1485, $35cf, $2d8d, $212a, $14c7, $0c85, $0c63, $0842, $0b9f, $0e1c
	.dw $4904, $1ce6, $14a4, $1083, $0c63, $0842, $6d72, $60ef, $50eb, $40e7, $30e3, $20e0, $1cc0, $1fc4, $12e5, $1205
	.dw $2dae, $214b, $14e8, $0ca6, $0b9f, $0e1c, $256c, $1d2a, $10c7, $0885, $0adb, $09b7, $214b, $1909, $10c7, $0884
	.dw $0a37, $0952, $1909, $14e8, $0ca6, $0863, $0993, $08ed, $14e8, $14e8, $0ca6, $0863, $08ef, $08a9, $1e76, $19f0
	.dw $154a, $08e6, $04a4, $0483, $0462, $19d1, $156c, $1108, $04a4, $0483, $0462, $08e6, $154c, $1509, $10c6, $0483
	.dw $0462, $08e6, $04a4, $10c7, $10a5, $1084, $0462, $08e6, $04a4, $0483, $1042, $1042, $1042, $08e6, $04a4, $0483
	.dw $0462, $10c7, $10a5, $1084, $04a4, $0483, $0462, $08e6, $154c, $1509, $10c6, $0483, $0462, $08e6, $04a4, $19d1
	.dw $156c, $1108, $0462, $08e6, $04a4, $0483, $0000, $04e4, $0905, $1126, $1947, $1d69, $1d8b, $1dac, $19ce, $11ac
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $11ac, $04e4, $0905, $1126, $1947, $1d69, $1d8b, $1dac, $19ce
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $19ce, $11ac, $04e4, $0905, $1126, $1947, $1d69, $1d8b, $1dac
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $1dac, $19ce, $11ac, $04e4, $0905, $1126, $1947, $1d69, $1d8b
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $1d8b, $1dac, $19ce, $11ac, $04e4, $0905, $1126, $1947, $1d69
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $1d69, $1d8b, $1dac, $19ce, $11ac, $04e4, $0905, $1126, $1947
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $1947, $1d69, $1d8b, $1dac, $19ce, $11ac, $04e4, $0905, $1126
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $1126, $1947, $1d69, $1d8b, $1dac, $19ce, $11ac, $04e4, $0905
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $0000, $0905, $1126, $1947, $1d69, $1d8b, $1dac, $19ce, $11ac, $04e4
	.dw $04a2, $04c3, $04e4, $0505, $0526, $0947, $1fc4, $12e5, $1205, $1f03, $1663, $15a3, $1e42, $19e2, $1962, $1d81
	.dw $1d61, $1d21, $20e0, $20e0, $20e0, $08c3, $08c3, $0d83, $0943, $1243, $0dc4, $1703, $0e44, $1fc4, $12e5, $49e7
	.dw $49e8, $4e0a, $522c, $522c, $49e7, $49e8, $4e0a, $4e0a, $522c, $49e7, $49e8, $49e8, $4e0a, $522c, $49e7, $0000
	.dw $5624, $5646, $5a69, $5e8c, $62af, $66d1, $6af4, $6f17, $735a, $5646, $5a69, $5e8c, $62af, $5646, $6f17, $0000
	.dw $735a, $5624, $5646, $5a69, $5e8c, $62af, $66d1, $6af4, $6f17, $5646, $5a69, $5e8c, $62af, $6f17, $5646, $0000
	.dw $6f17, $735a, $5624, $5646, $5a69, $5e8c, $62af, $66d1, $6af4, $5646, $5a69, $5e8c, $62af, $5646, $6f17, $0000
	.dw $6af4, $6f17, $735a, $5624, $5646, $5a69, $5e8c, $62af, $66d1, $5646, $5a69, $5e8c, $62af, $6f17, $5646, $0000
	.dw $66d1, $6af4, $6f17, $735a, $5624, $5646, $5a69, $5e8c, $62af, $5646, $5a69, $5e8c, $62af, $5646, $6f17, $0000
	.dw $62af, $66d1, $6af4, $6f17, $735a, $5624, $5646, $5a69, $5e8c, $5646, $5a69, $5e8c, $62af, $6f17, $5646, $0000
	.dw $5e8c, $62af, $66d1, $6af4, $6f17, $735a, $5624, $5646, $5a69, $5646, $5a69, $5e8c, $62af, $5646, $6f17, $0000
	.dw $5a69, $5e8c, $62af, $66d1, $6af4, $6f17, $735a, $5624, $5646, $5646, $5a69, $5e8c, $62af, $6f17, $5646, $0000
	.dw $5646, $5a69, $5e8c, $62af, $66d1, $6af4, $6f17, $735a, $5646, $5646, $5a69, $5e8c, $62af, $6f17, $5646, $28c2
	.dw $1840, $1840, $3482, $1840, $2882, $1840, $1840, $28c2, $2882, $1840, $3482, $39cd, $2d6a, $2107, $14a4, $0b9f
	.dw $0e1c, $318b, $2949, $1ce6, $1083, $0adb, $09b7, $2949, $2528, $18c5, $1083, $0a37, $0952, $2107, $2107, $14a4
	.dw $0c63, $0993, $08ed, $1ce6, $1ce6, $14a4, $0c63, $08ef, $08a9

PaletteData_c_cf7c:
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0881, $252a, $1ce8, $18a6, $1464, $1043, $10cc, $0c88, $0446, $0024, $110a, $10c8, $1086, $1464, $0800, $1003
	.dw $0881, $673a, $5295, $41cf, $354a, $28e5, $2082, $72b2, $55ab, $3d06, $3083, $2000, $0174, $00d1, $000b, $0044
	.dw $0881, $4f7e, $3e9b, $31f6, $3170, $210d, $1cca, $1888, $1446, $1024, $6f3a, $41cf, $2cc6, $1c64, $029c, $0016
	.dw $0881, $7bde, $5656, $45f2, $358e, $252b, $14c7, $0884, $7716, $6ad3, $5e4e, $4589, $2ce6, $017a, $0016, $0000
	.dw $0881, $22ba, $1df7, $1935, $1493, $0c6f, $084c, $0429, $0006, $0003, $777c, $5e54, $416e, $2888, $02fe, $017a
	.dw $0000, $110a, $10c8, $1086, $1464, $1043, $0c22, $0ca5, $0883, $0862, $0441, $0440, $10c9, $0866, $0444, $0c02
	.dw $0440, $1504, $10c3, $0ca2, $0881, $0460, $0040, $0020, $0848, $1cec, $0020, $0020, $000b, $6ed3, $6691, $5a4c
; Unused colours
	.dw $0000, $44c9, $3ca9, $3088, $2867, $2047, $1827, $0c26, $0404, $41e5, $0c26, $0c26, $0c26, $14a7, $0c65, $0844
	.dw $0426, $7b99, $7b57, $7b34, $7b12, $7af0, $7ace, $76ad, $768c, $766c, $6ab3, $6270, $5a2e, $4e8f, $422b, $39e9
	.dw $0440, $1504, $10c3, $0ca2, $0881, $0460, $0040, $0020, $0848, $1cec, $0196, $00d4, $000b, $6ed3, $6691, $5a4c
	.dw $0000, $0174, $00d1, $000b, $000b, $0174, $00d1, $00d1, $000b, $0000, $02fe, $017a, $0259, $0116, $01d4, $00d2
	.dw $014f, $008e, $00ca, $004a, $0046, $0440, $1504, $10c3, $0ca2, $0881, $0460, $0040, $0020, $0848, $1cec, $0020
	.dw $0020, $000b, $6ed3, $6691, $5a4c, $0440, $1d46, $1504, $0cc2, $0881, $0460, $0040, $0020, $084a, $1cee, $0020
	.dw $00d4, $0020, $6ed3, $6691, $5a4c, $0440, $2588, $1925, $10c3, $0881, $0460, $0040, $0020, $084c, $1cf2, $027a
	.dw $0020, $0000, $6ed3, $6691, $5a4c, $0440, $1504, $10c3, $0ca2, $0881, $0460, $0040, $0020, $0848, $1cec, $0020
	.dw $0020, $0020, $6ed3, $6691, $5a4c, $0000, $3024, $2804, $1c03, $1402, $0c02, $0402, $0001, $0001, $0001, $0001
	.dw $0001, $0001, $0844, $0002, $0001, $0000, $3445, $2c25, $2004, $1803, $1003, $0803, $0002, $0001, $41e5, $0002
	.dw $0002, $0002, $0c65, $0423, $0002, $0000, $3c87, $3467, $2846, $2025, $1805, $1005, $0404, $0002, $0404, $3184
	.dw $0404, $0404, $1086, $0844, $0423, $0000, $44c9, $3ca9, $3088, $2867, $2047, $1847, $0c26, $0404, $0c26, $0c26
	.dw $2144, $0c26, $14a7, $0c65, $0844, $0000, $4d0b, $44eb, $38ca, $30a9, $2889, $2069, $1468, $0c26, $1468, $1468
	.dw $1468, $1104, $1ce9, $14a7, $1086

PaletteData_c_d226:
	.dw $0000, $7bde, $739c, $6f5a, $6b18, $66d6, $6274, $5a32, $55f0, $51ae, $496c, $450a, $40c8, $3886, $3444, $3002
	.dw $0000, $6b5a, $6b16, $6ed2, $6e8e, $724a, $7606, $79e3, $7dc0, $5ca0, $7182, $6d20, $2950, $210e, $18cc, $14aa
	.dw $0000, $51ea, $4166, $30e2, $2480, $77fd, $6358, $4eb3, $3a0e, $2569, $14c4, $0862, $6731, $528c, $35a6, $20c0
	.dw $0000, $08cd, $048a, $0047, $1f4d, $77fd, $52f7, $3a31, $29ad, $1908, $0ca5, $0862, $5f37, $4a92, $31cc, $1906
	.dw $0000, $2d2b, $24e9, $1ca7, $1886, $1044, $7dc0, $2d47, $2505, $1cc3, $1481, $0862, $21ce, $196b, $1108, $08a5
	.dw $0000, $4e00, $4560, $3d00, $38c0, $30a0, $7dc0, $4d6b, $4128, $3526, $6d20, $5880, $3e2e, $31e9, $29a2, $2942
	.dw $0000, $1db0, $1d8e, $154c, $0d0a, $6d20, $7dc0, $5880, $3e0f, $31cc, $298a, $2148, $2950, $210e, $18cc, $14aa
	.dw $0000, $41cd, $3d8b, $3548, $4560, $3920, $38c0, $6d20, $7dc0, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde, $0842
; Unused colours
	.dw $0000, $4200, $0210, $0862, $462f, $5292, $3ded, $318a, $2948, $2106, $18c4, $1082, $28a5, $1c63, $1442, $1021
	.dw $0000, $51ea, $4166, $30e2, $2480, $77fd, $6358, $4eb3, $3a0e, $2569, $14c4, $0862, $6731, $528c, $35a6, $20c0
	.dw $0000, $06c9, $0108, $0000, $14c5, $18e6, $10a4, $0c83, $0862, $0441, $0020, $0020, $1863, $1021, $0800, $0000
	.dw $0000, $0210, $0108, $0821, $0084, $5292, $3ded, $318a, $2948, $2106, $18c4, $1082, $35ad, $2529, $18c6, $1063
	.dw $0000, $3d8d, $28e8, $1c85, $0c42, $5f17, $4e93, $3e0f, $2d8b, $1d07, $0c83, $0821, $1db2, $090d, $0088, $0044
	.dw $0000, $7bde, $6f7c, $673b, $5efa, $0cee, $006a, $1484, $1063, $0c42, $0821, $0000, $08a7, $0465, $0444, $0423
	.dw $0000, $14b1, $0445, $0420, $5efa, $3509, $2cc7, $24a5, $1c83, $1462, $1041, $0c20, $3dad, $314a, $24e7, $1884
	.dw $0000, $0155, $1063, $0820, $6b5a, $5eb4, $4e30, $41cd, $356a, $2907, $1ca4, $1041, $5ad6, $4631, $318c, $2108
	.dw $0000, $094d, $1063, $0820, $2d28, $20c5, $1ca4, $1883, $1462, $1041, $0c20, $0820, $2929, $1cc6, $1484, $0c42
	.dw $0000, $7bde, $1883, $1483, $1062, $356a, $2907, $1ca4, $0c41, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde, $0842
	.dw $0000, $1c80, $0800, $0800, $0800, $0800, $0d22, $0481, $0460, $1fdf, $2e6c, $2e00, $2140, $18a0, $0c40, $0800
	.dw $1f4d, $128a, $09c6, $0103, $4e00, $4560, $3d00, $5a60, $4560, $3d00, $4e00, $4980, $3d00, $5640, $4560, $3d00
	.dw $1080, $0210, $2100, $018c, $3180, $0108, $4200, $0084, $0108, $00c6, $0084, $0042, $1db2, $090d, $0088, $0044
	.dw $0044, $1db2, $090d, $0088, $0088, $0044, $1db2, $090d, $090d, $0088, $0044, $1db2, $0cee, $046a, $1484, $1063
	.dw $0c42, $0821, $0421, $08a7, $0465, $0444, $0423, $048b, $0447, $1484, $1063, $0c42, $0821, $0421, $0465, $0444
	.dw $0423, $0422, $0449, $0445, $1484, $1063, $0c42, $0821, $0421, $0444, $0423, $0422, $0421, $0446, $0423, $1484
	.dw $1063, $0c42, $0821, $0421, $0423, $0422, $0421, $0421, $094d, $00ea, $0087, $0024, $0155, $00d1, $004d, $0009
	.dw $0800, $0800, $0800, $1c80, $0800, $0800, $1c80, $0800, $0800, $1c80, $0800, $0800, $1c80, $0800, $0800, $0800

PaletteData_c_d566:
	.dw $722f, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $722f, $3edc, $2e1a, $1d95, $1951, $14ed, $148a, $1447, $1043, $6b38, $5671, $41cd, $3149, $24e5, $1c63, $0c42
	.dw $722f, $5f9e, $531b, $4299, $35d6, $1930, $0caa, $7716, $6ad3, $7bde, $5e4e, $4589, $2ce6, $2066, $33bd, $0c25
	.dw $722f, $575e, $4b1c, $3eba, $3257, $2e15, $25d3, $21b0, $1d8f, $7fbd, $777a, $7357, $6f16, $7a71, $620e, $49ab
	.dw $722f, $3ab7, $2612, $1daf, $154c, $110a, $0cc8, $0010, $637f, $46fa, $3233, $198f, $112d, $095c, $0958, $08d3
	.dw $722f, $14c9, $0ca7, $0886, $0465, $0444, $0023, $28e5, $2483, $1842, $1041, $1d0b, $1043, $018b, $0128, $04c5
	.dw $722f, $20ec, $1ca9, $1887, $1465, $1043, $0c42, $7c1f, $7c1f, $7c1f, $7c1f, $2927, $20e5, $1ca4, $1463, $1042
	.dw $722f, $192c, $1ca9, $1887, $1465, $1043, $0c42, $1294, $0210, $018d, $010a, $0487, $0250, $018b, $0128, $04c5
; Unused colours
	.dw $0000, $3647, $29c5, $2163, $1902, $14c1, $1481, $1461, $3e48, $18e7, $10c7, $0ca7, $0c85, $0c64, $0c43, $0c22
	.dw $722f, $2543, $1901, $14c1, $14e1, $14c1, $1481, $1461, $1481, $18e7, $10c7, $0ca7, $0c85, $0c64, $0c43, $0c22
	.dw $722f, $575e, $4b1c, $3eba, $3257, $2e15, $25d3, $21b0, $1d8f, $7fbd, $777a, $7357, $6f16, $7a71, $620e, $49ab
	.dw $424d, $153d, $2095, $0f0f, $375f, $225a, $1595, $0cee, $76cc, $55e7, $3522, $7f7b, $66b4, $4dee, $3528, $14a5
	.dw $722f, $3ab7, $2612, $1daf, $154c, $110a, $0cc8, $0010, $637f, $46fa, $3233, $198f, $112d, $095c, $0958, $08d3
	.dw $722f, $196a, $1528, $10e6, $0ca4, $0c82, $0c60, $3d28, $30c5, $2483, $1841, $160e, $1043, $3113, $18ae, $004a
	.dw $0000, $192c, $1ca9, $1887, $1465, $1043, $0c42, $1294, $0210, $018d, $010a, $0487, $0250, $018b, $0128, $04c5
	.dw $0000, $1d0c, $1ca9, $1887, $1465, $1043, $0c42, $1294, $0210, $018d, $010a, $0487, $2655, $0d6d, $050a, $00a7
	.dw $0000, $20ed, $1ca9, $1887, $1465, $1043, $0c42, $1294, $0210, $018d, $010a, $0487, $31f6, $2170, $10ec, $0068
	.dw $0000, $20ee, $1ca9, $1887, $1465, $1043, $0c42, $1294, $0210, $018d, $010a, $0487, $4197, $2912, $14ad, $0049
	.dw $0000, $20ef, $1caa, $1887, $1465, $1043, $0c42, $1294, $0210, $018d, $010a, $0487, $4d78, $3113, $18ae, $004a
	.dw $14e1, $14c1, $1481, $14c1, $1481, $14e1, $1481, $14e1, $14c1

PaletteData_c_d7d8:
	.dw $1468, $7bde, $739c, $6f7a, $6758, $6336, $5b15, $56f3, $52d1, $4aaf, $468d, $3e6c, $3a4a, $3228, $2e06, $29e5
	.dw $1468, $77de, $56fa, $4655, $35b0, $1d0b, $0ca7, $2df0, $1d6c, $1109, $3a13, $18c4, $14a3, $0864, $0fce, $06c5
	.dw $1468, $1bdd, $0fb5, $068c, $01e7, $0124, $08c2, $36dd, $3254, $2df0, $1d6c, $1109, $04a6, $5bdf, $0464, $18c4
	.dw $1468, $22db, $1626, $11a5, $1144, $0d03, $08c2, $2dd4, $2191, $194e, $150a, $0ce8, $08a6, $3d74, $30f0, $248c
	.dw $1468, $2a32, $216d, $1d0b, $1083, $14c8, $0c86, $35ea, $2548, $2106, $18c4, $14a3, $0864, $2a58, $1572, $08ad
	.dw $1468, $125a, $11f6, $0d91, $094d, $052b, $0109, $00e8, $00e6, $16be, $29fd, $6a4d, $504c, $1a7e, $223e, $2a1e
	.dw $1468, $7bde, $7716, $6ad3, $5e4e, $4589, $2ce6, $0000, $4165, $6649, $325e, $35bb, $31bb, $2ddc, $29fd, $2a1e
	.dw $1468, $4fff, $5b76, $4ad2, $3e2f, $31ac, $1928, $0000, $1c83, $0081, $3e35, $256f, $14ea, $0ca7, $6e7e, $45bc
; Unused colours
	.dw $1468, $150f, $10ed, $0ccc, $0cca, $08c9, $04c8, $00c7, $00c6, $1531, $14ee, $6a4d, $504c, $1530, $152f, $150e
	.dw $1468, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $116f, $112d, $110c, $0cea, $08c8, $08a6, $08a6, $08a6, $08a6
	.dw $1468, $7bde, $7716, $6ad3, $5e4e, $4589, $2ce6, $0000, $4165, $6649, $152f, $18cd, $31bb, $18ed, $14ee, $150e
	.dw $0fce, $06c5, $0f2c, $0645, $0e8b, $05e5, $0de9, $0966, $0d48, $0906, $0ca7, $0ca7, $2a58, $1572, $08ad, $08ad
	.dw $2a58, $1572, $1572, $08ad, $2a58, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $116f, $112d, $110c, $0cea
	.dw $08c8, $08a6, $08a6, $08a6, $08a6, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $116f, $112d, $110c, $0cea
	.dw $08c8, $08a6, $08e8, $08c8, $08c8, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $116f, $112d, $110c, $0cea
	.dw $08c8, $08a6, $092b, $090a, $08ea, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $1170, $112d, $110c, $0cea
	.dw $08c8, $08a6, $096e, $094d, $090c, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $1590, $114e, $110c, $0cea
	.dw $08c8, $08a6, $09b1, $096f, $094e, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $1591, $114e, $110c, $0cea
	.dw $08c8, $08a6, $09f4, $09b2, $0970, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $1591, $114e, $110c, $0cea
	.dw $08c8, $08a6, $0a37, $09f4, $0992, $16be, $114b, $0d0a, $0ce9, $08c8, $08a7, $0885, $19b2, $156f, $110c, $0cea
	.dw $08c8, $08a6, $0a9a, $0e37, $09d4, $76de, $561d, $6e9d, $4ddb, $665c, $4599, $621b, $3d78, $0000, $0000, $0000
	.dw $0000, $0000, $0000, $0000, $0000

PaletteData_c_da82:
	.dw $3d10, $77bb, $7acc, $18a5, $3d10, $77bb, $7acc, $18a5, $3d10, $77bb, $7acc, $18a5, $3d10, $77bb, $7acc, $18a5
	.dw $0000, $56f8, $3e53, $31cf, $254b, $1ce8, $18a5, $1042, $1f1c, $1258, $0994, $00d0, $6f79, $4e71, $358b, $1cc5
	.dw $0000, $631a, $4a54, $39d0, $316d, $290a, $24e9, $1042, $1a96, $1042, $1042, $20c7, $290a, $20a5, $1c83, $1862
	.dw $0000, $331c, $2255, $1daf, $192c, $14c8, $1485, $1042, $14ac, $1862, $6f79, $5ab4, $4a30, $39ac, $2507, $1483
	.dw $0000, $6f79, $35af, $210a, $18c8, $1086, $0844, $0c41, $4e71, $358b, $1cc5, $20a5, $290a, $2522, $18a2, $1461
	.dw $0000, $20c9, $18a7, $1486, $1064, $0843, $0421, $0000, $3086, $2464, $1843, $1022, $292c, $00d0, $008b, $0066
	.dw $0000, $0c85, $0864, $0443, $0442, $0021, $0020, $0000, $4def, $20c6, $1ca5, $1884, $1463, $1042, $0c21, $0800
	.dw $0000, $0912, $006b, $18c7, $1484, $1062, $0c41, $0821, $0400, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde, $1042
; Unused colours
	.dw $1a55, $1042, $1042, $1042, $11b1, $1042, $1042, $1042, $04eb, $1042, $1042, $1042, $0000, $7bde, $737b, $6f39
	.dw $66f7, $62b5, $5a73, $5631, $4def, $498c, $414a, $3d08, $34c6, $3084, $2842, $2400

PaletteData_c_dbba:
	.dw $0000, $1ce2, $2da7, $426c, $0000, $1ce2, $2da7, $426c, $0000, $1ce2, $2da7, $426c, $0000, $1ce2, $2da7, $426c
	.dw $0000, $5752, $426c, $2da7, $1ce2, $51ef, $418c, $3129, $20a5, $14e9, $1dd2, $2efd, $779c, $4a74, $2daf, $0c84
	.dw $0000, $579c, $3ef9, $2a56, $15b3, $112d, $10a7, $1042, $6f5a, $5ab5, $41ef, $2929, $0536, $0470, $02ad, $0565
	.dw $0000, $7b59, $6694, $51ef, $418c, $3129, $24c6, $1042, $6f5a, $5ab5, $41ef, $2929, $02ad, $2085, $1864, $5558
	.dw $0000, $639e, $56d8, $4e33, $458e, $352a, $24c6, $1042, $6f5a, $5ab5, $41ef, $2929, $06b8, $01f3, $014e, $00a9
	.dw $0000, $28e9, $20c7, $1ca6, $1885, $1463, $1042, $0c21, $0820, $0864, $0ca6, $350b, $15b3, $152e, $14c9, $1909
	.dw $0000, $01f3, $0186, $20d4, $184a, $28c7, $2085, $1864, $1443, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde, $1042
	.dw $0000, $1909, $10c7, $1084, $1042, $2d48, $20e5, $1883, $1041, $1462, $1c84, $28e7, $356c, $24e8, $1ca5, $0c21
; Unused colours
	.dw $0000, $3127, $28e6, $24c5, $1ca4, $1883, $1062, $0c41, $0820, $0864, $0ca6, $396a, $15b3, $152e, $14c9, $1909
	.dw $0000, $2d28, $20e6, $18a4, $1062, $3129, $24c6, $1c84, $1442, $0864, $0ca6, $1909, $356c, $24e8, $1ca5, $0c21
	.dw $0000, $26fe, $1dd7, $11dd, $0915, $0cee, $71f2, $510b, $38a7, $2731, $0de7, $7f7b, $66b4, $4dee, $3528, $14a5
	.dw $0000, $7a0d, $616a, $4106, $333e, $1237, $1571, $19a7, $189b, $1053, $104c, $7bde, $5ef4, $420d, $2d69, $14a5
	.dw $06b8, $01f3, $014e, $00a9, $01f3, $014e, $00a9, $06b8, $014e, $00a9, $06b8, $01f3, $00a9, $06b8, $01f3, $014e
	.dw $15b3, $152e, $14c9, $0d71, $0cec, $0c87, $052f, $04aa, $0445, $00ed, $0068, $0023, $01f3, $0186, $080a, $0804
	.dw $0190, $0123, $104d, $0806, $012d, $00c0, $1891, $1008, $00ca, $0060, $20d4, $184a

PaletteData_c_dd92:
	.dw $0000, $28c2, $1840, $1840, $0000, $28c2, $1840, $1840, $0000, $28c2, $1840, $1840, $0000, $28c2, $1840, $1840
	.dw $0000, $5733, $3e4e, $2989, $1d06, $10a4, $0862, $73bd, $5717, $4e52, $3d4c, $2887, $1002, $0017, $0010, $000a
	.dw $1c62, $050f, $048b, $0047, $2ce8, $24a7, $1c85, $1844, $1023, $0c22, $73bd, $5717, $4e52, $3d4c, $2ca8, $2045
	.dw $1044, $5e52, $4dce, $3d4a, $2ce7, $1c63, $0c00, $579d, $46f8, $3654, $25af, $150b, $0487, $0017, $0010, $000a
	.dw $0000, $1151, $110e, $0c25, $0c87, $0865, $0844, $0443, $0423, $0422, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde
	.dw $0000, $5f57, $52d4, $3e2f, $2d6a, $20e6, $0c83, $371f, $163a, $0113, $0017, $0010, $000a, $6188, $48e4, $3040
	.dw $0000, $4673, $39ef, $318c, $2908, $20a5, $1842, $1d29, $1ce7, $1cc6, $1c84, $1c63, $24a3, $2082, $1c62, $0000
	.dw $0000, $30c4, $28c3, $24a3, $2082, $1c62, $34e4, $3904, $30e8, $2cc7, $28a6, $2485, $2064, $1c43, $1842, $1842
; Unused colours
	.dw $0017, $0010, $000a, $000a, $0017, $0010, $0010, $000a, $0017, $0017, $0010, $000a, $000a, $0017, $0010, $0010
	.dw $000a, $0017, $30a0, $2c60, $2440, $2000, $2c60, $2440, $2000, $30a0, $2440, $2000, $30a0, $2c60, $2000, $30a0
	.dw $2c60, $2440, $4a0d, $7bde, $66d6, $41ad, $3129, $7f25, $7665, $15e5, $1c9c, $22ff, $117b, $0caf, $1ea7, $5d63
	.dw $34c3, $18a6, $0000, $4673, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $4673, $39ef, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $4673, $39ef, $318c, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $4673, $39ef, $318c, $2908, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $4673, $39ef, $318c, $2908, $20a5, $1842, $1842, $1842, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $1842, $1842, $1842, $1842, $1842, $1842, $1d29, $1842, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $1842, $1842, $1842, $1842, $1842, $1842, $1d29, $1ce7, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $1842, $1842, $1842, $1842, $1842, $1842, $1d29, $1ce7, $1cc6, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $1842, $1842, $1842, $1842, $1842, $1842, $1d29, $1ce7, $1cc6, $1c84, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $1842, $1842, $1842, $1842, $1842, $1842, $1d29, $1ce7, $1cc6, $1c84, $1c63, $24a3, $2082
	.dw $1c62, $0000, $0000, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $1842, $24a3, $2082
	.dw $1c62, $0000, $0000, $30c4, $28c3, $24a3, $2082, $1c62, $34e4, $3904, $30e8, $2cc7, $28a6, $2485, $2064, $1c43
	.dw $1842, $1842, $0000, $34c4, $2cc3, $24a3, $2082, $1c62, $38e4, $3d04, $392a, $2cc7, $28a6, $2485, $2064, $2043
	.dw $1c63, $1842, $0000, $3547, $2d05, $28c4, $2483, $2062, $3d88, $45ca, $5211, $49ae, $416c, $392a, $30c8, $2886
	.dw $2044, $1842, $0000, $3968, $2d05, $28c4, $2483, $2062, $41a9, $49eb, $5632, $4dcf, $416c, $392a, $30c8, $2ca7
	.dw $2465, $1842

PaletteData_c_e0d6:
	.dw $016e, $7bde, $739b, $6b59, $6317, $5ad5, $5293, $4a51, $422f, $39ed, $31ab, $2969, $2127, $18e5, $10a3, $0c81
	.dw $0160, $62f6, $4e51, $3dce, $2d4a, $20e7, $1484, $0c42, $0145, $0ea6, $7bde, $52d5, $2dcd, $216a, $1507, $08a4
	.dw $0160, $62f6, $4e51, $3dce, $2d4a, $20e7, $1484, $0c42, $0010, $091e, $7bde, $558a, $2948, $1ce5, $18c4, $1082
	.dw $0160, $7b9c, $6b18, $5653, $45ae, $3109, $2064, $0c42, $0145, $0ea6, $7716, $6ad3, $5e4e, $4589, $2ce6, $7bde
	.dw $0160, $08f0, $08aa, $10a6, $0c85, $0864, $0843, $0822, $412e, $30e9, $20a4, $1462, $3123, $24c2, $1882, $1042
	.dw $0160, $28a6, $2085, $1864, $1443, $0c22, $0801, $0400, $04a8, $0445, $20c4, $1883, $1462, $1041, $0c20, $3509
	.dw $0160, $144e, $0806, $331a, $2a57, $1952, $049e, $761e, $5348, $7f80, $7e20, $6904, $7bde, $5294, $35ad, $14a5
	.dw $0160, $40d0, $2c8b, $2468, $1c46, $1424, $0c02, $0400, $100a, $0806, $20c4, $1883, $1462, $1041, $0c20, $3509
; Unused colours
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0000, $18a4, $28e5, $20c4, $1ca3, $1883, $1062, $0c41, $0821, $0421, $1470, $0c4a, $0424, $1483, $1062, $0c41
	.dw $0000, $2d06, $28e5, $20c4, $1ca3, $1883, $1062, $0c41, $0821, $0421, $21cc, $1127, $08c4, $0462, $3548, $520d
	.dw $0000, $0d53, $1861, $0c21, $653a, $48f4, $38b0, $288c, $1848, $0c24, $2567, $1d05, $14a3, $0c62, $0821, $0421
	.dw $0081, $0501, $00c2, $0583, $0103, $0623, $0145, $0ea6, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $0010, $091e, $000c, $00d8, $0009, $0072, $0006, $004d, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000
	.dw $04a8, $0445, $0445, $04a8, $0465, $5d83, $30a2, $2c8c, $2069, $1847, $1045, $0823, $0422, $04aa, $4d03, $2482
	.dw $4091, $2c8c, $2069, $1847, $1025, $0823, $08f0, $38a3, $1841, $50f6, $38b0, $2c8c, $2069, $1446, $0823, $0d53
	.dw $1861, $0c21, $653a, $48f4, $38b0, $288c, $1848, $0c24, $0d53, $1861, $0c21, $653a, $48f4, $38b0, $288c, $1848
	.dw $0c24, $08f0, $38a3, $1841, $50f6, $38b0, $2c8c, $2069, $1446, $0823, $04aa, $4d03, $2482, $4091, $2c8c, $2069
	.dw $1847, $1025, $0823, $0465, $5d83, $30a2, $2c8c, $2069, $1847, $1045, $0823, $0422

PaletteData_c_e36e:
	.dw $35d0, $189b, $3248, $7e89, $6dd3, $5d2d, $34e8, $3f3d, $165c, $1551, $104c, $7bde, $66d6, $41ad, $658a, $20a5
	.dw $573f, $1151, $110e, $10cb, $10a8, $1465, $1422, $73bd, $5717, $4e11, $4129, $2885, $1c22, $0017, $0010, $000a
	.dw $573f, $3489, $2c67, $2846, $2025, $1c04, $1803, $1402, $1001, $7716, $6ad3, $5e4e, $4589, $2ce6, $7fff, $0c25
	.dw $573f, $573f, $3abd, $19d8, $0cef, $0068, $0000, $73bd, $5717, $4e52, $3d4c, $2887, $1c24, $1000, $2d82, $2d82
	.dw $573f, $1151, $110e, $1001, $2149, $1d07, $18e6, $14c5, $1083, $1042, $212b, $18e9, $10a6, $0c85, $0843, $1422
	.dw $6a6e, $3528, $24c5, $20a4, $1c83, $1862, $1041, $1d2a, $14c7, $0c85, $0c43, $0822, $0800, $1a14, $0d4d, $00a8
	.dw $6a6e, $2965, $2123, $18e2, $10a2, $0861, $0441, $1d2a, $14c7, $0c85, $0c43, $0822, $0800, $1a14, $0d4d, $00a8
	.dw $6a6e, $2a3a, $01b9, $00f9, $00b5, $0072, $002f, $000c, $479e, $22db, $123a, $01b9, $0157, $00f6, $781e, $781e
; Unused colours
	.dw $0010, $000a, $0017, $000a, $0017, $0010, $0017, $0010, $000a, $19d8, $0cef, $0068, $1575, $08ac, $0046, $1132
	.dw $048a, $0025, $0cef, $0068, $0004, $3489, $2c67, $2846, $2025, $1c04, $1803, $1402, $1001, $2ccc, $288a, $2468
	.dw $2026, $1c05, $1804, $1402, $1001, $290f, $24ad, $208a, $2048, $1c26, $1c05, $1803, $1001, $2572, $24d0, $20ad
	.dw $206a, $2048, $2026, $1c24, $1402, $1151, $110e, $110e, $10cb, $10cb, $1088, $10a8, $1465, $35d0, $7a0a, $6167
	.dw $2ce5, $3f3d, $165c, $1551, $19a7, $28b5, $2071, $146b, $7bde, $5ef4, $420d, $41b7, $1084

PaletteData_c_e508:
	.dw $4a0d, $439e, $165c, $1595, $7697, $6993, $58ef, $44aa, $4780, $1a20, $739c, $5eb5, $41ad, $28e7, $14a5, $0000

PaletteData_c_e528:
	.dw $4218, $1084, $4502, $5187, $624d, $7314, $011c, $021c, $031c, $0850, $18da, $425c, $294a, $3def, $5294, $739c

PaletteData_c_e548:
	.dw $5210, $1084, $309c, $5084, $6188, $720c, $0098, $0198, $021c, $1288, $038c, $2108, $1184, $4210, $0014, $739c

PaletteData_c_e568:
	.dw $2daf, $7e9f, $6198, $5515, $75df, $40bc, $1834, $0377, $024d, $01a8, $0124, $7fff, $5b18, $4231, $296b, $14a7

PaletteData_c_e588:
	.dw $3df2, $217d, $0057, $7f10, $69c8, $58e4, $7278, $6532, $58cb, $63b8, $2b4a, $1626, $7bde, $56b5, $318c, $0c63

PaletteData_c_e5a8:
	.dw $4a0d, $629c, $49b6, $34f1, $1aff, $0dfd, $00db, $0070, $7b00, $69c0, $4100, $63d0, $7bde, $4633, $2d6e, $14a5

PaletteData_c_e5c8:
	.dw $4a0d, $7ad8, $69b0, $590b, $38c7, $7bbd, $318f, $7f45, $69e2, $4103, $22fe, $15d6, $0caf, $4e76, $210a, $18a6
	.dw $4a0d, $7bbd, $6b39, $5ab5, $4a31, $39ad, $2929, $1cc5, $22fe, $1a39, $1174, $0caf, $7f45, $69e2, $4103, $18a6

PaletteData_c_e608:
	.dw $4a0d, $7f45, $69e0, $40e3, $7e9c, $79d6, $58ce, $2789, $1e42, $5e3f, $3d3c, $1012, $739c, $66d6, $3d8c, $14a5

PaletteData_c_e628:
	.dw $35af, $1018, $51cc, $199e, $377f, $7f54, $768f, $4127, $3f0c, $1de6, $00ce, $367a, $1d73, $7bde, $6ab4, $14a5

PaletteData_c_e648:
	.dw $24eb, $10a5, $3b52, $268d, $15e8, $0544, $61ed, $4d6a, $3ce8, $4a52, $294a, $425f, $2dba, $1916, $6739, $08ae

PaletteData_c_e668:
	.dw $24eb, $1084, $5775, $3aae, $1e07, $0561, $69ef, $514a, $3ca5, $4a52, $294a, $529f, $319a, $1096, $6739, $084d

PaletteData_c_e688:
	.dw $35d0, $4554, $28cf, $4313, $222b, $19a7, $1124, $3efc, $15f6, $152f, $7ee6, $7bde, $5294, $35ad, $188c, $20a5

PaletteData_c_e6a8:
	.dw $35d0, $5151, $3cca, $55fd, $3519, $1c71, $0c2c, $3efc, $15f6, $152f, $7ee6, $7bde, $5294, $35ad, $3086, $20a5

PaletteData_c_e6c8:
	.dw $328c, $1aee, $11c7, $6e99, $6170, $390a, $0399, $123e, $1098, $108d, $6210, $4944, $7bde, $6318, $318c, $0c63

PaletteData_c_e6e8:
	.dw $4294, $1190, $4090, $5154, $6218, $0140, $1206, $230c, $4188, $5a0e, $7294, $318c, $5294, $739c, $129c, $18c6

PaletteData_c_e708:
	.dw $4294, $1190, $4090, $5154, $6218, $000e, $0057, $193f, $4188, $5a0e, $7294, $318c, $5294, $739c, $129c, $1084

PaletteData_c_e728:
	.dw $4a0d, $7f45, $69e2, $4103, $7697, $6993, $58ef, $3b9e, $127b, $1974, $2789, $25e3, $739c, $5294, $318c, $18c6

PaletteData_c_e748:
	.dw $3190, $7398, $6294, $418c, $2084, $1000, $5318, $211c, $0014, $000c, $0214, $010c, $528c, $3184, $2100, $1000

PaletteData_c_e768:
	.dw $6d8a, $5316, $19ed, $118a, $0d48, $08e5, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $2e2b, $14a5

PaletteData_c_e788:
	.dw $1c82, $739c, $6b17, $62b4, $45ef, $396c, $24c8, $1c65, $03ff, $02ff, $19d6, $22dc, $1a36, $0d70, $04ea, $0086

PaletteData_c_e7a8:
	.dw $2b03, $7270, $28e5, $20c3, $3a0f, $7f34, $6e6b, $55e7, $4564, $1ca3, $7fbc, $2dac, $254a, $1d29, $14e6, $0c84

PaletteData_c_e7c8:
	.dw $4b0e, $144e, $0806, $331a, $2a57, $1952, $049e, $761e, $5348, $7f80, $7e20, $6904, $7bde, $5294, $35ad, $14a5

PaletteData_c_e7e8:
	.dw $520c, $7eb1, $339c, $121c, $0118, $0380, $0280, $0184, $0100, $720c, $6104, $5080, $739c, $5294, $318c, $1084

PaletteData_c_e808:
	.dw $3168, $18a6, $739c, $5a6f, $45a9, $3926, $30e4, $28a3, $4e73, $39ce, $2d6b, $2108, $4213, $3190, $252c, $1cea

PaletteData_c_e828:
	.dw $3df2, $7fff, $5fbf, $1f1f, $325e, $1d9f, $0cbb, $5294, $7f45, $61e5, $5903, $031f, $555f, $6318, $4631, $0c63

PaletteData_c_e848:
	.dw $0200, $14a5, $0154, $021a, $1a9e, $50c0, $6580, $7280, $1140, $1240, $2340, $2b3e, $2529, $4210, $5ad6, $739c

PaletteData_c_e868:
	.dw $2e0e, $739c, $7716, $66b2, $51ec, $3947, $2ce6, $2083, $00cc, $008a, $0048, $22dc, $1a36, $0d70, $04ea, $0086

PaletteData_c_e888:
	.dw $2587, $739c, $18c6, $038f, $1289, $1964, $5ad6, $35ad, $129e, $01fc, $0117, $0093, $035c, $1170, $331c, $0000

PaletteData_c_e8a8:
	.dw $2046, $739c, $72f6, $5a30, $45ac, $2ce6, $20a4, $1863, $4a53, $31ad, $2129, $14c6, $0c84, $3528, $4e73, $18a5

PaletteData_c_e8c8:
	.dw $5cb2, $7716, $6ad3, $0000, $4e97, $7f34, $5e4e, $4589, $2ce6, $1ca3, $7fbc, $7376, $66f2, $5e6e, $55ea, $4d87

PaletteData_c_e8e8:
	.dw $318c, $1886, $739c, $5e15, $4930, $3cad, $306a, $2427, $39ce, $56b5, $5298, $4214, $3190, $252c, $18ca, $001e

PaletteData_c_e908:
	.dw $2046, $2967, $1d04, $14e3, $14c2, $3302, $2a23, $2143, $1c16, $1ce9, $3fe2, $575a, $4212, $35af, $294c, $1884

PaletteData_c_e928:
	.dw $218c, $1084, $0098, $511c, $119c, $321c, $131c, $539c, $4080, $5104, $6284, $2204, $438c, $2108, $4210, $739c

PaletteData_c_e948:
	.dw $5210, $14c4, $726e, $61a9, $5106, $1733, $124b, $1187, $231c, $1a5c, $115a, $0894, $398c, $4a10, $5a94, $739c

PaletteData_c_e968:
	.dw $35d0, $5a7f, $18ba, $3f3d, $165c, $1595, $5bf6, $2789, $2ac5, $1e02, $1143, $7bde, $66d6, $41ad, $3129, $20a5

PaletteData_c_e988:
	.dw $424d, $26fe, $1db5, $117e, $08d5, $0cee, $7247, $4945, $33d2, $1aab, $05a5, $7f7b, $66b4, $4dee, $3528, $14a5

PaletteData_c_e9a8:
	.dw $35d0, $579f, $459f, $20d9, $0151, $7310, $6606, $4964, $2b3f, $12bd, $01d6, $7bde, $509b, $2ce4, $29a5, $0c63
	.dw $3190, $739c, $437c, $2213, $00ca, $5dfe, $34b9, $0010, $7100, $7267, $0dfc, $00dc, $6318, $4210, $2108, $1084
; Unused colours
	.dw $420c, $1284, $2308, $3b8e, $5394, $6b9a, $318c, $009c, $0094, $008c, $2194, $429c, $2388, $031c, $0194, $1084

PaletteData_c_ea08:
	.dw $4a0d, $7bde, $66d6, $41ad, $3129, $2794, $1eac, $7f45, $69e2, $1c9c, $22ff, $117b, $10d1, $15e7, $0924, $18a6

PaletteData_c_ea28:
	.dw $424d, $273e, $1638, $0932, $24dd, $76cc, $55e7, $3522, $3373, $1a6d, $0567, $7f7b, $66b4, $4dee, $3528, $14a5

PaletteData_c_ea48:
	.dw $41ad, $69dc, $48ef, $386b, $294a, $7e60, $4d20, $0014, $0449, $2e37, $1551, $04cc, $739c, $5ad6, $39ce, $0c63

PaletteData_c_ea68:
	.dw $418c, $4f04, $1de2, $0100, $2108, $027c, $011c, $55a6, $4522, $7b99, $7f11, $662a, $739c, $5294, $318c, $3481

PaletteData_c_ea88:
	.dw $4a0d, $40e3, $5d63, $65e5, $72a5, $7f47, $0d13, $119b, $22ff, $1c9c, $40cc, $5d74, $41ad, $66d6, $7bde, $18a5
	.dw $4a0d, $2042, $5d63, $65e5, $6f64, $7fe4, $0ddd, $12de, $1bdf, $1c9c, $40cc, $3d69, $522f, $66d5, $7bde, $18a5

PaletteData_c_eac8:
	.dw $35af, $7638, $5530, $3c4c, $239d, $0238, $1470, $2059, $555e, $7b40, $59c0, $7bde, $66b4, $418a, $2ce6, $1882
	.dw $35af, $739c, $7338, $72d5, $7271, $720e, $71aa, $7147, $7104, $4084, $67be, $1f1c, $09d8, $04f1, $190e, $2167

PaletteData_c_eb08:
	.dw $420c, $1180, $2280, $229c, $1198, $1090, $7304, $2108, $311c, $1098, $1010, $100c, $739c, $4210, $318c, $1084

PaletteData_c_eb28:
	.dw $420c, $739c, $6af7, $49ef, $3129, $6fdb, $57d5, $2f0b, $0280, $7208, $53de, $263c, $1cf4, $000c, $0104, $1484

PaletteData_c_eb48:
	.dw $320c, $729c, $419c, $2098, $100c, $6290, $5180, $3104, $329c, $121c, $0114, $739c, $5098, $1288, $2184, $0000
	.dw $3190, $6190, $4088, $329c, $121c, $1114, $008c, $419c, $2098, $1010, $7214, $2184, $739c, $3288, $7184, $1084

PaletteData_c_eb88:
	.dw $420c, $3088, $410c, $7214, $0100, $1184, $2208, $1088, $2110, $2194, $429c, $3108, $418c, $6294, $739c, $2084

PaletteData_c_eba8:
	.dw $418c, $3084, $4104, $5188, $7290, $0100, $0204, $208c, $3110, $4194, $5218, $2108, $318c, $5294, $739c, $1084

PaletteData_c_ebc8:
	.dw $4a0d, $34e6, $4506, $5d88, $6a09, $7a8b, $339c, $1a98, $0194, $10b1, $2536, $3ddb, $739c, $5294, $35ad, $14a5
	.dw $3e00, $108c, $0090, $0098, $111c, $019c, $021c, $031c, $439c, $739c, $7318, $7294, $7210, $618c, $4108, $3108

PaletteData_c_ec08:
	.dw $35d0, $65b1, $40e9, $32fe, $121c, $1516, $0cad, $49bf, $209a, $1850, $7a76, $25a5, $7bde, $36eb, $79c6, $14a5
	.dw $35d0, $739c, $669c, $5a37, $59d4, $5110, $5bbe, $32dc, $0e5c, $15db, $0558, $4cac, $36eb, $36eb, $36eb, $14a5

PaletteData_c_ec48:
	.dw $35d0, $51b9, $410b, $42de, $29fc, $1d16, $0cad, $55ff, $34fa, $1850, $6abc, $3245, $7bde, $5b8f, $7a26, $14a5

PaletteData_c_ec68:
	.dw $35d0, $4e16, $2551, $575e, $2edd, $19d9, $0cf3, $4a9e, $219b, $10d5, $6f1a, $2210, $7bde, $3f34, $4e31, $0cad

PaletteData_c_ec88:
	.dw $35d0, $331d, $1e7b, $7bde, $5bbe, $373c, $1a1a, $579e, $2adc, $0dfa, $6fde, $229c, $7bde, $4b9e, $229c, $04b8

PaletteData_c_eca8:
	.dw $4290, $739c, $239c, $011c, $730c, $7288, $5100, $7200, $7100, $4084, $429c, $2194, $1110, $739c, $4210, $0000

PaletteData_c_ecc8:
	.dw $3188, $0108, $728c, $5100, $639c, $5294, $318c, $011c, $0094, $008c, $429c, $2194, $1110, $129c, $1214, $1084

PaletteData_c_ece8:
	.dw $5294, $2108, $318c, $4210, $6318, $7288, $7288, $7288, $7288, $7288, $7288, $7288, $7288, $7288, $7288, $0000

PaletteData_c_ed08:
	.dw $0000, $10bf, $7e06, $239c, $12da, $0a18, $739c, $53c4, $4340, $2ac0, $7b86, $6ec3, $6242, $7d1a, $029f, $739c

PaletteData_c_ed28:
	.dw $2568, $08cd, $048a, $0047, $1ef7, $77fd, $52f7, $3a31, $29ad, $1908, $0ca5, $0862, $5f37, $4a92, $31cc, $1906

PaletteData_c_ed48:
	.dw $2188, $0000, $730a, $7b4e, $7b96, $7bd8, $418c, $5210, $7bde, $23de, $3094, $519c, $2108, $4210, $6318, $739c

PaletteData_c_ed68:
	.dw $3214, $4952, $4129, $2b4a, $2286, $19c3, $1100, $331c, $2216, $1110, $7284, $739c, $5294, $318c, $34a9, $18c6

PaletteData_c_ed88:
	.dw $3214, $18c6, $7104, $20dc, $035e, $2200, $2348, $6110, $69d6, $76bd, $1e1c, $720c, $2108, $318c, $4210, $739c

PaletteData_c_eda8:
	.dw $2d4a, $3edc, $2e1a, $1d95, $1951, $150e, $0ccb, $0469, $0047, $5f5e, $4697, $31cf, $252b, $10a6, $0c63, $0842

PaletteData_c_edc8:
	.dw $424d, $26fe, $1dd7, $11dd, $0915, $0cee, $71f2, $510b, $38a7, $2731, $0de7, $7f7b, $66b4, $4dee, $3528, $14a5
	.dw $424d, $739c, $5398, $4394, $3310, $228c, $1208, $0184, $0100, $0080, $0000, $701c, $301c, $2108, $4210, $739c

PaletteData_c_ee08:
	.dw $4214, $1084, $2108, $318c, $5294, $3084, $4108, $6188, $720c, $0090, $0114, $0198, $000c, $0014, $0098, $6318
	.dw $210c, $1084, $328c, $1204, $331c, $121c, $1114, $7218, $6194, $510c, $4088, $3084, $739c, $5294, $318c, $2108

PaletteData_c_ee48:
	.dw $35d0, $49c8, $3926, $333e, $1237, $1571, $0ceb, $49bf, $209a, $1850, $6eef, $2e89, $7bde, $29a5, $1925, $14a5
	.dw $3190, $729c, $419c, $2098, $100c, $6290, $5180, $3104, $329c, $121c, $0114, $739c, $5098, $1288, $2184, $0000

PaletteData_c_ee88:
	.dw $4210, $429c, $1010, $228c, $4952, $34ad, $2088, $1104, $129c, $1194, $301c, $739c, $5294, $418c, $3108, $14a5
	.dw $4210, $0108, $118c, $2210, $3294, $4318, $539c, $7118, $719c, $721c, $731c, $739c, $6208, $6188, $7288, $739c
; Unused colours
	.dw $4210, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000, $0000

PaletteData_c_eee8:
	.dw $3610, $6e80, $5580, $3ce0, $027d, $0176, $285c, $59dc, $2e37, $1551, $04cc, $0449, $739c, $4a52, $294a, $0c63

PaletteData_c_ef08:
	.dw $5210, $7214, $6190, $4108, $0004, $3394, $2288, $2184, $1104, $2098, $008c, $739c, $6290, $5200, $229c, $1084
	.dw $5210, $739c, $539c, $339c, $139c, $0390, $030c, $0288, $0204, $0180, $700c, $701c, $301c, $2108, $4210, $739c

PaletteData_c_ef48:
	.dw $310b, $0239, $36c6, $35bc, $1cf6, $0450, $7af3, $5dec, $4525, $573e, $3a5a, $2176, $739c, $4a52, $294a, $18a5
	.dw $310b, $53a8, $4726, $3ea4, $3622, $00ed, $033c, $0238, $0154, $739c, $1b1e, $123d, $097a, $08b5, $14a5, $316b
; Carries on for $20 bytes

PaletteData_c_ef88:
	.dw $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af, $35af

PaletteData_c_efa8:
	.dw $0000, $56f8, $3e53, $31cf, $254b, $1ce8, $18a5, $1042, $1f1c, $1258, $0994, $00d0, $6f79, $4e71, $358b, $1cc5

PaletteData_c_efc8:
	.dw $0000, $579c, $3ef9, $2a56, $15b3, $112d, $10a7, $1042, $779c, $5ab5, $41ef, $2929, $0536, $0470, $02ad, $0565

PaletteData_c_efe8:
	.dw $0050, $7fff, $6ad3, $560d, $4568, $2cc6, $1844, $6a3f, $5579, $40b3, $2c0d, $7fb8, $7aef, $7a49, $18a5, $42a8

PaletteData_c_f008:
	.dw $0000, $7b59, $66b5, $5231, $41ad, $3129, $20c6, $1042, $779c, $5673, $41ce, $2d29, $014e, $2084, $1863, $06b8

PaletteData_c_f028:
	.dw $218c, $1084, $01ff, $1eff, $3fff, $001f, $4480, $7524, $7e28, $00e0, $1de4, $5770, $24c6, $354a, $5a73, $739c

PaletteData_c_f048:
	.dw $4280, $4108, $51ac, $6250, $7314, $1088, $190c, $2590, $3214, $108c, $2114, $4198, $739c, $5294, $318c, $1084
	.dw $4280, $34e6, $4506, $5d88, $6a09, $7a8b, $339c, $1a98, $0194, $10b1, $2536, $3ddb, $7bde, $5294, $35ad, $14a5
	.dw $418c, $2108, $4210, $2180, $2a44, $3308, $338c, $538c, $6394, $739c, $731c, $721c, $7194, $6110, $6090, $1084

PaletteData_c_f0a8:
	.dw $4a0d, $7bde, $66d6, $41ad, $3129, $7f25, $7665, $15e5, $1c9c, $22ff, $117b, $0caf, $1ea7, $5d63, $34c3, $18a6

PaletteData_c_f0c8:
	.dw $218c, $7bde, $67d7, $57d1, $43ca, $33e4, $7b7f, $66bf, $521f, $3d7f, $7ff8, $7772, $72ec, $6e66, $69e1, $0000

PaletteData_c_f0e8:
	.dw $2108, $739c, $730c, $7204, $7100, $5000, $701c, $701c, $701c, $701c, $701c, $701c, $301c, $2108, $4210, $0000

PaletteData_c_f108:
	.dw $3544, $7bde, $4e73, $294a, $135d, $1296, $056c, $7645, $5503, $38a2, $195e, $0456, $044c, $0e4a, $1d06, $14a5
	.dw $3544, $0000, $10f3, $091e, $7fd8, $7a8d, $5963, $79c6, $6904, $34c4, $429f, $2597, $533f, $7bde, $4e73, $14a5

PaletteData_c_f148:
	.dw $454c, $0239, $36c6, $35bc, $1cf6, $0450, $7af3, $5dec, $4525, $573e, $3a5a, $2176, $739c, $4a52, $294a, $18a5
	.dw $454c, $18c6, $18c6, $1ce7, $2508, $2d4a, $252a, $2129, $1d08, $1ce7, $1ce8, $2109, $2d2a, $2509, $1ce7, $1084
	.dw $454c, $49c8, $3926, $333e, $1237, $1571, $0ceb, $49bf, $209a, $1850, $6eef, $2e89, $7bde, $29a5, $1925, $14a5
	.dw $454c, $7a0d, $616a, $4106, $5b5e, $19f6, $152f, $19a7, $189b, $1053, $104c, $7bde, $5ef4, $420d, $2d69, $14a5

PaletteData_c_f1c8:
	.dw $35d0, $7a0d, $616a, $4106, $5b5e, $19f6, $152f, $19a7, $189b, $1053, $104c, $7bde, $5ef4, $420d, $2d69, $14a5

PaletteData_c_f1e8:
	.dw $35af, $2b7f, $0238, $0151, $146d, $1858, $4d1d, $7a7e, $7f94, $5aad, $3dc7, $2503, $7bde, $62d4, $3dab, $1882
	.dw $3190, $739c, $7310, $7208, $7184, $7100, $7080, $6110, $508c, $4008, $4008, $5294, $318c, $6ab8, $65d4, $1084
	.dw $35af, $7378, $72f4, $724e, $6969, $71cb, $7270, $7378, $72f4, $7270, $71eb, $7167, $739c, $72f4, $71cb, $70c3
	.dw $35af, $4f5a, $46b7, $4214, $3cec, $414e, $5d94, $66fa, $66d2, $5e4e, $55c9, $4d25, $739c, $66d2, $55c9, $40a3

PaletteData_c_f268:
	.dw $35d0, $189b, $3248, $7e89, $6dd3, $5d2d, $34e8, $3f3d, $165c, $1551, $104c, $7bde, $66d6, $41ad, $658a, $20a5
	.dw $2daf, $23be, $1b1e, $123d, $097a, $0478, $1ca6, $2d4b, $4a32, $737c, $5d2d, $6dd3, $6a76, $7328, $776e, $7b94

PaletteData_c_f2a8:
	.dw $35d0, $7a0a, $6167, $2ce5, $3f3d, $165c, $1551, $19a7, $28b5, $2071, $146b, $7bde, $5ef4, $420d, $41b7, $1084

PaletteData_c_f2c8:
	.dw $35d0, $7a0d, $616a, $4106, $333e, $1237, $1571, $19a7, $189b, $1053, $104c, $7bde, $5ef4, $420d, $2d69, $14a5
	.dw $35d0, $50d4, $5976, $6619, $72dc, $59e7, $626c, $6af1, $7396, $25da, $2e5a, $36fb, $439c, $1129, $739c, $18a5

PaletteData_c_f308:
	.dw $424d, $153d, $2095, $0f0f, $375f, $225a, $1595, $0cee, $76cc, $55e7, $3522, $7f7b, $66b4, $4dee, $3528, $14a5

PaletteData_c_f328:
	.dw $298a, $739c, $039e, $02dd, $023c, $7f89, $7a8a, $61c6, $338c, $2ac5, $0160, $007e, $0057, $0031, $3def, $18c6

PaletteData_c_f348:
	.dw $3214, $1084, $5100, $3088, $410c, $5190, $6214, $5280, $0218, $031c, $339c, $2180, $330c, $2108, $4210, $739c

PaletteData_c_f368:
	.dw $318c, $2388, $209c, $7100, $1084, $1084, $1084, $1084, $1084, $1084, $1084, $1084, $1084, $1084, $1084, $108c

PaletteData_c_f388:
	.dw $2114, $1084, $029c, $01f6, $0150, $00ca, $0360, $7110, $58ac, $4448, $3004, $1010, $1008, $739c, $4631, $1ce7

PaletteData_c_f3a8:
	.dw $310b, $0239, $36c6, $35bc, $1cf6, $0450, $7af3, $5dec, $4525, $573e, $3a5a, $2176, $739c, $4a52, $294a, $18a5

PaletteData_c_f3c8:
	.dw $0000, $2507, $20e6, $18a4, $1483, $49ee, $316a, $2928, $20e7, $1483, $3dcd, $316a, $2d49, $2507, $20e6, $1062
