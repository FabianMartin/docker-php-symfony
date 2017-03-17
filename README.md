# fabianmartin/php-symfony

php image for symfony projects

## Feature sheet
 
| Tag               | Base image         | PHP version   | cli                | fpm                | xdebug             |
| ----------------- | ------------------ | ------------- | :----------------: | :----------------: | :----------------: |
| 5.6               | php:5.6-fpm-alpine | 5.6           | :white_check_mark: | :white_check_mark: | :x:                |
| 5.6-cli           | php:5.6-alpine     | 5.6           | :white_check_mark: | :x:                | :x:                |
| 5.6-xdebug        | php:5.6-fpm-alpine | 5.6           | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| 5.6-alpine        | alpine:3.5         | 5.6           | :white_check_mark: | :white_check_mark: | :x:                |
| 5.6-cli-alpine    | alpine:3.5         | 5.6           | :white_check_mark: | :x:                | :x:                |
| 5.6-xdebug-alpine | alpine:3.5         | 5.6           | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| 7.0               | php:7.0-fpm-alpine | 7.0           | :white_check_mark: | :white_check_mark: | :x:                |
| 7.0-cli           | php:7.0-alpine     | 7.0           | :white_check_mark: | :x:                | :x:                |
| 7.0-xdebug        | php:7.0-fpm-alpine | 7.0           | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| 7.0-alpine        | alpine:3.5         | 7.0           | :white_check_mark: | :white_check_mark: | :x:                |
| 7.0-cli-alpine    | alpine:3.5         | 7.0           | :white_check_mark: | :x:                | :x:                |
| 7.0-xdebug-alpine | alpine:3.5         | 7.0           | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| 7.1               | php:7.1-fpm-alpine | 7.1           | :white_check_mark: | :white_check_mark: | :x:                |
| 7.1-cli           | php:7.1-alpine     | 7.1           | :white_check_mark: | :x:                | :x:                |
| 7.1-xdebug        | php:7.1-fpm-alpine | 7.1           | :white_check_mark: | :white_check_mark: | :white_check_mark: |
| 7.1-alpine        | alpine:3.5         | 7.1           | :white_check_mark: | :white_check_mark: | :x:                |
| 7.1-cli-alpine    | alpine:3.5         | 7.1           | :white_check_mark: | :x:                | :x:                |
| 7.1-xdebug-alpine | alpine:3.5         | 7.1           | :white_check_mark: | :white_check_mark: | :white_check_mark: |

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

[Xdebug]
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.max_nesting_level=200
xdebug.var_display_max_depth=6
xdebug.idekey="PHPSTORM"
xdebug.remote_port=9090
```