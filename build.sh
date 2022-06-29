#!/bin/bash

docker build . -t source-cpg --build-arg UID=$(id -u) --build-arg GID=$(id -g)
