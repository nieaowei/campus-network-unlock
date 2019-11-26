#!/bin/bash
res=""
echo "The script is running."
echo "The docker installer is running."
if res=`docker --version | grep "Docker"`
then
	echo "The Docker is installed."
	echo "Your Docker vesion is $res"
elif	curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
then
	echo "The Docker install is sucessed."
else
	echo "The Docker install is faild."
	exit 1
fi

if systemctl status docker | grep "running"
then
	echo "The Docker is running."
elif systemctl start docker
then
	echo "The Docker is started."
else
	echo "The Docker start is faild."
	exit 2
fi

if systemctl enable docker
then
	echo "The Docker autonal starting is set."
else
	echo "The Docker autonal start seting is faild."	
fi

if docker pull nieaowei/campus_network_unlock
then
	echo "The image is pull."
else
	echo "The image pulling is faild.Your network is probrably faild."
	exit 3
fi

if ps -ef | grep dhclient | grep -v grep | awk '{print $2}' | xargs kill -9
then
	echo "The dhclient is closed."
else
	echo "The dhclent closeing is faild. It probably is closed."
fi

if docker run --net=host -d nieaowei/campus_network_unlock
then
	echo "The images is running."
else
	echo "The images running is faild."
	exit 4
fi

if mkdir ~/auto-scripts && cd ~/auto-scripts
then
	echo "The project dir is made."
	if curl -O https://raw.githubusercontent.com/nieaowei/campus_network_unlock/master/campus_network_unlock.sh
	then
		chmod +x campus_network_unlock.sh && ./campus_network_unlock.sh
		chmod +x /etc/rc.d/rc.local
		echo "~/auto-scripts/campus_network_unlock.sh" >> /etc/rc.d/rc.local
		echo "The auto start scripts is installed."
	else
		echo "The auto start scripts installing is faild."
	fi
else
	echo "The project dir making is faild."
fi
