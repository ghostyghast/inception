FROM alpine:3.22.0

RUN apk add --no-cache \
  php83 \
  php83-mysqli \
  php83-fpm \
  php83-session \
  php83-opcache \
  php83-json \
  php83-mbstring \
  php83-curl \
  php83-dom \
  php83-gd \
  php83-phar \
  php83-tokenizer \
  curl


RUN mkdir -p /var/www/html

# Download wordpress cli and move it to path
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chown -R nobody:nogroup /var/www/html

# Configure PHP-FPM to listen on all interfaces
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 9000/' /etc/php83/php-fpm.d/www.conf

COPY tools/wp-config.sh /
COPY conf/wp-cli.yml /

RUN chmod +x /wp-config.sh

EXPOSE 9000

ENTRYPOINT [ "/wp-config.sh" ]