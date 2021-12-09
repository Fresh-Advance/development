FROM php:7.4-fpm

ARG RUNTIME_PACKAGE_DEPS="msmtp libfreetype6 libjpeg62-turbo unzip git mariadb-client sudo rsync liblz4-tool libzip-dev"
ARG BUILD_PACKAGE_DEPS="libcurl4-openssl-dev libjpeg-dev libpng-dev libxml2-dev libonig-dev"
ARG PHP_EXT_DEPS="curl json xml mbstring zip bcmath soap pdo_mysql gd mysqli intl"
ARG PHP_MEMORY_LIMIT="-1"

# install dependencies and cleanup (needs to be one step, as else it will cache in the laver)
RUN apt-get update -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        $RUNTIME_PACKAGE_DEPS \
        $BUILD_PACKAGE_DEPS \
    && docker-php-ext-configure gd --with-jpeg \
    && docker-php-ext-install -j$(nproc) $PHP_EXT_DEPS \
    && pecl install xdebug \
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

# install spx
RUN cd /usr/lib && git clone https://github.com/NoiseByNorthwest/php-spx.git
RUN cd /usr/lib/php-spx && phpize && ./configure && make && make install