#!/bin/bash
whois "$1" | awk -F': ' '$0 ~ /^(Registrant|Admin|Tech)/ {print $1 "," $2}' > "$1.csv"
