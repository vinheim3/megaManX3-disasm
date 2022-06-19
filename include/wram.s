.include "includes.s"

.ramsection "WRAM" bank 0 slot 0

w00:
    ds $30

; -8 as the last 8 bytes are unused
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

w68:
    ds $10-8

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

wa1:
    ds 4-1

wBulkDmaStructOffsetToFill: ; $a4
    db

wa5:
    ds 6-5

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

wb4:
    ds $c3-$b4

wIntsEnabled: ; $c3
    db

wc4:
    ds $e9-$c4

wtodo_WordIdxInto_740_struct: ; $e9
    db

wea:
    ds $f5-$ea

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
    ds $9cb-$ff

wMainLoopCounter: ; $09cb
    db

w09cc:
    ds $e-$c

wNmiVectorHandled: ; $09ce
    db

w09cf:
    ds $ff-$cf

wCurrHealth: ; $09ff
    db

w0a00:
    ds $e-0

wDashAndSelCurrBtnsHeld: ; $0a0e
    db

wJumpShotMenuDirCurrBtnsHeld: ; $0a0f
    db

wDashAndSelPrevBtnsHeld: ; $0a10
    db

wJumpShotMenuDirPrevBtnsHeld: ; $0a11
    db

wDashAndSelCurrBtnsPressed: ; $0a12
    db

wJumpShotMenuDirCurrBtnsPressed: ; $0a13
    db

w0a14:
    ds $1d18-$a14

w1d18_Entities: ; $1d18
    ds _1d18_Entity.sizeof * NUM_1D18_ENTITIES
@end:
    .db

w1e18:
    ds $5d-$18

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
    ds $ae-$19

; 1 - top-left stage, 7 - tunnel rhino, etc
; 18 in total
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
; Bit 1 set:
; Bit 0 set:
wHealthTanksGottenBitfield: ; $1fd4
    db

w1fd5:
    ds 7-5

; Bit 7 set: leg chip
; Bit 6 set: body chip
; Bit 5 set: arm chip
; Bit 4 set: head chip
; Bit 3 set: frog armor
; Bit 2 set: hawk armor
; Bit 1 set: kangaroo armor
; Bit 0 set: chimera armor
wChipsAndRideArmorsGottenBitfield: ; $1fd7
    db

w1fd8:
    ds $ec-$d8

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

w26af:
    ds $f000-$26af

; Sequences of:
; vmain - b
; vram dest addr - w
; num bytes - b
; after is the bytes
wTilemapDmaStructs: ; $f000
    .db

wf000:
    ds $fc0-0

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
    .db

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