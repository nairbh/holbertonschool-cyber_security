#!/bin/bash
sudo nmap -sM  -vv -p http,https,telnet,ssh,ftp $1
