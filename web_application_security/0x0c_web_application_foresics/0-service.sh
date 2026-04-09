#!/bin/bash

grep -i -E "sshd|ftpd|httpdi|nginx" $1 |awk '{print $6}' |sort |uniq -c |sort -nr
