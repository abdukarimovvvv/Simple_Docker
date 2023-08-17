#!/bin/bash

docker images
echo

echo "Создать новый образ:"
trash=$(docker build -t s21_nginx:1.0 .)
echo
docker images
echo
echo "Run:"
trash=$(docker run --name s21_vanesawo -p 80:81 -d s21_nginx:1.0)
echo
docker ps
echo
echo "Проверить результат - curl localhost:80 и curl localhost:80/status"