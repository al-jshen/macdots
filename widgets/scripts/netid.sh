#!/bin/bash

netcall="$(networksetup -getairportnetwork en0)"
if  [[ $netcall != *"Current Wi-Fi Network:"* ]]
then
    ret="Not Connected"
else
    ret=$(echo $netcall | cut -c 24-)
fi

echo $ret
