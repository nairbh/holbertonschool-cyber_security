#!/bin/bash
ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,comm --sort=-%mem | grep -vE '\<0\>'
