#!/usr/bin/env bash

docker build -t call-control:0.0.8 --build-arg SERVICE_NAME=call-control demo
docker build -t tel-switch:0.0.8 --build-arg SERVICE_NAME=tel-switch demo
