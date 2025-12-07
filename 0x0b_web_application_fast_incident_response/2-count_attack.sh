#!/bin/bash

tail -n 1000 /var/log/auth.log | awk '
    /Failed password/ {
        user=$9
        fails[user]++
    }
    /Accepted password/ {
        user=$9
        if (fails[user] > 2) {
            print user
        }
    }
' | sort -u
