#!/usr/bin/env python3

import sys
import os

def usage():
    print("Usage: read_write_heap.py <pid> <search_string> <replace_string>")
    sys.exit(1)

def main():
    if len(sys.argv) != 4:
        usage()

    pid = int(sys.argv[1])
    search = sys.argv[2].encode()
    replace = sys.argv[3].encode()

    maps_path = f"/proc/{pid}/maps"
    mem_path = f"/proc/{pid}/mem"

    try:
        with open(maps_path) as maps:
            for line in maps:
                if "heap" not in line:
                    continue

                addr, perms = line.split()[0], line.split()[1]
                if perms != "rw-p":
                    continue

                start, end = [int(x, 16) for x in addr.split("-")]
                size = end - start

                with open(mem_path, "r+b") as mem:
                    mem.seek(start)
                    chunk = mem.read(size)

                    idx = chunk.find(search)
                    if idx < 0:
                        continue

                    patched = chunk[:idx] + replace + chunk[idx + len(search):]
                    mem.seek(start)
                    mem.write(patched)
                    return

        print("String not found in heap")

    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

