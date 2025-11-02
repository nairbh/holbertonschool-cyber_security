#!/bin/bash
sudo find / -xdev -type d -perm -0002 -exec chmod o-w {} \; -print
