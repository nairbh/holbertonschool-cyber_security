#!/bin/bash
grep -i -E "from|for|Received disconnect from IP" auth.log | awk '{print $12}' | sort | uniq -c | wc -l
