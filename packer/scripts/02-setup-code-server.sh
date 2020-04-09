#!/usr/bin/env bash

set -euo pipefail

# Create directory for code-server configuration and password storage.
mkdir -p /etc/code-server

# Install code-server to /usr/local/lib/code-server
mkdir -p /usr/local/lib/code-server
curl -L https://github.com/cdr/code-server/releases/download/3.0.2/code-server-3.0.2-linux-x86_64.tar.gz | tar --strip-components 1 -C /usr/local/lib/code-server -xzvf -

# Give code-server and the prepackaged node the ability to listen on 443. TODO reverse proxy through nginx.
setcap cap_net_bind_service=+ep /usr/local/lib/code-server/code-server
setcap cap_net_bind_service=+ep /usr/local/lib/code-server/node

systemctl enable code-server
