OAMADDL = $2102 ; OAM Address Registers (Low)
OAMADDH = $2103 ; OAM Address Registers (Low)
OAMDATA = $2104 ; OAM Data Write Register
BG1SC = $2107 ; BG Tilemap Address Registers (BG1)
BG2SC = $2108 ; BG Tilemap Address Registers (BG2)
BG3SC = $2109 ; BG Tilemap Address Registers (BG3)
BG12NBA = $210b ; BG Character Address Registers (BG1&2)
BG34NBA = $210c ; BG Character Address Registers (BG3&4)
BG1HOFS = $210d ; BG Scroll Registers (BG1)
BG1VOFS = $210e ; BG Scroll Registers (BG1)
BG2HOFS = $210f ; BG Scroll Registers (BG2)
BG2VOFS = $2110 ; BG Scroll Registers (BG2)
BG3HOFS = $2111 ; BG Scroll Registers (BG3)
BG3VOFS = $2112 ; BG Scroll Registers (BG3)

; Bit 7 - set: inc after writing $2119, or reading $213a
;       - clear: inc after writing $2118, or reading $2139
VMAIN = $2115 ; Video Port Control Register
VMAIN_INC_AFTER_2ND_BYTE = $80

VMADDL = $2116 ; VRAM Address Registers (Low)
VMADDH = $2117 ; VRAM Address Registers (High)
VMDATAL = $2118 ; VRAM Data Write Registers (Low)
VMDATAH = $2119 ; VRAM Data Write Registers (High)
CGADD = $2121 ; CGRAM Address Register
CGDATA = $2122 ; CGRAM Data Write Register
APUIO0 = $2140 ; APU IO Registers
APUIO1 = $2141 ; APU IO Registers
APUIO2 = $2142 ; APU IO Registers
APUIO3 = $2143 ; APU IO Registers

NMITIMEN = $4200 ; Interrupt Enable Register
NMI_ENABLE = $80
IRQ_ENABLE_3 = $30
AUTO_JOYPAD_READ_ENABLE = $01

WRMPYA = $4202 ; Multiplicand Registers
WRMPYB = $4203 ; Multiplicand Registers
WRDIVL = $4204 ; Divisor & Dividend Registers
WRDIVH = $4205 ; Divisor & Dividend Registers
WRDIVB = $4206 ; Divisor & Dividend Registers
MDMAEN = $420b ; DMA Enable Register
HDMAEN = $420c ; HDMA Enable Register
RDNMI = $4210 ; Interrupt Flag Registers
HVBJOY = $4212 ; PPU Status Register
RDDIVL = $4214 ; Multiplication Or Divide Result Registers (Low)
RDMPYL = $4216 ; Multiplication Or Divide Result Registers (Low)
JOY1L = $4218 ; Controller Port Data Registers (Pad 1 - Low)
JOY1H = $4219 ; Controller Port Data Registers (Pad 1 - High)
JOY2L = $421a ; Controller Port Data Registers (Pad 2 - Low)
JOY2H = $421b ; Controller Port Data Registers (Pad 2 - High)

; Bit 7 - set: PPU to CPU. clear: CPU to PPU
; Bit 6 - set: src has pointers to data. clear: src has data
; Bit 4 - set: dec after bytes. clear: inc after bytes
; Bit 3 - set: bit 4 does not take effect. clear: bit 4 takes effect
; Bits 2-0 - transfer mode:
;   - 000 - 1 register write once
;   - 001 - 2 registers write once
DMAP0 = $4300 ; DMA Control Register

BBAD0 = $4301 ; DMA Destination Register
A1T0L = $4302 ; DMA Source Address Registers
A1T0H = $4303 ; DMA Source Address Registers
A1B0 = $4304 ; DMA Source Address Registers
DAS0L = $4305 ; DMA Size Registers (Low)
DAS0H = $4306 ; DMA Size Registers (High)

; CX4

CX4_RAM_START = $6000

CX4_DMA_SOURCE = $7f40 ; l
CX4_DMA_LEN = $7f43 ; w
CX4_DMA_DEST = $7f45 ; w
CX4_DMA_START = $7f47 ; b
CX4_UNK_TOGGLE = $7f48 ; b
CX4_PRG_ROM_BASE = $7f49 ; l
CX4_UNK_7F4C = $7f4c ; b

; PC/$200
CX4_PRG_ROM_INS_PAGE = $7f4d ; w
; PC/2
CX4_PRG_ROM_INS_POINTER = $7f4f ; b

CX4_UNK_7F50 = $7f50 ; w
CX4_UNK_7F52 = $7f52

CX4_STATUS = $7f5e ; b
CX4F_BUSY = $40

CX4_SNES_NMI_VECTOR = $7f6a ; w
CX4_SNES_IRQ_VECTOR = $7f6e ; w

CX4_R0 = $7f80 ; l
CX4_R1 = $7f83 ; l
CX4_R2 = $7f86 ; l
CX4_R3 = $7f89 ; l
CX4_R4 = $7f8c ; l
CX4_R6 = $7f8f ; l
CX4_R7 = $7f92 ; l
CX4_R8 = $7f95 ; l
CX4_R9 = $7f98 ; l
CX4_RA = $7f9b ; l
CX4_RB = $7f9e ; l
CX4_RC = $7fa1 ; l
CX4_RD = $7fa4 ; l

; 100000h*Sqrt(00h..FFh)
CX4_SQRT_TABLE = $100 ; to $1ff
; 1000000h*Sin(0..89')
CX4_SIN_TABLE = $200 ; to $27f

; MISC

ACCU_8 = $20
IDX_8 = $10
F_DECIMAL = $08
F_ZERO = $02
F_CARRY = $01
BANK_START = $8000
ROM_CHECKSUM = $00ffde