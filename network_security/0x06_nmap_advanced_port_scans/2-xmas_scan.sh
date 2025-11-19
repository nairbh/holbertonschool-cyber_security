#!/bin/bash
sudo nmap -sX -vv --open -reason -packet-trace $1
