#!/usr/bin/python

from serial import Serial
import struct
import sys
from collections import namedtuple

Sample = namedtuple("Sample", "time,nid,sid,value")

def parse_sample(a):
    (t, nid, sid, value) = struct.unpack('<LHHi', a)
    return Sample(t, nid, sid, 1.0 * value / 0x10000 * 2)

s = Serial(sys.argv[1])
while True:
    while s.read(1) != "\x06": pass
    a = s.read(12)
    sample = parse_sample(a)
    #if sample.sid != 3: continue
    print "\t".join(map(str, sample))
    sys.stdout.flush()

