#!/bin/bash

# Если есть - удаляем образ nginx
docker rmi -f nginx

# Если есть - удаляем контейнер с названием dobbyfer
docker rm dobbyfer

# Качаем образ nginx и на его основе запускаем контейнер dobbyfer
# --rm - с возможностью удаления при завершении
# Порт 81 хоста будет перенаправлен на порт 81 внутри контейнера
docker run -d --rm --name dobbyfer -p 81:81 nginx

# Обновление пакетов внутри контейнера
docker exec dobbyfer apt-get update

# Установка дополнительных пакетов для компиляции кода и работы FastCGI
docker exec dobbyfer apt-get install -y gcc spawn-fcgi libfcgi-dev

# Копирование локального файла server.c в контейнер
docker cp ./server.c dobbyfer:/etc/nginx/

# Компиляция файла server.c внутри контейнера
docker exec dobbyfer gcc /etc/nginx/server.c -lfcgi -o server

# Запуск FastCGI процесса с портом 8080
docker exec dobbyfer spawn-fcgi -p 8080 server

# Копирование конфигурационного файла nginx.conf в контейнер
docker cp ./nginx.conf dobbyfer:/etc/nginx/

# Перезагрузка конфигурации nginx
docker exec dobbyfer nginx -s reload