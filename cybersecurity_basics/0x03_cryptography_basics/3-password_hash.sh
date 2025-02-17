#!/bin/bash
echo -n "$1$openssl" | sha256sum > 3_hash.txt
