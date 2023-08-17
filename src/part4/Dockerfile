
FROM nginx:latest

WORKDIR /home/

COPY hello.c /hello.c

RUN \
touch /var/run/nginx.pid && \
chown -R nginx:nginx /var/ && \
chown -R nginx:nginx /usr/bin/ && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* && \
apt-get update && \
apt-get -y install gcc libfcgi-dev spawn-fcgi && \
gcc /hello.c -lfcgi -o /hello.fcgi

COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY fastcgi.conf /etc/nginx/fastcgi.conf
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT /run.sh
CMD ["/run.sh"]
