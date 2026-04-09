#!/bin/bash
grep -i -E "failure" auth.log | awk '{print $9}' |sort |uniq -c | head -1 | awk '{print $2}'
