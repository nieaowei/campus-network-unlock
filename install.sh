#!/bin/bash
echo "The script is starting."
echo "The docker installer is running."
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
systemctl enable docker
systemctl start docker
echo "The images is pulling."
docker pull nieaowei/campus_network_unlock
docker run -d -p 443:443 -p 53:53 -p 67:67 -p 68:68 -p 69:69 nieaowei/campus_network_unlock
echo "The container is started."