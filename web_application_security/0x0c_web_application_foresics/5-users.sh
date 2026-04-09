#!/bin/bash
awk -F'name=|,' '/new user/{print $2}' auth.log | sort -u | paste -sd,
