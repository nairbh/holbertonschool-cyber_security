#!/bin/bash
echo -n "$1$openssl" | sha256sum  >  tests.txt
