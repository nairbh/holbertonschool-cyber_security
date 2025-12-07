#!/bin/bash

LOG="auth.log"

tail -n 1000 "$LOG" \
  | grep "sshd" \
  | grep -E "Invalid|Failed|Accepted" \
  | awk '/Invalid|Failed/ {fail[$NF]++} /Accepted/ {acc[$NF]++}
         END {
           for (u in acc) {
             if (acc[u] > 0 && fail[u] > 0) print u
           }
         }'

