#!/bin/bash
sudo nmap -sM -vv -p http,https,ftp,ssh,telnet --reason $1
