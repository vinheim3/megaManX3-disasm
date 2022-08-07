.include "includes.s"

.ramsection "WRAM" bank 0 slot 0

w00:
    ds $30

wThreads: ; $30
    .db

wThread0: ; $30
    instanceof Thread

w38:
    ds $10-8

wThread1: ; $40
    instanceof Thread

wCurrSpriteDecompDestAddrOffs: ; $48
    dw

w4a:
    ds $10-$a

wThread2: ; $50
    instanceof Thread

w58:
    ds $10-8

wThread3: ; $60
    instanceof Thread

wTextByteSrcAddr: ; $68
    dw

wTextRowVramAddr: ; $6a
    dw

wTextColOffset: ; $6c
    dw

wTextCurrTileAttr: ; $6e
    db

wTextFramesWaitPerChar: ; $6f
    db

wThread4: ; $70
    instanceof Thread

w78:
    ds $10-8

wThread5: ; $80
    instanceof Thread

w88:
    ds $10-8

wThread6: ; $90
    instanceof Thread

wDecompressDataIdx: ; $98
    db

w99:
    ds $a0-$99

wCurrThread: ; $a0
    db

wShouldUpdateCGRAM: ; $a1
    db

wa2:
    ds 4-2

; todo: detail 500+ struct
wBulkDmaStructOffsetToFill: ; $a4
    db

; todo: detail 600+ struct
wMiniDmaStructOffsetToFill: ; $a5
    db

wTilemapDmaStructAddrAfterEnd: ; $a6
    dw

wJoy1CurrButtonsHeld: ; $a8
    dw

wJoy1PrevBtnsHeld: ; $aa
    dw

wJoy1CurrBtnsPressed: ; $ac
    dw

wJoy2CurrButtonsHeld: ; $ae
    dw

wJoy2PrevBtnsHeld: ; $b0
    dw

wJoy2CurrBtnsPressed: ; $b2
    dw

wScreenDisplay: ; $b4
    db

wBG1HorizScroll: ; $b5
    dw

wBG1VertScroll: ; $b7
    dw

wBG2HorizScroll: ; $b9
    dw

wBG2VertScroll: ; $bb
    dw

wBG3HorizScroll: ; $bd
    dw

wBG3VertScroll: ; $bf
    dw

wMainScreenDesignation: ; $c1
    db

wSubScreenDesignation: ; $c2
    db

wIntsEnabled: ; $c3
    db

wc4:
    ds 5-4

wW12SEL: ; $c5
    db

wW34SEL ; $c6
    db

wBG34NBA: ; $c7
    db

wOBJSEL ; $c8
    db

wColourAdditionSelect: ; $c9
    db

wColourMathDesignation: ; $ca
    db

wRedColourIntensity: ; $cb
    db

wGreenColourIntensity: ; $cc
    db

wBlueColourIntensity: ; $cd
    db

wBG3SC: ; $ce
    db

wBGMode: ; $cf
    db

wd0:
    ds $e9-$d0

wtodo_WordIdxInto_740_struct: ; $e9
    db

wtodo_WordIdxInto_780_struct: ; $ea
    db

web:
    ds $f5-$eb

wDecompressionInProgress: ; $f5
    db

wDecompressionSrc: ; $f6
    dl

wDecompressionDestAddr: ; $f9
    dw

wDecompressionTotalBytesLeft: ; $fb
    dw

wDecompressionCtrlByte: ; $fd
    db

wDecompressionCtrlBitsLeft: ; $fe
    db

wff:
    ds $300-$ff

wColourRam ; $0300
    ds $200

; Fills up the $100 bytes below
wBulkDmaStructs: ; $500
    instanceof BulkDmaStruct
w0508:
    ds $100-8

wMiniDmaStructs: ; $600
    instanceof MiniDmaStruct

w0700:
    ds $9cb-$700

wMainLoopCounter: ; $09cb
    db

w09cc:
    ds $e-$c

wNmiVectorHandled: ; $09ce
    db

wFrameCounter: ; $09cf
    db

w09d0:
    ds $d8-$d0

; todo: unknown size (speculation)
wPlayerEntity: ; $09d8
    instanceof PlayerEntity

w0a88:
    ds $cc8-$a88

; todo: unknown size (speculation)
wRiderArmourEntity: ; $0cc8
    instanceof GenericEntity

w0ce8:
    ds $d18-$ce8

.union

    wEnemyEntities: ; $0d18
        ds StageEnemyEntity.sizeof * NUM_ENEMY_ENTITIES

.nextu

; todo: this is part of a d18 entity

    w0d18:
        ds $4f-$18

    wBeatenStageIdx: ; $0d4f
        db

.endu

w10d8_Entities: ; $10d8
    ds _10d8_Entity.sizeof * NUM_10D8_ENTITIES

; todo: enemy projectiles??
w1318:
    ds $518-$318

wItemEntities: ; $1518
    ds StageItemEntity.sizeof * NUM_ITEM_ENTITIES

w1818_Entities: ; $1818
    ds _1818_Entity.sizeof * NUM_1818_ENTITIES

w1d18_Entities: ; $1d18
    ds _1d18_Entity.sizeof * NUM_1D18_ENTITIES

w1e18:
    ds $58-$18

wCameraEntity: ; $1e58
    ds $d-8

; High byte - x room idxed 1
; Loq byte - scroll x within room
; todo: other weird vals written here
wNewStageScrollX: ; $1e5d
    dw

w1e5f:
    ds $60-$5f

wNewStageScrollY: ; $1e60
    dw

w1e62:
    ds $7a-$62

wPrevStageScrollX: ; $1e7a
    dw

wPrevStageScrollY: ; $1e7c
    dw

w1e7e:
    ds $f18-$e7e

wDynamicSpriteTileDatasIdx: ; $1f18
    db

w1f19:
    ds $36-$19

wStartTeleingPlayerOutOfStage: ; $1f36
    db

w1f37:
    ds $46-$37

wCurrTextIdx: ; $1f46
    db

w1f47:
    ds $5e-$47

wTextTilesPriorityIf40h: ; $1f5e
    db

w1f5f:
    ds $ad-$5f

wMosaic: ; $1fad
    db

; $1-$8 - stages from left-right, up-down
; $9 - vile area
; $c - has bit/byte cutscene
; $12 in total
wStageIdx: ; $1fae
    db

w1faf:
    ds $b4-$af

wNumLives: ; $1fb4
    db

w1fb5:
    ds 7-5

; Bit 7: set if gotten
wSubTanksStatus: ; $1fb7
    ds 4

w1fbb:
    ds $c-$b

; Bit 6 set on low byte: weapon acquired
; 0 - acid burst
; 1 - parasitic bomb
; 2 - triad thunder
; 3 - spinning blade
; 4 - ray splasher
; 5 - gravity well
; 6 - frost shield
; 7 - tornado fang
; 8 - hyper charge
wtodo_SubweaponsStatus: ; $1fbc
    ds 9*2

w1fce:
    ds $d1-$ce

; Bit 7 set: neon tiger sub tank
; Bit 6 set: tunnel rhino sub tank
; Bit 5 set: volt catfish sub tank
; Bit 4 set: blizzard buffalo sub tank
; Bit 3 set: leg upgrade
; Bit 2 set: body upgrade
; Bit 1 set: arm upgrade
; Bit 0 set: helmet upgrade
wSubTanksAndUpgradesGottenBitfield: ; $1fd1
    db

wMaxHealth: ; $1fd2
    db

w1fd3:
    ds 4-3

; Bit 7 set: neon tiger
; Bit 6 set: tunnel rhino
; Bit 5 set: crush crawfish
; Bit 4 set: volt catfish
; Bit 3 set: toxic seahorse
; Bit 2 set: gravity beetle
; Bit 1 set: blizzard buffalo
; Bit 0 set: blast hornet
wHealthTanksGottenBitfield: ; $1fd4
    db

w1fd5:
    ds 6-5

; Used due to StageSelectItemTextIdxes having 9 bytes per stage
wStageTimes9: ; $1fd6
    db

; Bit 7 set: leg chip
; Bit 6 set: body chip
; Bit 5 set: arm chip
; Bit 4 set: head chip
; Bit 3 set: frog armour
; Bit 2 set: hawk armour
; Bit 1 set: kangaroo armour
; Bit 0 set: chimera armour
wChipsAndRideArmoursGottenBitfield: ; $1fd7
    db

w1fd8:
    ds $d-8

; todo: used in other places
wXVectorTileDataUpdatePending: ; $1fdd
    db

w1fde:
    ds $ec-$de

wBaseMetatiles7ehRamSrcAddr: ; $1fec
    dw

wCurrMetatileTilesTableSrc: ; $1fee
    dl

wStageRooms7ehSrcAddr: ; $1ff1
    dw

.ends

.ramsection "Bank $7e" bank $7e slot 1

w7e2000:
    ds $6a0

wCx4Routines: ; $26a0
    .db
; A - prg rom instruction page (PC/$200)
; X - unknown toggle val
; Y - prg rom instruction pointer (PC/2)
wSetCx4InsPagePtrAndToggle: ; $26a0
    ds 3
; A - prg rom instruction page (PC/$200)
; Y - prg rom instruction pointer (PC/2)
wSetCx4InsPagePtrWithIntsDisabled: ; $26a3
    ds 3
; A - prg rom instruction page (PC/$200)
; X - unknown toggle val
wSetCx4InsPageWithIntsDisabled: ; $26a6
    ds 3
; A - 0 to transfer from SNES to Cx4
wStartCx4Dma: ; $26a9
    ds 3
; A - prg rom instruction pointer (PC/2)
wStartCx4PrgExecution: ; $26ac
    ds 3
wSetCx4InsPageWithIntsEnabled: ; $26af
    ds 3
wSetCx4InsPagePtrWithIntsEnabled: ; $26b2
    ds 3

; todo: rest of cx4 code ehre
w26b5:
    ds $f000-$26b5

; Sequences of:
; vmain - b
; vram dest addr - w
; num bytes - b
; after is the bytes
wTilemapDmaStructs: ; $f000
    .db

wf000:
    ds $800-0

wStage20hColumnPointersToEntityData: ; $f800
    ds $202

wfa02:
    ds $fc0-$a02

wShotBtnMapped: ; $ffc0
    db

wJumpBtnMapped: ; $ffc1
    db

wDashBtnMapped: ; $ffc2
    db

wSelectLBtnMapped: ; $ffc3
    db

wSelectRBtnMapped: ; $ffc4
    db

wMenuBtnMapped: ; $ffc5
    db

.ends

.ramsection "Bank $7f" bank $7f slot 1

w7f2000:
    ds $8200-$2000

; todo: unknown size
wMapFromDecompDataIdxToBaseTileIdx: ; $8200
    ds $100

; todo: unknown size
wMapFromDecompDataIdxTo8plusColours: ; $8300
    ds $100

w7f8400:
    ds $cfff-$8400

wChipCapsuleUnavailReason: ; $cfff
    db

.ends

.ramsection "Cx4 RAM" bank $00 slot 2

wOam: ; $6000
    ds $220

; todo: unknown size, $10-bytes each
wSpritesToBuild: ; $6220
    .db

w6220:
    ds $620-$220

wBuildOamController: ; $6620
    instanceof BuildOamController

.ends