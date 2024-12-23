String[] portsArray;
int baudRate = 9600;
Serial serPort;
int portNumber = 2;
String portName;
String portStatus = "";

int value;
String lastSerMsgIn = "";
String lastSerMsgOut = "";
String strIn = "";
String receivedStr = "";

void selectPort(int n) {
  portName = portsArray[n];
  try{
  serPort = new Serial(this, portName, baudRate);
  portStatus = "open";
  if (serPort == null) {
    alertMsg = "NOTE: Failed to open com port";
    err = true;
  }
  } catch (Exception e){
    alertMsg = "NOTE: Failed to open com port (e)";
    err = true;
  }
}

int getBaudRate() {
  return baudRate;
}

void setBaudRate(int newBaudRate) {
  baudRate = newBaudRate;
}

// function to print serial port list
void printSerialList() {
  portsArray = new String[Serial.list().length];
  for (int i = 0; i < Serial.list().length; i++) {
    portsArray[i] = Serial.list()[i];
  }
  printArray(portsArray);
}

int getPortNumber() {
  return portNumber;
}

void setPortNumber(int  newPortNumber) {
  portNumber = newPortNumber;
}


void serRead() {
  if (serPort.available() > 0) {
    value = serPort.read();
    if (char(value)!='\n') { //waiting for "new line" indication to conclude an incoming string
      strIn+=char(value); //just another char...  convert the ascii number, like 60, to a character, like 'a'
    } else { // a new line sign / end of message:
      strIn.trim();  // get rid of spaces and /r/n at the end
      receivedStr = strIn;
      lastSerMsgIn = strIn; //used for GUI feedback. held ON until next full string.
      //reflect ser to ws:
      wsWrite("ser:" + strIn);
      strIn = "";
      println(value+ ", "+ char(value)+", "+ receivedStr);
    }
    receivedStr = "";
  }
}


void serWrite(String msg) {
  serPort.write(msg+"\r\n");
  lastSerMsgOut = msg;
}
