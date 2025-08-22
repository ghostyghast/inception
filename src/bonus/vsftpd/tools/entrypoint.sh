#! /bin/sh

mkdir -p /var/www/html
adduser -D -h /var/www/html $VSFTPD_USER
echo "$VSFTPD_USER:$VSFTPD_PASSWORD" | chpasswd
chown ftp_user:ftp_user /var/www/html

vsftpd /etc/vsftpd.conf