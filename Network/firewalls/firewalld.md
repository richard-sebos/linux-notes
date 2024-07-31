# firewalld


There are the notes I have on firewalld software and commands

Firewalld  commands and rules get converted to iptables or nftables rules
- Common Commands
 - sudo firewall-cmd --reload
 - sudo firewall-cmd --get-default-zone
 - sudo firewall-cmd --get-zones
 - sudo firewall-cmd --get-active-zones
 - sudo firewall-cmd --set-default-zone=<zone_name>
 - sudo firewall-cmd --list-services
 - sudo firewall-cmd --add-service=<service_name>
 - sudo firewall-cmd --remove-service=<service_name>
 - sudo firewall-cmd --add-port=<port_number>/tcp
 - sudo firewall-cmd --remove-port=<port_number>/tcp
 - sudo firewall-cmd --list-rich-rules
 - sudo firewall-cmd --add-rich-rule='rule family="ipv4" source address="192.168.1.0/24" port port="22" protocol="tcp" accept'
 - sudo firewall-cmd --remove-rich-rule='rule family="ipv4" source address="192.168.1.0/24" port port="22" protocol="tcp" accept'
 - sudo firewall-cmd --add-rich-rule='rule family="ipv4"  port port="6443" protocol="tcp" accept'


~# firewall-cmd --permanent --new-zone=docker
~# firewall-cmd --permanent --zone=docker --change-interface=docker0
~# firewall-cmd --permanent --zone=docker --add-rich-rule='rule family="ipv4" source address=172.17.0.0/16 masquerade'
~# firewall-cmd --reload


 - sudo firewall-cmd --complete-reload
-  NAT
	Is IP forwarding set?
	
```
## if it is 1 then ip forwarding is set 
cat /proc/sys/net/ipv4/ip_forward
```
	
```
## find net.ipv4.ip_forward and set it to 1 
net.ipv4.ip_forward=1
```

```
## start with incoming traffice 
firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 -o wan -j MASQUERADE
```