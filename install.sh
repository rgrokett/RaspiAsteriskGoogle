#!/bin/sh
# Install AGI Files for Google Assistant

sudo cp google.agi /usr/share/asterisk/agi-bin/google.agi
sudo cp *.sln /usr/share/asterisk/sounds/custom/
echo "Copied AGI and audio files to Asterisk"

JSON="/home/pi/.config/google-oauthlib-tool/credentials.json"

# VERIFY GOOGLE CLIENT CREDENTIALS
if [ -f /home/pi/client_secret.json ]; 
then
	echo "Found client_secret*.json OK"
else
	echo "NO client_secret.json! SEE DOCS."
fi

# VERIFY GOOGLE OAUTH
if [ -f "$JSON" ];
then
	echo "Found OAUTH credentials.json OK"
else
	echo "NO Google API OAUTH found! SEE DOCS."
fi

# VERIFY GOOGLE ASSISTANT EXTENSION ADDED
# ALSO ADDS THE SIP PHONE EXTENSION
EXT=`sudo grep 6666 /etc/asterisk/extensions.conf`
if [ -z "$EXT" ]; 
then
	sudo bash -c "sed -i.bkp '/\[default\]/a include => google_api' /etc/asterisk/extensions.conf"
	sudo bash -c "sed -i.bkp '/\[default\]/a include => phone' /etc/asterisk/extensions.conf"
	sudo bash -c "cat extensions.conf >> /etc/asterisk/extensions.conf"
	echo "Added Extension 6666# to Asterisk OK"
	sudo service asterisk restart
	echo "Restarted Asterisk"
	sleep 5
	sudo service asterisk status|grep Active
else
	echo "Found Google Extension 6666# already installed OK"
fi

# VERIFY SIP EXTENSION ADDED
EXT=`sudo grep 5310 /etc/asterisk/sip.conf`
if [ -z "$EXT" ]; 
then
	sudo bash -c "cat sip.conf >> /etc/asterisk/sip.conf"
	echo "Added SIP Extension 5310# to Asterisk OK"
	sudo service asterisk restart
	echo "Restarted Asterisk"
	sleep 5
	sudo service asterisk status|grep Active
else
	echo "Found SIP Extension 5310# already installed OK"
fi
