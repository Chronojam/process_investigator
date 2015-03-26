#!/usr/bin/env python
import subprocess
import sys

path_to_log = sys.argv[1]
total_sys_mem = sys.argv[2]

cpu_usage_values = []
memory_usage_values = []

if not os.path.exists(path_to_log):
  print "Stream file does not exist!"
  sys.exit(2)

with open(path_to_log) as file_stream:
  for line in file_stream:
    cpu_usage_values.append(float(line.rstrip().split('  ')[0]))
    memory_usage_values.append(float(line.rstrip().split('  ')[1]))

total_mem_mb = int(total_sys_mem)
print total_mem_mb

print "CPU Mean Usage: %f" % (reduce(lambda x, y : x + y, cpu_usage_values) / len(cpu_usage_values))
print "CPU Maximum Usage: %f" % max(cpu_usage_values)
print "Memory Mean Usage: %fMB" % ((reduce(lambda x, y : x + y, memory_usage_values) / len(memory_usage_values) / 100) * total_mem_mb )
print "Memory Maximum Usage: %fMB" % ((max(memory_usage_values) / 100) * total_mem_mb)

