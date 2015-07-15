#!/bin/bash

#start the machine (currently will error if it already exists)
docker-machine create -d virtualbox --virtualbox-memory "768" --virtualbox-disk-size "10000" mesos-master

#set up docker environment for compose
eval $(docker-machine env mesos-master)

#Check for DOCKER_HOST and Eval the correct docker machine before running.
docker-compose --f mesos-master-compose.yml up -d --x-smart-recreate
