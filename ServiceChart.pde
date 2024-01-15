class serviceChart {
  float x, y;
  float w = 221, h = 206, r = 25, R = 70, R2 = 75;
  float UsageChartGapX = 50;
  String Text;
  float figures [];
  float figures2 [];
  serviceChart(String Text, float x, float y) {
    this.x = x;
    this.y = y;
    this.Text = Text;
    figures = new float [3];
    figures2 = new float [2];
  }
  void setFigures (float figures []) {
    this.figures = figures;
  }
  void setFigures2 (float figures2 []) {
    this.figures2 = figures2;
  }

  String DANGOTEF="C:/Users/Win 10 Pro/Documents/Processing/orders/DANGOTE.csv";
  String MUGERF="C:/Users/Win 10 Pro/Documents/Processing/orders/MUGER.csv";
  String NATIONALF="C:/Users/Win 10 Pro/Documents/Processing/orders/NATIONAL.csv";
  String DERBAF="C:/Users/Win 10 Pro/Documents/Processing/orders/DERBA.csv";
  String Dangote="C:/Users/Win 10 Pro/Documents/Processing/paids/Dangote.csv";
  String Muger="C:/Users/Win 10 Pro/Documents/Processing/paids/Muger.csv";
  String National="C:/Users/Win 10 Pro/Documents/Processing/paids/National.csv";
  String Derba="C:/Users/Win 10 Pro/Documents/Processing/paids/Derba.csv";
  Table tableDANGOTEF;
  Table tableMUGERF;
  Table tableNATIONALF;
  Table tableDERBAF;
  Table tableDangote;
  Table tableMuger;
  Table tableNational;
  Table tableDerba;

  void draw() {
    usageChart();
    costCompare1(378);
    costCompare2(571);
    // Card
    fill(lowDarkBlue);
    rect(x, y, w, h, r);
    // text Head
    textHead(Text, x+12, y+10, w-29, 24);

    //Circle
    noFill ();
    strokeWeight (28);
    float rads [] = {figures [0]*TWO_PI, figures [1]*TWO_PI, figures [2]*TWO_PI};
    float rads2 [] = {figures2 [0]*TWO_PI, figures2 [1]*TWO_PI};
    float arcX = x+ w/2, arcY = y+h/2;
    //printArray (rads);
    stroke (red);
    strokeCap (SQUARE);
    arc(arcX, arcY, R, R, 0, rads [0], OPEN);
    stroke (Orange);
    arc(arcX, arcY, R, R, rads [0], rads [0] + rads [1], OPEN);
    stroke (purple);
    arc(arcX, arcY, R, R, rads [0] + rads [1], rads [0] + rads [1] + rads [2], OPEN);
    // Usage Chart 1
    stroke (green);
    arc(arcX, y+h+313-20, R2, R2, 0, rads2 [0], OPEN);
    stroke(blue);
    arc(arcX, y+h+313-20, R2, R2, rads2 [0], rads2 [0] + rads2 [1], OPEN);

    // Usage chart 2
    stroke (green);
    arc(arcX + UsageChartGapX/2 + R2*2, y+h+313-20, R2, R2, 0, rads2 [0], OPEN);
    stroke(blue);
    arc(arcX + UsageChartGapX/2 + R2*2, y+h+313-20, R2, R2, rads2 [0], rads2 [0] + rads2 [1], OPEN);

    noStroke ();
    fill(green);
    rect(x + 30, y+h+350, 20, 15);
    fill(blue);
    rect(x + 218, y+h+350, 20, 15);
    fill(skyBlue);
    textSize(12);
    int value1 = int (figures2[0]* 100);
    int value2 = int (figures2[1]* 100);
    textAlign(CENTER);
    text(str(value1) + " %", arcX, y+h+313-20);
    text(str(value2) + " %", arcX + UsageChartGapX/2 + R2*2, y+h+313-20);

    fill(255);
    textAlign(LEFT, CENTER);
    text(" PRODUCED", x + 60, y + h + 376-20);
    text(" SOLD", x + 248, y + h + 376-20);

    // Key
    noStroke();
    textAlign(LEFT, CENTER);
    fill(purple);
    rect(x+40, y+155, 15, 12);
    fill(255);
    textSize(12);
    text("Factories", x+59, y+160);
    text(str(figures[2]*100)+" %", x+59+70, y+160);
    fill(Orange);
    rect(x+40, y+172, 15, 12);
    fill(255);
    textSize(12);
    text("Suppliers", x+59, y+178);
    text(str(figures[1]*100)+" %", x+59+70, y+178);
    fill(red);
    rect(x+40, y+187, 15, 12);
    fill(255);
    textSize(12);
    text("Users", x+59, y+192);
    text(str(figures[0]*100)+" %", x+59+70, y+192);
  }
  void usageChart() {
    int Totalorder;
    int Totaldan=0;
    int Totalmug=0;
    int Totalnat=0;
    int Totalder=0;
    int Totalpaid;
    int Totaldanpaid=0;
    int Totalmugpaid=0;
    int Totalnatpaid=0;
    int Totalderpaid=0;
    tableDANGOTEF=loadTable(DANGOTEF, "header");
    tableMUGERF=loadTable(MUGERF, "header");
    tableNATIONALF=loadTable(NATIONALF, "header");
    tableDERBAF=loadTable(DERBAF, "header");
    tableDangote=loadTable(Dangote, "header");
    tableMuger=loadTable(Muger, "header");
    tableNational=loadTable(National, "header");
    tableDerba=loadTable(Derba, "header");
    //order
    for (int i=0; i<tableDANGOTEF.getRowCount(); i++) {
      String amount=tableDANGOTEF.getString(i, "amount");
      Totaldan+=int(amount);
    }
    for (int i=0; i<tableMUGERF.getRowCount(); i++) {
      String amount=tableMUGERF.getString(i, "amount");
      Totalmug+=int(amount);
    }
    for (int i=0; i<tableNATIONALF.getRowCount(); i++) {
      String amount=tableNATIONALF.getString(i, "amount");
      Totalnat+=int(amount);
    }
    for ( int i=0; i<tableDERBAF.getRowCount(); i++) {
      String amount=tableDERBAF.getString(i, "amount");
      Totalder+=int(amount);
    }

    Totalorder=Totaldan+Totalmug+Totalnat+Totalder;
    //paid
    for (int i=0; i<tableDangote.getRowCount(); i++) {
      String amount=tableDangote.getString(i, "price");
      Totaldanpaid+=int(amount);
    }
    for (int i=0; i<tableMuger.getRowCount(); i++) {
      String amount=tableMuger.getString(i, "price");
      Totalmugpaid+=int(amount);
    }
    for (int i=0; i<tableNational.getRowCount(); i++) {
      String amount=tableNational.getString(i, "price");
      Totalnatpaid+=int(amount);
    }
    for ( int i=0; i<tableDerba.getRowCount(); i++) {
      String amount=tableDerba.getString(i, "price");
      Totalderpaid+=int(amount);
    } 
    Totalpaid=Totaldanpaid+Totalmugpaid+Totalnatpaid+Totalderpaid;
    // Title
    noStroke();
    fill(lowDarkBlue);
    rect(x, y+h+25, 379, 67, 5);
    fill(skyBlue);
    text("TOTAL USAGE", x + 103, y+h+57);
    // Chart
    fill(lowDarkBlue);
    rect(x, y+h+57+50, 379-20, 266, 30);
    textHead("ORDERED", x+43, y+h+57+67, 113, 15);
    noStroke();
    fill(lowBlue);
    rect(x+36, y+h+57+67+15+46-20, 127, 67, 5);
    textHead(str(Totalorder), x+43, y+h+194-20, 113, 15);
    fill(255);
    textAlign(LEFT, CENTER);
    text("QUINTALS", x+60, y+h+234-20);

    textHead("PAID", x+90+130, y+h+57+67, 120, 15);
    fill(lowBlue);
    noStroke();
    rect(x+90+127, y+h+57+67+15+46-20, 127, 67, 5);
    textHead(str(Totalpaid), x+220, y+h+194-20, 120, 15);
    fill(255);
    textAlign(LEFT, CENTER);
    text(" ETB ", x+240, y+h+234-20);
  }

  void costCompare1(float Height) {
    //    
    noStroke();
    fill(lowDarkBlue);
    rect(rectWidth+447, Height, 221, 160, 25);
    fill(skyBlue);
    textSize(22);
    text("MOST EXPENSIVE", rectWidth+467, Height+14);
    textHead("DANGOTE", rectWidth+467, Height+35, 180, 15);
    noStroke();
    fill(lowBlue);
    rect(rectWidth+467, Height + 72, 83, 75, 5);
    rect(rectWidth+467+92, Height + 72, 83, 75, 5);

    fill(255);
    textSize(12);
    text("PPC", rectWidth+481, Height+84);
    text("1800", rectWidth+481, Height+104);
    text("ETB per(q)", rectWidth+481, Height+124);

    text("OPC", rectWidth+467+100, Height+84);
    text("780", rectWidth+467+100, Height+104);
    text("ETB per(q)", rectWidth+467+100, Height+124);
    // Producing
    fill(lowDarkBlue);
    rect(rectWidth+447+233, Height, 395, 160, 30);    
    fill(skyBlue);
    textSize(24);
    text("TOP 3 PRODUCING", rectWidth+447+233+20, Height+14);

    fill(255);
    textSize(18);
    text ("PPC(q)", rectWidth+447+369, Height+50);
    text ("3200", rectWidth+447+369, Height+77);
    text ("4000", rectWidth+447+369, Height+100);
    text ("3500", rectWidth+447+369, Height+120);

    text ("OPC(q)", rectWidth+447+462, Height+50);
    text ("2000", rectWidth+447+462, Height+77);
    text ("1000", rectWidth+447+462, Height+100);
    text ("550", rectWidth+447+462, Height+120);

    text ("Total(q)", rectWidth+447+545, Height+50);
    text ("5200", rectWidth+447+545, Height+77);
    text ("5000", rectWidth+447+545, Height+100);
    text ("4050", rectWidth+447+545, Height+120);

    text("1. "+"DANGOTE", rectWidth+447+225+20, Height+77);
    text("2. "+"NATIONAL", rectWidth+447+225+20, Height+100);
    text("3. "+"ETHIO", rectWidth+447+225+20, Height+120);
  }

  void costCompare2(float Height) {
    //    
    noStroke();
    fill(lowDarkBlue);
    rect(rectWidth+447, Height, 221, 160, 25);
    fill(skyBlue);
    textSize(22);
    text("LESS EXPENSIVE", rectWidth+467, Height+14);
    textHead("DERBA", rectWidth+467, Height+35, 180, 15);
    noStroke();
    fill(lowBlue);
    rect(rectWidth+467, Height + 72, 83, 75, 5);
    rect(rectWidth+467+92, Height + 72, 83, 75, 5);

    fill(255);
    textSize(12);
    text("PPC", rectWidth+481, Height+84);
    text("1650", rectWidth+481, Height+104);
    text("ETB per(q)", rectWidth+481, Height+124);

    text("OPC", rectWidth+467+100, Height+84);
    text("700", rectWidth+467+100, Height+104);
    text("ETB per(q", rectWidth+467+100, Height+124);
    // Producing
    fill(lowDarkBlue);
    rect(rectWidth+447+233, Height, 395, 160, 30);    
    fill(skyBlue);
    textSize(24);
    text("TOP 3 SELLING", rectWidth+447+233+20, Height+14);

    fill(255);
    textSize(18);
    text ("PPC(q)", rectWidth+447+369, Height+50);
    text ("4300", rectWidth+447+369, Height+77);
    text ("2000", rectWidth+447+369, Height+100);
    text ("1800", rectWidth+447+369, Height+120);

    text ("OPC(q)", rectWidth+447+462, Height+50);
    text ("500", rectWidth+447+462, Height+77);
    text ("480", rectWidth+447+462, Height+100);
    text ("300", rectWidth+447+462, Height+120);

    text ("Total(q)", rectWidth+447+545, Height+50);
    text ("4800", rectWidth+447+545, Height+77);
    text ("248", rectWidth+447+545, Height+100);
    text ("2100", rectWidth+447+545, Height+120);

    text("1. "+"DANGOTE", rectWidth+447+225+20, Height+77);
    text("2. "+"ETHIO", rectWidth+447+225+20, Height+100);
    text("3. "+"NATIONAL", rectWidth+447+225+20, Height+120);
  }

  void textHead(String textHead, float borderx, float bordery, float Width, float fontSize) {
    strokeWeight(2);
    fill( midSkyBlue);
    stroke(skyBlue);
    rect(borderx, bordery, Width, 26, 5);
    fill(dark);
    textSize(fontSize);
    textAlign(LEFT, CENTER);
    text(textHead, borderx+15, bordery+10);
  }
}
