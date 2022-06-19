from util import getRom, bankAddr, wordIn

start = bankAddr(2, 0x8000)
data = getRom()[start:start+0x2000]

insMap = {
    0x00: 'noop',
    0x08: 'jp <addr>',
    0x0a: 'fjp <p_addr>',
    0x0c: 'jz <addr>',
    0x0e: 'fjz <p_addr>',
    0x10: 'jc <addr>',
    0x12: 'fjc <p_addr>',
    0x14: 'js <addr>',
    0x16: 'fjs <p_addr>',
    0x1c: 'finish_ext_dta',
    0x2500: 'skipnc',
    0x2501: 'skipc',
    0x2600: 'skipnz',
    0x2601: 'skipz',
    0x2700: 'skipns',
    0x2701: 'skips',
    0x28: 'call <addr>',
    0x2A: 'fcall <p_addr>',
    0x2c: 'callz <addr>',
    0x2e: 'fcallz <p_addr>',
    0x30: 'callc <addr>',
    0x32: 'fcallc <p_addr>',
    0x34: 'calls <addr>',
    0x36: 'fcalls <p_addr>',
    0x3c: 'ret',
    0x40: 'inc_ext_ptr',
    0x48: '_cmp <op>, A',
    0x49: '_cmp <op>, _2A',
    0x4a: '_cmp <op>, _100hA',
    0x4b: '_cmp <op>, _10000hA',
    0x4c: '_cmp <imm>, A',
    0x4d: '_cmp <imm>, _2A',
    0x4e: '_cmp <imm>, _100hA',
    0x4f: '_cmp <imm>, _10000hA',
    0x50: '_cmp A, <op>',
    0x51: '_cmp _2A, <op>',
    0x52: '_cmp _100hA, <op>',
    0x53: '_cmp _10000hA, <op>',
    0x54: '_cmp A, <imm>',
    0x55: '_cmp _2A, <imm>',
    0x56: '_cmp _100hA, <imm>',
    0x57: '_cmp _10000hA, <imm>',
    0x59: 'extsb A',
    0x5a: 'extsw A',
    0x60: 'mov A, <op>',
    0x61: 'mov ext_dta, <op>',
    0x63: 'mov P, <op>',
    0x64: 'mov A, <imm>',
    0x67: 'mov P, <imm>',
    0x68: 'rdram lsb, <op>',
    0x69: 'rdram mid, <op>',
    0x6a: 'rdram msb, <op>',
    0x6c: 'rdram lsb, <imm>',
    0x6d: 'rdram mid, <imm>',
    0x6e: 'rdram msb, <imm>',
    0x70: 'rdrom <op>',
    0x78: 'mov PL, <op>',
    0x79: 'mov PH, <op>',
    0x7c: 'mov PL, <imm>',
    0x7d: 'mov PH, <imm>',
    0x80: 'add A, <op>',
    0x81: 'add _2A, <op>',
    0x82: 'add _100hA, <op>',
    0x83: 'add _10000hA, <op>',
    0x84: 'add A, <imm>',
    0x85: 'add _2A, <imm>',
    0x86: 'add _100hA, <imm>',
    0x87: 'add _10000hA, <imm>',
    0x88: 'sub <op>, A',
    0x89: 'sub <op>, _2A',
    0x8a: 'sub <op>, _100hA',
    0x8b: 'sub <op>, _10000hA',
    0x8c: 'sub <imm>, A',
    0x8d: 'sub <imm>, _2A',
    0x8e: 'sub <imm>, _100hA',
    0x8f: 'sub <imm>, _10000hA',
    0x90: 'sub A, <op>',
    0x91: 'sub _2A, <op>',
    0x92: 'sub _100hA, <op>',
    0x93: 'sub _10000hA, <op>',
    0x94: 'sub A, <imm>',
    0x95: 'sub _2A, <imm>',
    0x96: 'sub _100hA, <imm>',
    0x97: 'sub _10000hA, <imm>',
    0x98: 'mul <op>',
    0x9c: 'mul <imm>',
    0xa8: 'xor A, <op>',
    0xa9: 'xor _2A, <op>',
    0xaa: 'xor _100hA, <op>',
    0xab: 'xor _10000hA, <op>',
    0xac: 'xor A, <imm>',
    0xad: 'xor _2A, <imm>',
    0xae: 'xor _100hA, <imm>',
    0xaf: 'xor _10000hA, <imm>',
    0xb0: '_and A, <op>',
    0xb1: '_and _2A, <op>',
    0xb2: '_and _100hA, <op>',
    0xb3: '_and _10000hA, <op>',
    0xb4: '_and A, <imm>',
    0xb5: '_and _2A, <imm>',
    0xb6: '_and _100hA, <imm>',
    0xb7: '_and _10000hA, <imm>',
    0xb8: 'or A, <op>',
    0xb9: 'or _2A, <op>',
    0xba: 'or _100hA, <op>',
    0xbb: 'or _10000hA, <op>',
    0xbc: 'or A, <imm>',
    0xbd: 'or _2A, <imm>',
    0xbe: 'or _100hA, <imm>',
    0xbf: 'or _10000hA, <imm>',
    0xc0: 'shlr A, <op>',
    0xc4: 'shlr A, <imm>',
    0xc8: 'shar A, <op>',
    0xcc: 'shar A, <imm>',
    0xd0: 'rotr A, <op>',
    0xd4: 'rotr A, <imm>',
    0xd8: 'shll A, <op>',
    0xdc: 'shll A, <imm>',
    0xe0: 'mov <op>, A',
    0xe8: 'wrram lsb, <op>',
    0xe9: 'wrram mid, <op>',
    0xea: 'wrram msb, <op>',
    0xec: 'wrram lsb, <imm>',
    0xed: 'wrram mid, <imm>',
    0xee: 'wrram msb, <imm>',
    0xf0: 'swap <op>',
    0xfc: 'halt',
}

opMap = {
    0x00: 'REG_A',
    0x01: 'MH',
    0x02: 'ML',
    0x03: 'EXT_DTA',
    0x08: 'ROM_DTA',
    0x0c: 'RAM_DTA',
    0x13: 'EXT_PTR',
    0x1c: 'RAM_PTR',
    0x2e: 'SNES_ROM_EXT_PTR',
    0x50: '_000000',
    0x51: '_FFFFFF',
    0x52: '_00FF00',
    0x53: '_FF0000',
    0x54: '_00FFFF',
    0x55: '_FFFF00',
    0x56: '_800000',
    0x57: '_7FFFFF',
    0x58: '_008000',
    0x59: '_007FFF',
    0x5a: '_FF7FFF',
    0x5b: '_FFFF7F',
    0x5c: '_010000',
    0x5d: '_FEFFFF',
    0x5e: '_000100',
    0x5f: '_00FEFF',
    0x60: 'R0',
    0x61: 'R1',
    0x62: 'R2',
    0x63: 'R3',
    0x64: 'R4',
    0x65: 'R5',
    0x66: 'R6',
    0x67: 'R7',
    0x68: 'R8',
    0x69: 'R9',
    0x6a: 'RA',
    0x6b: 'RB',
    0x6c: 'RC',
    0x6d: 'RD',
    0x6e: 'RE',
    0x6f: 'RF',
}

def make_pass(gen_labels, provided_labels=None):
    addr = 0x8000
    page = 0
    pc = 0
    labels = []
    comps = []
    for i in range(0, len(data), 2):
        ins = None
        op = wordIn(data, i)
        for pattern in [op, op>>8, (op>>8)&0xfc]:
            if pattern in insMap:
                ins = insMap[pattern]
                break
            
        param = op & 0xff
        if gen_labels:
            if '<addr>' in ins:
                target = (i & 0xfe00) + param*2
                labels.append(target)
        else:
            if i in provided_labels:
                if comps and comps[-1] != '':
                    comps.append('')
                comps.append(f'Func_2_{0x8000+i:04x}:')
            comp = ins
            if '<addr>' in ins:
                target = (i & 0xfe00) + param*2
                comp = comp.replace('<addr>', f'Func_2_{0x8000+target:04x}')
            elif '<p_addr>' in ins:
                comp = comp.replace('<p_addr>', f'${param*2:03x}')
            elif '<imm>' in ins:
                comp = comp.replace('<imm>', f'IMM ${param:02x}')
            elif '<op>' in ins:
                if param not in opMap:
                    raise Exception(f'Opmap: {param:02x}. Ins: {i:04x}')
                comp = comp.replace('<op>', f'OP {opMap[param]}')
            elif op == 0xffff:
                comp = '.dw $ffff'

            comp += ' '*60
            comps.append(f'\t{comp} ; ${0x8000+i:04x} / {i//0x200:01x}:{(i//2)&0xff:02x} / ${op:04x}')

            if ins in ['halt', 'ret'] or ins.startswith('jp') or ins.startswith('jz') or ins.startswith('jc') or ins.startswith('js'):
                if op != 0xffff:
                    comps.append('')

        addr += 2
        pc += 1
        if pc == 0x100:
            pc = 0
            page += 1

    if gen_labels:
        return labels
    else:
        return comps

labels = make_pass(True)
comps = make_pass(False, labels)
final_str = '\n'.join(comps)
print(final_str)