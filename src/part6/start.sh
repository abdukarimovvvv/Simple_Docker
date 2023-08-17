#!/bin/bash

docker-compose build
docker-compose up -d


sleep 1

echo ""
curl localhost:80
echo "\n"
curl localhost:80/status
echo ""