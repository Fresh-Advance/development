FROM httpd:2.4-alpine

COPY custom.conf /usr/local/apache2/conf/custom.conf
COPY project.conf /usr/local/apache2/conf/project.conf

RUN printf "Include conf/custom.conf\n" >> /usr/local/apache2/conf/httpd.conf && \
    printf "Include conf/project.conf" >> /usr/local/apache2/conf/httpd.conf
