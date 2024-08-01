FROM nginx
USER root
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c /home/server.c 
COPY ./run.sh /home/run.sh
RUN apt-get update; \
    apt-get install -y gcc spawn-fcgi libfcgi-dev
WORKDIR /home/
ENTRYPOINT ["sh", "./run.sh"]