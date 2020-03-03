#!/usr/bin/env bash

set -euxo pipefail

# Required to make img_check pass.
unattended-upgrades -d
