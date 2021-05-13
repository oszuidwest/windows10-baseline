net stop w32time
w32tm /unregister
w32tm /unregister
w32tm /register
net start w32time
w32tm /config /manualpeerlist:"0.nl.pool.ntp.org 1.nl.pool.ntp.org 2.nl.pool.ntp.org 3.nl.pool.ntp.org" /syncfromflags:manual /reliable:no /update
w32tm /config /update
w32tm /resync /rediscover
sc triggerinfo w32time delete
sc config w32time start=auto
