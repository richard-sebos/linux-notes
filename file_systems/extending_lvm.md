
# Increasing LVM Size

## Drives:
- new drive: /dev/sdb
- existing lvm: ol_cqcbou1lvcln01-var

## Purpose

To increase the size of a logical volume and assign the new space to a partition.


## Steps

This assumes the new hard drive has been added to the server/vm.

### List the Logical Volumes
```
## list block devices
lsblk
```
This should show the volumes that are part of the LVM as well as the new hard drive.  In my case the new hard drive was /dev/sdb and I wanted to add it to /dev/ol_cqcbou1lvcln01/root.


### Formatting a New Hard Drive
I used cfdisk to create a new partition on hard drive
```
## Used to create partition /dev/sdb1
sudo cfdisk /dev/sdb

## Formated with, this could be optional 
sudo mkfs.xfs /dev/sdb1
```

### Create a Physical Volume

```
## Create a Physical Volume
pvcreate /dev/sdb1

## to see changes us
lsblk
```

### Add Volume to LVM

Need to find LVM  Volume Group
```
## Need to find LVM  Volume Group
sudo vgs

## it provided ol_cqcbou1lvcln01
## added new hard drive to LVM
sudo vgextend ol_cqcbou1lvcln01 /dev/sdb1

## Assigned extra space to / volume
sudo lvextend -l +100%FREE /dev/ol_cqcbou1lvcln01/root

## extend the size of /dev/ol_cqcbou1lvcln01/root
## the hard drive was formated to an xfs formatting
sudo xfs_growfs -d  /dev/ol_cqcbou1lvcln01/root
```
 ## Resources
- [Adding and Resizing LVM Volume](https://www.redhat.com/sysadmin/resize-lvm-simple)
- [Resize](https://docs.oracle.com/en/operating-systems/oracle-linux/6/adminsg/ol_grow_xfs.html)
