FROM alpine:3.5

RUN apk add dockerize gosu --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
	&& addgroup -g 500 symfony \
	&& adduser -u 500 -D -G symfony -h /home/symfony -s /bin/sh symfony \
	&& mkdir /srv/symfony \
	&& chown symfony:symfony /srv/symfony

RUN apk add --no-cache php7.1 php7.1-curl php7.1-ctype php7.1-fpm php7.1-iconv php7.1-intl php7.1-json php7.1-mbstring php7.1-opcache php7.1-openssl php7.1-phar php7.1-pdo php7.1-pdo_mysql php7.1-pdo_sqlite php7.1-session php7.1-zlib --repository http://nl.alpinelinux.org/alpine/edge/testing --repository http://nl.alpinelinux.org/alpine/edge/main \
	&& apk add --no-cache git openssh-client \
	&& apk add --no-cache --virtual .build-dependencies curl \
	&& ln -s /usr/sbin/php-fpm7.1 /usr/sbin/php-fpm \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& chmod a+x /usr/local/bin/composer \
	&& curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
	&& chmod a+x /usr/local/bin/symfony \
    && apk del .build-dependencies

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD php /etc/php7.1/

RUN chmod 0755 /usr/local/bin/entrypoint.sh \
	&& mkdir -p /home/symfony/.ssh \
 	&& ssh-keyscan github.com >> /home/symfony/.ssh/known_hosts \
	&& chmod 700 /home/symfony/.ssh \
	&& chmod 600 /home/symfony/.ssh/* \
 	&& chown symfony:symfony -R /home/symfony

WORKDIR /srv/symfony
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/sh"]
