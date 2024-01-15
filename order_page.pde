DropDownMenu FactoryType;
String Typesoffactorys [] = {"DANGOTE", "NATIONAL", "DERBA", "MUGER"};
TableUI ordersT;
Table table;
String Theaders [] = {"No.", "Type", "Amount(q)", "Date/Time", "State"};
void initorder() {
  FactoryType = new DropDownMenu ("Factory Type", Typesoffactorys, 984, 60, 300, 60);
  ordersT = new TableUI (Theaders, 200, 137);
  ordersT.rows = new Rows [0];
  String tableorder="C:/Users/Win 10 Pro/Documents/Processing/orders/DANGOTE.csv";
  table=loadTable(tableorder, "header");
  String types  [] = table.getStringColumn ("type");
  String dates  [] = table.getStringColumn ("time");
  String amounts [] = table.getStringColumn ("amount");
  String states  [] = table.getStringColumn ("state");
  for (int a =0; a < types.length; a ++) {
    ordersT.addRow (types [a], amounts [a], dates [a], states [a]);
  }
}
void orderDraw() {
  strokeWeight (1);
  stroke (255);
  line(342, 1113, 945+342, 1113);
  ordersT.draw();      
  FactoryType.draw ();
}
void ordermousePressed () {
  FactoryType.mousePressed ();
  if ( !(FactoryType.value.isEmpty())) {
    ordersT.rows = new Rows [0];
    String tableorder="C:/Users/Win 10 Pro/Documents/Processing/orders/"+FactoryType.value+".csv";
    table=loadTable(tableorder, "header");
    String types  [] = table.getStringColumn ("type");
    String dates  [] = table.getStringColumn ("time");
    String amounts [] = table.getStringColumn ("amount");
    String states  [] = table.getStringColumn ("state");
    for (int a =0; a < types.length; a ++) {
      ordersT.addRow (types [a], amounts [a], dates [a], states [a]);
    }
  }
}
void ordermouseWheel (MouseEvent e) {
  ordersT.mouseWheel(e);
}
