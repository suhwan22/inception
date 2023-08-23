FROM alpine:3.17.4

ARG PHP_VERSION=81

RUN apk update && apk upgrade && \
	apk add --no-cache \
			php${PHP_VERSION} \
			php${PHP_VERSION}-fpm \
			php${PHP_VERSION}-common \
			php${PHP_VERSION}-session \
			php${PHP_VERSION}-iconv \
			php${PHP_VERSION}-json \
			php${PHP_VERSION}-gd \
			php${PHP_VERSION}-phar \
			php${PHP_VERSION}-curl \
			php${PHP_VERSION}-xml \
			php${PHP_VERSION}-mysqli \
			php${PHP_VERSION}-imap \
			php${PHP_VERSION}-pdo \
			php${PHP_VERSION}-pdo_mysql \
			php${PHP_VERSION}-soap \
			php${PHP_VERSION}-posix \
			php${PHP_VERSION}-gettext \
			php${PHP_VERSION}-ldap \
			php${PHP_VERSION}-ctype \
			php${PHP_VERSION}-dom \
			php${PHP_VERSION}-simplexml \
			wget \
			unzip \
			curl \
			iputils && \
	sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
	mkdir -p /var/www/html

WORKDIR /var/www/html

#COPY ./requirements/wordpress/tool/test.php /var/www/html/test.php
#COPY ./tools/test.php /var/www/html/test.php

# 컨테이너에서 9000 포트 열기
EXPOSE 9000

# 컨테이너 실행 시 php-fpm foreground로 시작
CMD ["/usr/sbin/php-fpm81", "-F"]