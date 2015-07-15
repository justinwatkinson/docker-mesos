# docker-mesos
Used to deploy a mesos-master using Docker

Note:  192.168.99.100 is the docker-machine IP for my mesos-master, and .101 is my mesos-slave-1.  This will be enhanced later to dynamically replace, or better yet, use libnetwork!  All of these images are also available in Docker Hub

Example syntax for starting this container:

docker run -d \
--net=host \
-e MESOS_HOSTNAME=192.168.99.100 \
-e MESOS_IP=192.168.99.100 \
-e MESOS_WORK_DIR=/var/mesos \
-e MESOS_LOG_DIR=/var/log \
-e MESOS_ZK=zk://192.168.99.100:2181/mesos \
-e MESOS_QUORUM=1 \
-e MESOS_ZK_SESSION_TIMEOUT=30secs \
-e MESOS_REGISTRY_STORE_TIMEOUT=15secs \
-p 5050:5050 \
justinwatkinson/mesos-master
