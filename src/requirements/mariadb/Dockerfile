FROM alpine:3.22.0

RUN apk add --no-cache mariadb mariadb-client envsubst

RUN mkdir -p /var/lib/mysql /run/mysqld

RUN chown -R nobody:nogroup /var/lib/mysql /run/mysqld

COPY tools/init.sql.template /
COPY tools/init-db.sh /

RUN chmod +x /init-db.sh

EXPOSE 3306

CMD ["/init-db.sh"]