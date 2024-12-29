Processing 4 Serial Port to WebSocket Connector 
_______________________________________________

This is a simple connector between physical serial interface (Arduino...) to a webSocket server, 
which can be connected by websocket clients (P5JS) to indirectly interface with Arduino.

You will need to actively import websockets library, in Processing IDE:
Sketch --> Import Library --> Manage Libraries -->  Libraries --> websockets...


You may find an EXE file exported from this code here (download and extract the zipped folder):
https://www.dropbox.com/scl/fo/mhddmvih8itwyyyg1td3g/AGZjmqvH9xkN9yDxCEEAzdU?rlkey=k6jwdx5j531hefvc5t97j77ff&dl=0
...If it's not there anymore - open the folder in Processing IDE and run/export it from there.


Example of P5JS code that uses this server can be found here:
https://editor.p5js.org/tau1arnony/sketches/YSQ5RhmYP
and example of Arduino code, here:
https://www.dropbox.com/scl/fi/k0odyt79zcv5r90knuake/SerialAndOLED.ino?rlkey=g62lczldue9qn1m2wbpqy4w0l&dl=0



Arnon Yaar, 12.2024


Version history - 
v.2.1 Allows manual selection of the port. This is useful if you intend to run multiple instances of the server on the same PC: each can be connected to a dedicated serial port and to a dedicated P5JS clients