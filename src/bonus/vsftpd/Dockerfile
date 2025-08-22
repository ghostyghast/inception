FROM alpine:3.22.0

RUN apk add --no-cache vsftpd

EXPOSE 21 3000-3009

COPY ./tools/vsftpd.conf /etc/vsftpd.conf
COPY ./tools/entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]