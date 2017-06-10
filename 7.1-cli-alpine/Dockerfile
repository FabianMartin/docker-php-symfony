FROM alpine:3.6

RUN apk add dockerize gosu --no-cache --repository http://nl.alpinelinux.org/alpine/edge/testing \
	&& addgroup -g 500 symfony \
	&& adduser -u 500 -D -G symfony -h /home/symfony -s /bin/sh symfony \
	&& mkdir /srv/symfony \
	&& chown symfony:symfony /srv/symfony

RUN apk add --no-cache php7 php7-curl php7-ctype php7-iconv php7-intl php7-json php7-mbstring php7-opcache php7-openssl php7-phar php7-pdo php7-pdo_mysql php7-pdo_sqlite php7-session php7-zlib \
	&& apk add --no-cache git openssh-client \
	&& apk add --no-cache --virtual .build-dependencies curl \
	&& ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& chmod a+x /usr/local/bin/composer \
	&& curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
	&& chmod a+x /usr/local/bin/symfony \
    && apk del .build-dependencies

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD php /etc/php7/

RUN chmod 0755 /usr/local/bin/entrypoint.sh \
	&& mkdir -p /home/symfony/.ssh \
 	&& ssh-keyscan github.com >> /home/symfony/.ssh/known_hosts \
	&& chmod 700 /home/symfony/.ssh \
	&& chmod 600 /home/symfony/.ssh/* \
 	&& chown symfony:symfony -R /home/symfony

WORKDIR /srv/symfony
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/sh"]
