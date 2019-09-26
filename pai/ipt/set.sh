#!/bin/sh

iptables -t nat -F PREROUTING
iptables -t nat -F POSTROUTING

iptables -F FORWARD

#iptables -t nat -A PREROUTING -d 192.168.1.90 -p tcp --dport 443 -j DNAT --to 192.168.1.206:443
#iptables -t nat -A POSTROUTING -d 192.168.1.206 -j MASQUERADE
#
#iptables -A FORWARD -d 192.168.1.206 -p tcp --dport 80 -j ACCEPT
#iptables -A FORWARD -s 192.168.1.206 -p tcp --sport 80 -j ACCEPT
#
#iptables -A FORWARD -d 192.168.1.206 -p tcp --syn -m limit --limit 100/s --limit-burst 80 -j ACCEPT
#iptables -A FORWARD -d 192.168.1.206 -p tcp --syn -j DROP
#
#iptables -A FORWARD -d 192.168.1.206 -m limit --limit 150/s --limit-burst 80 -j ACCEPT 
#iptables -A FORWARD -d 192.168.1.206 -j DROP
#
#iptables -A FORWARD -s 192.168.1.206 -m limit --limit 150/s --limit-burst 80 -j ACCEPT 
#iptables -A FORWARD -s 192.168.1.206 -j DROP

iptables-save	> /river/ipt/ipt-save

