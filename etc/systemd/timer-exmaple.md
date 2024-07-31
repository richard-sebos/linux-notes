# Systemd Times

## Exmaple

Here is an example of a systemd timer file
```
[Unit]
Description=Runs system-checks  at 1 AM every day

[Timer]
OnCalendar=*-*-* 01:00:00
Persistent=true

[Install]
WantedBy=timers.target
```