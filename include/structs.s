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

.struct StageEnemyEntity
    enabled db ; $00
    b1 ds $27-1
    health db ; $27
    b28 ds $40-$28
    sizeof .db
.endst

.struct StageItemEntity
    enabled db ; $00
    state db ; $01
    substate db ; $02
    b3 ds 5-3
    x dw ; $5/$6
    b7 db
    y dw ; $8/$9
    itemType db ; determines Funcs_0_f49b entry idx
    param db ; $b eg flag to check
    bc ds $12-$c
    b12 db ; determines Func_2_d65b function
    b13 ds 6-3
    spriteIdx db ; $16
    celIdx db ; $17
    tileIdxBase db ; $18
    b19 ds $30-$19
    sizeof .db
.endst

.struct _1818_Entity
    enabled db ; $00
    state db ; $01
    b2 ds $20-2
    sizeof .db
.endst

.struct _1d18_Entity
    enabled db ; $0
    state db ; $01
    substate db ; $02
    b3 ds 5-3
    x dw ; $5/$6
    b7 db
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