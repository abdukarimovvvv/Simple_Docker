#!/bin/bash

docker build . -t server:server
docker run -d -p 80:81 --name tmp server:server
docker exec tmp bash run.sh

sleep 1

echo ""
curl localhost:80
echo "\n"
curl localhost:80/status
echo ""