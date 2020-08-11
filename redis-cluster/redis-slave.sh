#!/bin/sh
#***************** author:zhaixd<xiaodong137038@163.com> *********************
#***************** redis从服务启动/停止 *********************
echo "exec paramters:$@"
exec docker-compose -f docker-compose-slave.yml -p redis-slave $@
