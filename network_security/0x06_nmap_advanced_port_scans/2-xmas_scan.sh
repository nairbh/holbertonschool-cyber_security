#!/bin/bash
sudo nmap -sX -vv --open -reason -packet-trace -p 440-450 $1
