#!/bin/bash
set -e
ARCH=$(uname -m)

if [ "$ARCH" = "x86_64" ]; then
    export LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libgomp.so.1
elif [ "$ARCH" = "aarch64" ]; then
    export LD_PRELOAD=/usr/lib/aarch64-linux-gnu/libgomp.so.1
else
    echo "Unsupported architecture"
    exit 1
fi

source $NVM_DIR/nvm.sh
exec "$@"
