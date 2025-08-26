FROM alpine:3.22.0

RUN apk update
RUN apk add php php-mysqli php-session wget

ARG ADMINER_DIR="/var/www/php"

RUN mkdir -p ${ADMINER_DIR}
WORKDIR ${ADMINER_DIR}

RUN wget www.adminer.org/static/download/5.3.0/adminer-5.3.0.php -O index.php

RUN chown -R nobody:nogroup index.php && \
    chmod 755 -R index.php

CMD ["php", "-S", "0.0.0.0:8080"]