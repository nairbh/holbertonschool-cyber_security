#!/bin/bash
nmap -sV -O -sC --traceroute --script banner,ssl-enum-ciphers,default,smb-os-discovery "$1" -oN service_enumeration_results.txt
