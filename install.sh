#!/bin/bash
echo "The script is starting."
echo "The docker installer is running."
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
systemctl enable docker
systemctl stop firewalld
systemctl start docker
echo "The images is pulling."
docker pull nieaowei/campus_network_unlock
echo "The dchlient is closing. The port 68 is open for docker."
ps -ef | grep dhclient | grep -v grep | awk '{print $2}' | xargs kill -9
docker run --net=host -d nieaowei/campus_network_unlock
echo "The container is started."