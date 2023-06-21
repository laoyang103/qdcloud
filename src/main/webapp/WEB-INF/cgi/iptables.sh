#!/bin/bash

# 管理节点开机自启动执行的命令

# 开启内核转发
echo 1 > /proc/sys/net/ipv4/ip_forward

# 启动教务系统管理界面
/opt/tomcat8/bin/startup.sh

# 启动VPN服务
nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &

# 为管理节点所连接的所有教师共享IP上网
iptables -t nat -A POSTROUTING -s 10.64.1.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.2.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.3.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.4.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.5.0/24 -j MASQUERADE

# 为管理节点所连接的所有VPN客户端共享IP上网
iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE

# 为管理节点所连接的所有计算节点共享IP上网
iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE

# 为管理节点连接chatgpt端口映射
iptables -t nat -A PREROUTING -d 10.16.255.254/32 -p tcp -m tcp --dport 8888 -j DNAT --to-destination 192.168.1.7:8501

# 为管理节点连接windows运维机3389远程桌面端口映射
iptables -t nat -A PREROUTING -d 192.168.1.66/32  -p tcp -m tcp --dport 3389 -j DNAT --to-destination 10.16.255.208:3389
