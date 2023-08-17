#!/bin/bash

docker stop cont1
docker stop cont2
docker rm cont1
docker rm cont2
docker rmi -f server:server