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