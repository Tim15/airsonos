A fork of AirSonos that actually works :)
========

AirSonos is a server that adds Apple [AirPlay](https://www.apple.com/airplay/) (iOS, OS X) support to all Sonos devices on a network.

Install via [npm](https://www.npmjs.org)
```
$ npm install -g jmtatsch/airsonos
```

Example usage
-------------
```
$ airsonos
Searching for Sonos devices on network...

Swan (@ 192.168.0.1:1400, RINCON_B8E9375433D201400:1)

Search complete. Set up 1 device tunnel.
```

Run the airsonos script as daemon
-------------
```
$ npm install -g forever
$ forever start /usr/local/bin/airsonos
$ forever list
```
