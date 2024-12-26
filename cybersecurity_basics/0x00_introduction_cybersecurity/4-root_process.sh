#!/bin/bash

ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,command | awk '$5 > 0 && $6 > 0' | head -n 2 | sed '/^$/d'
