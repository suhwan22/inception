FROM alpine:3.17

ARG PHP_VERSION \
	DB_NAME \
    DB_USER \
    DB_PASS

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
			php${PHP_VERSION}-mbstring \
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
	sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
    sed -i "s|;clear_env = no|clear_env = no|g" /etc/php${PHP_VERSION}/php-fpm.d/www.conf && \
	mkdir -p /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# 컨테이너에서 9000 포트 열기
EXPOSE 9000

WORKDIR /var/www/html

COPY requirements/wordpress/conf/create-wp-conf.sh /var/www/html/create-wp-conf.sh
COPY requirements/wordpress/tools/wp-script.sh /var/www/html/wp-script.sh

RUN /bin/sh create-wp-conf.sh && \
	rm create-wp-conf.sh && \
	chmod -R 777 /var/www/html/wp-script.sh

#CMD ["/sbin/tini", "--", "/var/www/html/wp-script.sh"]
CMD ["/bin/sh", "/var/www/html/wp-script.sh"]
