#!/bin/bash
sudo grep -Ei 'smtpd_tls_security_level|STARTTLS' /etc/postfix/main.cf || echo "STARTTLS not configured"
