#!/bin/bash
whois "$1" | awk -F': ' '$0 ~ /^(Registrant|Admin|Tech)/ {gsub(/^ | $/, "", $0); print $1 "," ($1 ~ /Street$/ ? $2 " " : $2)}' > "$1.csv"
