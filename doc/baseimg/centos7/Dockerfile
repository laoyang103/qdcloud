FROM centos:7

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:us \
    LC_ALL=en_US.UTF-8

RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
    systemd-tmpfiles-setup.service ] || rm -f $i; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*;\
    rm -f /etc/systemd/system/*.wants/*;\
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*;\
    rm -f /lib/systemd/system/anaconda.target.wants/*;

RUN yum -y install crontabs rsyslog httpd iproute psmisc net-tools && \
    yum -y install vim openssh-server wget curl && \ 
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    systemctl enable crond && \
    systemctl enable sshd   && \
    systemctl enable rsyslog && \
    echo 123 | passwd root --stdin && \
    yum clean all

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
