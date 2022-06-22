from collections import defaultdict
import clipboard
from util import bankAddr, getRom, wordIn, stringB

data = getRom()
comps = []
tblName = 'Data_8_8623'
stagePrefix = 'DynamicSpritesStage'
base = bankAddr(8, 0x8623)

# Extract pointers to 'stages'
start = base
stageOffsets = []
for i in range(0x12):
    stageOffsets.append(wordIn(data, start))
    start += 2
    comps.append(f"\t.dw {stagePrefix}{i:02x}-{tblName}")
stageOffsets.append(0x8865-0x8623)

# Extract pointers to 'dynamic idxes'
fullDynamicIdxesOffs = []
offsToStageIdxMap = defaultdict(list)
for i, offs in enumerate(stageOffsets[:-1]):
    comps.append(f"\n\n{stagePrefix}{i:02x}:")
    j = 0
    start = base+offs
    end = base+stageOffsets[i+1]
    while start+j*2 < end:
        idxOffs = wordIn(data, start+j*2)
        fullDynamicIdxesOffs.append(idxOffs)
        offsToStageIdxMap[idxOffs].append([i, j])
        comps.append(f"\t.dw {stagePrefix}{i:02x}Idx{j:02x}-{tblName}")
        j += 1

fullOffs = sorted(set(fullDynamicIdxesOffs))
fullOffs.append(0xbc8 + 7)

# Extract data
for i, offs in enumerate(fullOffs[:-1]):
    labels = sorted(offsToStageIdxMap[offs])
    comps.append('\n')
    for stage, dynIdx in labels:
        comps.append(f"{stagePrefix}{stage:02x}Idx{dynIdx:02x}:")
    bs = data[base+offs:base+fullOffs[i+1]]

    j = 0
    while j < len(bs):
        if j != 0:
            comps.append('')
        b = bs[j]
        comps.append(f"\t.db ${b:02x}")
        j += 1
        if b == 0xff:
            break

        w = wordIn(bs, j)
        comps.append(f"\t.dw ${w:04x}")
        j += 2
        w = wordIn(bs, j)
        comps.append(f"\t.dw ${w:04x}")
        j += 2
        b = bs[j]
        comps.append(f"\t.db ${b:02x}")
        j += 1

# Final
final_str = '\n'.join(comps)
print(final_str)
clipboard.copy(final_str)