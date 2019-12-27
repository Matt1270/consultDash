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

# Installing Node.js & npm..

`curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -`

## Install Node.js 13.x LTS Carbon and npm:

`sudo apt-get install -y nodejs`

`sudo apt-get update`

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
- [How to install the OS on your Raspberry Pi] (https://www.raspberrypi.org/learning/software-guide/quickstart/)

### Suggested hardware

- [Raspberry Pi 3](https://www.adafruit.com/products/3055)
- [Touch screen](https://www.adafruit.com/products/2718)
- [Mausberry Circuit Power Supply](http://mausberry-circuits.myshopify.com/collections/car-power-supply-switches/products/3a-car-supply-switch)

- Some USB Tool....

# How to run for development

This will loop through MPH RPM and Temp so you can style things without being connected to a car :)

`npm run dev`





# External references
https://socket.io  - Real time engine

https://serialport.io - For using serialports via Node.js
Node.js package to access serial ports for Linux, OSX and Windows.

https://expressjs.com - Express Fast simple web framework for Node.js

https://nodejs.org/  - Node.js Javascript runtime built on Chrome V8 JS engine
As an asynchronous event-driven JavaScript runtime, Node.js is designed to build scalable network applications.

See link for install guide  https://github.com/nodesource/distributions/blob/master/README.md

https://serverjs.io
Powerful server for Node.js that just works so you can focus on your awesome project
