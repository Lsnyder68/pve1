#!/bin/bash

now=$(date)
echo "---- $now ----"

echo "Killing screen sessions"
pct exec 131 bash /root/scripts/kill-screen.sh
echo "waiting 10 seconds..."
sleep 10
echo "Running backup of LXC 131"
vzdump 131 --compress zstd --tmpdir /root/tmp/ --mode stop --prune-backups keep-daily=1 --notes-template {\{\guestname}} --storage backups

now=$(date)
echo "Backup done"
echo "---- $now ----"
echo "**************"

#echo "waiting 5 seconds..."
#sleep 5
#echo "Rebooting LXC 131"
#pct exec 131 reboot


