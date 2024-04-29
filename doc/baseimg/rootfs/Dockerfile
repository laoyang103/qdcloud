FROM ubuntu:jammy AS rootfs

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends systemd-sysv udev lsb-release cloud-init sudo openssh-server && \
    rm -rf /var/lib/apt/lists/*

FROM alpine

RUN sed -i 's@dl-cdn.alpinelinux.org@mirrors.aliyun.com@g' /etc/apk/repositories
RUN apk add --no-cache e2fsprogs

ADD entrypoint.sh /entrypoint.sh

COPY --from=rootfs / /rootfs

ENTRYPOINT ["sh", "-x", "/entrypoint.sh"]
