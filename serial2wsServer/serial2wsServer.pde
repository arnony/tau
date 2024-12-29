int now = 0;
int deltaTime = 0;
String versionNumber = "2.1";

String alertMsg = "";
boolean err = false;
void setup() {

  // create canvas
  size(500, 500);

  printSerialList();

  portName = "none";

 // wsServer = new WebsocketServer(this, serverPort, "/");

  setupColors();
  setupText();
  setupControlP5();
  findLocalIP();


  println("Your IP Address: " + localIP);
  println("credit: 2015 NYU ITP");
}

void draw () {
  drawBackground();
  drawText();
  if (portName != "none" && !err) {
     serRead();
  }
}
