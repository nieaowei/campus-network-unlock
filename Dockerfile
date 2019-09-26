FROM centos:latest

ADD softether-vpnserver.tar.gz /usr/local

WORKDIR /usr/local/vpnserver

RUN yum install -y which gcc automake autoconf libtool make&& sh -c '/bin/echo -e "1\n1\n1\n" | make' && chmod 777 vpnserver

ADD ./vpn_server.config /usr/local/vpnserver

EXPOSE 443/tcp

ENTRYPOINT [ "./vpnserver","execsvc"]