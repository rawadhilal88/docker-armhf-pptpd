FROM	armbuild/debian
MAINTAINER Rawad Hilal "rawadhilal88@gmail.com"

RUN apt-get update && \
    apt-get install -y pptpd iptables && \
    rm -rf /var/lib/apt/lists/*

RUN echo "username * password *" >> /etc/ppp/chap-secrets && \
    echo "localip 192.168.0.1" >> /etc/pptpd.conf && \
    echo "remoteip 192.168.0.100-200" >> /etc/pptpd.conf && \
    echo "ms-dns 8.8.8.8" >> /etc/ppp/pptpd-options

EXPOSE 1723

ADD run.sh /run.sh

CMD ["/run.sh"]

