#!/bin/sh
#***************** author:zhaixd<xiaodong137038@163.com> *********************
set -e

# check base dir exist
if  [ ! -d  ${REDIS_DATA_DIR} ];then 
	mkdir -vp ${REDIS_DATA_DIR}
else
    echo "This DIR '${REDIS_DATA_DIR}' is exist"
fi

# redis logfile permission
if [ ! -f ${REDIS_LOGFILE} ]; then
    touch ${REDIS_LOGFILE}
fi
chown redis:redis -R ${REDIS_DATA_DIR}

# create sentinel.conf
if [ ! -z ${REDIS_CONF_TEMPLATE} ];then
	#sed -i "s/\$SENTINEL_QUORUM/$SENTINEL_QUORUM/g" /etc/redis/sentinel.conf
	redisConfigFile=/etc/redis/${REDIS_CONF_TEMPLATE%.template}
	envsubst < /etc/redis/${REDIS_CONF_TEMPLATE} > $redisConfigFile
	chown redis:redis $redisConfigFile
	cat $redisConfigFile
	sleep 1
fi

# wating for master
if [ ! -z ${SENTINEL_MASTER_NAME} ];then
	until $(redis-cli -h "${REDIS_HOST_IP}" -p "${REDIS_HOST_PORT}" -a "${REDIS_PWD}") ; do
	  >&2 echo "Redis master is unavailable - sleeping"
	  sleep 3
	done
fi

# exec redis-server
if [ -z $redisConfigFile ];then
	echo "Error: Redis Config $redisConfigFile not exist"
else 
	exec redis-server $redisConfigFile "$@"
fi

exec "$@"
