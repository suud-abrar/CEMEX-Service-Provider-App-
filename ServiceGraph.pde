class serviceGraph {
  String FactoryName;
  float x, y, w = 243, h = 206, r = 30;
  float lineH = 110;
  float lineWeight = 6;
  float lineWidth = 20;
  float lineGapX = 22;
  float figure1Percentages [];

  serviceGraph(String FactoryName, float x, float y) {
    this.FactoryName = FactoryName;
    this.x = x;
    this.y = y;

    figure1Percentages = new float [7];
  }
  //void setFigure (float figure1Percentages []) {
  //  this.figure1Percentages = figure1Percentages;
  //}
  void draw() {
    // Card
    fill(#012348);
    noStroke();
    rect(x, y, w, h, r);
    // text
    fill(#16DBCC);
    textSize(24);
    text(FactoryName, x+15, y+35);
    
    for (int z=0; z < 7; z++) {
    // Back line
    noStroke ();
    fill (grayLight);
    rect (x + 38 + lineGapX*z + lineWeight*z, y + 58, lineWeight, lineH, lineWeight/2);

    // Figure Line
      float figure1H = lineH * figure1Percentages[z];
      float figure2H = lineH - figure1H;
      noStroke();
      fill(pink);
      rect (x + 36 + lineGapX*z + lineWeight*z, y + 58 + lineH - figure1H, lineWidth, figure1H, lineWeight/2);
      fill (blueBright);
      rect (x + 36 + lineGapX*z + lineWeight*z, y + 58 + lineH - figure2H - figure1H, lineWidth, lineH - figure1H, lineWeight/2);
    }
  }
}
