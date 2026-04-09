#!/bin/bash
grep -i -E "from" auth.log | awk '{print $12}' | sort | uniq -c | wc -l
