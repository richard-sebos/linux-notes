#!/usr/bin/env bash
##

## Created Feb 2024
## Used to do system checks on a RHEL server and then send
## results to a common server to be  review

## where will files be store
WORKING_DIR=/root/temp/daily
DATE_STRING=$(date +"%Y-%m-%d")
if [ ! -d "$WORKING_DIR" ]; then
  mkdir -p ${WORKING_DIR}
fi

## check for curent connections
netstat  -A inet -np|grep tcp|awk -F' ' '{print $5" " $6 }' >${WORKING_DIR}/$(hostname)-current_users-${DATE_STRING}.txt

##  check to see who has logged on
ausearch --start yesterday --end now -m USER_LOGIN  -i >${WORKING_DIR}/$(hostname)-loggins-${DATE_STRING}.txt


## Check the audit records
aureport -i -k --summary --start today >${WORKING_DIR}/$(hostname)-loggins-audit-keys-${DATE_STRING}.txt

## check to if there is a new kernel
KERNEL_COUNT=$(sudo grubby --info=ALL|grep -c vmlinuz)
if [ "$KERNEL_COUNT" -gt 2 ]; then
        echo "A new kernel was installed but may not be running" >${WORKING_DIR}/$(hostname)-kernel-check-${DATE_STRING}.txt
fi

## check firewall logs
## First filewall changes
journalctl -u firewalld >${WORKING_DIR}/$(hostname)-firewall-changes${DATE_STRING}.txt

## Firewall denials
journalctl -k | grep FIREWALL >${WORKING_DIR}/$(hostname)-firewall-denials-${DATE_STRING}.txt

## Send to my audit server
scp $(echo ${WORKING_DIR}/$(hostname)*${DATE_STRING}.txt) audit-server:~/audit/


