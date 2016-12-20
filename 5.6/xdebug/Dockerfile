FROM php:5.6-fpm-alpine

ENV SYMFONY_ENV dev

RUN echo http://nl.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories \
	&& echo http://nl.alpinelinux.org/alpine/edge/community >> /etc/apk/repositories \
	&& apk --no-cache add gosu dockerize \
	&& addgroup -g 500 symfony \
	&& adduser -u 500 -D -G symfony -h /srv/symfony -s /bin/sh symfony

RUN apk add --no-cache --virtual .build-dependencies autoconf make g++ curl curl-dev icu-dev sqlite-dev \
	&& apk add --no-cache icu git \
    && docker-php-ext-install curl iconv intl json mbstring opcache pdo_mysql pdo_sqlite zip \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& curl -sS https://getcomposer.org/installer | php \
	&& mv composer.phar /usr/local/bin/composer \
	&& curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony \
	&& chmod a+x /usr/local/bin/symfony \
    && apk del .build-dependencies

ADD entrypoint.sh /usr/local/bin/entrypoint.sh
ADD conf.d /usr/local/etc/php/conf.d/
ADD pool.d /usr/local/etc/php-fpm.d/

RUN apk add --no-cache --virtual .build-dependencies openssh-client \
	&& chmod 0755 /usr/local/bin/entrypoint.sh \
	&& mkdir -p /srv/symfony/.ssh \
 	&& ssh-keyscan github.com >> /srv/symfony/.ssh/known_hosts \
	&& chmod 700 /srv/symfony/.ssh \
	&& chmod 600 /srv/symfony/.ssh/* \
 	&& chown symfony:symfony -R /srv/symfony \
 	&& apk del .build-dependencies

WORKDIR /srv/symfony
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/sh"]
