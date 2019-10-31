FROM centos:latest

ADD softether-vpnserver.tar.gz /usr/local

WORKDIR /usr/local/vpnserver

ADD ./vpn_server.config /usr/local/vpnserver
ADD ./speederv2_binaries.tar.gz /usr/local/vpnserver
ADD ./start.sh /usr/local/vpnserver

RUN yum install -y which gcc automake autoconf libtool make&& sh -c '/bin/echo -e "1\n1\n1\n" | make' && chmod 777 vpnserver 
    # && wget https://github.com/wangyu-/UDPspeeder/releases/download/20180522.0/speederv2_binaries.tar.gz \
    # && tar zxvf speederv2_binaries.tar.gz \
    # && ./vpnserver start
# ADD ./vpn_server.config /usr/local/vpnserver
# ADD ./start.sh /usr/local/vpnserver


EXPOSE 443/tcp

# ENTRYPOINT [ "./vpnserver","execsvc"]
# ENTRYPOINT [ "./speederv2_amd64","-s","-l0.0.0.0:68","-r127.0.0.1:1194","-k\"passwd\"","-f2:4","--timeout","1" ]
ENTRYPOINT [ "./start.sh" ]