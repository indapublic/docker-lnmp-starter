FROM alpine:3.12

LABEL maintainer="Vasilii Zolotukhin <vasilii.zolotukhin@gmail.com>"

ADD https://packages.whatwedo.ch/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN apk --update add ca-certificates && \
    echo "https://dl-cdn.alpinelinux.org/alpine/v3.12/community" >> /etc/apk/repositories && \
    echo "https://packages.whatwedo.ch/php-alpine/v3.12/php-8.0" >> /etc/apk/repositories

RUN apk add --update --no-cache \
#    for sha384sum
	coreutils \
    php8 \
    php8-fpm \
    php8-curl \
    php8-mbstring \
    php8-pdo \
    php8-pdo_mysql \
    php8-phar \
    php8-mysqli \
    php8-xdebug \
    php8-xml \
    php8-zip \
    make \
    curl \
    git

RUN ln -sf /usr/bin/php8 /usr/bin/php

COPY app.ini /etc/php8/conf.d/
COPY app.ini /etc/php8/cli/conf.d/
COPY app.pool.conf /etc/php8/php-fpm.d/

RUN echo "$(curl -sS https://composer.github.io/installer.sig) -" > composer-setup.php.sig \
	&& curl -sS https://getcomposer.org/installer | tee composer-setup.php | sha384sum -c composer-setup.php.sig \
	&& php composer-setup.php && rm composer-setup.php* \
	&& chmod +x composer.phar && mv composer.phar /usr/bin/composer

RUN apk del coreutils

CMD ["/usr/sbin/php-fpm8", "-F"]

WORKDIR /var/www/app
EXPOSE 9001

#	php8-ctype \
#	php8-dom \
#	php8-gd \
#	php8-iconv \
#	php8-imagick \
#	php8-intl \
#	php8-fileinfo\
#	php8-opcache \
#	php8-openssl \
#	php8-xml \
#	php8-zlib \
#	php8-phar \
#	php8-tokenizer \
#   php8-redis \
#	php8-session \
#	php8-simplexml \
#	php8-zip \
#	php8-fileinfo\
#	php8-tokenizer \
#	php8-simplexml \
#	php8-zip
