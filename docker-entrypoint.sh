#!/bin/bash
set -e
# Avvia SSH
/usr/sbin/sshd -D &
# Avvia Docker Daemon (senza bloccare)
dockerd > /var/log/dockerd.log 2>&1 &
# Tieni vivo il container
tail -f /dev/null
