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
controlP5.Button submitWebPort; 
controlP5.Textfield webPortField;
PortFieldSubmitButtonListener pfListener = new PortFieldSubmitButtonListener();

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
    .setPosition(260, int(11.5 * paddingY)) //paddingX, 52*height/100)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(portsList);

  if (portsList.size()==1) {
    singleSerialPort = true;
    selectPort(0);
    ps.hide();
  }
  
  //add webPorts selector:
  // field and button. field content, by default and if fails - 8081.
    webPortField = cp5.addTextfield("SetWebPort").setPosition(300, 5 * paddingY-15).setSize(60, 20).setColorBackground(color(255,255,255)).setColor(color(255, 100, 100)).setInputFilter(ControlP5.FLOAT).setAutoClear(false).setColorValue(color(0,0,0)).setColorActive(0xff00ff00).setId(2);
    //.setColorBackground(logoBlue);
  webPortField.getCaptionLabel().setVisible(false);
  //webPortField.onRelease(fieldsCLICKEDListener_newLocationGUI);
  webPortField.setText(nf(serverPort,4,0));


 //submit button:
  submitWebPort = cp5.addButton("newLocSubmit").setLabel("START").setPosition(390, 5 * paddingY-15).setSize(70, 20).setId(3);
  submitWebPort.getCaptionLabel().toUpperCase(false);
  submitWebPort.onRelease(pfListener);
}


class PortFieldSubmitButtonListener implements CallbackListener {
  void controlEvent(CallbackEvent e) {
    println("PortFieldSubmitButtonListener event + text"+ e + ", " + webPortField.getText()); 
    serverPort = Integer.parseInt(webPortField.getText());
    connectWSS();
   }
}

void connectWSS(){
   wsServer = new WebsocketServer(this, serverPort, "/");
}
void drawText() {

  fill(yellow);
  textSize(textSizeTitle);
  text("Serial To WebSocket Connector" +"\r\n(Processing 4 code / exe for P5JS projects)", paddingX, 2 * paddingY);

    //show version:
    pushMatrix();
    translate(width-100, height-20);
    fill(gray);
    textSize(15);
    text ("Version: "+ versionNumber, 0, 0);
    popMatrix();


  //Web socket:
  int y1 = 5 * paddingY;
  fill(yellow);
  textSize(textSizeTitle);
  text("Web socket interface", paddingX, y1);

  fill(gray);
  textSize(textSizeParagraph);
  text("Use ports 8081, 8082...", 300, 1 * paddingY + y1);
  text("Websocket listens at:   ws://" + localIP +":"+serverPort, paddingX, 2 * paddingY + y1);
  text("(Can be reached locally at localhost or 127.0.0.1)" , paddingX, 3 * paddingY+ y1);
  text("Last ws in: " + lastWSMsgIn, 20+paddingX, 4 * paddingY + y1);
  //text("(Limited to 3 chars)" , 120+paddingX, 4 * paddingY + y1);
  text("Last ws out: " + lastWSMsgOut, 20+paddingX, 5 * paddingY + y1);


  // Serial port:

  int y2 = y1+7*paddingY;
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
