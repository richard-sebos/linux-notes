# Systemd 

## What is it

systemd is a system and service manager for Linux operating systems. It is designed to be a central management tool for controlling what services and processes run on your system, both during startup and while the system is running.


### Service Commands
[Service Example]()
```
# enables a server
systemctl enable <service>
```

```
# starts a server
systemctl starts <service>
```

```
# check the status of a service
systemctl status <service>
```

```
# What is running
systemctl --type=service --state=running
```

### Service Timer

```
# List timers
systemctl list-timers
```

```
# Disable timer
 systemctl disable <timer>
```

```
# Enable timer
 systemctl enable <timer>
```

```
# start timer
 systemctl start <timer>
```