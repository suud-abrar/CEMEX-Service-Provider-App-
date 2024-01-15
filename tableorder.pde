class TableUI {
  String headers[];
  Rows header;
  Rows rows [];

  float x, y;
  float startY;
  float scrollHeight = 525;
  float scrollBrickHeight = 63;
  float scrollBrickY;
  TableUI (String headers [], float x, float y) {
    this.x = x;
    this.y = y;
    
    this.headers = headers;

    header = new Rows (headers);
    rows = new Rows [0];

    startY = y + header.h;
    scrollBrickY = y + header.h;
  }

  void addRow (Rows row) {
    rows = (Rows []) append (rows, row);
  }

  void addRow (String l1, String l2, String l3, String l4) {
    Rows row = new Rows (str (rows.length + 1), l1, l2, l3, l4);
    rows = (Rows []) append (rows, row);
  }

  void draw () {
    scrollBrickHeight = scrollHeight * min (6.0/rows.length, 1);
    // Curtains
    rectMode (CORNER);
    
    // Scroll bar
    noStroke ();
    fill (lightGray);
    rect (1310, y + header.h, 15, scrollHeight, 7.5);

    fill (purple);
    rect (1310, scrollBrickY, 15, scrollBrickHeight, 7.5);

    for (int r = 0; r < rows.length; r ++) {
      rows [r].draw (startY + header.h*r);
    }
    // Header curtain
    noStroke ();
    fill(#020F1D);
    rectMode (CORNER);
    rect(340, 0, 948, y+header.h);
    header.draw (y);

    // Rows Curtain
    fill(#020F1D);
    noStroke();
    rect(330,718,970,100);
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
  void keyPressed () {
    if (keyCode == ENTER) {
      startY = y + header.h;
    }
  }
}
