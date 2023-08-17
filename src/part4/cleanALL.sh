#!/bin/bash

trash=$(docker run -d nginx)
trash=$(docker stop $(docker ps -q))
trash=$(docker rm $(docker ps -qa))
trash=$(docker rmi $(docker images -q))
