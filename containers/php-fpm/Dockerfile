FROM phpdockerio/php73-fpm:latest

COPY xdebug.ini /tmp/xdebug.ini

RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.3-mysql php-xdebug php7.3-bcmath php7.3-gd php7.3-imap php7.3-soap \
    && mv /tmp/xdebug.ini /etc/php/7.3/fpm/conf.d/20-xdebug.ini \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*