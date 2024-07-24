# Weekly Dev Updates

## Automated Updates
<span style="color:red">**Not fully working yet**</span>

I was hoping I could have one that's profile that would update all new Oracle Linux servers but because there's additional software on each server I'll have to rethink this.  

I'm thinking about creating an ansible script that would create the individual file server package files and have that passed down to the ansible control server to do the updates with.

[ansible script](../../../Projects/Staples/ansible/security_checks/check_security_patches.yaml)

> ## Run the above script
>  - logged in as the ansible users
>  - it will create rhsa_advisories_<date>.csv
>  - it will have a list of packages to update
>  - use the below to split the advisor up
>
>     tr ' ' ',' <../patches_needed/rhsa_advisories_2024-07-15.csv >weekly_update.csv
>
> There is also a header.csv if you want to add it

## Kernel Cleanup
[instruction](./Kernel_Cleanup.md)

The next setup would be to create a report for the kernel like above

# older code
> ## Get the list of update and save to temp file
> \# get updates
> 
> sudo dnf check-update|cut -f1 -d ' '>temp_packages
>
> \# clean up last weeks file
> \# remove old packages
>
> vim weekly-updates.yaml
>
> \# update weekly file with new updates
>
> cat temp_packages |while read packages; do echo '  - '${packages}; done>>update_packages.yaml
>
> \# run updates
>
> ansible-playbook weekly-updates.yaml

