FROM alpine:latest AS builder
RUN apk add --no-cache curl unzip
RUN curl -L https://github.com/XTLS/Xray-core/releases/download/v1.8.10/Xray-linux-64.zip -o xray.zip \
    && unzip xray.zip -d /xray

FROM caddy:alpine

COPY --from=builder /xray/xray /usr/bin/xray
COPY config.json /etc/xray/config.json
COPY Caddyfile /etc/caddy/Caddyfile
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
