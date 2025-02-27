#!/bin/bash
find / -xdev -type d -perm -0002 -exec lsi -d {} \; -exec chmod o-w {} +
