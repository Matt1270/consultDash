#!/bin/bash
# startScript.sh
# In other versions, this is called from ~/.profile
# This means that it will be run before bash or zsh or whatever is called..

## Missing cleanup..
## This script is run by .bashrc
## Startx is run after this script in .bashrc only because this script needs root..but does it..
##

ROOT_UID=0   # Only users with $UID 0 have root privileges.
E_NOTROOT=65
E_NOPARAMS=66
GUI_INIT_FILE="/home/pi/.xinitrc"
NPM_LOG_FILE="/home/pi/npmlog.log"

#GUI_WHOAMI_TXT=whoami
#We will be sleeping NOT waiting here until the service is running..
rm -f $GUI_INIT_FILE &
rm -f $NPM_LOG_FILE &
wait
touch $GUI_INIT_FILE
touch $NPM_LOG_FILE

#Clear the screen.
clear

if [ "$UID" -ne "$ROOT_UID" ]
then
  echo "Must be root to run this script."
  # "Run along kid, it's past your bedtime."
  exit $E_NOTROOT
fi

echo "...Who Are We and What PIDID Do We Have? "
echo "\$UID= $UID"
echo "PIDID= $$"
#echo "WhoAmI= $GUI_WHOAMI_TXT"
echo ""
echo "# We will be waiting a bit, before procceding."

sleep 2

echo "# Starting Node server for accquiring data"
echo ""

cd /home/pi/consultDash
#npm install #> $NPM_LOG_FILE
npm run dev & #> $NPM_LOG_FILE

sleep 10

#echo 'cd /home/pi/consultDash'>>$GUI_INIT_FILE
#echo 'npm run dev >'"$NPM_LOG_FILE">>$GUI_INIT_FILE

#echo 'echo "# We are past starting the Node server now.."'>>$GUI_INIT_FILE
echo 'xset -dpms'>>$GUI_INIT_FILE
echo 'xset s off'>>$GUI_INIT_FILE
echo 'xset s noblank'>>$GUI_INIT_FILE
echo 'unclutter &'>>$GUI_INIT_FILE

#echo 'sleep 5'>>$GUI_INIT_FILE
#echo 'chromium-browser /home/pi/consultDash/re-direct-page.html --window-size=800,480 --start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null'>>$GUI_INIT_FILE
#echo 'while true; do'>>$GUI_INIT_FILE
#The Exec makes it WAIT and continue if the process is finished..

echo 'chromium-browser /home/pi/consultDash/re-direct-page.html --window-size=800,480 --start-fullscreen --kiosk --incognito --noerrdialogs --disable-translate --no-first-run --fast --fast-start --disable-infobars --disable-features=TranslateUI --disk-cache-dir=/dev/null'>>$GUI_INIT_FILE

#echo '    wait'>>$GUI_INIT_FILE
#echo '    sleep 30'>>$GUI_INIT_FILE
#echo 'done'>>$GUI_INIT_FILE
#echo 'sudo /sbin/shutdown -r now'>>$GUI_INIT_FILE
#sleep 5
#startx &
