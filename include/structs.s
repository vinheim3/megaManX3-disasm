.struct Oam
    x db
    y db
    tile db
    attr db
.endst

THREAD_STOPPED = 0
THREAD_PENDING = 1
THREAD_DELAYED = 2
THREAD_STARTED = 3

.struct Thread
    status db ; $0
    delayCounter db ; $1
    pc dw ; $2/$3
    sp dw ; $4/$5
    stackTop dw ; $6/$7
    sizeof .db
.endst

.struct BulkDmaStruct
    vmain db ; $0
    vramAddr dw ; $1/$2 - word-idxed
    numBytes dw ; $3/$4
    srcAddr dw ; $5/$6
    srcBank db ; $7
    sizeof .db
.endst

.struct MiniDmaStruct
    vmain db ; $0
    vramAddr dw ; $1/$2 - word-idxed
    numBytes db ; $3
    data ds $100-4 ; $4+
.endst

; todo: fill-in for entities with unknown shape
.struct GenericEntity
    enabled db ; $00
    state db ; $01
    substate db ; $02
    subsubstate db ; $03
    subX db ; $04
    x dw ; $05/$06
    subY db ; $07
    y dw ; $08/$09
    type db ; $0a
    subType db ; $0b
    bc ds $13-$c
    framesTilNextCel db ; $13
    animAddr dw ; $14/$15 - bank $3f
    animSpecIdx db ; $16
    celIdx db ; $17 - for lookup in bank $0d ($0e is lookup in bank $3f)
    b18 ds $a-8
    xSpeed dw ; $1a
    fallVal dw ; $1c/$1d
    b1e ds $20-$1e
    sizeof .db
.endst

.struct PlayerEntity
    enabled db ; $00
    state db ; $01
    substate db ; $02
    subsubstate db ; $03
    subX db ; $04
    x dw ; $05/$06
    subY db ; $07
    y dw ; $08/$09
    type db ; $0a
    subType db ; $0b
    bc ds $11-$c
    colours8idx db ; $11
    b12 ds 8-2
    baseTileIdx db ; $18
    b19 ds $c-9
    fallVal dw ; $1c/$1d
    b1e ds $27-$1e
    health db ; $27
    weaknessesIdx db ; $28
    b29 ds $33-$29
    selectedSubweapon db ; $33
    b34 ds 6-4
; Bit 7 to 0: dash-0-selL-selR-0-0-0-0
    dashAndSelCurrBtnsHeld db ; $36
; Bit 7 to 0: jump-shot-0-menu-U-D-L-R
    jumpShotMenuDirCurrBtnsHeld db ; $37
    dashAndSelPrevBtnsHeld db ; $38
    jumpShotMenuDirPrevBtnsHeld db ; $39
    dashAndSelCurrBtnsPressed db ; $3a
    jumpShotMenuDirCurrBtnsPressed db ; $3b
    b3c ds $b0-$3c
    sizeof .db
.endst

.struct StageEnemyEntity
    enabled db ; $00
    state db ; $01
    substate db ; $02
    subsubstate db ; $03
    subX db ; $04
    x dw ; $05/$06
    subY db ; $07
    y dw ; $08/$09
    type db ; $0a
    subType db ; $0b
    bc ds $11-$c
    colours8idx db ; $11
    b12 ds 8-2
    baseTileIdx db ; $18
    b19 ds $27-$19
    health db ; $27
    weaknessesIdx db ; $28
    b29 ds $40-$29
    sizeof .db
.endst

.struct StageItemEntity
    enabled db ; $00
    state db ; $01
    substate db ; $02
    subsubstate db ; $03
    subX db ; $04
    x dw ; $05/$06
    subY db ; $07
    y dw ; $08/$09
    itemType db ; $0a determines ItemUpdateFuncs entry idx
    param db ; $0b eg flag to check
    bc ds $12-$c
    b12 db ; determines Func_2_d65b function
    b13 ds 6-3
    spriteIdx db ; $16
    celIdx db ; $17
    tileIdxBase db ; $18
    b19 ds $30-$19
    sizeof .db
.endst

.struct _10d8_Entity
    enabled db ; $00
    state db ; $01
    substate db ; $02
    b3 ds $a-3
    type db ; $0a
    bb ds $40-$b
    sizeof .db
.endst

.struct _1818_Entity
    enabled db ; $00
    state db ; $01
    substate db ; $02
    subsubstate db ; $03
    b4 ds 5-4
    x dw ; $05/$06
    b7 ds 8-7
    y dw ; $08/$09
    type db ; $0a
    subType db ; $0b
    bc ds $20-$c
    sizeof .db
.endst

.struct _1d18_Entity
    enabled db ; $0
    state db ; $01
    substate db ; $02
    b3 ds 5-4
    subX db ; $4
    x dw ; $5/$6
    subY db ; $7
    y dw ; $8/$9
    type db ; $a
    param db ; $b
    bc ds $10-$c
    sizeof .db
.endst

.struct BuildOamController
    numSprites db ; $0
    stageScrollX dw ; $1/$2
    stageScrollY dw ; $3/$4
    b5 ds 7-5
    oamOffsetToFill dw ; $7/$8
    b9 db
.endst

.struct SpriteToBuild
    b0 ds 5-0
    baseTileIdx db ; $5
    b6 db
    spriteSpecAddr dl ; $7/$8/$9
.endst