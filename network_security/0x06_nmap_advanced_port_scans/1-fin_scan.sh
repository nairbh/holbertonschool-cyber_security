#!/bin/bash
sudo nmap -sF -f --mtu 16 -T2 -p 80-85 $1
