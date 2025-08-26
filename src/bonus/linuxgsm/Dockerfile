FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y sudo procps curl jq iproute2

COPY tools/entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 2456
EXPOSE 2457

ENTRYPOINT ["/entrypoint.sh"]