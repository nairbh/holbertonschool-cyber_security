#!/bin/bash
whois "$1" | awk -F': ' 'BEGIN { print "Category, Field, Value" } $0 ~ /(Registrant|Admin|Tech) / {split($0, arr, ": "); print arr[1] ", " arr[2]}' > "$1.csv"