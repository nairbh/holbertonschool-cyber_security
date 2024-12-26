#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USER=$1

ps -u "$USER" -o user,pid,%cpu,%mem,vsz,rss,command | awk '$5 > 0 && $6 > 0' | head -n 2 | awk '{$1=$1}1'
