# Cleaning Up Old Kernels
## Ansible Script
There is an answer script to look for Older kernels that need to be cleaned up. it is on sclvdrh9001(10.96.227.169) in the directory:
 - /home/ansible_admin/ansible_dev/weekly_updates
 - ***ansible-playbook kernel_count.yaml***
  
>## RHEL 8/9
>
> > <span style="color:grey">\# checking for older kernels
> >
> >sudo grubby --info=ALL|grep vmlinuz
>
> ><span style="color:grey">\# removing old kernels
> >
> >sudo  dnf remove --oldinstallonly --setopt installonly_limit=2 kernel
>
> If the above doesn't work
> >
> ><span style="color:grey">\# List the existing kernels
> >
> >sudo dnf repoquery --installonly --latest-limit 2 -q
> >
> ><span style="color:grey">\# list the kernels and remove the one you want to remove
> >
> > sudo dnf remove kernel-core-0:5.14.0-427.22.1.el9_4.x86_64

## Old Notes

Is the new kernel part of the menu ?
No:

```
## copy kernel if not there example below

sudo cp  /lib/modules/4.18.0-477.15.1.el8_8.x86_64/vmlinuz  vmlinuz-4.18.0-477.15.1.el8_8.x86_64

sudo chmod vmlinuz-4.18.0-477.21.1.el8_8.x86_64

sudo ln -s /lib/modules/4.18.0-477.21.1.el8_8.x86_64/symvers.gz symvers-4.18.0-477.21.1.el8_8.x86_64.gz

dracut --regenerate-all -f && grub2-mkconfig -o /boot/grub2/grub.cfg

sudo grubby --info=ALL
```

Is the new one there:
```
sudo grubby --info=ALL|grep vmlinuz
```

No:
```
sudo grubby --add-kernel /boot/vmlinuz-4.18.0-477.21.1.el8_8.x86_64 --title="Staples RHEL (4.18.0-477.21.1.el8_8.x86_64)  8.8 (Ootpa)"
```

Did this fix it?
Yes, what is the default kernel
```
sudo grubby --default-kernel
```



reboot
Is it the new one:
No: 
Set the new Kernal
```
sudo grubby --set-default=<new kernel>
```
=====================
Cleaning up older kernels
=====================
#+BEGIN_SRC
## Remove the older kernels
sudo  dnf remove --oldinstallonly --setopt installonly_limit=2 kernel
#+END_SRC
Centos 7
#+BEGIN_SRC
## Try this first
package-cleanup --oldkernels --count=2package-cleanup --oldkernels --count=2
## If that doesn't work, they remove manually
sudo yum remove kernel-4.18.0-305.el8.x86_64
#+END_SRC
```
dracut --regenerate-all -f && grub2-mkconfig -o /boot/grub2/grub.cfg
```
shut