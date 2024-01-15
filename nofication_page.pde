String Theader [] = {"No.", "Factory", "Type of cement", "Date/Time", "Pre price", "New Price"};
String notpath="C:/Users/Win 10 Pro/Documents/Processing/notification.csv";
String factoryprice="C:/Users/Win 10 Pro/Documents/Processing/price data.csv";
String SPSprice="C:/Users/Win 10 Pro/Documents/Processing/SPSpricedata.csv";
String notification="C:/Users/Win 10 Pro/Documents/Processing/notification.csv";
String[] factory={"DANGOTE", "DERBA", "NATIONAL", "MUGER"};
Tablenot tablenoti;
String date= month()+"/"+(day()+7)+"/"+year();
Table  tablenot;
void initnotification() {
  Table factorytable=loadTable(factoryprice, "header");
  Table SPStable=loadTable(SPSprice, "header");
  Table notificationtable=loadTable(notification, "header");
  for (int i=0; i<factory.length; i++) {
    String ppc=factorytable.getString(factorytable.findRowIndex(factory[i], "factorylist"), "ppc");
    String preavppc=SPStable.getString(SPStable.findRowIndex(factory[i], "factorylist"), "ppc");
    if (!(preavppc.equals(ppc))) {
      notificationtable.setString(notificationtable.getRowCount(), "factorylist", factory[i]);
      notificationtable.setString(notificationtable.getRowCount()-1, "price", ppc);
      notificationtable.setString(notificationtable.getRowCount()-1, "cementtype", "ppc");
      notificationtable.setString(notificationtable.getRowCount()-1, "preaprice", preavppc);
      notificationtable.setString(notificationtable.getRowCount()-1, "state", "Confirm");
      notificationtable.setString(notificationtable.getRowCount()-1, "date", date);
      saveTable(notificationtable, notification);
      SPStable.setString(SPStable.findRowIndex(factory[i], "factorylist"), "ppc", ppc);
      saveTable(SPStable, SPSprice);
    }
  }
  for (int i=0; i<factory.length; i++) {
    String opc=factorytable.getString(factorytable.findRowIndex(factory[i], "factorylist"), "opc");
    String preavopc=SPStable.getString(SPStable.findRowIndex(factory[i], "factorylist"), "opc");
    if (!(preavopc.equals(opc))) {
      notificationtable.setString(notificationtable.getRowCount(), "factorylist", factory[i]);
      notificationtable.setString(notificationtable.getRowCount()-1, "price", opc);
      notificationtable.setString(notificationtable.getRowCount()-1, "cementtype", "opc");
      notificationtable.setString(notificationtable.getRowCount()-1, "preaprice", preavopc);
      notificationtable.setString(notificationtable.getRowCount()-1, "state", "Confirm");
      notificationtable.setString(notificationtable.getRowCount()-1, "date", date);
      saveTable(notificationtable, notification);
      SPStable.setString(SPStable.findRowIndex(factory[i], "factorylist"), "opc", opc);
      saveTable(SPStable, SPSprice);
    }
  }
  tablenoti = new Tablenot (Theader, 200, 137);
  updateTable();
}
void notificationmousePressed () {
  tablenoti.mousePressed();
}
void notificationDraw() {
  tablenoti.draw();
  fill(#020F1D);
  rect(340, 719, 950, 48);
}
void notificationmousewheel(MouseEvent e) {
  tablenoti.mouseWheel(e);
}
void updateTable() {
  tablenot=loadTable(notpath, "header");
  tablenoti.rows = new Rows [0];
  String factorylist  [] = tablenot.getStringColumn ("factorylist");
  String cementtype  [] = tablenot.getStringColumn ("cementtype");
  String preaprice [] = tablenot.getStringColumn ("preaprice");
  String price [] = tablenot.getStringColumn ("price");
  String date [] = tablenot.getStringColumn ("date");
  String state[]=tablenot.getStringColumn("state");
  for (int a =0; a < factorylist.length; a ++) {
    if (state[a].equals("Confirm")) {
      tablenoti.addRow (new String [] {factorylist [a], cementtype [a], date [a], preaprice [a]}, new Button (price [a], gree, midGreen, darkGreen));
    }
    if (state[a].equals("Confirmed")) {
      tablenoti.addRow (new String [] {factorylist [a], cementtype [a], date [a], preaprice [a]}, new Button (state[a],redd, midred, darkred));
    }
  }
}
