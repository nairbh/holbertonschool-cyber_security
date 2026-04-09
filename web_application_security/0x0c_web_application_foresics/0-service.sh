#!/bin/bash

grep -i -E "sshd|ftpd|httpdi|nginx" "${1:-auth.log}" |awk '{print $6}' |sort |uniq -c |sort -nr
