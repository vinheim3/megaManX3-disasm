.macro ldaw
    lda #(\2<<8)|\1.w
.endm

.macro peaw
    pea (\2<<8)|\1.w
.endm

.macro dwbe
    .redefine _out (\1>>8)|((\1&$ff)<<8)
.endm

; Cx4

.enum 0
    A db
    IMM db
    OP db
    _2A db
    _100hA db
    _10000hA db
    lsb db
    mid db
    msb db
    P db
    ext_dta db
    PH db
    PL db
.ende

REG_A = $00
MH = $01
ML = $02
EXT_DTA = $03
ROM_DTA = $08
RAM_DTA = $0c
EXT_PTR = $13
RAM_PTR = $1c
SNES_ROM_EXT_PTR = $2e ; $612e only
_000000 = $50
_FFFFFF = $51
_00FF00 = $52
_FF0000 = $53
_00FFFF = $54
_FFFF00 = $55
_800000 = $56
_7FFFFF = $57
_008000 = $58
_007FFF = $59
_FF7FFF = $5a
_FFFF7F = $5b
_010000 = $5c
_FEFFFF = $5d
_000100 = $5e
_00FEFF = $5f
R0 = $60
R1 = $61
R2 = $62
R3 = $63
R4 = $64
R5 = $65
R6 = $66
R7 = $67
R8 = $68
R9 = $69
RA = $6a
RB = $6b
RC = $6c
RD = $6d
RE = $6e
RF = $6f

.macro add
    .if \1 == A
        ; add A, OP op
        .if \2 == OP
            .dw $8000+\3
        ; add A, IMM d8
        .elif \2 == IMM
            .dw $8400+\3
        .else
            .fail
        .endif
    .elif \1 == _2A
        ; add _2A, OP op
        .if \2 == OP
            .dw $8100+\3
        .else
            .fail
        .endif
    .elif \1 == _100hA
        ; add _100hA, IMM d8
        .if \2 == IMM
            .dw $8600+\3
        ; add _100hA, OP op
        .elif \2 == OP
            .dw $8200+\3
        .else
            .fail
        .endif
    .elif \1 == _10000hA
        ; add _10000hA, OP op
        .dw $8300+\3
    .else
        .fail
    .endif
.endm

.macro _and
    .if \1 == A
        ; _and A, IMM d8
        .if \2 == IMM
            .dw $b400+\3
        ; _and A, OP op
        .elif \2 == OP
            .dw $b000+\3
        .else
            .fail
        .endif
    .elif \1 == _2A
        ; _and _2Ah, IMM d8
        .if \2 == IMM
            .dw $b500+\3
        .else
            .fail
        .endif
    .elif \1 == _100hA
        ; _and _100hA, OP op
        .if \2 == OP
            .dw $b200+\3
        .else
            .fail
        .endif
    .else
        .fail
    .endif
.endm

.macro call
    .dw $2800+(\1#$200)/2
.endm

.macro callc
    .dw $3000+(\1#$200)/2
.endm

.macro calls
    .dw $3400+(\1#$200)/2
.endm

.macro _cmp
    .if \1 == A
        ; _cmp A, IMM d8
        .if \2 == IMM
            .dw $5400+\3
        ; _cmp A, OP op
        .elif \2 == OP
            .dw $5000+\3
        .else
            .fail
        .endif
    .elif \1 == _100hA
        ; _cmp _100hA, OP op
        .if \2 == OP
            .dw $5200+\3
        .else
            .fail
        .endif
    .elif \1 == IMM
        ; _cmp IMM d8, A
        .if \3 == A
            .dw $4c00+\2
        .else
            .fail
        .endif
    .elif \1 == OP
        ; _cmp OP op, _100hA
        .if \3 == _100hA
            .dw $4a00+\2
        .else
            .fail
        .endif
    .else
        .fail
    .endif
.endm

.macro extsb
    .dw $5900
.endm

.macro extsw
    .dw $5a00
.endm

.macro fcall
    .dw $2a00+(\1#$200)/2
.endm

.macro finish_ext_dta
    .dw $1c00
.endm

.macro fjp
    .dw $0a00+(\1#$200)/2
.endm

.macro halt
    .dw $fc00
.endm

.macro inc_ext_ptr
    .dw $4000
.endm

.macro jc
    .dw $1000+(\1#$200)/2
.endm

.macro jp
    .dw $0800+(\1#$200)/2
.endm

.macro js
    .dw $1400+(\1#$200)/2
.endm

.macro jz
    .dw $0c00+(\1#$200)/2
.endm

.macro mov
    .if \1 == A
        ; mov A, IMM d8
        .if \2 == IMM
            .dw $6400+\3
        ; mov A, OP op
        .elif \2 == OP
            .dw $6000+\3
        .else
            .fail
        .endif
    .elif \1 == OP
        ; mov OP op, A
        .if \3 == A
            .dw $e000+\2
        .else
            .fail
        .endif
    .elif \1 == P
        ; mov P, IMM d8
        .if \2 == IMM
            .dw $6700+((\3/$200)&$f)
        .else
            .fail
        .endif
    .elif \1 == PH
        ; mov PH, IMM d8
        .if \2 == IMM
            .dw $7d00+>((\3/$200)&$f)
        .else
            .fail
        .endif
    .elif \1 == PL
        ; mov PL, IMM d8
        .if \2 == IMM
            .dw $7c00+<((\3/$200)&$f)
        .else
            .fail
        .endif
    ; mov ext_dta, OP SNES_ROM_EXT_PTR
    .elif \1 == ext_dta
        .dw $612e
    .else
        .fail
    .endif
.endm

.macro mul
    ; mul OP op
    .if \1 == OP
        .dw $9800+\2
    ; mul IMM d8
    .elif \1 == IMM
        .dw $9c00+\2
    .else
        .fail
    .endif
.endm

.macro noop
    .dw $0000
.endm

.macro or
    .if \1 == A
        ; or A, OP op
        .if \2 == OP
            .dw $b800+\3
        ; or A, IMM d8
        .elif \2 == IMM
            .dw $bc00+\3
        .else
            .fail
        .endif
    .elif \1 == _2A
        ; or _2A, OP op
        .if \2 == OP
            .dw $b900+\3
        .else
            .fail
        .endif
    .elif \1 == _100hA
        ; or _100hA, OP op
        .if \2 == OP
            .dw $ba00+\3
        .else
            .fail
        .endif
    .else
        .fail
    .endif
.endm

.macro rdram
    .if \1 == lsb
        ; rdram lsb, IMM d8
        .if \2 == IMM
            .dw $6c00+\3
        ; rdram lsb, OP op
        .elif \2 == OP
            .dw $6800+\3
        .else
            .fail
        .endif
    .elif \1 == mid
        ; rdram mid, IMM d8
        .if \2 == IMM
            .dw $6d00+\3
        .elif \2 == OP
            .dw $6900+\3
        .else
            .fail
        .endif
    .elif \1 == msb
        ; rdram msb, IMM d8
        .if \2 == IMM
            .dw $6e00+\3
        .else
            .fail
        .endif
    .else
        .fail
    .endif
.endm

.macro rdrom
    ; rdrom OP op
    .if \1 == OP
        .dw $7000+\2
    .else
        .fail
    .endif
.endm

.macro ret
    .dw $3c00
.endm

.macro rotr
    ; rotr A, IMM d8
    .if \2 == IMM
        .dw $d400+\3
    .else
        .fail
    .endif
.endm

.macro shar
    ; shar A, IMM d8
    .if \2 == IMM
        .dw $cc00+\3
    .else
        .fail
    .endif
.endm

.macro shll
    ; shlr A, IMM d8
    .if \2 == IMM
        .dw $dc00+\3
    ; shlr A, OP op
    .elif \2 == OP
        .dw $d800+\3
    .else
        .fail
    .endif
.endm

.macro shlr
    ; shlr A, IMM d8
    .if \2 == IMM
        .dw $c400+\3
    ; shlr A, OP op
    .elif \2 == OP
        .dw $c000+\3
    .else
        .fail
    .endif
.endm

.macro skipc
    .dw $2501
.endm

.macro skipns
    .dw $2700
.endm

.macro skips
    .dw $2701
.endm

.macro skipz
    .dw $2601
.endm

.macro sub
    .if \1 == A
        ; sub A, IMM d8
        .if \2 == IMM
            .dw $9400+\3
        ; sub A, OP op
        .elif \2 == OP
            .dw $9000+\3
        .else
            .fail
        .endif
    .elif \1 == _2A
        ; sub _2A, OP op
        .if \2 == OP
            .dw $9100+\3
        .else
            .fail
        .endif
    .elif \1 == OP
        ; sub OP op, A
        .if \3 == A
            .dw $8800+\2
        .else
            .fail
        .endif
    .elif \1 == IMM
        ; sub IMM d8, A
        .if \3 == A
            .dw $8c00+\2
        .else
            .fail
        .endif
    .else
        .fail
    .endif
.endm

.macro swap
    .dw $f000+\2
.endm

.macro wrram
    .if \1 == lsb
        ; wrram lsb, OP op
        .if \2 == OP
            .dw $e800+\3
        ; wrram lsb, IMM d8
        .elif \2 == IMM
            .dw $ec00+\3
        .else
            .fail
        .endif
    .elif \1 == mid
        ; wrram mid, OP op
        .if \2 == OP
            .dw $e900+\3
        ; wrram mid, IMM d8
        .elif \2 == IMM
            .dw $ed00+\3
        .else
            .fail
        .endif
    .elif \1 == msb
        ; wrram msb, OP op
        .if \2 == OP
            .dw $ea00+\3
        ; wrram msb, IMM d8
        .elif \2 == IMM
            .dw $ee00+\3
        .else
            .fail
        .endif
    .else
        .fail
    .endif
.endm

.macro xor
    .if \1 == A
        ; xor A, OP op
        .if \2 == OP
            .dw $a800+\3
        .else
            .fail
        .endif
    .else
        .fail
    .endif
.endm
