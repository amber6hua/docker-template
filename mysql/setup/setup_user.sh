#!/bin/sh

containerId=`docker ps | grep app.server_mysql_1 | cut -d' ' -f1`
echo "mysql container id ${containerId}"

docker exec $containerId bash -c "cd /setup && sh ./init_user.sh"

