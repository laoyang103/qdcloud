iptables -t nat -D PREROUTING -s 10.32.1.146/32 -d 10.10.10.11/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination 10.16.1.146:1122
iptables -t nat -D PREROUTING -s 10.32.1.146/32 -d 10.10.10.11/32 -p tcp -m tcp --dport 80 -j DNAT --to-destination 10.16.1.146:1180
iptables -t nat -D PREROUTING -s 10.32.1.146/32 -d 10.10.10.12/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination 10.16.1.146:1222
iptables -t nat -D PREROUTING -s 10.32.1.150/32 -d 10.10.10.11/32 -p tcp -m tcp --dport 22 -j DNAT --to-destination 10.16.1.150:1122
