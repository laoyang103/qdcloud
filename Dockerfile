FROM alpine

RUN sed -i 's@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g' /etc/apk/repositories

RUN apk update && apk add openjdk8-jre bash curl tcpdump && \
    wget http://dl.jxit.net.cn/k8s/tomcat8-cgi.tar.gz -O /opt/tomcat8-cgi.tar.gz && \
    tar -zxf /opt/tomcat8-cgi.tar.gz -C /opt

COPY target/qdcloud.war /opt/tomcat8/webapps/R00T.war

COPY init.sh /

ENTRYPOINT ["bash", "-x", "/init.sh"]
