#!/bin/sh


# Author: ekarlsson66@gmail.com
# Date: 2019-09-15
# Version: 001

# Creates the "trigger-file". Splashscreen script and trigger scripts needs to be configured with JAMF policies. 
# Splashscreen script searches for "/tmp/file.txt" every 90 sec. 


m='Please reboot your computer to finalize the installation. You will be see a pop-up asking for your password, this is for the diskencryption. No need to save the output / Your Companies IT staff.'


>"/tmp/file.txt"

Jamf displayMessage -message "$m" -icon "/tmp/file.png" &
pid=$!
wait "$pid"


exit 0;