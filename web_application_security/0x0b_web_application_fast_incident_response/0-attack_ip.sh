#!/bin/bash

# Extract IP addresses, count their occurrences, sort by frequency, and print only the IP address
# ([0-9]{1,3}\.){3}: Matches three groups of 1 to 3 digits followed by a dot (e.g. 192.168.1.).

grep -Eo '^([0-9]{1,3}\.){3}[0-9]{1,3}' logs.txt | sort | uniq -c | sort -nr | awk '{print $2}' | head -n 1
