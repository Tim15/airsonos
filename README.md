An AirSonos fork that actually works
========

AirSonos is a little server that allows [AirPlay](https://www.apple.com/airplay/) streaming to the Sonos devices on your network.

Install nodejs8, npm and some dependencies:
```
$ curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
$ sudo apt install -y nodejs libavahi-compat-libdnssd-dev libasound2-dev
```

Install airsonos globally via npm:
```
$ npm install -g jmtatsch/airsonos
```

Test if airsonos works as expected:
-------------
```
$ airsonos
*** WARNING *** The program 'node' uses the Apple Bonjour compatibility layer of Avahi.
*** WARNING *** Please fix your application to use the native API of Avahi!
*** WARNING *** For more information see <http://0pointer.de/avahi-compat?s=libdns_sd&e=node>
*** WARNING *** The program 'node' called 'DNSServiceRegister()' which is not supported (or only supported partially) in the Apple Bonjour compatibility layer of Avahi.
*** WARNING *** Please fix your application to use the native API of Avahi!
*** WARNING *** For more information see <http://0pointer.de/avahi-compat?s=libdns_sd&e=node&f=DNSServiceRegister>
Searching for Sonos devices on network...

Schlafzimmer (@ 192.168.181.28:1400, RINCON_000E58CC251201400:5)

Search complete. Set up 1 device tunnel.
```

Run the airsonos script continuously via systemd:
-------------

Create a system user for airsonos to run the script:
```
$ sudo useradd --system airsonos
```

Add a new service file:
```
$ sudo nano /etc/systemd/system/airsonos.service
[Unit]
Description=Start airsonos server
After=network.target

[Service]
Type=simple
User=airsonos
ExecStart=/usr/local/bin/airsonos
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

Reload the changes service files:
```
$ sudo systemctl daemon-reload
```

Start the airsonos service:
```
$ sudo systemctl start airsonos
```

Check if the service if running correctly:
```
$ systemctl status airsonos
● airsonos.service - Start airsonos server
   Loaded: loaded (/etc/systemd/system/airsonos.service; enabled; vendor preset: enabled)
   Active: active (running) since Thu 2018-02-08 05:35:38 CET; 19min ago
 Main PID: 21871 (node)
    Tasks: 7 (limit: 4915)
   Memory: 24.0M
      CPU: 1.055s
   CGroup: /system.slice/airsonos.service
           └─21871 node /usr/local/bin/airsonos

Feb 08 05:35:39 homeserver airsonos[21871]: *** WARNING *** For more information see <http://0pointer.de/avahi-compat?s=libdns_sd&e=node&f=DNSServiceRegister>
Feb 08 05:35:39 homeserver node[21871]: *** WARNING *** The program 'node' uses the Apple Bonjour compatibility layer of Avahi.
Feb 08 05:35:39 homeserver node[21871]: *** WARNING *** Please fix your application to use the native API of Avahi!
Feb 08 05:35:39 homeserver node[21871]: *** WARNING *** For more information see <http://0pointer.de/avahi-compat?s=libdns_sd&e=node>
Feb 08 05:35:39 homeserver node[21871]: *** WARNING *** The program 'node' called 'DNSServiceRegister()' which is not supported (or only supported partially) in the
Feb 08 05:35:39 homeserver node[21871]: *** WARNING *** Please fix your application to use the native API of Avahi!
Feb 08 05:35:39 homeserver node[21871]: *** WARNING *** For more information see <http://0pointer.de/avahi-compat?s=libdns_sd&e=node&f=DNSServiceRegister>
Feb 08 05:35:39 homeserver airsonos[21871]: Searching for Sonos devices on network...
Feb 08 05:35:40 homeserver airsonos[21871]: Schlafzimmer (@ 192.168.181.28:1400, RINCON_000E58CC251201400:5)
Feb 08 05:35:40 homeserver airsonos[21871]: Search complete. Set up 1 device tunnel.
```

If the service starts up sucessfully, you can enable it to start automatically on reboot in the future:
```
$ sudo systemctl enable airsonos
```
