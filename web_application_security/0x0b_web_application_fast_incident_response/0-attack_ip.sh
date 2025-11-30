#!/bin/bash
filename="log.txt"
cat "$filename" |  sort | uniq -c | sort -nr | awk '{print $2}' | head -n 1
