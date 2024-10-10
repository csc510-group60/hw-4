#!/bin/bash
# Find the process ID of infinite.sh and kill it
pid=$(pgrep -f infinite.sh)
if [ -z "$pid" ]; then
  echo "No process found."
else
  kill $pid
  echo "Process infinite.sh (PID: $pid) has been killed."
fi

