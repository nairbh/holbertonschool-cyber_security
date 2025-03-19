#!/bin/bash
sudo nmap -sM --verbose -p http,https,ftp,ssh,telnet --reason $1
