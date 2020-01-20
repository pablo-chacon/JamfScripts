#!/bin/sh


# Jamf Framework Splashscreen. 
# Prevent End User from interfere with JAMF framework setup.
# Login hook needs to be configured in JAMF.
# Filevault encryption done creates the "trigger" file to kill splashscreen.

# Author: ekarlsson66@gmail.com
# Date: 2019-10-08
# Version: 001

# End User Login triggers Splashscreen.
# Save "image" decoded to /tmp/icon.png.
# Search for /tmp/file.txt every 90 sec.
# /tmp/file.txt exists, kill Splashscreen.

  
jamfHelper="/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper"
image="Your base64 encoded icon"
icon="/tmp/icon.png"
title="This Device is Your Company's Property."
heading="Setting up Framework."
description="Do not interfere. 
Best regards,
/Your Company's IT-Management."
trigger="/tmp/file.txt"


if "/usr/local/jamf/bin/jamf" checkJSSConnection -retry 0 ;
then

    echo "$image" | base64 -D > "$icon" & 
	bPID=$!
	wait "$bPID"
    
	"$jamfHelper" -windowType fs \
		-title "$title" \
		-heading "$heading" \
		-icon "$icon" \
		-iconSize 1000 \
		-description "$description" &
	jhPID=$!		   
    
 	until [ -f "$trigger" ] 
	do
		sleep 90
	done
	
	kill "$jhPID"
    
    rm -rf "$trigger"
    
    exit 0;
	
else

	echo "$image" | base64 -D > "$icon" & 
	bPID=$!
	wait "$bPID"
    
	"$jamfHelper" -windowType fs \
		-title "$title" \
		-heading "$heading" \
		-icon "$icon" \
		-iconSize 1000 \
		-description "$description" &
	jhPID=$!		
  	
  	until [ -f "$trigger" ] 
	do
		sleep 90
	done

	kill "$jhPID"
    
    rm -rf "$trigger"
    
    exit 0;   

fi