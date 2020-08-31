FROM siegfuse/php-fpm:1.0.0

ARG HOST_USER_ID
ARG HOST_USER_NAME
ARG HOST_GROUP_ID
ARG HOST_GROUP_NAME

COPY xdebug.ini /tmp/xdebug.ini
COPY user.ini /tmp/user.ini

RUN mv /tmp/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini \
    && mv /tmp/user.ini /usr/local/etc/php/conf.d/user.ini

RUN groupadd -f -g $HOST_GROUP_ID $HOST_GROUP_NAME && \
    useradd -m -d /home/$HOST_USER_NAME -s /bin/bash -g $HOST_GROUP_ID -u $HOST_USER_ID $HOST_USER_NAME || true && \
    echo "$HOST_USER_NAME  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R $HOST_USER_NAME.$HOST_GROUP_NAME /var/www/

WORKDIR /var/www/
