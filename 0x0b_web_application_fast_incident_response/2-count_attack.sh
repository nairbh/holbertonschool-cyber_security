#!/bin/bash

logs=$(tail -n 1000 /var/log/auth.log)

compromised=$(echo "$logs" | awk '
    /Failed password/ { fail[$NF]++ }
    /Accepted password/ {
        user=$NF
        if (fail[user] > 2) {
            print user
        }
    }
' | sort -u)

echo "$compromised"
