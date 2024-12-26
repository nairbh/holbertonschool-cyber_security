#!/bin/bash
ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,command --no-headers | awk '$5>0 && $6>0' | head -n 2
