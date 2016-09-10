#!/bin/bash
#sudo rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm --nodeps
#sudo yum -y install mesos marathon
#sudo yum -y install mesosphere-zookeeper
sudo yum install -y sshpass epel-release net-tools psmisc htop tmux
sudo cat > /etc/hosts << EOF
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6
10.2.2.10 s1
10.2.2.11 s2
10.2.2.12 s3
10.2.2.7 m
EOF

sudo sed -i "s|PasswordAuthentication no|PasswordAuthentication yes|g" /etc/ssh/sshd_config
sudo service sshd restart
su vagrant
if [ ! -f $HOME/.ssh/id_rsa.pub ]
then
ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
fi
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@m
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@s1
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@s2
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@s3
