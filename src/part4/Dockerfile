FROM nginx

USER root

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.c /home/server.c
COPY run.sh /home/run.sh

RUN apt update && apt install gcc spawn-fcgi libfcgi-dev
WORKDIR /home/
CMD ["/home/run.sh"]