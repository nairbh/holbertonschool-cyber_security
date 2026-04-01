#!/bin/bash

awk -F' ' '{print $7}' logs.txt | sort | uniq -c | sort -rn | head -n1 | awk '{print $2}'


: <<'COMMENT'
awk -F ' ' '{print $7}' logfile

    Uses space (' ') as the field delimiter.

  Prints the 7th field, which in common log formats is the URL path.

sort

    Sorts the list of URL paths so duplicates are grouped together.

uniq -c

    Counts how many times each unique URL path appears.

sort -rn

    Sorts the counted list in reverse numeric order, so the most frequent URL is at the top.

head -n1

    Grabs the top line, which corresponds to the most frequently requested URL.

awk '{print $2}'

    Prints just the URL path, stripping away the count.
COMMENT

