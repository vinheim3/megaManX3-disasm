.memorymap
	defaultslot 3

	slotsize $2000
	slot 0 $0000

	slotsize $e000
	slot 1 $2000

	slotsize $2000
	slot 2 $6000

	slotsize $8000
	slot 3 $8000
.endme

.banksize $8000
.rombanks 64

.asciitable
.enda

.base $00

.snesheader
	id "AR3E"
	name "MEGAMAN X3           "
	slowrom
	lorom
	cartridgetype $f3
	romsize $0b
	sramsize $00
	country $01
	version $00
.endsnes

.snesnativevector
	COP $1ffb
	BRK $1ffb
	ABORT $1ffb
	NMI $1ff3
	UNUSED $1ffb
	IRQ $1ff7
.endnativevector

.snesemuvector
	COP    $1ffb
	UNUSED $1ffb
	ABORT  $1ffb
	NMI    $1ffb
	RESET  ResetVector
	IRQBRK $1ffb
.endemuvector