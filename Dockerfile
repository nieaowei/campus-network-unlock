FROM centos:latest

ADD softether-vpnserver.tar.gz /usr/local

ADD ./vpn_server.config /usr/local/vpnserver

RUN rm -rf *

WORKDIR /usr/local/vpnserver

RUN make

ENTRYPOINT [ "./vpnserver","start" ]