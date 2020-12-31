FROM redis:6.0.9-alpine
MAINTAINER zhaixd<xiaodong137038@163.com>

ENV REDIS_DATA_DIR=/etc/redis/data/ \
	REDIS_LOGFILE=/etc/redis/data/redis.log \
	REDIS_CONF_TEMPLATE=sentinel.conf.template \
    REDIS_PWD=123456 \
	REDIS_HOST_IP=127.0.0.1 \
	REDIS_HOST_PORT=6379 \
	SENTINEL_PORT=26379 \
    SENTINEL_MASTER_NAME=redis-master \
    SENTINEL_QUORUM=2 \
    SENTINEL_DOWN_AFTER=30000 \
    SENTINEL_PARALLEL_SYNCS=1 \
    SENTINEL_FAILOVER_TIMEOUT=100000

RUN apk add --no-cache gettext
ADD $REDIS_CONF_TEMPLATE /etc/redis/$REDIS_CONF_TEMPLATE

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
#EXPOSE 26379
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["--sentinel"]


