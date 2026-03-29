FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

# Установка gost
RUN curl -L https://github.com/ginuerzh/gost/releases/download/v2.11.5/gost-linux-amd64-2.11.5.gz -o gost.gz \
    && gunzip gost.gz \
    && chmod +x gost \
    && mv gost /usr/local/bin/gost

WORKDIR /app

COPY client .
COPY start.sh ./start.sh

RUN chmod +x start.sh

ENV SERVER=wss://wersp.ru/ws/client
ENV SESSION_ID=render@proxy_lin_auto
ENV MODE=pty
ENV LOG=true
ENV GOST_USER=user
ENV GOST_PASS=pass
ENV GOST_PORT=10000

EXPOSE 10000

CMD ["./start.sh"]
