String localIP = "0.0.0.0";

void findLocalIP() {

  try {
    Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces(); //<>//
    while (interfaces.hasMoreElements()) {
      NetworkInterface iface = interfaces.nextElement();
      // filters out 127.0.0.1 and inactive interfaces
      if (iface.isLoopback() || !iface.isUp())
        continue;

      Enumeration<InetAddress> addresses = iface.getInetAddresses();
      while (addresses.hasMoreElements()) {
        InetAddress addr = addresses.nextElement();
        localIP = addr.getHostAddress(); //<>//
        int i = ((String[]) split(localIP, ".")).length;
        if (i == 4) break;// ==> valid ip address: n.n.n.n
        
      }
    }
  }
  catch (SocketException e) {
    throw new RuntimeException(e);
  }
}
