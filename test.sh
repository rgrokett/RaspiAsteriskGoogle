#!/bin/sh
# TEST GOOGLE API
#

# CHECK FOR GOOGLE CREDENTIALS
if [ -f /home/pi/client_secret.json ];
then
        echo "Found client_secret.json OK"
else
        echo "NO client_secret.json! SEE DOCS."
fi

# CHECK FOR OAUTH
if [ -f "/home/pi/.config/googlesamples-assistant/assistant_credentials.json" ];
then
        echo "Found OAUTH assistant_credentials.json OK"
else
        echo "NO Google API OAUTH found! SEE DOCS."
fi

# TEST SEND RECEIVE FILE
JSON="/home/pi/.config/googlesamples-assistant/assistant_credentials.json"
echo "Sending sample to Google Assistant API..."
sudo python -m googlesamples.assistant --credentials /home/pi/.config/googlesamples-assistant/assistant_credentials.json -i in.wav -o out.wav -v

echo
echo "AUDIO FILES:"
ls -l *.wav

echo
echo "If you have AUDIO on this Pi:"
echo "Verify Audio with:"
echo "   $ speaker-test -t wav"
echo "Playback audio from Google:"
echo "   $ aplay --format=S16_LE --rate=16k --file-type=wav out.wav"

