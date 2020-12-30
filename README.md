# RaspiAsteriskGoogle
Integrating Asterisk with Google Assistant Voice Service on a Raspberry Pi Zero using AGI

Note that Google changes SDK and security access often.


See the RaspiAsteriskGoogleInstallation.pdf document for complete installation details. https://github.com/rgrokett/RaspiAsteriskGoogle/raw/master/RaspiAsteriskGoogleInstallation.pdf

This is a proof-of-concept of integrating Google Assistant voice service with Asterisk on a Raspberry Pi. You should not connect this to a publicly accessible inbound telephone number without reading and agreeing to Google Assistant SDK Terms of Service. (Requires approval and possible fees)  But can be used for personal use only.

Note that although this works on a Raspi Zero W, it runs much faster on a Raspberry Pi 3. 


### GOOGLE ASSISTANT SDK 
Requires a Google Cloud Account (free) 
https://developers.google.com/assistant/sdk

https://developers.google.com/assistant/sdk/prototype/getting-started-pi-python/config-dev-project-and-account

### WORKAROUND for GOOGLE OAUTH
If you get a python error while running the google-oauthlib-tool on page 8 of pdf doc, just leave off the "python -m" 

$ google-oauthlib-tool --client-secrets /home/pi/client_secret.json --scope https://www.googleapis.com/auth/assistant-sdk-prototype 
--save --headless


### UPDATE for RASPBIAN STRETCH OS:
This pgm will work with Raspbian Stretch, but you will need to install several more Python packages:

$ sudo python -m pip install grpcio

$ sudo python -m pip install --upgrade google-assistant-library

$ sudo python -m pip install --upgrade google-assistant-grpc

$ sudo python -m pip install --upgrade tenacity sounddevice

These can be installed at any time before trying to run the test.sh program shown on Page 9 of the PDF doc.
