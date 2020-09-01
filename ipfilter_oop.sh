#!/bin/bash

cpprefIP=74.114.90.46
cpprefDomain=en.cppreference.com

cplusIP=167.114.170.15
cplusDomain=www.cplusplus.com

umcsIP=212.182.25.77
umcsPort=5000
umcsPort_2=3001

modprobe ip_conntrack

IPTABLES='/sbin/iptables'

#iptables -L
$IPTABLES -F 
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP

$IPTABLES -A OUTPUT -p tcp -d $cpprefIP --dport 80 -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp -d $cpprefIP --dport 443 -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp -d $cplusIP --dport 80 -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp -d $cplusIP --dport 443 -m state --state NEW -j ACCEPT


$IPTABLES -A OUTPUT -p tcp -d $umcsIP --dport $umcsPort -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp -d $umcsIP --dport $umcsPort_2 -m state --state NEW -j ACCEPT

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "" >> /etc/hosts
echo "$cpprefIP  $cpprefDomain" >> /etc/hosts
echo "$cplusIP  $cplusDomain" >> /etc/hosts
