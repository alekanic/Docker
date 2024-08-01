# Базовый образ для сборки
FROM nginx

# Устанавливает рабочую директорию для последующих инструкций
WORKDIR /home

# Копирует нужные файлы в сервер
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./server.c .
COPY ./run.sh .

# Обновление пакетов, установка копилятора gcc и программы для запуска FastCGI
RUN apt-get update
RUN apt-get install -y gcc spawn-fcgi libfcgi-dev 

# Указывает, что при зазпуске контейнера должен выполняться скрипт run.sh
ENTRYPOINT ["sh", "./run.sh"]
