# Systemd Service

## Exmaple

Here is an example of a systemd service file
```
[Unit]
Description=Script to do system checks

[Service]

## System Security
NoNewPrivileges=true
ProtectClock=yes
ProtectKernelLogs=yes
ProtectKernelModules=yes
PrivateTmp=yes
PrivateUsers=yes
#PrivateNetwork=true
CapabilityBoundingSet=CAP_NET_BIND_SERVICE CAP_SYS_TIME

## Blocking System Calls
SystemCallFilter=~@clock
SystemCallFilter=~@cpu-emulation
SystemCallFilter=~@debug
SystemCallFilter=~@module
SystemCallFilter=~@mount
SystemCallFilter=~@obsolete
SystemCallFilter=~@privileged
#SystemCallFilter=~@raw-io
SystemCallFilter=~@reboot
SystemCallFilter=~@resources
SystemCallFilter=~@swap

## Action needed
Type=oneshot
ExecStart=/opt/system-scripts/system-checks.bash
UMask=0007

[Install]
WantedBy=multi-user.target
```