FROM centos:latest

RUN tar -C /usr/local -xzf softether-vpnserver.tar.gz

ADD ./vpn_server.config /usr/local/vpnserver

RUN rm -rf *

WORKDIR /usr/local/vpnserver

RUN make

ENTRYPOINT [ "./vpnserver","start" ]