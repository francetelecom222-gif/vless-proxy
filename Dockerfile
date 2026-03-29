FROM teddysun/v2ray:latest

COPY config.json /etc/v2ray/config.json

EXPOSE 8080

CMD ["v2ray", "run", "-config", "/etc/v2ray/config.json"]
