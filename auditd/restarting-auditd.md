# Here are how to restart auditd service after
After making auditd changes you need to restart the auditd daemon but it doesn't happen throught systemctl and neededs to be done with service

### Restart service
>
> 
>service auditd restart
>
> \# to check the rules afterwards
> 
>  auditctl -l \# list all the rules
>
> \# to look for resent key created
> 
> aureport -i -k --summary --start recent

