#!/bin/bash


tichyIP=212.182.24.175
tichyDomain=tichy.umcs.lublin.pl

modprobe ip_conntrack

IPTABLES='/sbin/iptables'

#iptables -L
$IPTABLES -F 
$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP

$IPTABLES -A OUTPUT -p tcp -d $tichyIP --dport 80 -m state --state NEW -j ACCEPT
$IPTABLES -A OUTPUT -p tcp -d $tichyIP --dport 443 -m state --state NEW -j ACCEPT

$IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "" >> /etc/hosts
echo "$tichyIP  $tichyDomain" >> /etc/hosts

