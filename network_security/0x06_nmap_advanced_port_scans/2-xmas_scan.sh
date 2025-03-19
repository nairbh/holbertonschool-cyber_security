#!/bin/bash
sudo nmap -sX -p 440-450 --reason --open --packet-trace $1
