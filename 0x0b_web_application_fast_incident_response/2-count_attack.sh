#!/bin/bash

tail -n 1000 auth.log > 1000.log
log_file=1000.log
failed_passwords=$(grep 'Failed password' "$log_file")
accepted_passwords=$(grep 'Accepted password' "$log_file")
failed_users=$(echo "$failed_passwords" | awk '{print $9}' | sort | uniq)
accepted_users=$(echo "$accepted_passwords" | awk '{print $9}' | sort | uniq)
common_users=$(comm -12 <(echo "$failed_users") <(echo "$accepted_users"))

echo "$common_users"
