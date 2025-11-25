#!/usr/bin/python3

"""Documentation :
Module docs.
"""

import sys


def usage():
    """Documentation :
    usage function docs.
    """
    print("Usage: read_write_heap.py pid search_string replace_string")
    sys.exit(1)


def main():
    """Documentation :
    main function docs.
    """
    if len(sys.argv) != 4:
        usage()

    try:
        pid = int(sys.argv[1])
    except ValueError:
        print("Error: pid must be an integer")
        sys.exit(1)

    search_string = sys.argv[2].encode()
    replace_string = sys.argv[3].encode()

    maps_path = f"/proc/{pid}/maps"
    mem_path = f"/proc/{pid}/mem"

    try:
        with open(maps_path, "r") as maps_file:
            for line in maps_file:
                parts = line.split()
                if len(parts) < 2:
                    continue

                addr_range, permissions = parts[0], parts[1]

                if "heap" not in line or "rw-p" not in permissions:
                    continue

                start_str, end_str = addr_range.split("-")
                start = int(start_str, 16)
                end = int(end_str, 16)

                with open(mem_path, "r+b") as mem_file:
                    mem_file.seek(start)
                    data = mem_file.read(end - start)

                    index = data.find(search_string)
                    if index < 0:
                        continue

                    patched = (
                        data[:index]
                        + replace_string
                        + data[index + len(search_string):]
                    )

                    mem_file.seek(start)
                    mem_file.write(patched)
                    return

        print("Error: String not found in heap")

    except FileNotFoundError:
        print(f"Error: Process {pid} does not exist")
        sys.exit(1)

    except PermissionError:
        print("Error: Permission denied (need sudo)")
        sys.exit(1)

    except Exception as e:
        print(f"Error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    main()

