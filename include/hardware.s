INIDISP = $2100 ; Screen Display Register
OAMADDL = $2102 ; OAM Address Registers (Low)
OAMADDH = $2103 ; OAM Address Registers (Low)
OAMDATA = $2104 ; OAM Data Write Register
BGMODE = $2105 ; BG Mode and Character Size Register
MOSAIC = $2106 ; Mosaic Register
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
M7A = $211b ; Mode 7 Matrix Registers
M7B = $211c ; Mode 7 Matrix Registers
CGADD = $2121 ; CGRAM Address Register
CGDATA = $2122 ; CGRAM Data Write Register
W12SEL = $2123 ; Window Mask Settings Registers
W34SEL = $2124 ; Window Mask Settings Registers
WOBJSEL = $2125 ; Window Mask Settings Registers
TM = $212c ; Screen Destination Registers
TS = $212d ; Screen Destination Registers
CGWSEL = $2130 ; Color Math Registers
CGADSUB = $2131 ; Color Math Registers
COLDATA = $2132 ; Color Math Registers
APUIO0 = $2140 ; APU IO Registers
APUIO1 = $2141 ; APU IO Registers
APUIO2 = $2142 ; APU IO Registers
APUIO3 = $2143 ; APU IO Registers
WMDATA = $2180 ; WRAM Data Register
WMADDL = $2181 ; WRAM Address Registers
WMADDM = $2182 ; WRAM Address Registers
WMADDH = $2183 ; WRAM Address Registers

NMITIMEN = $4200 ; Interrupt Enable Register
NMI_ENABLE = $80
IRQ_ENABLE_3 = $30
AUTO_JOYPAD_READ_ENABLE = $01

WRMPYA = $4202 ; Multiplicand Registers
WRMPYB = $4203 ; Multiplicand Registers
WRDIVL = $4204 ; Divisor & Dividend Registers
WRDIVH = $4205 ; Divisor & Dividend Registers
WRDIVB = $4206 ; Divisor & Dividend Registers
HTIMEL = $4207 ; IRQ Timer Registers (Horizontal - Low)
HTIMEH = $4208 ; IRQ Timer Registers (Horizontal - High)
VTIMEL = $4209 ; IRQ Timer Registers (Vertical - Low)
VTIMEH = $420a ; IRQ Timer Registers (Vertical - High)
MDMAEN = $420b ; DMA Enable Register
HDMAEN = $420c ; HDMA Enable Register
RDNMI = $4210 ; Interrupt Flag Registers
TIMEUP = $4211 ; Interrupt Flag Registers
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
DMAP1 = $4310 ; DMA Control Register

BBAD0 = $4301 ; DMA Destination Register
A1T0L = $4302 ; DMA Source Address Registers
A1T0H = $4303 ; DMA Source Address Registers
A1B0 = $4304 ; DMA Source Address Registers
DAS0L = $4305 ; DMA Size Registers (Low)
DAS0H = $4306 ; DMA Size Registers (High)
DASB0 = $4307 ; HDMA Indirect Address Registers

BBAD1 = $4311 ; DMA Destination Register
A1T1L = $4312 ; DMA Source Address Registers
A1T1H = $4313 ; DMA Source Address Registers
A1B1 = $4314 ; DMA Source Address Registers
DAS1L = $4315 ; DMA Size Registers (Low)
DAS1H = $4316 ; DMA Size Registers (High)

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
CX4_R5 = $7f8f ; l
CX4_R6 = $7f92 ; l
CX4_R7 = $7f95 ; l
CX4_R8 = $7f98 ; l
CX4_R9 = $7f9b ; l
CX4_RA = $7f9e ; l
CX4_RB = $7fa1 ; l
CX4_RC = $7fa4 ; l
CX4_RD = $7fa7 ; l
CX4_RE = $7faa ; l
CX4_RF = $7fad ; l

; 100000h*Sqrt(00h..FFh)
CX4_SQRT_TABLE = $100 ; to $1ff
; 1000000h*Sin(0..89')
CX4_SIN_TABLE = $200 ; to $27f
; 1000000h*Cos(0..89')
CX4_COS_TABLE = $380

; MISC

ACCU_8 = $20
IDX_8 = $10
F_DECIMAL = $08
F_ZERO = $02
F_CARRY = $01
BANK_START = $8000
ROM_CHECKSUM = $00ffde