ql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

if [ $# -ne  5 ]
then
  echo " you must enter 5 arguments: host name, port no,  database name, the psql user  and his password"
  exit 1
fi

specs=`lscpu`

cpu_number=$(echo "$specs" | grep '^CPU(s):' | awk '/CPU/{print $2}' | tail -n1 | xargs)
cpu_architecture=$(echo "$specs" | awk '/Architecture:/{print $2}' | tail -n1 | xargs)
cpu_model=$(echo "$specs" | awk '/Model name:/{print $3,$4,$5,$6,$7,$8}' | tail -n1 | xargs)
cpu_mhz=$(echo "$specs" | awk '/CPU MHz:/{print $3}' | tail -n1 | xargs)
L2_cache=$(echo "$specs" | awk '/L2 cache:/{print $3}' | sed 's/[^0-9]*//g' |tail -n1 | xargs)
total_mem=$(free  | awk '/^Mem:/{print $2}' | tail -n1 | xargs)
timestamp=$(vmstat -t | awk '{print $18,$19}' | tail -n1 | xargs)


insert_stmt="INSERT INTO host_info (host_name, cpu_number, cpu_architecture,  cpu_model, cpu_mhz, L2_cache, total_mem, timestamp)
                          VALUES ( '"$psql_host"', "$cpu_number", '"$cpu_architecture"',  '"$cpu_model"', "$cpu_mhz", "$L2_cache", "$total_mem", '"$timestamp"');"

psql -h "$psql_host"  -d "$db_name" -U "$psql_user" -c "$insert_stmt"

