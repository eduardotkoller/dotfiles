#!/bin/bash
BRIGHT=$(cat /sys/class/backlight/acpi_video0/brightness)
MOREBRIGHT=$(expr $BRIGHT + 10)
LESSBRIGHT=$(expr $BRIGHT - 10)
if [ "$1" = "more" ]
then
    sudo -u ${USERNAME} echo $MOREBRIGHT > /sys/class/backlight/acpi_video0/brightness
else
    sudo -u ${USERNAME} echo $LESSBRIGHT > /sys/class/backlight/acpi_video0/brightness
fi