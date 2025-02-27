#!/bin/bash
find /home /var -type d -perm -o+w -not -path "/var/tmp*" -not -path "/var/lib/php/*" -exec ls -d {} \; -exec chmod o-w {} \; 2>/dev/null
