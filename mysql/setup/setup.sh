#!/bin/sh

echo -n "All data will be lost, are you sure to continue?(yes(y)|no(n)): "
read doit
case $doit in
yes|y) 
    containerId=`docker ps | grep server_mysql_1 | cut -d' ' -f1`
    echo "mysql container id ${containerId}"

    docker exec $containerId bash -c "cd /setup && sh ./init.sh"
	;;
no|n)
;;
*)
;;
esac

