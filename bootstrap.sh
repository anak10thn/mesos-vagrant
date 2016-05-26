#!/bin/bash
sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm --nodeps
sudo yum -y install mesos marathon
sudo yum -y install mesosphere-zookeeper
