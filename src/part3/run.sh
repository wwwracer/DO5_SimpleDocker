#!/bin/bash

gcc -o server server.c -lfcgi
spawn-fcgi -p 80 ./server
service nginx start
./server