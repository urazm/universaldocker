#!/bin/bash

docker rmi -f guerenla_docker && docker build --tag guerenla_docker . && docker run -it guerenla_docker zsh

