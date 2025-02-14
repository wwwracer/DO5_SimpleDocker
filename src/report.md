# Part 1

`docker pull nginx`

![alt text](../src/png/pull_nginx.png)

* Эта команда загрузит последний доступный образ Nginx из Docker Hub. Если вы хотите загрузить конкретную версию, вы можете указать её, добавив тег. Например, для версии 1.21 вы можете использовать:

`docker pull nginx:1.21`

![alt text](../src/png/images.png)

`docker images`

* покажет список всех загруженныйх образов

* Запусти докер-образ через `docker run -d [image_id|repository]`

![alt text](../src/png/runn.png)

`docker run -d nginx`

* Проверь, что образ запустился через docker ps

![alt text](../src/png/dockerPS.png)

* Посмотри информацию о контейнере через docker inspect [container_id|container_name]

![alt text](../src/png/inspect.png)

* Размер контейнера можно определить по объединению всех слоев в GraphDriver.Data.LowerDir. В данном случае это не указано явно, но известно, что контейнер использует драйвер overlay2 с множеством слоев, которые указаны в поле LowerDir. В данном случае нет информации о размерах слоёв исходя из команды docker inspect .. ..
![alt text](../src/png/graph.png)

`shmsize`  нужный размер

![alt text](../src/png/zize.png)

* В поле ExposedPorts указаны порты, которые контейнер выставляет наружу:

`80/tcp`

![alt text](../src/png/tcp.png)

* В поле IPAddress контейнера указано, что контейнер имеет IP-адрес

![alt text](../src/png/ip.png)

* остановка и проверка чтто конецйнер

![alt text](../src/png/stop_ps.png)

поднятие контейнеера на портах 80, 443

![alt text](../src/png/port.png)
![alt text](../src/png/localhost.png)

* Перезапусти докер контейнер через docker restart [container_id|container_name].

![alt text](../src/png/restart.png)

# Part 2

* Прочитай конфигурационный файл nginx.conf внутри докер контейнера через команду exec.

![alt text](../src/png/conf.png)

* Скопируй созданный файл nginx.conf внутрь докер-образа через команду docker cp.

![alt text](../src/png/cp.png)

* Перезапусти nginx внутри докер-образа через команду exec

![alt text](../src/png/reload.png)

* Проверь, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

![alt text](../src/png/status.png)

* Экспортируй контейнер в файл container.tar через команду export.

![alt text](../src/png/export1.png)
![alt text](../src/png/export2.png)

* Останови контейнер.

![alt text](../src/png/stop2.png)

* Удали образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры.

![alt text](../src/png/rmi.png)

![alt text](../src/png/rm1.png)

* Импортируй контейнер обратно через команду import

![alt text](../src/png/import.png)

* Проверь, что по адресу localhost:80/status отдается страничка со статусом сервера nginx.

![alt text](../src/png/status2.png)

# Patr 3

* скачал библиотеку для поднятиля локал. сервера, инструкция в readme

    <https://github.com/toshic/libfcgi>

* поднимаем контейнер nginx на портах 81, перенорсим конф. файл и сервер на машину в докере

![alt text](../src/png/81.png)

* для удобства переиминовал

![alt text](../src/png/exec.png)

* подключился к машине, прежде перенес все файлы из /part3/* на машину

![alt text](../src/png/cpp.png)

![alt text](../src/png/part3.png)

![alt text](../src/png/server_sh.png)

# Part 4

* напиисал свой докер файл, скипт по запуску и nginx.conf из part3

![alt text](../src/png/Dfile.png)

![alt text](../src/png/script.png)

nging.conf осттался тот же

    docker build -t part4 .

команда для сбора образа по `dockerfile`

* проверяем через `docker images`

![alt text](../src/png/build.png)

* все есть, запускаем с маппингом 81 порта на 80 на локальной машине

![alt text](../src/png/part4_run.png)

![alt text](../src/png/Lhost80.png)

# Part 5

* требуется прверить Docker образ на безопасность при помощи `dockle`

![alt text](../src/png/dockle.png)
![alt text](../src/png/dockle2.png)

* 2 скрина, один с ошибкой, другой с ее исправлением.
это ошибка которую не исправить.

# Part 6

изменяем файлы согласно тз, так чтобы на loaclhost был развернут наш сайт

командой `docker-compose up --build` можно собрать и сразу запустить
![alt text](../src/png/part6.2.png)

все успешно собралось и запустилось

Вывод localhost
![alt text](../src/png/part6.1.png)
