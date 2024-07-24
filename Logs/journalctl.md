# journalctl 

## Example:
sudo journalctl -p 3 -xb  --since yesterday

Linux has a few different system logs to search for issues in.  One of the easiest to search is system journal, which is used for daemons run from systemd. Some useful search options are:
 *	-S, --since  ## showing entries on or newer than the specified date
    *	journalctl --since="2012-10-30 18:17:16"
    *	journalctl --since "20 min ago"
 *	-U, --until ## showing entries on or before than the specified date
 *	-u, --unit ## Show messages for the specified systemd unit, example service
 *	-p, --priority ## p is the priority level try  "emerg" (0), "alert" (1), "crit" (2), "err" (3), "warning" (4), "notice" (5), "info" (6), "debug" (7)
 * 	-x, --catalog  ##  log lines with explanation texts
 *	-r, --reverse ## Reverse output
 * 	-b, --boot errors since boot
