class Card {
  String label1;
  String label2;
  String label3;
  String label4;
  String label5;
  String label6;
  float x;
  float y;
  Card (String label1, String label2, String label3, String label4, String label5, String label6, float x, float y) {
    this.label1 = label1;
    this.label2 = label2;
    this.label3 = label3;
    this.label4 = label4;
    this.label5 = label5;
    this.label6 = label6;
    this.x = x;
    this.y = y;
  }
  void draw () {
    rectMode (CORNER);
    noStroke();
    fill(#0A223E);
    rect(x, y, 181, 248, 5);
    fill(#010E51);
    rect(x, y, 180.83, 36.14, 5, 5, 0, 0);
    fill(#FFFFFF);
    textAlign(LEFT, TOP);
    fill(#FD7703);
    text("Purchased Cement", x+5, y+36);
    fill(255);
    text("PPC:", x+16, y+56);
    text("OPC:", x+12, y+76);
    text("Total:", x+3, y+95);
    fill(#FD7703);
    text("Price", x+80, y+126);
    fill(255);
    text("PPC:", x+16, y+147);
    text("OPC:", x+12, y+165);
    fill(#FD7703);
    text("Total Payment", x+20, y+190);
    fill(255);
    text(label1+"(q)", x+62, y+56 );
    text(label2+"(q)", x+62, y+76 );
    int total=int(label1)+int(label2);
    text(str(total)+"(q)", x+62, y+96 );
    text(label3+" ETB", x+65, y+147 );
    text(label4+" ETB", x+65, y+165);
    text(label5+" ETB", x+41, y+210);
    text(label6, x+40, y+7);
  }
}
