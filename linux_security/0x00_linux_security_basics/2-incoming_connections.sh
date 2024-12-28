#!/bin/bash

sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT

echo "Rules updated"
echo "Rules updated (v6)"