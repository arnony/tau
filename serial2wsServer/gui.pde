color black;
color gray;
color yellow;

// typeface is Mattone by Nunzio Mazzaferro
// available at http://collletttivo.it/
// Collletttivo designs and distributes free open source typefaces
// retrieved on 2022-08-27

int textSizeParagraph = 16;
int textSizeTitle = 20;

int paddingXPercentage = 5;
int paddingX = 0;

//int paddingYPercentage = 6;
int paddingY = 0;

// ControlP5 instance
ControlP5 cp5;

// setup functions

void setupText() {
  textAlign(LEFT, CENTER);
  paddingX = paddingXPercentage * width/100;
  paddingY = 20; //paddingYPercentage * height/100;
}

void setupColors() {
  black = color(255*1/8);
  gray = color(255*6/8);
  yellow = color(255, 255, 255*2/8);
}
boolean singleSerialPort = false;

void setupControlP5() {

  cp5 = new ControlP5(this);

  // retrieve portList
  List portsList = Arrays.asList(portsArray);

  // add a scrollable list
  ScrollableList ps = cp5.addScrollableList("selectPort")
    .setPosition(260, int(9.5 * paddingY)) //paddingX, 52*height/100)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(10)
    .addItems(portsList);

  if (portsList.size()==1) {
    singleSerialPort = true;
    selectPort(0);
    ps.hide();
  }
}

void drawText() {

  fill(yellow);
  textSize(textSizeTitle);
  text("Serial-Web Connector ver: " + versionNumber +"\r\n(Processing 4 code / exe, for P5JS projects)", paddingX, 2 * paddingY);



  //Web socket:
  int y1 = 4 * paddingY;
  fill(yellow);
  textSize(textSizeTitle);
  text("Web socket interface", paddingX, y1);

  fill(gray);
  textSize(textSizeParagraph);
  text("Local IP address is: " + localIP +" (or 127.0.0.1 or localhost)", paddingX, 1 * paddingY + y1);
  text("Websocket port is: " + serverPort, paddingX, 2 * paddingY+ y1);
  text("Last ws in: " + lastWSMsgIn, 20+paddingX, 3 * paddingY + y1);
  //text("(Limited to 3 chars)" , 120+paddingX, 3 * paddingY + y1);
  text("Last ws out: " + lastWSMsgOut, 20+paddingX, 4 * paddingY + y1);


  // Serial port:

  int y2 = y1+6*paddingY;
  fill(yellow);
  textSize(textSizeTitle);
  String doSelectText = ":";
  if (!singleSerialPort) doSelectText = " (select one):";
  text("Serial port " + doSelectText, paddingX, y2);

  fill(gray);
  textSize(textSizeParagraph);
  text("Current port: " + portName, paddingX, 1 * paddingY + y2);
  text("Port status: " + portStatus, paddingX, 2 * paddingY + y2);
  
  text("Last Ser in: " + lastSerMsgIn, 20+paddingX, 3 * paddingY + y2);
  text("Last Ser out: " + lastSerMsgOut, 20+paddingX, 4 * paddingY + y2);

  // show alert, if exists:
  fill(200,30,30);
  textSize(textSizeParagraph);
  text(alertMsg.substring(0,min(150, alertMsg.length())), paddingX, height-50);
  
}

void drawBackground() {
  background(black);
}
