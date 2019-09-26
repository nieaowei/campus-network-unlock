FROM centos:latest

ADD softether-vpnserver.tar.gz /usr/local

ADD vpn_server.config /usr/local/vpnserver

WORKDIR /usr/local/vpnserver

RUN make

ENTRYPOINT [ "./vpnserver","start" ]