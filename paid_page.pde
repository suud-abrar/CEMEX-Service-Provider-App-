DropDownMenu FType;
String Typesoffactory [] = {"Dangote", "National", "Derba", "Muger"};
String ordersTheader [] = {"No.", "Type", "Amount(q)", "Price", "Date/Time"};
String tablepath;
Tablepayed tablep;
Table  tableprice;
void initpaid () {
  FType = new DropDownMenu ("Factory Type", Typesoffactory, 984, 60, 300, 60);
  tablep = new Tablepayed (ordersTheader, 200, 137);
  tablep.rows = new Rows [0];
  String typeoffactory=FType.value;
  FType.value=Typesoffactory [0];
  tablepath="C:/Users/Win 10 Pro/Documents/Processing/paids/Dangote.csv";
  tableprice=loadTable(tablepath, "header");
  String types  [] = tableprice.getStringColumn ("types");
  String dates  [] = tableprice.getStringColumn ("time");
  String amounts [] = tableprice.getStringColumn ("amount");
  String price [] = tableprice.getStringColumn ("price");
  for (int a =0; a < types.length; a ++) {
    tablep.addRow (types [a], amounts [a], price [a], dates [a]);
  }
}
void paidDraw() {
  strokeWeight (1);
  stroke (255);
  line(342, 1113, 945+342, 1113);
  tablep.draw();       
  FType.draw ();
}
void paidmousePressed () {
  FType.mousePressed ();
  if (!(FType.value.isEmpty())) {
    tablep.rows = new Rows [0];
    String typeoffactory=FType.value;
    tablepath="C:/Users/Win 10 Pro/Documents/Processing/paids/"+typeoffactory+".csv";
    tableprice=loadTable(tablepath, "header");
    String types  [] = tableprice.getStringColumn ("types");
    String dates  [] = tableprice.getStringColumn ("time");
    String amounts [] = tableprice.getStringColumn ("amount");
    String price [] = tableprice.getStringColumn ("price");
    for (int a =0; a < types.length; a ++) {
      tablep.addRow (types [a], amounts [a], price [a], dates [a]);
    }
    tablep.draw();
  }
}

void paidmouseWheel (MouseEvent e) {
  tablep.mouseWheel(e);
}
