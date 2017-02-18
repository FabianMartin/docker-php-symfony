FROM alpine:3.5

RUN apk add dockerize gosu --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
	&& addgroup -g 500 symfony \
	&& adduser -u 500 -D -G symfony -h /home/symfony -s /bin/sh symfony \
	&& mkdir /srv/symfony \
	&& chown symfony:symfony /srv/symfony

RUN apk add --no-cache php5-cli php5-curl php5-fpm php5-iconv php5-intl php5-json php5-opcache php5-openssl php5-phar php5-pdo php5-pdo_mysql php5-pdo_sqlite php5-xdebug php5-zlib git openssh-client \
	&& apk add --no-cache --virtual .build-dependencies curl \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& chmod a+x /usr/local/bin/composer \
	&& curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
	&& chmod a+x /usr/local/bin/symfony \
    && apk del .build-dependencies

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD php /etc/php5/

RUN chmod 0755 /usr/local/bin/entrypoint.sh \
	&& mkdir -p /home/symfony/.ssh \
 	&& ssh-keyscan github.com >> /home/symfony/.ssh/known_hosts \
	&& chmod 700 /home/symfony/.ssh \
	&& chmod 600 /home/symfony/.ssh/* \
 	&& chown symfony:symfony -R /home/symfony

WORKDIR /srv/symfony
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/sh"]
