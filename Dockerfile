# Dockerfile for a minimal mod_lua driven HTTP proxy
FROM gliderlabs/alpine:3.3

RUN apk update && apk add --no-cache apache2 apache2-lua apache2-proxy

# Optional troubleshooting stuff
# RUN apk add --no-cache curl vim

COPY fsroot /

RUN mkdir -p /run/apache2
RUN chmod +x /scripts/start.sh

WORKDIR /scripts
CMD sh -c ./start.sh
