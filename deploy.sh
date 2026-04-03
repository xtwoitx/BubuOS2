#!/bin/bash
# BubuOS Deploy — push code changes to device and restart
# Usage: ./deploy.sh [restart]
#   ./deploy.sh          — sync files only
#   ./deploy.sh restart  — sync + restart BubuOS service

HOST="xgpicase2x@192.168.0.29"
PASS="pocket1"
SSH="sshpass -p $PASS ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -q"
SCP="sshpass -p $PASS scp -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -q"
RSYNC="sshpass -p $PASS rsync -avz --delete -e 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'"

LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"
REMOTE_DIR="/home/xgpicase2x/bubuos"

echo "==> Syncing $LOCAL_DIR → $HOST:$REMOTE_DIR"

eval $RSYNC \
    --exclude '__pycache__' \
    --exclude '.git' \
    --exclude 'test_data' \
    --exclude 'screenshots' \
    --exclude '.DS_Store' \
    --exclude '*.pyc' \
    "$LOCAL_DIR/" "$HOST:$REMOTE_DIR/"

if [ $? -eq 0 ]; then
    echo "==> Sync complete"
else
    echo "==> Sync FAILED"
    exit 1
fi

# Clear Python cache on device
$SSH $HOST 'find ~/bubuos -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null'

if [ "$1" = "restart" ]; then
    echo "==> Rebooting device..."
    $SSH $HOST 'sudo reboot' 2>/dev/null
    echo "==> Reboot sent. Device will be back in ~30s."
fi
