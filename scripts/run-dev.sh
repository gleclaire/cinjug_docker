#!/usr/bin/env bash

#docker-compose -f docker-compose.yml -f docker-compose.dev.yml  $*
docker-compose -f docker-compose.yml -f docker-compose.dev.yml -f docker-compose.utils.yml  $*
