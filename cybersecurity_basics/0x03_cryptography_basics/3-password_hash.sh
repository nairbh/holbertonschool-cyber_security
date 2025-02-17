#!/bin/bash
echo -n "$1$openssl rand -base64 20" | sha256sum > 3_hash.txt
