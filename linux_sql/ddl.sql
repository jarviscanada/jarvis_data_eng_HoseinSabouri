#!/bin/bash -x
DB_USER='postgres'
DB_PASSWD='password'
DB_NAME='postgres'
TABLE='host-info' 'host_usage'
lscpu_out=$lscpu
hostname=$(hostname -f)
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)
hostname=$(hostname -f)
cpu_architecture=$(echo "$lscpu_out"  | egrep "^Architecture:" | awk '{print $2}' | xargs)
cpu_model=$(echo "$lscpu_out"  | egrep "^Model name:" | awk '{print $2}' | xargs)
cpu_mhz=$(echo "$lscpu_out"  | egrep "^CPU MHz:" | awk '{print $2}' | xargs)
L2_case=$(echo "$lscpu_out"  | egrep "^L2 cache:" | awk '{print $2}' | xargs)
current_time=$(date +"%T")
timestamp=$(current__time)
vmstat_out=$(vmstat -s)
total_memory=$(echo "$vmstat_out"  | egrep "total memory:" | awk '{print $1}' | xargs)
memory free=$(echo "$vmstat_out"  | egrep "free memory:" | awk '{print $1}' | xargs)




