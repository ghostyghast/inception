FROM alpine:3.22.0

RUN apk update
RUN apk add apache2

ARG INDEX_DIR="/var/www/localhost/htdocs"

COPY tools/website.html ${INDEX_DIR}/index.html

CMD ["httpd", "-D", "FOREGROUND"]