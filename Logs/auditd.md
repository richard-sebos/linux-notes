# Auditd

## Searching Audit Logs

*Remember you need sudo for these.*

### To restart auditd after making changes 

```
service auditd restart
```

### Run file of rules
```
auditctl -R <file.rules>
```

### List aditd rules
```
auditctl -l
```

### Search for programs in audit records
```
ausearch -x <program file>
```
### User Authentication report
```
aureport -au
```

### A summary of the key auditd records created
```
aureport -i -k --summary --start today
```

### Failed System Calls
To search for all failed system calls from yesterday up until now, use the following command:
```
ausearch --start yesterday --end now -m SYSCALL -sv no -i
```

### Failed User Events
```
aureport -u --failed --summary -i
```

### Looks for logging starting yesterday
```
ausearch --start yesterday --end now -m USER_LOGIN  -i
```

### Suspicious Activities
This is useful for security auditing, ensuring compliance with security policies, and investigating suspicious activities related to network monitoring capabilities.
```
ausearch --start yesterday --end now -m ANOM_PROMISCUOUS
```

### Executable File
Summary  count of what executable files are run in the last 24 hours
```
aureport -x --summary  --start yesterday --end now
```

### Anomaly Events 
List of Report about anomaly events log entries 
'''
aureport --anomaly
aureport --anomaly --summary
ausearch --start yesterday --end now -m ANOM_PROMISCUOUS
```

