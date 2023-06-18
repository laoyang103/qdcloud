#!/bin/bash

echo 1 > /proc/sys/net/ipv4/ip_forward
/opt/tomcat8/bin/startup.sh
nohup openvpn --config /etc/openvpn/openvpn.conf --client-config-dir /etc/openvpn/ccd --crl-verify /etc/openvpn/crl.pem &
iptables -t nat -A POSTROUTING -s 10.64.1.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.2.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.3.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.4.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.5.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.16.0.0/16 -j MASQUERADE
iptables -t nat -A PREROUTING -d 10.16.255.254/32 -p tcp -m tcp --dport 8888 -j DNAT --to-destination 192.168.1.7:8501
iptables -t nat -A PREROUTING -d 192.168.1.66/32  -p tcp -m tcp --dport 3389 -j DNAT --to-destination 10.16.255.208:3389
