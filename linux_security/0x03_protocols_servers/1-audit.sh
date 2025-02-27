#!/bin/bash
sudo grep -Ev '/^\s*#\|^$/d' /etc/ssh/sshd_config
