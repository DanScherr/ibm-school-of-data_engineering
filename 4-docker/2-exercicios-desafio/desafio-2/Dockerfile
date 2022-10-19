FROM redhat/ubi8:8.5

LABEL maintainer="Daniel Scheicher danielscheicher@gmail.com"
LABEL description="A custom Apache container based on UBI 8:8.5"

RUN yum install -y httpd && \
    yum clean all

COPY ./src /var/www/html/

ENV PORT 8080

EXPOSE ${PORT}

RUN sed -ri -e "/^Listen 80/c\Listen ${PORT}" /etc/httpd/conf/httpd.conf && \
    chown -R apache:apache /etc/httpd/logs/ && \
    chown -R apache:apache /run/httpd/

CMD ["httpd", "-D", "FOREGROUND"]