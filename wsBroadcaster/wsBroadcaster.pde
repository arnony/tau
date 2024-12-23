int now = 0;
int deltaTime = 0;
String versionNumber = "1.0.0";

String alertMsg = "";
boolean err = false;
void setup() {

  // create canvas
  size(500, 500);

  wsServer = new WebsocketServer(this, serverPort, "/");

  setupColors();
  setupText();
  findLocalIP();


  //println("Your IP Address: " + localIP);
  println("credit: remotely based on 2015 NYU ITP");
}

void draw () {
  drawBackground();
  drawText();
}
