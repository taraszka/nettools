FROM centos
LABEL org.opencontainers.image.authors="krzysztof.taraszka@gmail.com"

RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update-minimal --security -y && \
  yum install -y \
  arpwatch \
  bind-utils \
  curl \
  dropwatch \
  iperf3 \
  mtr \
  nano \
  net-tools \
  nmap \
  strace \
  sysstat \
  tcpdump \
  tcptraceroute \
  telnet \
  tmux \
  traceroute \
  vim \
  wireshark \
  wget \
  && yum clean all && rm -rf /var/cache/yum /tmp/* /var/tmp/*

RUN curl -s https://raw.githubusercontent.com/jedrecord/sysinfo/master/sysinfo \
  -o /usr/bin/sysinfo && chmod 755 /usr/bin/sysinfo

CMD [ "/bin/bash" ]
