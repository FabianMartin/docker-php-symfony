FROM php:7.0-alpine

ENV SYMFONY_ENV dev

RUN apk add dockerize gosu --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
	&& addgroup -g 500 symfony \
	&& adduser -u 500 -D -G symfony -h /home/symfony -s /bin/sh symfony \
	&& mkdir /srv/symfony \
	&& chown symfony:symfony /srv/symfony

RUN apk add --no-cache --virtual .build-dependencies curl curl-dev icu-dev sqlite-dev coreutils \
	&& apk add --no-cache icu git openssh-client \
    && docker-php-ext-install -j$(nproc) curl iconv intl json mbstring opcache pdo_mysql pdo_sqlite zip \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
	&& chmod a+x /usr/local/bin/symfony \
    && apk del .build-dependencies

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD conf.d /usr/local/etc/php/conf.d/

RUN chmod 0755 /usr/local/bin/entrypoint.sh \
	&& mkdir -p /home/symfony/.ssh \
 	&& ssh-keyscan github.com >> /home/symfony/.ssh/known_hosts \
	&& chmod 700 /home/symfony/.ssh \
	&& chmod 600 /home/symfony/.ssh/* \
 	&& chown symfony:symfony -R /home/symfony

WORKDIR /srv/symfony
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/sh"]
