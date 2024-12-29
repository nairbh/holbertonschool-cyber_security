#!/bin/bash
whois "$1" | awk -F': ' '
$0 ~ /^(Registrant|Admin|Tech)/ {
    gsub(/^ | $/, "", $0);
    gsub(": ", ",", $0);
    print $0
}' > "$1.csv"
