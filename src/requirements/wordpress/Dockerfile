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
  curl


RUN mkdir -p /var/www/html

# Download and extract WordPress properly
RUN curl https://wordpress.org/latest.tar.gz | tar zx -C /var/www/html --strip-components=1
RUN chown -R nobody:nogroup /var/www/html

# Configure PHP-FPM to listen on all interfaces
RUN sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php83/php-fpm.d/www.conf

COPY tools/wp-config.sh /

RUN chmod +x /wp-config.sh

EXPOSE 9000

ENTRYPOINT [ "/wp-config.sh" ]