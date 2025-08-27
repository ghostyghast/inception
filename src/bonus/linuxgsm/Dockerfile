FROM debian:bullseye

RUN apt-get update
RUN apt-get install -y sudo procps curl jq iproute2

COPY tools/entrypoint.sh /
COPY tools/setup.sh /
RUN chmod +x /entrypoint.sh
RUN chmod +x /setup.sh

EXPOSE 2456
EXPOSE 2457

ENTRYPOINT ["/entrypoint.sh"]