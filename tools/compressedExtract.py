from collections import defaultdict
import clipboard
from util import getRom, bankAddr, wordIn

data = getRom()
addrs = set()
addrImap = defaultdict(list)
for i in range(221):
    word = wordIn(data, bankAddr(6, i*5+0xf732))
    bank = data[bankAddr(6, i*5+0xf734)]

    addr = bankAddr(bank, word)
    addrs.add(addr)
    addrImap[addr].append(f"CompressedData_{i:02x}:")

addrs = sorted(addrs)
addrs.append(bankAddr(0x2b, 0x8470))
byteMap = {}
for i, addr in enumerate(addrs[:-1]):
    nextAddr = addrs[i+1]
    bs = data[addr:nextAddr]
    byteMap[addr] = {
        'len': len(bs),
        'labels': '\n'.join(addrImap[addr]),
    }
    with open(f'data/compressed_{addr:06x}.bin', 'wb') as f:
        f.write(bs)

comps = []
bank = 0x1a
srcoffs = 0

def bankStr(bank):
    return f".bank ${bank:03x} slot 1\n.org $0"

for addr, deets in byteMap.items():
    byteLen = deets['len']
    labels = deets['labels']
    end = srcoffs + byteLen
    if end >= 0x8000:
        part1len = 0x8000 - srcoffs
        comps.append(f'{labels}\n\t.incbin "data/compressed_{addr:06x}.bin" READ ${part1len:04x}')
        bank += 1
        comps.append(bankStr(bank))
        comps.append(f'\t.incbin "data/compressed_{addr:06x}.bin" SKIP ${part1len:04x}')
    else:
        comps.append(f'{labels}\n\t.incbin "data/compressed_{addr:06x}.bin"')
    srcoffs = end % 0x8000

final_str = '\n\n'.join(comps)
print(final_str)
clipboard.copy(final_str)
