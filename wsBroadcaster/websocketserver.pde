
// variable for websocket server
WebsocketServer wsServer;

// variable for port
int serverPort = 8081;

boolean expectingJSON = false;
String lastWSMsgIn = "";
String lastWSMsgOut = "";

void webSocketServerEvent(String msg) { //incoming json message from the ws client, i.e. p5js client
  println(msg);
  //GUI feedback:

  if (expectingJSON) {
    // IGNROE FOR NOW IF YOU ARE NOT FAMILIAR WITH JSON OR YOU'RE NOT USING IT
    // This section expects JSON format of incoming message. speficically, it expects one of the json elements to be "method"
    JSONObject json;
    try {
      json= parseJSONObject(msg);
      if (json == null) {
        println("Received ws msg, but it is not a valid json structure");
      } else {
        // retrieve from the json value of "method"
        println(json.getString("method"));
      }
    }
    catch (Exception e) {
      println("illegal json received: "+ msg);
    }
  } else {
    //TODO: if there's a specific logic for just handling an incoming string
    //pass to serial as is:

    //NOTE - for some reason, along the full way - more than 3 chars stuck the arduino buffers. forcing limit to 3 for now:
    //--> this was related to OLED limitations. disabling the server limitation for this version:
    //msg = msg.substring(0, min(3, msg.length()));
    lastWSMsgIn = msg;
    wsWrite(msg);
  }
}


void wsWrite(String msg) {
  lastWSMsgOut = msg;
  wsServer.sendMessage(msg);
}
