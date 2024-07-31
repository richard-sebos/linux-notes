# SELinux Modes

## Modes

getenforce
setenforce


## Users

### List SELinux users
```
semanage login -l
```

### Add user to a SELinux users
```
Addes group sysadm to the SELinux user sysadm_u
semanage login -a -s sysadm_u %sysadm
```

### SELinux users and service