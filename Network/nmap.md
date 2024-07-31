# Starting with Basics

## Range or Ports

nmap can be used to test a range of ports on a remote server.  If testing ports 1024  or lower, sudo access is needed.
>
>sudo nmap -Pn -p 1-1024 10.18.15.28
>
>Starting Nmap 7.92 ( https://nmap.org ) at 2024-06-20 13:31 CST
>
>Nmap scan report for conrch1lvpsds01.staplescan.com (10.18.15.28)
>
>Host is up (0.13s latency).
>
>Not shown: 1008 filtered tcp ports (no-response), 12 filtered tcp ports (admin-prohibited)
>
>PORT    STATE  SERVICE
>
>22/tcp  open   ssh
>
>23/tcp  closed telnet
>
>161/tcp closed snmp
>
>162/tcp closed snmptrap
>
>Nmap done: 1 IP address (1 host up) scanned in 12.19 second
