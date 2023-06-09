#!/bin/bash

iptables -t nat -A POSTROUTING -s 10.64.1.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.2.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.3.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.4.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.64.5.0/24 -j MASQUERADE
iptables -t nat -A POSTROUTING -s 10.32.0.0/16 -j MASQUERADE
