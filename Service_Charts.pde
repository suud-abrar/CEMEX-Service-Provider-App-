serviceChart chart;
//Orders order;
serviceGraph graph, graph2, graph3;
float rectWidth= 261, rectHeight= 768;
String pathreg="C:/Users/Win 10 Pro/Documents/Processing/reg.csv";
String pathsupplier="C:/Users/Win 10 Pro/Documents/Processing/factory.csv";
//
String Dangote="C:/Users/Win 10 Pro/Documents/Processing/paids/Dangote.csv";
String Muger="C:/Users/Win 10 Pro/Documents/Processing/paids/Muger.csv";
String National="C:/Users/Win 10 Pro/Documents/Processing/paids/National.csv";
String Derba="C:/Users/Win 10 Pro/Documents/Processing/paids/Derba.csv";
//
String proppc="C:/Users/Win 10 Pro/Documents/Processing/amount ppc.csv";
String proopc="C:/Users/Win 10 Pro/Documents/Processing/amount opc.csv";
void initDashboard () {
  Table tablereg=loadTable(pathreg, "header");
  Table tablesupplier=loadTable(pathsupplier, "header");
  Table tableDangote=loadTable(Dangote, "header");
  Table tableMuger=loadTable(Muger, "header");
  Table tableNational=loadTable(National, "header");
  Table tableDerba=loadTable(Derba, "header");
  Table tableproppc=loadTable(proppc, "header");
  Table tableproopc=loadTable(proopc, "header");
  float usercount=tablereg.getRowCount();
  float suppliercount=tablesupplier.getRowCount();
  float factorycount=tablesupplier.getColumnCount(); 
  float totalcount=usercount+suppliercount+factorycount;
  //order
 
  //paids
  float danpaid=tableDangote.getColumnCount();
  float mupaid=tableMuger.getColumnCount();
  float natpaid=tableNational.getColumnCount();
  float derpaid=tableDerba.getColumnCount();
  float totalpaid=danpaid+ mupaid+natpaid+derpaid;
  //produced
  float Totalproducedppc=0;
 float Totalproducedopc=0;
 float Totalsold=0;
  for(int i=0;i<tableproppc.getRowCount();i++){
  String amount=tableproppc.getString(i,"Produced-PPC");
 Totalproducedppc+=int(amount);
  }
   for(int i=0;i<tableproopc.getRowCount();i++){
  String amount=tableproopc.getString(i,"Produced-OPC");
 Totalproducedopc+=int(amount);
  }
  float Totalproduced=Totalproducedppc+Totalproducedopc;
  //sold
  for(int i=0;i<tableDangote.getRowCount();i++){
    String soldamount=tableDangote.getString(i,"amount");
    Totalsold+=int(soldamount);
  }
 float nonsold=Totalproduced-Totalsold;
  print(Totalproduced);
  chart = new serviceChart("SERVICE USERS", rectWidth+41, 150);
  chart.setFigures (new float [] {usercount/totalcount, suppliercount/totalcount, factorycount /totalcount});
  chart.setFigures2 (new float [] {nonsold/Totalproduced, Totalsold/Totalproduced});
  graph = new serviceGraph("DANGOTE CEMENT", rectWidth+291, 150);
  graph.figure1Percentages = new float [] {0.1, 0.2, 0.5, 0.4, 0.2, 0.4, 0.1};
  graph2 = new serviceGraph("NATIONAL CEMENT", rectWidth+559, 150);
  graph2.figure1Percentages = new float [] {0.85, 0.25, 0.56, 0.45, 0.75, 0.95, 0.90 };
  graph3 = new serviceGraph("DERBA CEMENT", rectWidth+827, 150);
  graph3.figure1Percentages = new float [] {0.35, 0.25, 0.56, 0.45, 0.64, 0.95, 0.90 };
  //  order = new Orders("/data/orders.csv","/data/payed.csv","/data/reg.csv");
}
void dashboardDraw() {
  chart.draw();
  graph.draw();
  graph2.draw();
  graph3.draw();
}
