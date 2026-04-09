#!/bin/bash
tail -1000 auth.log | grep -i -E "failure|accepted" | awk '{print $9}' |sort |uniq -c | head -1 | awk '{print $2}'
