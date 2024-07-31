# Reserve IP Addresses

sudo nano /etc/dhcp/dhcpd.conf

```
host hostname { 
	hardware ethernet 00:11:22:33:44:55; 
	fixed-address 192.168.1.100; 
}
```
I need to get the mac address of the interface on OPi3