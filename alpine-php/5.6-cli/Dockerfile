FROM php:5.6-alpine

RUN apk add dockerize gosu --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN apk add --no-cache --virtual .build-dependencies autoconf make g++ curl curl-dev icu-dev sqlite-dev coreutils \
    && apk add --no-cache icu git openssh-client \
    && pecl install apcu-4.0.11 \
    && docker-php-ext-enable apcu \
    && docker-php-ext-install -j$(nproc) curl iconv intl json mbstring opcache pdo_mysql pdo_sqlite zip \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && apk del .build-dependencies

ADD conf.d /usr/local/etc/php/conf.d/

RUN addgroup -g 500 symfony \
    && adduser -u 500 -D -G symfony -h /home/symfony -s /bin/sh symfony \
    && mkdir /srv/symfony \
    && chown symfony:symfony /srv/symfony \
    && mkdir -p /home/symfony/.ssh \
    && ssh-keyscan github.com >> /home/symfony/.ssh/known_hosts \
    && chmod 700 /home/symfony/.ssh \
    && chmod 600 /home/symfony/.ssh/* \
    && chown symfony:symfony -R /home/symfony

WORKDIR /srv/symfony
CMD ["/bin/sh"]
