# Lock after 3 Tries

## Looking for locked account
> \# check to see if account is lock 
> 
>sudo faillock --user \<user>
>
> \# unlocking account 
>
> sudo faillock --user \<user> --reset


## Settup
This is done with the faillock config

Check if minimal is in the authselect 
```
sudo authselect list
```
Set minimal to forced
```
sudo authselect select  minimal --force
```
Enable the faillock 
```
sudo authselect enable-feature with-faillock
```

Changes to /etc/security/faillock.conf
```
silent
deny = 3
unlock_time = 600
even_deny_root
```