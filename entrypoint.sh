#!/bin/bash
set -e
export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1
source $NVM_DIR/nvm.sh
exec "$@"