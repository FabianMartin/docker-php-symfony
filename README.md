# fabianmartin/php-symfony

php image for symfony projects

## Feature sheet

### Based on alpine images from php repository (https://hub.docker.com/_/php/)

| Tag               | Base image         | Distribution | PHP version   | cli  | fpm  | xdebug |
| ----------------- | ------------------ | ------------ | ------------- | :--: | :--: | :----: |
| 5.6               | php:5.6-fpm-alpine | Alpine 3.4   | 5.6           | ✓    | ✓    | X      |
| 5.6-cli           | php:5.6-alpine     | Alpine 3.4   | 5.6           | ✓    | X    | X      |
| 5.6-xdebug        | php:5.6-fpm-alpine | Alpine 3.4   | 5.6           | ✓    | ✓    | ✓      |
| 7.0               | php:7.0-fpm-alpine | Alpine 3.4   | 7.0           | ✓    | ✓    | X      |
| 7.0-cli           | php:7.0-alpine     | Alpine 3.4   | 7.0           | ✓    | X    | X      |
| 7.0-xdebug        | php:7.0-fpm-alpine | Alpine 3.4   | 7.0           | ✓    | ✓    | ✓      |
| 7.1               | php:7.1-fpm-alpine | Alpine 3.4   | 7.1           | ✓    | ✓    | X      |
| 7.1-cli           | php:7.1-alpine     | Alpine 3.4   | 7.1           | ✓    | X    | X      |
| 7.1-xdebug        | php:7.1-fpm-alpine | Alpine 3.4   | 7.1           | ✓    | ✓    | ✓      |
| 7.2               | php:7.2-fpm-alpine | Alpine 3.7   | 7.2           | ✓    | ✓    | X      |
| 7.2-cli           | php:7.2-alpine     | Alpine 3.7   | 7.2           | ✓    | X    | X      |
| 7.2-xdebug        | php:7.2-fpm-alpine | Alpine 3.7   | 7.2           | ✓    | ✓    | ✓      |

### Based on debian images from php repository (https://hub.docker.com/_/php/)

| Tag               | Base image         | Distribution   | PHP version   | cli  | fpm  | xdebug |
| ----------------- | ------------------ | -------------- | ------------- | :--: | :--: | :----: |
| 5.6-debian        | php:5.6-fpm-alpine | Debian Jessie  | 5.6           | ✓    | ✓    | X      |
| 5.6-cli-debian    | php:5.6-alpine     | Debian Jessie  | 5.6           | ✓    | X    | X      |
| 5.6-xdebug-debian | php:5.6-fpm-alpine | Debian Jessie  | 5.6           | ✓    | ✓    | ✓      |
| 7.0-debian        | php:7.0-fpm-alpine | Debian Jessie  | 7.0           | ✓    | ✓    | X      |
| 7.0-cli-debian    | php:7.0-alpine     | Debian Jessie  | 7.0           | ✓    | X    | X      |
| 7.0-xdebug-debian | php:7.0-fpm-alpine | Debian Jessie  | 7.0           | ✓    | ✓    | ✓      |
| 7.1-debian        | php:7.1-fpm-alpine | Debian Jessie  | 7.1           | ✓    | ✓    | X      |
| 7.1-cli-debian    | php:7.1-alpine     | Debian Jessie  | 7.1           | ✓    | X    | X      |
| 7.1-xdebug-debian | php:7.1-fpm-alpine | Debian Jessie  | 7.1           | ✓    | ✓    | ✓      |
| 7.2-debian        | php:7.2-fpm-alpine | Debian Stretch | 7.2           | ✓    | ✓    | X      |
| 7.2-cli-debian    | php:7.2-alpine     | Debian Stretch | 7.2           | ✓    | X    | X      |
| 7.2-xdebug-debian | php:7.2-fpm-alpine | Debian Stretch | 7.2           | ✓    | ✓    | ✓      |

## php-fpm

php-fpm doesn't start automaticaly. You can start it with `php-fpm` or `php-fpm --nodaemonize`. it will be available on port `9000`.

## Configured settings

```ini
date.timezone = UTC
short_open_tag = Off
magic_quotes_gpc = Off
register_globals = Off
session.auto_start = Off

upload_max_filesize = 256M
post_max_size = 256M

log_errors = on
error_log = /proc/self/fd/2

[Xdebug]
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.max_nesting_level=200
xdebug.var_display_max_depth=6
xdebug.idekey="PHPSTORM"
xdebug.remote_port=9090
```