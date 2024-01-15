class Tablenot {
  String headers[];
  Rows header;
  Rows rows [];

  float x, y;
  float startY;
  float scrollHeight =525;
  float scrollBrickHeight = 63;
  float scrollBrickY;
  Tablenot (String headers [], float x, float y) {
    this.x = x;
    this.y = y;

    this.headers = headers;

    header = new Rows (headers);
    rows = new Rows [0];

    startY = y + header.h;
    scrollBrickY = y + header.h;
  }
  void addRow (String l1, String l2, String l3, String l4, String  l5) {
    Rows row = new Rows (str (rows.length + 1), l1, l2, l3, l4, l5);
    rows = (Rows []) append (rows, row);
  }
  void addRow (String labels [], Button button) {
    String temp [] = new String [0];
    temp = append (temp, str (rows.length + 1));

    Rows row = new Rows (concat (temp, labels), button);
    rows = (Rows []) append (rows, row);
  }

  void draw () {
    String notification="C:/Users/Win 10 Pro/Documents/Processing/notification.csv";
    Table tablenotification=loadTable(notification, "header");
    int x=0;
    for (int r = rows.length-1; r >= 0; r--) {
      rows [r].labels [0] = "" + (x + 1);
      rows [r].draw (startY + header.h*x);
      if (rows [r].button.hovered ()) {
        String state=tablenotification.getString(r, "state");
        String price=tablenotification.getString(r, "price");

        if (state.equals("Confirm")) {
          rows [r].button.label = "Confirm";
        } else { 
          rows [r].button.label =price;
        }
      } else {
        rows [r].button.label = rows [r].buttonLabelOriginal;
      }

      x++;
    }

    fill(#020F1D);
    noStroke ();
    rect(342, 0, 948, y+header.h);
    fill(255);
    header.draw (y);
    noStroke ();
    fill (lightGray);
    rect (1310, y + header.h, 15, scrollHeight, 7.5);
    fill (purple);
    rect (1310, scrollBrickY, 15, scrollBrickHeight, 7.5);
  }
  String notification="C:/Users/Win 10 Pro/Documents/Processing/notification.csv";
  String setprice="C:/Users/Win 10 Pro/Documents/Processing/factorydata.csv";
  void mousePressed() {
    Table tablenotification=loadTable(notification, "header");
    Table tablesetprice=loadTable(setprice, "header");
    for (int r =rows.length-1; r>=0; r--) {
      if (tablenoti.rows [r].button.hovered ()) {
        tablenoti.rows [r].button.label = "Confirmed";
        tablenotification.setString(r, "state", "Confirmed");
        saveTable(tablenotification, notification);
        String factoryname=tablenotification.getString(r, "factorylist");
        String cementtype=tablenotification.getString(r, "cementtype");
        int index=0;
        if (cementtype.equals("ppc")) {
          index=0;
        } else if (cementtype.equals("opc")) {
          index=1;
        }
        String newprice=tablenotification.getString(r, "price");
        tablesetprice.setString(index, factoryname, newprice);
        saveTable(tablesetprice, setprice);
      }
    }
    updateTable();
  }
  void mouseWheel (MouseEvent e) {
    if (rows.length > 9) {
      float count = e.getCount ();
      startY -= count;
      float minStartY = (header.h*- (rows.length-9))+ y + header.h;
      float maxStartY = y + header.h;
      startY = constrain (startY, minStartY, maxStartY);

      float minBrickY = y + header.h;
      float maxBrickY = y + header.h + scrollHeight - scrollBrickHeight;
      scrollBrickY = map (startY, minStartY, maxStartY, maxBrickY, minBrickY);
    }
  }
}
