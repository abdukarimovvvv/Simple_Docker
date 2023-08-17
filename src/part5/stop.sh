#!/bin/bash

docker stop tmp
docker rm tmp
docker rmi -f server:server