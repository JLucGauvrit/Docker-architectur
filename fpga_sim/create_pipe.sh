#!/bin/bash

PIPE=/dev/xdma0
if [[ ! -p $PIPE ]]; then
    echo "[INFO] Creating named pipe at $PIPE..."
    mkfifo $PIPE
fi

# Attendre et simuler un comportement de lecture/écriture
while true; do
    if read line <$PIPE; then
        echo "[FPGA] Received from inference: $line"
        echo "[FPGA] Responding: ACK-$line" >$PIPE
    fi
done
