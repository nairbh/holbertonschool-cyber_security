#!/bin/bash
grep "Accepted password" auth.log | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | sort -u | wc -l
