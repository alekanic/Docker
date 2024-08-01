# Базовый образ для сборки
FROM nginx

# Устанавливает рабочую директорию для последующих инструкций
WORKDIR /home

# Копирует нужные файлы в сервер
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .

# К обновлению списка пакетов в системе и установке необходимых пакетов для
# компиляции и запуска приложения добавляется изменение владельца файлов на пользователя
# и группу nginx
RUN apt-get update; \ 
apt-get install -y gcc spawn-fcgi libfcgi-dev; \
chown -R nginx:nginx /etc/nginx/nginx.conf; \
chown -R nginx:nginx /var/cache/nginx; \
chown -R nginx:nginx /home; \
chmod u-s /usr/sbin/unix_chkpwd; \
chmod g-s /usr/sbin/unix_chkpwd; \
chmod u-s /usr/bin/chage; \
chmod g-s /usr/bin/chage; \
chmod u-s /usr/bin/chsh; \
chmod g-s /usr/bin/chsh; \
chmod u-s /usr/bin/su; \
chmod g-s /usr/bin/su; \
chmod u-s /usr/bin/expiry; \
chmod g-s /usr/bin/expiry; \
chmod u-s /usr/bin/newgrp; \
chmod g-s /usr/bin/newgrp; \
chmod u-s /usr/bin/gpasswd; \
chmod g-s /usr/bin/gpasswd; \
chmod u-s /usr/bin/wall; \
chmod g-s /usr/bin/wall; \
chmod u-s /usr/bin/umount; \
chmod g-s /usr/bin/umount; \
chmod u-s /usr/bin/mount; \
chmod g-s /usr/bin/mount; \
chmod u-s /usr/bin/chfn; \
chmod g-s /usr/bin/chfn; \
chmod u-s /usr/bin/passwd; \
chmod g-s /usr/bin/passwd; \
touch /var/run/nginx.pid; \
chown -R nginx:nginx /var/run/nginx.pid; \
rm -rf /var/lib/apt/lists

USER nginx

# Указывает, что при зазпуске контейнера должен выполняться скрипт run.sh
ENTRYPOINT ["sh", "./nginx_start.sh"]

HEALTHCHECK NONE