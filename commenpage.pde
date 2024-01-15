NavBar navBar;
int countbuble=0;
PImage image1;
PImage imagelog;
PImage imagslogan;
String image1path="data/image/bg.png";
String imagelogpath="data/image/log.png";
String imageslogangpath="data/image/slogan.png";
String notifications="C:/Users/Win 10 Pro/Documents/Processing/notification.csv";
void initCommonPage () {
  image1=loadImage(image1path);
  imagelog=loadImage(imagelogpath);
  imagslogan=loadImage(imageslogangpath);
  Table tablenotification=loadTable(notifications, "header");
  navBar = new NavBar ();
  navBar.addButton (new NavButton ("Dashboard", loadShape ("data/icons/dashboard.svg"), 18, 273));
  navBar.addButton (new NavButton ("Orders", loadShape ("data/icons/cart.svg"), 18, 341));
  navBar.addButton (new NavButton ("Paids", loadShape ("data/icons/paid.svg"), 18, 397));
  navBar.addButton (new NavButton ("Setting", loadShape ("data/icons/settings.svg"), 18, 453));
 for (int i=0; i<tablenotification.getRowCount(); i++) {
    String not=tablenotification.getString(i, "state");
    if (not.equals("Confirm")) {
      countbuble+=1;
    }
  }
  if (!(countbuble==0)) { 
    navBar.addButton (new NavButton ("Notification", loadShape ("data/icons/notification.svg"), 18, 512, countbuble));
    print("hi");
  } else {
    navBar.addButton (new NavButton ("Notification", loadShape ("data/icons/notification.svg"), 18, 512));
  }  // updateTable();
  navBar.activate (0);
}
void CommonPageDraw() {
  imageMode(CORNER);
  image(image1, 0, 0);
  image(imagelog, 55, 31);
  image( imagslogan, 50, 180);
  strokeWeight(1);
  stroke(#FFFFFF);
  line(15, 220, 15+227, 220);
  line(342, 137, 1006+278, 137);
  navBar.draw ();
}
