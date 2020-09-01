tichyIP=212.182.24.175
tichyDomain=tichy.umcs.lublin.pl

modprobe ip_conntrack

iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A OUTPUT -p tcp -d $tichyIP --dport 80 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p tcp -d $tichyIP --dport 443 -m state --state NEW -j ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

echo "" >> /etc/hosts
echo "$tichyIP  $tichyDomain" >> /etc/hosts
