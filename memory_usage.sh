#!/bin/bash
PID=$1
TOTAL_MEM=$(free -m | grep Mem: | cut -c14-18)
RESULT=$(top -n1 -b -p $PID | grep "$PID" | python -c "import sys; in_array = sys.stdin.read().split(' '); print ( float(filter(None, in_array)[9]) / 100 ) * $TOTAL_MEM")
echo $RESULT
