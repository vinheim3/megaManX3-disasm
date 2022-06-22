import clipboard
from util import getRom, bankAddr, stringB

data = getRom()
start = bankAddr(0x3c, 0xfbd2)

comps = []
prevColX = None
while 1:
    colX = data[start]
    start += 1
    comps.append(stringB([colX]))
    if colX == prevColX:
        break
    prevColX = colX
    while 1:
        bs = data[start:start+7]
        start += 7
        comps.append(stringB(bs))
        if bs[-1] & 0x80:
            break

final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)
print(hex((start%0x8000)+0x8000))