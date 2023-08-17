FROM nginx:latest

USER root

WORKDIR /home/

COPY server/nginx.conf /etc/nginx/nginx.conf
COPY server/server.c /home/server.c

RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev; \
    gcc server.c -lfcgi -o server; \
    rm -f server.c; \
    useradd nginx; \
    chown -R nginx:nginx /etc/nginx/nginx.conf; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists

USER nginx

ENTRYPOINT service nginx start && spawn-fcgi -p 8080 -n server