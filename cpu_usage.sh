#!/bin/bash
PID=$1
RESULT=$(top -n1 -b -p $PID | grep "$PID" | python -c "import sys; in_array = sys.stdin.read().split(' '); print filter(None, in_array)[8]")
echo $RESULT
