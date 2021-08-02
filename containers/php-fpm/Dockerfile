FROM siegfuse/php-fpm:1.1.0

ARG HOST_USER_ID
ARG HOST_USER_NAME
ARG HOST_GROUP_ID
ARG HOST_GROUP_NAME

COPY xdebug.ini /tmp/xdebug.ini
COPY user.ini /tmp/user.ini
COPY spx.ini /tmp/spx.ini

RUN mv /tmp/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini \
    && mv /tmp/user.ini /usr/local/etc/php/conf.d/user.ini \
    && mv /tmp/spx.ini /usr/local/etc/php/conf.d/spx.ini

RUN groupadd -f -g $HOST_GROUP_ID $HOST_GROUP_NAME && \
    useradd -m -d /home/$HOST_USER_NAME -s /bin/bash -g $HOST_GROUP_ID -u $HOST_USER_ID $HOST_USER_NAME || true && \
    echo "$HOST_USER_NAME  ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    chown -R $HOST_USER_NAME.$HOST_GROUP_NAME /var/www/

RUN cd /usr/lib && git clone https://github.com/NoiseByNorthwest/php-spx.git
RUN cd /usr/lib/php-spx && phpize && ./configure && make && make install

WORKDIR /var/www/
