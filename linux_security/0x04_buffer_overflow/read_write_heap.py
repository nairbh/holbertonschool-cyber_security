#!/usr/bin/python3
"""Module that finds and replaces a string in the heap of a running process."""
import sys


if len(sys.argv) != 4:
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)

pid_, s, r = int(sys.argv[1]), sys.argv[2].encode(), sys.argv[3].encode()


heap_over = next(l for l in open(f"/proc/{pid_}/maps") if "heap" in l and "rw" in l)

start, end = (int(x, 16) for x in heap_over.split()[0].split('-'))

f = open(f"/proc/{pid_}/mem", "r+b")

f.seek(start); data = f.read(end - start)
f.seek(start); f.write(data.replace(s, r, 1))
