# Connection Issues between Servers

## NetCat

Netcat command (nc) is useful in finding port/firewall issues.  It can be used to query if a service is listening on a port.  It also can be used to be listener on a port.

### Remotely Check Service and Port

> Check remote server to see if a service is listening on a port
Command
>
>nc 10.18.15.25 22 ## check to is something is listening on port 22 on server 10.18.15.25
>
>SSH-2.0-OpenSSH_8.0 

Uses CTL-c to stop the command 


### Creating a Listiner  - Server having connection issues

When debugging network issues, it is helpful to create a listener on a port for testing.
Example:
> On a remote server (10.96.227.168) I started a listener on port 44 :
>
> nc -l -p 44  ## Simulates a service listening on port 44

> From another server 10.96.227.169 I tested:
>
> nc 10.96.227.168 22 ## it worked so the servers can talk.
>
> SSH-2.0-OpenSSH_8.0


 But  port 44 doesn’t work
>
> nc 10.96.227.168 44 ## There is a firewall or other type of issue.
>
> Ncat: No route to host.


### Creating a Listiner  - Server having connection issues

The same test on a different set up servers.  Servers where there were no issues.

> Before setting up the listener on 192.168.1.201, a check was done to verify they could talk
>
> nc 192.168.1.201 44  ## return no message 
>

Since the return was blank, it is getting to the server, but nothing is listening

> To verify I setup a listener on 192.168.1.201 and retested:
>
> nc -l -p 44  ## Simulates a service listening on port 44
>

> After listener is setup:
>
>nc 192.168.1.201 44  ## It looks hung 
It looks hung but the two servers are connected.  If you stop the listener or the listening command, they will both stop.