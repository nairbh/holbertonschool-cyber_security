#!/bin/bash
sudo nmap -sM --verbose -p21,22,23,80,443 --reason $1
