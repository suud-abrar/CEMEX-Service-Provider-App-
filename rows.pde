class Rows {
  String labels [];
  float Xs [] = {345, 400, 570, 750, 900, 1119}, y=117;
  float Ws [] = {96, 208, 180, 200, 298, 168}, h=58;
  Button button;
  int type =1;
  String buttonLabelOriginal;
  Rows (String labels []) {
    this.labels = labels;

    type = 1;
  }

  Rows (String label1, String label2, String label3, String label4, String label5, String label6) {
    labels = new String [] {label1, label2, label3, label4, label5, label6};
    type=2;
  }
  Rows (String label1, String label2, String label3, String label4, String label5) {
    labels = new String [] {label1, label2, label3, label4, label5};
    type=1;
  }
  Rows (String label1, String label2, String label3, String label4) {
    labels = new String [] {label1, label2, label3,label4};
    type=3;
  }
  Rows (String labels [], Button buttonnot) {
    this.button=buttonnot;
    this.labels=labels;
    buttonLabelOriginal = buttonnot.label;
    type = 2;
  }

  public void draw (float y) {
    if (type == 1) {
      for (int i=0; i < labels.length; i++) {
        fill (255);
        textAlign (CENTER, CENTER);
        text(labels [i], Xs [i] + Ws [i]/2, y + h/2);

        strokeWeight (1);
        stroke (255);
        line (Xs [0], y, Xs [5] + Ws[5], y);
        line (Xs [0], y + h, Xs [5] + Ws[5], y + h);
      }
    }else if(type==3){
    for (int i=0; i < labels.length; i++) {
        fill (255);
        textAlign (CENTER, CENTER);
        text(labels [i], Xs [i] + Ws [i]/2, y + h/2);

        strokeWeight (1);
        stroke (255);
        line (Xs [0], y, Xs [5] + Ws[5], y);
        line (Xs [0], y + h, Xs [5] + Ws[5], y + h);
      }
    }
    else {
      for (int i=0; i < labels.length; i++) {
        fill (255);
        textAlign (CENTER, CENTER);
        text(labels [i], Xs [i] + Ws [i]/2, y + h/2);

        strokeWeight (1);
        stroke (255);
        line (Xs [0], y, Xs [5] + Ws[5], y);
        line (Xs [0], y + h, Xs [5] + Ws[5], y + h);
      }

      if (button != null) {
        button.draw (Xs [5] + Ws[5]/2 - button.w/2, y + h/2 - button.h/2);
      }
    }
  }

  boolean buttonnotHovered () {
    if (button == null)
      return false;
    return button.hovered ();
  }
}
