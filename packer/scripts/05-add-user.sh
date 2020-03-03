#!/usr/bin/env bash

set -euo pipefail

# Have to ensure the uid 1000 to match the code-server Dockerfile.
adduser --uid 1000 --gecos '' --disabled-password coder

echo "coder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/nopasswd

mkdir /home/coder/project
chown coder:coder /home/coder/project
