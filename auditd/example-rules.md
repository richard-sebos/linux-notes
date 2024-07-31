#Sample rules for auditd
## Staples System Scripts to keep an eye on
-a always,exit -F perm=wxa -F path=/opt/system-scripts -F key=system-script-change

## Alpha directories to keep an eye on
-a always,exit -F perm=wxa -F path=/opt/AlphaDev  -F auid!=durand -F key=alpha_dev_changes
-a always,exit -F perm=wxa -F path=/opt/AlphaScripts  -F key=AlphaScripts-change

## Monitor Password and Groups files
-a always,exit -F perm=w -F path=/etc/passwd -F key=passwd-files
-a always,exit -F perm=w -F path=/etc/group -F key=passwd-group
-a always,exit -F parm=w -F path=/etc/shadow -F key=passwd-shadow