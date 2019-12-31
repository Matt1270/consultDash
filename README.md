# Installing console dash on raspberry pi

## This FORK is my personal test bed for my car install.

I have a RPI 2 with too many USB dongles, a 7" Touch screen (orig), and more to come..

If RPI is a fresh install you might need to expand your file system

This is done on "newest" install of Raspbian from todays date. approx 1gb image. Official image..


##### Please check the following before continuing
Read carefully on your Raspberry Pi circuit board.
It has to indicate something like “Raspberry Pi 4 Model B” or “Raspberry Pi 2 Model B”.

If in doubt, run the following command in the terminal:

`$ uname -m`

If the result returned starts with “armv6” this is NOT possible. Abort mission, sorry.

If the result starts with "armv7" this IS possible, please proceed.


##### Preparation of your Raspberry Pi.
Please update your system now.

`sudo raspi-config`

<i>You might want to enable ssh access

`Choose 05 - Interfacing Options`

`Choose Enable SSH`</i>

### Resize partitions.

`Choose 07 - Advanced Settings`

`..then choose option A1 (expand file system)`

`Now reboot.`


##### Update system.
<i>At first boot, sometimes it is necessary to hit enter, before it will accept what you are writing :/</i>

`$ sudo apt-get update -y&&sudo apt-get upgrade -y`

Now reboot, this must happen.
`sudo reboot --reboot`

#### Install Xorg server, no need for window managers.
`$ sudo apt-get install xorg -y`
`$ sudo apt-get install -y unclutter`

#### Instal Node.js and npm.

Append latest deb as source.

`$ curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -`

point-rpi has to be removed also, just too be sure everything is clean.

`$ sudo apt-get autoremove -y`

`$ sudo apt-get install -y nodejs`

`$ sudo apt-get upgrade -y`

This command will check that you have the correct version:

<i> I have node version v13.5.0</i>

`$ node -v`


Now check npm also:

<i> I have npm version v6.13.4</i>

`$ npm -v`

##### Install Dash

`$ cd ~/&&git clone https://github.com/joachimth/consultDash.git`

`$ cd ~/consultDash`

`$ npm install`


##### Auto launch at every bootup.

Create this file:

<i> `~` equals to your home directory, so `/home/pi` if a standard Raspberry PI install</i>

#Step 1.

in .profile at the end, add this.

`$ echo 'exec /home/pi/consultDash/startScript.sh'>>~/.profile`


`if (-z $DISPLAY) && ($(tty) = /dev/tty1); then
exec startx
fi`


//The first one will start the nodejs server after final bootup.

//1. `/home/pi/consultDash/startScript.sh`

//The second will start the chromium kiosk for us to be able to show the goodness automatically.

//2. `@chromium-browser —kiosk --incognito file:///home/pi/consultDash/re-direct-page.html`


##### Install script for mausberry circuit

`http://mausberrycircuits.com/pages/car-setup`



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

This will run "normal" operations.

`npm start`




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


## External Guides, used for reference
https://thisdavej.com/beginners-guide-to-installing-node-js-on-a-raspberry-pi/#install-node
https://www.sylvaindurand.org/launch-chromium-in-kiosk-mode/
