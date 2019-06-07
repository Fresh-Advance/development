FROM phpdockerio/php73-fpm:latest

ARG HOST_USER_ID
ARG HOST_USER_NAME
ARG HOST_GROUP_ID
ARG HOST_GROUP_NAME

COPY xdebug.ini /tmp/xdebug.ini

RUN apt-get update \
    && apt-get -y --no-install-recommends install php7.3-mysql php-xdebug php7.3-bcmath php7.3-gd php7.3-imap php7.3-soap \
    && mv /tmp/xdebug.ini /etc/php/7.3/fpm/conf.d/20-xdebug.ini \
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN groupadd -f -g $HOST_GROUP_ID $HOST_GROUP_NAME && \
    useradd -m -d /home/$HOST_USER_NAME -s /bin/bash -g $HOST_GROUP_ID -u $HOST_USER_ID $HOST_USER_NAME || true && \
    echo "$HOST_USER_NAME  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir /var/www/ && \
    chown -R $HOST_USER_NAME.$HOST_GROUP_NAME /var/www/

USER $HOST_USER_NAME

WORKDIR /var/www/