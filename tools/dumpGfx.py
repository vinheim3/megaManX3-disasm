#!/usr/bin/env python3

import sys
from util import getRom, bankConv, conv

start_address = sys.argv[1]
if ':' in start_address:
    start_address = bankConv(start_address)
else:
    start_address = conv(start_address)

size = conv(sys.argv[2])

data = getRom()[start_address:start_address+size]

with open("gfx_new.bin", 'wb') as f:
    f.write(data)
