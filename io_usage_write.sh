#!/bin/bash
PID=$1
RESULT=$(iotop -n1 -b | grep $PID | python -c "
import sys
in_array = sys.stdin.read().split(' ') 
cleared_array = filter(None, in_array)
if 'K' in cleared_array[6]:
  print float(cleared_array[5]) * 1000
elif 'M' in cleared_array[6]:
  print float(cleared_array[5]) * 1000 * 1000
elif 'G' in cleared_array[6]:
  print float(cleared_array[5]) * 1000 * 1000 * 1000
else:
  print cleared_array[5]")
echo $RESULT
