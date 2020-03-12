#!/bin/sh

# This script creates a .conf file inside /etc/tlp.d and adds parameters to configure TLP.
# .conf file root ownership is then varified.

DEFAULT="/etc/tlp.conf"
FILE="/etc/tlp.d/tlp_user.conf"

# Check for /etc/tlp.d/tlp_user.conf
if [ ! -f "$FILE" ]
then
    echo "Creating user config file at /etc/tlp.d/tlp_user.conf"
    touch "/etc/tlp.d/tlp_user.conf"
fi

# Disable USB_AUTOSUSPEND
if [ -f "$DEFAULT" ] && [ $(grep -c "#USB_AUTOSUSPEND=1\s*$" $DEFAULT) -ge 0 ] && [ $(grep -c "USB_AUTOSUSPEND.*" $FILE) == 0 ]
then
    echo "Disabling USB_AUTOSUSPEND"
    echo "# Set to 0 to disable, 1 to enable USB autosuspend feature." >> $FILE
    echo "# Default: 1" >> $FILE
    echo "USB_AUTOSUSPEND=0" >> $FILE
fi

# Secure ownership
if [ $(stat -c "%a" $FILE) -ne 644 ] || [ $(stat -c "%U" $FILE) != "root" ]
then
    chmod 644 $FILE
    chown root: $FILE    
fi
