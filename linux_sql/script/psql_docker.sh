#! /bin/sh

cmd=$1
db_username=$2
db_password=$3


sudo systemctl status docker || systemctl start docker
docker container inspect jrvs-psql
container_status=$(docker container ls -a -f name=jrvs-psql | wc -l)
case $cmd in

 create)

 if [ $container_status -eq 2 ]; then
		echo "Container already exists"
		exit 1
	fi

 if [ $# -ne 3 ]; then
    echo "Create requires username and password,please follow this format"
    echo "[Bash_File] create [user_name] [password]"
    exit 1
  fi

  docker volume create pgdata
  	docker run --name jrvs-psql -e POSTGRES_PASSWORD=${db_password} -e POSTGRES_USER=${db_username} -d -v pgdata:/var/lib/postgresql/data -p 5432:5432 postgres:9.6-alpine
  	exit $?


  if [ $container_status -lt 2 ]; then
     echo "Container does not exist"
     exit 1
   fi

  docker container $cmd jrvs-psql
  	exit $?
  	;;

    *)
  	echo 'Illegal command'
  	echo 'Commands: start|stop|create'
  	exit 1
  	;;
  esac
  exit 0


