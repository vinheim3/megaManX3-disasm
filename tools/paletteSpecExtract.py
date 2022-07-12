from collections import defaultdict
import json

import clipboard

from util import getRom, bankAddr, stringW, wordIn, groupBytes

data = getRom()

addrs = []
specMap = defaultdict(list)
start = bankAddr(6, 0x8180)
for i in range(0x100):
    addr = bankAddr(6, wordIn(data, start))
    specMap[addr].append(i)
    addrs.append(addr)
    start += 2

saddrs = sorted(set(addrs))

saddrs.append(bankAddr(6, 0x87f4))
comps = []
for i in range(0x100):
    comps.append(f'\t.dw PaletteSpec_{i:02x}')
comps.append('')

colorsForPalAddr = defaultdict(int)
palAddrs = []

for i, addr in enumerate(saddrs[:-1]):
    specs = specMap.get(addr, [])
    for spec in sorted(specs):
        comps.append(f'PaletteSpec_{spec:02x}:')

    maxLoops = 1000
    nextAddr = saddrs[i+1]
    while maxLoops != 0:
        numBytes = data[addr]
        comps.append(f'\t.db ${numBytes:02x}')
        addr += 1

        if addr >= nextAddr:
            break

        maxLoops -= 1
        palAddr = wordIn(data, addr)
        comps.append(f'\t.dw PaletteData_c_{palAddr:04x}')
        addr += 2

        bPalAddr = bankAddr(0x0c, palAddr)
        colorsForPalAddr[bPalAddr] = max(colorsForPalAddr[bPalAddr], numBytes*2)
        palAddrs.append(bPalAddr)

        palOffs = data[addr]
        comps.append(f'\t.db ${palOffs:02x}')
        addr += 1
        comps.append('')

    comps.append('')

# NOTE: palettespec_45 points to 00 at the end of spec_44

# final_str = '\n'.join(comps)
# print(final_str)
# clipboard.copy(final_str)

def get_word_comps(bs):
    # return a list of stringW data
    groups = groupBytes(bs, 32)
    ret = []
    for group in groups:
        words = []
        i = 0
        while i < len(group):
            words.append(group[i]|(group[i+1]<<8))
            i += 2
        ret.append(stringW(words))
    return ret

comps = []
usedAddrs = [
    0xb180,
    0xb1a0,
    0xb4a0,
    0xb4c0,
    0xb5c0,
]
sPalAddrs = sorted(set(palAddrs))
sPalAddrs.append(bankAddr(0x0c, 0xf3e8))
for i, palAddr in enumerate(sPalAddrs[:-1]):
    printed_addr = (palAddr % 0x8000) + 0x8000
    comps.append(f'PaletteData_c_{printed_addr:04x}:')
    numBytes = colorsForPalAddr[palAddr]
    assert numBytes % 32 == 0
    nextAddr = sPalAddrs[i+1]
    if palAddr + numBytes < nextAddr:
        for line in get_word_comps(data[palAddr:palAddr+numBytes]):
            comps.append(line)
            usedAddrs.append(printed_addr)
            printed_addr += 0x20
        comps.append('; Unused colours')
        for line in get_word_comps(data[palAddr+numBytes:nextAddr]):
            comps.append(line)
    elif palAddr + numBytes == nextAddr:
        for line in get_word_comps(data[palAddr:palAddr+numBytes]):
            comps.append(line)
            usedAddrs.append(printed_addr)
            printed_addr += 0x20
    else:
        for line in get_word_comps(data[palAddr:nextAddr]):
            comps.append(line)
            usedAddrs.append(printed_addr)
            printed_addr += 0x20
        overfill = (palAddr + numBytes) - nextAddr
        comps.append(f'; Carries on for ${overfill:02x} bytes')
    comps.append('')


# final_str = '\n'.join(comps)
# print(final_str)
# clipboard.copy(final_str)

with open('usedAddrs.json', 'w') as f:
    f.write(json.dumps(usedAddrs, indent=2))
