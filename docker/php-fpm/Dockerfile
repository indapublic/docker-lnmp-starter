FROM alpine:3.11

LABEL maintainer="Vasilii Zolotukhin <vasilii.zolotukhin@gmail.com>"

ADD https://dl.bintray.com/php-alpine/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates && \
    echo "https://dl-cdn.alpinelinux.org/alpine/v3.7/community" >> /etc/apk/repositories && \
    echo "https://dl.bintray.com/php-alpine/v3.11/php-7.4" >> /etc/apk/repositories

RUN apk add --update --no-cache \
	coreutils \
	php-fpm \
	php-apcu \
	php-ctype \
	php-curl \
	php-dom \
	php-gd \
	php-iconv \
	php-imagick \
	php-json \
	php-intl \
#	php-fileinfo\
	php-mbstring \
	php-opcache \
	php-openssl \
	php-pdo \
	php-pdo_mysql \
	php-mysqli \
	php-xml \
	php-zlib \
	php-phar \
#	php-tokenizer \
    php-redis \
	php-session \
#	php-simplexml \
	php-xdebug \
#	php-zip \
	make \
	curl \
	git

RUN ln -sf /usr/bin/php7 /usr/bin/php

#RUN apk add --update --no-cache \
#	php-fileinfo\
#	php-tokenizer \
#	php-simplexml \
#	php-zip

RUN echo "$(curl -sS https://composer.github.io/installer.sig) -" > composer-setup.php.sig \
	&& curl -sS https://getcomposer.org/installer | tee composer-setup.php | sha384sum -c composer-setup.php.sig \
	&& php composer-setup.php && rm composer-setup.php* \
	&& chmod +x composer.phar && mv composer.phar /usr/bin/composer

COPY app.ini /etc/php7/conf.d/
COPY app.ini /etc/php7/cli/conf.d/
COPY xdebug.ini /etc/php7/conf.d/

COPY app.pool.conf /etc/php7/php-fpm.d/

CMD ["/usr/sbin/php-fpm7", "-F"]

WORKDIR /var/www/app
EXPOSE 9001
