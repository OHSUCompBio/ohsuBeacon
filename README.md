# ohsuBeacon
Interface for OHSU Beacon

Built using R shiny and ucscBeacon https://github.com/maximilianh/ucscBeacon.

Steps to deploy from genomicsbeacon VM:

* genomicsbeacon.ohsu.edu is served from shiny-server on port 80. At /srv/shiny-server you will find the contents of this repo and additional shiny-server files.

* After following the setup instructions from maximilianh/ucscBeacon, change ports.conf file (/etc/apache2) to serve from a port different from 80 to avoid conflicts with client. Currently served from port 8002. Despite the additional apache configs listed in te ucscBeacon repo, there is no additional configuration necessary.

* ui.R should be editted to query genomicsbeacon.ohsu.edu:<port> depending on the port apache is serving from as set above.
 
* One additional config step required for apache on Ubuntu related to cgi:
    * sudo apt-get install apache2 will automatically set up threaded MPM. This sets up cgid by default. (Warning will appear when you try sudo a2enmod cgi).
    * To deactive cgid and activate cgi: 
        * sudo a2dismod mpm_event
        * sudo a2enmod mpm_prefork
        * sudo service apache2 restart
