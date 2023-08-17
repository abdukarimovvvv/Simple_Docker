## **Part 1. Готовый докер**

- Взять официальный докер образ с **nginx** и выкачать его при помощи `docker pull`
    ![image info](/src/screen/1.png)

- Проверить наличие докер образа через `docker images`
    ![image info](/src/screen/2.png)

- Запустить докер образ через `docker run -d 6efc10a0510f`
    ![image info](/src/screen/3.png)

- Проверить, что образ запустился через `docker ps`
    ![image info](/src/screen/4.png)

-  Посмотреть информацию о контейнере через `docker inspect`
    ![image info](/src/screen/5.png)
- **size**
    ![image info](/src/screen/6.png)
- **ip**
    ![image info](/src/screen/7.png)
- **Ports**
    ![image info](/src/screen/8.png)

- Остановить докер образ через `docker stop`
    ![image info](/src/screen/9.png)

- Проверить, что образ остановился через `docker ps`
    ![image info](/src/screen/10.png)

- Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*
    ![image info](/src/screen/11.png)

- Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
    ![image info](/src/screen/12.png)

- Перезапустить докер контейнер через `docker restart`
    ![image info](/src/screen/13.png)


## **Part 2. Операции с контейнером**

- Прочитать конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*
    ![image info](/src/screen/14.png)

- Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**
    ![image info](/src/screen/15.png)

- Скопировать созданный файл *nginx.conf* внутрь докер образа через команду `docker cp`
    ![image info](/src/screen/16.png)

- Перезапустить **nginx** внутри докер образа через команду *exec*
    ![image info](/src/screen/17.png)

- Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
    ![image info](/src/screen/18.png)

- Экспортировать контейнер в файл *container.tar* через команду *export*
    ![image info](/src/screen/19.png)

- Остановить контейнер
    ![image info](/src/screen/20.png)

- Удалить образ через `docker rmi`
    ![image info](/src/screen/21.png)

- Удалить остановленный контейнер
    ![image info](/src/screen/22.png)

- Импортировать контейнер обратно через команду *import*
    ![image info](/src/screen/23.png)

- Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
    ![image info](/src/screen/24.png)


## **Part 3. Мини веб-сервер**

- Написать мини сервер на **C** и **FastCgi**, который будет возвращать простейшую страничку с надписью `Hello World!`
    ![image info](/src/screen/25.png)

- Написать свой **nginx.conf**, который будет проксировать все запросы с `81` порта на `127.0.0.1:8080`
    ![image info](/src/screen/27.png)

- Запустить написанный мини сервер через spawn-fcgi на порту 8080

    ### **`Команды`**:
    
    **`docker pull nginx`**\
    **`docker run -d -p 81:81 --name vanesawo nginx`**\
    **`docker cp ./miniserver.c vanesawo:etc/nginx/`**\
    **`docker cp ./nginx.conf vanesawo:/etc/nginx/`**\
    **`docker exec vanesawo apt-get update`**\
    **`docker exec vanesawo apt-get install -y gcc spawn-fcgi libfcgi-dev`**\
    **`docker exec vanesawo gcc /etc/nginx/miniserver.c -lfcgi`**\
    **`docker exec vanesawo spawn-fcgi -p 8080 a.out`**\
    **`docker exec vanesawo nginx -s reload`**\
    **`curl http://localhost:81/`**\

    ![image info](/src/screen/26.png)

- Проверить, что в браузере по **`localhost:81`** отдается написанная вами страничка
    ![image info](/src/screen/28.png)