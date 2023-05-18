# Описание целевого состояния приложения и его архитектуры
- Сервисы Приложения подготовлены в виде контейнеров
  - Контейнер ui
  - Контейнер crawler
  - Контейнер mongodb
  - Контейнер rabbitmq
  - Контейнер prometheus (Prometheus, Grafana to be)
  - Контейнер node-exporter (Prometheus node-exporter)
- CI/CD конвеер в gitlab, gitlab-runner
  - ВМ gitlab или роль gitlab на docker-host
   - Контейнер gitlab
   - Контейнер gitlab-runner
- Репозитории 
  - Репозитории исходного кода приложения, IAC - github
  - Репозитории образов контейнеров hub.docker.com
  - Репозитории CI/CD pipeline, исходного кода приложений - gitlab на своей ВМ

# How to start - Сборка и запуск приложения
# Настройка локального окружения на АРМ devops:
1. На АРМ devops установить:
    - git
    - yc cli
    - terraform
    - docker, dockermachine
# Основная часть
2. Подготовить аккаунт yandex облако
   - зарегистрировать yandex облако и ввести конфигурационные данные в конфиг файл.
  - скриптом создать сервисную учетную запись для работы
    bash ./terraform/infra/yc_sa_create.sh
   
3. Развернуть инфраструктуру с помощью terraform & docker 
    - Склонировать repo github c IAC
    cd ~ && git clone git@github.com:coolf124-vlab101/search_engine.git
    - Подготовка backend для terrafrom
    cd ./terraform/prepare_backend/ && terrafrom apply
    - Скопировать параметры для настройки backend в файл ./terraform/terraform.tfvars
    - Развертнуть сети и docker-host или k8s кластер 
    cd ./terraform/ && terrafrom apply
    - Развертнуть контейнеры с приложениями с помощью docker-compose или kubectl 
    cd ./docker/ && docker-compose ‐‐context remote up -d

4.  Запустить мониторинг 
    - cd ./monitoring/ && docker-compose ‐‐context remote up -d

5. Запустить CI/CD
   Запустить gitlab
    - cd ./gitlab-ci/ && docker-compose ‐‐context remote up -d
   Запустить gitlab-runner
    bash ./gitlab-ci/add-runner.sh
