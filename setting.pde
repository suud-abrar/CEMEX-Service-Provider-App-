 Card DANGOTE, DERBA, MUGER, NATIONAL;
Tablereg registrationtable;
DropDownMenu registration;
TextField Name, id, password, conpass;
Button register, undo;
boolean check;
int checkpass=0;
int state=0;
int checkname=0;
int succes=0;
String regheader[]={"No.", "Factory Name", "ID", "Date"};
String pricepath="C:/Users/Win 10 Pro/Documents/Processing/factorydata.csv";
//String DANGOTEF="C:/Users/Win 10 Pro/Documents/Processing/orders/DANGOTE.csv";
//String MUGERF="C:/Users/Win 10 Pro/Documents/Processing/orders/MUGER.csv";
//String NATIONALF="C:/Users/Win 10 Pro/Documents/Processing/orders/NATIONAL.csv";
//String DERBAF="C:/Users/Win 10 Pro/Documents/Processing/orders/DERBA.csv";
String Dangotep="C:/Users/Win 10 Pro/Documents/Processing/paids/Dangote.csv";
String Mugerp="C:/Users/Win 10 Pro/Documents/Processing/paids/Muger.csv";
String Nationalp="C:/Users/Win 10 Pro/Documents/Processing/paids/National.csv";
String Derbap="C:/Users/Win 10 Pro/Documents/Processing/paids/Derba.csv";
String regpath="C:/Users/Win 10 Pro/Documents/Processing/factory reg.csv";
String [] choose={"List Of Registered Company", "New Company"};
void initsetting() {
  registration = new DropDownMenu ("Registration", choose, 984, 60, 300, 60);
  registrationtable=new Tablereg(regheader, 200, 180, new Button("Back", 34, 34, 23));  
  Table tableofprice=loadTable(pricepath, "header");
  //Table tableDANGOTEF=loadTable(DANGOTEF, "header");
  //Table tableMUGERF=loadTable(MUGERF, "header");
  //Table tableNATIONALF=loadTable(NATIONALF, "header");
  //Table tableDERBAF=loadTable(DERBAF, "header");
  Table tableDangotep=loadTable(Dangotep, "header");
  Table tableMugerp=loadTable(Mugerp, "header");
  Table tableNationalp=loadTable(Nationalp, "header");
  Table tableDerbap=loadTable(Derbap, "header");
  //price
  String  pricedangoteppc=tableofprice.getString(0, "DANGOTE");
  String  pricemugerppc=tableofprice.getString(0, "MUGER");
  String  pricenationalppc=tableofprice.getString(0, "NATIONAL");
  String  pricederbappc=tableofprice.getString(0, "DERBA");
  String  pricedangoteopc=tableofprice.getString(1, "DANGOTE");
  String  pricemugeropc=tableofprice.getString(1, "MUGER");
  String  pricenationalopc=tableofprice.getString(1, "NATIONAL");
  String  pricederbaopc=tableofprice.getString(1, "DERBA");
  //purchased cement 
  int totalamountppcdangote=0;
  int totalamountopcdangote=0;
  int totalpricedangote=0;
  int totalamountppcmuger=0;
  int totalamountopcmuger=0;
  int totalpricemuger=0;
  int totalamountppcnational=0;
  int totalamountopcnational=0;
  int totalpricenational=0;
  int totalamountppcderba=0;
  int totalamountopcderba=0;
  int totalpricederba=0;
  for (int i=0; i<tableDangotep.getRowCount(); i++) {
    String type=tableDangotep.getString(i, "types");
    if (type.equals("ppc")) {
      String amount=tableDangotep.getString(i, "amount");
      totalamountppcdangote+=int(amount);
    } 
    if (type.equals("opc")) {
      String amount=tableDangotep.getString(i, "amount");
      totalamountopcdangote+=int(amount);
    }
    String price=tableDangotep.getString(i, "price");
    totalpricedangote+=int(price);
  }
  for (int i=0; i<tableMugerp.getRowCount(); i++) {
    String type=tableMugerp.getString(i, "types");
    if (type.equals("ppc")) {
      String amount=tableMugerp.getString(i, "amount");
      totalamountppcmuger+=int(amount);
    } 
    if (type.equals("opc")) {
      String amount=tableMugerp.getString(i, "amount");
      totalamountopcmuger+=int(amount);
    }
    String price=tableMugerp.getString(i, "price");
    totalpricemuger+=int(price);
  }
  for (int i=0; i<tableNationalp.getRowCount(); i++) {
    String type=tableDangotep.getString(i, "types");
    if (type.equals("ppc")) {
      String amount=tableNationalp.getString(i, "amount");
      totalamountppcnational+=int(amount);
    } 
    if (type.equals("opc")) {
      String amount=tableNationalp.getString(i, "amount");
      totalamountopcnational+=int(amount);
    }
    String price=tableNationalp.getString(i, "price");
    totalpricenational+=int(price);
  }
  for (int i=0; i<tableDerbap.getRowCount(); i++) {
    String type=tableDerbap.getString(i, "types");
    if (type.equals("ppc")) {
      String amount=tableDerbap.getString(i, "amount");
      totalamountppcderba+=int(amount);
    } 
    if (type.equals("opc")) {
      String amount=tableDerbap.getString(i, "amount");
      totalamountopcderba+=int(amount);
    }
    String price=tableDerbap.getString(i, "price");
    totalpricederba+=int(price);
  }
  DANGOTE=new Card(str(totalamountppcdangote), str(totalamountopcdangote), pricedangoteppc, pricedangoteopc, str(totalpricedangote), "DANGOTE", 364, 146);
  MUGER=new Card(str( totalamountppcmuger), str( totalamountopcmuger), pricemugerppc, pricemugeropc, str(totalpricemuger), "MUGER", 602, 146);
  NATIONAL=new Card(str(totalamountppcnational), str(totalamountopcnational), pricenationalppc, pricenationalopc, str(totalpricenational), "NATIONAL", 844, 146);
  DERBA=new Card(str(totalamountppcderba), str(totalamountopcderba), pricederbappc, pricederbaopc, str(totalpricederba), "DERBA", 1082, 146);
  Name=new TextField("Company's name", 990, 158);
  Name.allowedInputChars =Name.LETTERS + " ";
  id=new TextField("ID", 990, 228);
  id.allowedInputChars=id.LETTERS+" "+id.NUMBERS;
  password=new TextField("Password", 990, 298);
  password.allowedInputChars=id.LETTERS+" "+id.NUMBERS;
  conpass=new TextField("Password", 990, 368);
  conpass.allowedInputChars=id.LETTERS+" "+id.NUMBERS;
  register= new Button ("Save", 1015, 430, darkGreen, midGreen, green);
  undo= new Button ("Back", 1140, 430, darkGreen, midGreen, green);
}
void settingDraw() {
  DANGOTE.draw();
  MUGER.draw();
  NATIONAL.draw();
  DERBA.draw();
  registration.draw();
  if (registration.value.equals(choose[0])&&check==false) {
    fill(#020F1D);
    noStroke();
    rect(267, 139, 1300, 700);
    registrationtable.draw();
  } else if (registration.value.equals(choose[1])) {
    fill(255/2);
    noStroke();
    rect(984, 122, 300, 350);
    fill(0);
    text("Enter company's name:", 990, 157);
    text("Enter company's ID:", 990, 227);
    text("Enter company's password:", 990, 297);
    text("Confirm the password:", 990, 367);
    Name.draw();
    id.draw();
    password.draw();
    conpass.draw();
    register.draw();
    undo.draw();
    if (checkname==1) {
      fill(255, 0, 0);
      text("This company already registered", 1130, 420);
    } else if (state==1) {  
      fill(255, 0, 0);
      text("Fill the empity space", 1130, 420);
    } else if (checkpass==1) {  
      fill(255, 0, 0);
      text("Missmuched password", 1130, 420);
    } else if (succes==1) {  
      fill(255, 0, 0);
      text("Succesfully registered", 1130, 420);
    }
  }
}
void settingmousePressed () {
  registration.mousePressed ();
  if ( !(registration.value.isEmpty())) {
    registrationtable.rows = new Rows [0];
    String pathreg="C:/Users/Win 10 Pro/Documents/Processing/factory reg.csv";
    Table tablereg=loadTable(pathreg, "header");
    String Factoryname  [] = tablereg.getStringColumn ("factory name");
    String ID  [] = tablereg.getStringColumn ("ID");
    String date [] = tablereg.getStringColumn ("time");
    for (int a =0; a < Factoryname.length; a ++) {
      registrationtable.addRow (Factoryname [a], ID [a], date [a]);
    }
  }
  Name.mousePressed();
  id.mousePressed();
  password.mousePressed();
  conpass.mousePressed();
  register.mousePressed();
  Table tablereg=loadTable(regpath, "header");
  if (register.hovered()) {
    int index=tablereg.findRowIndex(Name.value, "factory name");
    if (index==-1) {
      checkname=0;
      if (Name.value!=""&&id.value!=""&&password.value!="") {
        state=0;
        if (password.value.equals(conpass.value)) {
          checkpass=0;
          tablereg.setString(tablereg.getRowCount(), "factory name", Name.value);
          tablereg.setString(tablereg.getRowCount()-1, "ID", id.value);
          tablereg.setString(tablereg.getRowCount()-1, "password", password.value);
          tablereg.setString(tablereg.getRowCount()-1, "time", day()+"/"+month()+"/"+year());
          saveTable(tablereg, regpath);
          succes=1;
          Name.value="";
          id.value="";
          password.value="";
          conpass.value="";
        } else {
          checkpass=1;
        }
      } else if (Name.value.isEmpty()||id.value.isEmpty()||password.value.isEmpty()) {
        state=1;
      }
    } else {
      checkname=1;
    }
  } 
  if (undo.hovered()) {
    registration.value="";
  }
  if (registration.value.equals(choose[0])) {
    check=false;
  }
  if (registrationtable.back.hovered()) {
    check=true;
    registration.value="";
  }
}
void settingkeyPressed () {
  Name.keyPressed();
  id.keyPressed();
  password.keyPressed();
  conpass.keyPressed();
}
void settingmouseWheel(MouseEvent e) {
    registrationtable.mouseWheel(e);
}
