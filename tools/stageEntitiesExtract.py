import clipboard
from util import getRom, bankAddr, stringB

data = getRom()
start = bankAddr(0x3c, 0xe888)
end = bankAddr(0x3c, 0xec8d)

comps = []
while 1:
    colX = data[start]
    start += 1
    comps.append(stringB([colX]))
    if start >= end:
        break
    while 1:
        bs = data[start:start+7]
        start += 7
        comps.append(stringB(bs))
        if bs[-1] & 0x80:
            break

final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)
