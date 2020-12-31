FROM redis:6.0.9-alpine

MAINTAINER zhaixd<xiaodong137038@163.com>

ENV REDIS_DATA_DIR=/etc/redis/data/ \
	REDIS_LOGFILE=/etc/redis/data/redis.log \
	REDIS_CONF_TEMPLATE=master.conf.template \
	REDIS_PWD=123456 \
	REDIS_HOST_IP=127.0.0.1 \
	REDIS_HOST_PORT=6379 \
	REDIS_DATABASES=16 \
	REDIS_AOF=yes

RUN apk add --no-cache gettext
#RUN mkdir -vp /etc/redis/data/ && touch /etc/redis/data/redis.log && chown -R redis:redis /etc/redis/
ADD $REDIS_CONF_TEMPLATE /etc/redis/$REDIS_CONF_TEMPLATE

COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
