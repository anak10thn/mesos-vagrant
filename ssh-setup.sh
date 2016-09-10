#!/bin/bash
if [ ! -f $HOME/.ssh/id_rsa.pub ]
then
ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
fi
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@m
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@s1
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@s2
sshpass -p "vagrant" ssh-copy-id -i $HOME/.ssh/id_rsa.pub vagrant@s3
