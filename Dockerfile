FROM teddysun/v2ray:latest AS v2ray

FROM caddy:alpine

COPY --from=v2ray /usr/bin/v2ray /usr/bin/v2ray
COPY config.json /etc/v2ray/config.json
COPY Caddyfile /etc/caddy/Caddyfile

EXPOSE 8080

CMD ["sh", "-c", "v2ray run -config /etc/v2ray/config.json & caddy run --config /etc/caddy/Caddyfile --adapter caddyfile"]
