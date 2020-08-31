FROM httpd:2.4-alpine

COPY custom.conf /tmp/custom.conf
COPY project.conf /tmp/project.conf

RUN mv /tmp/custom.conf /usr/local/apache2/conf/custom.conf && \
    mv /tmp/project.conf /usr/local/apache2/conf/project.conf && \
    printf "Include conf/custom.conf\n" >> /usr/local/apache2/conf/httpd.conf && \
    printf "Include conf/project.conf" >> /usr/local/apache2/conf/httpd.conf
