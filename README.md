# RaspiAsteriskGoogle
Integrating Asterisk with Google Assistant Voice Service on a Raspberry Pi Zero using AGI


SEE THE INSTALLATION INSTRUCTIONS AT GITHUB
https://github.com/rgrokett/RaspiAsteriskGoogle



## GOOGLE ASSISTANT SDK SETUP
Install the Google Assistant SDK for Raspi
https://developers.google.com/assistant/sdk/prototype/getting-started-pi-python/config-dev-project-and-account
Use Python 2.X
(Specific instructions are in the RaspiAsteriskGoogleInstruction.pdf)

RASPI ASTERISK AGI 
$ cd /home/pi
$ git clone https://github.com/rgrokett/RaspiAsteriskGoogle.git
$ RaspiAsteriskGoogle
$ ./install.sh


DEBUG GOOGLE ASSISTANT
$ cd RaspiAsteriskGoogle
$ ./test.sh

DEBUG ASTERISK PBX or google.agi AGI
$ sudo asterisk -r
> agi set debug on
> core set verbose 4

Dial 6666# on SIP PHONE
Note that GOOGLE PYTHON API RESPONSE TIME is slow... about 5 seconds on Pi Zero.
