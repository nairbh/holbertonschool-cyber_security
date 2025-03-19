#!/bin/bash
sudo nmap --scanflag FINPSHURG -p 440-450 --reason --open --packet-trace $1
