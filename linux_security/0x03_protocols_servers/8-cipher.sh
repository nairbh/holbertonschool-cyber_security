#!/bin/bash
nmap --script ssl-enum-ciphers -p 443 "$1" | grep -E 'weak|insecure|NULL|RC4|3DES|EXP|DES'
