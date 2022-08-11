ARG ALPINE_VERSION
FROM alpine:$ALPINE_VERSION

ARG ALPINE_VERSION
ARG PHP_VERSION
ARG PORT_NUMBER
ARG ENVIRONMENT

LABEL maintainer="Vasilii Zolotukhin <vasilii.zolotukhin@gmail.com>"

ADD https://php.hernandev.com/key/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v${ALPINE_VERSION}/community" >> /etc/apk/repositories && \
    echo "https://php.hernandev.com/v${ALPINE_VERSION}/php-${PHP_VERSION}" >> /etc/apk/repositories

RUN apk add --update --no-cache \
    php8 \
    php8-ctype \
    php8-curl \
    php8-dom \
    # php8-fileinfo\
    php8-fpm \
    # php8-gd \
    php8-iconv \
    # php8-imagick \
    php8-intl \
    # php8-fileinfo\
    php8-mbstring \
    php8-mysqli \
    php8-opcache \
    # php8-openssl \
    php8-pdo \
    php8-pdo_mysql \
    php8-phar \
    php8-posix \
    # php8-redis \
    php8-session \
    # php8-simplexml \
    # php8-tokenizer \
    php8-xdebug \
    php8-xml \
    php8-zip \
    # php8-zlib \

    coreutils \
    make \
    curl \
    git

RUN ln -sf /usr/bin/php8 /usr/bin/php

COPY app.ini.$ENVIRONMENT /etc/php8/conf.d/app.ini
COPY app.ini.$ENVIRONMENT /etc/php8/cli/conf.d/app.ini
COPY app.pool.conf /etc/php8/php-fpm.d/
COPY xdebug.ini /etc/php8/conf.d/
COPY xdebug.ini /etc/php8/cli/conf.d/

RUN echo "$(curl -sS https://composer.github.io/installer.sig) -" > composer-setup.php.sig \
   && curl -sS https://getcomposer.org/installer | tee composer-setup.php | sha384sum -c composer-setup.php.sig \
   && php composer-setup.php && rm composer-setup.php* \
   && chmod +x composer.phar && mv composer.phar /usr/bin/composer

RUN apk del coreutils

# RUN curl -1sLf "https://dl.cloudsmith.io/public/symfony/stable/setup.alpine.sh" | sh
# RUN apk add symfony-cli

CMD ["/usr/sbin/php-fpm8", "-F"]

WORKDIR /var/www/app
EXPOSE $PORT_NUMBER
