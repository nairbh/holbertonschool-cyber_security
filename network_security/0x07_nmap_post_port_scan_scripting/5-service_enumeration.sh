#!/bin/bash
nmap -sV -A -p- --script default,banner,ssl-enum-ciphers,http-vuln*,smb-enum-domains $1 -oN service_enumeration_results.txt 
