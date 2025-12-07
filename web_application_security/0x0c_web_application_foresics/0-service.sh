#!/bin/bash

LOG="auth.log"

grep "sshd" "$LOG" \
    | tr ' ' '\n' \
    | sed 's/[^a-zA-Z0-9():_-]//g' \
    | sed '/^$/d' \
    | sort \
    | uniq -c \
    | sort -nr \
    | head -20

