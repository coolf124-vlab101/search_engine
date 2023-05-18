#!/bin/bash
#загрузить параметры окружения
set -o allexport
source .env set
+o allexport
# надо заранее создать сеть в docker search
docker network create search
# запускаем контейнеры приложения

# запускаем контейнер с базой 
docker run -d --network=search -p 27017:27017 --network-alias=mongodb --name=mongodb -v mongodb:/data/db mongo:4.4

# запускаем контейнер с rabbitmq 
docker run -d --network=search --network-alias=rabbitmq --name=rabbitmq rabbitmq:3.11.2-alpine

# запускаем контейнер с crawler 
docker run -d --network=search --network-alias=crawler \
-e RMQ_HOST='rabbitmq' \
-e MONGO='mongodb' \
-e MONGO_PORT='27017' \
-e CHECK_INTERVAL='10' \
-e EXCLUDE_URLS='' \

# запускаем контейнер с UI
sleep 10
docker run -d --network=search -p 8000:8000 --network-alias=ui -e MONGO_PORT='27017' -e MONGO='mongodb' --name=ui ${DOCKER_LOGIN}/search_engine_ui:1.0
