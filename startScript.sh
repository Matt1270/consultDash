#!/bin/bash
# startScript.sh
# In other versions, this is called from ~/.profile
# This means that it will be run before bash or zsh or whatever is called..

ROOT_UID=0   # Only users with $UID 0 have root privileges.
E_NOTROOT=65
E_NOPARAMS=66
GUI_INIT_FILE="~/.xinitrc"
#GUI_WHOAMI_TXT=whoami

#Clear the screen.
clear

#if [ "$UID" -ne "$ROOT_UID" ]
#then
#  echo "Must be root to run this script."
#  # "Run along kid, it's past your bedtime."
#  #exit $E_NOTROOT
#fi

echo "...Who Are We and What PIDID Do We Have? "
echo "\$UID= $UID"
echo "PIDID= $$"
#echo "WhoAmI= $GUI_WHOAMI_TXT"
echo ""
echo "# We will be waiting a bit, before procceding."

sleep 5

echo "# Starting Node server for accquiring data"
echo ""

cd /home/pi/consultDash/ > /dev/null
npm run dev>~/npminitlog.log & 
echo "# We are past starting the Node server now.."

sleep 10

#We will be sleeping NOT waiting here until the service is running..
sudo rm -f $GUI_INIT_FILE

echo 'xset -dpms'>>$GUI_INIT_FILE
echo 'xset s off'>>$GUI_INIT_FILE
echo 'xset s noblank'>>$GUI_INIT_FILE
echo 'unclutter &'>>$GUI_INIT_FILE
#echo 'sleep 5'>>$GUI_INIT_FILE
#echo 'chromium-browser /home/pi/consultDash/re-direct-page.html --window-size=800,480 --start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null'>>$GUI_INIT_FILE
echo 'while true; do'>>$GUI_INIT_FILE
#The Exec makes it WAIT and continue if the process is finished..
echo '    exec chromium-browser /home/pi/consultDash/re-direct-page.html --window-size=800,480 --start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null'>>$GUI_INIT_FILE
echo '    sleep 30'>>$GUI_INIT_FILE
echo 'done'>>$GUI_INIT_FILE
echo '/sbin/shutdown -r now'>>$GUI_INIT_FILE

startx
