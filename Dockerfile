FROM ubuntu:14.04.2

MAINTAINER justinwatkinson justin.watkinson@gmail.com

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
    DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]') && \
    CODENAME=$(lsb_release -cs) && \
    echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" |  tee /etc/apt/sources.list.d/mesosphere.list

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends mesos marathon && \
    apt-get -y autoremove && \
    apt-get -y clean

EXPOSE 5050

ENTRYPOINT /usr/sbin/mesos-master
