#!/bin/bash

spawn-fcgi -a 127.0.0.1 -p 8080 -fastcgi /hello.fcgi

nginx -g 'daemon off;'

nginx -s reload

#spawn-fcgi -p 8080 -n /hello.fcgi
