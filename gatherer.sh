#!/bin/bash

# ./gatherer [PID] [TIMEINSECONDS]
# ./gatherer 2123 10
DATESTAMP=$(date +%s)
LOG_NAME=/tmp/.usage_dump_$DATESTAMP.txt
PID=$1
COUNT=$2
TOTAL_MEM=$(free -m | grep Mem: | cut -c14-18)
top -n$COUNT -b -p $PID | grep "$PID" | cut -c50-57  > /tmp/.usage_dump_$DATESTAMP.txt

./parser.py $LOG_NAME $TOTAL_MEM
echo "Done!"
rm $LOG_NAME
