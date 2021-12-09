FROM siegfuse/php-fpm-74-base:v1.1.0

ARG HOST_USER_ID
ARG HOST_USER_NAME
ARG HOST_GROUP_ID
ARG HOST_GROUP_NAME

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY spx.ini /usr/local/etc/php/conf.d/spx.ini
COPY custom.ini /usr/local/etc/php/conf.d/zcustom.ini

RUN groupadd -f -g $HOST_GROUP_ID $HOST_GROUP_NAME && \
    useradd -m -d /home/$HOST_USER_NAME -s /bin/bash -g $HOST_GROUP_ID -u $HOST_USER_ID $HOST_USER_NAME || true && \
    echo "$HOST_USER_NAME  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R $HOST_USER_NAME.$HOST_GROUP_NAME /var/www/

WORKDIR /var/www/
