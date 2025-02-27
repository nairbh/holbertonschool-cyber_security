#!/bin/bash
CONF="/etc/postfix/main.cf" grep -q "smtpd_tls_security_level" "$CONF" && grep "smtpd_tls_security_level" "$CONF" || echo "STARTTLS not configured"
