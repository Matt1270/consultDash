# Installing console dash on raspberry pi

### This FORK is my personal test bed for my car install.
### I have a RPI 2 with too many USB dongles, a 7" Touch screen (orig), and more to come..

##### If RPI is a fresh install you might need to expand your file system
##### This is done on "newest" install of Raspbian from todays date. approx 1gb image. Official image..

`sudo raspi-config`

`you might want to enable ssh access;`
`enable ssh'

`choose advanced settings`
`..then choose option 1 (expand file system)`

`reboot`

##### Install node

`sudo apt-get update`

`sudo apt-get upgrade`

*NOTE: You must install node version v5.12 for the dash to work.     ***NOT A GOOD IDEA ANYMORE, WE WILL SEE WHAT HAPPENS NOW***
Instructions on how to install a specific version of node incoming...*

# Installing Node.js 8.x
# First step is to get the correct deb

`curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -`

## Install Node.js 8.x LTS Carbon and npm:

`sudo apt-get install -y nodejs`

`sudo apt-get update&&sudo apt-get install -y npm`

##### Install Chromium, IGNORE that it asks for the Jessie version here....

`wget -qO - http://bintray.com/user/downloadSubjectPublicKey?username=bintray | sudo apt-key add -`

`echo "deb http://dl.bintray.com/kusti8/chromium-rpi jessie main" | sudo tee -a /etc/apt/sources.list`

`sudo apt-get update`

`sudo apt-get install chromium-browser rpi-youtube -y`

##### Install Dash

`git clone https://github.com/joachimth/consultDash.git`

`cd consultDash`

`npm install`


##### Install script for mausberry circuit

`http://mausberrycircuits.com/pages/car-setup`

Open Menu > Preferences > Default applications for LXSession

Add these two entries to Autostart

`@/home/pi/consultDash/startScript.sh`

`@chromium-browser —kiosk --incognito file:///home/pi/consultDash/re-direct-page.html`


### Related guides

- [How to install a consult port](https://youtu.be/6Vd9oKWORPs?t=164)
- [How to install the OS on your Raspberry Pi](https://www.raspberrypi.org/learning/software-guide/quickstart/)
- [How to guide on installing that dash and power supply software](https://github.com/gregsqueeb/consultDash)

### Suggested hardware

- [Raspberry Pi 3](https://www.adafruit.com/products/3055)
- [Touch screen](https://www.adafruit.com/products/2718)
- [Mausberry Circuit Power Supply](http://mausberry-circuits.myshopify.com/collections/car-power-supply-switches/products/3a-car-supply-switch)

- Some USB Tool....

# How to run for development

This will loop through MPH RPM and Temp so you can style things without being connected to a car :)

`npm run dev`
