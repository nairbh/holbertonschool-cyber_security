#!/bin/bash
john "$1" --wordlist=rockyou.txt --format=raw-md5
