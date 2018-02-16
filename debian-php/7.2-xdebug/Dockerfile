FROM php:7.2-fpm

ENV GOSU_VERSION 1.10
ENV DOCKERIZE_VERSION v0.6.0

RUN set -ex \
    && fetchDeps='ca-certificates wget gpg dirmngr' \
    && apt-get update \
    && apt-get install -y --no-install-recommends $fetchDeps \
    && rm -rf /var/lib/apt/lists/* \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && GPG_KEYS='B42F6819007F00F88E364FD4036A9C25BF357DD4' \
    && (gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$GPG_KEYS" \
        || gpg --keyserver pgp.mit.edu --recv-keys "$GPG_KEYS" \
        || gpg --keyserver keyserver.pgp.com --recv-keys "$GPG_KEYS") \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove $fetchDeps

RUN deps='autoconf make g++ curl libcurl4-gnutls-dev libicu-dev libsqlite3-dev zlib1g-dev' \
    && apt-get update \
    && apt-get install -y $deps \
    && apt-get install -y git openssh-client \
    && rm -rf /var/lib/apt/lists/* \
    && pecl install apcu xdebug \
    && docker-php-ext-enable apcu xdebug \
    && docker-php-ext-install -j$(nproc) curl iconv intl json mbstring opcache pdo_mysql pdo_sqlite zip \
    && curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && apt-get purge -y --auto-remove $deps

ADD conf.d /usr/local/etc/php/conf.d/
ADD pool.d /usr/local/etc/php-fpm.d/

RUN groupadd -g 500 symfony \
    && useradd -u 500 -g symfony -m -d /home/symfony -s /bin/sh symfony \
    && mkdir /srv/symfony \
    && chown symfony:symfony /srv/symfony \
    && mkdir -p /home/symfony/.ssh \
    && ssh-keyscan github.com >> /home/symfony/.ssh/known_hosts \
    && chmod 700 /home/symfony/.ssh \
    && chmod 600 /home/symfony/.ssh/* \
    && chown symfony:symfony -R /home/symfony

WORKDIR /srv/symfony
CMD ["/bin/sh"]
