FROM redis:6.0.9-alpine

ENV REDIS_DATA_DIR=/etc/redis/data/ \
	REDIS_LOGFILE=/etc/redis/data/redis.log \
	REDIS_CONF_TEMPLATE=slave.conf.template \
	REDIS_PWD=123456 \
	REDIS_HOST_IP=127.0.0.1 \
	REDIS_HOST_PORT=6379 \
	REDIS_DATABASES=16 \
	REDIS_AOF=no \
	SLAVE_IP=127.0.0.1 \
    SLAVE_PORT=6380

RUN apk add --no-cache gettext

ADD $REDIS_CONF_TEMPLATE /etc/redis/$REDIS_CONF_TEMPLATE

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

#EXPOSE 6380
#CMD ["redis-server"]
