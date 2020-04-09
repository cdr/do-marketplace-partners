#!/usr/bin/env bash

set -euo pipefail

# Add coder user so that code-server is started as coder instead of root.
adduser --gecos '' --disabled-password coder

echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

# Give coder user perms to write into code-server dir.
chown -R coder:coder /etc/code-server
