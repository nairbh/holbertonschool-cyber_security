#!/bin/bash
head -c 16 /dev/urandom | base64 | tr -dc 'a-zA-Z'