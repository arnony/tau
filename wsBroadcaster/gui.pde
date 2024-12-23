color black;
color gray;
color yellow;

int textSizeParagraph = 16;
int textSizeTitle = 20;

int paddingXPercentage = 5;
int paddingX = 0;

int paddingYPercentage = 6;
int paddingY = 0;


// setup functions

void setupText() {
  textAlign(LEFT, CENTER);
  paddingX = paddingXPercentage * width/100;
  paddingY = 20;//paddingYPercentage * height/100;
}

void setupColors() {
  black = color(255*1/8);
  gray = color(255*6/8);
  yellow = color(255, 255, 255*2/8);
}

void drawText() {

  fill(yellow);
  textSize(textSizeTitle);
  text("WebSocket Broadcaster", paddingX, 2 * paddingY);
  fill(gray);
  textSize(textSizeParagraph);
  text("For communications between multiple P5JS projects" +"\r\n(Processing 4 code / exe, for P5JS projects)", paddingX, 3.5 * paddingY);
  


  //Web socket:
  int y1 = 7 * paddingY;
  fill(yellow);
  textSize(textSizeTitle);
  text("Web socket interface", paddingX, y1);

  fill(gray);
  textSize(textSizeParagraph);
  text("Local IP address is " + localIP +" (or 127.0.0.1 or localhost)", paddingX, 1 * paddingY + y1);
  text("Websocket port is " + serverPort, paddingX, 2 * paddingY+ y1);
  text("Access URL is ws://" + localIP+":"+serverPort +" or locally at ws://127.0.0.1" +":"+serverPort, paddingX, 3 * paddingY+ y1);
  
  text("Last ws in: " + getFirstRow(lastWSMsgIn), 20+paddingX, 4 * paddingY + y1); //<>//
  //text("(Limited to 3 chars)" , 120+paddingX, 3 * paddingY + y1);
  text("Last ws out: " + getFirstRow(lastWSMsgOut), 20+paddingX, 5 * paddingY + y1);


 
  // show alert, if exists:
  fill(200,30,30);
  textSize(textSizeParagraph);
  text(alertMsg.substring(0,min(150, alertMsg.length())), paddingX, height-50);
  
  
  //show version:
    pushMatrix();
    translate(width-100, height-20);
    fill(gray);
    textSize(15);
    text ("Version: "+ versionNumber, 0, 0);
    popMatrix();
  
}

String getFirstRow(String in){
 int i = in.indexOf("\r"); //<>//
 if (i==-1) return in;
 else return (in.substring(0,i)+"...");
}

void drawBackground() {
  background(black);
}
