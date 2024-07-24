

## Useful Commands
Set the Right OS Level

```
 subscription-manager release --set 8.9
```

List currently used Repos

```
sudo yum -v repolist
```


Adding Repo 

```
# Add Repo example rhel-8-for-x86_64-baseos-rpms
sudo subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
```

# Repos for RHEL 8
    1. rhel-8-for-x86_64-baseos-rpms
    2. rhel-8-for-x86_64-appstream-rpms


## Pass issues

> #### What is the issue
>
> \# Updates are not working
> sudo dnf check-update --security ## did not return updates
>
> \# Check for what repos are there
> yum repolist enabled ## only had packages-microsoft-com-prod
>
> \# added RHEL repos
> sudo subscription-manager repos --enable=rhel-8-for-x86_64-appstream-rpms
> sudo subscription-manager repos --enable=rhel-8-for-x86_64-baseos-rpms
>
> \# Updates are not working
> sudo dnf check-update --security ## did not return updates

> #### What I did to correct this
>
> \# Find out what the current release version
> subscription-manager list
>
> \# it was 8.9 so I set it to 8.10
> subscription-manager release --set 8.10
>
> \# Check for security updates and it worked
> dnf check-update --security