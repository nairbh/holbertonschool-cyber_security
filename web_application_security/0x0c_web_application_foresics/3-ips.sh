#!/bin/bash

LOG="auth.log"

tail -n 20000 "$LOG" \
  | grep "sshd" \
  | grep "Accepted" \
  | sed -r 's/.*from ([0-9.]+).*/\1/' \
  | sort -u \
  | wc -l


