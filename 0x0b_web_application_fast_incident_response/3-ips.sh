#!/bin/bash 

grep "Accepted password for root" auth.log | grep "from" | \
awk '{for (i=1;i<=NF;i++) if ($i=="from") print $(i+1)}' | \
grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | \
sort -u | wc -l
