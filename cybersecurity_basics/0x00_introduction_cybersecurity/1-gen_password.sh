#!/bin/bash
head -c 20 /dev/urandom | base64 | tr -dc 'a-zA-Z0-9'