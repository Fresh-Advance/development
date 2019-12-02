FROM php:7.3-fpm

COPY xdebug.ini /tmp/xdebug.ini
COPY user.ini /tmp/user.ini

ARG HOST_USER_ID
ARG HOST_USER_NAME
ARG HOST_GROUP_ID
ARG HOST_GROUP_NAME

ARG RUNTIME_PACKAGE_DEPS="msmtp libfreetype6 libjpeg62-turbo unzip git mariadb-client sudo rsync liblz4-tool libzip-dev"
ARG BUILD_PACKAGE_DEPS="libcurl4-openssl-dev libjpeg-dev libpng-dev libxml2-dev"
ARG PHP_EXT_DEPS="curl json xml mbstring zip bcmath soap pdo_mysql gd mysqli"
ARG PHP_MEMORY_LIMIT="-1"

# install dependencies and cleanup (needs to be one step, as else it will cache in the laver)
RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        $RUNTIME_PACKAGE_DEPS \
        $BUILD_PACKAGE_DEPS \
    && docker-php-ext-configure gd --with-jpeg-dir=/usr/local/ \
    && docker-php-ext-install -j$(nproc) $PHP_EXT_DEPS \
    && pecl install xdebug \
    && mv /tmp/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini \
    && mv /tmp/user.ini /usr/local/etc/php/conf.d/user.ini \
    && apt-get clean \
    && apt-get autoremove -y \
    && apt-get purge -y --auto-remove $BUILD_PACKAGE_DEPS \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

# set sendmail for php to ssmtp
RUN echo "sendmail_path=/usr/bin/msmtp -t" > /usr/local/etc/php/conf.d/php-sendmail.ini
RUN printf "host mailhog\nport 1025" >> /etc/msmtprc

# remove memory limit
RUN echo "memory_limit = $PHP_MEMORY_LIMIT" > /usr/local/etc/php/conf.d/memory-limit-php.ini

# install latest composer
RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv /var/www/html/composer.phar /usr/local/bin/composer

RUN groupadd -f -g $HOST_GROUP_ID $HOST_GROUP_NAME && \
    useradd -m -d /home/$HOST_USER_NAME -s /bin/bash -g $HOST_GROUP_ID -u $HOST_USER_ID $HOST_USER_NAME || true && \
    echo "$HOST_USER_NAME  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R $HOST_USER_NAME.$HOST_GROUP_NAME /var/www/

WORKDIR /var/www/
