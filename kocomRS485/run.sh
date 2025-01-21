#!/bin/sh
SHARE_DIR=/share/kocom

# Ensure required files and directories exist
if [ ! -f $SHARE_DIR/rs485.py ]; then
    mkdir -p $SHARE_DIR
    mv /rs485.py $SHARE_DIR
fi

/makeconf.sh
echo "[Info] Starting Wallpad Controller"

# Change to SHARE_DIR
cd $SHARE_DIR

# Execute Python script and handle errors
python3 rs485.py
EXIT_CODE=$?

if [ $EXIT_CODE -ne 0 ]; then
    echo "[Error] rs485.py exited with code $EXIT_CODE. Stopping container."
    exit 1
fi

