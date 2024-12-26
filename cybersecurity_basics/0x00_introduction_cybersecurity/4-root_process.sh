#!/bin/bash
if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

ps -u "$1" -o user,pid,%cpu,%mem,vsz,rss,command --no-headers \
  | grep -v " 0 " \
  | head -n 2
