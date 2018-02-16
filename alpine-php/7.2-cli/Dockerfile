FROM php:7.2-alpine

ENV SYMFONY_ENV dev

RUN apk add dockerize gosu --no-cache --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/

RUN apk add --no-cache --virtual .build-dependencies autoconf make g++ curl curl-dev icu-dev sqlite-dev zlib-dev coreutils \
    && apk add --no-cache icu zlib git openssh-client \
    && docker-php-ext-install -j$(nproc) curl iconv intl json mbstring opcache pdo_mysql pdo_sqlite zip \
    && pecl install apcu \
    && docker-php-ext-enable apcu \
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
