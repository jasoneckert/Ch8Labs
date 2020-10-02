#!/bin/bash
echo -e "The current name is: \c"
uname -n
echo -e "The system uptime is: \c"
uptime
echo -e "The number of mounted filesystems is: \c"
mount | wc -l
