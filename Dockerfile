FROM centos:latest

ADD softether-vpnserver.tar.gz /usr/local

ADD vpn_server.config /usr/local/vpnserver

WORKDIR /usr/local/vpnserver

RUN ls && yum install -y gcc automake autoconf libtool make grep && make

ENTRYPOINT [ "./vpnserver","start" ]