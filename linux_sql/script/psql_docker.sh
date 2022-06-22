#! /bin/sh

cmd=$1
db_username=$2
db_password=$3


sudo systemctl status docker || systemctl start docker
docker container inspect jrvs-psql
container_status=$?

case $cmd in
./scripts/psql_docker.sh create db_username db_password)
if [ $2=0 || $3=0 ];then
echo 'error'
exit 1
fi


if [$container_status -eq 0 ]; then
echo 'Container already exit'
exit 1
fi


if [ $# -ne 3 ]; then
echo 'create requires username and password'
exit 1
fi

docker volume create --name myvolume
docker run --name jrvs-psql
exit $?
,,


if [$container_status -eq 0 ]; then 
exit 1
fi

docker container $cmd jrvs-psql
exit $?
,,



echo 'Illegal command'
echo "commands: start\stop\create'
exit 1
,,

