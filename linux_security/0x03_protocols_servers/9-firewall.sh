#!/bin/bash
iptables -P INPUT -j DROP 
iptables -A INPUT -p tcp --dport ssh -j ACCEPT &&  iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
