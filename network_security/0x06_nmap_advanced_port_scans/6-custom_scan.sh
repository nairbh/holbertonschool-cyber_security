#!/bin/bash
sudo nmap -scanflags URGACKPSHRSTSYNFIN -p $2 -oN custom_scan.txt 2>$1 > /dev/null
